if Config.framework == "REDEMRP2k23" then
    Inventory = {}
    local RedEM = exports["redem_roleplay"]:RedEM()
    local identifierUsed = 'steam'
    TriggerEvent("redemrp_inventory:getData", function(data)
        Inventory = data
    end)

    function GetCharIdentifier(targetID)
        return RedEM.GetPlayer(targetID).citizenid
    end

    function GetCharFirstname(targetID)
        return RedEM.GetPlayer(targetID).firstname
    end

    function GetCharLastname(targetID)
        return RedEM.GetPlayer(targetID).lastname
    end

    RegisterServerEvent("murphy_creator:getCharacters", function()
        local _source = source
        local id
        print ("^2[DB]^0 Getting characters for ^2" .. _source .. "^0")
        for k, v in ipairs(GetPlayerIdentifiers(_source)) do
            if string.sub(v, 1, string.len(identifierUsed .. ":")) == (identifierUsed .. ":") then
                id = v
                break
            end
        end
        PutPlayerinInstance(_source)

        MySQL.query('SELECT * FROM characters WHERE `identifier`=@identifier;', { identifier = id }, function(result)
            local totalQueries = 0
            for k, v in pairs(result) do
                totalQueries = totalQueries + 1
                MySQL.query('SELECT * FROM murphy_creator WHERE `charid`=@charid;', { charid = v.citizenid },
                    function(data)
                        if data[1] ~= nil then
                            result[k].informations = json.decode(data[1].informations)
                            result[k].peddata = json.decode(data[1].peddata)
                        else
                            result[k].peddata = {}
                            result[k].informations = { lore = "", birthday = "", birthmonth = "", birthyear = "" }
                        end
                        totalQueries = totalQueries - 1
                    end)
            end
            repeat
                Wait(100)
            until totalQueries == 0
            MySQL.query('SELECT * FROM skins WHERE `identifier`=@identifier;', { identifier = id }, function(result2)
                MySQL.query('SELECT * FROM clothes WHERE `identifier`=@identifier;', { identifier = id },
                    function(result3)
                        local result4 = MySQL.query.await('SELECT * FROM permissions WHERE identifier = ?', { id })
                        if result4[1] ~= nil then
                            perm = result4[1].permissiongroup
                        else
                            perm = nil
                        end
                        local slots = nil
                        local pedperm = nil
                        if Slots.role[perm] ~= nil then
                            slots = Slots.role[perm]
                        end
                        if Slots.identifier[id] ~= nil then
                            slots = Slots.identifier[id]
                        end
                        if slots == nil then
                            slots = Slots.default
                        end

                        if PedPermission.role[perm] ~= nil then
                            pedperm = PedPermission.role[perm]
                        end
                        if PedPermission.identifier[id] ~= nil then
                            pedperm = PedPermission.identifier[id]
                        end
                        if pedperm == nil then
                            pedperm = PedPermission.default
                        end

                        TriggerClientEvent('murphy_creator:LaunchCharSelect', _source, result, result2, result3, pedperm,
                            slots)
                    end)
            end)
        end)
    end)

    RegisterServerEvent("murphy_creator:deleteCharacter", function(_charid)
        local _source = source
        local id
        for k, v in ipairs(GetPlayerIdentifiers(_source)) do
            if string.sub(v, 1, string.len(identifierUsed .. ":")) == (identifierUsed .. ":") then
                id = v
                break
            end
        end
        local timeout = 0
        while id == nil and timeout < 10 do
            Wait(100); timeout = timeout + 1
        end
        MySQL.query('SELECT citizenid FROM characters WHERE identifier = @identifier AND characterid = @characterid;', {
            ['@identifier'] = id,
            ['@characterid'] = _charid
        }, function(result)
            if result[1] then
                local citizenid = result[1].citizenid

                local function deleteIfTableExists(tableName, charid)
                    MySQL.query('SELECT COUNT(*) as count FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME = @tableName;',
                        {
                            ['@tableName'] = tableName
                        }, function(result)
                            if result[1] and result[1].count > 0 then
                                MySQL.query('DELETE FROM ' .. tableName .. ' WHERE charid = @charid;',
                                    { ['@charid'] = charid })
                            else
                            end
                        end)
                end
                deleteIfTableExists('murphy_creator', citizenid)
                deleteIfTableExists('murphy_barber', citizenid)
                deleteIfTableExists('murphy_barber_preset', citizenid)
                deleteIfTableExists('murphy_clothes', citizenid)
                deleteIfTableExists('murphy_outfits', citizenid)
                deleteIfTableExists('murphy_wearable', citizenid)
            end
        end)

        MySQL.query('DELETE FROM skins WHERE `identifier` = @identifier AND `charid`=@characterid;',
            { identifier = id, characterid = _charid })
        MySQL.query('DELETE FROM clothes WHERE `identifier` = @identifier AND `charid`=@characterid;',
            { identifier = id, characterid = _charid })
        -- MySQL.query('DELETE FROM horses WHERE `identifier` = @identifier AND `charid`=@characterid;', {identifier = id, characterid=_charid})
        MySQL.query('DELETE FROM user_inventory WHERE `identifier` = @identifier AND `charid`=@characterid;',
            { identifier = id, characterid = _charid })
        -- MySQL.query('DELETE FROM user_bills WHERE `owner` = @identifier AND `ownerCharId` = @characterid;', {identifier = id, characterid=_charid})
        MySQL.query('DELETE FROM outfits WHERE `identifier` = @identifier AND `charid` = @characterid;',
            { identifier = id, characterid = _charid })
        MySQL.query('DELETE FROM stashes WHERE `stashid` = @stashid;', { stashid = "bankstash_" .. id .. "_" .. _charid })
        MySQL.query('DELETE FROM stashes WHERE `stashid` = @stashid;',
            { stashid = "campstorage_" .. id .. "_" .. _charid })
        MySQL.query('DELETE FROM stashes WHERE `stashid` = @stashid;',
            { stashid = "campstorage_" .. id .. "_" .. _charid })
        MySQL.query('DELETE FROM characters WHERE `identifier` = @identifier AND `characterid`=@characterid;',
            { identifier = id, characterid = _charid }, function(result)
                if result then
                    TriggerClientEvent('murphy_creator:OpenCharSelect', _source)
                end
            end)
    end)


    function CreateNewCharacter(src, data)
        local _source = src
        local firstname = data.firstname
        local lastname = data.lastname
        local id = RedEM.Functions.GetIdentifier(_source, "steam")
        print("^2[DB]^0 Creating character for ^2" .. id .. "^0 with name: ^2" .. firstname .. " " .. lastname .. "^0")
        if firstname and lastname and id then
            local function CharacterExist(id)
                local test = false
                for k, v in pairs(DBData) do
                    if v.characterid == id then
                        test = true
                    end
                end
                return (test)
            end
            local identifier = id
            MySQL.query('SELECT * FROM characters WHERE `identifier`= @identifier', { identifier = identifier },
                function(users)
                    DBData = users
                    local charID = 1
                    while CharacterExist(charID) do
                        charID = charID + 1
                    end

                    local randomPOBoxNum = RedEM.Functions.CreatePOBox()
                    local citizenId = RedEM.Functions.CreateCitizenId()

                    MySQL.update(
                        'INSERT INTO characters (`identifier`, `firstname`, `lastname`, `money`, `bank`, `characterid`, `citizenid`, `pobox`, `coords`) VALUES (@identifier, @firstname, @lastname, @money, @bank, @characterid, @citizenid, @pobox, @coords);',
                        {
                            identifier = identifier,
                            firstname = firstname,
                            lastname = lastname,
                            money = RedEM.Config.StartingCash,
                            bank = RedEM.Config.StartingBank,
                            characterid = charID,
                            citizenid = citizenId,
                            pobox = randomPOBoxNum,
                            coords = json.encode({ x = data.coords.x, y = data.coords.y, z = data.coords.z })
                        }, function(rowsChanged)
                            MySQL.insert("INSERT INTO skins VALUES (NULL, ?,?,?)",
                                { identifier, charID, json.encode({ sex = 1, skin_tone = 1 }) }, function(result)
                                    RedEM.DB.LoadCharacter(_source, identifier, charID, true)
                                end)
                        end)
                end)
        end
        RemovePlayerFromInstance(_source)
    end
end
