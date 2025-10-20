local RSGCore = exports['rsg-core']:GetCoreObject()
local headMask = false

local getPlayer = nil

RegisterNetEvent("nc-headbag:getClosestPlayer", function(closestPlayer)
    getPlayer = closestPlayer
    local name = GetPlayerName(getPlayer)
    TriggerClientEvent("StartThread", getPlayer)
end)

RegisterNetEvent("nc-headbag:getClosestPlayer2", function(closestPlayer)
    getPlayer = closestPlayer
    local name = GetPlayerName(getPlayer)
    TriggerClientEvent("RemoveHeadBag", getPlayer)
end)

RSGCore.Functions.CreateUseableItem(Config.Item, function(source, item)
    local Player = RSGCore.Functions.GetPlayer(source)
    if not Player then return end

    -- Remove the item from player inventory
    Player.Functions.RemoveItem(Config.Item, 1)
    TriggerClientEvent('ox_lib:notify', source, {
        title = 'Item Used',
        description = 'You used a ' .. Config.Item,
        type = 'inform'
    })

    -- Trigger client to start headbag logic
    TriggerClientEvent("CheckThread", source)
    headMask = true
end)

RegisterNetEvent("nc-headbag:givebagback", function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end

    Player.Functions.AddItem(Config.Item, 1)
    TriggerClientEvent('ox_lib:notify', src, {
        title = 'Item Returned',
        description = 'You got your ' .. Config.Item .. ' back',
        type = 'success'
    })
end)
