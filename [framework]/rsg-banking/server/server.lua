local RSGCore = exports['rsg-core']:GetCoreObject()
local banking = nil
lib.locale()

---------------
-- stash
----------------
RegisterNetEvent('rsg-banking:server:opensafedeposit', function(town)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    local data = { label = locale('sv_lang'), maxweight = Config.StorageMaxWeight, slots = Config.StorageMaxSlots }
    local citizenId = Player.PlayerData.citizenid
    local stashName = 'safedeposit_' .. citizenId .. town
    exports['rsg-inventory']:OpenInventory(src, stashName, data)
end)

---------------------------------
-- callback for bank balance
---------------------------------
RSGCore.Functions.CreateCallback('rsg-banking:getBankingInformation', function(source, cb, bankid)

    local Player = RSGCore.Functions.GetPlayer(source)
    if not Player then return cb(nil) end

    if bankid == 'bank' then
        banking = tonumber(Player.PlayerData.money['bank'])
    end

    if bankid == 'valbank' then
        banking = tonumber(Player.PlayerData.money['valbank'])
    end

    if bankid == 'rhobank' then
        banking = tonumber(Player.PlayerData.money['rhobank'])
    end

    if bankid == 'blkbank' then
        banking = tonumber(Player.PlayerData.money['blkbank'])
    end

    if bankid == 'armbank' then
        banking = tonumber(Player.PlayerData.money['armbank'])
    end

    if bankid == 'strawbank' then
        banking = tonumber(Player.PlayerData.money['strawbank'])
    end

    if bankid == 'vanbank' then
        banking = tonumber(Player.PlayerData.money['vanbank'])
    end

    if bankid == 'annebank' then
        banking = tonumber(Player.PlayerData.money['annebank'])
    end

    cb(banking)
end)

---------------------------------
-- deposit & withdraw
---------------------------------
RegisterNetEvent('rsg-banking:server:transact', function(type, amount, bankid)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(source)
    local currentCash = Player.Functions.GetMoney('cash')
    local currentBank = Player.Functions.GetMoney(bankid)

    amount = tonumber(amount)
    if amount <= 0 then
        lib.notify(src, {title = locale('sv_lang_1'), type = 'error'})
        return
    end

    -- -- bank-withdraw
    -- if type == 1 then
    --     if currentBank >= amount then
    --         Player.Functions.RemoveMoney(bankid, tonumber(amount), 'bank-withdraw')
    --         Player.Functions.AddMoney('cash', tonumber(amount), 'bank-withdraw')
    --         local newBankBalance = Player.Functions.GetMoney(bankid)
    --         TriggerClientEvent('rsg-banking:client:UpdateBanking', src, newBankBalance, bankid)
    --     else
    --         lib.notify(src, {title = locale('sv_lang_2'), type = 'error'})
    --     end
    -- end

    -- -- bank-deposit
    -- if type == 2 then
    --     if currentCash >= amount then
    --         Player.Functions.RemoveMoney('cash', tonumber(amount), 'bank-deposit')
    --         Player.Functions.AddMoney(bankid, tonumber(amount), 'bank-deposit')
    --         local newBankBalance = Player.Functions.GetMoney(bankid)
    --         TriggerClientEvent('rsg-banking:client:UpdateBanking', src, newBankBalance, bankid)
    --     else
    --         lib.notify(src, {title = locale('sv_lang_2'), type = 'error'})
    --     end
    -- end

    -- bank-withdraw
if type == 1 then
    if currentBank >= amount then
        Player.Functions.RemoveMoney(bankid, tonumber(amount), 'bank-withdraw')
        Player.Functions.AddMoney('cash', tonumber(amount), 'bank-withdraw')
        local newBankBalance = Player.Functions.GetMoney(bankid)
        TriggerClientEvent('rsg-banking:client:UpdateBanking', src, newBankBalance, bankid)

        TriggerEvent('rsg-logs:server:CreateLog', 'banking', 'Withdraw', 'green',
            ('%s withdrew $%s from their %s account'):format(GetPlayerName(src), amount, bankid))
    else
        lib.notify(src, {title = locale('sv_lang_2'), type = 'error'})
    end
end

-- bank-deposit
if type == 2 then
    if currentCash >= amount then
        Player.Functions.RemoveMoney('cash', tonumber(amount), 'bank-deposit')
        Player.Functions.AddMoney(bankid, tonumber(amount), 'bank-deposit')
        local newBankBalance = Player.Functions.GetMoney(bankid)
        TriggerClientEvent('rsg-banking:client:UpdateBanking', src, newBankBalance, bankid)

        TriggerEvent('rsg-logs:server:CreateLog', 'banking', 'Deposit', 'blue',
            ('%s deposited $%s into their %s account'):format(GetPlayerName(src), amount, bankid))
    else
        lib.notify(src, {title = locale('sv_lang_2'), type = 'error'})
    end
end


    -- create money_clip
    if type == 3 then
        if currentBank >= amount then
            local info = { money = amount }
            Player.Functions.RemoveMoney(bankid, tonumber(amount), 'bank-money_clip')
            Player.Functions.AddItem('money_clip', 1, false, info)
            local newBankBalance = Player.Functions.GetMoney(bankid)
            TriggerClientEvent('rsg-banking:client:UpdateBanking', src, newBankBalance, bankid)
            lib.notify({ title = locale('sv_lang_9'), description = locale('sv_lang_10') .. ' ' .. amount .. ' ' .. locale('sv_lang_11'), type = 'success' })
        else
            lib.notify(src, {title = locale('sv_lang_2'), type = 'error'})
        end
    end

end)

-- ---------------------------------
-- -- money clip made usable
-- ---------------------------------
-- RSGCore.Functions.CreateUseableItem('money_clip', function(source, item)
--     local src = source
--     local Player = RSGCore.Functions.GetPlayer(src)
--     if not Player then return end

--     local itemData = Player.Functions.GetItemBySlot(item.slot)
--     if not itemData then return end

--     local amount = itemData.info.money
--     if Player.Functions.RemoveItem(item.name, 1, item.slot) then
--         Player.Functions.AddMoney('cash', amount)
--         lib.notify({ title = locale('sv_lang_3'), description = locale('sv_lang_4') ..' ' .. amount .. ' ' .. locale('sv_lang_5'), type = 'success' })
--     end
-- end)

-- ---------------------------------
-- -- create money clip command
-- ---------------------------------
-- RSGCore.Commands.Add('moneyclip', locale('sv_lang_6'), {{ name = 'amount', help = locale('sv_lang_7') }}, true, function(source, args)
--     local src = source
--     local args1 = tonumber(args[1])
--     if args1 <= 0 then
--         lib.notify({ title = locale('sv_lang_2'), description = locale('sv_lang_8'), type = 'error' })
--         return
--     end

--     local Player = RSGCore.Functions.GetPlayer(src)
--     if not Player then return end

--     local money = Player.Functions.GetMoney('cash')
--     if money and money >= args1 then
--         if Player.Functions.RemoveMoney('cash', args1, 'give-money') then
--             local info =
--             {
--                 money = args1
--             }

--             Player.Functions.AddItem('money_clip', 1, false, info)
--             lib.notify({ title = locale('sv_lang_9'), description = locale('sv_lang_10') .. ' ' .. args1 .. ' ' .. locale('sv_lang_11'), type = 'success' })
--         end
--     end
-- end, 'user')

-- ---------------------------------
-- -- blood money_clip made usable
-- ---------------------------------
-- RSGCore.Functions.CreateUseableItem('blood_money_clip', function(source, item)
--     local src = source
--     local Player = RSGCore.Functions.GetPlayer(src)
--     if not Player then return end

--     local itemData = Player.Functions.GetItemBySlot(item.slot)
--     if not itemData then return end

--     local amount = itemData.info.money
--     if Player.Functions.RemoveItem(item.name, 1, item.slot) then
--         Player.Functions.AddMoney('bloodmoney', amount)
--         lib.notify({ title = locale('sv_lang_12'), description = locale('sv_lang_4') ..' ' .. amount ..' ' .. locale('sv_lang_13'), type = 'success' })
--     end
-- end)

-- ---------------------------------
-- -- create blood money clip command
-- ---------------------------------
-- RSGCore.Commands.Add('bloodmoneyclip', locale('sv_lang_14'), {{ name = 'amount', help = locale('sv_lang_15') }}, true, function(source, args)
--     local src = source
--     local args1 = tonumber(args[1])

--     if args1 <= 0 then
--         lib.notify({ title = locale('sv_lang_2'), description = locale('sv_lang_8'), type = 'error' })
--         return
--     end

--     local Player = RSGCore.Functions.GetPlayer(src)
--     if not Player then return end

--     local money = Player.Functions.GetMoney('bloodmoney')
--     if money and money >= args1 then
--         if Player.Functions.RemoveMoney('bloodmoney', args1, 'give-blood-money') then
--             local info =
--             {
--                 money = args1
--             }

--             Player.Functions.AddItem('blood_money_clip', 1, false, info)
--             lib.notify({ title = locale('sv_lang_16'), description = locale('sv_lang_10') ..' ' .. args1 ..' ' .. locale('sv_lang_17'), type = 'success' })
--         end
--     end
-- end, 'user')



---------------------------------
-- target give money transfer
---------------------------------
RegisterNetEvent('rsg-banking:server:givemoney', function(targetPlayerId, amount)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local targetPlayer = RSGCore.Functions.GetPlayer(tonumber(targetPlayerId))
    
    if not Player then
        TriggerClientEvent('lib.notify', src, { title = locale('sv_lang_18'), description = locale('sv_lang_19'), type = 'error' })
        return
    end

    if not targetPlayer then
        TriggerClientEvent('lib.notify', src, { title = locale('sv_lang_18'), description = locale('sv_lang_20'), type = 'error' })
        return
    end

    if Player.Functions.GetMoney('cash') >= amount then
        Player.Functions.RemoveMoney('cash', amount)
        targetPlayer.Functions.AddMoney('cash', amount)
        TriggerClientEvent('lib.notify', Player.PlayerData.source, { title = locale('sv_lang_21'), description = locale('sv_lang_22') .. amount .. locale('sv_lang_23') .. targetPlayer.PlayerData.charinfo.firstname, type = 'success' })
        TriggerClientEvent('lib.notify', targetPlayer.PlayerData.source, { title = locale('sv_lang_21'), description = locale('sv_lang_24') .. amount .. locale('sv_lang_25') .. Player.PlayerData.charinfo.firstname, type = 'success' })
    else
        TriggerClientEvent('lib.notify', Player.PlayerData.source, { title = locale('sv_lang_18'), description = locale('sv_lang_26'), type = 'error' })
    end
end)


function GetSourceFromCitizenId(citizenid)
    for _, player in pairs(RSGCore.Functions.GetPlayers()) do
        local ply = RSGCore.Functions.GetPlayer(player)
        if ply and ply.PlayerData.citizenid == citizenid then
            return player
        end
    end
    return nil
end

RegisterNetEvent('rsg-banking:server:applyCustomFine', function(targetPlayerId, description, amount, location)
    local src = source
    local fineIssuer = RSGCore.Functions.GetPlayer(src)
    local target = RSGCore.Functions.GetPlayer(targetPlayerId)

    if not fineIssuer or not target or type(amount) ~= 'number' or amount <= 0 then
        return TriggerClientEvent('ox_lib:notify', src, { title = 'Invalid data or target', type = 'error' })
    end

    local cid = target.PlayerData.citizenid

    local updated = MySQL.update.await('UPDATE players SET fineAmount = fineAmount + ? WHERE citizenid = ?', {amount, cid})

    if not updated or updated == 0 then
        return TriggerClientEvent('ox_lib:notify', src, { title = 'Fine could not be applied.', type = 'error' })
    end

    TriggerClientEvent('ox_lib:notify', src, {
        title = ('Fine Issued ($%d)'):format(amount),
        description = description,
        type = 'success'
    })

    if targetPlayerId then
        TriggerClientEvent('ox_lib:notify', targetPlayerId, {
            title = 'You have been fined',
            description = ('Reason: %s\nAmount: $%d'):format(description, amount),
            type = 'inform'
        })
    end

    local officername = fineIssuer.PlayerData.charinfo.firstname .. ' ' .. fineIssuer.PlayerData.charinfo.lastname
    local date = os.date('!%d-%m')
    local infractor = target.PlayerData.charinfo
    local param = {
        citizenid = cid,
        firstname = infractor.firstname,
        lastname = infractor.lastname,
        officername = officername,
        description = description,
        fine = amount,
        location = location or '',
        date = date
    }

    MySQL.update.await('INSERT INTO btc_fines (`citizenid`,`firstname`,`lastname`, `officername`, `description`,`fine`, `location`, `date`) VALUES (@citizenid, @firstname, @lastname, @officername, @description, @fine, @location, @date)',
        param,
    function(insertId)
        if not insertId then
            print('[btc_fines] Error inserting fine for ' .. cid)
        end
    end)
end)

lib.callback.register('btc-fines:server:getMyFines', function(source)
    local Player = RSGCore.Functions.GetPlayer(source)
    if not Player then return { total = 0, items = {} } end

    local cid = Player.PlayerData.citizenid
    local row = MySQL.single.await('SELECT fineAmount FROM players WHERE citizenid = ?', { cid })
    local total = (row and row.fineAmount) or 0

    local items = MySQL.query.await(
        'SELECT id, description, fine, date, location, paid FROM btc_fines WHERE citizenid = ? AND paid = 0',
        { cid }
    )

    return { total = total, items = items or {} }
end)

function UnPaidFines(source)
    local Player = RSGCore.Functions.GetPlayer(source)
    if not Player then return false end

    local citizenid = Player.PlayerData.citizenid
    if not citizenid then return false end

    local result = MySQL.query.await('SELECT fineAmount FROM players WHERE citizenid = ?', { citizenid })

    if result and result[1] and tonumber(result[1].fineAmount) and tonumber(result[1].fineAmount) > 0 then
        TriggerClientEvent('ox_lib:notify', source, {
            title = 'Unpaid Fines',
            description = 'You have too much heat on you right now, maybe pay your fines?.',
            type = 'warning',
            duration = 10000
        })
        return true
    end

    return false
end

exports('UnPaidFines', UnPaidFines)
-- MAIN REQUESTED EVENT: check & pay everything

RegisterNetEvent('btc-fines:server:paySingleFine', function(fineId)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end

    local cid = Player.PlayerData.citizenid

    -- Fetch fine by id and check ownership
    local fine = MySQL.query.await('SELECT * FROM btc_fines WHERE id = ? AND citizenid = ?', { fineId, cid })[1]
    if not fine then
        TriggerClientEvent('ox_lib:notify', src, { title = 'Error', description = 'Fine not found or not yours.', type = 'error' })
        return
    end

    local fineAmount = tonumber(fine.fine)
    local cash = Player.PlayerData.money['cash'] or 0

    if cash < fineAmount then
        TriggerClientEvent('ox_lib:notify', src, { title = 'Payment failed', description = 'Insufficient cash funds.', type = 'error' })
        return
    end

    Player.Functions.RemoveMoney('cash', fineAmount, 'fine-payment')

    MySQL.update.await('UPDATE players SET fineAmount = fineAmount - ? WHERE citizenid = ?', { fineAmount, cid })

    MySQL.update.await('UPDATE btc_fines SET paid = 1 WHERE id = ?', { fineId })

    for k, v in pairs(Config.LawAreas) do
        if fine.location == k then
            local payment = fineAmount * 0.5
            exports['rsg-bossmenu']:AddMoney(v.job, payment)
            break
        end
    end

    TriggerClientEvent('ox_lib:notify', src, {
        title = 'Fine Paid',
        description = ('You paid $%.2f fine.'):format(fineAmount),
        type = 'success'
    })
end)

RegisterNetEvent('btc-fines:server:checkAndPayFines', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end

    local cid = Player.PlayerData.citizenid

    local row = MySQL.single.await('SELECT fineAmount FROM players WHERE citizenid = ?', { cid })
    local outstanding = (row and row.fineAmount) or 0

    if outstanding <= 0 then
        return TriggerClientEvent('ox_lib:notify', src, {
            title = 'Fines',
            description = 'You have no outstanding fines.',
            type = 'inform'
        })
    end

    local bank =  Player.Functions.GetMoney('cash')
    if bank < outstanding then
        return TriggerClientEvent('ox_lib:notify', src, {
            title = 'Fines',
            description = ('You owe $%.2f but only have $%.2f in cash.'):format(outstanding, bank),
            type = 'error'
        })
    end
    
    local removedOk = true
    if Player.Functions.RemoveMoney then
        
        removedOk = Player.Functions.RemoveMoney('cash', outstanding, 'pay-fines') ~= false
    else
        removedOk = false
    end

    if not removedOk then
        return TriggerClientEvent('ox_lib:notify', src, {
            title = 'Fines',
            description = 'Could not take the money from your bank.',
            type = 'error'
        })
    end

    -- Zero the accumulator & mark btc_fines as paid
    
    TriggerClientEvent('ox_lib:notify', src, {
        title = 'Fines',
        description = ('You paid $%d in fines.'):format(outstanding),
        type = 'success'
    })
end)

RegisterNetEvent('rsg-banking:server:receivePaycheck', function()
    print('paycheck')
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    local paycheck = MySQL.single.await('SELECT paycheck FROM players WHERE citizenid = ?', { Player.PlayerData.citizenid })

    if paycheck.paycheck <= 0 then
        TriggerClientEvent('ox_lib:notify', src, { title = 'Paycheck', description = 'You have no paycheck to collect.', type = 'error' })
        return
    end

    local payment = paycheck.paycheck 
    Player.Functions.AddMoney('cash', payment)
    MySQL.single.await('UPDATE players SET paycheck = 0 WHERE citizenid = ?', { Player.PlayerData.citizenid })
    TriggerClientEvent('ox_lib:notify', src, { title = 'Paycheck', description = 'Received $' ..payment, type = 'error' })
end)

lib.callback.register('rsg-banking:server:checkLawmen',function(source)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)

    local jobType = Player.PlayerData.job.type 

    if jobType == 'leo' then
        return true
    end

    return false
end)