local RSGCore = exports['rsg-core']:GetCoreObject()

-- Track active robberies with cleanup system
local activeRobberies = {}
local robberyCleanupTimers = {}

-- Configuration
local ROBBERY_CHECK_INTERVAL = 30000 -- Check every 30 seconds instead of 5
local ROBBERY_TIMEOUT = 60000 -- Auto-cleanup after 60 seconds
local MAX_CONCURRENT_ROBBERIES = 50 -- Prevent memory issues

RegisterNetEvent('btc-roberyplayer:RobPlayer', function(targetId)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    
    -- Prevent too many concurrent robberies
    local activeCount = 0
    for _ in pairs(activeRobberies) do
        activeCount = activeCount + 1
    end
    
    if activeCount >= MAX_CONCURRENT_ROBBERIES then
        print("^3[Robbery] Too many active robberies, rejecting new one from " .. src)
        return
    end
    
    local player, distance = RSGCore.Functions.GetClosestPlayer(src)
    if player ~= -1 and distance < 2 then
        local SearchedPlayer = RSGCore.Functions.GetPlayer(tonumber(targetId or player))
        if not SearchedPlayer then return end
        
        -- Clean up any existing robbery for this robber
        if activeRobberies[src] then
            if robberyCleanupTimers[src] then
                -- Timer will clean itself up, just remove reference
                robberyCleanupTimers[src] = nil
            end
        end
        
        -- Store the victim's inventory before robbery (optimized)
        local victimInventoryBefore = {}
        local victimItems = SearchedPlayer.PlayerData.items
        
        if victimItems then
            for slot, item in pairs(victimItems) do
                if item and item.name and item.amount then
                    victimInventoryBefore[item.name] = (victimInventoryBefore[item.name] or 0) + item.amount
                end
            end
        end
        
        -- Store robbery information
        activeRobberies[src] = {
            timestamp = os.time(),
            robber = {
                id = src,
                name = Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname
            },
            victim = {
                id = tonumber(targetId or player),
                name = SearchedPlayer.PlayerData.charinfo.firstname .. ' ' .. SearchedPlayer.PlayerData.charinfo.lastname,
                inventoryBefore = victimInventoryBefore
            }
        }
        
        -- Set cleanup timer
        robberyCleanupTimers[src] = SetTimeout(ROBBERY_TIMEOUT, function()
            activeRobberies[src] = nil
            robberyCleanupTimers[src] = nil
        end)
        
        -- Log robbery initiation
        TriggerEvent('rsg-log:server:CreateLog', 'robbery', 'Robbery Started', 'orange', 
            string.format('%s (%s) started robbing %s (%s)', 
            activeRobberies[src].robber.name, src, activeRobberies[src].victim.name, targetId or player))
        
        -- Open inventory as normal
        exports['rsg-inventory']:OpenInventoryById(src, tonumber(targetId or player))
    end
end)

-- Optimized robbery completion checker
CreateThread(function()
    while true do
        Wait(ROBBERY_CHECK_INTERVAL)
        
        local currentTime = os.time()
        local toRemove = {}
        
        for robberId, robberyData in pairs(activeRobberies) do
            -- Skip if robbery is too old (backup cleanup)
            if currentTime - robberyData.timestamp > (ROBBERY_TIMEOUT / 1000) then
                table.insert(toRemove, robberId)
                goto continue
            end
            
            local robberPlayer = RSGCore.Functions.GetPlayer(tonumber(robberId))
            local victimPlayer = RSGCore.Functions.GetPlayer(tonumber(robberyData.victim.id))
            
            if not robberPlayer or not victimPlayer then
                -- Player disconnected, clean up
                table.insert(toRemove, robberId)
                goto continue
            end
            
            -- Get current victim inventory (optimized)
            local victimInventoryAfter = {}
            local victimItems = victimPlayer.PlayerData.items
            
            if victimItems then
                for slot, item in pairs(victimItems) do
                    if item and item.name and item.amount then
                        victimInventoryAfter[item.name] = (victimInventoryAfter[item.name] or 0) + item.amount
                    end
                end
            end
            
            -- Compare inventories efficiently
            local stolenItems = {}
            local hasStolen = false
            
            for itemName, amountBefore in pairs(robberyData.victim.inventoryBefore) do
                local amountAfter = victimInventoryAfter[itemName] or 0
                local amountStolen = amountBefore - amountAfter
                
                if amountStolen > 0 then
                    hasStolen = true
                    local itemInfo = RSGCore.Shared.Items[itemName]
                    local itemLabel = itemInfo and itemInfo.label or itemName
                    
                    table.insert(stolenItems, {
                        name = itemName,
                        label = itemLabel,
                        amount = amountStolen
                    })
                end
            end
            
            -- If items were stolen, log and cleanup
            if hasStolen then
                local stolenItemsText = {}
                for _, item in ipairs(stolenItems) do
                    table.insert(stolenItemsText, item.amount .. "x " .. item.label)
                end
                
                -- Log the robbery with stolen items
                TriggerEvent('rsg-log:server:CreateLog', 'robbery', 'Items Stolen', 'red', 
                    string.format('%s (%s) stole from %s (%s) - Stolen: %s', 
                    robberyData.robber.name, 
                    robberId, 
                    robberyData.victim.name, 
                    robberyData.victim.id, 
                    table.concat(stolenItemsText, ", ")))
                
                table.insert(toRemove, robberId)
            end
            
            ::continue::
        end
        
        -- Clean up completed/expired robberies
        for _, robberId in ipairs(toRemove) do
            robberyCleanupTimers[robberId] = nil
            activeRobberies[robberId] = nil
        end
        
        -- Debug: Print active robberies count if > 0
        local count = 0
        for _ in pairs(activeRobberies) do count = count + 1 end
        if count > 0 then
            print("^2[Robbery] Active robberies: " .. count)
        end
    end
end)

-- Clean up on inventory close
RegisterNetEvent('inventory:server:CloseInventory', function()
    local src = source
    
    if activeRobberies[src] then
        -- Keep tracking for a bit longer to detect item changes
        -- The main cleanup thread will handle it
    end
end)

-- Clean up on player disconnect
AddEventHandler('playerDropped', function()
    local src = source
    if activeRobberies[src] then
        robberyCleanupTimers[src] = nil
        activeRobberies[src] = nil
    end
    
    -- Also clean up if this player was a victim
    for robberId, robberyData in pairs(activeRobberies) do
        if robberyData.victim.id == tonumber(src) then
            robberyCleanupTimers[robberId] = nil
            activeRobberies[robberId] = nil
        end
    end
end)