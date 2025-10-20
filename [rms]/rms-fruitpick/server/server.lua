local RSGCore = exports['rsg-core']:GetCoreObject()

RegisterServerEvent("rms_herbs:GiveReward")
AddEventHandler("rms_herbs:GiveReward", function(destination, rewardAmount)
    local _source = source
    local Player = RSGCore.Functions.GetPlayer(_source)
    local coords = GetEntityCoords(GetPlayerPed(_source))
    local dist = #(coords - destination.coords)

    if dist <= 2.5 then
        Player.Functions.AddItem(destination.reward, rewardAmount)
        TriggerClientEvent('RSGCore:Notify', _source, "You got "..rewardAmount.."x "..destination.name, 'success')
    else
        TriggerClientEvent('RSGCore:Notify', _source, "You are too far away", 'error')
    end
end)
