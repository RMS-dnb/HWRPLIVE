local RSGCore = exports['rsg-core']:GetCoreObject()
local OwnedHouses = {}
lib.locale()

local function SyncOwnedHouses()
    local houses = MySQL.query.await('SELECT h.houseid, h.fullname, h.citizenid FROM rex_houses h WHERE h.owned = 1')
    
    local ownedHouses = {}
    for _, house in ipairs(houses) do
        if house.houseid and house.fullname ~= '0' then
            ownedHouses[house.houseid] = {
                owner = house.fullname,
                citizenid = house.citizenid
            }
        end
    end
    
    TriggerClientEvent('rex-houses:client:SyncOwnedHouses', -1, ownedHouses)
end
RegisterNetEvent('rex-houses:server:SyncAllHouses', function()
    local src = source
    local houses = MySQL.query.await('SELECT h.houseid, h.fullname, h.citizenid FROM rex_houses h WHERE h.owned = 1')
    
    local ownedHouses = {}
    for _, house in ipairs(houses) do
        if house.houseid and house.fullname ~= '0' then
            ownedHouses[house.houseid] = {
                owner = house.fullname,
                citizenid = house.citizenid
            }
        end
    end
    
    TriggerClientEvent('rex-houses:client:SyncOwnedHouses', -1, ownedHouses)
end)

RegisterNetEvent('rex-houses:server:UpdateOwnedHouse', function(houseId, playerName, citizenId)
    OwnedHouses[houseId] = {
        owner = playerName,
        citizenid = citizenId
    }
    SyncOwnedHouses()
end)

RegisterServerEvent('rex-houses:server:RequestOwnedHouses')
AddEventHandler('rex-houses:server:RequestOwnedHouses', function()
    local src = source
    TriggerClientEvent('rex-houses:client:SyncOwnedHouses', src, OwnedHouses)
end)

RegisterNetEvent('rex-houses:server:RemoveOwnedHouse', function(houseId)
    OwnedHouses[houseId] = nil
    SyncOwnedHouses()
end)

RSGCore.Functions.CreateCallback('rex-houses:server:GetOwnedHouses', function(source, cb)
    cb(OwnedHouses)
end)


AddEventHandler('playerConnecting', function()
    local src = source
    TriggerClientEvent('rex-houses:client:SyncOwnedHouses', src, OwnedHouses)
end)

-- get house keys
RSGCore.Functions.CreateCallback('rex-houses:server:GetHouseKeys', function(source, cb)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local citizenid = Player.PlayerData.citizenid
    local housekeys = MySQL.query.await('SELECT * FROM rex_housekeys WHERE citizenid=@citizenid',
    {
        ['@citizenid'] = citizenid
    })

    if housekeys[1] == nil then return end

    cb(housekeys)
end)

-- get house keys (guests)
RSGCore.Functions.CreateCallback('rex-houses:server:GetGuestHouseKeys', function(source, cb)
    local guestinfo = MySQL.query.await('SELECT * FROM rex_housekeys WHERE guest=@guest', {['@guest'] = 1})

    if guestinfo[1] == nil then return end

    cb(guestinfo)
end)

-- get house info
RSGCore.Functions.CreateCallback('rex-houses:server:GetHouseInfo', function(source, cb)
    local houseinfo = MySQL.query.await('SELECT * FROM rex_houses', {})

    if houseinfo[1] == nil then return end

    cb(houseinfo)
end)

-- get owned house info
RSGCore.Functions.CreateCallback('rex-houses:server:GetOwnedHouseInfo', function(source, cb)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if Player == nil then return end
    local citizenid = Player.PlayerData.citizenid
    local houseinfo = MySQL.query.await('SELECT * FROM rex_houses WHERE citizenid=@citizenid AND owned=@owned', { ['@citizenid'] = citizenid, ['@owned'] = 1 })

    if houseinfo[1] == nil then 
        return
    end
    
    cb(houseinfo)
end)

RegisterServerEvent('rex-houses:server:openinventory', function(stashName, invWeight, invSlots)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    local data = {
        label = stashName,
        maxweight = invWeight,
        slots = invSlots
    }
    exports['rsg-inventory']:OpenInventory(src, stashName, data)
end)

-- buy house
RegisterServerEvent('rex-houses:server:buyhouse', function(data)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local citizenid = Player.PlayerData.citizenid
    local firstname = Player.PlayerData.charinfo.firstname
    local lastname = Player.PlayerData.charinfo.lastname
    local fullname = (firstname..' '..lastname)
    local housecount = MySQL.prepare.await('SELECT COUNT(*) FROM rex_houses WHERE citizenid = ?', {citizenid})

    if housecount >= 1 then
        TriggerClientEvent('ox_lib:notify', src, {
            title = locale('sv_lang_1'),
            description = locale('sv_lang_2'),
            type = 'error'
        })
        return
    end

    if (Player.PlayerData.money.cash < data.price) then
        TriggerClientEvent('ox_lib:notify', src, {
            title = locale('sv_lang_1'),
            description = locale('sv_lang_3'),
            type = 'error'
        })
        return
    end

    MySQL.update('UPDATE rex_houses SET citizenid = ?, fullname = ?, owned = ?, credit = ? WHERE houseid = ?',
    {   citizenid,
        fullname,
        1,
        Config.StartCredit,
        data.house
    })

    MySQL.insert('INSERT INTO rex_housekeys(citizenid, houseid) VALUES(@citizenid, @houseid)',
    {   ['@citizenid']  = citizenid,
        ['@houseid']    = data.house
    })

    Player.Functions.RemoveMoney('cash', data.price)
    TriggerClientEvent('ox_lib:notify', src, {
        title = locale('sv_lang_1'),
        description = locale('sv_lang_4'),
        type = 'success'
    })

    -- Update OwnedHouses with new ownership info
    OwnedHouses[data.house] = {
        owner = fullname,
        citizenid = citizenid
    }
    
    -- Broadcast the update to all clients
    TriggerClientEvent('rex-houses:client:SyncOwnedHouses', -1, OwnedHouses)
end)

-- sell house
RegisterServerEvent('rex-houses:server:sellhouse', function(data)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)

    MySQL.update('UPDATE rex_houses SET citizenid = 0, fullname = 0, credit = 0, owned = 0 WHERE houseid = ?', {data.house})
    MySQL.update('DELETE FROM rex_housekeys WHERE houseid = ?', {data.house})
    Player.Functions.AddMoney('cash', data.price, "house-sale")
    TriggerClientEvent('ox_lib:notify', src, {
        title = locale('sv_lang_5'),
        description = locale('sv_lang_6'),
        type = 'success'
    })

    -- Remove house from OwnedHouses
    OwnedHouses[data.house] = nil
    SyncOwnedHouses()
end)


-- add house credit
RegisterNetEvent('rex-houses:server:addcredit', function(newcredit, removemoney, houseid)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local cashBalance = Player.PlayerData.money["cash"]
        
    if cashBalance >= removemoney then
        Player.Functions.RemoveMoney("cash", removemoney, "land-tax-credit")
        MySQL.update('UPDATE rex_houses SET credit = ? WHERE houseid = ?', {newcredit, houseid})
        TriggerClientEvent('ox_lib:notify', src, {
            title = locale('sv_lang_7'),
            description = locale('sv_lang_8')..houseid,
            type = 'success'
        })
        Wait(3000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = locale('sv_lang_7'),
            description = locale('sv_lang_9')..newcredit,
            type = 'inform'
        })
    else
        TriggerClientEvent('ox_lib:notify', src, {
            title = locale('sv_lang_7'),
            description = locale('sv_lang_10'),
            type = 'error'
        })
    end
end)

-- remove house credit
RegisterNetEvent('rex-houses:server:removecredit', function(newcredit, removemoney, houseid)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local cashBalance = Player.PlayerData.money["cash"]
        
    if cashBalance >= removemoney then
        local updatedCredit = newcredit

        if updatedCredit < 0 then
            TriggerClientEvent('ox_lib:notify', src, {
                title = locale('sv_lang_7'),
                description = locale('sv_lang_11'),
                type = 'error'
            })
            return
        end

        Player.Functions.AddMoney("cash", removemoney, "land-tax-credit")
        MySQL.update('UPDATE rex_houses SET credit = ? WHERE houseid = ?', {updatedCredit, houseid})
        TriggerClientEvent('ox_lib:notify', src, {
            title = locale('sv_lang_7'),
            description = locale('sv_lang_12')..houseid,
            type = 'success'
        })
        Wait(3000)
        TriggerClientEvent('ox_lib:notify', src, {
            title = locale('sv_lang_7'),
            description = locale('sv_lang_13')..updatedCredit,
            type = 'inform'
        })
    else
        TriggerClientEvent('ox_lib:notify', src, {
            title = locale('sv_lang_7'),
            description = locale('sv_lang_14'),
            type = 'error'
        })
    end
end)

--------------------------------------------------------------------------------------------------

-- get all door states
RSGCore.Functions.CreateCallback('rex-houses:server:GetDoorState', function(source, cb)
    local doorstate = MySQL.query.await('SELECT * FROM rex_doors', {})
    if doorstate[1] == nil then return end
    cb(doorstate)
end)

-- get current door state
RSGCore.Functions.CreateCallback('rex-houses:server:GetCurrentDoorState', function(source, cb, door)
    local result = MySQL.query.await('SELECT doorstate FROM rex_doors WHERE doorid = ?', {door})
    if result[1] == nil then return end
    cb(result[1].doorstate)
end)

-- get specific door state
RegisterNetEvent('rex-houses:server:GetSpecificDoorState', function(door)
    local src = source
    local result = MySQL.query.await('SELECT * FROM rex_doors WHERE doorid = ?', {door})

    if result[1] == nil then return end

    local doorid = result[1].doorid
    local doorstate = result[1].doorstate

    if Config.Debug then
        print("")
        print("Door ID: "..doorid)
        print("Door State: "..doorstate)
        print("")
    end

    TriggerClientEvent('rex-houses:client:GetSpecificDoorState', src, doorid, doorstate)
end)

-- update door state
RegisterNetEvent('rex-houses:server:UpdateDoorState', function(doorid, doorstate)
    local src = source

    MySQL.update('UPDATE rex_doors SET doorstate = ? WHERE doorid = ?', {doorstate, doorid})

    TriggerClientEvent('rex-houses:client:GetSpecificDoorState', src, doorid, doorstate)
end)

RegisterNetEvent('rex-houses:server:UpdateDoorStateRestart', function()
    local result = MySQL.query.await('SELECT * FROM rex_doors WHERE doorstate=@doorstate', {['@doorstate'] = 1})
    
    if not result then
        MySQL.update('UPDATE rex_doors SET doorstate = 1')
    end
end)

--------------------------------------------------------------------------------------------------

-- land tax billing loop
BillingInterval = function()
    local result = MySQL.query.await('SELECT * FROM rex_houses WHERE owned=@owned', {['@owned'] = 1})

    if not result then goto continue end

    for i = 1, #result do
        local row = result[i]

        if Config.Debug then
            print(row.agent, row.houseid, row.citizenid, row.fullname, row.owned, row.price, row.credit)
        end

        if row.credit >= Config.LandTaxPerCycle then
            local creditadjust = (row.credit - Config.LandTaxPerCycle)

            MySQL.update('UPDATE rex_houses SET credit = ? WHERE houseid = ? AND citizenid = ?',
            {   creditadjust,
                row.houseid,
                row.citizenid
            })

            local creditwarning = (Config.LandTaxPerCycle * Config.CreditWarning)

            if row.credit < creditwarning then
                MySQL.insert('INSERT INTO telegrams (citizenid, recipient, sender, sendername, subject, sentDate, message) VALUES (?, ?, ?, ?, ?, ?, ?)',
                {   row.citizenid,
                    row.fullname,
                    '22222222',
                    'Land Tax Office',
                    'Land Tax Credit Due to Run Out!',
                    os.date("%x"),
                    'Your land tax credit for your house is due to run out!',
                })
            end
        else
            MySQL.insert('INSERT INTO telegrams (citizenid, recipient, sender, sendername, subject, sentDate, message) VALUES (?, ?, ?, ?, ?, ?, ?)',
            {   row.citizenid,
                row.fullname,
                '22222222',
                'Land Tax Office',
                'Land Tax Credit Ran Out!',
                os.date("%x"),
                'Due to lack of tax credit, your house has been repossessed!',
            })

            Wait(1000)

            MySQL.update('UPDATE rex_houses SET citizenid = 0, fullname = 0, owned = 0 WHERE houseid = ?', {row.houseid})
            MySQL.update('DELETE FROM rex_housekeys WHERE houseid = ?', {row.houseid})
            if Config.PurgeStorage then
                MySQL.update('DELETE FROM inventories WHERE identifier = ?', {row.houseid})
            end
            TriggerEvent('rsg-log:server:CreateLog', 'rexhouses', 'House Lost', 'red', row.fullname..' house '..row.houseid..' has been lost due to non payment of tax!')
        end

        if row.agent == 'newhanover' then
           exports['rsg-bossmenu']:AddMoney('govenor1', Config.LandTaxPerCycle)
        end

        if row.agent == 'westelizabeth' then
            exports['rsg-bossmenu']:AddMoney('govenor2', Config.LandTaxPerCycle)
        end

        if row.agent == 'newaustin' then
            exports['rsg-bossmenu']:AddMoney('govenor3', Config.LandTaxPerCycle)
        end

        if row.agent == 'ambarino' then
            exports['rsg-bossmenu']:AddMoney('govenor4', Config.LandTaxPerCycle)
        end

        if row.agent == 'lemoyne' then
            exports['rsg-bossmenu']:AddMoney('govenor5', Config.LandTaxPerCycle)
        end
    end

    ::continue::

    print('Land Tax Billing Cycle Complete')

    SetTimeout(Config.BillingCycle * (60 * 60 * 1000), BillingInterval) -- hours
    -- SetTimeout(Config.BillingCycle * (60 * 1000), BillingInterval) -- mins (for testing)
end

SetTimeout(Config.BillingCycle * (60 * 60 * 1000), BillingInterval) -- hours
-- SetTimeout(Config.BillingCycle * (60 * 1000), BillingInterval) -- mins (for testing)

--------------------------------------------------------------------------------------------------

-- add house guest
RegisterNetEvent('rex-houses:server:addguest', function(cid, houseid)
    local src = source
    local keycount = MySQL.prepare.await('SELECT COUNT(*) FROM rex_housekeys WHERE citizenid = ? AND houseid = ?', {cid, houseid})

    if keycount >= 1 then
        TriggerClientEvent('ox_lib:notify', src, {
            title = locale('sv_lang_24'),
            description = locale('sv_lang_25'),
            type = 'error'
        })
        return
    end

    MySQL.insert('INSERT INTO rex_housekeys(citizenid, houseid, guest) VALUES(@citizenid, @houseid, @guest)',
    {   ['@citizenid']  = cid,
        ['@houseid']    = houseid,
        ['@guest']      = 1,
    })
    TriggerClientEvent('ox_lib:notify', src, {
        title = locale('sv_lang_24'),
        description = cid..locale('sv_lang_26'),
        type = 'success'
    })
end)

RegisterNetEvent('rex-houses:server:removeguest', function(houseid, guestcid)
    local src = source
    MySQL.update('DELETE FROM rex_housekeys WHERE houseid = ? AND citizenid = ?', { houseid, guestcid })
    TriggerClientEvent('ox_lib:notify', src, {
        title = locale('sv_lang_24'),
        description = guestcid..locale('sv_lang_27'),
        type = 'success'
    })
end)

RegisterNetEvent('rex-houses:server:OpenStorage', function(house)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then 
        print(locale('sv_lang_28'))
        return 
    end

    -- Check if player has access to this house
    local hasAccess = MySQL.query.await('SELECT COUNT(*) as count FROM rex_housekeys WHERE citizenid = ? AND houseid = ?', 
    {
        Player.PlayerData.citizenid,
        house
    })
    
    if not hasAccess then
        TriggerClientEvent('ox_lib:notify', src, {
            title = locale('sv_lang_29'),
            description = locale('sv_lang_30'),
            type = 'error'
        })
        print(locale('sv_lang_31'))
        return
    end
    
    if hasAccess[1].count == 0 then
        TriggerClientEvent('ox_lib:notify', src, {
            title = locale('sv_lang_29'),
            description = locale('sv_lang_32'),
            type = 'error'
        })
        return
    end

    -- Define a unique stash ID for the house
    local stashId = "house_storage_" .. house   -- Unique identifier for each house stash
    local maxWeight = Config.StorageMaxWeight   -- Maximum weight for the stash
    local slots = Config.StorageMaxSlots        -- Number of slots for the stash

    -- Open the storage inventory with predefined weight and slots
    local data = { label = locale('sv_lang_29'), maxweight = maxWeight, slots = slots }
    exports['rsg-inventory']:OpenInventory(src, stashId, data)
end)

CreateThread(function()
    Wait(1000) -- Wait for database to be ready
    local houses = MySQL.query.await('SELECT houseid, fullname, citizenid FROM rex_houses WHERE owned = 1')
    
    for _, house in ipairs(houses) do
        if house.houseid and house.fullname ~= '0' then
            OwnedHouses[house.houseid] = {
                owner = house.fullname,
                citizenid = house.citizenid
            }
        end
    end
    
    print(locale('sv_lang_33') .. #houses .. locale('sv_lang_34'))
end)

RegisterNetEvent('RSGCore:Client:OnPlayerLoaded', function()
    local src = source
    TriggerClientEvent('rex-houses:client:SyncOwnedHouses', src, OwnedHouses)
end)

-- Admin Command to set house ownership
RSGCore.Commands.Add('sethousetoplayer', 'Admin: Set house ownership to a player', {
    {name = 'playerid', help = 'Server ID of the player'},
    {name = 'houseid', help = 'House ID to assign'}
}, true, function(source, args)
    local src = source
    local adminPlayer = RSGCore.Functions.GetPlayer(src)
    
    -- Check if player has appropriate job for admin permissions
    local adminJob = adminPlayer.PlayerData.job.name
    local allowedJobs = {"graverose", "moderator", "developer"} -- Add or modify job names as needed
    
    local hasPermission = false
    for _, job in pairs(allowedJobs) do
        if adminJob == job then
            hasPermission = true
            break
        end
    end
    
    if not hasPermission then
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'House System',
            description = 'You do not have permission to use this command',
            type = 'error'
        })
        return
    end
    
    -- Validate inputs
    if not args[1] or not args[2] then
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'House System',
            description = 'Invalid parameters. Use: /sethousetoplayer [playerid] [houseid]',
            type = 'error'
        })
        return
    end
    
    local targetPlayerId = tonumber(args[1])
    local houseId = args[2]
    
    -- Check if player exists
    local targetPlayer = RSGCore.Functions.GetPlayer(targetPlayerId)
    if not targetPlayer then
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'House System',
            description = 'Player not found',
            type = 'error'
        })
        return
    end
    
    -- Check if house exists
    local houseExists = MySQL.prepare.await('SELECT COUNT(*) FROM rex_houses WHERE id = ?', {houseId})
    if houseExists < 1 then
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'House System',
            description = 'House ID does not exist',
            type = 'error'
        })
        return
    end
    
    -- Check if house is already owned
    local currentOwner = MySQL.query.await('SELECT citizenid, fullname FROM rex_houses WHERE id = ? AND owned = 1', {houseId})
    if currentOwner[1] then
        -- Remove keys from previous owner
        MySQL.update('DELETE FROM rex_housekeys WHERE houseid = ?', {houseId})
    end
    
    -- Set house to new owner
    local citizenid = targetPlayer.PlayerData.citizenid
    local firstname = targetPlayer.PlayerData.charinfo.firstname
    local lastname = targetPlayer.PlayerData.charinfo.lastname
    local fullname = (firstname..' '..lastname)
    
    MySQL.update('UPDATE rex_houses SET citizenid = ?, fullname = ?, owned = ?, credit = ? WHERE id = ?',
    {   
        citizenid,
        fullname,
        1,
        Config.StartCredit,
        houseId
    })
    
    -- Add house key for new owner
    MySQL.insert('INSERT INTO rex_housekeys(citizenid, id) VALUES(?, ?)',
    {   
        citizenid,
        houseId
    })
    
    -- Update OwnedHouses with new ownership info
    OwnedHouses[houseId] = {
        owner = fullname,
        citizenid = citizenid
    }
    
    -- Sync to all clients
    SyncOwnedHouses()
    
    -- Notify admin and player
    TriggerClientEvent('ox_lib:notify', src, {
        title = 'House System',
        description = 'Successfully assigned house '..houseId..' to '..fullname,
        type = 'success'
    })
    
    TriggerClientEvent('ox_lib:notify', targetPlayerId, {
        title = 'House System',
        description = 'You have been granted ownership of house '..houseId,
        type = 'success'
    })
    
    -- Log the action
    TriggerEvent('rsg-log:server:CreateLog', 'rexhouses', 'Admin House Assignment', 'green', 'Admin ' .. adminPlayer.PlayerData.name .. ' assigned house ' .. houseId .. ' to ' .. fullname)
end)