data = {}
local VorpCore
local VorpInv
local QBRItems
local QRCore
local RPX, RPXInv
local qc
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
    qc = "qbr-core"
    QBRItems = exports[qc]:GetItems()
elseif Config.framework == "qbr2" then 
    qc = "qr-core"
    QRCore = exports[qc]:GetCoreObject()
    QBRItems = exports[qc]:GetItems()
elseif Config.framework == "rsg" then 
    qc = "rsg-core"
    RSGCore = exports[qc]:GetCoreObject()
elseif Config.framework == "rpx" then 
    --[[
    RPX = exports['rpx-core']:GetObject()
    if not Config.customRPX_Inventory then 
        RPXInv = exports['rpx-inventory']:Inventory()
    end
    ]]
end
--------------------------------------------------------------------------------------------------------------------------------------------
function IsAdmin(src)
    local _source = src
    local a = nil
    if Config.framework == "redemrp" then 
        TriggerEvent('redemrp:getPlayerFromId', _source, function(user)
            if (user.getGroup() == "admin" or user.getGroup() == "superadmin") then	
                a = true
            else
                a = false
            end
        end) 
        Citizen.Wait(200)
    elseif Config.framework == "redemrp-reboot" then 
        local Player = RedEM.GetPlayer(_source)
        if (Player.group == "admin" or Player.group == "superadmin") then	
            a = true
        else
            a = false
        end
    elseif Config.framework == "vorp" then 
        local Character = VorpCore.getUser(_source).getUsedCharacter
        local group = Character.group
        if (group == "admin" or group == "superadmin") then	
            a = true
        else
            a = false
        end
    elseif Config.framework == "qbr" or Config.framework == "qbr2" or Config.framework == "rsg" then 
        print("no admin check in qbr/qr/rsg")
        a = false
    end
    return a
end
---------------------------
--------------------------------------------------------------------------------------------------------------------------------------------
function GetRDMPlayer(src)
    local a = nil 
    if Config.framework == "redemrp" then
        TriggerEvent('redemrp:getPlayerFromId', src, function(user)
            if not user then 
                a = false
            else
                local identifier = tostring(user.getIdentifier())
                local charid = tonumber(user.getSessionVar("charid"))
                local pname = user.getName()
                local money = user.getMoney()
                local job = user.getJob()
                a = {identifier = identifier, charid = charid, name = pname, money = money, job = job}
            end
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
        if not VorpCore.getUser(src) then
            a = false
            return a
        end
        local Character = VorpCore.getUser(src).getUsedCharacter
        if not Character.job then 
            a = false
            return a
        end

        local job =  Character.job
        local identifier = Character.identifier
        local charid = Character.charIdentifier
        local fn = Character.firstname
        local ln = Character.lastname

        local name = (fn or Character.charIdentifier).." "..(ln or Character.identifier)
        local pname = name
        local money =  Character.money
        a = {identifier = identifier, charid = charid, name = pname, money = money, job = job}
    elseif Config.framework == "qbr" or Config.framework == "qbr2" or Config.framework == "rsg" then   
        local User, count = nil, 0
        if  Config.framework == "qbr" then
            User = exports[qc]:GetPlayer(src)
        elseif Config.framework == "rsg" then 
            User = RSGCore.Functions.GetPlayer(src)
        else
            User = QRCore.Functions.GetPlayer(src)
        end
        if not User then 
            return false
        end
        local job =  User.PlayerData.job
        local identifier = User.PlayerData.license
        local charid = User.PlayerData.cid
        local pname = User.PlayerData.charinfo.firstname.." "..User.PlayerData.charinfo.lastname
        local money = User.PlayerData.money.cash
        a = {identifier = identifier, charid = charid, name = pname, money = money, job = job.name}
    elseif Config.framework == "rpx" then 
        if not Config.customRPX_Inventory then 
            local player = RPX.GetPlayer(src)
            if player and player.charinfo then 
                local job =  player.charinfo.name
                local identifier = player.license
                local charid = player.citizenid
                local name = player.charinfo.firstname.." "..player.charinfo.lastname
                local money = player.money.cash
                a = {identifier = identifier, charid = charid, name = name, money = money, job = job}
            end
        else
            a = GetCustomPlayerData(src)
        end
    end
    return a
end
--------------------------------------------------------------------------------------------------------------------------------------------
function GetRDMPlayerInventory(source)
    local pitems = {}
    local _source = source
    if Config.framework == "redemrp" or Config.framework == "redemrp-reboot"  then
        for i,v in pairs(Config.SupplyItems) do 
            local itemD = data.getItem(_source, v.item)
            local count = itemD.ItemAmount
            if count and count > 0 then 
                pitems[#pitems+1] = v
            end
        end
    elseif Config.framework == "vorp" then
        for i,v in pairs(Config.SupplyItems) do 
            local count = VorpInv.getItemCount(_source, v.item)
            if count and count > 0 then 
                pitems[#pitems+1] = v
            end
        end
    elseif Config.framework == "qbr" or Config.framework == "qbr2" or Config.framework == "rsg" then  
        local User, count = nil, 0
        if  Config.framework == "qbr" then
            User = exports[qc]:GetPlayer(_source)
        elseif Config.framework == "rsg" then 
            User = RSGCore.Functions.GetPlayer(_source)
        else
            User = QRCore.Functions.GetPlayer(_source)
        end

        for i,v in pairs(Config.SupplyItems) do 
            local count = 0
            local hasItem = User.Functions.GetItemByName(v.item)
            if hasItem and hasItem.amount > 0 then 
                count = hasItem.amount
            end
            if count and count > 0 then 
                pitems[#pitems+1] = v
            end
        end
    else
        pitems = GetCustomPlayerInventory(source)
    end
    return pitems
end
--------------------------------------------------------------------------------------------------------------------------------------------
function GetRDMItem(src, item)
    local itemD = nil 
    if Config.framework == "redemrp" then
        itemD = data.getItem(src, item)
    elseif Config.framework == "redemrp-reboot" then
        itemD = data.getItem(src, item)
    elseif Config.framework == "vorp" then
        itemD = {src, item}
    elseif Config.framework == "qbr" or Config.framework == "qbr2" or Config.framework == "rsg" then  
        itemD = {src, item}
    elseif Config.framework == "rpx" then
        itemD = {src, item}
    end
    return itemD
end
--------------------------------------------------------------------------------------------------------------------------------------------
function GetRDMItemCount(item)
    if Config.framework == "redemrp" then
        return item.ItemAmount or 0
    elseif Config.framework == "redemrp-reboot" then
        return item.ItemAmount
    elseif Config.framework == "vorp" then
        return VorpInv.getItemCount(item[1], item[2])
    elseif Config.framework == "qbr" or Config.framework == "qbr2" or Config.framework == "rsg" then   
        local User, count = nil, 0
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
    elseif Config.framework == "rpx" then
        if not Config.customRPX_Inventory then 
            local item = RPXInv.GetItem(item[1], item[2], (item[3] or nil), 1)
            return item
        else
            local item = GetCustomItemAmount(item[1], item[2])
            return item
        end
    end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function AddRDMItem(value, itemD)
    local ret = nil
    if Config.framework == "redemrp" then
        if itemD.ItemAmount + value <= itemD.ItemInfo.limit then 
            itemD.AddItem(value)
            ret = true
        else
            ret = false
        end 
    elseif Config.framework == "redemrp-reboot" then
        if itemD.ItemAmount + value <= itemD.ItemInfo.limit then 
            itemD.AddItem(value)
            ret = true
        else
            ret = false
        end 
    elseif Config.framework == "vorp" then
        local canCarry = VorpInv.canCarryItem(itemD[1], itemD[2], value)
        local cancarry2 = VorpInv.canCarryItems(itemD[1], value)
        if canCarry and cancarry2 then
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
    elseif Config.framework == "rpx" then
        if not Config.customRPX_Inventory then 
            ret = true
            RPXInv.AddItem(itemD[1], itemD[2], value, (item[3] or nil))
        else
            ret = true 
            AddCustomItem(itemD[1], itemD[2], value)
        end
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
    elseif Config.framework == "rpx" then
        if not Config.customRPX_Inventory then 
            RPXInv.RemoveItem(itemD[1], itemD[2], value, (itemD[3] or nil))
        else
            RemoveCustomItem(itemD[1], itemD[2], value)
        end
    end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function RegisterTotemItem()
    if Config.framework == "redemrp" or Config.framework == "redemrp-reboot" then 
        RegisterServerEvent("RegisterUsableItem:camp_totem", function(source)
            local _source = source
            TriggerClientEvent("ricx_camps:place_totem", _source)
        end)
    elseif Config.framework == "vorp" then 
        CreateThread(function()
            Citizen.Wait(100)
            VorpInv.RegisterUsableItem("camp_totem", function(data)
                local _source = data.source 
                TriggerClientEvent("ricx_camps:place_totem", _source)
                VorpInv.CloseInv(_source)
            end)
            return
        end)
    elseif Config.framework == "qbr" or Config.framework == "qbr2" or Config.framework == "rsg" then 
        if Config.framework == "qbr" then 
            exports['qbr-core']:CreateUseableItem("camp_totem", function(source, item)
                local _source = source
                TriggerClientEvent("ricx_camps:place_totem", _source)
            end)
        elseif Config.framework == "rsg" then 
            RSGCore.Functions.CreateUseableItem("camp_totem", function(source)
        TriggerClientEvent("ricx_camps:check_totem_zone", source)
        end)

        else
            QRCore.Functions.CreateUseableItem("camp_totem", function(source, item)
                local _source = source
                TriggerClientEvent("ricx_camps:place_totem", _source)
            end)
        end
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
        User.Functions.RemoveMoney("cash", value, "RicX Objects: Remove Money")
    elseif Config.framework == "rpx" then 
        if not Config.customRPX_Inventory then 
            local player = RPX.GetPlayer(src)
            player.RemoveMoney('cash', value)
        else
            RemoveCustomMoney(src, value)
        end
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
        User.Functions.AddMoney("cash", value, "RicX Camps: Add Money")
    elseif Config.framework == "rpx" then 
        if not Config.customRPX_Inventory then 
            local player = RPX.GetPlayer(src)
            player.AddMoney('cash', value)
        else
            AddCustomMoney(src, value)
        end
    end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function RedMSQLR()
    local a = nil
    if Config.framework == "redemrp" then 
        MySQL.Async.fetchAll("SELECT * FROM ricx_camps", {}, function(result)
            if result[1] then
                a = result
            else
                a = false
            end
        end)
    elseif Config.framework == "redemrp-reboot" then 
            MySQL.query("SELECT * FROM ricx_camps", {}, function(result)
                if result[1] then
                    a = result
                else
                    a = false
                end
            end)
    elseif Config.framework == "vorp" then 
        exports.ghmattimysql:execute("SELECT * FROM ricx_camps", {}, function(result)
            if result[1] then
                a = result
            else
                a = false
            end
        end)
    elseif Config.framework == "qbr" or Config.framework == "qbr2" or Config.framework == "rsg" or Config.framework == "rpx" then     
        MySQL.query("SELECT * FROM ricx_camps", {}, function(result)
            if result[1] then
                a = result
            else
                a = false
            end
        end)
    end
    while a == nil do 
        Wait(100)
    end
    return a
end
--------------------------------------------------------------------------------------------------------------------------------------------
function RedMSQLR2(id)
    local a = nil
    if Config.framework == "redemrp" then 
        MySQL.Async.fetchAll("SELECT * FROM ricx_camps WHERE id=@id", {id = id}, function(result)
            Wait(200)
            if result[1] then
                a = result[1]
            else
                a = false
            end
        end)
    elseif Config.framework == "redemrp-reboot" then 
        MySQL.query("SELECT * FROM ricx_camps WHERE id=?", {id}, function(result)
            Wait(200)
            if result[1] then
                a = result[1]
            else
                a = false
            end
        end)
    elseif Config.framework == "vorp" then 
        exports.ghmattimysql:execute("SELECT * FROM ricx_camps WHERE id=@id", {id = id}, function(result)
            Wait(200)
            if result[1] then
                a = result[1]
            else
                a = false
            end
        end)
    elseif Config.framework == "qbr" or Config.framework == "qbr2" or Config.framework == "rsg" or Config.framework == "rpx" then   
        MySQL.query("SELECT * FROM ricx_camps WHERE id=@id", {id = id},function(result)
            Wait(200)
            if Config.Debug then 
                print("looking for camp data at id ",id)
            end
            if result[1] then
                if Config.Debug then 
                    print("found camp data at id ",id)
                end
                a = result[1]
            else
                a = false
            end
        end)
    end
    while a == nil do 
        Wait(100)
    end
    return a
end
--------------------------------------------------------------------------------------------------------------------------------------------
function RedMSQL(dat)
    local a = nil
    local c = "SELECT * FROM ricx_camps WHERE identifier=@id2 AND charid=@id3"
    local b = {id2=dat.identifier, id3=dat.charid}
    if Config.framework == "redemrp" then 
        if dat.id then 
            c = "SELECT * FROM ricx_camps WHERE identifier=@id2 AND charid=@id3 AND id=@id"
            b = {id2=dat.identifier, id3=dat.charid, id = dat.id}
        end
        MySQL.Async.fetchAll(c, b, function(result)
            Wait(200)
            if result[1] then
                a = result
            else
                a = false
            end
        end)
    elseif Config.framework == "redemrp-reboot" then 
        if dat.id then 
            c = "SELECT * FROM ricx_camps WHERE identifier=? AND charid=? AND id=?"
            b = {dat.identifier, dat.charid, dat.id}
        end
        MySQL.query(c, b, function(result)
            Wait(200)
            if result[1] then
                a = result
            else
                a = false
            end
        end)
    elseif Config.framework == "vorp" then 
        if dat.id then 
            c = "SELECT * FROM ricx_camps WHERE identifier=@id2 AND charid=@id3 AND id=@id"
            b = {id2=dat.identifier, id3=dat.charid, id = dat.id}
        end
        exports.ghmattimysql:execute(c, b, function(result)
            Wait(200)
            if result[1] then
                a = result
            else
                a = false
            end
        end)
    elseif Config.framework == "qbr" or Config.framework == "qbr2" or Config.framework == "rsg" or Config.framework == "rpx" then   
        if dat.id then 
            if Config.Debug then 
                print("looking for camp data for identifier: ",dat.identifier," charid: ",dat.charid," camp id: ",dat.id)
            end
            c = "SELECT * FROM ricx_camps WHERE identifier=@id2 AND charid=@id3 AND id=@id"
            b = {id2=dat.identifier, id3=dat.charid, id = dat.id}
        end
        MySQL.query(c, b, function(result)
            Wait(200)
            if result[1] then
                if dat.id then 
                    if Config.Debug then 
                        print("found camp data for identifier: ",dat.identifier," charid: ",dat.charid," camp id: ",dat.id)
                    end
                end
                a = result
            else
                a = false
            end
        end)
    end
    while a == nil do 
        Wait(100)
    end
    return a
end
--------------------------------------------------------------------------------------------------------------------------------------------
function RedMSQL_Update(dat, save)
    if Config.framework == "redemrp" then 
        MySQL.Async.execute("UPDATE ricx_camps SET data=@data WHERE identifier=@id2 AND charid=@id3", {id2 = dat.identifier, id3 = dat.charid, data = save}, function(done)
        end)
    elseif Config.framework == "redemrp-reboot" then 
        MySQL.update("UPDATE ricx_camps SET data=? WHERE identifier=? AND charid=?", {save, dat.identifier, dat.charid}, function(done)
        end)
    elseif Config.framework == "vorp" then 
        exports.ghmattimysql:execute("UPDATE ricx_camps SET data=@data WHERE identifier=@id2 AND charid=@id3", {id2 = dat.identifier, id3 = dat.charid, data = save}, function(done)
        end)
    elseif Config.framework == "qbr" or Config.framework == "qbr2" or Config.framework == "rsg" or Config.framework == "rpx" then   
        MySQL.update("UPDATE ricx_camps SET data=@data WHERE identifier=@id2 AND charid=@id3", {id2 = dat.identifier, id3 = dat.charid, data = save})
    end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function RedMSQL_Update2(id, save)
    if Config.framework == "redemrp" then 
        MySQL.Async.execute("UPDATE ricx_camps SET data=@data WHERE id=@id", {id = id, data = save}, function(done)
        end)
    elseif Config.framework == "redemrp-reboot" then 
        MySQL.update("UPDATE ricx_camps SET data=? WHERE id=?", {save, id}, function(done)
        end)
    elseif Config.framework == "vorp" then 
        exports.ghmattimysql:execute("UPDATE ricx_camps SET data=@data WHERE id=@id", {id = id, data = save}, function(done)
        end)
    elseif Config.framework == "qbr" or Config.framework == "qbr2" or Config.framework == "rsg" or Config.framework == "rpx" then  
        MySQL.update("UPDATE ricx_camps SET data=@data WHERE id=@id", {id = id, data = save})
    end
end

function RedMSQL_Delete(dat)
    if Config.framework == "redemrp" then 
        MySQL.Async.fetchAll("DELETE FROM ricx_camps WHERE id=@id AND identifier=@identifier AND charid=@charid;", {id = dat.id, identifier = dat.id2, charid = dat.id3}, function(done)
        end)
    elseif Config.framework == "redemrp-reboot" then 
        MySQL.query("DELETE FROM ricx_camps WHERE id=? AND identifier=? AND charid=?;", {dat.id, dat.id2, dat.id3}, function(done)
        end)
    elseif Config.framework == "vorp" then 
        exports.ghmattimysql:execute("DELETE FROM ricx_camps WHERE id=@id AND identifier=@identifier AND charid=@charid;", {id = dat.id, identifier = dat.id2, charid = dat.id3}, function(done)
        end)
    elseif Config.framework == "qbr" or Config.framework == "qbr2" or Config.framework == "rsg" or Config.framework == "rpx" then   
        MySQL.query("DELETE FROM ricx_camps WHERE id = ? AND identifier = ? AND charid = ?", {dat.id, dat.id2, dat.id3}, function(done)
        end)
    end
end
--------------------------------------------------------------------------------------------------------------------------------------------
function RedMSQL_Insert(dat, save)
    if Config.framework == "redemrp" then 
        local id = nil
        MySQL.Async.insert("INSERT INTO ricx_camps (identifier, charid, data) VALUES (@identifier, @charid, @data)",  {identifier = dat.identifier, charid = dat.charid, data = save}, function(result)
            Wait(100)
            if result > 0 then 
                id = result
                if id then 
                    if Config.Debug then
                        print("Inserted Camp at ID "..id)
                    end
                else
                    id = false 
                    print("Failed to retrieve last insert id for CAMP")
                end
            end
        end)
        while not id do 
            Wait(100)
        end
        return id
    elseif Config.framework == "redemrp-reboot" then 
        local id = nil
        MySQL.insert("INSERT INTO ricx_camps (identifier, charid, data) VALUES (?,?,?)",  {dat.identifier, dat.charid, save}, function(result)
            Wait(100)
            if result > 0 then 
                id = result
                if id then 
                    if Config.Debug then
                        print("Inserted Camp at ID "..id)
                    end
                else
                    id = false 
                    print("Failed to retrieve last insert id for CAMP")
                end
            end
        end)
        while not id do 
            Wait(100)
        end
        return id
    elseif Config.framework == "vorp" then 
        local id = nil 
        exports.ghmattimysql:execute("INSERT INTO ricx_camps (identifier, charid, data) VALUES (@identifier, @charid, @data)",  {identifier = dat.identifier, charid = dat.charid, data = save}, function(result)
            Wait(100)
            if result and result.insertId > 0 then 
                id = result.insertId
                if id then 
                    if Config.Debug then
                        print("Inserted Camp at ID "..id)
                    end
                else
                    id = false 
                    print("Failed to retrieve last insert id for CAMP")
                end
            end
        end)
        while not id do 
            Wait(100)
        end
        return id
    elseif Config.framework == "qbr" or Config.framework == "qbr2" or Config.framework == "rsg" or Config.framework == "rpx" then  
        local id = nil 
        MySQL.insert("INSERT INTO ricx_camps (identifier, charid, data) VALUES (@identifier, @charid, @data)",  {identifier = dat.identifier, charid = dat.charid, data = save}, function(result)
            Wait(100)
            if result > 0 then 
                id = result
                if id then 
                    if Config.Debug then
                        print("Inserted Camp at ID "..id)
                    end
                else
                    id = false 
                    print("Failed to retrieve last insert id for CAMP")
                end
            end
        end)
        while id == nil do 
            Wait(100)
        end
        return id
    end
end
--------------------------------------------------------------------------------------------------------------------------------------------
local isLockerRegistered = {}

function OpenStashNow(src, idname)
    if Config.framework == "redemrp" then 
        if not isLockerRegistered[idname] then 
            isLockerRegistered[idname] = true
            data.createLocker(idname, 60000.0, 60000.0, 60000.0, nil)
        end
        Citizen.Wait(600)
        TriggerEvent("ricx_properties:open_redemrp_locker", src, idname)

    elseif Config.framework == "redemrp-reboot" then 
        MySQL.query("SELECT * FROM stashes WHERE stashid=?", {idname}, function(result)
            if result and result[1] then
                TriggerClientEvent('redemrp_inventory:OpenStash', src, idname)
            else
                MySQL.insert("INSERT INTO stashes (stashid, items) VALUES (?,?)", {idname, "[]"}, function(done)
                    Wait(200)
                    TriggerClientEvent('redemrp_inventory:OpenStash', src, idname)
                end)
            end
        end)

    elseif Config.framework == "vorp" then 
        if not isLockerRegistered[idname] then
            if Config.VORPLockerAPI then 
                local vc = Config.VORPLockerAPI
                VorpInv.registerInventory(idname, "Camp", Config.VORPLockerLimit, vc.acceptWeapons, vc.shared, vc.stack, vc.listonly, vc.usepermissions, vc.useBlackList, vc.ListWeapons)
            else
                VorpInv.registerInventory(idname, "Camp", Config.VORPLockerLimit, true, true, true)
            end
            isLockerRegistered[idname] = true
        end
        VorpInv.OpenInv(src, idname)

    elseif Config.framework == "rsg" then
        CustomStashLogic(src, idname)

    elseif Config.framework == "rpx" then
        if Config.customRPX_Inventory then 
            CustomStashLogic(src, idname)
        end 
    end
end

