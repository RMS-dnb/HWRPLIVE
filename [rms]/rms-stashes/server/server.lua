local RSGCore = exports['rsg-core']:GetCoreObject()
local PropsLoaded = false

----------------------------------------------------
-- create stash command
----------------------------------------------------
-- RSGCore.Commands.Add("createstash", "creates a player stash", {}, false, function(source)
--     local src = source
--     local Player = RSGCore.Functions.GetPlayer(src)
--     local cid = Player.PlayerData.citizenid
--     TriggerClientEvent('rex-stashes:client:createstash', src, 'playerstash', Config.StashProp)
-- end)

RSGCore.Functions.CreateUseableItem("stashchest", function(source, item)
    local Player = RSGCore.Functions.GetPlayer(source)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local cid = Player.PlayerData.citizenid
    -- DON'T REMOVE ITEM HERE - only trigger the placement
    TriggerClientEvent('rex-stashes:client:createstash', src, 'playerstash', Config.StashProp)
end)

---------------------------------------------
-- get all prop data
---------------------------------------------
RSGCore.Functions.CreateCallback('rex-stashes:server:getallpropdata', function(source, cb, propid)
    MySQL.query('SELECT * FROM player_stashes WHERE propid = ?', {propid}, function(result)
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
RSGCore.Functions.CreateCallback('rex-stashes:server:countprop', function(source, cb, proptype)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local citizenid = Player.PlayerData.citizenid
    
    print("Checking stash count for citizenid:", citizenid, "proptype:", proptype) -- Debug print
    
    local result = MySQL.prepare.await("SELECT COUNT(*) as count FROM player_stashes WHERE citizenid = ? AND proptype = ?", { citizenid, proptype })
    
    print("Database returned count:", result) -- Debug print
    
    if result then
        cb(result)
    else
        print("No result from database, returning 0") -- Debug print
        cb(0)
    end
end)

---------------------------------------------
-- update prop data
---------------------------------------------
CreateThread(function()
    while true do
        Wait(5000)

        if PropsLoaded then
            TriggerClientEvent('rex-stashes:client:updatePropData', -1, Config.PlayerProps)
        end
    end
end)

---------------------------------------------
-- get props
---------------------------------------------
CreateThread(function()
    TriggerEvent('rex-stashes:server:getProps')
    PropsLoaded = true
end)

---------------------------------------------
-- save props
---------------------------------------------
RegisterServerEvent('rex-stashes:server:saveProp')
AddEventHandler('rex-stashes:server:saveProp', function(data, propId, citizenid, proptype)
    local datas = json.encode(data)

    MySQL.Async.execute('INSERT INTO player_stashes (properties, propid, citizenid, proptype) VALUES (@properties, @propid, @citizenid, @proptype)',
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
RegisterServerEvent('rex-stashes:server:newProp')
AddEventHandler('rex-stashes:server:newProp', function(proptype, location, heading, hash)
    local src = source
    local propId = math.random(111111, 999999)
    local Player = RSGCore.Functions.GetPlayer(src)
    local citizenid = Player.PlayerData.citizenid

    -- REMOVE ITEM HERE - only on successful placement
    Player.Functions.RemoveItem("stashchest", 1)
    TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items["stashchest"], "remove")

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

    table.insert(Config.PlayerProps, PropData)
    TriggerEvent('rex-stashes:server:saveProp', PropData, propId, citizenid, proptype)
    TriggerEvent('rex-stashes:server:updateProps')

end)

---------------------------------------------
-- distory prop
---------------------------------------------
RegisterServerEvent('rex-stashes:server:destroyProp')
AddEventHandler('rex-stashes:server:destroyProp', function(propid, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)

    for k, v in pairs(Config.PlayerProps) do
        if v.id == propid then
            table.remove(Config.PlayerProps, k)
        end
    end

    TriggerClientEvent('rex-stashes:client:removePropObject', src, propid)
    TriggerEvent('rex-stashes:server:PropRemoved', propid)
    TriggerEvent('rex-stashes:server:updateProps')
    Player.Functions.AddItem("stashchest", 1)
end)

---------------------------------------------
-- update props
---------------------------------------------
RegisterServerEvent('rex-stashes:server:updateProps')
AddEventHandler('rex-stashes:server:updateProps', function()
    local src = source
    TriggerClientEvent('rex-stashes:client:updatePropData', src, Config.PlayerProps)
end)

RegisterServerEvent('rex-stashes:server:updateCampProps')
AddEventHandler('rex-stashes:server:updateCampProps', function(id, data)
    local result = MySQL.query.await('SELECT * FROM player_stashes WHERE propid = @propid',
    {
        ['@propid'] = id
    })

    if not result[1] then return end

    local newData = json.encode(data)

    MySQL.Async.execute('UPDATE player_stashes SET properties = @properties WHERE propid = @id',
    {
        ['@properties'] = newData,
        ['@id'] = id
    })
end)

---------------------------------------------
-- remove props
---------------------------------------------
RegisterServerEvent('rex-stashes:server:PropRemoved')
AddEventHandler('rex-stashes:server:PropRemoved', function(propId)
    local result = MySQL.query.await('SELECT * FROM player_stashes')

    if not result then return end

    for i = 1, #result do
        local propData = json.decode(result[i].properties)

        if propData.id == propId then

            -- MySQL.Async.execute('DELETE FROM player_stashes WHERE id = @id', { ['@id'] = result[i].id })
            -- MySQL.Async.execute('DELETE FROM stashitems WHERE stash = @stash', { ['@stash'] = 'stash'..result[i].propid })
            MySQL.Async.execute('DELETE FROM player_stashes WHERE id', { ['@id'] = result[i].id })
            MySQL.Async.execute('DELETE FROM inventories WHERE identifier', { ['@identifier'] = 'stash'..result[i].propid })

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
RegisterServerEvent('rex-stashes:server:getProps')
AddEventHandler('rex-stashes:server:getProps', function()
    local result = MySQL.query.await('SELECT * FROM player_stashes')

    if not result[1] then return end

    for i = 1, #result do
        local propData = json.decode(result[i].properties)
        print(Lang:t('server.lang_1')..propData.proptype..Lang:t('server.lang_2')..propData.id)
        table.insert(Config.PlayerProps, propData)
    end
end)

---------------------------------------------
-- remove item
---------------------------------------------
RegisterServerEvent('rex-stashes:server:removeitem')
AddEventHandler('rex-stashes:server:removeitem', function(item, amount)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(item, amount)
    TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items[item], "remove")
end)

RegisterNetEvent('rex-stashes-hotel:server:openinventory', function(stashName)
    local src = source
    print("Server Event Triggered: ", stashName) -- Debug print
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then 
        print("No player found for source: ", src) -- Debug print
        return 
    end

    local data = {
        maxweight = Config.StorageMaxWeight,
        slots = Config.StorageMaxSlots
    }
    print("Opening inventory for: ", stashName, " with data: ", data) -- Debug print
    exports['rsg-inventory']:OpenInventory(src, stashName, data)
end)