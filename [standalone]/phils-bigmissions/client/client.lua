local RSGCore = exports['rsg-core']:GetCoreObject()
local spawnedPeds = {}
local currentDialog = nil
local blips = {}
local spawnedBandits = {}
local currentMission = nil 
local missionKills = {} 
local notificationCooldowns = {}
local COOLDOWN_TIME = 5000 

local ShowMissionDialog, ShowSuccessDialog, ShowInitialDialog, ShowMissionSelectDialog

local function CanSendNotification(notificationType)
    local currentTime = GetGameTimer()
    if not notificationCooldowns[notificationType] or (currentTime - notificationCooldowns[notificationType]) >= COOLDOWN_TIME then
        notificationCooldowns[notificationType] = currentTime
        return true
    end
    return false
end

local function SendNotificationWithCooldown(notificationType, title, description, type)
    if CanSendNotification(notificationType) then
        TriggerEvent('ox_lib:notify', {
            title = title,
            description = description,
            type = type
        })
    end
end

local function CreateBlip(coords, name)
    local blip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, coords)
    SetBlipSprite(blip, Config.Blip.sprite, true)
    Citizen.InvokeNative(0x9CB1A1623062F402, blip, name)
    return blip
end

local function HasAllRequiredKills(kills)
    if not kills then return true end
    for _, kill in ipairs(kills) do
        local count = missionKills[kill.npc] or 0
       
        if count < kill.amount then
            return false
        end
    end
    return true
end

local function GetKillProgress(kills)
    if not kills then return "" end
    local progress = ""
    for i, kill in ipairs(kills) do
        local count = missionKills[kill.npc] or 0
        progress = progress .. kill.label .. ": " .. count .. "/" .. kill.amount
        if i < #kills then
            progress = progress .. ", "
        end
    end
    return progress
end

local function FormatKillsList(kills)
    local text = ""
    for i, kill in ipairs(kills) do
        text = text .. kill.label .. " (x" .. kill.amount .. ")"
        if i < #kills then
            text = text .. ", "
        end
    end
    return text
end

local function SafeShowDialog(dialogData)
    CreateThread(function()
        if currentDialog then
            exports["rco-dialogs"]:hideDialog()
            Wait(500)
        end
        currentDialog = true
        exports["rco-dialogs"]:showDialog(dialogData)
    end)
end

local function SafeHideDialog()
    CreateThread(function()
        if currentDialog then
            exports["rco-dialogs"]:hideDialog()
            currentDialog = false
            Wait(500)
        end
    end)
end

local function SpawnMissionNPCs(missionData, missionKey)
    if not missionData.spawn_location then 
       
        return 
    end
    
    spawnedBandits = {}
    local spawnCoords = missionData.spawn_location
    
   
    
    
    if missionKey == "bandits" then
        SpawnBandits(missionData)
    elseif missionKey == "wolves" then
        SpawnWolves(missionData)
    elseif missionKey == "bears" then
        SpawnBears(missionData)
    elseif missionKey == "cougars" then
        SpawnCougars(missionData)
    elseif missionKey == "gang_hideout" then
        SpawnGangHideout(missionData)
    elseif missionKey == "livestock" then
        SpawnLivestockPredators(missionData)
    end
    
   
    StartGpsMultiRoute(6, true, true)
    AddPointToGpsMultiRoute(spawnCoords.x, spawnCoords.y, spawnCoords.z)
    SetGpsMultiRouteRender(true)
end

function SpawnBandits(missionData)
    local spawnCoords = missionData.spawn_location
    local modelHash = GetHashKey(missionData.npc_model)
    local weaponHash = GetHashKey("WEAPON_REVOLVER_CATTLEMAN")

    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do Wait(50) end

    for i = 1, missionData.required_kills[1].amount do
        local offset = vector3(math.random(-5, 5), math.random(-5, 5), 0.0)
        local ped = CreatePed(modelHash, spawnCoords.x + offset.x, spawnCoords.y + offset.y, spawnCoords.z - 1.0, spawnCoords.w, true, true, 0, 0)
        Citizen.InvokeNative(0x283978A15512B2FE, ped, true)
        Citizen.InvokeNative(0x23F74C2FDA6E7C61, 953018525, ped)
        GiveWeaponToPed_2(ped, weaponHash, 50, true, true, 1, false, 0.5, 1.0, 1.0, true, 0, 0)
        SetCurrentPedWeapon(ped, weaponHash, true)
        TaskCombatPed(ped, PlayerPedId(), 0, 16)
        table.insert(spawnedBandits, { ped = ped, mission = "bandits", npcType = "bandit", isDead = false, model = modelHash })
    end
    SetModelAsNoLongerNeeded(modelHash)
    
    
    StartGpsMultiRoute(6, true, true)
    AddPointToGpsMultiRoute(spawnCoords.x, spawnCoords.y, spawnCoords.z)
    SetGpsMultiRouteRender(true)
    
    SendNotificationWithCooldown("bandit_spawn", Config.Texts.notifications.success.title, "Bandits have spawned nearby. Take them out!", "success")
end

function SpawnWolves(missionData)
    local spawnCoords = missionData.spawn_location
    local modelHash = GetHashKey(missionData.npc_model)

    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do Wait(50) end

    for i = 1, missionData.required_kills[1].amount do
        local offset = vector3(math.random(-10, 10), math.random(-10, 10), 0.0)
        local groundZ = spawnCoords.z
        local found, zCoord = GetGroundZFor_3dCoord(spawnCoords.x + offset.x, spawnCoords.y + offset.y, spawnCoords.z + 10.0, false)
        if found then groundZ = zCoord end
        
        local ped = CreatePed(modelHash, spawnCoords.x + offset.x, spawnCoords.y + offset.y, groundZ, spawnCoords.w, true, true, 0, 0)
        SetEntityVisible(ped, true, 0)
        SetEntityAlpha(ped, 255, false)
        Citizen.InvokeNative(0x283978A15512B2FE, ped, true)
        Citizen.InvokeNative(0x23F74C2FDA6E7C61, 953018525, ped)
        PlaceEntityOnGroundProperly(ped)
        TaskCombatPed(ped, PlayerPedId(), 0, 16)
        table.insert(spawnedBandits, { ped = ped, mission = "wolves", npcType = "wolf", isDead = false, model = modelHash })
    end
    SetModelAsNoLongerNeeded(modelHash)
    
    
    StartGpsMultiRoute(6, true, true)
    AddPointToGpsMultiRoute(spawnCoords.x, spawnCoords.y, spawnCoords.z)
    SetGpsMultiRouteRender(true)
    
    SendNotificationWithCooldown("wolf_spawn", Config.Texts.notifications.success.title, "Wolves spotted nearby. Hunt them down!", "success")
end

function SpawnBears(missionData)
    local spawnCoords = missionData.spawn_location
    local modelHash = GetHashKey(missionData.npc_model)

    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do Wait(50) end

    local offset = vector3(math.random(-5, 5), math.random(-5, 5), 0.0)
    local groundZ = spawnCoords.z
    local found, zCoord = GetGroundZFor_3dCoord(spawnCoords.x + offset.x, spawnCoords.y + offset.y, spawnCoords.z + 10.0, false)
    if found then groundZ = zCoord end
    
    local ped = CreatePed(modelHash, spawnCoords.x + offset.x, spawnCoords.y + offset.y, groundZ, spawnCoords.w, true, true, 0, 0)
    SetEntityVisible(ped, true, 0)
    SetEntityAlpha(ped, 255, false)
    Citizen.InvokeNative(0x283978A15512B2FE, ped, true)
    Citizen.InvokeNative(0x23F74C2FDA6E7C61, 953018525, ped)
    PlaceEntityOnGroundProperly(ped)
    TaskCombatPed(ped, PlayerPedId(), 0, 16)
    table.insert(spawnedBandits, { ped = ped, mission = "bears", npcType = "bear", isDead = false, model = modelHash })
    
    SetModelAsNoLongerNeeded(modelHash)
    
   
    StartGpsMultiRoute(6, true, true)
    AddPointToGpsMultiRoute(spawnCoords.x, spawnCoords.y, spawnCoords.z)
    SetGpsMultiRouteRender(true)
    
    SendNotificationWithCooldown("bear_spawn", Config.Texts.notifications.success.title, "Dangerous bear spotted! Be careful!", "success")
end

function SpawnCougars(missionData)
    local spawnCoords = missionData.spawn_location
    local modelHash = GetHashKey(missionData.npc_model)

    RequestModel(modelHash)
    while not HasModelLoaded(modelHash) do Wait(50) end

    for i = 1, missionData.required_kills[1].amount do
        local offset = vector3(math.random(-8, 8), math.random(-8, 8), 0.0)
        local groundZ = spawnCoords.z
        local found, zCoord = GetGroundZFor_3dCoord(spawnCoords.x + offset.x, spawnCoords.y + offset.y, spawnCoords.z + 10.0, false)
        if found then groundZ = zCoord end
        
        local ped = CreatePed(modelHash, spawnCoords.x + offset.x, spawnCoords.y + offset.y, groundZ, spawnCoords.w, true, true, 0, 0)
        SetEntityVisible(ped, true, 0)
        SetEntityAlpha(ped, 255, false)
        Citizen.InvokeNative(0x283978A15512B2FE, ped, true)
        Citizen.InvokeNative(0x23F74C2FDA6E7C61, 953018525, ped)
        PlaceEntityOnGroundProperly(ped)
        TaskCombatPed(ped, PlayerPedId(), 0, 16)
        table.insert(spawnedBandits, { ped = ped, mission = "cougars", npcType = "cougar", isDead = false, model = modelHash })
    end
    SetModelAsNoLongerNeeded(modelHash)
    
  
    StartGpsMultiRoute(6, true, true)
    AddPointToGpsMultiRoute(spawnCoords.x, spawnCoords.y, spawnCoords.z)
    SetGpsMultiRouteRender(true)
    
    SendNotificationWithCooldown("cougar_spawn", Config.Texts.notifications.success.title, "Mountain lions are prowling nearby!", "success")
end

function SpawnGangHideout(missionData)
    local spawnCoords = missionData.spawn_location
    local leaderHash = GetHashKey("cs_bountyhunter")
    local memberHash = GetHashKey("cr_strawberry_males_01")
    local weaponHash = GetHashKey("WEAPON_REVOLVER_CATTLEMAN")

    

    -- Load models
    RequestModel(leaderHash)
    RequestModel(memberHash)
    
    local attempts = 0
    while (not HasModelLoaded(leaderHash) or not HasModelLoaded(memberHash)) and attempts < 100 do 
        Wait(50) 
        attempts = attempts + 1
        
    end
    
    if not HasModelLoaded(leaderHash) then
        
       
        leaderHash = GetHashKey("u_m_m_bht_skinnersearch")
        RequestModel(leaderHash)
        while not HasModelLoaded(leaderHash) do Wait(50) end
    end
    
    if not HasModelLoaded(memberHash) then
        
        memberHash = leaderHash
    end

    
    local offset = vector3(0, 0, 0)
    local leader = CreatePed(leaderHash, spawnCoords.x + offset.x, spawnCoords.y + offset.y, spawnCoords.z - 1.0, spawnCoords.w, true, true, 0, 0)
    
    if DoesEntityExist(leader) then
       
        Citizen.InvokeNative(0x283978A15512B2FE, leader, true)
        Citizen.InvokeNative(0x23F74C2FDA6E7C61, 953018525, leader)
        GiveWeaponToPed_2(leader, weaponHash, 50, true, true, 1, false, 0.5, 1.0, 1.0, true, 0, 0)
        SetCurrentPedWeapon(leader, weaponHash, true)
        TaskCombatPed(leader, PlayerPedId(), 0, 16)
        table.insert(spawnedBandits, { ped = leader, mission = "gang_hideout", npcType = "gang_leader", isDead = false, model = leaderHash })
    else
       
    end

    
    for i = 1, 3 do
        local memberOffset = vector3(math.random(-8, 8), math.random(-8, 8), 0.0)
        local member = CreatePed(memberHash, spawnCoords.x + memberOffset.x, spawnCoords.y + memberOffset.y, spawnCoords.z - 1.0, spawnCoords.w, true, true, 0, 0)
        
        if DoesEntityExist(member) then
          
            Citizen.InvokeNative(0x283978A15512B2FE, member, true)
            Citizen.InvokeNative(0x23F74C2FDA6E7C61, 953018525, member)
            GiveWeaponToPed_2(member, weaponHash, 50, true, true, 1, false, 0.5, 1.0, 1.0, true, 0, 0)
            SetCurrentPedWeapon(member, weaponHash, true)
            TaskCombatPed(member, PlayerPedId(), 0, 16)
            table.insert(spawnedBandits, { ped = member, mission = "gang_hideout", npcType = "gang_member", isDead = false, model = memberHash })
        else
           
        end
    end
    
    SetModelAsNoLongerNeeded(leaderHash)
    SetModelAsNoLongerNeeded(memberHash)
    
    
    StartGpsMultiRoute(6, true, true)
    AddPointToGpsMultiRoute(spawnCoords.x, spawnCoords.y, spawnCoords.z)
    SetGpsMultiRouteRender(true)
    
   
    SendNotificationWithCooldown("gang_spawn", Config.Texts.notifications.success.title, "Gang hideout located! Watch out for multiple armed criminals!", "success")
end

function SpawnLivestockPredators(missionData)
    local spawnCoords = missionData.spawn_location
    local wolfHash = GetHashKey("A_C_Wolf")
    local cougarHash = GetHashKey("A_C_Cougar_01")

   
    RequestModel(wolfHash)
    RequestModel(cougarHash)
    while not HasModelLoaded(wolfHash) or not HasModelLoaded(cougarHash) do Wait(50) end

    
    for i = 1, 2 do
        local offset = vector3(math.random(-10, 10), math.random(-10, 10), 0.0)
        local groundZ = spawnCoords.z
        local found, zCoord = GetGroundZFor_3dCoord(spawnCoords.x + offset.x, spawnCoords.y + offset.y, spawnCoords.z + 10.0, false)
        if found then groundZ = zCoord end
        
        local ped = CreatePed(wolfHash, spawnCoords.x + offset.x, spawnCoords.y + offset.y, groundZ, spawnCoords.w, true, true, 0, 0)
        SetEntityVisible(ped, true, 0)
        SetEntityAlpha(ped, 255, false)
        Citizen.InvokeNative(0x283978A15512B2FE, ped, true)
        Citizen.InvokeNative(0x23F74C2FDA6E7C61, 953018525, ped)
        PlaceEntityOnGroundProperly(ped)
        TaskCombatPed(ped, PlayerPedId(), 0, 16)
        table.insert(spawnedBandits, { ped = ped, mission = "livestock", npcType = "wolf", isDead = false, model = wolfHash })
    end

    
    local cougarOffset = vector3(math.random(-12, 12), math.random(-12, 12), 0.0)
    local groundZ = spawnCoords.z
    local found, zCoord = GetGroundZFor_3dCoord(spawnCoords.x + cougarOffset.x, spawnCoords.y + cougarOffset.y, spawnCoords.z + 10.0, false)
    if found then groundZ = zCoord end
    
    local cougar = CreatePed(cougarHash, spawnCoords.x + cougarOffset.x, spawnCoords.y + cougarOffset.y, groundZ, spawnCoords.w, true, true, 0, 0)
    SetEntityVisible(cougar, true, 0)
    SetEntityAlpha(cougar, 255, false)
    Citizen.InvokeNative(0x283978A15512B2FE, cougar, true)
    Citizen.InvokeNative(0x23F74C2FDA6E7C61, 953018525, cougar)
    PlaceEntityOnGroundProperly(cougar)
    TaskCombatPed(cougar, PlayerPedId(), 0, 16)
    table.insert(spawnedBandits, { ped = cougar, mission = "livestock", npcType = "cougar", isDead = false, model = cougarHash })
    
    SetModelAsNoLongerNeeded(wolfHash)
    SetModelAsNoLongerNeeded(cougarHash)
    
    
    StartGpsMultiRoute(6, true, true)
    AddPointToGpsMultiRoute(spawnCoords.x, spawnCoords.y, spawnCoords.z)
    SetGpsMultiRouteRender(true)
    
    SendNotificationWithCooldown("livestock_spawn", Config.Texts.notifications.success.title, "Predators threatening the livestock have been located!", "success")
end

local function DespawnBandits()
    for _, bandit in ipairs(spawnedBandits) do
        if DoesEntityExist(bandit.ped) then
            DeletePed(bandit.ped)
        end
    end
    spawnedBandits = {}
    SetGpsMultiRouteRender(false)
   
end

local function CheckMissionCompletion()
    if not currentMission then return end
    
    local missionData = Config.Missions[currentMission]
    if not missionData then return end
    
    if HasAllRequiredKills(missionData.required_kills) then
        TriggerEvent('rNotify:NotifyLeft', "Mission Completed!", "All targets eliminated! Return to the Collector to claim your reward.", "generic_textures", "tick", 6000)
		SetGpsMultiRouteRender(false)
       
    end
end

ShowMissionDialog = function(npcEntity, missionKey)
    CreateThread(function()
        local missionData = Config.Missions[missionKey]
        if not missionData then 
           
            return 
        end
        
        local killsList = FormatKillsList(missionData.required_kills)
        local progress = GetKillProgress(missionData.required_kills)
        local hasKills = HasAllRequiredKills(missionData.required_kills)

        if hasKills and currentMission == missionKey then
            
            SafeShowDialog({
                npc = npcEntity,
                title = { text = missionData.title },
                name = { text = Config.Texts.npc_name },
                message = { 
                    text = string.format(Config.Texts.dialogs.completed.message, 
                        "targets", progress), 
                    typeEffect = 40 
                },
                buttons = {
                    {
                        message = Config.Texts.buttons.report,
                        onSelect = function()
                            TriggerServerEvent('phils-mission:server:deliverItems', {
                                mission = missionKey,
                                reward = missionData.reward
                            })
                            SafeHideDialog()
                            currentMission = nil
                            missionKills = {}
                            DespawnBandits()
                        end
                    },
                    {
                        message = Config.Texts.buttons.no,
                        onSelect = function()
                            SafeHideDialog()
                        end
                    }
                }
            })
        else
           
            currentMission = missionKey
            SafeShowDialog({
                npc = npcEntity,
                title = { text = missionData.title },
                name = { text = Config.Texts.npc_name },
                message = { 
                    text = string.format(Config.Texts.dialogs.mission.message, 
                        missionData.description, killsList, progress), 
                    typeEffect = 40 
                },
                buttons = {
                    {
                        message = Config.Texts.buttons.report,
                        onSelect = function()
                            if HasAllRequiredKills(missionData.required_kills) then
                                TriggerServerEvent('phils-mission:server:deliverItems', {
                                    mission = missionKey,
                                    reward = missionData.reward
                                })
                                SafeHideDialog()
                                currentMission = nil
                                missionKills = {}
                                DespawnBandits()
                            else
                                SafeHideDialog()
                                Wait(500)
                                SafeShowDialog({
                                    npc = npcEntity,
                                    title = { text = Config.Texts.dialogs.error.title },
                                    name = { text = Config.Texts.npc_name },
                                    message = { text = Config.Texts.dialogs.error.message, typeEffect = 40 },
                                    buttons = {
                                        {
                                            message = Config.Texts.buttons.come_back,
                                            onSelect = function() SafeHideDialog() end
                                        }
                                    }
                                })
                            end
                        end
                    },
                    {
                        message = Config.Texts.buttons.yes,
                        onSelect = function()
                            SafeHideDialog()
                            DespawnBandits()
                            missionKills = {}
                            SpawnMissionNPCs(missionData, missionKey)
                        end
                    },
                    {
                        message = Config.Texts.buttons.no,
                        onSelect = function()
                            SafeHideDialog()
                            DespawnBandits()
                            currentMission = nil
                            missionKills = {}
                        end
                    },
                    {
                        message = Config.Texts.buttons.select_back,
                        onSelect = function()
                            SafeHideDialog()
                            Wait(500)
                            ShowMissionSelectDialog(npcEntity)
                        end
                    }
                }
            })
        end
    end)
end

ShowMissionSelectDialog = function(ped)
    SafeShowDialog({
        npc = ped,
        title = { text = Config.Texts.dialogs.initial.title },
        name = { text = Config.Texts.npc_name },
        message = { 
            text = Config.Texts.dialogs.initial.message, 
            typeEffect = 40 
        },
        buttons = {
            {
                message = Config.Texts.buttons.select_bandits,
                onSelect = function()
                    SafeHideDialog()
                    Wait(500)
                    ShowMissionDialog(ped, "bandits")
                end
            },
            {
                message = Config.Texts.buttons.select_wolves,
                onSelect = function()
                    SafeHideDialog()
                    Wait(500)
                    ShowMissionDialog(ped, "wolves")
                end
            },
            {
                message = Config.Texts.buttons.select_bears,
                onSelect = function()
                    SafeHideDialog()
                    Wait(500)
                    ShowMissionDialog(ped, "bears")
                end
            },
            {
                message = Config.Texts.buttons.select_cougars,
                onSelect = function()
                    SafeHideDialog()
                    Wait(500)
                    ShowMissionDialog(ped, "cougars")
                end
            },
            {
                message = Config.Texts.buttons.select_gang_hideout,
                onSelect = function()
                    SafeHideDialog()
                    Wait(500)
                    ShowMissionDialog(ped, "gang_hideout")
                end
            },
            {
                message = Config.Texts.buttons.select_livestock,
                onSelect = function()
                    SafeHideDialog()
                    Wait(500)
                    ShowMissionDialog(ped, "livestock")
                end
            },
            {
                message = Config.Texts.buttons.no,
                onSelect = function()
                    SafeHideDialog()
                end
            }
        }
    })
end

ShowSuccessDialog = function(npcEntity)
    SafeShowDialog({
        npc = npcEntity,
        title = { text = Config.Texts.dialogs.success.title },
        name = { text = Config.Texts.npc_name },
        message = { 
            text = Config.Texts.dialogs.success.message,
            typeEffect = 40 
        },
        buttons = {
            {
                message = Config.Texts.buttons.thanks,
                onSelect = function()
                    SafeHideDialog()
                    DespawnBandits()
                    currentMission = nil
                    missionKills = {}
                end
            }
        }
    })
end

ShowInitialDialog = function(ped)
    ShowMissionSelectDialog(ped)
end

CreateThread(function()
    for k, v in pairs(Config.NPCLocations) do
        if v.showblip then
            blips[k] = CreateBlip(v.npccoords.xyz, Config.Texts.npc_name)
        end
    end
end)

CreateThread(function()
    while true do
        Wait(500)
        for k,v in pairs(Config.NPCLocations) do
            local distance = #(GetEntityCoords(PlayerPedId()) - v.npccoords.xyz)

            if distance < Config.DistanceSpawn and not spawnedPeds[k] then
                local ped = NearPed(v.npcmodel, v.npccoords)
                spawnedPeds[k] = { spawnedPed = ped }
                
                exports.ox_target:addLocalEntity(ped, {
                    {
                        name = 'collector_menu',
                        icon = 'fas fa-hand',
                        label = Config.Texts.target_label,
                        distance = 2.5,
                        onSelect = function()
                            ShowInitialDialog(ped)
                        end
                    }
                })
            elseif distance >= Config.DistanceSpawn and spawnedPeds[k] then
                exports.ox_target:removeLocalEntity(spawnedPeds[k].spawnedPed)
                if Config.FadeIn then
                    for i = 255, 0, -51 do
                        Wait(50)
                        SetEntityAlpha(spawnedPeds[k].spawnedPed, i, false)
                    end
                end
                DeletePed(spawnedPeds[k].spawnedPed)
                spawnedPeds[k] = nil
            end
        end

        
        if currentMission and #spawnedBandits > 0 then
            local missionData = Config.Missions[currentMission]
            if missionData and missionData.spawn_location then
                local distance = #(GetEntityCoords(PlayerPedId()) - missionData.spawn_location.xyz)
                if distance > 15000.0 then 
                    DespawnBandits()
                    SendNotificationWithCooldown("mission_despawn", Config.Texts.notifications.error.title, "You moved too far from the mission area. Mission reset.", "error")
                    currentMission = nil
                    missionKills = {}
                end
            end
        end
    end
end)


CreateThread(function()
    while true do
        Wait(1000)
        if currentMission and #spawnedBandits > 0 then
            local toRemove = {}
            local newKills = false
            
            for i, bandit in ipairs(spawnedBandits) do
                if bandit and DoesEntityExist(bandit.ped) and IsEntityDead(bandit.ped) and not bandit.isDead then
                    
                    bandit.isDead = true
                    
                   
                    local npcType = bandit.npcType
                    
                    if npcType then
                        missionKills[npcType] = (missionKills[npcType] or 0) + 1
                        newKills = true
                        
                        
                       
                        local killMessage = ""
                        if npcType == "bandit" then
                            killMessage = "Bandit eliminated!"
                        elseif npcType == "wolf" then
                            killMessage = "Wolf eliminated!"
                        elseif npcType == "bear" then
                            killMessage = "Bear eliminated!"
                        elseif npcType == "cougar" then
                            killMessage = "Mountain lion eliminated!"
                        elseif npcType == "gang_leader" then
                            killMessage = "Gang leader eliminated!"
                        elseif npcType == "gang_member" then
                            killMessage = "Gang member eliminated!"
                        else
                            killMessage = "Target eliminated!"
                        end
                        
                        SendNotificationWithCooldown("kill_" .. npcType, Config.Texts.notifications.success.title, killMessage, "success")
                        
                        
                        CreateThread(function()
                            Wait(5000)
                            if DoesEntityExist(bandit.ped) then
                                DeletePed(bandit.ped)
                            end
                        end)
                    end
                    
                    table.insert(toRemove, i)
                end
            end
            
            
            for i = #toRemove, 1, -1 do
                table.remove(spawnedBandits, toRemove[i])
            end
            
            
            if newKills then
                CheckMissionCompletion()
            end
        end
    end
end)

function NearPed(npcmodel, npccoords)
    RequestModel(npcmodel)
    while not HasModelLoaded(npcmodel) do Wait(50) end
    
    local ped = CreatePed(npcmodel, npccoords.x, npccoords.y, npccoords.z - 1.0, npccoords.w, false, false, 0, 0)
    SetEntityAlpha(ped, 0, false)
    SetRandomOutfitVariation(ped, true)
    SetEntityCanBeDamaged(ped, false)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    SetPedRelationshipGroupHash(ped, GetPedRelationshipGroupHash(ped))
    SetRelationshipBetweenGroups(1, GetPedRelationshipGroupHash(ped), `PLAYER`)
    
    if Config.FadeIn then
        for i = 0, 255, 51 do
            Wait(50)
            SetEntityAlpha(ped, i, false)
        end
    end
    return ped
end

RegisterNetEvent('phils-mission:client:deliverySuccess', function(missionKey)
   
    for k,v in pairs(spawnedPeds) do
        if v.spawnedPed then
            ShowSuccessDialog(v.spawnedPed)
            break
        end
    end
    DespawnBandits()
    currentMission = nil
    missionKills = {}
end)

AddEventHandler("onResourceStop", function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    for k, v in pairs(blips) do
        RemoveBlip(v)
    end

    for k,v in pairs(spawnedPeds) do
        exports.ox_target:removeLocalEntity(v.spawnedPed)
        DeletePed(v.spawnedPed)
        spawnedPeds[k] = nil
    end

    DespawnBandits()
end)