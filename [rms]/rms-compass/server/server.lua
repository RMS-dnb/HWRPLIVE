local RSGCore = exports['rsg-core']:GetCoreObject()

RSGCore.Functions.CreateUseableItem("compass", function(source)
    TriggerClientEvent("rsg-compass:toggleCompass", source)
end)