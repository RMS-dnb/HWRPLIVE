local RSGCore = exports['rsg-core']:GetCoreObject()

---------------------------------------------
-- send To Discord
-------------------------------------------
local function sendToDiscord(color, name, message, footer, type)
    local embed = {
            {
                ['color'] = color,
                ['title'] = '**'.. name ..'**',
                ['description'] = message,
                ['footer'] = {
                ['text'] = footer
            }
        }
    }
    if type == 'trader' then
        PerformHttpRequest(Config['Webhooks']['trader'], function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
    end
end

--------------------------------------------
-- SELL
--------------------------------------------
-- FOLLOW COMMENTS FOR -- need change name respource
RegisterServerEvent('mm_native:server:sellitem') -- change resource
AddEventHandler('mm_native:server:sellitem', function(item, amount, price)
    local src = source
	local Player = RSGCore.Functions.GetPlayer(src)
    local totalvalue = (amount * price) / 100

    if Player.Functions.RemoveItem(item, amount) then
        TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items[item], 'remove')
        Wait(1000)
        if Config.Payment == 'item' then
            Player.Functions.AddItem(Config.PaymentType, totalvalue, 'sellvendor-sold')
            TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items[Config.PaymentType], 'add')
        elseif Config.Payment == 'money' then
            Player.Functions.AddMoney(Config.PaymentType, totalvalue, 'sellvendor-sold')
        end
        local discordMessage = string.format(
            'Citizenid:** %s\n**Ingame ID:** %d\n**Name:** %s %s\n**Item sold:** %dx %s\n**Sold for $:** %.2f**',
            Player.PlayerData.citizenid,
            Player.PlayerData.cid,
            Player.PlayerData.charinfo.firstname,
            Player.PlayerData.charinfo.lastname,
            amount,
            RSGCore.Shared.Items[item].label,
            totalvalue
        )

        sendToDiscord(16753920,	'sell | VENDOR',discordMessage, 'Trader for RSG Framework', 'trader')
        TriggerClientEvent('ox_lib:notify', src, { title = Lang:t('server.lang_13').. RSGCore.Shared.Items[tostring(item)].label.. Lang:t('server.lang_14').. totalvalue, description = Lang:t('server.lang_15'), type = 'inform', duration = 5000 })
    end
end)

RegisterServerEvent('mm_native:server:sellall')-- change resource
AddEventHandler('mm_native:server:sellall', function(sellid)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local items = sellid
    if type(sellid[1]) == 'table' then  items = sellid[1] end

    local totalValue = 0

    if Config.debug then
        for k, v in pairs(items) do print('Items sell player: ', items) print(k, v) end
    end

    for _, item in pairs(items) do
        if Config.debug then
            for k, v in pairs(item) do print('Items sell player: ', item) print(k, v) end
        end
        local itemName = item.name
        local itemAmount = item.amount
        local itemPrice = item.price

        if Player.Functions.RemoveItem(itemName, itemAmount) then
            totalValue = totalValue + ((itemAmount * itemPrice) / 100)
            TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items[itemName], 'remove')
        end
    end

    if Config.Payment == 'item' then
        Player.Functions.AddItem(Config.PaymentType, totalValue, 'sellvendor-sold')
        TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items[Config.PaymentType], 'add')
    elseif Config.Payment == 'money' then
        Player.Functions.AddMoney(Config.PaymentType, totalValue, 'sellvendor-sold')
    end

    local discordMessage = string.format(
        'Citizenid:** %s\n**Ingame ID:** %d\n**Name:** %s %s\n**Items sold for $:** %.2f**',
        Player.PlayerData.citizenid,
        Player.PlayerData.cid,
        Player.PlayerData.charinfo.firstname,
        Player.PlayerData.charinfo.lastname,
        totalValue
    )

    sendToDiscord(16753920, 'Sell | VENDOR', discordMessage, 'Trader for RSG Framework', 'trader')
    TriggerClientEvent('ox_lib:notify', src, { title = Lang:t('server.lang_16').. totalValue, description = Lang:t('server.lang_17'), type = 'inform', duration = 5000 })

end)

--------------------------------------------
-- ADD MENU OPTIONS
--------------------------------------------
RSGCore.Functions.CreateCallback('mm_native:server:getitems', function(source, cb, sellid) -- change resource
    local Player = RSGCore.Functions.GetPlayer(source)
    if not Player then print('Player not found') cb({ error = 'Player not found' }) return end

    local playerItems = {}
    if Player.PlayerData.items and next(Player.PlayerData.items) then
        for _, item in pairs(Player.PlayerData.items) do
            playerItems[item.name] =  item.amount
        end
    end

    local id = tostring(sellid)
    local response = {
        id = id,
        items = {}
    }

    for _, shop in ipairs(Config.nativeLocations) do -- change resource config
        if shop.id == id then
            for _, subTable in pairs(shop.shopdata) do
                for itemName, itemPrice in pairs(subTable) do
                    local playerItemAmount = playerItems[itemName] or 0
                    local tableSub = {}
                    if playerItemAmount > 0 then
                        tableSub = {
                            name = itemName,
                            amount = playerItemAmount,
                            price = itemPrice,
                        }
                        table.insert(response.items, tableSub)
                        if Config.Debug then
                            print('Added Object:', itemName, playerItemAmount, itemPrice)
                        end
                    end
                end
            end
            cb(response)
            break
        end
    end

end)

--------------------------------------------
-- CAN SELL
--------------------------------------------
--[[ CanItemBeSaled = function(item)
    local retval = false
    if Config.AllowedItems[item] ~= nil then
        retval = true
    end
    return retval
end ]]