
local framework = Config.Framework
local text = Config.Texts

Config.Textures = {
    cross = {"scoretimer_textures", "scoretimer_generic_cross"},
    locked = {"menu_textures","stamp_locked_rank"},
    tick = {"scoretimer_textures","scoretimer_generic_tick"},
    money = {"inventory_items", "money_moneystack"},
    alert = {"menu_textures", "menu_icon_alert"},
}

local deliveryOpen = {src = 0, status = false}

--------------------------- Framework

data = {}
local VorpCore
local VorpInv
local RSGCore
local qc

if framework == "VORP" then 
    TriggerEvent("getCore",function(core)
        VorpCore = core
    end)
    VorpInv = exports.vorp_inventory:vorp_inventoryApi()
elseif framework == "RSG" then 
    qc = "rsg-core"
    RSGCore = exports[qc]:GetCoreObject()
    RSGItems = RSGCore.Shared.Items
elseif framework == "REDEMRP_2023" then 
    TriggerEvent("redemrp_inventory:getData",function(call)
        data = call
    end)
    RedEM = exports["redem_roleplay"]:RedEM()
elseif Config.Framework == "QBR" then 
    QBRItems = exports['qbr-core']:GetItems() 
end

--------------------------------- MAIN

RegisterNetEvent('d-labs:server:addMoneyJob')
AddEventHandler('d-labs:server:addMoneyJob', function(_amount)
    local src = source
    local amount = _amount

    addMoney(src,amount)

    if Config.DeliveryMoneyToBankMultiplier ~= false then

        MySQL.query('SELECT container FROM d_labs_oil WHERE type=@type', {['@type'] = 'money'}, function(result)
            local firstRow = result[1]

            local updateParamsZero = {
                ['@container'] = tonumber(firstRow.container) + tonumber(amount) * Config.DeliveryMoneyToBankMultiplier,
                ['@type'] = 'money',
            }
            
            MySQL.Async.execute("UPDATE d_labs_oil SET container=@container WHERE type=@type", updateParamsZero, function(rowsAffected)


            end)
        end)

    end
end)


RegisterNetEvent('d-labs:server:setMenuStatus')
AddEventHandler('d-labs:server:setMenuStatus', function(status)
    local src = source

    deliveryOpen = {src = src, status = status}


    TriggerClientEvent('d-labs:client:setMenuStatus',-1,status)
end)

AddEventHandler('playerDropped', function(reason)
    local src = source

    if deliveryOpen.src == src then 
        deliveryOpen = {src = 0, status = false}

        TriggerClientEvent('d-labs:client:setMenuStatus',-1,false)

    end
end)



RegisterNetEvent('d-labs:server:MoneyBank')
AddEventHandler('d-labs:server:MoneyBank', function(_amount,_action)
    local src = source
    local amount = _amount
    local action = _action
    local name = 'money'

    MySQL.query('SELECT container FROM d_labs_oil WHERE type=@type', {['@type'] = name}, function(result)
        local firstRow = result[1]
    
        if firstRow.container ~= 0 then
            addMoney(src,firstRow.container)
            

            TriggerClientEvent("Notification:d_labs_oil",src, 'success', text.notifMoney..firstRow.container..'$', Config.Textures.alert[1], Config.Textures.alert[2], 2000)

            local updateParamsZero = {
                ['@type'] = name,
                ['@container'] = 0
            }

            MySQL.Async.execute("UPDATE d_labs_oil SET container=@container WHERE type=@type", updateParamsZero, function(rowsAffected)



            end)
        else 
            TriggerClientEvent("Notification:d_labs_oil",src, 'error', text.notifNoMoney, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
        end
    end)   
end)



function addMoney(_,_a)
    local src = _
    local amount = _a 

    if framework == "VORP" then 
        local Character = VorpCore.getUser(src).getUsedCharacter
        Character.addCurrency(0 , tonumber(amount))
    elseif framework == "RSG" then 
        local Player = RSGCore.Functions.GetPlayer(src)
        Player.Functions.AddMoney('cash', amount)     
    elseif framework == "REDEMRP_2023" then 
        local Player = RedEM.GetPlayer(src)
        Player.AddMoney(amount)    
    elseif Config.Framework == "QBR" then 
        local User = exports['qbr-core']:GetPlayer(src)
        User.Functions.AddMoney("cash", amount, "Oil factory")
    else
        OpenAddMoney(src,amount)   
    end
end



function removeItem(_,_i,_a)
    local src = _
    local itemName = _i
    local amount = _a

    if framework == "VORP" then 
        VorpInv.subItem(src, itemName, amount)
    elseif framework == "RSG" then 
        local Player = RSGCore.Functions.GetPlayer(src)
        Player.Functions.RemoveItem(itemName, amount)     
    elseif framework == "REDEMRP_2023" then 
        local player = RedEM.GetPlayer(src)
        local itemData = data.getItem(src, itemName)
        itemData.RemoveItem(amount)     

    elseif Config.Framework == "QBR" then 
        local User = exports['qbr-core']:GetPlayer(src)
        User.Functions.RemoveItem(itemName,amount)
    else  
        OpenRemoveItem(src,itemName,amount)
    end
end

function addItem(_,_i,_a)
    local src = _
    local itemName = _i
    local amount = _a

    if framework == "VORP" then 
        VorpInv.addItem(src,itemName,amount)
    elseif framework == "RSG" then 
        local Player = RSGCore.Functions.GetPlayer(src)
        Player.Functions.AddItem(itemName, amount)     
    elseif framework == "REDEMRP_2023" then 
        local Player = RedEM.GetPlayer(src)

        local ItemData = data.getItem(src,itemName)
        ItemData.AddItem(amount)   
    elseif Config.Framework == "QBR" then 
        local User = exports['qbr-core']:GetPlayer(src)
        User.Functions.AddItem(itemName,amount)
    else  
        OpenAddItem(src,itemName,amount)
    end
end

function GetItem(_,_i)
    local itemName = _i
    local src = _
    local item = nil


    if framework == "VORP" then 
        local itemName = VorpInv.getItemCount(src, itemName)

        if not itemName then 
            item = 0
        else 
            item = itemName
        end 

    elseif framework == "RSG" then 
        local Player = RSGCore.Functions.GetPlayer(src)
        item = Player.Functions.GetItemByName(itemName)

        if item ~= nil then 
            item = Player.Functions.GetItemByName(itemName).amount
        else 
            item = 0 
        end

      
    elseif framework == "REDEMRP_2023" then 
    
        local player = RedEM.GetPlayer(src)
        local itemName = data.getItem(src, itemName)

        if itemName == nil then 
            item = 0
        else 
            item = itemName.ItemAmount 
        end 


    elseif Config.Framework == "QBR" then 
        local User = exports['qbr-core']:GetPlayer(src)
        local itemName = User.Functions.GetItemByName(v.itemname)
        
        if itemName == nil then 
            item = 0
        else 
            item = itemName.amount
        end 

    else  
        item = OpenGetItem(src,itemName)   
    end

    return item




end


RegisterNetEvent('d-labs:server:deleteContainer')
AddEventHandler('d-labs:server:deleteContainer', function(_, _n)
    local src = source
    local tab = _
    local minus = tab.prc
    local name = _n

    MySQL.query('SELECT * FROM d_labs_oil WHERE label=?', {name}, function(result)
        local firstRow = result[1]

        local updateParams = {
            ['@container'] = tonumber(firstRow.container) - tonumber(minus),
            ['@label'] = name,
        }

        if tonumber(firstRow.container) - tonumber(minus) == 0 then

            local updateParamsZero = {
                ['@container'] = tonumber(firstRow.container) - tonumber(minus),
                ['@label'] = name,
                ['@refined'] = 0,
                ['@open'] = 1,
            }

            MySQL.Async.execute("UPDATE d_labs_oil SET container=@container, refined=@refined, open=@open WHERE label=@label", updateParamsZero, function(rowsAffected)

            end)
        else
            MySQL.Async.execute("UPDATE d_labs_oil SET container=@container WHERE label=@label", updateParams, function(rowsAffected)

            end)
        end
    end)
end)

RegisterNetEvent('d-labs:server:containerStats')
AddEventHandler('d-labs:server:containerStats', function()
    local src = source
    local tab = nil

    MySQL.query('SELECT * FROM d_labs_oil WHERE label=label', {label}, function(result)
        tab = result

        TriggerClientEvent('d-labs:client:containerStats',src, tab)
    end)
end)

RegisterNetEvent('d-labs:server:setLock')
AddEventHandler('d-labs:server:setLock', function(_)
    local _label = _
    local src = source
    local tab = nil
    local newStats = nil


    MySQL.query('SELECT * FROM d_labs_oil WHERE label=label', {_label}, function(result)
        tab = result
        for k,v in pairs(tab) do
            if v.label == _label and tonumber(v.refined) == 0 then 
        
                if tonumber(v.open) == 1 then 
                    newStats = 0 
                else 
                    newStats = 1
                end

            end
        end 

        local updateParams = { ['@label'] = _label, ['@open'] = newStats}

        MySQL.Async.execute("UPDATE d_labs_oil SET open=@open WHERE label=@label", updateParams, function()
    
        end)

    end)

    Citizen.Wait(100)
    MySQL.query('SELECT * FROM d_labs_oil WHERE label=label', {label}, function(result)
        tab = result

        TriggerClientEvent('d-labs:client:containerStats',src, tab)
    end)

end)

RegisterNetEvent('d-labs:server:isJob')
AddEventHandler('d-labs:server:isJob', function()
    local src = source
    local tabJob = nil

    if framework == "VORP" then 
        local Character = VorpCore.getUser(src).getUsedCharacter
        local a = Character.job
        local b = Character.jobGrade

        tabJob = {name = a, grade = b}   
    elseif framework == "RSG" then 
        local Player = RSGCore.Functions.GetPlayer(src)
        local a = Player.PlayerData.job.name
        local b = Player.PlayerData.job.grade.level

        tabJob = {name = a, grade = b}
    elseif framework == "REDEMRP_2023" then 
        local player = RedEM.GetPlayer(src)
        local a = player.job
        local b = player.jobgrade

        tabJob = {name = a, grade = b}

    elseif framework == "QBR" then   
        local User = exports['qbr-core']:GetPlayer(src)
        tabJob = {name = User.PlayerData.job.name, grade = User.PlayerData.job.grade.level}
    else  
        tabJob = OpenGetJob(src)  

    end

    TriggerClientEvent('d-labs:client:isJob',src,tabJob)

end)

RegisterNetEvent('d-labs:server:showStats')
AddEventHandler('d-labs:server:showStats', function(_name)
    local src = source
    local tab = nil
    local name = _name

    MySQL.query('SELECT * FROM d_labs_oil WHERE label=label', {label}, function(result)
        tab = result
        local notif = true
     
        for k,v in pairs(tab) do
            if v.label == name then 
                local send = v.container
                TriggerClientEvent('d-labs:client:showStats',src, send,name)
                notif = false
                break
            end
        end

        if notif then
            TriggerClientEvent("Notification:d_labs_oil",src, 'inform', text.notifFullEmpty, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
        end
    end)
end)



RegisterNetEvent('d-labs:server:updateContainer')
AddEventHandler('d-labs:server:updateContainer', function(name,amount,upOrDown,point)
    local src = source    
    local plus = amount
    local label = name
    local can = false

    MySQL.query('SELECT * FROM d_labs_oil WHERE label=?', {label}, function(result)

        local final = result[1]

        if final == nil then
            local params = { ['@label'] = label, ['@container'] = 0+plus, ['@refined'] = false, ['@open'] = true, ['@type'] = 'container' }
            Citizen.Wait(300)
            MySQL.Async.insert('INSERT INTO d_labs_oil (container, label, refined, open, type) VALUES (:container, :label, :refined, :open,:type)', params, function(result)
            end)

            if plus >= 1 then 
                TriggerClientEvent('d-labs:client:updateContainer',src,'1',label,point)
            else 
                TriggerClientEvent('d-labs:client:updateContainer',src,true,label,point)
            end
        else
            local newContainerValue = result[1].container + plus

            if upOrDown == false then
                newContainerValue = result[1].container - plus

                if newContainerValue < 0 then 
                    newContainerValue = 0
                end 
            end


            MySQL.query('SELECT * FROM d_labs_oil WHERE label=label', {label}, function(result)
                for k,v in pairs(result) do
                    if v.label == label then 
        
                        if tonumber(v.open) == 1 and tonumber(v.refined) ~= 1 then 

                            if Config.oilContainer[label].max >= newContainerValue then

                                local updateParams = { ['@label'] = label, ['@container'] = newContainerValue }

                                MySQL.Async.execute("UPDATE d_labs_oil SET container=@container WHERE label=@label", updateParams, function(rowsAffected)

                                end)

                                TriggerClientEvent('d-labs:client:updateContainer',src,'1',label,point)
                               
                            else
                                
                                local updateParams = { ['@label'] = label, ['@container'] = Config.oilContainer[label].max }

                                MySQL.Async.execute("UPDATE d_labs_oil SET container=@container WHERE label=@label", updateParams, function(rowsAffected)

                                end)

                                TriggerClientEvent('d-labs:client:updateContainer',src,'3',label,point)
                            end
                        else 
                            TriggerClientEvent('d-labs:client:updateContainer',src,'2',label,point)
                        end
                    end
                end 
            end)
        end
    end)
end)

function doRefined(_src,_)
    local src = _src
    local label = _

    MySQL.query('SELECT * FROM d_labs_oil WHERE label=?', {label}, function(result)

        local firstRow = result[1]
        if tonumber(firstRow.container) > 1 and tonumber(firstRow.refined) == 0 or firstRow.refined == nil then
            local updateParams = {
                ['@label'] = firstRow.label,
                ['@container'] = firstRow.container,
                ['@open'] = 0,
                ['@refined'] = 1,
                ['@type'] = 'container',
            }

            MySQL.Async.execute("UPDATE d_labs_oil SET refined=@refined,open=@open WHERE label=@label", updateParams, function(rowsAffected)
                
                
                TriggerClientEvent("Notification:d_labs_oil",src,'error', text.notifSucRefined, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
                
            end)
        elseif tonumber(firstRow.container) > 1 then
            TriggerClientEvent("Notification:d_labs_oil",src,'error', text.notifRefined, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
        else 
            TriggerClientEvent("Notification:d_labs_oil",src,'error', text.notifEmpty, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
        end
    end)
end

RegisterNetEvent('d-labs:server:clear')
AddEventHandler('d-labs:server:clear', function(label)
    local src = source

    MySQL.query('SELECT * FROM d_labs_oil WHERE label=?', {label}, function(result)
        local firstRow = result[1]


        local updateParams = {
            ['@label'] = firstRow.label,
            ['@container'] = 0,
            ['@open'] = 1,
            ['@refined'] = 0,
            ['@type'] = 'container',
        }

        MySQL.Async.execute("UPDATE d_labs_oil SET container=@container, open=@open, refined=@refined WHERE label=@label", updateParams, function(rowsAffected)


        end)

        TriggerClientEvent("Notification:d_labs_oil",src,'error', firstRow.label..' - '..text.notifClear, Config.Textures.alert[1], Config.Textures.alert[2], 2000)

    end)
end)


RegisterNetEvent('d-labs:server:addFuel')
AddEventHandler('d-labs:server:addFuel', function(_)
    local src = source
    local index = _.index
    local item = _.name

    local amount = GetItem(src,item)
    removeItem(src,item,amount)

    indexPlus = amount * index

    local plus = indexPlus

    MySQL.query('SELECT * FROM d_labs_oil WHERE type=?', {'fuel'}, function(result)
        local firstRow = result[1]

        local updateParams = {
            ['@container'] = result[1].container + plus,
            ['@type'] = 'fuel',
        }

        MySQL.Async.execute("UPDATE d_labs_oil SET container=@container WHERE type=@type", updateParams, function(rowsAffected)

            if plus > 0 then
                TriggerClientEvent("Notification:d_labs_oil",src,'succes', text.notifAddFuel..' [+'..plus..' '..Config.oilUnits..']', Config.Textures.alert[1], Config.Textures.alert[2], 2000)
            else 
                TriggerClientEvent("Notification:d_labs_oil",src,'error', text.notifNoAddFuel, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
            end
        end)
    end)
end)

RegisterNetEvent('d-labs:server:jobSetup')
AddEventHandler('d-labs:server:jobSetup', function(_)
    local src = source
    local updateParams = { ['@type'] = 'container', ['@refined'] = true }

    if not Config.disableManagementSystem.active then
        MySQL.query('SELECT * FROM d_labs_oil WHERE type=@type AND refined=@refined', updateParams, function(result)
            TriggerClientEvent('d-labs:client:jobSetup',src,result)
        end)
    else
        MySQL.query('SELECT * FROM d_labs_oil WHERE type=@type AND container > 1', updateParams, function(result)
            TriggerClientEvent('d-labs:client:jobSetup', src, result)
        end)
    end
end)


RegisterNetEvent('d-labs:server:craftCheck')
AddEventHandler('d-labs:server:craftCheck', function(_,time)
    local name = _
    local src = source

    if not Config.disableManagementSystem.active then
        MySQL.query('SELECT * FROM d_labs_oil WHERE refined=?', {true}, function(result)
            TriggerClientEvent('d-labs:client:craftCheck',src,result,name,time)     
        end)
    else
        MySQL.query('SELECT * FROM d_labs_oil WHERE container > 1 AND type NOT IN ("fuel", "money")', {true}, function(result)
            TriggerClientEvent('d-labs:client:craftCheck', src, result, name, time)
        end)
    end
end)

RegisterNetEvent('d-labs:server:craftItem')
AddEventHandler('d-labs:server:craftItem', function(_tab, _itemTab, craftingTime)
    local src = source
    local label = _tab
    local itemTab = _itemTab

    if itemTab.ing ~= false then
        for k, v in pairs(itemTab.ing) do
            if GetItem(src, v.item) < v.amount then
                TriggerClientEvent("Notification:d_labs_oil", src, 'error', text.notifNoItem, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
                TriggerClientEvent('d-labs:client:craftItem',src,false, craftingTime)
                return
            end
        end
    end

    if label ~= false then
        local updateParams = {
            ['@label'] = label,
            ['@type'] = 'container',
        }

        MySQL.query('SELECT * FROM d_labs_oil WHERE type=@type AND label=@label', updateParams, function(result)

            if result[1] and result[1].container >= itemTab.oil then
                local updateParams = {
                    ['@container'] = tonumber(result[1].container) - tonumber(itemTab.oil),
                    ['@type'] = 'container',
                    ['@label'] = label,
                }

                MySQL.Async.execute("UPDATE d_labs_oil SET container=@container WHERE type=@type AND label=@label", updateParams, function(rowsAffected)

                end)

                if itemTab.ing ~= false then
                    for k, v in pairs(itemTab.ing) do
                        removeItem(src, v.item,v.amount)
                        addItem(src,itemTab.item,Config.craftingItem[itemTab.item].getAmount)
                    end
                else 
                    addItem(src,itemTab.item,Config.craftingItem[itemTab.item].getAmount)
                end

                TriggerClientEvent('d-labs:client:craftItem',src,true , craftingTime)

            else
                TriggerClientEvent('d-labs:client:craftItem',src,false , craftingTime)
                TriggerClientEvent("Notification:d_labs_oil", src, 'error', text.noOil, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
            end
        end)
    else 
        if itemTab.ing ~= false then
            for k, v in pairs(itemTab.ing) do
                removeItem(src, v.item,v.amount)
                addItem(src,itemTab.item,Config.craftingItem[itemTab.item].getAmount)
            end
        else 
            addItem(src,itemTab.item,Config.craftingItem[itemTab.item].getAmount)
        end
        TriggerClientEvent('d-labs:client:craftItem',src,true , craftingTime)
    end
end)



RegisterNetEvent('d-labs:server:refined')
AddEventHandler('d-labs:server:refined', function(name)
    local src = source
    
    MySQL.query('SELECT * FROM d_labs_oil WHERE type=?', {'fuel'}, function(result)
        local fuelRow = result[1]

        MySQL.query("SELECT container FROM d_labs_oil WHERE label=@label AND type='container'", {['@label'] = name}, function(resultTwo)
            local containerRow = resultTwo[1]

            if fuelRow and containerRow then
                if fuelRow.container >= containerRow.container then
                    local newFuelContainer = fuelRow.container - containerRow.container

                    MySQL.query('SELECT * FROM d_labs_oil WHERE label=?', {name}, function(result)

                        local firstRow = result[1]
                        if tonumber(firstRow.container) > 1 and tonumber(firstRow.refined) == 0 or firstRow.refined == nil then
                            local updateParams = {
                                ['@label'] = firstRow.label,
                                ['@container'] = firstRow.container,
                                ['@open'] = 0,
                                ['@refined'] = 1,
                                ['@type'] = 'container',
                            }
                
                            MySQL.Async.execute("UPDATE d_labs_oil SET refined=@refined,open=@open WHERE label=@label", updateParams, function(rowsAffected)
                                
                                local updateParams = {
                                    ['@container'] = newFuelContainer,
                                    ['@type'] = 'fuel',
                                }
            
                                MySQL.Async.execute("UPDATE d_labs_oil SET container=@container WHERE type=@type", updateParams, function(rowsAffected)
            
                                end)
                                
                                TriggerClientEvent("Notification:d_labs_oil",src,'error', text.notifSucRefined, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
                                
                            end)
                        elseif tonumber(firstRow.container) > 1 then
                            TriggerClientEvent("Notification:d_labs_oil",src,'error', text.notifRefined, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
                        else 
                            TriggerClientEvent("Notification:d_labs_oil",src,'error', text.notifEmpty, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
                        end
                    end)
                else 
                    TriggerClientEvent("Notification:d_labs_oil", src, 'error', text.noFuel, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
                end
            end
        end)
    end)
end)



if not Config.Server.AutoInsertSQL then

    MySQL.query('SELECT * FROM d_labs_oil WHERE label=@label', { ['@label'] = 'money' }, function(result)

        local final = result
        local haveMoney = false

        for k, v in pairs(final) do
            if v.type == 'money' then
                haveMoney = true 
            end 
        end 

        if not haveMoney then 
            local params = { ['@label'] = 'money', ['@container'] = 0, ['@open'] = 1, ['@type'] = 'money' }
            Citizen.Wait(300)
            MySQL.Async.insert('INSERT INTO d_labs_oil (container, label, open, refined, type) VALUES (:container, :label, :open, :refined, :type)', params, function(insertResult)
                printDebug("Entry for 'money' has been successfully added.")
            end)
        end
    end)

    MySQL.query('SELECT * FROM d_labs_oil WHERE label=@label', { ['@label'] = 'fuel' }, function(result)

        local final = result
        local haveFuel = false

        for k, v in pairs(final) do
            if v.type == 'fuel' then
                haveFuel = true 
            end 
        end 

        if not haveFuel then 
            local params = { ['@label'] = 'fuel', ['@container'] = 0, ['@open'] = 1, ['@type'] = 'fuel' }
            Citizen.Wait(300)
            MySQL.Async.insert('INSERT INTO d_labs_oil (container, label, open, refined, type) VALUES (:container, :label, :open, :refined, :type)', params, function(insertResult)
                printDebug("Entry for 'fuel' has been successfully added.")
            end)
        end
    end)

else 

    local createTableQuery = [[
    CREATE TABLE IF NOT EXISTS `d_labs_oil` (
      `label` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
      `container` int(11) NOT NULL,
      `open` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
      `refined` tinytext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
      `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
    ]]
    
    MySQL.query(createTableQuery, {}, function(affectedRows)
        printDebug("Table `d_labs_oil` has been successfully created or already exists.")

        MySQL.query('SELECT * FROM d_labs_oil WHERE label=@label', { ['@label'] = 'money' }, function(result)
            local final = result
            local haveMoney = false

            for k, v in pairs(final) do
                if v.type == 'money' then
                    haveMoney = true 
                end 
            end 

            if not haveMoney then 
                local params = { ['@label'] = 'money', ['@container'] = 0, ['@open'] = 1, ['@type'] = 'money' }
                Citizen.Wait(300)
                MySQL.Async.insert('INSERT INTO d_labs_oil (container, label, open, refined, type) VALUES (:container, :label, :open, :refined, :type)', params, function(insertResult)
                    printDebug("Entry for 'money' has been successfully added.")
                end)
            end
        end)

        MySQL.query('SELECT * FROM d_labs_oil WHERE label=@label', { ['@label'] = 'fuel' }, function(result)
            local final = result
            local haveFuel = false

            for k, v in pairs(final) do
                if v.type == 'fuel' then
                    haveFuel = true 
                end 
            end 

            if not haveFuel then 
                local params = { ['@label'] = 'fuel', ['@container'] = 0, ['@open'] = 1, ['@type'] = 'fuel' }
                Citizen.Wait(300)
                MySQL.Async.insert('INSERT INTO d_labs_oil (container, label, open, refined, type) VALUES (:container, :label, :open, :refined, :type)', params, function(insertResult)
                    printDebug("Entry for 'fuel' has been successfully added.")
                end)
            end
        end)

        local containersToInsert = {}
        for label, settings in pairs(Config.oilContainer) do
            MySQL.query('SELECT * FROM d_labs_oil WHERE label=@label', { ['@label'] = label }, function(result)
                local final = result
                local exists = #final > 0

                if not exists then
                    table.insert(containersToInsert, {
                        label = label,
                        container = 0,
                        open = 1,
                        refined = 0,
                        type = 'container'
                    })
                end
            end)
        end

        Citizen.Wait(500)
        for _, container in ipairs(containersToInsert) do
            local params = {
                ['@label'] = container.label,
                ['@container'] = container.container,
                ['@open'] = container.open,
                ['@refined'] = container.refined,
                ['@type'] = container.type,
            }
            MySQL.Async.insert('INSERT INTO d_labs_oil (container, label, open, refined, type) VALUES (:container, :label, :open, :refined, :type)', params, function(insertResult)
                printDebug("Entry for container '" .. container.label .. "' has been successfully added.")
            end)
        end

    end)    
end


RegisterNetEvent('d-labs:server:getCustomLabel')
AddEventHandler('d-labs:server:getCustomLabel', function(name)
    local src = source
    local send = nil
    
    if framework == "VORP" then 
        if VorpInv.getDBItem(src, name) then
            send = VorpInv.getDBItem(src, name).label
        else 
            print(name..' \27[31m- not found\27[0m')
            send = name
        end
    elseif framework == "REDEMRP_2023" then 
        if data.getItemData(name) then
            send = data.getItemData(name).label
        else 
            print(name..' \27[31m- not found\27[0m')
            send = name
        end
    else 
        send = OpenGetLabelItem(name)
    end

    TriggerClientEvent('d-labs:server:getCustomLabel',src,send)
end)



