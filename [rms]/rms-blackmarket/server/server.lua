local RSGCore = exports['rsg-core']:GetCoreObject()
local npcLoaded = false
lib.locale()

---------------------------------------------
-- startup tigger
---------------------------------------------
CreateThread(function()
    while true do
        Wait(5000)
        if not npcLoaded then
            TriggerClientEvent('rex-blackmarket:client:update', -1)
            npcLoaded = true
        end
    end
end)

lib.callback.register('rms-blackmarket:server:CheckFines', function(source)
    return exports['rsg-banking']:UnPaidFines(source)
end)

---------------------------------------------
-- bloodmoney callback
---------------------------------------------
RSGCore.Functions.CreateCallback('rex-blackmarket:server:bloodmoneycallback', function(source, cb)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    local playerbloodmoney = Player.PlayerData.money['bloodmoney']
    if playerbloodmoney then
        cb(playerbloodmoney)
    else
        cb(nil)
    end
end)

local cachedSpawn = {
    pos = nil,
    model = nil
}

RegisterNetEvent('rms-blackmarket:server:GenerateNpcSpawn', function()
    if cachedSpawn.pos and cachedSpawn.model then return end

    math.randomseed(GetGameTimer())
    cachedSpawn.pos   = Config.spawnPoints[math.random(1, #Config.spawnPoints)]
    cachedSpawn.model = Config.npcModels[math.random(1, #Config.npcModels)]
end)

AddEventHandler('onResourceStart', function(res)
    if res ~= GetCurrentResourceName() then return end
    cachedSpawn.pos, cachedSpawn.model = nil, nil
    TriggerEvent('rms-blackmarket:server:GenerateNpcSpawn')
end)

lib.callback.register('rms-blackmarket:server:GetNpcSpawnData', function(src)
    if not cachedSpawn.pos or not cachedSpawn.model then
        TriggerEvent('rms-blackmarket:server:GenerateNpcSpawn')
    end
    return cachedSpawn.pos, cachedSpawn.model
end)

-- ---------------------------------------------
-- -- wash bloodmoney
-- ---------------------------------------------
-- RegisterNetEvent('rex-blackmarket:server:washmoney', function(amount)
--     local src = source
--     local Player = RSGCore.Functions.GetPlayer(src)
--     if not Player then return end
--     Player.Functions.RemoveMoney('bloodmoney', amount)
--     Player.Functions.AddMoney('cash', amount)
-- end)
---------------------------------------------
-- wash options: bloodmoney or moneybag
---------------------------------------------
-- wash bloodmoney (separate event)
---------------------------------------------
RegisterNetEvent('rex-blackmarket:server:washbloodmoney', function(amount)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    
    local bloodmoney = Player.PlayerData.money['bloodmoney'] or 0
    
    if bloodmoney >= amount then
        Player.Functions.RemoveMoney('bloodmoney', amount)
        Player.Functions.AddMoney('cash', amount)
        TriggerClientEvent('rex-blackmarket:client:notify', src, "You washed $"..amount.." of BLOODMONEY and received $"..amount.." in clean cash.", "success")
    else
        TriggerClientEvent('rex-blackmarket:client:notify', src, "You need at least $"..amount.." in BLOODMONEY to wash.", "error")
    end
end)

---------------------------------------------
-- clean moneybag (separate event)
---------------------------------------------
RegisterNetEvent('rex-blackmarket:server:cleanmoneybag', function(count)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    
    local amount = tonumber(count) or 1
    local item = Player.Functions.GetItemByName('moneybag')
    
    if item and item.amount >= amount then
        Player.Functions.RemoveItem('moneybag', amount)
        local total = 50 * amount
        Player.Functions.AddMoney('cash', total)
        TriggerClientEvent('rex-blackmarket:client:notify', src, "You cleaned "..amount.."x MONEYBAG(s) and received $"..total.." in clean cash.", "success")
    else
        TriggerClientEvent('rex-blackmarket:client:notify', src, "You don't have enough MONEYBAGs.", "error")
    end
end)

---------------------------------------------
-- blackmarket update
---------------------------------------------
lib.cron.new(Config.BlackmarketCronJob, function ()
    if Config.EnableServerNotify then
        print(locale('sv_lang_1'))
    end
    TriggerClientEvent('rex-blackmarket:client:update', -1)
end)

--------------------------------------
-- register shop
--------------------------------------
CreateThread(function() 
    exports['rsg-inventory']:CreateShop({
        name = 'blackmarket',
        label = 'Blackmarket Shop',
        slots = #Config.BlackmarketShopItems,
        items = Config.BlackmarketShopItems,
        persistentStock = Config.PersistStock,
    })
end)

--------------------------------------
-- open shop
--------------------------------------
RegisterNetEvent('rex-blackmarket:server:openShop', function() 
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    local playerjobtype = Player.PlayerData.job.type
    if playerjobtype == 'leo' then return end
    exports['rsg-inventory']:OpenShop(src, 'blackmarket')
end)
