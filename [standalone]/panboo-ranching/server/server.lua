local RSGCore = exports['rsg-core']:GetCoreObject()
lib.locale()
local oxmysql = exports.oxmysql

local GrainMissionCooldowns = {}

RegisterNetEvent('panboo-ranching:server:checkGrainCooldown', function(ranchId)
    local src = source
    local now = GetGameTimer()

    if GrainMissionCooldowns[ranchId] and now < GrainMissionCooldowns[ranchId] then
        local remaining = math.floor((GrainMissionCooldowns[ranchId] - now) / 1000)
        TriggerClientEvent('panboo-ranching:client:grainCooldownDenied', src, remaining)
    else
        -- Set cooldown (e.g., 10 minutes)
        GrainMissionCooldowns[ranchId] = now + (Config.GrainMissionCooldown * 60 * 1000)
        TriggerClientEvent('panboo-ranching:client:grainCooldownApproved', src)
    end
end)


-- 🐾 Buy Animal
RegisterNetEvent('panboo-ranching:server:buyAnimal', function(animalKey)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end

    local animal = Config.AnimalsForSale[animalKey]
    if not animal then return end

    TriggerClientEvent('panboo-ranching:client:nameAnimalPrompt', src, animal.model, animalKey)
end)

lib.callback.register('panboo-ranching:server:canBuyAnimal', function(src, name)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    local job = Player.PlayerData.job.name

    if not name then 
        return false 
    end

    -- Check animal count
    local countResult = MySQL.query.await("SELECT COUNT(*) as count FROM panboo_farm_animals WHERE job = ?", { job })
    if countResult[1] and countResult[1].count >= 10 then
        return false
    end

    -- Check name uniqueness
    local nameResult = MySQL.query.await("SELECT COUNT(*) as count FROM panboo_farm_animals WHERE job = ? AND name = ?", { job, name })
    if nameResult[1] and nameResult[1].count > 0 then
        return false
    end

    return true
end)

-- 🐾 Save New Animal
RegisterNetEvent('panboo-ranching:server:saveAnimal', function(model, name, animalKey)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    local job = Player.PlayerData.job.name

    local animal = Config.AnimalsForSale[animalKey]
    if not animal then return end

    if Player.Functions.RemoveMoney('cash', animal.price) then
        oxmysql:insert('INSERT INTO panboo_farm_animals (job, model, name, stored, growth) VALUES (?, ?, ?, ?, ?)', {
            job, model, name, 1, 0
        }, function()
            TriggerClientEvent("rsg-core:Notify", src, {
                type = "success",
                text = "You bought " .. name .. "!"
            })
        end)
    else
        TriggerClientEvent("rsg-core:Notify", src, {
            type = "error",
            text = "Not enough cash for that " .. animal.label .. "!"
        })
    end
end)

RegisterNetEvent('panboo-ranching:server:forceStoreAnimal', function(animalName)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end

    local job = Player.PlayerData.job.name
    oxmysql:update('UPDATE panboo_farm_animals SET stored = 1 WHERE job = ? AND name = ?', {
        job, animalName
    })

    print("💾 [Ranching] Forcing store on lost animal: " .. animalName .. " for " .. Player.PlayerData.job.name)
end)

-- 📦 Store Animal
RegisterNetEvent('panboo-ranching:server:storeAnimal', function(name)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end

    local job = Player.PlayerData.job.name
    oxmysql:update('UPDATE panboo_farm_animals SET stored = 1 WHERE job = ? AND name = ?', {
        job, name
    })
end)

RegisterNetEvent('panboo-ranching:server:givePoop', function(amount)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end

    Player.Functions.AddItem(Config.CleanupItemRecieved, amount)
    TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items[Config.CleanupItemRecieved], 'add', amount)
end)

RegisterNetEvent('panboo-ranching:server:giveEggs', function(amount)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if Player then
        Player.Functions.AddItem(Config.EggItem, amount)
        TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items[Config.EggItem], 'add', amount)
    end
end)

RegisterNetEvent('panboo-ranching:server:giveWool', function(amount)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if Player then
        Player.Functions.AddItem(Config.WoolItem, amount)
        TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items[Config.WoolItem], 'add', amount)
    end
end)

RegisterNetEvent('panboo-ranching:server:giveMushrooms', function(amount)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if Player then
        Player.Functions.AddItem(Config.MushroomItem, amount)
        TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items[Config.MushroomItem], 'add', amount)
    end
end)

RegisterNetEvent('panboo-ranching:server:giveButcherItems', function(name)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end

    local job = Player.PlayerData.job.name
    local result = MySQL.query.await("SELECT model FROM panboo_farm_animals WHERE name = ? AND job = ?", { name, job })
    if not result or not result[1] then return end

    local model = result[1].model
    MySQL.query.await("DELETE FROM panboo_farm_animals WHERE name = ? and job = ?", { name, job })

    if model == "A_C_Pig_01" then
        local porkAmount = math.random(Config.PorkMin, Config.PorkMax)
        local animalFatAmount = math.random(Config.AnimalFatMin, Config.AnimalFatMax)
        Player.Functions.AddItem(Config.PorkItem, porkAmount)
        TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items[Config.PorkItem], 'add', porkAmount)
        Player.Functions.AddItem(Config.AnimalFatItem, animalFatAmount)
        Player.Functions.AddMoney('cash', Config.PigButcherRefund)
        TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items[Config.AnimalFatItem], 'add', animalFatAmount)
    elseif model == "A_C_Sheep_01" then
        local muttonAmount = math.random(Config.MuttonMin, Config.MuttonMax)
        Player.Functions.AddItem(Config.SheepItem, muttonAmount)
        Player.Functions.AddMoney('cash', Config.SheepButcherRefund)
        TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items[Config.SheepItem], 'add', muttonAmount)
    elseif model == "A_C_Chicken_01" then
        local chickenAmount = math.random(Config.ChickenMeatMin, Config.ChickenMeatMax)
        Player.Functions.AddItem(Config.ChickenItem, chickenAmount)
        Player.Functions.AddMoney('cash', Config.ChickenButcherRefund)
        TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items[Config.ChickenItem], 'add', chickenAmount)
    end

    TriggerClientEvent('rsg-core:notify', src, {
        type = 'success',
        description = "You butchered " .. name .. " and received fresh goods 🍖"
    })
end)

-- 🚪 Unstore Animal
RegisterNetEvent('panboo-ranching:server:unstoreAnimal', function(name)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end

    local job = Player.PlayerData.job.name
    oxmysql:update('UPDATE panboo_farm_animals SET stored = 0 WHERE job = ? AND name = ?', {
        job, name
    })
end)

-- 📥 Get Animals
lib.callback.register('panboo-ranching:server:getMyAnimals', function(src)
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return {} end

    local job = Player.PlayerData.job.name
    local result = oxmysql:executeSync([[
        SELECT model, name, stored, growth
        FROM panboo_farm_animals
        WHERE job = ?
    ]], { job })

    return result or {}
end)

RegisterNetEvent('panboo-ranching:server:updateGrowth', function(name, amount)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end

    local job = Player.PlayerData.job.name
    oxmysql:update('UPDATE panboo_farm_animals SET growth = LEAST(growth + ?, 100) WHERE job = ? AND name = ?', {
        amount, job, name
    })
end)

RegisterNetEvent('panboo-ranching:server:giveMilk', function(amount)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end

    local itemName = Config.MilkItem -- make sure this item exists in your ox_inventory
    local success = Player.Functions.AddItem(itemName, amount)
    if success then
        TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items[itemName], 'add', amount)
        TriggerClientEvent('rsg_inventory:notify', src, {
            type = 'success',
            text = "You received " .. amount .. " bottle(s) of milk 🥛"
        })
    else
        TriggerClientEvent('rsg_inventory:notify', src, {
            type = 'error',
            text = "Could not add milk to inventory"
        })
    end
end)

lib.callback.register('panboo-ranching:server:getButcherReadyCows', function(source)
    local Player = RSGCore.Functions.GetPlayer(source)
    if not Player then return {} end

    local job = Player.PlayerData.job.name
    local results = MySQL.query.await("SELECT * FROM panboo_farm_animals WHERE job = ? AND growth = 100 AND stored = 1 AND model = 'A_C_Cow'", { job })
    return results or {}
end)

RegisterNetEvent('panboo-ranching:server:butcherCow', function(name)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end

    MySQL.query.await("DELETE FROM panboo_farm_animals WHERE name = ? and job = ?", { name, Player.PlayerData.job.name })

    local beefQty = math.random(Config.BeefMin, Config.BeefMax)
    local leatherQty = math.random(Config.LeatherMin, Config.LeatherMax)
    local animalFatQty = math.random(Config.AnimalFatMin, Config.AnimalFatMax)
    Player.Functions.AddItem(Config.BeefItem, beefQty)
    Player.Functions.AddItem(Config.LeatherItem, leatherQty)
    Player.Functions.AddItem(Config.AnimalFatItem, animalFatQty)
    Player.Functions.AddMoney('cash', Config.CowButcherRefund)
    TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items[Config.BeefItem], 'add', beefQty)
    TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items[Config.LeatherItem], 'add', leatherQty)
    TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items[Config.AnimalFatItem], 'add', animalFatQty)

    TriggerClientEvent('rsg-core:notify', src, {
        type = 'success',
        description = "You butchered " .. name .. " and received " .. beefQty .. " cuts of beef 🥩 and scraps!"
    })
end)

RegisterNetEvent("panboo-ranching:server:tryGrabHay")
AddEventHandler("panboo-ranching:server:tryGrabHay", function(ranchId)
    local src = source
    local result = MySQL.query.await("SELECT hay_stockpile FROM ranch_upkeep WHERE ranchid = ?", { ranchId })

    if not result[1] or result[1].hay_stockpile <= 0 then
        TriggerClientEvent("panboo-ranching:client:hayGrabResult", src, false, ranchId, result[1].hay_stockpile)
        return
    end

    TriggerClientEvent("panboo-ranching:client:hayGrabResult", src, true, ranchId, result[1].hay_stockpile)
end)

RegisterNetEvent("panboo-ranching:server:modifyHayStockpile")
AddEventHandler("panboo-ranching:server:modifyHayStockpile", function(ranchId, delta)
    if type(delta) ~= "number" then return end
    MySQL.query.await([[
        UPDATE ranch_upkeep
        SET hay_stockpile = GREATEST(hay_stockpile + ?, 0)
        WHERE ranchid = ?
    ]], { delta, ranchId })
end)

RegisterNetEvent('panboo-ranching:server:triggerBanditAmbush', function(wagonCoords)
    local src = source
    local chance = math.random(1, 100)
    if chance <= Config.BanditChanceForGrainMission then
        TriggerClientEvent('panboo-ranching:client:spawnBandits', src, wagonCoords)
    end
end)

function getRanchById(id)
    for _, ranch in pairs(Config.RanchSettings) do
        if ranch.ranchid == id then return ranch end
    end
end

RegisterNetEvent('panboo-ranching:server:completeGrainDelivery', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)

    Player.Functions.AddMoney('cash', Config.GrainCashReward)

    Player.Functions.AddItem(Config.GrainItem, Config.GrainItemAmount)
    TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items[Config.GrainItem], 'add', Config.GrainItemAmount)
    TriggerClientEvent('ox_lib:notify', src, {
        title = 'Grain Delivery',
        description = 'You received ' .. Config.GrainItemAmount .. 'x ' .. Config.GrainItem,
        type = 'success'
    })
end)

--------------------------------------
-- register shop
--------------------------------------
CreateThread(function()
    exports['rsg-inventory']:CreateShop({
        name = 'ranch',
        label = locale('cl_ranch_shop'),
        slots = #Config.ranchShopItems,
        items = Config.ranchShopItems,
        persistentStock = Config.PersistStock,
    })
end)

--------------------------------------
-- open shop
--------------------------------------
RegisterNetEvent('panboo-ranching:server:openShop', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    exports['rsg-inventory']:OpenShop(src, 'ranch')
end)

--------------------------------------
-- open storage
--------------------------------------
RegisterNetEvent('panboo-ranching:server:openStorage', function(ranch)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    local data = { label = locale('ranch_storage'), maxweight = Config.StorageMaxWeight, slots = Config.StorageMaxSlots }
    local stashName = 'storage_' .. ranch
    exports['rsg-inventory']:OpenInventory(src, stashName, data)
end)