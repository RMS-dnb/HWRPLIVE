local RSGCore = exports['rsg-core']:GetCoreObject()
local PropsLoaded = false

---------------------------------------------
-- use moneybox
---------------------------------------------
RSGCore.Functions.CreateUseableItem(Config.MoneyBoxItem, function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local firstname = Player.PlayerData.charinfo.firstname
    local lastname = Player.PlayerData.charinfo.lastname
    TriggerClientEvent('rex-moneybox:client:createmoneybox', src, Config.MoneyBoxItem, Config.MoneyBoxProp)
    TriggerEvent('rsg-log:server:CreateLog', 'money_box', 'Creating money box', 'green', firstname .. ' ' .. lastname .. ' has created a money box.')
end)

---------------------------------------------
-- get all prop data
---------------------------------------------
RSGCore.Functions.CreateCallback('rex-moneybox:server:getallpropdata', function(source, cb, propid)
    MySQL.query('SELECT * FROM money_boxes WHERE propid = ?', {propid}, function(result)
        if result[1] then
            cb(result)
        else
            cb(nil)
        end
    end)
end)

---------------------------------------------
-- cash callback
---------------------------------------------
RSGCore.Functions.CreateCallback('rex-moneybox:server:cashcallback', function(source, cb)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local playercash = Player.PlayerData.money[Config.MoneyType]
    if playercash then
        cb(playercash)
    else
        cb(nil)
    end
end)

---------------------------------------------
-- moneybox cash update
---------------------------------------------
RegisterNetEvent('rex-moneybox:server:updatecash', function(type, boxid, updatecash, amount)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)

    if type == 'add' then
        Player.Functions.RemoveMoney(Config.MoneyType, amount)
        MySQL.update('UPDATE money_boxes SET cashamount = ? WHERE propid = ?', { updatecash, boxid })
    end

    if type == 'remove' then
        Player.Functions.AddMoney(Config.MoneyType, amount)
        MySQL.update('UPDATE money_boxes SET cashamount = ? WHERE propid = ?', { updatecash, boxid })
    end

end)

---------------------------------------------
-- count props
---------------------------------------------
RSGCore.Functions.CreateCallback('rex-moneybox:server:countprop', function(source, cb, proptype)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local citizenid = Player.PlayerData.citizenid
    local result = MySQL.prepare.await("SELECT COUNT(*) as count FROM money_boxes WHERE citizenid = ? AND proptype = ?", { citizenid, proptype })
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
            TriggerClientEvent('rex-moneybox:client:updatePropData', -1, Config.PlayerProps)
        end
    end
end)

---------------------------------------------
-- get props
---------------------------------------------
CreateThread(function()
    TriggerEvent('rex-moneybox:server:getProps')
    PropsLoaded = true
end)

---------------------------------------------
-- save props
---------------------------------------------
RegisterServerEvent('rex-moneybox:server:saveProp')
AddEventHandler('rex-moneybox:server:saveProp', function(data, propId, citizenid, proptype)
    local datas = json.encode(data)

    MySQL.Async.execute('INSERT INTO money_boxes (properties, propid, citizenid, proptype) VALUES (@properties, @propid, @citizenid, @proptype)',
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
RegisterServerEvent('rex-moneybox:server:newProp')
AddEventHandler('rex-moneybox:server:newProp', function(proptype, location, heading, hash)
    local src = source
    local propId = CreateMoneyBoxNumber()
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

    table.insert(Config.PlayerProps, PropData)
    TriggerEvent('rex-moneybox:server:saveProp', PropData, propId, citizenid, proptype)
    TriggerEvent('rex-moneybox:server:updateProps')
    Player.Functions.RemoveItem('moneybox', 1)
    TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items['moneybox'], "remove")
end)

---------------------------------------------
-- distory prop
---------------------------------------------
RegisterServerEvent('rex-moneybox:server:pickupmoneybox')
AddEventHandler('rex-moneybox:server:pickupmoneybox', function(propid, item, cashamount)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)

    for k, v in pairs(Config.PlayerProps) do
        if v.id == propid then
            table.remove(Config.PlayerProps, k)
        end
    end

    -- give money and item
    Player.Functions.AddMoney(Config.MoneyType, cashamount)
    Player.Functions.AddItem(item, 1)
    TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items[item], "add")

    TriggerClientEvent('rex-moneybox:client:removePropObject', src, propid)
    TriggerEvent('rex-moneybox:server:PropRemoved', propid)
    TriggerEvent('rex-moneybox:server:updateProps')
end)

---------------------------------------------
-- update props
---------------------------------------------
RegisterServerEvent('rex-moneybox:server:updateProps')
AddEventHandler('rex-moneybox:server:updateProps', function()
    local src = source
    TriggerClientEvent('rex-moneybox:client:updatePropData', src, Config.PlayerProps)
end)

---------------------------------------------
-- remove props
---------------------------------------------
RegisterServerEvent('rex-moneybox:server:PropRemoved')
AddEventHandler('rex-moneybox:server:PropRemoved', function(propId)
    local result = MySQL.query.await('SELECT * FROM money_boxes')

    if not result then return end

    for i = 1, #result do
        local propData = json.decode(result[i].properties)

        if propData.id == propId then

            MySQL.Async.execute('DELETE FROM money_boxes WHERE id = @id', { ['@id'] = result[i].id })

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
RegisterServerEvent('rex-moneybox:server:getProps')
AddEventHandler('rex-moneybox:server:getProps', function()
    local result = MySQL.query.await('SELECT * FROM money_boxes')

    if not result[1] then return end

    for i = 1, #result do
        local propData = json.decode(result[i].properties)
        print('loading '..propData.proptype..' prop with ID: '..propData.id)
        table.insert(Config.PlayerProps, propData)
    end
end)

---------------------------------------------
-- remove item
---------------------------------------------
RegisterServerEvent('rex-moneybox:server:removeitem')
AddEventHandler('rex-moneybox:server:removeitem', function(item, amount)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(item, amount)
    TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items[item], "remove")
end)

---------------------------------------------
-- create moneybox unique number
--------------------------------------------
function CreateMoneyBoxNumber()
    local UniqueFound = false
    local BoxNumber = nil
    while not UniqueFound do
        BoxNumber = math.random(11111111, 99999999)
        local query = "%" .. BoxNumber .. "%"
        local result = MySQL.prepare.await("SELECT COUNT(*) as count FROM money_boxes WHERE propid LIKE ?", { query })
        if result == 0 then
            UniqueFound = true
        end
    end
    return BoxNumber
end
