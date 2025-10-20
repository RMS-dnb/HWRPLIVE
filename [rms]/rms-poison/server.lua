local RSGCore = exports['rsg-core']:GetCoreObject()

RSGCore.Functions.CreateUseableItem("antipoison", function(source, item)
    local Player = RSGCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 1, item.slot) then
        TriggerClientEvent("RMS_Poison:UseAntidote", source, item.name) 
        TriggerClientEvent('rNotify:NotifyLeft', source, "You Have Taken Snake Anti Venom", "You are feeling better", "generic_textures", "tick", 10000)
    end
end)