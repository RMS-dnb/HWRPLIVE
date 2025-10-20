local RSGCore = exports['rsg-core']:GetCoreObject()

-- Event to synchronize door state across all clients
RegisterNetEvent("RSGDoors:server:syncDoor")
AddEventHandler("RSGDoors:server:syncDoor", function(doorIndex)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    
    if Player then
        -- Log door interaction (optional)
        print(Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname .. " used a door key")
        
        -- Broadcast door state change to all players
        TriggerClientEvent("RSGDoors:client:rotateDoor", -1, doorIndex)
    end
end)

-- Add command to give keys to players (for admins only)
RSGCore.Commands.Add('givekey', 'Give a door key to a player (Admin Only)', {
    {name = 'id', help = 'Player ID'},
    {name = 'keytype', help = 'Key Type (door_key, trapdoor_key, mansion_key, ranch_key)'},
    {name = 'amount', help = 'Amount to give'}
}, true, function(source, args)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(tonumber(args[1]))
    local keyType = args[2]
    local amount = tonumber(args[3]) or 1
    
    local validKeys = {
        ['skeleton_key'] = true,
        ['mansion_key'] = true,
        ['forged_key'] = true,
        ['sawtooth_key'] = true
    }
    
    if Player then
        if validKeys[keyType] then
            -- Add the key to player's inventory
            Player.Functions.AddItem(keyType, amount)
            TriggerClientEvent('inventory:client:ItemBox', Player.PlayerData.source, RSGCore.Shared.Items[keyType], "add")
            TriggerClientEvent('RSGCore:Notify', src, "Gave " .. amount .. " " .. keyType .. " to " .. Player.PlayerData.charinfo.firstname, "success")
        else
            TriggerClientEvent('RSGCore:Notify', src, "Invalid key type", "error")
        end
    else
        TriggerClientEvent('RSGCore:Notify', src, "Player not found", "error")
    end
end, 'admin')

-- Optional: Add command to lock/unlock specific doors (useful for events or quests)
RSGCore.Commands.Add('doorcontrol', 'Enable or disable a door (Admin Only)', {
    {name = 'doorindex', help = 'Door Index (1-4)'},
    {name = 'state', help = 'open/close'}
}, true, function(source, args)
    local doorIndex = tonumber(args[1])
    local state = args[2]
    
    if doorIndex and doorIndex >= 1 and doorIndex <= 4 then
        if state == "open" or state == "close" then
            -- Just trigger the same event used for regular interaction
            TriggerClientEvent("RSGDoors:client:rotateDoor", -1, doorIndex)
            TriggerClientEvent('RSGCore:Notify', source, "Door " .. doorIndex .. " has been " .. state .. "d", "success")
        else
            TriggerClientEvent('RSGCore:Notify', source, "Invalid state. Use 'open' or 'close'", "error")
        end
    else
        TriggerClientEvent('RSGCore:Notify', source, "Door index must be between 1 and 4", "error")
    end
end, 'admin')

RegisterNetEvent("RSGDoors:server:removeKey", function(itemName)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if Player then
        Player.Functions.RemoveItem(itemName, 1)
        TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items[itemName], "remove")
    end
end)
