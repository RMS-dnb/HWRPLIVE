local RSGCore = exports['rsg-core']:GetCoreObject()

-- Enhanced configuration with more realistic mechanics
local sellableItems = {
    {
        item = "weedjoint",
        label = "Offer Joint",
        minPrice = 4,
        maxPrice = 8,
        baseAcceptChance = 0.6,
        icon = 'fas fa-cannabis',
        alertChance = 1.0
        ,
        category = "contraband",
        riskLevel = "high"
    },
    {
        item = "moonshine",
        label = "Offer Moonshine", 
        minPrice = 6,
        maxPrice = 12,
        baseAcceptChance = 0.6,
        icon = 'fas fa-wine-bottle',
        alertChance = 1.0,
        category = "alcohol",
        riskLevel = "high"
    },
}

-- Time-based modifiers
local timeModifiers = {
    ["night"] = { acceptMod = 0.15, alertMod = 0.7 },
    ["dawn"] = { acceptMod = 0.05, alertMod = 0.9 },
    ["day"] = { acceptMod = 0.0, alertMod = 1.0 },
    ["dusk"] = { acceptMod = 0.1, alertMod = 0.8 }
}

-- Player cooldowns and zone tracking
local playerCooldowns = {}
local COOLDOWN_TIME = 20000
local currentZone = nil
local lastZoneCheck = 0

-- Enhanced NPC validation
-- Enhanced NPC validation
local function IsValidHumanNPC(entity)
    if not DoesEntityExist(entity) then return false end
    if IsPedAPlayer(entity) then return false end
    if IsEntityDead(entity) then return false end
    if not IsPedHuman(entity) then return false end
    
    -- 🚫 BLOCK SCRIPT-SPAWNED NPCs - Only allow naturally spawning ambient NPCs
    if IsEntityAMissionEntity(entity) then return false end
    
    if IsPedInAnyVehicle(entity, false) then return false end
    if IsPedFleeing(entity) then return false end
    if IsPedInCombat(entity, PlayerPedId()) then return false end
    if IsPedRagdoll(entity) then return false end
    
    -- Check if NPC is too close to law enforcement
    local npcCoords = GetEntityCoords(entity)
    local lawmen = GetGamePool('CPed')
    for _, lawman in ipairs(lawmen) do
        if IsPedInGroup(lawman) and GetPedType(lawman) == 6 then
            local lawCoords = GetEntityCoords(lawman)
            if #(npcCoords - lawCoords) < 20.0 then
                return false
            end
        end
    end
    
    return true
end

-- Zone detection system
local function GetCurrentZone()
    local playerCoords = GetEntityCoords(PlayerPedId())
    
    -- Check restricted zones first (highest priority)
    for zoneId, zone in pairs(Config.RestrictedZones) do
        local distance = #(playerCoords - zone.coords)
        if distance <= zone.radius then
            return {
                id = zoneId,
                data = zone,
                type = "restricted"
            }
        end
    end
    
    -- Check selling zones
    for zoneId, zone in pairs(Config.SellZones) do
        if zone.enabled then
            local distance = #(playerCoords - zone.coords)
            if distance <= zone.radius then
                return {
                    id = zoneId,
                    data = zone,
                    type = "selling"
                }
            end
        end
    end
    
    -- Not in any zone
    return {
        id = "wilderness",
        data = {
            name = "Wilderness",
            modifiers = {
                acceptMod = 0.1,
                priceMod = 0.9,
                alertMod = 0.8
            },
            allowedItems = {"weedjoint", "cigarettes", "moonshine"},
            riskLevel = "medium",
            description = "Open wilderness - Moderate risk"
        },
        type = "wilderness"
    }
end

-- Check if item is allowed in current zone
local function IsItemAllowedInZone(itemName, zone)
    if not zone or not zone.data then return false end
    
    -- Restricted zones never allow selling
    if zone.type == "restricted" then return false end
    
    -- Check if item is in allowed list
    if zone.data.allowedItems then
        for _, allowedItem in ipairs(zone.data.allowedItems) do
            if allowedItem == itemName then
                return true
            end
        end
        return false
    end
    
    -- If no allowedItems list, allow all items (fallback)
    return true
end

-- Get time of day context
local function GetTimeContext()
    local hour = GetClockHours()
    if hour >= 22 or hour < 6 then
        return "night"
    elseif hour >= 6 and hour < 8 then
        return "dawn"
    elseif hour >= 18 and hour < 22 then
        return "dusk"
    else
        return "day"
    end
end

-- Calculate dynamic acceptance chance
local function CalculateAcceptanceChance(itemData, zone)
    local baseChance = itemData.baseAcceptChance
    local timeContext = GetTimeContext()
    
    -- Apply zone modifier
    local zoneMod = (zone and zone.data.modifiers and zone.data.modifiers.acceptMod) or 0
    
    -- Apply time modifier
    local timeMod = (timeModifiers[timeContext] and timeModifiers[timeContext].acceptMod) or 0
    
    -- Special case: alcohol has higher acceptance in certain zones
    if itemData.category == "alcohol" and zone and zone.id == "van_horn" then
        zoneMod = zoneMod + 0.1
    end
    
    -- Calculate final chance
    local finalChance = math.max(0.1, math.min(0.9, baseChance + zoneMod + timeMod))
    return finalChance
end

-- Calculate dynamic pricing
local function CalculateDynamicPrice(itemData, zone)
    local priceMod = (zone and zone.data.modifiers and zone.data.modifiers.priceMod) or 1.0
    
    -- Add some randomness
    local randomFactor = math.random(80, 120) / 100
    
    local basePrice = math.random(itemData.minPrice, itemData.maxPrice)
    local finalPrice = math.floor(basePrice * priceMod * randomFactor)
    
    return math.max(1, finalPrice)
end

-- Enhanced NPC interaction
local function HandleNPCInteraction(entity, accepted, itemData)
    if not IsValidHumanNPC(entity) then return end
    
    local playerPed = PlayerPedId()
    
    ClearPedTasks(entity)
    FreezeEntityPosition(entity, true)
    
    -- Make NPC face player
    local playerCoords = GetEntityCoords(playerPed)
    local npcCoords = GetEntityCoords(entity)
    local direction = GetHeadingFromVector_2d(playerCoords.x - npcCoords.x, playerCoords.y - npcCoords.y)
    SetEntityHeading(entity, direction)
    
    -- Select appropriate animation
    local animDict, anim
    if accepted then
        if itemData.category == "alcohol" then
            animDict = "script_common@other@money_envelope"
            anim = "take_money"
        elseif itemData.category == "contraband" then
            animDict = "script_common@other@unapproved"
            anim = "loop_0"
        else
            animDict = "gestures@m@standing@casual"
            anim = "gesture_come_here_soft"
        end
    else
        local rejectAnims = {
            { dict = "gestures@m@standing@casual", anim = "gesture_no_way" },
            { dict = "gestures@m@standing@casual", anim = "gesture_dismiss" },
            { dict = "script_common@other@unapproved", anim = "loop_0" }
        }
        local selectedReject = rejectAnims[math.random(#rejectAnims)]
        animDict = selectedReject.dict
        anim = selectedReject.anim
    end
    
    RequestAnimDict(animDict)
    local timeout = 0
    while not HasAnimDictLoaded(animDict) and timeout < 50 do
        Wait(100)
        timeout = timeout + 1
    end
    
    if HasAnimDictLoaded(animDict) then
        TaskPlayAnim(entity, animDict, anim, 8.0, -8.0, 2500, 1, 0, false, false, false)
        Wait(2500)
        RemoveAnimDict(animDict)
    else
        Wait(2500)
    end
    
    ClearPedTasks(entity)
    FreezeEntityPosition(entity, false)
    
    local randomHeading = math.random(0, 360)
    SetEntityHeading(entity, randomHeading)
    TaskWanderStandard(entity, 15.0, 10)
end

-- Check if law alert should be triggered
local function ShouldTriggerLawAlert(itemData, zone)
    local timeContext = GetTimeContext()
    
    local baseAlertChance = itemData.alertChance
    local zoneMod = (zone and zone.data.modifiers and zone.data.modifiers.alertMod) or 1.0
    local timeMod = (timeModifiers[timeContext] and timeModifiers[timeContext].alertMod) or 1.0
    
    local finalAlertChance = baseAlertChance * zoneMod * timeMod
    
    return math.random() < finalAlertChance
end

-- Cooldown functions
local function IsPlayerOnCooldown(playerId)
    local currentTime = GetGameTimer()
    local lastAttempt = playerCooldowns[playerId]
    
    if lastAttempt and (currentTime - lastAttempt) < COOLDOWN_TIME then
        return true, math.ceil((COOLDOWN_TIME - (currentTime - lastAttempt)) / 1000)
    end
    
    return false, 0
end

local function SetPlayerCooldown(playerId)
    playerCooldowns[playerId] = GetGameTimer()
end

-- Zone change notification
local function OnZoneChange(newZone, oldZone)
    if not Config.ZoneSettings.showZoneNotifications then return end
    
    local message = ""
    local notificationType = "inform"
    
    if newZone.type == "restricted" then
        message = "⚠️ " .. newZone.data.name .. " - " .. newZone.data.reason
        notificationType = "error"
    elseif newZone.type == "selling" then
        message = "📍 " .. newZone.data.name .. " - " .. newZone.data.description
        notificationType = "success"
    else
        message = "🌲 " .. newZone.data.name .. " - " .. newZone.data.description
        notificationType = "inform"
    end
    
    lib.notify({
        title = 'Zone Change',
        description = message,
        type = notificationType,
        duration = 4000
    })
end

-- Create target options
local targetOptions = {}

for _, itemData in ipairs(sellableItems) do
    table.insert(targetOptions, {
        name = 'sell_' .. itemData.item,
        label = itemData.label,
        icon = itemData.icon,

        canInteract = function(entity)
            if not IsValidHumanNPC(entity) then return false end

            local playerId = PlayerPedId()

            -- 🚫 Prevent selling from horseback
            if IsPedOnMount(playerId) then
                return false
            end

            local onCooldown, remainingTime = IsPlayerOnCooldown(playerId)
            if onCooldown then return false end

            -- Check if player has the item
            if not RSGCore.Functions.HasItem(itemData.item) then return false end

            -- Check zone restrictions
            local zone = GetCurrentZone()
            if not IsItemAllowedInZone(itemData.item, zone) then return false end

            return true
        end,

        onSelect = function(data)
            local playerId = PlayerPedId()
            local zone = GetCurrentZone()

            -- 🚫 Stop selling if mounted
            if IsPedOnMount(playerId) then
                lib.notify({
                    title = 'You can\'t sell while on horseback',
                    description = 'Get off your horse first.',
                    type = 'error',
                    duration = 3000
                })
                return
            end

            -- Double-check cooldown
            local onCooldown, remainingTime = IsPlayerOnCooldown(playerId)
            if onCooldown then
                lib.notify({
                    title = 'Take it Easy',
                    description = 'Wait ' .. remainingTime .. ' seconds before trying again',
                    type = 'error',
                    duration = 3000
                })
                return
            end

            -- Validate entity
            if not IsValidHumanNPC(data.entity) then 
                lib.notify({
                    title = 'Invalid Target',
                    description = 'You can only sell to people!',
                    type = 'error',
                    duration = 3000
                })
                return 
            end

            -- Check zone restrictions
            if zone.type == "restricted" then
                lib.notify({
                    title = 'Restricted Area',
                    description = zone.data.reason,
                    type = 'error',
                    duration = 4000
                })
                return
            end

            if not IsItemAllowedInZone(itemData.item, zone) then
                lib.notify({
                    title = 'Item Not Allowed',
                    description = 'You can\'t sell that item in this area',
                    type = 'error',
                    duration = 3000
                })
                return
            end

            -- Set cooldown
            SetPlayerCooldown(playerId)

            -- Calculate acceptance chance
            local acceptanceChance = CalculateAcceptanceChance(itemData, zone)
            local accepted = math.random() < acceptanceChance

            -- Start NPC interaction
            CreateThread(function()
                HandleNPCInteraction(data.entity, accepted, itemData)
            end)

            -- Handle the sale result
            if accepted then
                local salePrice = CalculateDynamicPrice(itemData, zone)
                Wait(2500)
                TriggerServerEvent('PhilSellToNPC:SellItem', itemData.item, salePrice)

                if ShouldTriggerLawAlert(itemData, zone) then
                    local alertMessages = {
                        "Suspicious activity reported in " .. zone.data.name .. "!",
                        "Someone reported illegal trading in the area!",
                        "Witness reports questionable behavior nearby!",
                        "Citizens report suspicious individuals!"
                    }
                    local alertMsg = alertMessages[math.random(#alertMessages)]
                    local pid = PlayerPedId()
                    local npc = data.entity
                    local pos = GetEntityCoords(pid)
                    local prop = GetHashKey("s_drugpackage_02x")

                    ClearPedTasks(npc)
                    ClearPedTasksImmediately(npc)
                    FreezeEntityPosition(npc, true)
                    SetEntityInvincible(npc, true)
                    SetBlockingOfNonTemporaryEvents(npc, true)
                    SetPedCanRagdoll(npc, false)
                    FreezeEntityPosition(pid, true)

                    TaskTurnPedToFaceEntity(npc, pid, 2000)
                    Wait(1000)

                    RequestAnimDict("script_rc@chrb@ig1_visit_clerk")
                    while not HasAnimDictLoaded("script_rc@chrb@ig1_visit_clerk") do
                        Wait(100)
                    end

                    RequestModel(prop)
                    while not HasModelLoaded(prop) do
                        Wait(100)
                    end

                    local tempObj2 = CreateObject(prop, pos.x, pos.y, pos.z, true, true, false)
                    local boneIndex = GetEntityBoneIndexByName(pid, "SKEL_R_HAND")
                    AttachEntityToEntity(tempObj2, pid, boneIndex, 0.1, -0.01, -0.07, -90.0, 100.0, 0.0, true, true, false, true, 1, true)

                    TaskPlayAnim(pid, "script_rc@chrb@ig1_visit_clerk", "arthur_gives_money_player", 8.0, -8.0, 5000, 1, 0, false, false, false)
                    TaskPlayAnim(npc, "script_rc@chrb@ig1_visit_clerk", "shop_keeper_takes_money", 8.0, -8.0, 5000, 1, 0, false, false, false)

                    Wait(5000)

                    FreezeEntityPosition(pid, false)
                    FreezeEntityPosition(npc, false)
                    SetEntityInvincible(npc, false)
                    SetBlockingOfNonTemporaryEvents(npc, false)
                    SetPedCanRagdoll(npc, true)

                    Wait(math.random(2000, 10000))

                    TriggerServerEvent('rsg-lawman:server:lawmanAlert', alertMsg, GetEntityCoords(PlayerPedId()))
                    TriggerServerEvent('rsg-tips:server:addCriminalActivity', "Illegal trading", nil, GetEntityCoords(PlayerPedId()))

                    ClearPedTasks(pid)
                    ClearPedTasks(npc)
                    DeleteObject(tempObj2)
                    SetModelAsNoLongerNeeded(prop)
                    RemoveAnimDict("script_rc@chrb@ig1_visit_clerk")
                end
            else
                Wait(2500)
                local rejectMessages = {
                    "The person isn't interested",
                    "They decline your offer",
                    "They shake their head and walk away",
                    "They're not buying what you're selling"
                }
                local rejectMsg = rejectMessages[math.random(#rejectMessages)]

                lib.notify({
                    title = 'No Sale',
                    description = rejectMsg,
                    type = 'error',
                    duration = 3000
                })
            end
        end
    })
end


-- Initialize target system
CreateThread(function()
    exports.ox_target:addGlobalPed(targetOptions, {
        distance = 2.5
    })
end)

-- Zone monitoring system
CreateThread(function()
    while true do
        local currentTime = GetGameTimer()
        
        -- Check zones every interval
        if currentTime - lastZoneCheck >= Config.ZoneSettings.checkInterval then
            local newZone = GetCurrentZone()
            
            -- Check if zone changed
            if not currentZone or currentZone.id ~= newZone.id then
                OnZoneChange(newZone, currentZone)
                currentZone = newZone
                
                if Config.ZoneSettings.debugMode then
                    print("Zone changed to: " .. newZone.id .. " (" .. newZone.type .. ")")
                end
            end
            
            lastZoneCheck = currentTime
        end
        
        Wait(500) -- Check twice per second for responsiveness
    end
end)

-- Clean up cooldowns periodically
CreateThread(function()
    while true do
        Wait(300000) -- Every 5 minutes
        local currentTime = GetGameTimer()
        for playerId, lastAttempt in pairs(playerCooldowns) do
            if (currentTime - lastAttempt) > COOLDOWN_TIME * 2 then
                playerCooldowns[playerId] = nil
            end
        end
    end
end)

-- Debug command for testing zones
if Config.ZoneSettings.debugMode then
    RegisterCommand('checkzone', function()
        local zone = GetCurrentZone()
        print("Current Zone: " .. zone.id .. " (" .. zone.type .. ")")
        print("Zone Name: " .. zone.data.name)
        if zone.data.description then
            print("Description: " .. zone.data.description)
        end
    end)
end