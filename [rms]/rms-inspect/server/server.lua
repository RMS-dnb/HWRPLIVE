local RSGCore = exports['rsg-core']:GetCoreObject()



-----------------------------------------------------------------------


RSGCore.Commands.Add("inspect", Lang:t('label.inspect'), {}, false, function(source, args)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    
    if not Player then return end
    
    -- Check if player has oily rag item
    local hasOilyRag = Player.Functions.GetItemByName('oilyrag')
    
    if not hasOilyRag or hasOilyRag.amount <= 0 then
        TriggerClientEvent("bln_notify:send", src, {
            title = "~red~Missing item~e~",
            description = "You need an oily rag to inspect your weapon",
            icon = "warning",
            placement = "middle-right"
        })
        return
    end
    
    -- Remove one oily rag from inventory
    Player.Functions.RemoveItem('oilyrag', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items['oilyrag'], "remove")
    
    -- Trigger the weapon inspection
    TriggerClientEvent("rsg-weaponsmith:client:inspectweapon", src)
end)