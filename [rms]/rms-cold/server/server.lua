local RSGCore = exports['rsg-core']:GetCoreObject()

RSGCore.Functions.CreateUseableItem("cold_medicine", function(source)
    local src = source
    TriggerClientEvent('rsg-cold:cure', src)  
end)

RSGCore.Functions.CreateUseableItem("bonebroth", function(source)
    local src = source
    TriggerClientEvent('rsg-cold:cure1', src)  
end)

RSGCore.Functions.CreateUseableItem("onionsyrup", function(source)
    local src = source
    TriggerClientEvent('rsg-cold:cure2', src)  
end)

RegisterNetEvent('rsg-cold:removemedicine')
AddEventHandler('rsg-cold:removemedicine', function()
    local source = source
    local player = RSGCore.Functions.GetPlayer(source)
    player.Functions.RemoveItem('cold_medicine', 1)
    TriggerClientEvent("inventory:client:ItemBox", RSGCore.Shared.Items["cold_medicine"], "remove")
end)

RegisterNetEvent('rsg-cold:removemedicine1')
AddEventHandler('rsg-cold:removemedicine', function()
    local source = source
    local player = RSGCore.Functions.GetPlayer(source)
    player.Functions.RemoveItem('bonebroth', 1)
    TriggerClientEvent("inventory:client:ItemBox", RSGCore.Shared.Items["bonebroth"], "remove")
end)

RegisterNetEvent('rsg-cold:removemedicine2')
AddEventHandler('rsg-cold:removemedicine', function()
    local source = source
    local player = RSGCore.Functions.GetPlayer(source)
    player.Functions.RemoveItem('onionsyrup', 1)
    TriggerClientEvent("inventory:client:ItemBox", RSGCore.Shared.Items["onionsyrup"], "remove")
end)

RegisterServerEvent('rsg-cold:spreadPlayer')
AddEventHandler('rsg-cold:spreadPlayer', function(closestPlayer)
    source = closestPlayer
    TriggerClientEvent('rsg-cold:spread', source) -- Triggering the 'rsg-cold:spread' event on the target player's client-side
end)


