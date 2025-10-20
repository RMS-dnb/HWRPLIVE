RSGCore = exports['rsg-core']:GetCoreObject()


-- functions
local function GetStashItems(stashId, cfgid)
    local items = {}
    local totalPrice = 0
    local cfgid = tonumber(cfgid)
    if Config.Inv == 'v1' then
        local result = MySQL.Sync.fetchScalar('SELECT items FROM stashitems WHERE stash = ?', {stashId})
        if result then
            local stashItems = json.decode(result)
            if stashItems then
                for k, item in pairs(stashItems) do
                    local itemInfo = RSGCore.Shared.Items[item.name:lower()]
                    if itemInfo then
                        local itemPrice = Config.Locations[cfgid].ItemPrices[item.name] or 0
                        local itemTotalPrice = itemPrice * tonumber(item.amount)
                        totalPrice = totalPrice + itemTotalPrice
                        items[item.slot] = {
                            name = itemInfo["name"],
                            amount = tonumber(item.amount),
                            info = item.info ~= nil and item.info or "",
                            label = itemInfo["label"],
                            description = itemInfo["description"] ~= nil and itemInfo["description"] or "",
                            weight = itemInfo["weight"],
                            type = itemInfo["type"],
                            unique = itemInfo["unique"],
                            useable = itemInfo["useable"],
                            image = itemInfo["image"],
                            slot = item.slot,
                            price = itemPrice,
                            totalPrice = itemTotalPrice,
                        }
                    end
                end
            end
        end
    elseif Config.Inv == 'v2' then
        local result = MySQL.Sync.fetchScalar('SELECT items FROM inventories WHERE identifier = ?', {stashId})
        if result then
            local stashItems = json.decode(result)
            --print(json.encode(result))
            if stashItems then
                for k, item in pairs(stashItems) do
                    local itemInfo = RSGCore.Shared.Items[item.name:lower()]
                    if itemInfo then
                        local itemPrice = Config.Locations[cfgid].ItemPrices[item.name] or 0
                        local itemTotalPrice = itemPrice * tonumber(item.amount)
                        totalPrice = totalPrice + itemTotalPrice
                        items[item.slot] = {
                            name = itemInfo["name"],
                            amount = tonumber(item.amount),
                            info = item.info ~= nil and item.info or "",
                            label = itemInfo["label"],
                            description = itemInfo["description"] ~= nil and itemInfo["description"] or "",
                            weight = itemInfo["weight"],
                            type = itemInfo["type"],
                            unique = itemInfo["unique"],
                            useable = itemInfo["useable"],
                            image = itemInfo["image"],
                            slot = item.slot,
                            price = itemPrice,
                            totalPrice = itemTotalPrice,
                        }
                    end
                end
            end
        end
    end
    return items, totalPrice
end


local function checkForItemsNotInConfig(stashId, id)
    local items, _ = GetStashItems(stashId, id)
    for _, item in pairs(items) do
        if not Config.Locations[id].ItemPrices[item.name] then
            return true
        end
    end
end

--- events


RegisterServerEvent('rms-seller:server:creatstash:inventory:v2', function(id)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    local data = { label = 'Sell Counter', maxweight = Config.InvSettings.maxweight, slots = Config.InvSettings.slots }
    local stashName = id
    exports['rsg-inventory']:OpenInventory(src, stashName, data)
end)

RegisterServerEvent('rms-seller:server:sellitems', function(stashid, price)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    

    if Config.Inv == 'v1' then
        if Player.Functions.AddMoney("cash", price) then
            MySQL.query("DELETE FROM stashitems WHERE stash = ?", {stashid})
            -- Notify player using rNotify
            TriggerClientEvent('rNotify:NotifyLeft', src, 
                Config.locales[Config.locale].seller_name, 
                "You received $" .. price .. " for your items.", 
                "generic_textures", "tick", 4000)
        end
    elseif Config.Inv == 'v2' then
        if Player.Functions.AddMoney("cash", price) then
            exports[Config.InvName]:ClearStash(stashid)
            -- Notify player using rNotify
            TriggerClientEvent('rNotify:NotifyLeft', src, 
                Config.locales[Config.locale].seller_name, 
                "You received $" .. price .. " for your items.", 
                "generic_textures", "tick", 4000)
        end
    end
end)




---
lib.callback.register('rms-seller:server:callback:getstashinformation', function(source, stashid, id)
    local src = source
    local checkitem = checkForItemsNotInConfig(stashid, id)


    if checkitem then
        local items, totalprice = GetStashItems(stashid, id)
        local def = true
        return items, totalprice, def
    end

    local items, totalprice = GetStashItems(stashid, id)
    local def = false
    return items, totalprice, def

end)


lib.callback.register('rms-seller:server:GetJob', function(source, job)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)

    if not Player then return end

    local playerJob = Player.PlayerData.job.name

    if  playerJob == job then
       return true
    end

    return false

end)

lib.callback.register('rms-seller:server:cid', function(source, job)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end

    return  Player.PlayerData.citizenid


end)