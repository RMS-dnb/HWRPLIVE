local trainTab = {}
local elements = {}

function calculatePercentage(baseValue, percentage)
    local result = baseValue * (percentage / 100)
    return result
end

function isJob(job)
    if not Config.job.name then
		return true
	elseif type(Config.job.name) == "string" then
		return job == Config.job.name
	elseif type(Config.job.name) == "table" then
		for _, allowedJob in ipairs(Config.job.name) do
			if job == allowedJob then
				return true
			end
		end
	end
    return false
end

--------------------------- Event

RegisterServerEvent('d-labs-train:server:setupJobWork')
AddEventHandler('d-labs-train:server:setupJobWork', function(id,data,ent,pos)
    local src = source
   
    for index, train in pairs(trainTab) do
        if train.id == id then
            if trainTab[index]['work'] == false then
                trainTab[index]['work'] = true
                TriggerClientEvent('d-labs-train:client:setupJobWork',src,pos)
                TriggerClientEvent('d-labs-train:client:syncTrainManagment', -1, trainTab)
            else 
                TriggerClientEvent('Notification:'..GetCurrentResourceName(),src,'error',texts.notif.workHaveError,Config.Textures.alert[1], Config.Textures.alert[2], 2000)
            end
            break
        end
    end

    printDebug(dt(trainTab))
end)

RegisterServerEvent('d-labs-train:server:trainMenuUpgrade')
AddEventHandler('d-labs-train:server:trainMenuUpgrade', function()
    local src = source
    MySQL.Async.fetchAll('SELECT * FROM d_labs_trains_train', {}, function(trains)
        if trains and #trains > 0 then
            TriggerClientEvent('d-labs-train:client:trainMenuUpgrade', src, trains)
        else
            TriggerClientEvent('d-labs-train:client:trainMenuUpgrade', src, {})
        end
    end)
end)

RegisterServerEvent('d-labs-train:server:getMoneyFromBoss')
AddEventHandler('d-labs-train:server:getMoneyFromBoss', function()
    local src = source
    local money = 0

    MySQL.Async.fetchAll('SELECT money FROM d_labs_train_boss LIMIT 1', {}, function(currentMoney)
        if currentMoney[1] then
            money = currentMoney[1].money
        end
        TriggerClientEvent('d-labs-train:client:getMoneyFromBoss',src,money)
    end)
end)


function addMoneyForBoss(amount)
    local src = source
    local money = 0

    MySQL.Async.fetchAll('SELECT money FROM d_labs_train_boss LIMIT 1', {}, function(result)
        if result[1] then
            money = result[1].money
            local newMoney = money + amount

            MySQL.Async.execute('UPDATE d_labs_train_boss SET money = ? WHERE id = 1', {newMoney}, function(rowsChanged)
            end)
        end
    end)
end




RegisterServerEvent('d-labs-train:server:MoneyFromBossPay')
AddEventHandler('d-labs-train:server:MoneyFromBossPay', function()
    local src = source

    MySQL.Async.fetchAll('SELECT money FROM d_labs_train_boss LIMIT 1', {}, function(currentMoney)
        local money = currentMoney[1]

        if money and tonumber(money.money) > 0.0 then          
            MySQL.Async.execute('UPDATE d_labs_train_boss SET money = 0', {}, function(rowsChanged)
                addMoney(src,money.money)
            end)
        else
            TriggerClientEvent('Notification:'..GetCurrentResourceName(),src,'error',texts.notif.bossNoMoney,Config.Textures.alert[1], Config.Textures.alert[2], 2000)
        end
    end)

end)



RegisterServerEvent('d-labs-train:server:buyUpgrade')
AddEventHandler('d-labs-train:server:buyUpgrade', function(dataTrain, levelUpgrade, clientPrice)
    local src = source
    local trainId = dataTrain.idname
    local trainPrice = dataTrain.price
    local upgradeConfig = Config.Upgrade[levelUpgrade]

    if clientPrice == 0 or getMoneyAmount(src) >= clientPrice then
        if clientPrice > 0 then
            removeMoney(src, clientPrice)
        end

        MySQL.Async.fetchAll('SELECT * FROM d_labs_trains_train WHERE idname = @idname', {['@idname'] = trainId}, function(trains)
            if trains and #trains > 0 then
                local train = trains[1]
                
                MySQL.Async.execute('UPDATE d_labs_trains_train SET upgrade = @levelUpgrade WHERE idname = @idname', {
                    ['@levelUpgrade'] = levelUpgrade,
                    ['@idname'] = trainId
                }, function(rowsChanged)
                    if rowsChanged > 0 then
                        local logData = {
                            ["Train ID"] = trainId,
                            ["Label"] = dataTrain.label,
                            ['New upgrade'] = levelUpgrade,
                        }

                        sendLog('blue', texts.log.upgrade, logData, src)
                        
                    end
                end)
            end
        end)
    else
        TriggerClientEvent('Notification:'..GetCurrentResourceName(),src,'error',texts.notif.noMoney,Config.Textures.alert[1], Config.Textures.alert[2], 2000)
    end

    Citizen.Wait(500)
    MySQL.Async.fetchAll('SELECT * FROM d_labs_trains_train', {}, function(trains)
        if trains and #trains > 0 then
            TriggerClientEvent('d-labs-train:client:trainMenuUpgrade', src, trains)
        else
            TriggerClientEvent('d-labs-train:client:trainMenuUpgrade', src, {})
        end
    end)
end)

RegisterServerEvent('d-labs-train:server:getTrains')
AddEventHandler('d-labs-train:server:getTrains', function()
    local src = source
    MySQL.Async.fetchAll('SELECT * FROM d_labs_trains_train', {}, function(trains)
        if trains and #trains > 0 then
            TriggerClientEvent('d-labs-train:client:getTrains', src, trains)
        else
            TriggerClientEvent('d-labs-train:client:getTrains', src, {})
        end
    end)
end)

RegisterServerEvent('d-labs-train:client:getTrainsRenameEdit')
AddEventHandler('d-labs-train:client:getTrainsRenameEdit', function(data, newName)
    local src = source
    local trainId = data.idname
    
    MySQL.Async.fetchAll('SELECT * FROM d_labs_trains_train WHERE idname = @idname', {['@idname'] = trainId}, function(trains)
        if trains and #trains > 0 then
            local train = trains[1] 
            
            MySQL.Async.execute('UPDATE d_labs_trains_train SET label = @newName WHERE idname = @idname', {
                ['@newName'] = newName,
                ['@idname'] = trainId
            }, function(rowsChanged)

                local logData = {
                    ["Train ID"] = trainId,
                    ["New Name"] = newName,
                    ['Old Name'] = data.label,
                }
                sendLog('blue', texts.log.rename, logData, src)


                MySQL.Async.fetchAll('SELECT * FROM d_labs_trains_train', {}, function(updatedTrains)

                end)
            end)           
        else
            printError('05', 'I dont find the data')
        end

        Citizen.Wait(500)
        MySQL.Async.fetchAll('SELECT * FROM d_labs_trains_train', {}, function(trains)
            if trains and #trains > 0 then
                TriggerClientEvent('d-labs-train:client:getTrainsRename', src, trains)
            else
                TriggerClientEvent('d-labs-train:client:getTrainsRename', src, {})
            end
        end)
    end)
end)

RegisterServerEvent('d-labs-train:server:getTrainsSellDone')
AddEventHandler('d-labs-train:server:getTrainsSellDone', function(data)
    local src = source
    local trainId = data.idname
    
    MySQL.Async.fetchAll('SELECT * FROM d_labs_trains_train WHERE idname = @idname', {['@idname'] = trainId}, function(trains)
        if trains and #trains > 0 then

            local amount = calculatePercentage(data.price, Config.Economics.percentageSale)
            
            addMoney(src,amount)
            MySQL.Async.execute('DELETE FROM d_labs_trains_train WHERE idname = @idname', {['@idname'] = trainId}, function(rowsChanged)
               
                local logData = {
                    ["Train ID"] = trainId,
                    ["Label"] = data.label,
                }
                sendLog('red', texts.log.sell, logData, src)


                MySQL.Async.fetchAll('SELECT * FROM d_labs_trains_train', {}, function(updatedTrains)
                    if updatedTrains and #updatedTrains > 0 then
                        TriggerClientEvent('d-labs-train:client:getTrainsSell', src, updatedTrains)
                    else
                        TriggerClientEvent('d-labs-train:client:getTrainsSell', src, {})
                    end
                end)
            end)
        end
    end)
end)


RegisterServerEvent('d-labs-train:server:getTrainsRename')
AddEventHandler('d-labs-train:server:getTrainsRename', function()
    local src = source
    MySQL.Async.fetchAll('SELECT * FROM d_labs_trains_train', {}, function(trains)
        if trains and #trains > 0 then
            TriggerClientEvent('d-labs-train:client:getTrainsRename', src, trains)
        else
            TriggerClientEvent('d-labs-train:client:getTrainsRename', src, {})
        end
    end)
end)

RegisterServerEvent('d-labs-train:server:getTrainsSell')
AddEventHandler('d-labs-train:server:getTrainsSell', function()
    local src = source
    MySQL.Async.fetchAll('SELECT * FROM d_labs_trains_train', {}, function(trains)
        if trains and #trains > 0 then
            TriggerClientEvent('d-labs-train:client:getTrainsSell', src, trains)
        else
            TriggerClientEvent('d-labs-train:client:getTrainsSell', src, {})
        end
    end)
end)

RegisterServerEvent('d-labs-train:server:getTrainsTow')
AddEventHandler('d-labs-train:server:getTrainsTow', function()
    local src = source
    local sqlQuery = 'SELECT * FROM d_labs_trains_train WHERE status = "onTow"'

    MySQL.Async.fetchAll(sqlQuery, {}, function(trains)
        if trains and #trains > 0 then
            TriggerClientEvent('d-labs-train:client:getTrainsTow', src, trains)
        else
            TriggerClientEvent('d-labs-train:client:getTrainsTow', src, {})
        end
    end)
end)


RegisterServerEvent('d-labs-train:server:spawnTrain')
AddEventHandler('d-labs-train:server:spawnTrain', function(netid,trainData)
    local src = source

    local item = {
        src = src,
        id = netid,
        data = trainData,
        overheated = false,
        work = false,
        fuelOnTrain = true,
    }

    table.insert(trainTab, item)
    printDebug(dt(trainTab))
    TriggerClientEvent("d-labs-train:client:spawnTrain", -1, trainTab)

end)

RegisterServerEvent('d-labs-train:server:setBucket')
AddEventHandler('d-labs-train:server:setBucket', function(_)
    local IsBucket = _
    local src = source

    if isBucket then
        SetPlayerRoutingBucket(src, src)
    else 
        SetPlayerRoutingBucket(src, 0)
    end
end)

RegisterServerEvent('d-labs-train:server:CheckTrain')
AddEventHandler('d-labs-train:server:CheckTrain', function(_)
    local idname = _.idname
    local src = source
    local sqlFetch = "SELECT * FROM d_labs_trains_train WHERE idname = @idname"

    MySQL.Async.fetchAll(sqlFetch, {['@idname'] = idname}, function(result)
        if result and #result > 0 then
            local trainData = result[1]  

            if trainData.status ~= 'inGarage' then
                TriggerClientEvent('Notification:'..GetCurrentResourceName(),src,'error',texts.notif.trainIsOut,Config.Textures.alert[1], Config.Textures.alert[2], 2000)
            else

                TriggerClientEvent("d-labs-train:client:CheckTrain", src,trainData)

                local sqlUpdate = "UPDATE d_labs_trains_train SET status = 'inWorld' WHERE idname = @idname"
                MySQL.Async.execute(sqlUpdate, {['@idname'] = idname}, function(affectedRows)
                    if affectedRows and affectedRows > 0 then
                        printDebug("Train spawn")

                        local logData = {
                            ["Train ID"] = idname,
                            ["Label"] = _.label,
                        }
                        sendLog('green', texts.log.trainOut, logData, src)

                    else
                        printDebug("(1-1) Failed to update train status")
                    end
                end)
            end
        else
            printDebug("(1-2) No train data found")
        end
    end)
end)


RegisterServerEvent('d-labs-train:server:deleteTrain')
AddEventHandler('d-labs-train:server:deleteTrain', function(netid)
    local src = source
    local data = nil 

    local entityId = NetworkGetEntityFromNetworkId(netid)
    DeleteEntity(entityId)
    
    for k,v in pairs(trainTab) do
        if v.id == netid then
            data = v.data
            break
        end
    end

    if data then
        local idname = data.idname 
        local sqlFetch = "SELECT * FROM d_labs_trains_train WHERE idname = @idname"

        MySQL.Async.fetchAll(sqlFetch, {['@idname'] = idname}, function(result)
            if result and #result > 0 then
                local trainData = result[1]  

                local sqlUpdate = "UPDATE d_labs_trains_train SET status = 'inGarage' WHERE idname = @idname"
                MySQL.Async.execute(sqlUpdate, {['@idname'] = idname}, function(affectedRows)

                    local logData = {
                        ["Train ID"] = idname,
                        ["Label"] = data.label,
                    }
                    sendLog('green', texts.log.park, logData, src)

                end)
            end
        end)

        for k, v in pairs(trainTab) do
            if v.id == netid then
                table.remove(trainTab, k)
                printDebug('Train delete from server')
                break
            end
        end

        TriggerClientEvent('d-labs-train:client:spawnTrain',-1,trainTab)
    end
end)


RegisterServerEvent('d-labs-train:server:outOfTow')
AddEventHandler('d-labs-train:server:outOfTow', function(data)
    local src = source
    local idname = data.idname 
    local sqlFetch = "SELECT * FROM d_labs_trains_train WHERE idname = @idname"

    if not Config.Economics.pricePerTow then
        MySQL.Async.fetchAll(sqlFetch, {['@idname'] = idname}, function(result)
            if result and #result > 0 then
                local trainData = result[1]  
                local sqlUpdate = "UPDATE d_labs_trains_train SET status = 'inGarage' WHERE idname = @idname"
                MySQL.Async.execute(sqlUpdate, {['@idname'] = idname}, function(affectedRows)
                    local logData = {
                        ["Train ID"] = idname,
                        ["Label"] = data.label,
                    }
                    sendLog('green', texts.log.tow, logData, src)
                end)
            end
        end)



    elseif getMoneyAmount(src) >= Config.Economics.pricePerTow then
        removeMoney(src,Config.Economics.pricePerTow)
        MySQL.Async.fetchAll(sqlFetch, {['@idname'] = idname}, function(result)
            if result and #result > 0 then
                local trainData = result[1]  

                local sqlUpdate = "UPDATE d_labs_trains_train SET status = 'inGarage' WHERE idname = @idname"
                MySQL.Async.execute(sqlUpdate, {['@idname'] = idname}, function(affectedRows)
                    local logData = {
                        ["Train ID"] = idname,
                        ["Label"] = data.label,
                    }
                    sendLog('green', texts.log.tow, logData, src)
                end)
            end
        end)


    else 
        TriggerClientEvent('Notification:'..GetCurrentResourceName(),src,'error',texts.notif.noMoney..' ('..Config.Economics.pricePerTow..Config.WorldLore.currencySymbol..')',Config.Textures.alert[1], Config.Textures.alert[2], 2000)
    end 
end)



if Config.Work ~= false then 
    for k, v in pairs(Config.TrainStations) do
        if v.SellPoint then

            local minMoney = tonumber(v.SellPoint.money[1])
            local maxMoney = tonumber(v.SellPoint.money[2])

            local reward = minMoney + math.random() * (maxMoney - minMoney)
            reward = string.format("%.2f", reward) 

            table.insert(elements, {label = v.PosName, value = {reward = reward, pos = k}, desc = texts.SelectTrainDesc})
        end
    end
end



RegisterServerEvent('d-labs-trains:server:sendTabel')
AddEventHandler('d-labs-trains:server:sendTabel', function(k)
    TriggerClientEvent('d-labs-trains:client:sendTabel',source,elements,k)
end)

--------------------------- Custom

RegisterServerEvent('d-labs-train:server:coal')
AddEventHandler('d-labs-train:server:coal', function()
    local src = source
    local item = getItemCount(src,Config.Item.fuel)

    TriggerClientEvent('d-labs-train:client:coal',src,item)
end)


RegisterServerEvent('d-labs-train:server:water')
AddEventHandler('d-labs-train:server:water', function()
    local src = source
    local item = getItemCount(src,Config.Item.cooling)

    TriggerClientEvent('d-labs-train:client:water',src,item)
end)

RegisterServerEvent('d-labs-trains:server:giveMoney')
AddEventHandler('d-labs-trains:server:giveMoney', function(amount)
    local src = source
    if Config.Work.paymentForBox then 
        addMoney(src,amount.reward / Config.Work.BoxMaxNumber)
    else 
        addMoney(src,amount.reward)
    end

    if Config.Work.forBossMoney then
        if Config.Work.paymentForBox then 
            local amount = amount.reward / Config.Work.BoxMaxNumber 
            addMoneyForBoss(amount * Config.Work.forBossMoney)
        else 
            addMoneyForBoss(amount.reward * Config.Work.forBossMoney)
        end
    end
end)

RegisterServerEvent('d-labs-train:server:job')
AddEventHandler('d-labs-train:server:job', function()
    local src = source
    local job = getJobInfo(src).job
    TriggerClientEvent('d-labs-train:client:job',src,job)
end)

RegisterServerEvent('d-labs-train:server:getLicense')
AddEventHandler('d-labs-train:server:getLicense', function()
    local src = source

    local identifier = GetPlayerIdentifierByType(source, 'license')
    local licenseNumber = identifier:gsub("license:", "")
    
    TriggerClientEvent('d-labs-train:client:getLicense',src,licenseNumber)
end)

RegisterServerEvent('d-labs:server:removeItem')
AddEventHandler('d-labs:server:removeItem', function(name,amount)
    local src = source
    removeItem(src,name,amount)
end)

---------------------------- STASH

RegisterNetEvent("d-labs-train:server:openStashOnJob")
AddEventHandler("d-labs-train:server:openStashOnJob",function(stashName,stashConfig)
    local src = source
    local jobInfo = getJobInfo(src)
    local jobName = jobInfo.job

    if isJob(jobName) then 
        TriggerClientEvent('d-labs-train:client:openStashOnJob',src,stashName,stashConfig)
    else
        TriggerClientEvent('Notification:'..GetCurrentResourceName(),src,'error',texts.notif.noJobForStash,Config.Textures.alert[1], Config.Textures.alert[2], 2000)
    end
end)


RegisterServerEvent('d-labs-train:server:openManagement')
AddEventHandler('d-labs-train:server:openManagement', function()
    local src = source
    local jobInfo = getJobInfo(src)

    local jobName = jobInfo.job
    local varGrade = jobInfo.grade

    if (isJob(jobName) and varGrade >= Config.job.bossGrade) or Config.job.name == false then
        TriggerClientEvent('d-labs-train:client:openManagement',src)
    else 
        TriggerClientEvent('Notification:'..GetCurrentResourceName(),src,'error',texts.notif.noBoss,Config.Textures.alert[1], Config.Textures.alert[2], 2000)
    end
end)


---------------- MySql -----------------------------

RegisterNetEvent("d-labs-train:server:setTimetable")
AddEventHandler("d-labs-train:server:setTimetable",function(nameBorder)
    local src = source
    local jobInfo = getJobInfo(src)
    local jobName = jobInfo.job

    if isJob(jobName) then
        MySQL.Async.fetchAll('SELECT * FROM d_labs_train_timetable WHERE board_name = @boardName', {['@boardName'] = nameBorder}, function(result)
            if result and #result > 0 then
                TriggerClientEvent('d-labs-train:client:setTimetable',src,result,nameBorder)
            else
                TriggerClientEvent('d-labs-train:client:setTimetable',src,false,nameBorder)
            end
        end)

    else
        TriggerClientEvent('Notification:'..GetCurrentResourceName(),src,'error',texts.notif.noJobTimetable,Config.Textures.alert[1], Config.Textures.alert[2], 2000)
    end
end)

RegisterNetEvent("d-labs-train:server:editTimetable")
AddEventHandler("d-labs-train:server:editTimetable", function(data)

    MySQL.Async.execute('DELETE FROM d_labs_train_timetable WHERE board_name = @boardName', 
    {
        ['@boardName'] = data['boardName']
    }, function(affectedRows)
    end)

    Citizen.Wait(500)

    -- Nyní vložíme nové záznamy z boardData
    for _, v in pairs(data['boardData']) do
        if v.time and v.content then
            MySQL.Async.execute('INSERT INTO d_labs_train_timetable (board_name, date, time, content, price) VALUES (@boardName, @date, @time, @content, @price) ON DUPLICATE KEY UPDATE date=@date, time=@time, content=@content, price=@price', 
            {
                ['@boardName'] = data['boardName'],
                ['@date'] = v.date,
                ['@time'] = v.time,
                ['@content'] = v.content,
                ['@price'] = v.price
            }, function(affectedRows)
            end)
        end
    end

end)


RegisterNetEvent("d-labs-train:server:showTimetable")
AddEventHandler("d-labs-train:server:showTimetable",function(boardName)
    local src = source
    
    MySQL.Async.fetchAll('SELECT * FROM d_labs_train_timetable WHERE board_name = @boardName', {['@boardName'] = boardName}, function(result)
        if result and #result > 0 then
            TriggerClientEvent('d-labs-train:client:showTimetable', src, result, boardName)
        else
            TriggerClientEvent('d-labs-train:client:showTimetable', src, false, boardName)
        end
    end)
end)


RegisterNetEvent("d-labs-train:server:buyTrain")
AddEventHandler("d-labs-train:server:buyTrain",function(data)
    local src = source
    local Cfg = Config.Train[tonumber(data.id)]
    local price = Cfg.price

    if getMoneyAmount(src) >= price then 
        removeMoney(src,price)
        insertTrain(Cfg.label, Cfg.label, Cfg.model, 0, 0, price,src)


    else 
        TriggerClientEvent('Notification:'..GetCurrentResourceName(),src,'error',texts.notif.noMoney,Config.Textures.alert[1], Config.Textures.alert[2], 2000)
    end
end)

----------------------------------------------------------------------------
--  Database
----------------------------------------------------------------------------

function generateRandomString(length)
    local chars = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789'
    local randomString = ''
    math.randomseed(os.time())
    for i = 1, length do
        local index = math.random(#chars)
        randomString = randomString .. chars:sub(index, index)
    end
    return randomString
end

function insertTrain(label, model, hash, damage, upgrade, price, src)
    local idname = generateRandomString(15)  -- Generuje náhodný řetězec pro idname
    local stash = generateRandomString(15)   -- Generuje náhodný řetězec pro stash
    local status = 'inGarage'                -- Výchozí status

    MySQL.Async.fetchScalar("SELECT MAX(id) FROM d_labs_trains_train", {}, function(lastId)
        local nextId = (lastId or 0) + 1
        local finalLabel = label .. ' (' .. nextId .. ')'

        local sql = [[
            INSERT INTO d_labs_trains_train (idname, label, model, hash, status, damage, stash, upgrade, price)
            VALUES (@idname, @label, @model, @hash, @status, @damage, @stash, @upgrade, @price)
        ]]

        local logData = {
            ["Train ID"] = idname,
            ["Label"] = finalLabel,
        }
        sendLog('green', texts.log.buy, logData, src)

        MySQL.Async.execute(sql, {
            ['@idname'] = idname,
            ['@label'] = finalLabel,
            ['@model'] = model,
            ['@hash'] = hash,
            ['@status'] = status,
            ['@damage'] = damage,
            ['@stash'] = stash,
            ['@upgrade'] = upgrade,
            ['@price'] = price
        }, function(rowsChanged)
            
            
        end)
    end)
end

RegisterNetEvent('d-labs-train:server:syncTrainManagment')
AddEventHandler('d-labs-train:server:syncTrainManagment', function(id, nameOfStatus, statusValue)
    for index, train in pairs(trainTab) do
        if train.id == id then
            trainTab[index][nameOfStatus] = statusValue
            break
        end
    end
    TriggerClientEvent('d-labs-train:client:syncTrainManagment', -1, trainTab)
    printDebug(dt(trainTab))
end)

------------------------
-- Custom INV
------------------------

RegisterNetEvent("d-labs-train:server:vorpInv")
AddEventHandler("d-labs-train:server:vorpInv",function(name, stashName, stashConfig, tempLockerCoords)
    local src = source
    VorpInv.registerInventory(stashName, name, (stashConfig.slots or 100), true, true, true)
    Citizen.Wait(500)
    VorpInv.OpenInv(src, stashName)
end)

RegisterNetEvent("d-labs-train:server:rsgInv")
AddEventHandler("d-labs-train:server:rsgInv",function(stashName, stashConfig)
    local src = source
    local data = { label = texts.prompt.descTrainStash, maxweight = stashConfig.maxweight, slots = stashConfig.slots}
    exports['rsg-inventory']:OpenInventory(src, stashName, data)
end)



