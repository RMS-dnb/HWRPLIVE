local RSGCore = exports['rsg-core']:GetCoreObject()

RegisterNetEvent('rex-drugrunner:server:ProcessWeed', function(amount)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    amount = tonumber(amount) or 1

    local item = Player.Functions.GetItemByName('weed')
    if not item or item.amount < amount then
        TriggerClientEvent('RSGCore:Notify', src, 'Not enough WEED to process', 'error')
        return
    end

    Player.Functions.RemoveItem('weed', amount)
    TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items['weed'], 'remove', amount)

    local totalYield = 0
    for i = 1, amount do
        if item.info and item.info.quality then
            totalYield = totalYield + math.floor(item.info.quality / 5)
        else
            totalYield = totalYield + 1
        end
    end

    Player.Functions.AddItem('dryweed', totalYield)
    TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items['dryweed'], 'add', totalYield)

    TriggerClientEvent('ox_lib:notify', src, {
        title = 'Processing Complete',
        description = 'Used ' .. amount .. 'x WEED and received ' .. totalYield .. 'x DRYWEED',
        type = 'success'
    })
end)
