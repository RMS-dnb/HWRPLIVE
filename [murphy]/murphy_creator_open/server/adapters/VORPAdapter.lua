if Config.framework == 'vorp' then
    VorpInv = exports.vorp_inventory:vorp_inventoryApi()

    local VorpCore = {}

    TriggerEvent("getCore", function(core)
        VorpCore = core
    end)


    function GetCharIdentifier(targetID)
        local user = VorpCore.getUser(targetID)
        if user then
            charid = VorpCore.getUser(targetID).getUsedCharacter.charIdentifier
        else
            charid = nil
        end
        return charid
    end

    function GetCharFirstname(targetID)
        return VorpCore.getUser(targetID).getUsedCharacter.firstname
    end

    function GetCharLastname(targetID)
        return VorpCore.getUser(targetID).getUsedCharacter.lastname
    end

    function GetCharGroup(targetID)
        return VorpCore.getUser(targetID).getUsedCharacter.group
    end

    function CreateNewCharacter(src, data)
        local _source = src
        local Playerdata = {}
        local function GetNewCompOldStructure(comps)
            local NewComps = {}
            for key, value in pairs(comps) do
                NewComps[key] = value.comp
            end
            return NewComps
        end
        
        
        local PlayerTrackingData = {}
        PlayerTrackingData.Gunbelt ={}
        if data.gender == "Male" then
            PlayerClothing.Gunbelt = { comp = 795591403, tint0 = 0, tint1 = 0, tint2 = 0, palette = 0 }
            PlayerTrackingData.Gunbelt[795591403] = { tint0 = 0, tint1 = 0, tint2 = 0, palette = 0 }
        else
            PlayerClothing.Gunbelt = { comp = 1511461630, tint0 = 0, tint1 = 0, tint2 = 0, palette = 0 }
            PlayerTrackingData.Gunbelt[1511461630] = { tint0 = 0, tint1 = 0, tint2 = 0, palette = 0 }
        end
        local NewTable = GetNewCompOldStructure(PlayerClothing)
        PlayerSkin.albedo = GetHashKey(DefaultChar[data.gender][data.skintone].HeadTexture[1])
        PlayerSkin.BodyType = data.body
        PlayerSkin.LegsType = data.legs
        Playerdata.skin = json.encode(PlayerSkin)
        Playerdata.comps = json.encode(NewTable)
        Playerdata.compTints = json.encode(PlayerTrackingData)
        Playerdata.gender = data.gender
        Playerdata.age = 30
        Playerdata.nickname = "none"
        Playerdata.charDescription = data.lore
        Playerdata.desc = data.lore
        Playerdata.firstname = data.firstname
        Playerdata.lastname = data.lastname
        -- TriggerServerEvent("vorpcharacter:saveCharacter", Playerdata)
        VorpCore.getUser(_source).addCharacter(Playerdata)
        TriggerClientEvent("vorp:initCharacter", _source, data.pedspawn, data.pedspawnheading, false)
        RemovePlayerFromInstance(_source)
        Citizen.SetTimeout(3000, function()
            TriggerEvent("vorp_NewCharacter", _source)
        end)
    end

    RegisterNetEvent("vorpcharacter:reloadedskinlistener", function()
        local src = source
        Wait(1500)
        TriggerClientEvent("murphy_creator:loadskin", src)

    end)

    RegisterServerEvent("murphy_creator:deleteCharacter", function(_charid)
        local _source = source
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
        deleteIfTableExists('murphy_creator', _charid)
        deleteIfTableExists('murphy_barber', _charid)
        deleteIfTableExists('murphy_barber_preset', _charid)
        deleteIfTableExists('murphy_clothes', _charid)
        deleteIfTableExists('murphy_outfits', _charid)
        deleteIfTableExists('murphy_wearable', _charid)
        TriggerClientEvent("murphy_creator:deleteCharacterClient", _source, _charid)
        Wait(2000)
        TriggerClientEvent('murphy_creator:OpenCharSelect', _source)
    end)

    RegisterServerEvent("murphy_creator:getCharacters")
    AddEventHandler("murphy_creator:getCharacters", function()
        local _source = source
        print("VORP: GetCharacters triggered by murphy_creator", source)
        if _source == nil then
            return
        end
        PutPlayerinInstance(_source)
        local User = VorpCore.getUser(_source)
        local perm = User.getGroup
        local id
        local identifierUsed = 'steam'
        for k, v in ipairs(GetPlayerIdentifiers(_source)) do
            if string.sub(v, 1, string.len(identifierUsed .. ":")) == (identifierUsed .. ":") then
                id = v
                break
            end
        end
        local UserCharacters = GetPlayerData(_source)
        MySQL.query('SELECT * FROM characters WHERE `identifier`=@identifier;', { identifier = id }, function(result)
            local totalQueries = 0
            for k, v in pairs(result) do
                totalQueries = totalQueries + 1
                MySQL.query('SELECT * FROM murphy_creator WHERE `charid`=@charid;', { charid = v.charidentifier },
                    function(data)
                        if UserCharacters then
                            if data[1] ~= nil then
                                UserCharacters[v.charidentifier].informations = json.decode(data[1].informations)
                                UserCharacters[v.charidentifier].peddata = json.decode(data[1].peddata)
                            else
                                UserCharacters[v.charidentifier].peddata = {}
                                UserCharacters[v.charidentifier].informations = {
                                    lore = "",
                                    birthday = "",
                                    birthmonth =
                                    "",
                                    birthyear = ""
                                }
                            end
                        end
                        totalQueries = totalQueries - 1
                    end)
            end
            repeat
                Wait(100)
            until totalQueries == 0
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

            TriggerClientEvent('murphy_creator:LaunchCharSelect', _source, UserCharacters, pedperm,
                slots)
        end)
    end)



    function Checkmissingkeys(data, key)
        local switch = false
        if key == "skin" then
            for k, v in pairs(PlayerSkin) do
                if data[k] == nil then
                    switch = true
                    data[k] = v
                end
                if data.Eyes == 0 then
                    switch = true
                    if data.sex == "mp_male" then
                        data.Eyes = 612262189
                    else
                        data.Eyes = 928002221
                    end
                end
            end
            return data, switch
        end
        if key == "comps" then
            for k, v in pairs(PlayerClothing) do
                if data[k] == nil then
                    data[k] = v.comp
                end
            end
            return data, switch
        end
    end

    function ConvertTable(comps, compTints)
        local NewComps = {}

        for k, comp in pairs(comps) do
            NewComps[k] = { comp = comp, tint0 = 0, tint1 = 0, tint2 = 0, palette = 0 }

            if compTints and compTints[k] and compTints[k][tostring(comp)] then
                local compTint = compTints[k][tostring(comp)]
                NewComps[k].tint0 = compTint.tint0 or 0
                NewComps[k].tint1 = compTint.tint1 or 0
                NewComps[k].tint2 = compTint.tint2 or 0
                NewComps[k].palette = compTint.palette or 0
            end
        end

        return NewComps
    end

    function UpdateDatabase(character)
        local json_skin = json.decode(character.skin)
        local json_comps = json.decode(character.comps)
        local compTints = json.decode(character.compTints)
        local skin, updateSkin = Checkmissingkeys(json_skin, "skin")
        local comps, updateComp = Checkmissingkeys(json_comps, "comps")

        if updateSkin then
            character.updateSkin((json.encode(skin)))
        end

        if updateComp then
            character.updateComps(json.encode(comps))
        end

        local NewComps = ConvertTable(comps, compTints)

        return skin, NewComps
    end

    function GetPlayerData(source)
        local User = VorpCore.getUser(source)

        if not User then
            return false
        end
        local Characters = User.getUserCharacters


        local userCharacters = {}
        for _, characters in pairs(Characters) do
            local skin, comps = UpdateDatabase(characters)
            local userChars = {
                charIdentifier = characters.charIdentifier,
                money = characters.money,
                gold = characters.gold,
                firstname = characters.firstname,
                lastname = characters.lastname,
                skin = skin,
                components = comps,
                coords = json.decode(characters.coords),
                isDead = characters.isdead,
                job = characters.jobLabel or "Unemployed",
                grade = characters.jobGrade or "",
                group = characters.group or "",
                age = characters.age or "",
                nickname = characters.nickname or "",
                gender = characters.gender or "",
                charDesc = characters.charDescription or "",
            }
            userCharacters[characters.charIdentifier] = userChars
        end
        return userCharacters
    end

    PlayerSkin = {
        ShouldersS                           = 0.0,
        ShouldersT                           = 0.0,
        ShouldersM                           = 0.0,
        ArmsS                                = 0.0,
        LegsS                                = 0.0,
        CalvesS                              = 0.0,
        ChestS                               = 0.0,
        WaistW                               = 0.0,
        HipsS                                = 0.0,
        FaceW                                = 0.0,
        FaceD                                = 0.0,
        FaceS                                = 0.0,
        NeckW                                = 0.0,
        NeckD                                = 0.0,
        MouthCLW                             = 0.0,
        MouthCRW                             = 0.0,
        MouthCLD                             = 0.0,
        MouthCRD                             = 0.0,
        MouthCLH                             = 0.0,
        MouthCRH                             = 0.0,
        MouthCLLD                            = 0.0,
        MouthCRLD                            = 0.0,
        EyeLidL                              = 0.0,
        EyeLidR                              = 0.0,
        sex                                  = "mp_male",
        albedo                               = 0,
        HeadType                             = 0,
        BodyType                             = 0,
        LegsType                             = 0,
        Torso                                = 0,
        HeadSize                             = 0.0,
        EyeBrowH                             = 0.0,
        EyeBrowW                             = 0.0,
        EyeBrowD                             = 0.0,
        EarsH                                = 0.0,
        EarsW                                = 0.0,
        EarsD                                = 0.0,
        EarsA                                = 0.0,
        EyeLidH                              = 0.0,
        EyeLidW                              = 0.0,
        EyeD                                 = 0.0,
        EyeAng                               = 0.0,
        EyeDis                               = 0.0,
        EyeH                                 = 0.0,
        NoseW                                = 0.0,
        NoseS                                = 0.0,
        NoseH                                = 0.0,
        NoseAng                              = 0.0,
        NoseC                                = 0.0,
        NoseDis                              = 0.0,
        CheekBonesH                          = 0.0,
        CheekBonesW                          = 0.0,
        CheekBonesD                          = 0.0,
        MouthW                               = 0.0,
        MouthD                               = 0.0,
        MouthX                               = 0.0,
        MouthY                               = 0.0,
        ULiphH                               = 0.0,
        ULiphW                               = 0.0,
        ULiphD                               = 0.0,
        LLiphH                               = 0.0,
        LLiphW                               = 0.0,
        LLiphD                               = 0.0,
        JawH                                 = 0.0,
        JawW                                 = 0.0,
        JawD                                 = 0.0,
        ChinH                                = 0.0,
        ChinW                                = 0.0,
        ChinD                                = 0.0,
        Beard                                = 0,
        Hair                                 = 0,
        Body                                 = 0,
        Waist                                = 0,
        Eyes                                 = 0,
        Scale                                = 0.0,
        eyebrows_visibility                  = 0,
        eyebrows_tx_id                       = 0,
        eyebrows_opacity                     = 0.0,
        eyebrows_color                       = 0,
        scars_visibility                     = 0,
        scars_tx_id                          = 0,
        scars_opacity                        = 0,
        spots_visibility                     = 0,
        spots_tx_id                          = 0,
        spots_opacity                        = 0,
        disc_visibility                      = 0,
        disc_tx_id                           = 0,
        disc_opacity                         = 0,
        complex_visibility                   = 0,
        complex_tx_id                        = 0,
        complex_opacity                      = 0,
        acne_visibility                      = 0,
        acne_tx_id                           = 0,
        acne_opacity                         = 0,
        ageing_visibility                    = 0,
        ageing_tx_id                         = 0,
        ageing_opacity                       = 0,
        freckles_visibility                  = 0,
        freckles_tx_id                       = 0,
        freckles_opacity                     = 0,
        moles_visibility                     = 0,
        moles_tx_id                          = 0,
        moles_opacity                        = 0,
        grime_visibility                     = 0,
        grime_tx_id                          = 0,
        grime_opacity                        = 0,
        lipsticks_visibility                 = 0,
        lipsticks_tx_id                      = 0,
        lipsticks_palette_id                 = 0,
        lipsticks_palette_color_primary      = 0,
        lipsticks_palette_color_secondary    = 0,
        lipsticks_palette_color_tertiary     = 0,
        lipsticks_opacity                    = 0,
        shadows_visibility                   = 0,
        shadows_tx_id                        = 0,
        shadows_palette_id                   = 0,
        shadows_palette_color_primary        = 0,
        shadows_palette_color_secondary      = 0,
        shadows_palette_color_tertiary       = 0,
        shadows_opacity                      = 0,
        beardstabble_tx_id                   = 0,
        beardstabble_visibility              = 0,
        beardstabble_color_primary           = 0,
        beardstabble_opacity                 = 0,
        eyeliner_tx_id                       = 0,
        eyeliner_visibility                  = 0,
        eyeliner_color_primary               = 0,
        eyeliner_opacity                     = 0,
        eyeliner_palette_id                  = 0,
        blush_visibility                     = 0,
        blush_tx_id                          = 0,
        blush_palette_id                     = 0,
        blush_palette_color_primary          = 0,
        blush_opacity                        = 0,
        hair_tx_id                           = 0,
        hair_visibility                      = 0,
        hair_color_primary                   = 0,
        hair_opacity                         = 0,
        foundation_tx_id                     = 0,
        foundation_visibility                = 0,
        foundation_palette_id                = 0,
        foundation_palette_color_primary     = 0,
        foundation_palette_color_secondary   = 0,
        foundation_palette_color_tertiary    = 0,
        foundation_opacity                   = 0,
        paintedmasks_tx_id                   = 0,
        paintedmasks_visibility              = 0,
        paintedmasks_palette_id              = 0,
        paintedmasks_palette_color_primary   = 0,
        paintedmasks_palette_color_secondary = 0,
        paintedmasks_palette_color_tertiary  = 0,
        paintedmasks_opacity                 = 0,

    }

    PlayerClothing = {
        Poncho      = { comp = -1 },
        Glove       = { comp = -1 },
        RingRh      = { comp = -1 },
        Gauntlets   = { comp = -1 },
        Spats       = { comp = -1 },
        GunbeltAccs = { comp = -1 },
        NeckTies    = { comp = -1 },
        bow         = { comp = -1 },
        RingLh      = { comp = -1 },
        Loadouts    = { comp = -1 },
        Boots       = { comp = -1 },
        Suspender   = { comp = -1 },
        NeckWear    = { comp = -1 },
        Holster     = { comp = -1 },
        CoatClosed  = { comp = -1 },
        EyeWear     = { comp = -1 },
        Shirt       = { comp = -1 },
        Gunbelt     = { comp = -1 },
        Hat         = { comp = -1 },
        Spurs       = { comp = -1 },
        Cloak       = { comp = -1 },
        Vest        = { comp = -1 },
        Belt        = { comp = -1 },
        Pant        = { comp = -1 },
        Skirt       = { comp = -1 },
        Coat        = { comp = -1 },
        Mask        = { comp = -1 },
        Accessories = { comp = -1 },
        Buckle      = { comp = -1 },
        Bracelet    = { comp = -1 },
        Satchels    = { comp = -1 },
        Dress       = { comp = -1 },
        Badge       = { comp = -1 },
        Armor       = { comp = -1 },
        Teeth       = { comp = -1 },
        Chap        = { comp = -1 },
    }
end
