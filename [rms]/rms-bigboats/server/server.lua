local RSGCore = exports['rsg-core']:GetCoreObject()

-- Buy New Boats
RegisterServerEvent('sm-boats:BuyBoat')
AddEventHandler('sm-boats:BuyBoat', function(buyData, location)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local citizenId = Player.PlayerData.citizenid
    local name = buyData.boatName
    local model = buyData.boatModel
    local buyPrice = buyData.buyPrice
    local money = Player.PlayerData.money.cash
    if money >= buyPrice then
        Player.Functions.RemoveMoney('cash', buyPrice)
        jo.notif.right(src, _U("bought") .. name .. _U("frcash") .. buyPrice, 'inventory_items', 'generic_exotic_order', 'color_white', 5000)

        MySQL.Async.execute('INSERT INTO player_boats (citizenid, name, model, location) VALUES (@citizenid, @name, @model, @location)', {
            ['@citizenid'] = citizenId,
            ['@name'] = name,
            ['@model'] = model,
            ['@location'] = location
        })
    else
        jo.notif.right(src, _U("shortCash"), 'inventory_items', 'generic_exotic_order', 'color_white', 5000)
    end
end)

-- Get List of Owned Boats
RegisterServerEvent('sm-boats:GetOwnedBoats')
AddEventHandler('sm-boats:GetOwnedBoats', function(location, shopId)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local citizenId = Player.PlayerData.citizenid

    local result = MySQL.query.await('SELECT * FROM player_boats WHERE citizenid = @citizenid AND location = @location', {
        ['@citizenid'] = citizenId,
        ['@location'] = location
    })
    if result[1] then
        TriggerClientEvent("sm-boats:OwnedBoatsMenu", src, result, shopId)
    else
        jo.notif.right(src, _U("noBoats"), 'inventory_items', 'generic_exotic_order', 'color_white', 5000)
    end
end)

-- Sell Owned Boats
RegisterServerEvent('sm-boats:SellBoat')
AddEventHandler('sm-boats:SellBoat', function(ownedData, boatData)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local citizenId = Player.PlayerData.citizenid
    local name = ownedData.name
    local model = ownedData.model
    local location = ownedData.location
    local sellPrice = boatData.sellPrice

    Player.Functions.AddMoney('cash', sellPrice)
        jo.notif.right(src, _U("sold") .. name .. _U("frcash") .. sellPrice, 'inventory_items', 'generic_exotic_order', 'color_white', 5000)

    MySQL.Async.execute('DELETE FROM player_boats WHERE citizenid = @citizenid AND location = @location AND name = @name AND model = @model LIMIT 1', {
        ['@citizenid'] = citizenId,
        ['@location'] = location,
        ['@name'] = name,
        ['@model'] = model
    })
end)

-- Transfer Owned Boats Between Shops
RegisterServerEvent('sm-boats:TransferBoat')
AddEventHandler('sm-boats:TransferBoat', function(ownedData, transferLocation, transferMode, boatData, shopName)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local citizenId = Player.PlayerData.citizenid
    local name = ownedData.name
    local model = ownedData.model
    local location = ownedData.location

    if transferMode == "menuTransfer" then
        local transferPrice = boatData.transferPrice
        local money = Player.PlayerData.money.cash
        if money >= transferPrice then
            Player.Functions.RemoveMoney('cash', transferPrice)
            jo.notif.right(src, _U("transferred") .. name .. _U("to") .. shopName .. _U("frcash") .. transferPrice, 'inventory_items', 'generic_exotic_order', 'color_white', 5000)

            MySQL.Async.execute('UPDATE player_boats SET location = @transferLocation WHERE citizenid = @citizenid AND location = @location AND name = @name AND model = @model LIMIT 1', {
                ['@citizenid'] = citizenId,
                ['@location'] = location,
                ['@name'] = name,
                ['@model'] = model,
                ['@transferLocation'] = transferLocation
            })
        else
            jo.notif.right(src, _U("shortCash"), 'inventory_items', 'generic_exotic_order', 'color_white', 5000)
        end

    elseif transferMode == "driveTransfer" then

        MySQL.Async.execute('UPDATE player_boats SET location = @transferLocation WHERE citizenid = @citizenid AND location = @location AND name = @name AND model = @model LIMIT 1', {
            ['@citizenid'] = citizenId,
            ['@location'] = location,
            ['@name'] = name,
            ['@model'] = model,
            ['@transferLocation'] = transferLocation
        })
    end
end)

-- Prevent NPC Boat Spawns
if Config.blockNpcBoats then
    AddEventHandler('entityCreating', function(entity)
        if GetEntityType(entity) == 2 then
            if GetVehicleType(entity) == "boat" then
                if GetEntityPopulationType(entity) ~= 7 and GetEntityPopulationType(entity) ~= 8 then
                    CancelEvent()
                end
            end
        end
    end)
end


-- Register boat stash opening
RegisterServerEvent('sm-boats:server:OpenBoatStash')
AddEventHandler('sm-boats:server:OpenBoatStash', function(invId)
    local src = source
    
    -- Open as a regular stash with a fixed size (you can adjust the size)
    -- Adjust this based on your inventory system (RSG, QBCore, ESX, etc.)
    
    -- For RSG Inventory:
    exports['rsg-inventory']:OpenInventory(src, invId, {
        maxweight = 400000, -- Adjust weight limit
        slots = 50 -- Adjust slot count
    })
    
    -- OR for ox_inventory:
    -- exports.ox_inventory:forceOpenInventory(src, 'stash', invId)
    
    -- OR if you need to register it first:
    -- exports.ox_inventory:RegisterStash(invId, 'Boat Storage', 50, 400000)
    -- exports.ox_inventory:forceOpenInventory(src, 'stash', invId)
end)

-- Add this at the top of your server file
FishConfig = {
    { item = 'a_c_fishbluegil_01_ms', label = 'Bluegill (Medium)' },
    { item = 'a_c_fishbluegil_01_sm', label = 'Bluegill (Small)' },
    { item = 'a_c_fishbullheadcat_01_ms', label = 'Bullhead Catfish (Medium)' },
    { item = 'a_c_fishbullheadcat_01_sm', label = 'Bullhead Catfish (Small)' },
    { item = 'a_c_fishchainpickerel_01_ms', label = 'Chain Pickerel (Medium)' },
    { item = 'a_c_fishchainpickerel_01_sm', label = 'Chain Pickerel (Small)' },
    { item = 'a_c_fishchannelcatfish_01_lg', label = 'Channel Catfish (Large)' },
    { item = 'a_c_fishchannelcatfish_01_xl', label = 'Channel Catfish (XL)' },
    { item = 'a_c_fishlakesturgeon_01_lg', label = 'Lake Sturgeon' },
    { item = 'a_c_fishlargemouthbass_01_lg', label = 'Largemouth Bass (Large)' },
    { item = 'a_c_fishlargemouthbass_01_ms', label = 'Largemouth Bass (Medium)' },
    { item = 'a_c_fishlongnosegar_01_lg', label = 'Longnose Gar' },
    { item = 'a_c_fishmuskie_01_lg', label = 'Muskie' },
    { item = 'a_c_fishnorthernpike_01_lg', label = 'Northern Pike' },
    { item = 'a_c_fishperch_01_ms', label = 'Perch (Medium)' },
    { item = 'a_c_fishperch_01_sm', label = 'Perch (Small)' },
    { item = 'a_c_fishrainbowtrout_01_lg', label = 'Rainbow Trout (Large)' },
    { item = 'a_c_fishrainbowtrout_01_ms', label = 'Rainbow Trout (Medium)' },
    { item = 'a_c_fishredfinpickerel_01_ms', label = 'Redfin Pickerel (Medium)' },
    { item = 'a_c_fishredfinpickerel_01_sm', label = 'Redfin Pickerel (Small)' },
    { item = 'a_c_fishrockbass_01_ms', label = 'Rock Bass (Medium)' },
    { item = 'a_c_fishrockbass_01_sm', label = 'Rock Bass (Small)' },
    { item = 'a_c_fishsalmonsockeye_01_lg', label = 'Sockeye Salmon (Large)' },
    { item = 'a_c_fishsalmonsockeye_01_ml', label = 'Sockeye Salmon (Medium-Large)' },
    { item = 'a_c_fishsalmonsockeye_01_ms', label = 'Sockeye Salmon (Medium)' },
    { item = 'a_c_fishsmallmouthbass_01_lg', label = 'Smallmouth Bass (Large)' },
    { item = 'a_c_fishsmallmouthbass_01_ms', label = 'Smallmouth Bass (Medium)' },
    { item = 'lobster', label = 'Lobster' },
}

RegisterServerEvent('sm-boats:GetFishingRewards')
AddEventHandler('sm-boats:GetFishingRewards', function()
    local src = source
    
    -- Random number of fish catches (1 to 5 fish)
    local numberOfCatches = math.random(1, 5)
    local caughtFish = {}
    
    for i = 1, numberOfCatches do
        -- Randomly select a fish from the config
        local randomFish = FishConfig[math.random(1, #FishConfig)]
        
        -- Add to inventory using RSG inventory
        exports['rsg-inventory']:AddItem(src, randomFish.item, 1)
        
        -- Track what was caught for notification
        table.insert(caughtFish, randomFish.label)
    end
    
    -- Send notification with what was caught
    local fishList = table.concat(caughtFish, ', ')
    TriggerClientEvent('sm-boats:client:FishingSuccess', src, numberOfCatches, fishList)
end)

local RSGCore = exports['rsg-core']:GetCoreObject()

-- Callback to check if player has fishing net & raw fish
RSGCore.Functions.CreateCallback('sm-boats:CheckFishingItems', function(source, cb)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then
        dbg("ERROR: Player is nil in CheckFishingItems", src)
        cb(false)
        return
    end

    local net = Player.Functions.GetItemByName("fishingnet")
    local bait = Player.Functions.GetItemByName("raw_fish")

    -- If either missing, return false
    if not net or not bait or (bait.amount or 0) < 1 then
        cb(false)
        return
    end

    -- Ensure net has info. If it doesn't, re-create the item with metadata uses=50
    if not net.info or not net.info.uses then
        -- Remove one stack of the net and add back with metadata
        -- Note: we only re-create a single item slot. If player had multiple stacks this will add one with metadata.
        local amount = net.amount or 1
        local slot = net.slot

        -- remove one (we will add back same amount but with info on 1 item; this is conservative)
        local removed = Player.Functions.RemoveItem("fishingnet", 1, slot)
        if removed then
            local meta = { uses = 50 }
            Player.Functions.AddItem("fishingnet", 1, false, meta)
            -- Refresh reference to item
            net = Player.Functions.GetItemByName("fishingnet")
            if not net then
                dbg("WARNING: Could not recreate fishingnet with metadata for player", src)
            end
        else
            dbg("WARNING: Failed to remove fishingnet to set metadata", src)
        end
    end

    local uses = (net and net.info and net.info.uses) or 50
    cb(true, uses)
end)

-- Reduce durability
RegisterNetEvent('sm-boats:ReduceNetDurability', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then
        dbg("ERROR: Player is nil in ReduceNetDurability", src)
        return
    end

    local net = Player.Functions.GetItemByName("fishingnet")
    if not net then
        dbg("INFO: ReduceNetDurability called but player has no fishingnet", src)
        return
    end

    local uses = (net.info and net.info.uses) or 50
    uses = uses - 1

    -- Remove one net and re-add with updated uses (robust for different RSGCore versions)
    local removed = Player.Functions.RemoveItem("fishingnet", 1, net.slot)
    if not removed then
        dbg("WARNING: Failed to remove fishingnet (ReduceNetDurability) for player", src)
        return
    end

    if uses <= 0 then
        TriggerClientEvent('jo.notif.right', src, "Your fishing net is worn out and broke!", 'inventory_items', 'generic_exotic_order', 'COLOR_RED', 3000)
        dbg("Net broke for player", src)
        return
    end

    -- add it back with updated metadata
    local meta = { uses = uses }
    Player.Functions.AddItem("fishingnet", 1, false, meta)

    TriggerClientEvent('jo.notif.right', src, "Fishing Net Durability: " .. uses .. "/50", 'inventory_items', 'generic_exotic_order', 'COLOR_WHITE', 2000)
    dbg("Reduced net durability to "..tostring(uses).." for player", src)
end)

RegisterNetEvent('sm-boats:ConsumeFishBait', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end

    local bait = Player.Functions.GetItemByName("raw_fish")
    if bait and bait.amount > 0 then
        Player.Functions.RemoveItem("raw_fish", 1)
        TriggerClientEvent('jo.notif.right', src, "Used 1 Raw Fish as bait", 'inventory_items', 'generic_exotic_order', 'COLOR_WHITE', 2000)
    end
end)
