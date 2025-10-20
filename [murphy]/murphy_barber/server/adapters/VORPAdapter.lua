if Config.framework == 'vorp' then
    VorpInv = exports.vorp_inventory:vorp_inventoryApi()

    local VorpCore = {}

    TriggerEvent("getCore", function(core)
        VorpCore = core
    end)


    function GetCharJob(targetID)
        local user = VorpCore.getUser(targetID)
        if user then
            job = VorpCore.getUser(targetID).getUsedCharacter.job
        else
            job = nil
        end
        return job
    end

    function GetCharJobGrade(targetID)
        local user = VorpCore.getUser(targetID)
        if user then
            job = VorpCore.getUser(targetID).getUsedCharacter.jobGrade
        else
            job = nil
        end
        return job
    end

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

    function GetCharMoney(targetID)
        return VorpCore.getUser(targetID).getUsedCharacter.money
    end

    function RemoveCurrency(targetID, amount)
        VorpCore.getUser(targetID).getUsedCharacter.removeCurrency(0, amount)
    end

    function GetCharGroup(targetID)
        return VorpCore.getUser(targetID).getUsedCharacter.group
    end

    function GiveItem(src, item, amount, meta)
        local _meta = meta
        local result = VorpInv.addItem(src, item, amount, _meta)
        return result
    end

    function RemoveItem(src, item, amount, meta)
        local _meta = meta
        local result = VorpInv.subItem(src, item, amount, _meta)
        return result
    end

    function GetItemAmount(src, item)
        local ItemData = VorpInv.getItemCount(src, item)
        return ItemData
    end

    VorpInv.RegisterUsableItem(Config.OverlayItem, function(_data)
        local data = _data
        local _source = data.source
        local outfit_id = data.item.metadata.presetid
        TriggerClientEvent("murphy_barber:makeupitem", _source, outfit_id)
    end)

    Callback.register('murphy_barber:GetCharSkinTone', function(source, male, characterid)
        if Config.murphy_creator == false then
            local _source = source
            local albedo = nil
            local charid = tonumber(GetCharIdentifier(_source))
            MySQL.query("SELECT * FROM characters WHERE `charidentifier`=@charidentifier;", { charidentifier = charid },
                function(skins)
                    if skins[1] then
                        local skin = skins[1].skinPlayer
                        local decoded = json.decode(skin)
                        local data = {
                            albedo = decoded.albedo,
                            bodies_upper = decoded.BodyType,
                            bodies_lower = decoded
                                .LegsType
                        }
                        albedo = data.albedo
                    end
                end)
            repeat
                Wait(0)
            until albedo ~= nil
            if albedo == 0 then
                if male then
                    albedo = GetHashKey("mp_head_mr1_sc08_c0_000_ab")
                else
                    albedo = GetHashKey("mp_head_fr1_sc08_c0_000_ab")
                end
            end
            return albedo
        else
            local _source = source
            local albedo = nil
            local charid = characterid or GetCharIdentifier(_source)
            print (charid, GetCharIdentifier(_source))
            MySQL.query("SELECT * FROM murphy_creator WHERE `charid`=@charid;", { charid = charid }, function(skins)
                if skins[1] then
                    local pedata = skins[1].peddata
                    local decoded = json.decode(pedata)
                    local albedoindex = decoded.skintone
                    local gender = "Female"
                    if male then gender = "Male" end
                    albedo = GetHashKey(DefaultChar[gender][albedoindex].HeadTexture[1])
                else
                    MySQL.query("SELECT * FROM characters WHERE `charidentifier`=@charidentifier;",
                        { charidentifier = charid },
                        function(skins)
                            if skins[1] then
                                local skin = skins[1].skinPlayer
                                local decoded = json.decode(skin)
                                local data = {
                                    albedo = decoded.albedo,
                                    bodies_upper = decoded.BodyType,
                                    bodies_lower = decoded
                                        .LegsType
                                }
                                albedo = data.albedo
                            end
                        end)
                end
            end)
            repeat
                Wait(0)
            until albedo ~= nil
            if albedo == 0 then
                if male then
                    albedo = GetHashKey("mp_head_mr1_sc08_c0_000_ab")
                else
                    albedo = GetHashKey("mp_head_fr1_sc08_c0_000_ab")
                end
            end
            return albedo
        end
    end)

    RegisterNetEvent("vorpcharacter:reloadedskinlistener", function()
        local src = source
        TriggerClientEvent("murphy_barber:loadbarberoverlay", src)
    end)
end
