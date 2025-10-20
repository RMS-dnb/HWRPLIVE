local RSGCore = exports['rsg-core']:GetCoreObject()
local doctors = {}
local blips = {}
local activeCam = nil

-- Table to track cooldowns per player
local alertCooldowns = {}

-- Function to request model
local function modelrequest(model)
    Citizen.CreateThread(function()
        RequestModel(model)
    end)
end

-- Function to handle treatment for dead players
local function GetTreatedDead(location)
    local PlayerData = RSGCore.Functions.GetPlayerData()
    if Config.Extras.PayForTreatment then
        if PlayerData.metadata['isdead'] or PlayerData.metadata['inlaststand'] then
            RSGCore.Functions.TriggerCallback('rsg-medic:server:payFortreatment', function(payed)
                if payed then
                    local playerPed = PlayerPedId()
                    local animCoords = location.bed
                    DoScreenFadeOut(5000)
                    Wait(4000)
                    SetEntityCoords(playerPed, animCoords.x, animCoords.y, animCoords.z, false, false, false, true)
                    SetEntityHeading(playerPed, animCoords.heading or animCoords.w)

                    local animDict = 'amb_rest@world_human_sleep_ground@arm@male_b@idle_c'
                    local animClip = 'idle_h'

                    RequestAnimDict(animDict)
                    while not HasAnimDictLoaded(animDict) do
                        Citizen.Wait(100)
                    end

                    TaskPlayAnimAdvanced(
                        playerPed,
                        animDict,
                        animClip,
                        animCoords.x,
                        animCoords.y,
                        animCoords.z,
                        0.0, 0.0, animCoords.heading or animCoords.w,
                        8.0, -8.0, -1, 1, 0.0, false, false
                    )
                    Wait(500)
                    local success = lib.progressBar({
                        duration = 500000,
                        label = 'Receiving treatment...',
                        useWhileDead = true,
                        canCancel = false,
                        disable = {
                            move = true,
                        },
                    })

                    if success then
                        TriggerEvent('rsg-medic:client:adminRevive', source)
                        TriggerEvent("RMS_Poison:UseAntidote") -- give antidote on revive
                        lib.notify({ title = 'Antidote applied', type = 'success', duration = 4000 })
                        lib.notify({ title = 'You were revived', type = 'success', duration = 5000 })
                    end
                else
                    lib.notify({ title = 'There is not enough money', type = 'error', duration = 7500 })
                end
            end, Config.Extras.TreatmentCost, Config.Extras.TreatmentPayType)
        else
            lib.notify({ title = 'You dont need treatment', type = 'error', duration = 7500 })
        end
    else
        if PlayerData.metadata['isdead'] or PlayerData.metadata['inlaststand'] then
            TriggerEvent('rsg-medic:client:adminRevive', source)
            TriggerEvent("RMS_Poison:UseAntidote") -- give antidote on revive
            lib.notify({ title = 'Antidote applied', type = 'success', duration = 4000 })
            lib.notify({ title = 'make a return', type = 'success', duration = 5000 })
        else
            lib.notify({ title = 'You dont need treatment', type = 'error', duration = 7500 })
        end
    end
end

local function setupCamera(location)
    if not location then return false end
    if not location.Cam then return false end
    if not location.Cam.x or not location.Cam.y or not location.Cam.z then return false end

    if activeCam then
        DestroyCam(activeCam, false)
    end

    activeCam = CreateCam("DEFAULT_SCRIPTED_CAMERA", true)
    local camCoords = vector3(location.Cam.x, location.Cam.y, location.Cam.z)
    local camHeading = location.Cam.w or 0.0

    SetCamCoord(activeCam, camCoords)
    SetCamRot(activeCam, 0.0, 0.0, camHeading, 2)
    SetCamActive(activeCam, true)
    RenderScriptCams(true, false, 0, true, true)
    
    return true
end

local function resetCamera()
    if activeCam then
        DestroyCam(activeCam, false)
        RenderScriptCams(false, false, 0, true, true)
        activeCam = nil
    end
end

local function GetTreatedNormal(location)
    if Config.Extras.PayForTreatment then
        RSGCore.Functions.TriggerCallback('rsg-medic:server:payFortreatment', function(payed)
            if payed then
                local playerPed = PlayerPedId()
                local animCoords = location.bed
                local gender = 'M'
                if not IsPedMale(playerPed) then gender = 'F' end
                
                DoScreenFadeOut(1000)
                Wait(1000)
                SetEntityCoords(playerPed, animCoords.x, animCoords.y, animCoords.z, false, false, false, true)
                SetEntityHeading(playerPed, animCoords.w)
                FreezeEntityPosition(playerPed, true)
                Wait(500)
                
                if location.anim and location.anim[gender] then
                    TaskStartScenarioAtPosition(
                        playerPed, 
                        GetHashKey(location.anim[gender]),
                        animCoords.x,
                        animCoords.y,
                        animCoords.z,
                        animCoords.w,
                        0, false, false
                    )
                end
                
                DoScreenFadeIn(100)
                local cameraSetup = setupCamera(location)
                Wait(500)

                local success = lib.progressBar({
                    duration = 5000,
                    label = 'Receiving treatment...',
                    useWhileDead = true,
                    canCancel = false,
                    disable = {
                        move = true,
                    },
                })

                if success then
                    FreezeEntityPosition(playerPed, false)
                    DoScreenFadeIn(200)
                    resetCamera()
                    ClearPedTasks(playerPed)
                    TriggerEvent('rsg-medic:client:adminRevive', source)
                    TriggerEvent("RMS_Poison:UseAntidote") -- give antidote on revive
                    lib.notify({ title = 'Antidote applied', type = 'success', duration = 4000 })
                    lib.notify({ title = 'make a return', type = 'success', duration = 5000 })
                end
            else
                lib.notify({ title = 'Not enough money', type = 'error', duration = 7500 })
                FreezeEntityPosition(PlayerPedId(), false)
                ClearPedTasks(PlayerPedId())
                resetCamera()
            end
        end, Config.Extras.TreatmentCost, Config.Extras.TreatmentPayType)
    else
        local playerPed = PlayerPedId()
        local animCoords = location.bed
        local gender = 'M'
        if not IsPedMale(playerPed) then gender = 'F' end
        
        DoScreenFadeOut(1000)
        Wait(1000)
        SetEntityCoords(playerPed, animCoords.x, animCoords.y, animCoords.z, false, false, false, true)
        SetEntityHeading(playerPed, animCoords.w)
        FreezeEntityPosition(playerPed, true)
        
        if location.anim and location.anim[gender] then
            TaskStartScenarioAtPosition(
                playerPed, 
                GetHashKey(location.anim[gender]),
                animCoords.x,
                animCoords.y,
                animCoords.z,
                animCoords.w,
                0, false, false
            )
        end
        
        DoScreenFadeIn(100)
        setupCamera(location)
        Wait(500)

        local success = lib.progressBar({
            duration = 5000,
            label = 'Receiving treatment...',
            useWhileDead = false,
            canCancel = false,
            disable = {
                move = true,
            },
        })

        if success then
            FreezeEntityPosition(playerPed, false)
            DoScreenFadeIn(200)
            ClearPedTasks(playerPed)
            resetCamera()
            TriggerEvent('rsg-medic:client:adminRevive', source)
            TriggerEvent("RMS_Poison:UseAntidote") -- give antidote on revive
            lib.notify({ title = 'Antidote applied', type = 'success', duration = 4000 })
            lib.notify({ title = 'make a return', type = 'success', duration = 5000 })
        end
    end
end

-- Event to start treatment check
RegisterNetEvent('rsg-npcdoc:client:startTreatmentCheck')
AddEventHandler('rsg-npcdoc:client:startTreatmentCheck', function(location)
    if Config.JobDutyCheck then
        RSGCore.Functions.TriggerCallback('rsg-medic:server:getmedics', function(mediccount)
            if mediccount < Config.MinMedics then
                if Config.OnlyDead then
                    GetTreatedDead(location)
                else
                    GetTreatedNormal(location)
                end
            else
                lib.notify({ title = 'Many doctors on duty', type = 'error', duration = 7500 })
            end
        end)
    else
        if Config.OnlyDead then
            GetTreatedDead(location)
        else
            GetTreatedNormal(location)
        end
    end
end)

-- Thread to handle locations
Citizen.CreateThread(function()
    for _, v in pairs(Config.LocationsDoc) do
        -- Create Blip
        if v.showblip then
            blips = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords.x, v.coords.y, v.coords.z)
            SetBlipSprite(blips, GetHashKey(Config.Blip.blipSprite), 1)
            SetBlipScale(blips, Config.Blip.blipScale)
            Citizen.InvokeNative(0x9CB1A1623062F402, blips, Config.Blip.blipName)
        end

        -- Spawn Ped
        if v.usePed then
            while not HasModelLoaded(GetHashKey(Config.Ped)) do
                Wait(500)
                modelrequest(GetHashKey(Config.Ped))
            end

            doctors = CreatePed(
                GetHashKey(Config.Ped),
                v.coords.x,
                v.coords.y,
                v.coords.z - 0.8,
                v.coords.w,
                true,
                false,
                0,
                0
            )

            while not DoesEntityExist(doctors) do Wait(300) end

            if not NetworkGetEntityIsNetworked(doctors) then
                NetworkRegisterEntityAsNetworked(doctors)
            end

            Citizen.InvokeNative(0x283978A15512B2FE, doctors, true)
            FreezeEntityPosition(doctors, true)
        end

        ----------------------------------------------------------------
        -- ✅ TARGET MODE
        ----------------------------------------------------------------
        if Config.Target then
            -- Treatment
            exports['rsg-target']:AddBoxZone(
                v.name,
                vector3(v.coords.x, v.coords.y, v.coords.z),
                1.5,
                1.5,
                {
                    name = v.name,
                    heading = v.coords.w,
                    debugPoly = Config.Debug,
                    minZ = v.coords.z - 1,
                    maxZ = v.coords.z + 1,
                },
                {
                    options = {
                        {
                            type = 'client',
                            event = 'rsg-npcdoc:client:startTreatmentCheck',
                            icon = 'fas fa-hospital',
                            label = 'Dr Goodfellow',
                        },
                        {
                            type = 'client',
                            event = 'rsg-radialmenu:client:SendMedicEmergencyAlert',
                            icon = 'fa-solid fa-truck-medical',
                            label = 'Alert Medics',
                            canInteract = function()
                                local src = PlayerId()
                                local now = GetGameTimer() / 1000
                                local lastAlert = alertCooldowns[src] or 0

                                if now - lastAlert >= 600 then
                                    alertCooldowns[src] = now
                                    lib.notify({ title = 'Alert Sent', description = 'Medic alert has been sent!', type = 'success', duration = 5000 })
                                    return true
                                else
                                    local remaining = math.ceil(600 - (now - lastAlert))
                                    lib.notify({ title = 'Cooldown', description = 'Wait ' .. remaining .. 's before alerting again.', type = 'error', duration = 5000 })
                                    return false
                                end
                            end
                        },
                    },
                    distance = 4.00,
                }
            )

        ----------------------------------------------------------------
        -- ✅ PROMPT MODE (G = Treatment, R = Alert)
        ----------------------------------------------------------------
        else
            -- Treatment Prompt
            exports['rsg-core']:createPrompt(
                v.name,
                vector3(v.coords.x, v.coords.y, v.coords.z),
                RSGCore.Shared.Keybinds['G'],
                'Dr Goodfellow',
                {
                    type = 'client',
                    event = 'rsg-npcdoc:client:startTreatmentCheck',
                    args = { v },
                }
            )

            -- Alert Prompt
            exports['rsg-core']:createPrompt(
                v.name..'_alertmedic',
                vector3(v.coords.x, v.coords.y, v.coords.z),
                RSGCore.Shared.Keybinds['R'],
                'Alert Medics',
                {
                    type = 'client',
                    event = 'rsg-radialmenu:client:SendMedicEmergencyAlert',
                    canInteract = function()
                        local src = PlayerId()
                        local now = GetGameTimer() / 1000
                        local lastAlert = alertCooldowns[src] or 0

                        if now - lastAlert >= 600 then
                            alertCooldowns[src] = now
                            lib.notify({ title = 'Alert Sent', description = 'Medic alert has been sent!', type = 'success', duration = 5000 })
                            return true
                        else
                            local remaining = math.ceil(600 - (now - lastAlert))
                            lib.notify({ title = 'Cooldown', description = 'Wait ' .. remaining .. 's before alerting again.', type = 'error', duration = 5000 })
                            return false
                        end
                    end
                }
            )
        end
    end
end)

-- Cleanup on resource stop
AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        resetCamera()
        for i = 1, #Config.LocationsDoc do
            exports['rsg-core']:deletePrompt(Config.LocationsDoc[i].name)
            exports['rsg-core']:deletePrompt(Config.LocationsDoc[i].name..'_alertmedic')
        end
    end
end)
