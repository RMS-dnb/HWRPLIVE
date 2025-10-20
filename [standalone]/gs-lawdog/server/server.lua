local RSGCore = exports['rsg-core']:GetCoreObject()

-- Register usable item
RSGCore.Functions.CreateUseableItem(Config.ItemName, function(source, item)
    local src = source
    TriggerClientEvent('attackdog:client:useCollar', src)
end)

-- Server callback to check for items on target player
RSGCore.Functions.CreateCallback('attackdog:server:getItems', function(source, cb, targetId)
    if not source or not targetId then 
        cb(false)
        return 
    end

    local target = tonumber(targetId)
    if not target then 
        cb(false)
        return 
    end

    -- Check for blocker items first
    for _, blockerItem in ipairs(Config.SentBlockers) do
        local hasBlocker = exports['rsg-inventory']:GetItemByName(target, blockerItem)
        if hasBlocker and hasBlocker.amount > 0 then
            local chance = math.random(1, 100)
            if chance <= Config.SentBLockerChance then
                cb(false) -- Blocker worked, dog finds nothing
                return
            end
        end
    end

    -- Check for search items
    for _, itemName in ipairs(Config.SearchItems) do
        local hasItem = exports['rsg-inventory']:GetItemByName(target, itemName)
        if hasItem and hasItem.amount > 0 then
            cb(true) -- Found contraband
            return
        end
    end

    cb(false) -- Nothing found
end)

-- Check players in range and filter by job
RegisterServerEvent('attackdog:server:checkPlayers', function(playersInRange, clientEventName)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then 
        TriggerClientEvent(clientEventName, src, {}) 
        return 
    end

    local results = {}

    for _, player in pairs(playersInRange) do
        local targetId = tonumber(player.playerId)
        local TargetPlayer = RSGCore.Functions.GetPlayer(targetId)
        if TargetPlayer then
            local job = TargetPlayer.PlayerData.job.name
            local allowed = false

            -- Check if target has approved job
            for _, approvedJob in ipairs(Config.ApprovedJobs) do
                if job == approvedJob then
                    allowed = true
                    break
                end
            end

            -- Only add non-law enforcement to results
            if not allowed then
                table.insert(results, player)
            end
        end
    end

    TriggerClientEvent(clientEventName, src, results)
end)

-- Handle dog attacking player
RegisterNetEvent('attackdog:server:attackPlayer', function(dogNetId, targetServerId)
    if targetServerId then
        TriggerClientEvent('attackdog:client:attackPlayer', targetServerId, dogNetId)
    end
end)

-- Check if player has authorized job to use dog
RegisterNetEvent('attackdog:server:checkJob', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end

    local job = Player.PlayerData.job.name
    local authorized = false

    for _, allowedJob in ipairs(Config.ApprovedJobs) do
        if job == allowedJob then
            authorized = true
            break
        end
    end

    if authorized then
        TriggerClientEvent('attackdog:client:openMenu', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Access Denied',
            description = 'You are not authorized to use this item',
            type = 'error'
        })
    end
end)

-- Add player loaded event to ensure core is ready
AddEventHandler('RSGCore:Server:PlayerLoaded', function(Player)
    -- Player loaded, core is ready
end)
