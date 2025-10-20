-- Server.lua for RSGCore Mining Script

-- Initialize RSGCore
local RSGCore = exports['rsg-core']:GetCoreObject()

-- Register usable pickaxe item
RSGCore.Functions.CreateUseableItem(Config.Pickaxe, function(source, item)
    local Player = RSGCore.Functions.GetPlayer(source)
    if not Player then return end
    
    -- Close inventory (using RSGCore equivalent)
    TriggerClientEvent("inventory:client:CloseInventory", source)
    TriggerClientEvent("BGS_Mining:AttachPickaxe", source, item.metadata)
end)

-- Check pickaxe durability and handle it
RegisterServerEvent("BGS_Mining:pickaxecheck")
AddEventHandler("BGS_Mining:pickaxecheck", function(metadata)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    
    local meta = metadata
    local hasItem = Player.Functions.GetItemByName(Config.Pickaxe)
    
    if not hasItem then 
        TriggerClientEvent("BGS_Mining:RemovePickaxe", src)
        return 
    end
    
    -- Find the pickaxe with matching metadata if any
    local itemSlot
    local playerItems = Player.PlayerData.items
    for slot, item in pairs(playerItems) do
        if item and item.name == Config.Pickaxe then
            -- Check if metadata matches or use any pickaxe if metadata not specified
            if not metadata or (item.info and compareMetadata(item.info, metadata)) then
                itemSlot = slot
                meta = item.info or {}
                break
            end
        end
    end
    
    -- Handle durability
    if not meta.durability then
        local durability = 100 - Config.PickaxeDamage
        
        -- Remove old pickaxe and add new one with durability
        if Player.Functions.RemoveItem(Config.Pickaxe, 1) then
            Player.Functions.AddItem(Config.Pickaxe, 1, itemSlot, {
                durability = durability
            })
            
            TriggerClientEvent("BGS_Mining:pickaxechecked", src, {
                durability = durability
            }, false)
        end
    else
        local durability = meta.durability - Config.PickaxeDamage
        
        -- Remove old pickaxe
        if Player.Functions.RemoveItem(Config.Pickaxe, 1, itemSlot) then
            if durability <= 0 then
                -- Pickaxe broke
                TriggerClientEvent("BGS_Mining:pickaxechecked", src, meta, true)
            else
                -- Add pickaxe with reduced durability
                Player.Functions.AddItem(Config.Pickaxe, 1, itemSlot, {
                    durability = durability
                })
                
                TriggerClientEvent("BGS_Mining:pickaxechecked", src, {
                    durability = durability
                }, false)
            end
        end
    end
end)

-- Helper function to compare metadata tables
function compareMetadata(meta1, meta2)
    if meta1.durability == meta2.durability then
        return true
    end
    return false
end

RegisterServerEvent("BGS_Mining:CountCheck")
AddEventHandler("BGS_Mining:CountCheck", function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    
    if Player then
        local hasItem = Player.Functions.GetItemByName(Config.Pickaxe)
        if not hasItem then
            TriggerClientEvent("BGS_Mining:RemovePickaxe", src)
        end
    end
end)

local function keysx(table)
    local keys = 0
    for k, v in pairs(table) do
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

RegisterServerEvent('BGS_Mining:addItem')
AddEventHandler('BGS_Mining:addItem', function(mineSpot)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end

    local chance = math.random(1, 10)
    local itemTable = shuffle(mineSpot.items)
    local reward = {}

    for k, v in pairs(itemTable) do
        if v.chance >= chance then
            table.insert(reward, v)
        end
    end

    if reward and #reward < 1 then
        -- Delay 2 seconds before notifying they found nothing
        SetTimeout(500, function()
            TriggerClientEvent('ox_lib:notify', src, {
                title = 'Mining',
                description = 'You found nothing',
                type = 'error',
                duration = 2000
            })
        end)
        return
    end

    local chance2 = math.random(1, keysx(reward))
    local count = math.random(1, reward[chance2].amount)

    -- Check if player can carry the item
    if Player.Functions.AddItem(reward[chance2].name, count) then
        SetTimeout(500, function()
            TriggerClientEvent('ox_lib:notify', src, {
                title = 'Mining',
                description = 'You found ' .. count .. 'x ' .. reward[chance2].label,
                type = 'success',
                duration = 500
            })
        end)
    else
        SetTimeout(2000, function()
            TriggerClientEvent('ox_lib:notify', src, {
                title = 'Mining',
                description = 'You can\'t carry any more ' .. reward[chance2].label,
                type = 'error',
                duration = 3000
            })
        end)
    end
end)