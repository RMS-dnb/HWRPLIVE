local RSGCore = exports['rsg-core']:GetCoreObject()
local PropsLoaded = false
local CollectedPoop = {}


RegisterNetEvent('grrp_moonshiners:SyncSmoke', function(action, coords)
    TriggerClientEvent('grrp_moonshiners:' .. (action == "start" and "StartCookingSmoke" or "StopCookingSmoke"), -1, coords)
end)



-- use campmoonshine
RSGCore.Functions.CreateUseableItem("campmoonshine", function(source)
    local src = source
    TriggerClientEvent('rms-moonshiner:client:createprop', src, 'campmoonshine', Config.MoonshineProp, 'campmoonshine')
end)

---------------------------------------------
-- get all prop data
---------------------------------------------
RSGCore.Functions.CreateCallback('rms-moonshiner:server:getallpropdata', function(source, cb, propid)
    MySQL.query('SELECT * FROM rms_moonshiner WHERE propid = ?', {propid}, function(result)
        if result[1] then
            cb(result)
        else
            cb(nil)
        end
    end)
end)

---------------------------------------------
-- count props
---------------------------------------------
RSGCore.Functions.CreateCallback('rms-moonshiner:server:countprop', function(source, cb, proptype)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local citizenid = Player.PlayerData.citizenid
    local result = MySQL.prepare.await("SELECT COUNT(*) as count FROM rms_moonshiner WHERE citizenid = ? AND proptype = ?", { citizenid, proptype })
    if result then
        cb(result)
    else
        cb(nil)
    end
end)

---------------------------------------------
-- update prop data
---------------------------------------------
CreateThread(function()
    while true do
        Wait(5000)

        if PropsLoaded then
            TriggerClientEvent('rms-moonshiner:client:updatePropData', -1, Config.PlayerProps)
        end
    end
end)

---------------------------------------------
-- get props
---------------------------------------------
CreateThread(function()
    TriggerEvent('rms-moonshiner:server:getProps')
    PropsLoaded = true
end)

---------------------------------------------
-- save props
---------------------------------------------
RegisterServerEvent('rms-moonshiner:server:saveProp')
AddEventHandler('rms-moonshiner:server:saveProp', function(data, propId, citizenid, proptype)
    local datas = json.encode(data)

    MySQL.Async.execute('INSERT INTO rms_moonshiner (properties, propid, citizenid, proptype) VALUES (@properties, @propid, @citizenid, @proptype)',
    {
        ['@properties'] = datas,
        ['@propid'] = propId,
        ['@citizenid'] = citizenid,
        ['@proptype'] = proptype
    })
end)

---------------------------------------------
-- new prop
---------------------------------------------
RegisterServerEvent('rms-moonshiner:server:newProp')
AddEventHandler('rms-moonshiner:server:newProp', function(proptype, location, heading, hash)
    local src = source
    local propId = math.random(111111, 999999)
    local Player = RSGCore.Functions.GetPlayer(src)
    local citizenid = Player.PlayerData.citizenid

    local PropData =
    {
        id = propId,
        proptype = proptype,
        x = location.x,
        y = location.y,
        z = location.z,
        h = heading,
        hash = hash,
        builder = Player.PlayerData.citizenid,
        buildttime = os.time()
    }

    local PropCount = 0

    for _, v in pairs(Config.PlayerProps) do
        if v.builder == Player.PlayerData.citizenid then
            PropCount = PropCount + 1
        end
    end

    if PropCount >= Config.MaxPropCount then
        TriggerClientEvent('ox_lib:notify', src, {title = Lang:t('server.lang_1'), description = Lang:t('server.lang_2'), type = 'inform', duration = 5000 })
    else
        table.insert(Config.PlayerProps, PropData)
        Player.Functions.RemoveItem(proptype, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items[proptype], "remove")
        TriggerEvent('rms-moonshiner:server:saveProp', PropData, propId, citizenid, proptype)
        TriggerEvent('rms-moonshiner:server:updateProps')
    end
end)

---------------------------------------------
-- distory prop
---------------------------------------------
RegisterServerEvent('rms-moonshiner:server:destroyProp')
AddEventHandler('rms-moonshiner:server:destroyProp', function(propid, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    
    if Config.EnableCredit then
        MySQL.query('SELECT * FROM rms_moonshiner WHERE propid = ?', {propid}, function(result)
            local returncredit = result[1].credit
            Player.Functions.AddItem("camp_supply", returncredit, false, false, "camp-return-credit")
            TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items["camp_supply"], "add")
            TriggerClientEvent('ox_lib:notify', src, {title = Lang:t('server.lang_3'), description = Lang:t('server.lang_4')..returncredit..Lang:t('server.lang_5'), type = 'inform', duration = 7000 })
        end)
    end

    for k, v in pairs(Config.PlayerProps) do
        if v.id == propid then
            table.remove(Config.PlayerProps, k)
        end
    end

    TriggerClientEvent('rms-moonshiner:client:removePropObject', src, propid)
    TriggerEvent('rms-moonshiner:server:PropRemoved', propid)
    TriggerEvent('rms-moonshiner:server:updateProps')
    Player.Functions.AddItem(item, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items[item], "add")
end)

---------------------------------------------
-- LEO destroy prop (server-side)
---------------------------------------------
RegisterServerEvent('rms-moonshiner:server:leodestroyProp')
AddEventHandler('rms-moonshiner:server:leodestroyProp', function(propid)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    
    -- Verify player is LEO
    if Player.PlayerData.job.type ~= 'leo' then
        TriggerClientEvent('ox_lib:notify', src, {title = 'Access Denied', description = 'Only law enforcement can destroy stills', type = 'error', duration = 5000 })
        return
    end
    
    -- Get prop owner info for logging
    local propOwner = nil
    for k, v in pairs(Config.PlayerProps) do
        if v.id == propid then
            propOwner = v.builder
            table.remove(Config.PlayerProps, k)
            break
        end
    end
    
    -- Remove from database using the same method as PropRemoved
    local result = MySQL.query.await('SELECT * FROM rms_moonshiner WHERE propid = ?', {propid})
    
    if result and result[1] then
        -- Delete using the primary key 'id' from the result
        MySQL.Async.execute('DELETE FROM rms_moonshiner WHERE id = ?', {result[1].id})
        print('^2[SUCCESS]^7 Deleted moonshine still from database (DB ID: ' .. result[1].id .. ', PropID: ' .. propid .. ')')
    else
        print('^1[ERROR]^7 Could not find moonshine still in database (PropID: ' .. propid .. ')')
    end
    
    -- Update props for all clients
    TriggerClientEvent('rms-moonshiner:client:updatePropData', -1, Config.PlayerProps)
    
    -- Remove the prop object from all clients
    TriggerClientEvent('rms-moonshiner:client:removePropObject', -1, propid)
    
    -- Log the destruction
    local officerName = Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname
    print('^3[LEO ACTION]^7 ' .. officerName .. ' (CID: ' .. Player.PlayerData.citizenid .. ') destroyed moonshine still (PropID: ' .. propid .. ', Owner: ' .. (propOwner or 'Unknown') .. ')')
    
    -- Optional: Add to your logging system if you have one
    TriggerEvent('rsg-log:server:CreateLog', 'leo', 'Still Destroyed', 'red', officerName .. ' destroyed a moonshine still belonging to ' .. (propOwner or 'Unknown'))
    
    -- Notify the officer
    TriggerClientEvent('ox_lib:notify', src, {
        title = 'Still Destroyed', 
        description = 'Moonshine operation has been shut down and removed from the area', 
        type = 'success', 
        duration = 5000 
    })
end)

---------------------------------------------
-- update props
---------------------------------------------
RegisterServerEvent('rms-moonshiner:server:updateProps')
AddEventHandler('rms-moonshiner:server:updateProps', function()
    local src = source
    TriggerClientEvent('rms-moonshiner:client:updatePropData', src, Config.PlayerProps)
end)

RegisterServerEvent('rms-moonshiner:server:updateCampProps')
AddEventHandler('rms-moonshiner:server:updateCampProps', function(id, data)
    local result = MySQL.query.await('SELECT * FROM rms_moonshiner WHERE propid = @propid',
    {
        ['@propid'] = id
    })

    if not result[1] then return end

    local newData = json.encode(data)

    MySQL.Async.execute('UPDATE rms_moonshiner SET properties = @properties WHERE propid = @id',
    {
        ['@properties'] = newData,
        ['@id'] = id
    })
end)

---------------------------------------------
-- remove props
---------------------------------------------
RegisterServerEvent('rms-moonshiner:server:PropRemoved')
AddEventHandler('rms-moonshiner:server:PropRemoved', function(propId)
    local result = MySQL.query.await('SELECT * FROM rms_moonshiner')

    if not result then return end

    for i = 1, #result do
        local propData = json.decode(result[i].properties)

        if propData.id == propId then
            MySQL.Async.execute('DELETE FROM rms_moonshiner WHERE id = @id',
            {
                ['@id'] = result[i].id
            })

            for k, v in pairs(Config.PlayerProps) do
                if v.id == propId then
                    table.remove(Config.PlayerProps, k)
                end
            end
        end
    end
end)

---------------------------------------------
-- get props
---------------------------------------------
RegisterServerEvent('rms-moonshiner:server:getProps')
AddEventHandler('rms-moonshiner:server:getProps', function()
    local result = MySQL.query.await('SELECT * FROM rms_moonshiner')

    if not result[1] then return end

    for i = 1, #result do
        local propData = json.decode(result[i].properties)
        print('loading '..propData.proptype..' prop with ID: '..propData.id)
        table.insert(Config.PlayerProps, propData)
    end
end)

---------------------------------------------
-- add credit (using camp_supply item)
---------------------------------------------
RegisterNetEvent('rms-moonshiner:server:addcredit', function(newcredit, removeamount, propid)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    
    -- Check if player has enough camp_supply items
    if Player.Functions.GetItemByName("camp_supply") and Player.Functions.GetItemByName("camp_supply").amount >= removeamount then
        -- remove camp_supply items
        Player.Functions.RemoveItem("camp_supply", removeamount)
        TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items["camp_supply"], "remove")
        
        -- sql update
        MySQL.update('UPDATE rms_moonshiner SET credit = ? WHERE propid = ?', {newcredit, propid})
        
        -- notify
        TriggerClientEvent('ox_lib:notify', src, {title = Lang:t('server.lang_6'), description = Lang:t('server.lang_7')..newcredit, type = 'inform', duration = 5000 })
    else
        TriggerClientEvent('ox_lib:notify', src, {title = Lang:t('server.lang_10'), description = 'You need '..removeamount..' camp supplies', type = 'error', duration = 5000 })
    end
end)

---------------------------------------------
-- remove credit (return camp_supply item)
---------------------------------------------
RegisterNetEvent('rms-moonshiner:server:removecredit', function(newcredit, addamount, propid)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    
    -- add camp_supply items
    Player.Functions.AddItem("camp_supply", addamount)
    TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items["camp_supply"], "add")
    
    -- sql update
    MySQL.update('UPDATE rms_moonshiner SET credit = ? WHERE propid = ?', {newcredit, propid})
    
    -- notify
    TriggerClientEvent('ox_lib:notify', src, {title = Lang:t('server.lang_8'), description = Lang:t('server.lang_9')..newcredit, type = 'inform', duration = 5000 })
end)

---------------------------------------------
-- remove item
---------------------------------------------
RegisterServerEvent('rms-moonshiner:server:removeitem')
AddEventHandler('rms-moonshiner:server:removeitem', function(item, amount)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)

    Player.Functions.RemoveItem(item, amount)

    TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items[item], "remove")
end)

---------------------------------------------
-- check player has the ingredients
---------------------------------------------
RSGCore.Functions.CreateCallback('rms-moonshiner:server:checkingredients', function(source, cb, ingredients, makeamount)
    local src = source
    local hasItems = false
    local icheck = 0
    local Player = RSGCore.Functions.GetPlayer(src)
    for k, v in pairs(ingredients) do
        if Player.Functions.GetItemByName(v.item) and Player.Functions.GetItemByName(v.item).amount >= v.amount * makeamount then
            icheck = icheck + 1
            if icheck == #ingredients then
                cb(true)
            end
        else
            TriggerClientEvent('ox_lib:notify', src, {title = Lang:t('server.lang_10'), description = v.item..Lang:t('server.lang_11'), type = 'inform', duration = 7000 })
            cb(false)
            return
        end
    end
end)

-----------------------------------------------
-- finish moonshining
-----------------------------------------------
RegisterServerEvent('rms-moonshiner:server:finishmoonshining')
AddEventHandler('rms-moonshiner:server:finishmoonshining', function(ingredients, receive, giveamount, makeamount)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    -- remove ingredients
    for k, v in pairs(ingredients) do
        if Config.Debug == true then
            print(v.item)
            print(v.amount)
        end
        local requiredAmount = v.amount * makeamount
        Player.Functions.RemoveItem(v.item, requiredAmount)    
        TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items[v.item], "remove")
    end
    -- add item
    Player.Functions.AddItem(receive, giveamount * makeamount)
    TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items[receive], "add")
    local labelReceive = RSGCore.Shared.Items[receive].label
    TriggerClientEvent('ox_lib:notify', source, {title = Lang:t('server.lang_12'), description = makeamount..' x ' .. labelReceive, type = 'success', duration = 7000 })
end)


---------------------------------------------
-- camp upkeep system
---------------------------------------------
UpkeepInterval = function()

    if Config.EnableCredit then
    
        local result = MySQL.query.await('SELECT * FROM rms_moonshiner')

        if not result then goto continue end

        for i = 1, #result do
            local row = result[i]

            if row.credit >= Config.MaintenancePerCycle then
                local creditadjust = (row.credit - Config.MaintenancePerCycle)

                MySQL.update('UPDATE rms_moonshiner SET credit = ? WHERE propid = ?',
                {
                    creditadjust,
                    row.propid
                })
            else
                MySQL.update('DELETE FROM rms_moonshiner WHERE propid = ?', {row.propid})

                if Config.PurgeStorage then
                    --MySQL.update('DELETE FROM inventories WHERE stash = ?', { 'camp_'..row.citizenid })
                    MySQL.update('DELETE FROM inventories WHERE identifier = ?', { 'camp_'..row.citizenid })
                end
                
                if Config.ServerNotify == true then
                    print(Lang:t('server.lang_16')..row.propid..Lang:t('server.lang_17')..row.citizenid.. Lang:t('server.lang_18'))
                end

                TriggerEvent('rsg-log:server:CreateLog', 'camping', Lang:t('server.lang_19'), 'red', row.citizenid..Lang:t('server.lang_20')..row.propid..Lang:t('server.lang_21'))
            end
        end

        ::continue::

        print(Lang:t('server.lang_15'))

        SetTimeout(Config.BillingCycle * (60 * 60 * 1000), UpkeepInterval) -- hours
        --SetTimeout(Config.BillingCycle * (60 * 1000), UpkeepInterval) -- mins (for testing)
        
    end
end

SetTimeout(Config.BillingCycle * (60 * 60 * 1000), UpkeepInterval) -- hours
--SetTimeout(Config.BillingCycle * (60 * 1000), UpkeepInterval) -- mins (for testing)


---------------------------------------------
-- camp storage server event
---------------------------------------------
RegisterNetEvent('rms-moonshiner:server:openinventory', function(stashName)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end  -- Ensure the player is valid

    -- Define inventory data
    local data = {
        maxweight = Config.StorageMaxWeight, -- Maximum weight for the stash
        slots = Config.StorageMaxSlots        -- Maximum slots for the stash
    }

    -- Use the rsg-inventory export to open the inventory for the player
    exports['rsg-inventory']:OpenInventory(src, stashName, data)
end)


RegisterServerEvent('rms-moonshiner:server:stillexploded')
AddEventHandler('rms-moonshiner:server:stillexploded', function(propid)
    local src = source
    
    -- Remove from Config.PlayerProps
    for k, v in pairs(Config.PlayerProps) do
        if v.id == propid then
            table.remove(Config.PlayerProps, k)
        end
    end
    
    -- Remove from database
    MySQL.query('DELETE FROM rms_moonshiner WHERE propid = ?', {propid})
    
    -- Update the props for all players
    TriggerEvent('rms-moonshiner:server:PropRemoved', propid)
    TriggerEvent('rms-moonshiner:server:updateProps')
end)