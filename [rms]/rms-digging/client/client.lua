-- CLIENT SIDE --

local RSGCore = exports['rsg-core']:GetCoreObject()
local isDigging = false
local createdObjects = {}
local shovelObject = nil
lib.locale()

-- Set up the target for gravestones
CreateThread(function()
    exports.ox_target:addModel(Config.Gravestones, {
        {
            name = 'gravestone',
            icon = 'far fa-eye',
            label = locale('cl_lang_5'),
            onSelect = function()
                local digAmount = lib.callback.await('rex-digging:server:checkLawmen', false)
                if digAmount >= 3 then
                    TriggerEvent('rex-digging:client:digGrave')
                end
            end,
            distance = 2.0
        }
    })
end)

-- Function to check if it's currently night time
local function isNightTime()
    local hour, minute = GetClockHours(), GetClockMinutes()
    return hour >= Config.DiggingStartHour or hour < Config.DiggingEndHour
end

-- Function to clean up digging state
local function cleanupDigging()
    if DoesEntityExist(shovelObject) then
        DeleteObject(shovelObject)
        shovelObject = nil
    end
    FreezeEntityPosition(cache.ped, false)
    ClearPedTasks(cache.ped)
    isDigging = false
end

---------------------------------
-- grave digging functionality
---------------------------------
RegisterNetEvent('rex-digging:client:digGrave', function()
    -- Check if it's night time
    if not isNightTime() then
        lib.notify({ title = locale('cl_lang_night_restrict'), type = 'error', duration = 5000 })
        return
    end

    -- Check if player has required item
    local hasItem = RSGCore.Functions.HasItem('shovel', 1)
    if not hasItem then
        lib.notify({ title = locale('cl_lang_3'), type = 'error', duration = 5000 })
        return
    end
    
    -- Check if already digging
    if isDigging then
        lib.notify({ title = 'You are already digging!', type = 'error', duration = 3000 })
        return
    end
    
    local playerCoords = GetEntityCoords(cache.ped, true)
    local nearestObject = nil
    local nearestObjectDistance = nil

    -- Check if already dug here
    for _, obj in ipairs(createdObjects) do
        if DoesEntityExist(obj) then
            local objCoords = GetEntityCoords(obj)
            local distance = #(playerCoords - objCoords)
            if not nearestObjectDistance or distance < nearestObjectDistance then
                nearestObjectDistance = distance
                nearestObject = obj
            end
        end
    end

    if nearestObject and nearestObjectDistance <= Config.HoleDistance then
        lib.notify({ title = locale('cl_lang_1'), type = 'info', duration = 7000 })
        return
    end
    
    -- Start digging process
    isDigging = true
    local waitrand = math.random(25000, 35000)
    local chance = math.random(100)
    local dirtModel = 'mp005_p_dirtpile_tall_unburied'
    local shovelModel = 'p_shovel02x'
    local animDict = "amb_work@world_human_gravedig@working@male_b@base"
    local animName = "base"
    
    -- Request models and animations
    RequestModel(dirtModel)
    while not HasModelLoaded(dirtModel) do
        Wait(1)
    end

    RequestModel(shovelModel)
    while not HasModelLoaded(shovelModel) do
        Wait(1)
    end

    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
        Wait(100)
    end

    -- Create and attach shovel
    local coords = GetEntityCoords(cache.ped)
    local boneIndex = GetEntityBoneIndexByName(cache.ped, "SKEL_R_Hand")
    shovelObject = CreateObject(GetHashKey(shovelModel), coords, true, true, true)
    
    -- Make sure player has no weapon equipped
    SetCurrentPedWeapon(cache.ped, `WEAPON_UNARMED`, true)
    
    -- Attach shovel to player's hand
    AttachEntityToEntity(
        shovelObject, 
        cache.ped, 
        boneIndex, 
        0.0, -0.19, -0.089, 
        274.1899, 483.89, 378.40, 
        true, true, false, true, 1, true
    )

    -- Freeze player and start animation
    FreezeEntityPosition(cache.ped, true)
    TaskPlayAnim(cache.ped, animDict, animName, 3.0, 3.0, -1, 1, 0, false, false, false)
    
    -- Show progress notification
    lib.notify({ title = 'Digging grave...', type = 'info', duration = waitrand })
    
    -- NEW: Monitor animation state during the wait period
    local startTime = GetGameTimer()
    local endTime = startTime + waitrand
    local diggingCancelled = false
    
    -- Wait for digging to complete while monitoring animation
    while GetGameTimer() < endTime and not diggingCancelled do
        Wait(500) -- Check every 500ms
        
        -- Check if player is still performing the animation
        if not IsEntityPlayingAnim(cache.ped, animDict, animName, 3) then
            diggingCancelled = true
            break
        end
    end
    
    -- If digging was cancelled, clean up and return
    if diggingCancelled then
        lib.notify({ title = 'Grave digging has been cancelled!', type = 'error', duration = 5000 })
        cleanupDigging()
        return
    end
    
    -- Calculate dirt pile position
    local finalPlayerCoords = GetEntityCoords(cache.ped)
    local playerForwardVector = GetEntityForwardVector(cache.ped)
    local offsetDistance = 0.6 

    local dirtX = finalPlayerCoords.x + playerForwardVector.x * offsetDistance
    local dirtY = finalPlayerCoords.y + playerForwardVector.y * offsetDistance
    local dirtZ = finalPlayerCoords.z - 1.0

    -- Create dirt pile
    local dirtObject = CreateObject(GetHashKey(dirtModel), dirtX, dirtY, dirtZ, true, true, false)
    table.insert(createdObjects, dirtObject)
    
    -- Law alert check (FIXED - now uses server event)
    if Config.LawAlertActive then
        local random = math.random(100)
        if random <= Config.LawAlertChance then
            local alertCoords = GetEntityCoords(cache.ped)
            TriggerServerEvent('rsg-lawman:server:lawmanAlert', alertCoords, locale('cl_lang_4'))
            TriggerServerEvent('rsg-tips:server:addCriminalActivity', "Robbery of graves", nil, GetEntityCoords(PlayerPedId()))
        end
    end
    
    -- Check reward chance for grave digging (only if digging completed successfully)
    if chance <= Config.GraveRewardChance then
        TriggerServerEvent('rex-digging:server:givereward', 'grave')
    else
        lib.notify({ title = locale('cl_lang_2'), type = 'info', duration = 7000 })
    end

    -- Clean up and reset
    cleanupDigging()
end)

-- NEW: Handle player death/logout during digging
RegisterNetEvent('RSGCore:Client:OnPlayerLoaded', function()
    cleanupDigging()
end)

RegisterNetEvent('RSGCore:Client:OnPlayerUnload', function()
    cleanupDigging()
end)

-- Clean up created objects when resource stops
AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        -- Clean up shovel if it exists
        if shovelObject and DoesEntityExist(shovelObject) then
            DeleteObject(shovelObject)
        end
        
        -- Clean up all dirt piles
        for _, obj in ipairs(createdObjects) do
            if DoesEntityExist(obj) then
                DeleteObject(obj)
            end
        end
        
        createdObjects = {}
        isDigging = false
    end
end)