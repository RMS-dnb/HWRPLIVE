local RSGCore = exports['rsg-core']:GetCoreObject()

-- Register usable item
RSGCore.Functions.CreateUseableItem(Config.Axe, function(source, item)
    local _source = source
    local meta = item.info -- RSG uses 'info' instead of 'metadata'
    TriggerClientEvent('inventory:client:CloseInventory', _source)
    TriggerClientEvent("BGS_Lumber:AttachAxe", _source, meta)
end)

-- Axe check event
RegisterServerEvent("BGS_Lumber:axecheck")
AddEventHandler("BGS_Lumber:axecheck", function(metadata)
    local _source = source
    if _source then
        local Player = RSGCore.Functions.GetPlayer(_source)
        if Player then
            local axeItem = Player.Functions.GetItemByName(Config.Axe)
            
            -- Handle durability
            if axeItem then
                -- RSG uses 'info' for metadata, and we need to check if it exists
                if not axeItem.info then axeItem.info = {} end
                
                -- Get current durability or set default
                local currentDurability = axeItem.info.durability or 100
                local durability = currentDurability - Config.AxeDamage
                
                -- Remove the current axe
                Player.Functions.RemoveItem(Config.Axe, 1)
                TriggerClientEvent('inventory:client:ItemBox', _source, RSGCore.Shared.Items[Config.Axe], "remove")
                
                -- Check if axe is broken
                if durability <= 0 then
                    TriggerClientEvent("BGS_Lumber:axechecked", _source, metadata, true)
                else
                    -- Add axe back with updated durability using RSG's info system
                    local info = {
                        durability = durability
                    }
                    
                    Player.Functions.AddItem(Config.Axe, 1, false, info)
                    TriggerClientEvent('inventory:client:ItemBox', _source, RSGCore.Shared.Items[Config.Axe], "add")
                    TriggerClientEvent("BGS_Lumber:axechecked", _source, info, false)
                end
            end
        end
    end
end)

-- Count check event
RegisterServerEvent("BGS_Lumber:CountCheck")
AddEventHandler("BGS_Lumber:CountCheck", function()
    local _source = source
    if _source then
        local Player = RSGCore.Functions.GetPlayer(_source)
        if Player then
            local axeItem = Player.Functions.GetItemByName(Config.Axe)
            if not axeItem then
                TriggerClientEvent("BGS_Lumber:RemoveAxe", _source)
            end
        end
    end
end)

-- Helper functions
local function keysx(table)
    local keys = 0
    for k,v in pairs(table) do
       keys = keys + 1
    end
    return keys
end

local function shuffle(tbl)
    for i = #tbl, 2, -1 do
        local j = math.random(i)
        tbl[i], tbl[j] = tbl[j], tbl[i]
    end
    return tbl
end

-- Create a delayed notification function
function SendDelayedNotification(source, type, message, delay)
    local _delay = delay or 2000 -- default 2 second delay
    SetTimeout(_delay, function()
        TriggerClientEvent('ox_lib:notify', source, {
            type = type,
            description = message,
            duration = 3500 -- standard duration
        })
    end)
end

-- Add item event
RegisterServerEvent('BGS_Lumber:addItem')
AddEventHandler('BGS_Lumber:addItem', function(cutSpot)
    local _source = source
    local Player = RSGCore.Functions.GetPlayer(_source)
    
    if not Player then return end
    
    local chance = math.random(1,10)
    local itemTable = Config.Items
    if cutSpot then
        itemTable = shuffle(cutSpot.items)
    end
    
    local reward = {}
    for k,v in pairs(itemTable) do
        if v.chance >= chance then
            table.insert(reward,v)
        end
    end
    
    if reward and #reward < 1 then
        -- Delayed notification with 2 second delay
        SendDelayedNotification(_source, 'error', 'You found nothing', 2000)
        return
    end
    
    local chance2 = math.random(1,keysx(reward))
    local count = math.random(1,reward[chance2].amount)
    
    -- Check if player can carry the item
    if Player.Functions.AddItem(reward[chance2].name, count) then
        TriggerClientEvent('inventory:client:ItemBox', _source, RSGCore.Shared.Items[reward[chance2].name], "add")
        -- Delayed notification with 2 second delay
        SendDelayedNotification(_source, 'success', 'You found '..count..' '..reward[chance2].label, 500)
    else
        -- Delayed notification with 2 second delay
        SendDelayedNotification(_source, 'error', "You can't carry any more "..reward[chance2].label, 500)
    end
end)