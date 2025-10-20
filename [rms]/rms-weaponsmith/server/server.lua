local RSGCore = exports['rsg-core']:GetCoreObject()
lib.locale()

---------------------------------------------
-- increase xp fuction
---------------------------------------------
local function IncreasePlayerXP(source, xpGain, xpType)
    local Player = RSGCore.Functions.GetPlayer(source)
    if Player then
        local currentXP = Player.Functions.GetRep(xpType)
        local newXP = currentXP + xpGain
        Player.Functions.AddRep(xpType, newXP)
        TriggerClientEvent('ox_lib:notify', source, { title = string.format(locale('sv_lang_12'), xpGain, xpType), type = 'inform', duration = 7000 })
    end
end

---------------------------------------------
-- check player xp
---------------------------------------------
RSGCore.Functions.CreateCallback('rex-weaponsmith:server:checkxp', function(source, cb, xptype)
    local Player = RSGCore.Functions.GetPlayer(source)
    if Player then
        local currentXP = Player.Functions.GetRep(xptype)
        cb(currentXP)
    end
end)

---------------------------------------------
-- admin command for weaponsmith reset /resetweaponsmith weaponsmithid
---------------------------------------------
RSGCore.Commands.Add('resetweaponsmith', locale('sv_lang_7'), { { name = 'weaponsmithid', help = locale('sv_lang_8') } }, true, function(source, args)

    local weaponsmithid = args[1]
    local result = MySQL.prepare.await("SELECT COUNT(*) as count FROM rex_weaponsmith WHERE weaponsmithid = ?", { weaponsmithid })

    if result == 1 then
        -- update rex_weaponsmith table
        MySQL.update('UPDATE rex_weaponsmith SET owner = ? WHERE weaponsmithid = ?', {'vacant', weaponsmithid})
        MySQL.update('UPDATE rex_weaponsmith SET rent = ? WHERE weaponsmithid = ?', {0, weaponsmithid})
        MySQL.update('UPDATE rex_weaponsmith SET rent = ? WHERE weaponsmithid = ?', {0, weaponsmithid})
        MySQL.update('UPDATE rex_weaponsmith SET status = ? WHERE weaponsmithid = ?', {'closed', weaponsmithid})
        MySQL.update('UPDATE rex_weaponsmith SET money = ? WHERE weaponsmithid = ?', {0.00, weaponsmithid})
        -- delete stock in rex_weaponsmith_stock
        MySQL.Async.execute('DELETE FROM rex_weaponsmith_stock WHERE weaponsmithid = ?', { weaponsmithid })
        -- update funds in management_funds
        MySQL.update('UPDATE management_funds SET amount = ? WHERE job_name = ?', {0, weaponsmithid})
        -- delete job in player_jobs
        MySQL.Async.execute('DELETE FROM player_jobs WHERE job = ?', { weaponsmithid })
        -- delete stashes
        MySQL.Async.execute('DELETE FROM inventories WHERE identifier = ?', { weaponsmithid..'_crafting' })
        MySQL.Async.execute('DELETE FROM inventories WHERE identifier = ?', { weaponsmithid..'_playershare' })
        MySQL.Async.execute('DELETE FROM inventories WHERE identifier = ?', { weaponsmithid..'_stock_' })
        TriggerClientEvent('ox_lib:notify', source, {title = locale('sv_lang_9'), type = 'success', duration = 7000 })
    else
        TriggerClientEvent('ox_lib:notify', source, {title = locale('sv_lang_10'), type = 'error', duration = 7000 })
    end

end, 'admin')

---------------------------------------------
-- count owned weaponsmiths
---------------------------------------------
RSGCore.Functions.CreateCallback('rex-weaponsmith:server:countowned', function(source, cb)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local citizenid = Player.PlayerData.citizenid
    local result = MySQL.prepare.await("SELECT COUNT(*) as count FROM rex_weaponsmith WHERE owner = ?", { citizenid })
    if result then
        cb(result)
    else
        cb(nil)
    end
end)

---------------------------------------------
-- get data
---------------------------------------------
RSGCore.Functions.CreateCallback('rex-weaponsmith:server:getweaponsmithdata', function(source, cb, weaponsmithid)
    MySQL.query('SELECT * FROM rex_weaponsmith WHERE weaponsmithid = ?', { weaponsmithid }, function(result)
        if result[1] then
            cb(result)
        else
            cb(nil)
        end
    end)
end)

---------------------------------------------
-- check stock
---------------------------------------------
RSGCore.Functions.CreateCallback('rex-weaponsmith:server:checkstock', function(source, cb, weaponsmithid)
    MySQL.query('SELECT * FROM rex_weaponsmith_stock WHERE weaponsmithid = ?', { weaponsmithid }, function(result)
        if result[1] then
            cb(result)
        else
            cb(nil)
        end
    end)
end)

---------------------------------------------
-- update stock or add new stock
---------------------------------------------
RegisterNetEvent('rex-weaponsmith:server:newstockitem', function(weaponsmithid, item, amount, price)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local itemcount = MySQL.prepare.await("SELECT COUNT(*) as count FROM rex_weaponsmith_stock WHERE weaponsmithid = ? AND item = ?", { weaponsmithid, item })
    if itemcount == 0 then
        MySQL.Async.execute('INSERT INTO rex_weaponsmith_stock (weaponsmithid, item, stock, price) VALUES (@weaponsmithid, @item, @stock, @price)',
        {
            ['@weaponsmithid'] = weaponsmithid,
            ['@item'] = item,
            ['@stock'] = amount,
            ['@price'] = price
        })
        Player.Functions.RemoveItem(item, amount)
        TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items[item], 'remove', amount)
    else
        MySQL.query('SELECT * FROM rex_weaponsmith_stock WHERE weaponsmithid = ? AND item = ?', { weaponsmithid, item }, function(data)
            local stockupdate = (amount + data[1].stock)
            MySQL.update('UPDATE rex_weaponsmith_stock SET stock = ? WHERE weaponsmithid = ? AND item = ?',{stockupdate, weaponsmithid, item})
            MySQL.update('UPDATE rex_weaponsmith_stock SET price = ? WHERE weaponsmithid = ? AND item = ?',{price, weaponsmithid, item})
            Player.Functions.RemoveItem(item, amount)
            TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items[item], 'remove', amount)
        end)
    end
end)

---------------------------------------------
-- buy item amount / add money to account
---------------------------------------------
RegisterNetEvent('rex-weaponsmith:server:buyitem', function(amount, item, newstock, price, label, weaponsmithid)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local money = Player.PlayerData.money[Config.Money]
    local totalcost = (price * amount)
    if money >= totalcost then
        MySQL.update('UPDATE rex_weaponsmith_stock SET stock = ? WHERE weaponsmithid = ? AND item = ?', {newstock, weaponsmithid, item})
        Player.Functions.RemoveMoney(Config.Money, totalcost)
        Player.Functions.AddItem(item, amount)
        TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items[item], 'add', amount)
        MySQL.query('SELECT * FROM rex_weaponsmith WHERE weaponsmithid = ?', { weaponsmithid }, function(data2)
            local moneyupdate = (data2[1].money + totalcost)
            MySQL.update('UPDATE rex_weaponsmith SET money = ? WHERE weaponsmithid = ?',{moneyupdate, weaponsmithid})
        end)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_1')..Config.Money, type = 'error', duration = 7000 })
    end
end)

---------------------------------------------
-- remove stock item
---------------------------------------------
RegisterNetEvent('rex-weaponsmith:server:removestockitem', function(data)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    MySQL.query('SELECT * FROM rex_weaponsmith_stock WHERE weaponsmithid = ? AND item = ?', { data.weaponsmithid, data.item }, function(result)
        Player.Functions.AddItem(result[1].item, result[1].stock)
        TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items[result[1].item], 'remove', result[1].stock)
        MySQL.Async.execute('DELETE FROM rex_weaponsmith_stock WHERE id = ?', { result[1].id })
    end)
end)

---------------------------------------------
-- get money
---------------------------------------------
RSGCore.Functions.CreateCallback('rex-weaponsmith:server:getmoney', function(source, cb, weaponsmithid)
    MySQL.query('SELECT * FROM rex_weaponsmith WHERE weaponsmithid = ?', { weaponsmithid }, function(result)
        if result[1] then
            cb(result[1])
        else
            cb(nil)
        end
    end)
end)

---------------------------------------------
-- withdraw money
---------------------------------------------
RegisterNetEvent('rex-weaponsmith:server:withdrawfunds', function(amount, weaponsmithid)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    MySQL.query('SELECT * FROM rex_weaponsmith WHERE weaponsmithid = ?', {weaponsmithid} , function(result)
        if result[1] ~= nil then
            if result[1].money >= amount then
                local updatemoney = (result[1].money - amount)
                MySQL.update('UPDATE rex_weaponsmith SET money = ? WHERE weaponsmithid = ?', { updatemoney, weaponsmithid })
                Player.Functions.AddMoney(Config.Money, amount)
            end
        end
    end)
end)

---------------------------------------------
-- rent weaponsmith
---------------------------------------------
RegisterNetEvent('rex-weaponsmith:server:rentweaponsmith', function(weaponsmithid)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local money = Player.PlayerData.money[Config.Money]
    local citizenid = Player.PlayerData.citizenid
    if money > Config.RentStartup then
        Player.Functions.RemoveMoney(Config.Money, Config.RentStartup)
        Player.Functions.SetJob(weaponsmithid, 2)
        if Config.LicenseRequired then
            Player.Functions.RemoveItem('weaponsmithlicence', 1)
            TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items['weaponsmithlicence'], 'remove', 1)
        end
        MySQL.update('UPDATE rex_weaponsmith SET owner = ? WHERE weaponsmithid = ?',{ citizenid, weaponsmithid })
        MySQL.update('UPDATE rex_weaponsmith SET rent = ? WHERE weaponsmithid = ?',{ Config.RentStartup, weaponsmithid })
        MySQL.update('UPDATE rex_weaponsmith SET status = ? WHERE weaponsmithid = ?', {'open', weaponsmithid})
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'success', duration = 7000 })
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_3'), type = 'error', duration = 7000 })
    end
end)

---------------------------------------------
-- add weaponsmith rent
---------------------------------------------
RegisterNetEvent('rex-weaponsmith:server:addrentmoney', function(rentmoney, weaponsmithid)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    MySQL.query('SELECT * FROM rex_weaponsmith WHERE weaponsmithid = ?', { weaponsmithid }, function(result)
        local currentrent = result[1].rent
        local rentupdate = (currentrent + rentmoney)
        if rentupdate >= Config.MaxRent then
            TriggerClientEvent('ox_lib:notify', src, {title = 'Can\'t add that much rent!', type = 'error', duration = 7000 })
        else
            Player.Functions.RemoveMoney(Config.Money, rentmoney)
            MySQL.update('UPDATE rex_weaponsmith SET rent = ? WHERE weaponsmithid = ?',{ rentupdate, weaponsmithid })
            MySQL.update('UPDATE rex_weaponsmith SET status = ? WHERE weaponsmithid = ?', {'open', weaponsmithid})
            TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_4'), type = 'success', duration = 7000 })
        end
    end)
end)

---------------------------------------------
-- check player has the ingredients
---------------------------------------------
RSGCore.Functions.CreateCallback('rex-weaponsmith:server:checkingredients', function(source, cb, ingredients)
    local src = source
    local hasItems = false
    local icheck = 0
    local Player = RSGCore.Functions.GetPlayer(src)
    for k, v in pairs(ingredients) do
        if exports['rsg-inventory']:GetItemCount(src, v.item) >= v.amount then
            icheck = icheck + 1
            if icheck == #ingredients then
                cb(true)
            end
        else
            TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_5'), type = 'error', duration = 7000 })
            cb(false)
            return
        end
    end
end)

---------------------------------------------
-- finish crafting / give item
---------------------------------------------
RegisterNetEvent('rex-weaponsmith:server:finishcrafting', function(data)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local receive = data.receive
    local giveamount = data.giveamount
    for k, v in pairs(data.ingredients) do
        Player.Functions.RemoveItem(v.item, v.amount)
    end
    Player.Functions.AddItem(receive, giveamount)
    Player.Functions.RemoveItem(data.bpc, 1)
    TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items[data.bpc], 'remove', 1)
    TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items[receive], 'add', giveamount)
    if Config.xpEnabled then
        IncreasePlayerXP(src, 1, 'crafting')
    end
end)

RSGCore.Functions.CreateCallback('rex-weaponsmith:server:checkallitems', function(source, cb, itemsToCheck)
    local Player = RSGCore.Functions.GetPlayer(source)
    local hasAllItems = true
    
    for _, itemData in pairs(itemsToCheck) do
        local hasItem = Player.Functions.GetItemByName(itemData.item)
        if not hasItem or hasItem.amount < itemData.amount then
            hasAllItems = false
            break
        end
    end
    
    cb(hasAllItems)
end)

---------------------------------------------
-- weaponsmith storage
---------------------------------------------
RegisterServerEvent('rex-weaponsmith:server:openstorage', function(data)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    local storagedata = { label = data.name, maxweight = data.maxweight, slots = data.maxslots }
    local stashName = data.weaponsmithid ..'_'.. data.storetype
    exports['rsg-inventory']:OpenInventory(src, stashName, storagedata)
end)

---------------------------------------------
-- weaponsmith rent system
---------------------------------------------
lib.cron.new(Config.WeaponsmithCronJob, function ()

    if not Config.EnableRentSystem then
        print(locale('sv_lang_11'))
        return
    end

    local result = MySQL.query.await('SELECT * FROM rex_weaponsmith')

    if not result then goto continue end

    for i = 1, #result do

        local weaponsmithid = result[i].weaponsmithid
        local owner = result[i].owner
        local rent = result[i].rent
        local money = result[i].money

        if rent >= 1 then
            local moneyupdate = (rent - Config.RentPerHour)
            MySQL.update('UPDATE rex_weaponsmith SET rent = ? WHERE weaponsmithid = ?', {moneyupdate, weaponsmithid})
            MySQL.update('UPDATE rex_weaponsmith SET status = ? WHERE weaponsmithid = ?', {'open', weaponsmithid})
        else
            MySQL.update('UPDATE rex_weaponsmith SET status = ? WHERE weaponsmithid = ?', {'closed', weaponsmithid})
        end

    end

    ::continue::

    if Config.ServerNotify then
        print(locale('sv_lang_6'))
    end

end)
