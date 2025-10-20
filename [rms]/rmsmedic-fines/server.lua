local RSGCore = exports['rsg-core']:GetCoreObject()

-- Create fine command
RegisterCommand(Config.CreateFine, function(source, args)
    local _source = source
    local Player = RSGCore.Functions.GetPlayer(_source)
    
    if not Player then return end
    
    local location = Player.PlayerData.job.name
    local player, distance = RSGCore.Functions.GetClosestPlayer(_source)
    
    -- Check if player has the right job type
    local hasPermission = false
    for _, v in pairs(Config.PlayerJobTypes) do
        if Player.PlayerData.job.type == v then
            hasPermission = true
            break
        end
    end
    
    if not hasPermission then
        return
    end
    
    if player ~= -1 and distance < 1 then
        local Infrator = RSGCore.Functions.GetPlayer(tonumber(player))
        if Infrator then
            local infratorid = Infrator.PlayerData.citizenid
            TriggerClientEvent('medic-fines:client:createfine', _source, infratorid, tonumber(1), location)
        end
    else
        jo.notif.rightError(_source, Language.lang_2)
    end
end)

-- See fines command
RegisterCommand(Config.SeeFine, function(source, args)
    local _source = source
    local Player = RSGCore.Functions.GetPlayer(_source)
    
    if not Player then return end
    
    -- Check if player has the right job type
    local hasPermission = false
    for _, v in pairs(Config.PlayerJobTypes) do
        if Player.PlayerData.job.type == v then
            hasPermission = true
            break
        end
    end
    
    if hasPermission then
        TriggerEvent('medic-fines:server:getarchivesall', _source)
    end
end)

-- Check own fines command
RegisterCommand(Config.CheckFine, function(source, args)
    local _source = source
    local Player = RSGCore.Functions.GetPlayer(_source)
    
    if not Player then return end
    
    local citizenid = Player.PlayerData.citizenid
    TriggerEvent('medic-fines:server:getmyfines', _source, citizenid)
end)

-- Register a new fine
RegisterNetEvent('medic-fines:server:registerfine', function(infratorid, name, lastname, description, fine, location)
    local _source = source
    local Player = RSGCore.Functions.GetPlayer(_source)
    
    if not Player then return end
    
    local officername = Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname
    local date = os.date('!%d-%m')
    
    local param = {
        citizenid = infratorid,
        firstname = name,
        lastname = lastname,
        officername = officername,
        description = description,
        fine = fine,
        location = location,
        date = date
    }

    MySQL.insert("INSERT INTO medic_fines (`citizenid`,`firstname`,`lastname`, `officername`, `description`,`fine`, `location`, `date`) VALUES (@citizenid, @firstname, @lastname, @officername, @description, @fine, @location, @date)",
        param, function(insertId)
            if insertId then
                jo.notif.rightSuccess(_source, Language.lang_20)
            else
                jo.notif.rightError(_source, "Error inserting fine")
            end
        end)
end)

-- Get all fines
RegisterNetEvent('medic-fines:server:getarchivesall', function(src)
    local _source = src or source
    local Player = RSGCore.Functions.GetPlayer(_source)
    
    if not Player then return end
    
    local location = Player.PlayerData.job.name
    local jobtype = Player.PlayerData.job.type
    local archives = {}
    
    MySQL.query("SELECT * FROM medic_fines", {}, function(results)
        if results and #results > 0 then
            for _, value in pairs(results) do
                archives[#archives + 1] = {
                    FineId = value.id,
                    InfratorId = value.citizenid,
                    Name = value.firstname,
                    LastName = value.lastname,
                    Description = value.description,
                    Officer = value.officername,
                    Fine = value.fine,
                    Location = value.location,
                    Date = value.date,
                }
            end
            
            table.sort(archives, function(a, b)
                return a.FineId > b.FineId  -- Sort by newest first
            end)
            
            TriggerClientEvent('medic-fines:client:archivesall', _source, archives, location, jobtype)
        else
            TriggerClientEvent('medic-fines:client:nofines', _source)
        end
    end)
end)

-- Get player's fines
RegisterNetEvent('medic-fines:server:getmyfines', function(src, citizenid)
    local _source = src or source
    local archives = {}
    
    MySQL.query("SELECT * FROM medic_fines WHERE citizenid = ?", {citizenid}, function(results)
        if results and #results > 0 then
            for _, value in pairs(results) do
                table.insert(archives, {
                    FineId = value.id,
                    InfratorId = value.citizenid,
                    Name = value.firstname,
                    LastName = value.lastname,
                    Description = value.description,
                    Officer = value.officername,
                    Fine = value.fine,
                    Location = value.location,
                    Date = value.date,
                })
            end
            TriggerClientEvent('medic-fines:client:myfinesmenu', _source, archives, citizenid)
        else
            TriggerClientEvent('medic-fines:client:nofines', _source)
        end
    end)
end)

-- Delete a fine
RegisterNetEvent('medic-fines:server:deletefine', function(fineid)
    local _source = source
    
    MySQL.update('DELETE FROM medic_fines WHERE id = ?', {fineid}, function(rowsChanged)
        if rowsChanged and rowsChanged > 0 then
            jo.notif.rightSuccess(_source, Language.lang_28)
        else
            jo.notif.rightError(_source, "Error deleting fine")
        end
    end)
end)

-- Pay a fine
RegisterNetEvent('medic-fines:server:payfine', function(fineid, fineprice, location)
    local _source = source
    local Player = RSGCore.Functions.GetPlayer(_source)
    
    if not Player then return end
    
    local money = Player.Functions.GetMoney('cash')
    local cost = tonumber(fineprice)
    
    if money >= cost then
        Player.Functions.RemoveMoney('cash', cost)
        
        MySQL.update('DELETE FROM medic_fines WHERE id = ?', {fineid}, function(rowsChanged)
            if rowsChanged and rowsChanged > 0 then
                exports['rsg-bossmenu']:AddMoney(location, cost)
                jo.notif.rightSuccess(_source, Language.lang_29)
            else
                -- Return the money if the fine couldn't be deleted
                Player.Functions.AddMoney('cash', cost)
                jo.notif.rightError(_source, "Error processing fine payment")
            end
        end)
    else
        jo.notif.rightError(_source, Language.lang_30)
    end
end)