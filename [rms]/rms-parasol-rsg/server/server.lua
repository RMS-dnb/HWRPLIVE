local RSGCore = exports['rsg-core']:GetCoreObject()

RSGCore.Functions.CreateUseableItem("parasol", function(source, item)
    local Player = RSGCore.Functions.GetPlayer(source)
    TriggerClientEvent('ricx_parasol:start', source, item.name)
    --TriggerClientEvent("ricx_parasol:start", src, item.name)
end)