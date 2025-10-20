if Config.framework == 'rsg-core' then
    local RSGCore = exports['rsg-core']:GetCoreObject()


    function GetCharIdentifier(targetID)
        targetID = tonumber(targetID)
        return RSGCore.Functions.GetPlayer(targetID).PlayerData.citizenid
    end

    function GetCharFirstname(targetID)
        targetID = tonumber(targetID)
        return RSGCore.Functions.GetPlayer(targetID).PlayerData.charinfo.firstname
    end

    function GetCharLastname(targetID)
        targetID = tonumber(targetID)
        return RSGCore.Functions.GetPlayer(targetID).PlayerData.charinfo.lastname
    end

    local plyChars = {}
    RegisterServerEvent("murphy_creator:getCharacters", function()
        local _source = source
        local license = RSGCore.Functions.GetIdentifier(source, 'license')
        local permissions = RSGCore.Functions.GetPermission(source)
        for key, value in pairs(permissions) do
            if value == false then
                permissions[key] = nil
            end
        end
        PutPlayerinInstance(_source)
        plyChars = {}
        local totalQueries = 0
        MySQL.Async.fetchAll('SELECT * FROM players WHERE license = @license', { ['@license'] = license },
            function(result)
                for i = 1, (#result), 1 do
                    totalQueries = totalQueries + 2
                    result[i].charinfo = json.decode(result[i].charinfo)
                    result[i].money = json.decode(result[i].money)
                    result[i].job = json.decode(result[i].job)
                    -- result[i].citizenid
                    MySQL.Async.fetchAll('SELECT * FROM playerskins WHERE citizenid = ?', { result[i].citizenid },
                        function(data)
                            if data ~= nil and #data > 0 then
                                local skinData = json.decode(data[1].skin)
                                local clothesData = json.decode(data[1].clothes)
                                result[i].skin = skinData
                                result[i].clothes = clothesData
                            else
                                result[i].skin = {}
                                result[i].clothes = {}
                            end
                            totalQueries = totalQueries - 1
                            MySQL.Async.fetchAll('SELECT * FROM murphy_creator WHERE `charid`=@charid;',
                                { charid = result[i].citizenid },
                                function(data)
                                    if data[1] ~= nil then
                                        result[i].informations = json.decode(data[1].informations)
                                        result[i].peddata = json.decode(data[1].peddata)
                                    else
                                        result[i].peddata = {}
                                        result[i].informations = {
                                            lore = "",
                                            birthday = "",
                                            birthmonth =
                                            "",
                                            birthyear = ""
                                        }
                                    end
                                    plyChars[#plyChars + 1] = result[i]
                                    totalQueries = totalQueries - 1
                                end)
                        end)
                end
            end)
        repeat
            Wait(100)
        until totalQueries == 0
        Wait(1000) -- Wait for all queries to finish
        local slots = Slots.default
        local pedperm = PedPermission.default
        print("Permissions: " .. json.encode(permissions))
        for i, v in pairs(permissions) do
            if Slots.role[i] ~= nil then
                if slots < Slots.role[i] then
                    slots = Slots.role[i]
                end
            end
            if PedPermission.role[i] ~= nil then
                if pedperm == false and PedPermission.role[i] == true then
                    pedperm = PedPermission.role[i]
                end
            end
        end

        if Slots.identifier[license] ~= nil then
            slots = Slots.identifier[license]
        end
        if slots == nil then
            slots = Slots.default
        end

        if PedPermission.identifier[license] ~= nil then
            pedperm = PedPermission.identifier[license]
        end
        if pedperm == nil then
            pedperm = PedPermission.default
        end

        TriggerClientEvent('murphy_creator:LaunchCharSelect', _source, plyChars, pedperm, slots)
    end)

    RSGCore.Commands.Add("logout", "Logout of Character (Admin Only)", {}, false, function(source)
        RSGCore.Player.Logout(source)
        TriggerClientEvent('RSG:logout',source)
    end, 'admin')
    
    -- RegisterServerEvent("murphy_creator:deleteCharacter", function(charid)
    --     local _source = source
    --     local _charid = plyChars[charid].citizenid
    --     MySQL.update('DELETE FROM playerskins WHERE citizenid = ?', { _charid })
    --     RSGCore.Player.DeleteCharacter(source, _charid)
    --     local function deleteIfTableExists(tableName, charid)
    --         MySQL.query('SELECT COUNT(*) as count FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = @tableName;',
    --             {
    --                 ['@tableName'] = tableName
    --             }, function(result)
    --                 if result[1] and result[1].count > 0 then
    --                     MySQL.query('DELETE FROM ' .. tableName .. ' WHERE charid = @charid;',
    --                         { ['@charid'] = charid })
    --                 else

    --                 end
    --             end)
    --     end
    --     deleteIfTableExists('murphy_creator', _charid)
    --     deleteIfTableExists('murphy_barber', _charid)
    --     deleteIfTableExists('murphy_barber_preset', _charid)
    --     deleteIfTableExists('murphy_clothes', _charid)
    --     deleteIfTableExists('murphy_outfits', _charid)
    --     deleteIfTableExists('murphy_wearable', _charid)

    --     Wait(5000)
    --     TriggerClientEvent('murphy_creator:OpenCharSelect', _source)
    -- end)
    RegisterServerEvent("murphy_creator:deleteCharacter", function(charid)
    local _source = source
    local _charid = plyChars[charid].citizenid
    local _identifier = plyChars[charid].license -- Get the player's identifier/license
    local _cid = plyChars[charid].cid
    -- Delete player skins
    MySQL.update('DELETE FROM playerskins WHERE citizenid = ?', { _charid })
    
    -- Delete character from RSGCore
    RSGCore.Player.DeleteCharacter(source, _charid)
    
    -- Function to delete from tables that use 'charid' column
    local function deleteIfTableExists(tableName, charid)
        MySQL.query('SELECT COUNT(*) as count FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = @tableName;',
            {
                ['@tableName'] = tableName
            }, function(result)
                if result[1] and result[1].count > 0 then
                    print("Deleting from " .. tableName .. " with charid: " .. charid)
                    MySQL.query('DELETE FROM ' .. tableName .. ' WHERE charid = @charid;',
                        { ['@charid'] = charid }, function(deleteResult)
                            if deleteResult then
                                print("Successfully deleted from " .. tableName .. ". Affected rows: " .. (deleteResult.affectedRows or 0))
                            end
                        end)
                else
                    print("Table " .. tableName .. " doesn't exist, skipping deletion")
                end
            end)
    end
    
    -- Delete from murphy tables (these use charid)
    deleteIfTableExists('murphy_creator', _charid)
    deleteIfTableExists('murphy_barber', _charid)
    deleteIfTableExists('murphy_barber_preset', _charid)
    deleteIfTableExists('murphy_clothes', _charid)
    deleteIfTableExists('murphy_outfits', _charid)
    deleteIfTableExists('murphy_wearable', _charid)
    
    -- Delete horses using identifier (not charid)
    MySQL.query('SELECT COUNT(*) as count FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = "sirevlc_horses";', {}, function(result)
        if result[1] and result[1].count > 0 then
            print("Deleting horses for charid: " .. _cid)
            MySQL.query('DELETE FROM sirevlc_horses WHERE charid = ?', { _cid }, function(deleteResult)
                if deleteResult then
                    print("Successfully deleted horses. Affected rows: " .. (deleteResult.affectedRows or 0))
                end
            end)
        else
            print("sirevlc_horses table doesn't exist")
        end
    end)

    -- Delete wagons using identifier (not charid)
    MySQL.query('SELECT COUNT(*) as count FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = "sirevlc_wagons";', {}, function(result)
        if result[1] and result[1].count > 0 then
            print("Deleting wagons for charid: " .. _cid )
            MySQL.query('DELETE FROM sirevlc_wagons WHERE charid = ?', {  _cid }, function(deleteResult)
                if deleteResult then
                    print("Successfully deleted wagons. Affected rows: " .. (deleteResult.affectedRows or 0))
                end
            end)
        else
            print("sirevlc_wagons table doesn't exist")
        end
    end)

    -- Delete boats using identifier (not charid)
    MySQL.query('SELECT COUNT(*) as count FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = "sirevlc_boats";', {}, function(result)
        if result[1] and result[1].count > 0 then
            print("Deleting boats for identifier: " ..  _cid)
            MySQL.query('DELETE FROM sirevlc_boats WHERE charid = ?', {  _cid }, function(deleteResult)
                if deleteResult then
                    print("Successfully deleted boats. Affected rows: " .. (deleteResult.affectedRows or 0))
                end
            end)
        else
            print("sirevlc_boats table doesn't exist")
        end
    end)

    Wait(5000)
    TriggerClientEvent('murphy_creator:OpenCharSelect', _source)
end)


function GenerateUniqueCID()
    local isUnique = false
    local cid = nil

    while not isUnique do
        cid = math.random(1000, 99999)
        local result = MySQL.Sync.fetchAll('SELECT cid FROM players WHERE cid = ?', {cid})
        if #result == 0 then
            isUnique = true
        end
    end

    return cid
end

    function CreateNewCharacter(src, data)
        local source = src
        local license = RSGCore.Functions.GetIdentifier(source, 'license')

        local gender = data.gender == 'Male' and 0 or 1
        local cid = GenerateUniqueCID()

        local newData = {
            firstname = data.firstname,
            lastname = data.lastname,
            nationality = data.SpawnLocationName,
            gender = gender,
            birthdate = data.birthyear .. '-' .. data.birthmonth .. '-' .. data.birthday,
            cid = cid
        }

        TriggerClientEvent("murphy_creator:createnewchar", source, newData)
        RemovePlayerFromInstance(source)
        Wait(2000)

        local charid = GetCharIdentifier(source)
        MySQL.Async.insert('INSERT INTO playerskins (citizenid, skin, clothes) VALUES (?, ?, ?);',
            { charid, json.encode({ sex = gender }), json.encode({}) }, function(rowsChanged)
        end)
    end
end