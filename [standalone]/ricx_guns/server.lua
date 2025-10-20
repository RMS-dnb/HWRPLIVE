data = {}
local QBRItems, RSGCore
if Config.framework == "redemrp" then 
    TriggerEvent("redemrp_inventory:getData",function(call)
        data = call
    end)
elseif Config.framework == "redemrp-reboot" then 
    TriggerEvent("redemrp_inventory:getData",function(call)
        data = call
    end)
    RedEM = exports["redem_roleplay"]:RedEM()
elseif Config.framework == "qbr" then 
    QBRItems = exports['qbr-core']:GetItems() 
elseif Config.framework == "rsg" then  
    RSGCore = exports['rsg-core']:GetCoreObject()
end
--------------------------------------------------------------------------------------------------------------------------------------------
local TEXTS = Config.Texts
local TEXTURES = Config.Textures
--------------------------------------------------------------------------------------------------------------------------------------------
local function TableNum(tbl) 
    local c = 0
    for i,v in pairs(tbl) do 
        c = c + 1
    end
    return c
end

RegisterServerEvent("ricx_guns:check_weapon", function(id, weapon)
    local _source = source
    local shop = Config.WeaponShops[id]
    local go = true
    if weapon.jobs then 
        go = false
        local player = GetRDMPlayer(_source)
        for i,v in pairs(weapon.jobs) do 
            if v == player.job then 
                go = true 
                break
            end
        end
    end
    if Config.Preview then 
        go = true
    end
    if go then 
        TriggerClientEvent("ricx_guns:customize_weapon", _source, id, weapon)
    else
        TriggerClientEvent("Notification:left_guns", _source, shop.name, TEXTS.NoJob, TEXTURES.alert[1], TEXTURES.alert[2], 4000)
    end
end)

RegisterServerEvent("ricx_guns:check_shop", function(id)
    local _source = source
    local shop = Config.WeaponShops[id]
    local go = true
    if shop.jobs then 
        go = false
        local player = GetRDMPlayer(_source)
        for i,v in pairs(shop.jobs) do 
            if v == player.job then 
                go = true 
                break
            end
        end
    end
    if Config.Preview then 
        go = true
    end
    if go then 
        TriggerClientEvent("ricx_guns:open_shop", _source, id)
    else
        TriggerClientEvent("Notification:left_guns", _source, shop.name, TEXTS.NoJob, TEXTURES.alert[1], TEXTURES.alert[2], 4000)
    end
end)

RegisterServerEvent("ricx_guns:check_shop_customize", function(id)
    local _source = source
    local shop = Config.WeaponShops[id]
    local go = true
    if shop.jobs then 
        go = false
        local player = GetRDMPlayer(_source)
        for i,v in pairs(shop.jobs) do 
            if v == player.job then 
                go = true 
                break
            end
        end
    end
    if Config.Preview then 
        go = true
    end
    if go then 
        local nextArr = {}
        if Config.framework == "redemrp" or Config.framework == "redemrp-reboot" then 
            local playerInventory = data.getPlayerInventory(_source)
            for i,v in pairs(playerInventory) do 
                if v.type == "item_weapon" then 
                    if Config.CustomizeComps[v.weaponHash] then
                        nextArr[#nextArr+1] = v
                    end
                end
            end
        elseif Config.framework == "qbr" then
            local items = player.items 
            for i,v in pairs(items) do 
                if v.type == "item_weapon" then 
                    if Config.CustomizeComps[GetHashKey(v.name)] then
                        local item1Data = QBRItems[v.name]
                        local nr = #nextArr+1
                        nextArr[nr] = v
                        nextArr[nr].weaponHash = GetHashKey(v.name)
                        nextArr[nr].label = item1Data.label
                    end
                end
            end
        elseif Config.framework == "qbr" or Config.framework == "qbr2" or Config.framework == "rsg" then 
            local User
            if Config.framework == "qbr" then 
                User = exports['qbr-core']:GetPlayer(_source)
            elseif Config.framework == "qbr2" then 
                User = QRCore.Functions.GetPlayer(_source)
            elseif Config.framework == "rsg" then 
                User = RSGCore.Functions.GetPlayer(_source)
            end
            local hasItem ={}
            for i,v in pairs(User.PlayerData.items) do 
                if v.type == "weapon" then 
                    local un = string.upper(v.name)
                    if Config.CustomizeComps[GetHashKey(un)] then
                        local nr = #nextArr+1
                        nextArr[nr] = v
                        nextArr[nr].weaponHash = GetHashKey(un)
                        nextArr[nr].label = v.label
                    end
                end
            end
        end

        if TableNum(nextArr) > 0 then 
            TriggerClientEvent("ricx_guns:open_shop_customize", _source, id, nextArr)
        else
            TriggerClientEvent("Notification:left_guns", _source, shop.name, TEXTS.NoWeapons, TEXTURES.alert[1], TEXTURES.alert[2], 4000)
        end
    else
        TriggerClientEvent("Notification:left_guns", _source, shop.name, TEXTS.NoJob, TEXTURES.alert[1], TEXTURES.alert[2], 4000)
    end
end)

RegisterServerEvent("ricx_guns:buy_weapon", function(cart)
    local _source = source
    local player = GetRDMPlayer(_source)
    local money = player.money
    local shop = Config.WeaponShops[cart.shop_id]
    local go = true
    if shop.jobs then 
        go = false
        local player = GetRDMPlayer(_source)
        for i,v in pairs(shop.jobs) do 
            if v == player.job then 
                go = true 
                break
            end
        end
    end
    if not go then 
        TriggerClientEvent("Notification:left_guns", _source, shop.name, TEXTS.NoJob, TEXTURES.alert[1], TEXTURES.alert[2], 4000)
        return
    end
    if cart.price > money then
        TriggerClientEvent("Notification:left_guns", _source, shop.name, TEXTS.NoMoney, TEXTURES.alert[1], TEXTURES.alert[2], 4000)
        return
    end
    RemoveRDMMoney(_source, cart.price)
    local meta = {}
    meta.uid = math.random(1, 999999)
    if cart.items and TableNum(cart.items) > 0 then 
        meta.components = {}
        if cart.items then 
            for i,v in pairs(cart.items) do 
                meta.components[i] = v[1]
            end
        end
    end
    if Config.framework == "redemrp" then 
        local itemD = data.getItem(_source, cart.weapon, meta)
        itemD.ItemMeta = meta
        AddRDMItem(1, itemD)
    elseif Config.framework == "redemrp-reboot" then 
        local itemD = data.getItem(_source, cart.weapon, meta)
        itemD.ItemMeta = meta
        AddRDMItem(1, itemD)
    elseif Config.framework == "qbr" or Config.framework == "qbr2" or Config.framework == "rsg" then 
        local User
        if Config.framework == "qbr" then 
            User = exports['qbr-core']:GetPlayer(_source)
        elseif Config.framework == "qbr2" then 
            User = QRCore.Functions.GetPlayer(_source)
        elseif Config.framework == "rsg" then 
            User = RSGCore.Functions.GetPlayer(_source)
        end
        meta.uid = nil 
        meta.serial = math.random(1,999).."cU"..math.random(100,9999)
        meta.quality = 100
        User.Functions.AddItem(cart.weapon, 1, nil, meta)
    end
end)

RegisterServerEvent("ricx_guns:buy_customize", function(cart, meta)
    local _source = source
    local player = GetRDMPlayer(_source)
    local money = player.money
    local shop = Config.WeaponShops[cart.shop_id]
    local go = true
    if shop.jobs then 
        go = false
        local player = GetRDMPlayer(_source)
        for i,v in pairs(shop.jobs) do 
            if v == player.job then 
                go = true 
                break
            end
        end
    end
    if not go then 
        TriggerClientEvent("Notification:left_guns", _source, shop.name, TEXTS.NoJob, TEXTURES.alert[1], TEXTURES.alert[2], 4000)
        return
    end
    if cart.price > money then
        TriggerClientEvent("Notification:left_guns", _source, shop.name, TEXTS.NoMoney, TEXTURES.alert[1], TEXTURES.alert[2], 4000)
        return
    end
    RemoveRDMMoney(_source, cart.price)
    if Config.framework == "redemrp" then 
        local itemD = GetRDMItem(_source, cart.weapon, meta)
        if TableNum(cart.items) > 0 then 
            if not itemD.ItemMeta.components then 
                itemD.ItemMeta.components = {}
            end
            if not meta.components then 
                meta.components = {}
            end
            for i,v in pairs(cart.items) do 
                meta.components[i] = v[1]
            end
            itemD.ItemMeta.components = meta.components
        end
        itemD.ChangeMeta(itemD.ItemMeta)
    elseif Config.framework == "redemrp-reboot" then 
        local itemD = GetRDMItem(_source, cart.weapon, meta)
        local met2 = itemD.ItemMeta
        if TableNum(cart.items) > 0 then 
            if not met2 then 
                met2 = {}
            end
            if not met2.components then 
                met2.components = {}
            end
            if not meta.components then 
                meta.components = {}
            end
            for i,v in pairs(cart.items) do 
                meta.components[i] = v[1]
            end
            met2.components = meta.components
        end
        itemD.ChangeMeta(met2)
    elseif Config.framework == "qbr" or Config.framework == "qbr2" or Config.framework == "rsg" then 
        local User
        if Config.framework == "qbr" then 
            User = exports['qbr-core']:GetPlayer(_source)
        elseif Config.framework == "qbr2" then 
            User = QRCore.Functions.GetPlayer(_source)
        elseif Config.framework == "rsg" then 
            User = RSGCore.Functions.GetPlayer(_source)
        end
        local itemD = GetRDMItem(_source, cart.weapon, meta)
        local met2 = itemD[3].info
        if TableNum(cart.items) > 0 then 
            if not met2 then 
                met2 = {}
            end
            if not met2.components then 
                met2.components = {}
            end
            if not meta.components then 
                meta.components = {}
            end
            for i,v in pairs(cart.items) do 
                meta.components[i] = v[1]
            end
            met2.components = meta.components
        end
        User.Functions.RemoveItem(cart.weapon, 1, itemD[3].slot)
        Wait(20)
        User.Functions.AddItem(cart.weapon, 1, itemD[3].slot, met2)
    end
end)