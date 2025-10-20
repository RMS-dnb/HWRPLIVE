local RSGCore = exports['rsg-core']:GetCoreObject()

-- Item configuration (kept for validation, but prices now come from client)
local itemConfig = {
    weedjoint = {
        minPrice = 1,
        maxPrice = 3,
        label = "joint",
        category = "contraband"
    },
    moonshine = {
        minPrice = 2,
        maxPrice = 5,
        label = "moonshine",
        category = "alcohol"
    },
    cigarettes = {
        minPrice = 1,
        maxPrice = 2,
        label = "cigarettes",
        category = "tobacco"
    }
}

-- Anti-exploit: Price validation ranges (INCREASED RANGES)
local priceValidation = {
    weedjoint = { min = 1, max = 100 },   -- Increased to allow for zone bonuses/multipliers
    moonshine = { min = 1, max = 100 },   -- Increased to allow for zone bonuses/multipliers
    cigarettes = { min = 1, max = 10 }   -- Increased to allow for zone bonuses/multipliers
}

-- Player selling tracking for anti-exploit
local playerSellTracking = {}
local MAX_SELLS_PER_MINUTE = 3
local TRACKING_WINDOW = 60000 -- 1 minute

-- Enhanced sell event with price validation
RegisterServerEvent('PhilSellToNPC:SellItem')
AddEventHandler('PhilSellToNPC:SellItem', function(itemName, proposedPrice)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    
    if not Player then 
        print("PhilSellToNPC: Player not found for source " .. src)
        return 
    end
    
    -- DEBUG: Print the proposed price for troubleshooting
    print("PhilSellToNPC DEBUG: Item=" .. itemName .. ", ProposedPrice=" .. tostring(proposedPrice))---remove me if needed
    
    -- Validate item configuration
    local config = itemConfig[itemName]
    if not config then
        print("PhilSellToNPC: Invalid item " .. itemName .. " from player " .. src)
        TriggerClientEvent('ox_lib:notify', src, {
            type = 'error',
            description = 'Invalid item',
            duration = 3000
        })
        return
    end
    
    -- Validate proposed price (anti-exploit)
    local validation = priceValidation[itemName]
    if not validation then
        print("PhilSellToNPC: No validation config for " .. itemName)
        TriggerClientEvent('ox_lib:notify', src, {
            type = 'error',
            description = 'Item not configured for selling',
            duration = 3000
        })
        return
    end
    
    -- Check if proposedPrice is a valid number
    if type(proposedPrice) ~= "number" or proposedPrice <= 0 then
        print("PhilSellToNPC: Invalid price type or value: " .. tostring(proposedPrice) .. " from player " .. src)
        TriggerClientEvent('ox_lib:notify', src, {
            type = 'error',
            description = 'Invalid price format',
            duration = 3000
        })
        return
    end
    
    -- Check price range
    if proposedPrice < validation.min or proposedPrice > validation.max then
        print("PhilSellToNPC: Price " .. proposedPrice .. " outside valid range (" .. validation.min .. "-" .. validation.max .. ") for " .. itemName .. " from player " .. src)
        TriggerClientEvent('ox_lib:notify', src, {
            type = 'error',
            description = 'Price validation failed. Range: $' .. validation.min .. '-$' .. validation.max,
            duration = 3000
        })
        return
    end
    
    -- Anti-exploit: Check selling frequency
    local currentTime = GetGameTimer()
    local playerIdentifier = Player.PlayerData.citizenid
    
    if not playerSellTracking[playerIdentifier] then
        playerSellTracking[playerIdentifier] = {}
    end
    
    -- Clean old entries
    local playerTracks = playerSellTracking[playerIdentifier]
    for i = #playerTracks, 1, -1 do
        if currentTime - playerTracks[i] > TRACKING_WINDOW then
            table.remove(playerTracks, i)
        end
    end
    
    -- Check if player is selling too frequently
    if #playerTracks >= MAX_SELLS_PER_MINUTE then
        print("PhilSellToNPC: Player " .. src .. " selling too frequently")
        TriggerClientEvent('ox_lib:notify', src, {
            type = 'error',
            description = 'You\'re selling too quickly. Take a break.',
            duration = 5000
        })
        return
    end
    
    -- Add current sell to tracking
    table.insert(playerTracks, currentTime)
    
    -- Determine amount to sell (1-2 items randomly, but respect inventory)
    local AmountToSell = math.random(1, 2)
    
    -- Check if player has the item
    local itemData = Player.Functions.GetItemByName(itemName)
    
    if not itemData then
        TriggerClientEvent('ox_lib:notify', src, {
            type = 'error',
            description = 'You don\'t have any ' .. config.label .. ' to sell',
            duration = 3000
        })
        return
    end
    
    local itemCount = itemData.amount
    
    if itemCount >= 1 then
        local amountToRemove = math.min(itemCount, AmountToSell)
        local success = Player.Functions.RemoveItem(itemName, amountToRemove)
        
        if success then
            -- Use the price calculated by client (already validated above)
            local totalPayment = proposedPrice * amountToRemove
            
            -- Add money to player
            Player.Functions.AddMoney('bloodmoney', totalPayment)
            
            -- Success notification
            TriggerClientEvent('ox_lib:notify', src, {
                type = 'success',
                description = 'You sold ' .. amountToRemove .. ' ' .. config.label .. ' for $' .. totalPayment,
                duration = 4000
            })
            
            -- Trigger inventory update
            TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items[itemName], "remove")
            
            -- Log the transaction (optional, for admin monitoring)
            print("PhilSellToNPC: Player " .. Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname .. 
                  " sold " .. amountToRemove .. " " .. itemName .. " for $" .. totalPayment)
            
        else
            -- Failed to remove item (shouldn't happen, but safety check)
            TriggerClientEvent('ox_lib:notify', src, {
                type = 'error',
                description = 'Failed to complete transaction',
                duration = 3000
            })
            print("PhilSellToNPC: Failed to remove item " .. itemName .. " from player " .. src)
        end
    else
        TriggerClientEvent('ox_lib:notify', src, {
            type = 'error',
            description = 'You don\'t have enough ' .. config.label,
            duration = 3000
        })
    end
end)

-- Alternative: Disable price validation entirely (for testing)
RegisterServerEvent('PhilSellToNPC:SellItemNoValidation')
AddEventHandler('PhilSellToNPC:SellItemNoValidation', function(itemName, proposedPrice)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    
    if not Player then return end
    
    -- Validate item configuration
    local config = itemConfig[itemName]
    if not config then
        TriggerClientEvent('ox_lib:notify', src, {
            type = 'error',
            description = 'Invalid item',
            duration = 3000
        })
        return
    end
    
    -- Simple sanity check - just ensure it's a positive number
    if type(proposedPrice) ~= "number" or proposedPrice <= 0 or proposedPrice > 1000 then
        TriggerClientEvent('ox_lib:notify', src, {
            type = 'error',
            description = 'Invalid price',
            duration = 3000
        })
        return
    end
    
    -- Rest of the selling logic...
    local itemData = Player.Functions.GetItemByName(itemName)
    if not itemData then
        TriggerClientEvent('ox_lib:notify', src, {
            type = 'error',
            description = 'You don\'t have any ' .. config.label .. ' to sell',
            duration = 3000
        })
        return
    end
    
    local AmountToSell = math.random(1, 2)
    local itemCount = itemData.amount
    
    if itemCount >= 1 then
        local amountToRemove = math.min(itemCount, AmountToSell)
        local success = Player.Functions.RemoveItem(itemName, amountToRemove)
        
        if success then
            local totalPayment = proposedPrice * amountToRemove
            Player.Functions.AddMoney('bloodmoney', totalPayment)
            
            TriggerClientEvent('ox_lib:notify', src, {
                type = 'success',
                description = 'You sold ' .. amountToRemove .. ' ' .. config.label .. ' for $' .. totalPayment,
                duration = 4000
            })
            
            TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items[itemName], "remove")
        end
    end
end)

-- Rest of your existing code...
RegisterCommand('checksells', function(source, args)
    local Player = RSGCore.Functions.GetPlayer(source)
    if not Player then return end
    
    -- Check if player has admin permissions
    if not RSGCore.Functions.HasPermission(source, 'admin') then
        TriggerClientEvent('ox_lib:notify', source, {
            type = 'error',
            description = 'You don\'t have permission to use this command',
            duration = 3000
        })
        return
    end
    
    if #args < 1 then
        TriggerClientEvent('ox_lib:notify', source, {
            type = 'error',
            description = 'Usage: /checksells [player_id]',
            duration = 3000
        })
        return
    end
    
    local targetId = tonumber(args[1])
    local targetPlayer = RSGCore.Functions.GetPlayer(targetId)
    
    if not targetPlayer then
        TriggerClientEvent('ox_lib:notify', source, {
            type = 'error',
            description = 'Player not found',
            duration = 3000
        })
        return
    end
    
    local citizenId = targetPlayer.PlayerData.citizenid
    local trackData = playerSellTracking[citizenId]
    
    if trackData and #trackData > 0 then
        local recentSells = #trackData
        TriggerClientEvent('ox_lib:notify', source, {
            type = 'inform',
            description = 'Player has made ' .. recentSells .. ' sales in the last minute',
            duration = 5000
        })
    else
        TriggerClientEvent('ox_lib:notify', source, {
            type = 'inform',
            description = 'No recent sales found for this player',
            duration = 3000
        })
    end
end)

-- Clean up old sell tracking data periodically
CreateThread(function()
    while true do
        Wait(300000) -- Every 5 minutes
        local currentTime = GetGameTimer()
        
        for citizenId, tracks in pairs(playerSellTracking) do
            for i = #tracks, 1, -1 do
                if currentTime - tracks[i] > TRACKING_WINDOW * 2 then -- Keep data for 2 minutes
                    table.remove(tracks, i)
                end
            end
            
            -- Remove empty tracking entries
            if #tracks == 0 then
                playerSellTracking[citizenId] = nil
            end
        end
    end
end)

-- Server-side zone validation (additional security layer)
local function ValidateZoneTransaction(source, itemName)
    -- This could be enhanced to do server-side zone checking
    -- For now, we trust the client but could add coordinates validation
    return true
end

-- Event to handle law alerts from selling (if you want server-side alert management)
RegisterServerEvent('PhilSellToNPC:TriggerLawAlert')
AddEventHandler('PhilSellToNPC:TriggerLawAlert', function(message, coords)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    
    if not Player then return end
    
    -- Validate coordinates are near player (anti-cheat)
    local playerCoords = GetEntityCoords(GetPlayerPed(src))
    local distance = #(vector3(coords.x, coords.y, coords.z) - playerCoords)
    
    if distance > 50.0 then -- Player too far from reported coordinates
        print("PhilSellToNPC: Suspicious law alert from player " .. src .. " - distance: " .. distance)
        return
    end
    
    -- Trigger the law alert
    TriggerEvent('rsg-lawman:server:lawmanAlert', message, coords)
    TriggerEvent('rsg-tips:server:addCriminalActivity', "Illegal trading", Player.PlayerData.citizenid, coords)
end)