Callback.register('murphy_creator:GetCharInformations', function(source)
    local _source = source
    local charid = GetCharIdentifier(_source)
    local informations = nil
    MySQL.query('SELECT informations FROM murphy_creator WHERE charid = @charid;', {
        ['@charid'] = charid
    }, function(result)
        if result[1] then
            informations = json.decode(result[1].informations)
        else
            informations = {}
        end
    end)
    repeat
        Wait(100)
    until informations ~= nil
    return informations
end)

Callback.register('murphy_creator:CreateNewCharacter', function(source, data, peddata, barberdata)
    local _source = source
    local updated = nil
    CreateNewCharacter(_source, data)
    Wait(5000)
    local charid = GetCharIdentifier(_source)
    print ("Creating new character with ID: " .. charid)
    TriggerClientEvent("murphy_clothing:SaveClothesCreator", _source)
    MySQL.update(
        'INSERT INTO murphy_creator (`charid`, `peddata`, `informations`) VALUES (@charid, @peddata, @informations);', {
            charid = charid,
            peddata = json.encode(peddata),
            informations = json.encode(data)
        }, function(result)
            if result then
                updated = true
            else
                updated = false
            end
        end)
    repeat
        Wait(0)
    until updated ~= nil
    return updated
end)

Callback.register('murphy_creator:GetPedData', function(source, characterid)
    local _source = source
    local charid = characterid or GetCharIdentifier(_source)
    local peddata = nil
    MySQL.query('SELECT peddata FROM murphy_creator WHERE charid = @charid;', {
        ['@charid'] = charid
    }, function(result)
        if result[1] then
            peddata = json.decode(result[1].peddata)
        else
            peddata = {}
        end
    end)
    repeat
        Wait(0)
    until peddata ~= nil
    return peddata
end)


Callback.register('murphy_creator:SavePreset', function(source, table, overlays, name, fee, male)
    local gender = "female"
    if male then gender = "male" end
    local _source = source
    local hairstyle = table
    local numBase0 = math.random(100, 999)
    local numBase1 = math.random(0, 999)
    local _Name = name
    local outfit_id = string.format("%03d%04d", numBase0, numBase1)
    local charid = GetCharIdentifier(_source)
    local encode = json.encode(hairstyle)
    local price = fee or 0
        encode = json.encode(hairstyle)
        local meta = {}
        local makeup = {}
        local permanentoverlay = {}
        for k, v in pairs (overlays) do
            permanentoverlay[v.name] = v
        end
        local cancontinue = false
        if next(permanentoverlay) ~= nil then
            local encoded = json.encode(permanentoverlay)
            TriggerEvent("murphy_creator:retrievehairstyle", charid, function(call)
                if call then
                    MySQL.update("UPDATE murphy_barber SET permanentoverlay = @permanentoverlay, outfit_id = @outfit_id, overlays = @overlays WHERE charid = @charid", {
                        overlays = json.encode(makeup),
                        outfit_id = outfit_id,
                        permanentoverlay = encoded,
                        charid = charid
                    }, function(done)
                        cancontinue = true
                    end)
                else
                    MySQL.update("INSERT INTO murphy_barber (charid, permanentoverlay, overlays,outfit_id) VALUES (@charid, @permanentoverlay, @overlays, outfit_id)", {
                        charid = charid,
                        overlays = json.encode(makeup),
                        permanentoverlay = encoded,
                        outfit_id = outfit_id,

                    }, function(rowsChanged)
                        cancontinue = true
                    end)

                end
            end)
        else cancontinue = true end
        repeat
            Wait(0)
        until cancontinue == true
        if _Name and next(hairstyle) ~= nil then

            MySQL.update(
                'INSERT INTO murphy_barber_preset (`charid`, `hairstyle`, `overlays`, `name`, `outfit_id`, `price`, `gender`) VALUES (@charid, @hairstyle, @overlays, @name, @outfit_id, @price, @gender);',
                {
                    charid = charid,
                    hairstyle = encode,
                    overlays = json.encode(makeup),
                    name = _Name,
                    outfit_id = outfit_id,
                    price = price,
                    gender = gender


                }, function(rowsChanged)
                end)
        end
        TriggerEvent("murphy_creator:retrievehairstyle", charid, function(call)
            local encodedhairstyle = json.encode(hairstyle)
            if call then
                MySQL.update("UPDATE murphy_barber SET hairstyle = @hairstyle, overlays = @overlays, permanentoverlay = @permanentoverlay, outfit_id = @outfit_id WHERE charid = @charid", {
                    hairstyle = encodedhairstyle,
                    overlays = json.encode(makeup),
                    permanentoverlay = json.encode(permanentoverlay),
                    outfit_id = outfit_id,
                    charid = charid
                }, function(done)
                end)
            else
                MySQL.update("INSERT INTO murphy_barber (charid, hairstyle, overlays, permanentoverlay, outfit_id) VALUES (@charid, @hairstyle,@overlays, @permanentoverlay, @outfit_id)", {
                    charid = charid,
                    hairstyle = encodedhairstyle,
                    overlays = json.encode(makeup),
                    permanentoverlay = json.encode(permanentoverlay),
                    outfit_id = outfit_id
                }, function(rowsChanged)
                end)
            end
        end)
    return true, outfit_id
end)

AddEventHandler('murphy_creator:retrievehairstyle', function(charid, callback)
    local Callback = callback
    local id = charid
    MySQL.query('SELECT * FROM murphy_barber WHERE `charid`=@charid;', {
        charid = id
    }, function(hairstyle)
        if hairstyle[1] then
            Callback(hairstyle[1])
        else
            Callback(false)
        end
    end)
end)