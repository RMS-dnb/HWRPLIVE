-- RSGCore implementation of the gold smelting script
local RSGCore = exports['rsg-core']:GetCoreObject()

-- Register usable item for the furnace
RSGCore.Functions.CreateUseableItem(Config.itemsfurnace, function(source)
    local Player = RSGCore.Functions.GetPlayer(source)
    if Player then
        TriggerClientEvent('hawk_goldsmelt:placefurnace', source)
    end
end)

-- Callback to check if player has enough gold nuggets
RSGCore.Functions.CreateCallback('hawk_goldsmelt:checkitems', function(source, cb, count)
    local Player = RSGCore.Functions.GetPlayer(source)
    if Player then
        local item = Player.Functions.GetItemByName(Config.itemsgoldnuget)
        if item and item.amount >= count then
            Player.Functions.RemoveItem(Config.itemsgoldnuget, count)
            TriggerClientEvent('inventory:client:ItemBox', source, RSGCore.Shared.Items[Config.itemsgoldnuget], "remove", count)
            cb(true)
        else
            cb(false)
        end
    else
        cb(false)
    end
end)

-- Remove furnace item from player inventory
RegisterServerEvent('hawk_goldsmelt:removeitem_furnace')
AddEventHandler('hawk_goldsmelt:removeitem_furnace', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if Player then
        Player.Functions.RemoveItem(Config.itemsfurnace, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items[Config.itemsfurnace], "remove", 1)
    end
end)

-- Add furnace item to player inventory
RegisterServerEvent('hawk_goldsmelt:additem_furnace')
AddEventHandler('hawk_goldsmelt:additem_furnace', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if Player then
        Player.Functions.AddItem(Config.itemsfurnace, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items[Config.itemsfurnace], "add", 1)
    end
end)

-- Return gold nuggets to player
RegisterServerEvent('hawk_goldsmelt:returnitems')
AddEventHandler('hawk_goldsmelt:returnitems', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if Player then
        Player.Functions.AddItem(Config.itemsgoldnuget, Config.itemsgoldamount)
        TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items[Config.itemsgoldnuget], "add", Config.itemsgoldamount)
    end
end)

-- Add items to player inventory with weight checks
RegisterServerEvent('hawk_goldsmelt:additems')
AddEventHandler('hawk_goldsmelt:additems', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if Player then
        local itemName = Config.reciveitem
        local itemCount = Config.reciveitemamount
        
        -- Check if player can carry the item
        if Player.Functions.AddItem(itemName, itemCount) then
            TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items[itemName], "add", itemCount)
            TriggerClientEvent('RSGCore:Notify', src, "Received: " .. itemName .. " x" .. itemCount, 'success')
        else
            TriggerClientEvent('RSGCore:Notify', src, "Your inventory is full!", 'error')
        end
    end
end)