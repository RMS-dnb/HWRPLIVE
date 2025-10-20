local RSGCore = exports['rsg-core']:GetCoreObject()

RegisterNetEvent('phils-mission:server:deliverItems', function(data)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end

   

   
    Player.Functions.AddMoney('cash', data.reward)

   

    TriggerClientEvent('ox_lib:notify', src, {
        title = Config.Texts.notifications.success.title,
        description = string.format(Config.Texts.notifications.success.completed, data.mission, data.reward),
        type = 'success'
    })
    TriggerClientEvent('phils-mission:client:deliverySuccess', src, data.mission)
end)