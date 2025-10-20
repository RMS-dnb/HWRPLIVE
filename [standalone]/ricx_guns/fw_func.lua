data = {}
local VorpCore
local VorpInv
local QBRItems
local RSGCore 

if Config.framework == "redemrp" then
    TriggerEvent("redemrp_inventory:getData",function(call)
        data = call
    end)
elseif Config.framework == "redemrp-reboot" then
    TriggerEvent("redemrp_inventory:getData",function(call)
        data = call
    end)
    RedEM = exports["redem_roleplay"]:RedEM()
elseif Config.framework == "vorp" then 
    TriggerEvent("getCore",function(core)
        VorpCore = core
    end)
    VorpInv = exports.vorp_inventory:vorp_inventoryApi()
elseif Config.framework == "qbr" then 
    QBRItems = exports['qbr-core']:GetItems()
elseif Config.framework == "rsg" then 
    RSGCore = exports['rsg-core']:GetCoreObject()
end
--------------------------------------------------------------------------------------------------------------------------------------------
function GetRDMPlayer(src)
    local a = nil 
    if Config.framework == "redemrp" then
        TriggerEvent('redemrp:getPlayerFromId', src, function(user)
            local identifier = tostring(user.getIdentifier())
            local charid = tonumber(user.getSessionVar("charid"))
            local pname = user.getName()
            local money = user.getMoney()
            local job = user.getJob()
            a = {identifier = identifier, charid = charid, name = pname, money = money, job = job}
        end)
        Wait(200)
    elseif Config.framework == "redemrp-reboot" then
        local Player = RedEM.GetPlayer(src)
        if Player then 
            local identifier = Player.identifier
            local charid = Player.charid
            local pname = Player.firstname.." "..Player.lastname   
            local money = Player.money
            local job = Player.job   
            a = {identifier = identifier, charid = charid, name = pname, money = money, job = job}
        else
            a = false 
        end
    elseif Config.framework == "vorp" then 
        local Character = VorpCore.getUser(src).getUsedCharacter
        local job =  Character.job
        local identifier = Character.identifier
        local charid = Character.charIdentifier
        local name = Character.firstname.." "..Character.lastname
        local money =  Character.money
        a = {identifier = identifier, charid = charid, name = pname, money = money, job = job}
    elseif Config.framework == "qbr" or Config.framework == "qbr2" or Config.framework == "rsg" then 
        local User 
        if  Config.framework == "qbr" then
            User = exports[qc]:GetPlayer(src)
        elseif Config.framework == "qbr2" then 
            User = QRCore.Functions.GetPlayer(src)
        elseif Config.framework == "rsg" then 
            User = RSGCore.Functions.GetPlayer(src)
        end
        local job =  User.PlayerData.job.name
        local identifier = User.PlayerData.license
        local charid = User.PlayerData.cid
        local pname = User.PlayerData.charinfo.firstname.." "..User.PlayerData.charinfo.lastname
        local money = User.PlayerData.money.cash
        a = {identifier = identifier, charid = charid, name = pname, money = money, job = job}
    end
    return a
end
--------------------------------------------------------------------------------------------------------------------------------------------
function GetRDMItem(src, item, meta)
    local itemD = nil 
    if Config.framework == "redemrp" then
        itemD = data.getItem(src, item, meta)
    elseif Config.framework == "redemrp-reboot" then
        itemD = data.getItem(src, item, meta)
    elseif Config.framework == "vorp" then
        itemD = {src, item}
    elseif Config.framework == "qbr" or Config.framework == "qbr2" or Config.framework == "rsg" then 
        local User
        local slots 
        if Config.framework == "qbr" then 
            User = exports['qbr-core']:GetPlayer(src)
            slots = exports['qbr-inventory']:GetSlotsByItem(User.PlayerData.items, item)
        elseif Config.framework == "qbr2" then 
            User = QRCore.Functions.GetPlayer(src)
            slots = exports['qr-inventory']:GetSlotsByItem(User.PlayerData.items, item)
        elseif Config.framework == "rsg" then 
            User = RSGCore.Functions.GetPlayer(src)
            slots = exports['rsg-inventory']:GetSlotsByItem(User.PlayerData.items, item)
        end
        local hasItem ={}
        
        for i, v in pairs(slots) do
            if v then
                hasItem[#hasItem+1] = User.PlayerData.items[v]
            end
        end
        local has = false 
        for i,v in ipairs(hasItem) do 
            if v.info.serial == meta.serial then 
                has = v
                break 
            end
        end
        itemD = {src, item, has}
    end
    return itemD
end
--------------------------------------------------------------------------------------------------------------------------------------------
function GetRDMItemCount(item)
    if Config.framework == "redemrp" then
        return item.ItemAmount
    elseif Config.framework == "redemrp-reboot" then
        return item.ItemAmount
    elseif Config.framework == "vorp" then
        return VorpInv.getItemCount(item[1], item[2])
    elseif Config.framework == "qbr" or Config.framework == "qbr2" or Config.framework == "rsg" then 
        local count
        local User 
        if  Config.framework == "qbr" then
            User = exports[qc]:GetPlayer(item[1])
        elseif Config.framework == "rsg" then 
            User = RSGCore.Functions.GetPlayer(item[1])
        else
            User = QRCore.Functions.GetPlayer(item[1])
        end
        local hasItem = User.Functions.GetItemByName(item[2])
        if hasItem and hasItem.amount > 0 then 
            count = hasItem.amount
        end
        return count
    end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function AddRDMItem(value, itemD)
    local ret = nil
    if Config.framework == "redemrp" then
        itemD.AddItem(value)
        ret = true 
    elseif Config.framework == "redemrp-reboot" then
        itemD.AddItem(value)
        ret = true 
    elseif Config.framework == "vorp" then
        local canCarry = VorpInv.canCarryItem(itemD[1], itemD[2], value)
        if canCarry then
            VorpInv.addItem(itemD[1], itemD[2], value)
            ret = true
        else
            ret = false
        end 
    elseif Config.framework == "qbr" or Config.framework == "qbr2" or Config.framework == "rsg" then 
        local User 
        if  Config.framework == "qbr" then
            User = exports[qc]:GetPlayer(itemD[1])
        elseif Config.framework == "rsg" then 
            User = RSGCore.Functions.GetPlayer(itemD[1])
        else
            User = QRCore.Functions.GetPlayer(itemD[1])
        end
        User.Functions.AddItem(itemD[2], value)
        ret = true
    end
    return ret
end
--------------------------------------------------------------------------------------------------------------------------------------------
function RemoveRDMItem(value, itemD)
    if Config.framework == "redemrp" then
        itemD.RemoveItem(value)
    elseif Config.framework == "redemrp-reboot" then
        itemD.RemoveItem(value)
    elseif Config.framework == "vorp" then
        VorpInv.subItem(itemD[1], itemD[2], value)
    elseif Config.framework == "qbr" or Config.framework == "qbr2" or Config.framework == "rsg" then 
        local User 
        if  Config.framework == "qbr" then
            User = exports[qc]:GetPlayer(itemD[1])
        elseif Config.framework == "rsg" then 
            User = RSGCore.Functions.GetPlayer(itemD[1])
        else
            User = QRCore.Functions.GetPlayer(itemD[1])
        end
        User.Functions.RemoveItem(itemD[2], value)
    end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function CreateRedEMRP_LOCKER(id, pos, job)
    if Config.framework == "redemrp" then
        data.createLocker(id, pos.x, pos.y, pos.z, job)
    elseif Config.framework == "redemrp-reboot" then

    elseif Config.framework == "qbr" then 
        print("qbr")
    else
        print("there is no vorp locker, create one with LUA, HTML, CSS and JS")
        return
        
    end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function RemoveRDMMoney(src, value)
    if Config.framework == "redemrp" then 
        TriggerEvent('redemrp:getPlayerFromId', src, function(user)
            user.removeMoney(value)
        end)
    elseif Config.framework == "redemrp-reboot" then
        local Player = RedEM.GetPlayer(src)
        Player.RemoveMoney(value)
    elseif Config.framework == "vorp" then 
        local Character = VorpCore.getUser(src).getUsedCharacter
        Character.removeCurrency(0 , value)
    elseif Config.framework == "qbr" or Config.framework == "qbr2" or Config.framework == "rsg" then 
        local User 
        if  Config.framework == "qbr" then
            User = exports[qc]:GetPlayer(src)
        elseif Config.framework == "rsg" then 
            User = RSGCore.Functions.GetPlayer(src)
        else
            User = QRCore.Functions.GetPlayer(src)
        end
        User.Functions.RemoveMoney("cash", value, "RicX Guns: Remove Money")
    end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function AddRDMMoney(src, value)
    if Config.framework == "redemrp" then 
        TriggerEvent('redemrp:getPlayerFromId', src, function(user)
            user.addMoney(value)
        end)
    elseif Config.framework == "redemrp-reboot" then
        local Player = RedEM.GetPlayer(src)
        Player.AddMoney(value)
    elseif Config.framework == "vorp" then 
        local Character = VorpCore.getUser(src).getUsedCharacter
        Character.addCurrency(0 , value)
    elseif Config.framework == "qbr" or Config.framework == "qbr2" or Config.framework == "rsg" then 
        local User 
        if  Config.framework == "qbr" then
            User = exports[qc]:GetPlayer(src)
        elseif Config.framework == "rsg" then 
            User = RSGCore.Functions.GetPlayer(src)
        else
            User = QRCore.Functions.GetPlayer(src)
        end
        User.Functions.AddMoney("cash", value, "RicX GUNS: Add Money")
    end
end