local RSGCore = exports['rsg-core']:GetCoreObject()
local sharedWeapons = exports['rsg-core']:GetWeapons()
lib.locale()
local createdEntries = {}
local isLoggedIn = false
local deathSecondsRemaining = 0
local deathTimerStarted = false
local deathactive = false
local mediclocation = nil
local medicsonduty = 0
local healthset = false
local closestRespawn = nil
local medicCalled = false
local Dead = false
local deadcam = nil
local angleY = 0.0
local angleZ = 0.0
local isBusy = false
local nearestMedicDistance = -1
local medicBroadcastActive = false

CreateThread(function()
    while true do
        Wait(2000)
        local data = RSGCore.Functions.GetPlayerData()
        local jobtype = data and data.job and data.job.type or nil
        local onduty = data and data.job and data.job.onduty or false

        if (jobtype == 'medic' or jobtype == 'wilddoctor' or jobtype == 'privatedoctor') and onduty then
            local ped = PlayerPedId()
            if ped ~= 0 then
                local pos = GetEntityCoords(ped)
                TriggerServerEvent('rsg-medic:server:updateMyMedicPos', {x=pos.x,y=pos.y,z=pos.z})
            end
            medicBroadcastActive = true
        else
            if medicBroadcastActive then
                medicBroadcastActive = false
                TriggerServerEvent('rsg-medic:server:updateMyMedicPos', nil)
            end
        end
    end
end)

CreateThread(function()
    while true do
        Wait(1000)
        if deathactive then
            local ped = PlayerPedId()
            local pos = GetEntityCoords(ped)
            TriggerServerEvent('rsg-medic:server:requestClosestMedic', {x=pos.x,y=pos.y,z=pos.z})
        else
            nearestMedicDistance = -1
        end
    end
end)

RegisterNetEvent('rsg-medic:client:updateClosestMedic', function(dist)
    nearestMedicDistance = dist or -1
end)





---------------------------------------------------------------------
-- death timer
---------------------------------------------------------------------
local deathTimer = function()
    deathSecondsRemaining = Config.DeathTimer
    CreateThread(function()
        while deathSecondsRemaining > 0 do
            Wait(1000)
            deathSecondsRemaining = deathSecondsRemaining - 1
            TriggerEvent("rsg-medic:client:GetMedicsOnDuty")
        end
    end)
end

---------------------------------------------------------------------
-- drawtext for countdown
---------------------------------------------------------------------
local DrawTxt = function(str, x, y, w, h, enableShadow, col1, col2, col3, a, centre)
    local string = CreateVarString(10, "LITERAL_STRING", str)

    SetTextScale(w, h)
    SetTextColor(math.floor(col1), math.floor(col2), math.floor(col3), math.floor(a))
    SetTextCentre(centre)

    if enableShadow then
        SetTextDropshadow(1, 0, 0, 0, 255)
    end

    DisplayText(string, x, y)
end

---------------------------------------------------------------------
-- start death cam
---------------------------------------------------------------------
local StartDeathCam = function()
    ClearFocus()

    local coords = GetEntityCoords(cache.ped)
    local fov = GetGameplayCamFov()

    deadcam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", coords, 0, 0, 0, fov)

    SetCamActive(deadcam, true)
    RenderScriptCams(true, true, 1000, true, false)
end

---------------------------------------------------------------------
-- end death cam
---------------------------------------------------------------------
local EndDeathCam = function()
    ClearFocus()

    RenderScriptCams(false, false, 0, true, false)
    DestroyCam(deadcam, false)
    DestroyAllCams(true)

    deadcam = nil
end

---------------------------------------------------------------------
-- update death cam position
---------------------------------------------------------------------
local ProcessNewPosition = function()
    local mouseX = 0.0
    local mouseY = 0.0

    if IsInputDisabled(0) then
        mouseX = GetDisabledControlNormal(1, 0x6BC904FC) * 8.0
        mouseY = GetDisabledControlNormal(1, 0x84574AE8) * 8.0
    else
        mouseX = GetDisabledControlNormal(1, 0x6BC904FC) * 0.5
        mouseY = GetDisabledControlNormal(1, 0x84574AE8) * 0.5
    end

    angleZ = angleZ - mouseX
    angleY = angleY + mouseY

    if angleY > 89.0 then
        angleY = 89.0
    elseif angleY < -89.0 then
        angleY = -89.0
    end

    local pCoords = GetEntityCoords(cache.ped)

    local behindCam =
    {
        x = pCoords.x + ((Cos(angleZ) * Cos(angleY)) + (Cos(angleY) * Cos(angleZ))) / 2 * (0.5 + 0.5),
        y = pCoords.y + ((Sin(angleZ) * Cos(angleY)) + (Cos(angleY) * Sin(angleZ))) / 2 * (0.5 + 0.5),
        z = pCoords.z + ((Sin(angleY))) * (0.5 + 0.5)
    }

    local rayHandle = StartShapeTestRay(pCoords.x, pCoords.y, pCoords.z + 0.5, behindCam.x, behindCam.y, behindCam.z, -1, cache.ped, 0)

    local _, hitBool, hitCoords, _, _ = GetShapeTestResult(rayHandle)

    local maxRadius = 3.5

    if (hitBool and Vdist(pCoords.x, pCoords.y, pCoords.z + 0.0, hitCoords) < 0.5 + 0.5) then
        maxRadius = Vdist(pCoords.x, pCoords.y, pCoords.z + 0.0, hitCoords)
    end

    local offset =
    {
        x = ((Cos(angleZ) * Cos(angleY)) + (Cos(angleY) * Cos(angleZ))) / 2 * maxRadius,
        y = ((Sin(angleZ) * Cos(angleY)) + (Cos(angleY) * Sin(angleZ))) / 2 * maxRadius,
        z = ((Sin(angleY))) * maxRadius
    }

    local pos =
    {
        x = pCoords.x + offset.x,
        y = pCoords.y + offset.y,
        z = pCoords.z + offset.z
    }

    return pos
end

---------------------------------------------------------------------
-- process camera controls
---------------------------------------------------------------------
local ProcessCamControls = function()

    local playerCoords = GetEntityCoords(cache.ped)

    -- disable 1st person as the 1st person camera can cause some glitches
    DisableOnFootFirstPersonViewThisUpdate()

    -- calculate new position
    local newPos = ProcessNewPosition()

    -- set coords of cam
    SetCamCoord(deadcam, newPos.x, newPos.y, newPos.z)

    -- set rotation
    PointCamAtCoord(deadcam, playerCoords.x, playerCoords.y, playerCoords.z)
end

---------------------------------------------------------------------
-- dealth log
---------------------------------------------------------------------
local deathLog = function()
    local player = PlayerId()
    local ped = PlayerPedId()
    local killer, killerWeapon = NetworkGetEntityKillerOfPlayer(player)

    if killer == ped or killer == -1 then return end

    local killerId = NetworkGetPlayerIndexFromPed(killer)
    local killerName = GetPlayerName(killerId) .. " ("..GetPlayerServerId(killerId)..")"
    local weaponLabel = 'Unknown'
    local weaponName = 'Unknown'
    local weaponItem = sharedWeapons[killerWeapon]
    if weaponItem then
        weaponLabel = weaponItem.label
        weaponName = weaponItem.name
    end

    local playerid = GetPlayerServerId(player)
    local playername = GetPlayerName(player)
    local msgDiscordA = playername..' ('..playerid..') '.. locale('cl_death_log_title')
    local msgDiscordB = killerName..' '.. locale('cl_death_log_message')..' '..playername.. ' '..locale('cl_death_log_message_b')..' **'..weaponLabel..'** ('..weaponName..')'
    TriggerServerEvent('rsg-log:server:CreateLog', 'death', msgDiscordA, 'red', msgDiscordB)

end

---------------------------------------------------------------------
-- medic call delay
---------------------------------------------------------------------
local MedicCalled = function()
    local delay = Config.MedicCallDelay * 1000
    CreateThread(function()
        while true do
            Wait(delay)
            medicCalled = false
            return
        end
    end)
end

---------------------------------------------------------------------
-- set closest respawn
---------------------------------------------------------------------
local function SetClosestRespawn()
    local pos = GetEntityCoords(cache.ped, true)
    local current = nil
    local dist = nil

    for k, _ in pairs(Config.RespawnLocations) do
        local dest = vector3(Config.RespawnLocations[k].coords.x, Config.RespawnLocations[k].coords.y, Config.RespawnLocations[k].coords.z)
        local dist2 = #(pos - dest)

        if current then
            if dist2 < dist then
                current = k
                dist = dist2
            end
        else
            dist = dist2
            current = k
        end
    end

    if current ~= closestRespawn then
        closestRespawn = current
    end
end

---------------------------------------------------------------------
-- prompts and blips
---------------------------------------------------------------------
CreateThread(function()
    for i = 1, #Config.MedicJobLocations do
        local loc = Config.MedicJobLocations[i]

        exports['rsg-core']:createPrompt(loc.prompt, loc.coords, RSGCore.Shared.Keybinds['E'], locale('cl_open') .. loc.name,
        {
            type = 'client',
            event = 'rsg-medic:client:mainmenu',
            args = {loc.prompt, loc.name}
        })

        createdEntries[#createdEntries + 1] = {type = "PROMPT", handle = loc.prompt}

        if loc.showblip then
            local MedicBlip = BlipAddForCoords(1664425300, loc.coords)
            SetBlipSprite(MedicBlip, GetHashKey(Config.Blip.blipSprite), true)
            SetBlipScale(MedicBlip, Config.Blip.blipScale)
            SetBlipName(MedicBlip, Config.Blip.blipName)

            createdEntries[#createdEntries + 1] = {type = "BLIP", handle = MedicBlip}
        end
    end
end)

-- ---------------------------------------------------------------------
-- -- player death loop
-- ---------------------------------------------------------------------
-- CreateThread(function()
--     repeat Wait(1000) until LocalPlayer.state['isLoggedIn']
--     while true do
--         local health = GetEntityHealth(cache.ped)
--         if health == 0 and deathactive == false and not LocalPlayer.state.invincible then
--             exports.spawnmanager:setAutoSpawn(false)
--             deathTimerStarted = true
--             deathTimer()
--             deathLog()
--             deathactive = true
--             TriggerServerEvent("RSGCore:Server:SetMetaData", "isdead", true)
--             TriggerEvent('rsg-medic:client:DeathCam')
--         end
--         Wait(1000)
--     end
-- end)

-- ---------------------------------------------------------------------
-- -- player death loop
-- ---------------------------------------------------------------------
-- CreateThread(function()
--     repeat Wait(1000) until LocalPlayer.state['isLoggedIn']

--     while true do
--         local health = GetEntityHealth(cache.ped)

--         if health == 0 and not deathactive and not LocalPlayer.state.invincible then
--             exports.spawnmanager:setAutoSpawn(false)
--             deathTimerStarted = true
--             deathTimer()
--             deathLog()
--             deathactive = true
--             TriggerServerEvent("RSGCore:Server:SetMetaData", "isdead", true)
--             TriggerEvent('rsg-medic:client:DeathCam')

--             -- 👇 Add short delay before next model changes or actions happen
--             Wait(1000) -- 1 second delay to stabilize state before anything else can run
--         end

--         Wait(1000)
--     end
-- end)


-- ---------------------------------------------------------------------
-- -- player update health loop
-- ---------------------------------------------------------------------
-- CreateThread(function()
--     repeat Wait(1000) until LocalPlayer.state['isLoggedIn']
--     while true do
--         if not LocalPlayer.state.invincible then 
--             local health = GetEntityHealth(cache.ped)
--             TriggerServerEvent('rsg-medic:server:SetHealth', health)
--         end
--         Wait(1000)
--     end
-- end)

---------------------------------------------------------------------
-- player death loop
---------------------------------------------------------------------
---------------------------------------------------------------------
-- player death loop FIXED SPAWNING DEAD
---------------------------------------------------------------------
-- CreateThread(function()
--     repeat Wait(1000) until LocalPlayer.state['isLoggedIn']
--     while true do
--         local playerDead = IsPlayerDead(PlayerId())
        
--         if playerDead and deathactive == false and not LocalPlayer.state.invincible then
--             exports.spawnmanager:setAutoSpawn(false)
--             deathTimerStarted = true
--             deathTimer()
--             deathLog()
--             deathactive = true
--             TriggerServerEvent("RSGCore:Server:SetMetaData", "isdead", true)
--             LocalPlayer.state:set('isDead', true, true)
--             Wait(50)
--             TriggerEvent('rsg-medic:client:DeathCam')
--         elseif not playerDead and deathactive == true then
--             -- Player is no longer dead but death is still active - reset
--             deathactive = false
--             TriggerServerEvent("RSGCore:Server:SetMetaData", "isdead", false)
--             LocalPlayer.state:set('isDead', false, true)
--         end
        
--         Wait(1000)
--     end
-- end)
CreateThread(function()
    repeat Wait(1000) until LocalPlayer.state['isLoggedIn']
    
    -- Check if player is already dead on login
    Wait(2000) -- Give extra time for everything to load
    
    local playerDead = IsPlayerDead(PlayerId())
    if playerDead and not deathactive then
        -- Player logged in dead - set up death state properly
        deathactive = true
        deathTimerStarted = true
        deathTimer() -- Start the timer they missed
        TriggerServerEvent("RSGCore:Server:SetMetaData", "isdead", true)
        LocalPlayer.state:set('isDead', true, true)
        TriggerEvent('rsg-medic:client:DeathCam')
    end
    
    while true do
        local playerDead = IsPlayerDead(PlayerId())
        
        if playerDead and deathactive == false and not LocalPlayer.state.invincible then
            exports.spawnmanager:setAutoSpawn(false)
            deathTimerStarted = true
            deathTimer()
            deathLog()
            deathactive = true
            TriggerServerEvent("RSGCore:Server:SetMetaData", "isdead", true)
            LocalPlayer.state:set('isDead', true, true)
            Wait(50)
            TriggerEvent('rsg-medic:client:DeathCam')
        elseif not playerDead and deathactive == true then
            deathactive = false
            deathTimerStarted = false
            TriggerServerEvent("RSGCore:Server:SetMetaData", "isdead", false)
            LocalPlayer.state:set('isDead', false, true)
        end
        
        Wait(1000)
    end
end)

---------------------------------------------------------------------
-- player update health loop
---------------------------------------------------------------------

---------------------------------------------------------------------
-- display respawn message and countdown
---------------------------------------------------------------------
CreateThread(function()
    while true do
        local t = 1000

        if deathactive then
            t = 4

            -- Show countdown until respawn unlocks
            if deathTimerStarted and deathSecondsRemaining > 0 then
                SetTextFontForCurrentCommand(1)
                DrawTxt(locale('cl_respawn') .. deathSecondsRemaining .. locale('cl_seconds'),
                    0.50, 0.80, 0.5, 0.5, true, 255, 255, 255, 255, true)
            end

            if nearestMedicDistance and nearestMedicDistance >= 0 then
                SetTextFontForCurrentCommand(1)
    local msg = "Nearest medic: " .. nearestMedicDistance .. "m"
    DrawTxt(msg, 0.50, 0.94, 0.45, 0.45, true, 255, 255, 255, 255, true)
end


            -- Once the timer hits 0, ALWAYS show respawn option
            if deathTimerStarted and deathSecondsRemaining == 0 then
                SetTextFontForCurrentCommand(1)
                DrawTxt(locale('cl_press_respawn'),
                    0.50, 0.85, 0.5, 0.5, true, 255, 255, 255, 255, true)

                if IsControlJustPressed(0, RSGCore.Shared.Keybinds['E']) then
                    deathTimerStarted = false
                    TriggerEvent('rsg-medic:client:revive')
                    TriggerServerEvent('rsg-medic:server:deathactions')
                end
            end

            -- If medics are online, also show option to call them (before timer ends)
            if deathTimerStarted and deathSecondsRemaining < Config.DeathTimer and medicsonduty > 0 and not medicCalled then
                SetTextFontForCurrentCommand(1)
                DrawTxt(locale('cl_press_assistance'),
                    0.50, 0.90, 0.5, 0.5, true, 255, 255, 255, 255, true)

                if IsControlJustPressed(0, RSGCore.Shared.Keybinds['G']) then
                    medicCalled = true
                    TriggerServerEvent('rsg-medic:server:medicAlert', locale('cl_medical_help'))
                    lib.notify({
                        title = locale('cl_medical_called'),
                        type = 'success',
                        icon = 'fa-solid fa-kit-medical',
                        iconAnimation = 'shake',
                        duration = 7000
                    })
                    MedicCalled()
                end
            end
        end

        if Config.Debug then
            print('deathTimerStarted: ' .. tostring(deathTimerStarted))
            print('deathSecondsRemaining: ' .. tostring(deathSecondsRemaining))
            print('medicsonduty: ' .. tostring(medicsonduty))
        end

        Wait(t)
    end
end)


-------------------------------------------------------- EVENTS --------------------------------------------------------

---------------------------------------------------------------------
-- medic menu
---------------------------------------------------------------------
AddEventHandler('rsg-medic:client:mainmenu', function(location, name)
    local job = RSGCore.Functions.GetPlayerData().job.name
    if job ~= Config.JobRequired then
        lib.notify({ title = locale('cl_not_medic'), type = 'error', icon = 'fa-solid fa-kit-medical', iconAnimation = 'shake', duration = 7000 })
        return
    end

    mediclocation = location

    lib.registerContext({
        id = "medic_mainmenu",
        title = name,
        options = {
             {   title = locale('cl_employees'),
                icon = 'fa-solid fa-list',
                description = locale('cl_employees_b'),
                event = 'rsg-bossmenu:client:mainmenu',
                isBoss = true
            },
            {   title = locale('cl_duty'),
                icon = 'fa-solid fa-shield-heart',
                event = 'rsg-medic:client:ToggleDuty',
                arrow = true
            },
            -- {   title = locale('cl_medical_supplies'),
            --     icon = 'fa-solid fa-pills',
            --     event = 'rsg-medic:client:OpenMedicSupplies',
            --     arrow = true
            -- },
            {   title = locale('cl_medical_storage'),
                icon = 'fa-solid fa-box-open',
                event = 'rsg-medic:client:storage',
                arrow = true
            },
        }
    })
    lib.showContext("medic_mainmenu")
end)

---------------------------------------------------------------------
-- medic supplies
---------------------------------------------------------------------
AddEventHandler('rsg-medic:client:OpenMedicSupplies', function()
    local job = RSGCore.Functions.GetPlayerData().job.name
    if job ~= Config.JobRequired then return end
    TriggerServerEvent('rsg-shops:server:openstore', 'medic', 'medic', locale('cl_medical_supplies'))
end)

---------------------------------------------------------------------
-- death cam
---------------------------------------------------------------------
AddEventHandler('rsg-medic:client:DeathCam', function()
    CreateThread(function()
        while true do
            Wait(1000)

            if not Dead and deathactive then
                Dead = true
                StartDeathCam()
            elseif Dead and not deathactive then
                Dead = false
                EndDeathCam()
            end

            if deathSecondsRemaining <= 0 and not deathactive then
                Dead = false
                EndDeathCam()
                return
            end
        end
    end)

    CreateThread(function()
        while true do
            Wait(4)

            if deadcam and Dead then
                ProcessCamControls()
            end

            if deathactive and not deadcam then
                StartDeathCam()
            end

            if deathSecondsRemaining <= 0 and not deathactive then return end
        end
    end)
end)

---------------------------------------------------------------------
-- get medics on-duty
---------------------------------------------------------------------
AddEventHandler('rsg-medic:client:GetMedicsOnDuty', function()
    RSGCore.Functions.TriggerCallback('rsg-medic:server:getmedics', function(mediccount)
        medicsonduty = mediccount
    end)
end)

-- Player Revive After Pressing [E]
AddEventHandler('rsg-medic:client:revive', function()
    SetClosestRespawn()

    if deathactive then
        DoScreenFadeOut(500)

        Wait(1000)

        local respawnPos = Config.RespawnLocations[closestRespawn].coords
        NetworkResurrectLocalPlayer(respawnPos, true, false)
        SetEntityInvincible(cache.ped, false)
        ClearPedBloodDamage(cache.ped)
        SetAttributeCoreValue(cache.ped, 0, 100)
        SetAttributeCoreValue(cache.ped, 1, 100)
        -- TriggerServerEvent("RSGCore:Server:SetMetaData", "hunger", 100)
        -- TriggerServerEvent("RSGCore:Server:SetMetaData", "thirst", 100)
        exports['fx-hud']:setStatus("hunger", 100)
        exports['fx-hud']:setStatus("thirst", 100)
        TriggerServerEvent("RSGCore:Server:SetMetaData", "cleanliness", 100)
        TriggerServerEvent('rsg-medic:server:SetHealth', Config.MaxHealth)

        -- Reset Outlaw Status on respawn
        if Config.ResetOutlawStatus then
            TriggerServerEvent('rsg-prison:server:resetoutlawstatus')
        end

        -- Reset Death Timer
        deathactive = false
        deathTimerStarted = false
        medicCalled = false
        deathSecondsRemaining = 0

        AnimpostfxPlay("Title_Gen_FewHoursLater", 0, false)
        Wait(3000)
        DoScreenFadeIn(2000)
        AnimpostfxPlay("PlayerWakeUpInterrogation", 0, false)
        Wait(19000)

        TriggerServerEvent("RSGCore:Server:SetMetaData", "isdead", false)
    end
end)

---------------------------------------------------------------------
-- admin revive
---------------------------------------------------------------------
-- Admin Revive
RegisterNetEvent('rsg-medic:client:adminRevive', function()
    local player = PlayerPedId()
    local pos = GetEntityCoords(cache.ped, true)

    DoScreenFadeOut(500)

    Wait(1000)

    NetworkResurrectLocalPlayer(pos.x, pos.y, pos.z, GetEntityHeading(player), true, false)
    SetEntityInvincible(cache.ped, false)
    ClearPedBloodDamage(cache.ped)
    SetAttributeCoreValue(cache.ped, 0, 100) -- SetAttributeCoreValue
    SetAttributeCoreValue(cache.ped, 1, 100) -- SetAttributeCoreValue
    TriggerServerEvent("RSGCore:Server:SetMetaData", "hunger", 100)
    TriggerServerEvent("RSGCore:Server:SetMetaData", "thirst", 100)
    TriggerServerEvent("RSGCore:Server:SetMetaData", "cleanliness", 100)

    -- Reset Outlaw Status on respawn
    if Config.ResetOutlawStatus then
        TriggerServerEvent('rsg-prison:server:resetoutlawstatus')
    end

    -- Reset Death Timer
    deathactive = false
    deathTimerStarted = false
    medicCalled = false
    deathSecondsRemaining = 0

    Wait(1500)

    DoScreenFadeIn(1800)

    TriggerServerEvent("RSGCore:Server:SetMetaData", "isdead", false)
end)

---------------------------------------------------------------------
-- player revive
---------------------------------------------------------------------
RegisterNetEvent('rsg-medic:client:playerRevive', function()

    local pos = GetEntityCoords(cache.ped, true)

    DoScreenFadeOut(500)

    Wait(1000)

    NetworkResurrectLocalPlayer(pos.x, pos.y, pos.z, GetEntityHeading(cache.ped), true, false)
    SetEntityInvincible(cache.ped, false)
    ClearPedBloodDamage(cache.ped)
    SetAttributeCoreValue(cache.ped, 0, 100) -- SetAttributeCoreValue
    SetAttributeCoreValue(cache.ped, 1, 100) -- SetAttributeCoreValue
    TriggerServerEvent("RSGCore:Server:SetMetaData", "hunger", 100)
    TriggerServerEvent("RSGCore:Server:SetMetaData", "thirst", 100)
    TriggerServerEvent("RSGCore:Server:SetMetaData", "cleanliness", 100)
    TriggerServerEvent('rsg-medic:server:SetHealth', Config.MaxHealth)

    -- Reset Outlaw Status on respawn
    if Config.ResetOutlawStatus then
        TriggerServerEvent('rsg-prison:server:resetoutlawstatus')
    end

    -- Reset Death Timer
    deathactive = false
    deathTimerStarted = false
    medicCalled = false
    deathSecondsRemaining = 0

    Wait(1500)

    DoScreenFadeIn(1800)

    TriggerServerEvent("RSGCore:Server:SetMetaData", "isdead", false)
end)

---------------------------------------------------------------------
-- admin Heal
---------------------------------------------------------------------
RegisterNetEvent('rsg-medic:client:adminHeal', function()
    local player = PlayerPedId()
    local pos = GetEntityCoords(cache.ped, true)
    Wait(1000)
    NetworkResurrectLocalPlayer(pos.x, pos.y, pos.z, GetEntityHeading(player), true, false)
    SetEntityInvincible(cache.ped, false)
    ClearPedBloodDamage(cache.ped)
    SetAttributeCoreValue(cache.ped, 0, 100) -- SetAttributeCoreValue
    SetAttributeCoreValue(cache.ped, 1, 100) -- SetAttributeCoreValue
    TriggerServerEvent("RSGCore:Server:SetMetaData", "hunger", 100)
    TriggerServerEvent("RSGCore:Server:SetMetaData", "thirst", 100)
    TriggerServerEvent("RSGCore:Server:SetMetaData", "cleanliness", 100)
    TriggerServerEvent('rsg-medic:server:SetHealth', Config.MaxHealth)
    lib.notify({title = 'You have been Healed', duration = 5000, type = 'inform'})
end)

---------------------------------------------------------------------
-- Player Heal
---------------------------------------------------------------------
RegisterNetEvent('rsg-medic:client:playerHeal', function()
    local pos = GetEntityCoords(cache.ped, true)
    Wait(1000)
    NetworkResurrectLocalPlayer(pos.x, pos.y, pos.z, GetEntityHeading(cache.ped), true, false)
    SetEntityInvincible(cache.ped, false)
    ClearPedBloodDamage(cache.ped)
    SetAttributeCoreValue(cache.ped, 0, 100) -- SetAttributeCoreValue
    SetAttributeCoreValue(cache.ped, 1, 100) -- SetAttributeCoreValue
    TriggerServerEvent("RSGCore:Server:SetMetaData", "hunger", 100)
    TriggerServerEvent("RSGCore:Server:SetMetaData", "thirst", 100)
    TriggerServerEvent("RSGCore:Server:SetMetaData", "cleanliness", 100)
    TriggerServerEvent('rsg-medic:server:SetHealth', Config.MaxHealth)
    lib.notify({title = 'You have been Healed', duration = 5000, type = 'inform'})
end)

---------------------------------------------------------------------
-- medic storage
---------------------------------------------------------------------
AddEventHandler('rsg-medic:client:storage', function()
    local job = RSGCore.Functions.GetPlayerData().job.name
    local stashloc = mediclocation

    if job ~= Config.JobRequired then return end
    TriggerServerEvent('rsg-medic:server:openstash', stashloc)
end)

---------------------------------------------------------------------
-- kill player
---------------------------------------------------------------------
RegisterNetEvent('rsg-medic:client:KillPlayer')
AddEventHandler('rsg-medic:client:KillPlayer', function()
    SetEntityHealth(cache.ped, 0)
end)

---------------------------------------------------------------------
-- use bandage
---------------------------------------------------------------------
RegisterNetEvent('rsg-medic:client:usebandage', function()
    if isBusy then return end
    local hasItem = RSGCore.Functions.HasItem('bandage', 1)
    local PlayerData = RSGCore.Functions.GetPlayerData()
    --if not PlayerData.metadata['isdead'] and not PlayerData.metadata['ishandcuffed'] then
    if not PlayerData.metadata['isdead'] and not PlayerData.metadata['ishandcuffed'] and not IsPedOnMount(cache.ped) then
        if hasItem then
            isBusy = true
            LocalPlayer.state:set('inv_busy', true, true)
            SetCurrentPedWeapon(cache.ped, GetHashKey('weapon_unarmed'))

            lib.progressBar({
                duration = Config.BandageTime,
                position = 'bottom',
                useWhileDead = false,
                canCancel = false,
                disableControl = true,
                disable = {
                    move = true,
                    mouse = true,
                },
                anim = {
                    dict = 'mini_games@story@mob4@heal_jules@bandage@arthur',
                    clip = 'bandage_fast',
                    flag = 1,
                },
                label = locale('cl_progress'),
            })

            local currenthealth = GetEntityHealth(cache.ped)
            local newhealth = (currenthealth + Config.BandageHealth)
            if newhealth > 600 then
                newhealth = 600
            end
            SetEntityHealth(cache.ped, newhealth)

            TriggerServerEvent('rsg-medic:server:removeitem', 'bandage', 1)
            LocalPlayer.state:set('inv_busy', false, true)
            isBusy = false
        else
            lib.notify({ title = locale('cl_error'), description = locale('cl_error_b'), type = 'error', duration = 5000 })
        end
    else
        lib.notify({ title = locale('cl_error'), description = locale('cl_error_c'), type = 'error', duration = 5000 })
    end
end)

---------------------------------------------------------------------
-- cleanup
---------------------------------------------------------------------
AddEventHandler("onResourceStop", function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end

    DestroyAllCams(true)

    for i = 1, #createdEntries do
        if createdEntries[i].type == "BLIP" then
            if createdEntries[i].handle then
                RemoveBlip(createdEntries[i].handle)
            end
        end

        if createdEntries[i].type == "PROMPT" then
            if createdEntries[i].handle then
                exports['rsg-core']:deletePrompt(createdEntries[i].handle)
            end
        end
    end
end)

-- Use first aid
RegisterNetEvent('rsg-medic:client:useFirstAid', function()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local closestPlayer, closestDistance = RSGCore.Functions.GetClosestPlayer()

    if closestPlayer ~= -1 and closestDistance <= 2.5 then
        local targetId = GetPlayerServerId(closestPlayer)

        -- Check if player has medic job
        local playerJob = RSGCore.Functions.GetPlayerData().job.type
        if playerJob ~= 'medic' and playerJob ~= 'wilddoctor' and playerJob ~= 'privatedoctor' then
            lib.notify({ title = 'You are not a medic or wild doctor', type = 'error' })
            return
        end
        -- Ask target player to report if they're dead
        TriggerServerEvent('rsg-medic:server:CheckIfTargetDead', targetId)
    else
        lib.notify({ title = 'No player nearby', type = 'error' })
    end
end)

-- Use first aid
RegisterNetEvent('rsg-medic:client:useFirstAid2', function()
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local closestPlayer, closestDistance = RSGCore.Functions.GetClosestPlayer()

    if closestPlayer ~= -1 and closestDistance <= 2.5 then
        local targetId = GetPlayerServerId(closestPlayer)
        -- Ask target player to report if they're dead
        TriggerServerEvent('rsg-medic:server:CheckIfTargetDead', targetId)
    else
        lib.notify({ title = 'No player nearby', type = 'error' })
    end
end)


-- Proceed with first aid after confirmation
RegisterNetEvent('rsg-medic:client:ProceedWithFirstAid', function(targetId)
    local playerPed = PlayerPedId()

    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_CROUCH_INSPECT", 0, true)

    local success = lib.progressBar({
        duration = 15000,
        label = 'Applying first aid...',
        useWhileDead = false,
        canCancel = false,
        disable = {
            car = true,
            move = true,
            combat = true
        },
    })

    ClearPedTasksImmediately(playerPed)

    if success then
        TriggerServerEvent('rsg-medic:server:RevivePlayer', targetId)
    end
end)

-- Target player reports if dead
RegisterNetEvent('rsg-medic:client:ReportDeathState', function(requesterId)
    local isDead = IsEntityDead(PlayerPedId())
    TriggerServerEvent('rsg-medic:server:ReportDeathState', requesterId, isDead)
end)


