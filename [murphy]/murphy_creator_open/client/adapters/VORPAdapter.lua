if Config.framework == 'vorp' then
    local myChars  = {}
    charselectpeds = {}
    headsonscreen  = {}
    PedAccess      = false
    PlayerInfo     = {}
    PlayerSex      = {}


    RegisterNetEvent("murphy_creator:PlaySelectedChar", function(id)
        TriggerServerEvent("murphy_creator:RemovePlayerFromInstance")
        DoScreenFadeOut(0)
        repeat Wait(0) until IsScreenFadedOut()
        Wait(1000)
        SwitchOffCam(false)
        local charIdentifier = myChars[id].charIdentifier
        local nModel = tostring(myChars[id].skin.sex)
        CachedSkin = myChars[id].skin
        CachedComponents = myChars[id].components
        print(json.encode(CachedSkin))
        print(json.encode(CachedComponents))

        TriggerServerEvent("vorp_CharSelectedCharacter", charIdentifier)
        RequestModel(nModel, false)
        repeat Wait(0) until HasModelLoaded(nModel)
        TriggerEvent("vorpcharacter:updateCache", CachedSkin, CachedComponents)
        Wait(1000)
        SetPlayerModel(PlayerId(), joaat(nModel), false)
        SetModelAsNoLongerNeeded(nModel)
        Wait(1000)
        -- LoadPlayerComponents(PlayerPedId(), CachedSkin, CachedComponents)
        ExecuteCommand("rc")
        NetworkClearClockTimeOverride()
        FreezeEntityPosition(PlayerPedId(), false)
        SetEntityVisible(PlayerPedId(), true)
        SetPlayerInvincible(PlayerId(), false)
        SetEntityCanBeDamaged(PlayerPedId(), true)
        local coords = myChars[id].coords
        local playerCoords, heading
        if next(coords) == nil then
            playerCoords = SpawnLocation[1].coords
            heading = SpawnLocation[1].heading
        else
            playerCoords = vector3(tonumber(coords.x), tonumber(coords.y), tonumber(coords.z))
            heading = coords.heading
        end

        local isDead = myChars[id].isDead
        TriggerEvent("vorp:initCharacter", playerCoords, heading, isDead) -- in here players will be removed from instance
        DisplayRadar(true)
        DisplayHud(true)
    end)

    RegisterNetEvent('murphy_creator:LaunchCharSelect', function(characters, pedperm, slots)
        headsonscreen          = {}
        charselectpeds         = {}
        myChars                = {}
        PlayerInfo             = {}
        PlayerSex              = {}
        ActiveCam              = 0
        currentCamDestionation = ""
        camCoords              = false
        baseHeading            = false
        rotatePedIndex         = 0
        PedAccess              = pedperm
        TriggerEvent("redemrp_charselect:removeLoadingScreen")
        DoScreenFadeOut(500)
        Wait(500)
        DisplayRadar(false)
        DisplayHud(false)
        SetEntityCoords(PlayerPedId(), vector3(-2785.515, -3058.224, -13.34043))
        FreezeEntityPosition(PlayerPedId(), true)
        MoveCam("charselect",
            {
                coords = DecorSettings.charselectcam.coords,
                target = DecorSettings.charselectcam.target,
                fov =
                    DecorSettings.charselectcam.fov
            }, true)
        local remainingslots = slots
        print("Remaining slots: " .. remainingslots)

        print("myChars: " .. #myChars)
        for key, value in pairs(characters) do
            myChars[#myChars + 1] = value
        end
        if #myChars < remainingslots then
            local diff = remainingslots - #myChars
            for i = 1, diff do
                table.insert(myChars, { charIdentifier = 0 })
            end
        end
        for key, value in pairs(myChars) do
            local data = DecorSettings.pedslots[remainingslots]
            if remainingslots > 0 then
                remainingslots = remainingslots - 1
            else
                break
            end
            if value.charIdentifier ~= 0 then
                PlayerInfo[key] = {
                    firstname = value.firstname,
                    lastname = value.lastname,
                    characterid = value.charIdentifier,
                    informations = value.informations,
                    charid = value.charIdentifier,
                }
                if value.skin.sex == "mp_male" then
                    PlayerSex[key] = 1
                else
                    PlayerSex[key] = 0
                end
                if value.peddata and next(value.peddata) ~= nil then
                    local peddata = value.peddata
                    local model = GetHashKey(peddata.pedmodel.model)
                    RequestModel(model)
                    while not HasModelLoaded(model) do
                        Wait(100)
                    end
                    data.PedHandler = CreatePed_2(model, 0.0, 0.0, 0.0, 0.0, false, true)
                    while not DoesEntityExist(data.PedHandler) do
                        Wait(100)
                    end
                    if peddata.pedmodel.model ~= "mp_female" and peddata.pedmodel.model ~= "mp_male" then
                        EquipMetaPedOutfitPreset(data.PedHandler, peddata.pedmodel.outfit, false)
                    end
                    charselectpeds[key] = data.PedHandler
                    SetEntityCoords(data.PedHandler, data.coords)
                    SetEntityHeading(data.PedHandler, data.heading)
                    NetworkSetEntityInvisibleToNetwork(data.PedHandler, true)
                    SetEntityAsMissionEntity(data.PedHandler, true, true)
                    Citizen.InvokeNative(0x283978A15512B2FE, data.PedHandler, true)
                    SetEntityInvincible(data.PedHandler, true)
                    SetEntityCanBeDamagedByRelationshipGroup(data.PedHandler, false, GetHashKey("PLAYER"))
                    RemoveHairsAndBeards(data.PedHandler)
                    ApplyCachePedDataToPed(data.PedHandler, peddata, value.charIdentifier)
                    print("Characters[" .. value.charIdentifier .. "] loaded")
                else
                    print("Loading character vorp: " .. value.charIdentifier)
                    LoadPlayer(value.skin.sex)
                    print("Loading character: " .. value.charIdentifier)
                    if not data then
                        return error(
                            "your config spawn locations doesnt have enough spawn locations you need to add: " ..
                            #myChars .. "Spawn locations")
                    end
                    data.PedHandler = CreatePed(joaat(value.skin.sex), data.coords, 0.0, false, false, false, false)
                    repeat Wait(0) until DoesEntityExist(data.PedHandler)
                    SetEntityHeading(data.PedHandler, data.heading)
                    LoadCharacterSelect(data.PedHandler, value.skin, value.components)
                    SetEntityInvincible(data.PedHandler, true)
                    print("Characters[" .. value.charIdentifier .. "] loaded")
                    charselectpeds[key] = data.PedHandler
                    TriggerEvent("murphy_clothes:ApplyClothesToCharid", value.charIdentifier, data.PedHandler)
                    TriggerEvent("murphy_barber:loadbarberoverlayOnCharacter", value.charIdentifier, data.PedHandler)
                    SetPedCanBeTargetted(data.PedHandler, false)
                end
            else
                print("Loading new character: " .. value.charIdentifier)
                local NPCGender = "Female"
                local genderrole = math.random(1, 2)
                if genderrole == 1 then NPCGender = "Male" end
                local model = GetHashKey("mp_female")
                if NPCGender == "Male" then
                    model = GetHashKey("mp_male")
                end
                RequestModel(model)
                while not HasModelLoaded(model) do
                    Wait(100)
                end
                data.PedHandler = CreatePed_2(model, 0.0, 0.0, 0.0, 0.0, false, true)
                while not DoesEntityExist(data.PedHandler) do
                    Wait(100)
                end

                SetEntityCoords(data.PedHandler, data.coords)
                SetEntityHeading(data.PedHandler, data.heading)
                charselectpeds[key] = data.PedHandler
                NetworkSetEntityInvisibleToNetwork(data.PedHandler, true)
                SetEntityAsMissionEntity(data.PedHandler, true, true)
                Citizen.InvokeNative(0x283978A15512B2FE, data.PedHandler, true)
                SetEntityInvincible(data.PedHandler, true)
                SetEntityCanBeDamagedByRelationshipGroup(data.PedHandler, false, GetHashKey("PLAYER"))
                EquipMetaPedOutfitPreset(data.PedHandler, 3, false)
                -- FreezeEntityPosition(ped, true)
                SetEntityAlpha(data.PedHandler, 150, false)
            end
            if data.scenario then
                TaskStartScenarioInPlace(data.PedHandler, data.scenario, -1, false)
            end
            if data.scenariopoint then
                local DataStruct = DataView.ArrayBuffer(256 * 4)
                local is_data_exists = Citizen.InvokeNative(0x345EC3B7EBDE1CB5, GetEntityCoords(data.PedHandler), 1.5,
                    DataStruct:Buffer(), 10)
                if is_data_exists ~= false then
                    for i = 1, is_data_exists, 1 do
                        local scenario = DataStruct:GetInt32(8 * i)
                        local hash = GetScenarioPointType(scenario)
                        print("Scenario Hash: " .. hash)
                        if data.scenariopoint == hash then
                            TaskUseScenarioPoint(data.PedHandler, scenario, 0, 0, false);
                        end
                    end
                end
            end
            Wait(1000)
            local headCoords = GetPedBoneCoords(data.PedHandler, 21030, 0.0, 0.0, 0.0)
            local retval, headx, heady = GetScreenCoordFromWorldCoord(headCoords.x, headCoords.y,
                headCoords.z + 0.2)
            local ExistingChar = false
            local name = "none"
            if value.charIdentifier ~= 0 then
                ExistingChar = true
                name = value.firstname .. " " .. value.lastname
            end
            table.insert(headsonscreen, {
                id = key,
                name = name,
                ExistingChar = ExistingChar,
                startPosition = {
                    x = headx,
                    y = heady
                }
            })
        end

        print("headsonscreen: " .. #headsonscreen)
        print(json.encode(headsonscreen))
        SendNUIMessage(
            {
                type = "updateElemSelectCharMenu",
                pinsSelectChar = {},
            }
        )
        DoScreenFadeIn(500)
        Wait(500)

        SetNuiFocus(true, true)
        SendNUIMessage(
            {
                type = "openSelectCharMenu",
                pinsSelectChar = headsonscreen,
            }
        )
    end)

    RegisterNetEvent("murphy_creator:deleteCharacterClient", function(charid)
        TriggerServerEvent("vorpcharacter:deleteCharacter", myChars[charid].charIdentifier)
        table.remove(myChars, charid)
    end)

    RegisterNetEvent("murphy_creator:loadskin", function()
        Callback.triggerServer("murphy_creator:GetPedData", function(peddata)
            print("Loading skin")
            local healthCore = GetAttributeCoreValue(PlayerPedId(), 0) -- Get health core value
            local stamCore = GetAttributeCoreValue(PlayerPedId(), 1)   -- Get health core value
            local health = GetEntityHealth(PlayerPedId())              -- Get health value
            local stam = GetPedStamina(PlayerPedId())                  -- Get stamina value

            Wait(1000)
            CachePedData = peddata
            local ped
            if next(CachePedData) == nil then
                --- If no data in murphy_creator, load default skin for framework
                print("No skin data in murphy_creator")
            else
                local model = CachePedData.pedmodel.model
                local outfit = CachePedData.pedmodel.outfit
                print("Loading skin: " .. model .. " : " .. outfit)
                ped = PlayerPedId()
                if model == "mp_male" or model == "mp_female" then
                    RequestModel(GetHashKey(model))
                    while not HasModelLoaded(GetHashKey(model)) do
                        Wait(1)
                    end
                    SetPlayerModel(PlayerId(), GetHashKey(model))
                    Wait(1000)
                    ped = PlayerPedId()
                    CachePed = PlayerPedId()
                    SetModelAsNoLongerNeeded(GetHashKey(model))

                    EquipMetaPedOutfitPreset(CachePed, 0, false)
                    local SkinColor   = DefaultChar[CachePedData.gender][CachePedData.skintone]
                    local legs        = tonumber("0x" .. SkinColor.Legs[CachePedData.lowerbody])
                    local bodyType    = tonumber("0x" .. SkinColor.Body[CachePedData.upperbody])
                    local heads       = tonumber("0x" .. SkinColor.Heads[CachePedData.head])
                    local headtexture = joaat(SkinColor.HeadTexture[1])
                    local albedo      = texture_types[CachePedData.gender].albedo
                    print(CachePed, "Heads:", heads, "BodyType:", bodyType, "Legs:", legs, "HeadTexture:", headtexture,
                        "Albedo:", albedo)
                    IsPedReadyToRender(CachePed)
                    ApplyShopItemToPed(heads, CachePed)
                    ApplyShopItemToPed(bodyType, CachePed)
                    ApplyShopItemToPed(legs, CachePed)
                    Citizen.InvokeNative(0xC5E7204F322E49EB, albedo, headtexture, 0x7FC5B1E1)
                    UpdatePedVariation(CachePed)
                    if CachePedData.head > 0 then
                        print("Loading head: " .. CachePedData.head)
                        local head = tonumber("0x" ..
                            DefaultChar[CachePedData.gender][CachePedData.skintone].Heads[CachePedData.head])
                        ApplyShopItemToPed(head, CachePed)
                    end
                    if CachePedData.lowerbody > 0 then
                        local comp = DefaultChar[CachePedData.gender][CachePedData.skintone].Legs
                            [CachePedData.lowerbody]
                        ApplyShopItemToPed(tonumber("0x" .. comp), CachePed)
                        TriggerEvent("murphy_clothes:Loadlowerbody", tonumber("0x" .. comp))
                    end
                    if CachePedData.upperbody > 0 then
                        local comp = DefaultChar[CachePedData.gender][CachePedData.skintone].Body
                            [CachePedData.upperbody]
                        ApplyShopItemToPed(tonumber("0x" .. comp), CachePed)
                        TriggerEvent("murphy_clothes:Loadupperbody", tonumber("0x" .. comp))
                    end
                    if CachePedData.body > 0 then
                        local comp = tonumber(Body[CachePedData.body])
                        EquipMetaPedOutfit(comp, CachePed)
                    end
                    if CachePedData.waist > 0 then
                        local comp = tonumber(Waist[CachePedData.waist])
                        EquipMetaPedOutfit(comp, CachePed)
                    end
                else
                    NPCAssetsToPed(model, outfit, PlayerPedId())
                    CachePed = PlayerPedId()
                end


                if CachePedData.teeth > 0 then
                    ApplyShopItemToPed(Teeth[CachePedData.gender][CachePedData.teeth].hash, CachePed)
                end

                if CachePedData.eyes > 0 then
                    ApplyShopItemToPed(Eyes[CachePedData.gender][CachePedData.eyes], CachePed)
                end
                IsPedReadyToRender(CachePed)
                for k, v in pairs(CachePedData.expressions) do
                    print("Expression: " .. k .. " : " .. v)
                    SetCharExpression(CachePed, ExpressionsHashes[k], v)
                end
                UpdatePedVariation(CachePed)
            end
            print("Loading overlays")

            TriggerEvent("murphy_clothing:loadclothes")
            TriggerEvent("murphy_barber:loadbarberoverlay")

            Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 0, healthCore)  -- Set Health Core back to what it was
            Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 1, stamCore)
            SetEntityHealth(PlayerPedId(), health)                                  -- Set health back to what it was
            Citizen.InvokeNative(0xA9EC16C7, PlayerId(), stam)                      -- SetPlayerStamina & GetPlayerMaxStamina
            Citizen.InvokeNative(0x675680D089BFA21F, PlayerPedId(), stam)
        end)
    end)

    function LoadFaceFeatures(ped, skin)
        for key, value in pairs(FaceFeatures) do
            for label, v in pairs(value) do
                if skin[v.comp] and skin[v.comp] ~= 0 then
                    SetCharExpression(ped, v.hash, skin[v.comp])
                end
            end
        end
    end

    function ApplyAllComponents(category, value, ped, set)
        if value.comp == -1 then
            return
        end

        local status = not set and "false" or GetResourceKvpString(tostring(value.comp))
        if status == "true" then
            return RemoveTagFromMetaPed(HashList[category])
        end

        ApplyShopItemToPed(value.comp, ped)

        if category ~= "Boots" then
            UpdateShopItemWearableState(ped, `base`)
        end

        Citizen.InvokeNative(0xAAB86462966168CE, ped, 1)
        UpdatePedVariation(ped)
        IsPedReadyToRender(ped)

        if value.palette ~= 0 then
            local TagData = GetMetaPedData(category == "Boots" and "boots" or category, ped)
            if TagData then
                local palette = (value.palette ~= 0) and value.palette or TagData.palette
                SetMetaPedTag(ped, TagData.drawable, TagData.albedo, TagData.normal, TagData.material, palette,
                    value.tint0, value.tint1, value.tint2)
                if IsPedAPlayer(ped) and CachedComponents[category] then
                    CachedComponents[category].drawable = TagData.drawable
                    CachedComponents[category].albedo = TagData.albedo
                    CachedComponents[category].normal = TagData.normal
                    CachedComponents[category].material = TagData.material
                    CachedComponents[category].palette = palette
                end
            end
        end
    end

    function LoadCharacterSelect(ped, skin, components)
        local gender = skin.sex == "mp_male" and "Male" or "Female"
        LoadAll(gender, ped, skin, components, false)
        SetAttributeCoreValue(ped, 1, 100)
        SetAttributeCoreValue(ped, 0, 100)
    end

    function LoadComps(ped, components, set)
        for category, value in pairs(components) do
            ApplyAllComponents(category, value, ped, set)
        end
        ApplyAllComponents("Shirt", components.Shirt, ped, set)
        ApplyAllComponents("Vest", components.Vest, ped, set)
    end

    function RemoveMetaTags(ped)
        for _, tag in pairs(HashList) do
            RemoveTagFromMetaPed(tag, ped)
            UpdatePedVariation(ped)
        end
    end

    function LoadAll(gender, ped, pedskin, components, set)
        RemoveMetaTags(ped)
        IsPedReadyToRender(ped)
        ResetPedComponents(ped)
        local skin = SetDefaultSkin(gender, pedskin)
        ApplyShopItemToPed(skin.HeadType, ped)
        ApplyShopItemToPed(skin.BodyType, ped)
        ApplyShopItemToPed(skin.LegsType, ped)
        ApplyShopItemToPed(skin.Eyes, ped)
        ApplyShopItemToPed(skin.Legs, ped)
        ApplyShopItemToPed(skin.Hair, ped)
        ApplyShopItemToPed(skin.Beard, ped)
        ApplyShopItemToPed(skin.Torso, ped)
        EquipMetaPedOutfit(skin.Waist, ped)
        EquipMetaPedOutfit(skin.Body, ped)
        Citizen.InvokeNative(0xAAB86462966168CE, ped, 1)
        LoadFaceFeatures(ped, skin)
        UpdatePedVariation(ped)
        IsPedReadyToRender(ped)
        LoadComps(ped, components, set)
        SetPedScale(ped, skin.Scale)
        UpdatePedVariation(ped)
        return skin
    end

    function SetDefaultSkin(gender, skin)
        local __data = {}
        for skinColor, value in pairs(DefaultChar[gender]) do
            for key, info in pairs(value) do
                if key == "HeadTexture" then
                    local headtext = joaat(value.HeadTexture[1])
                    if headtext == skin.albedo then
                        __data = value
                        -- work arround to fix Torso
                        for k, v in pairs(value.Body) do
                            if skin.Torso ~= 0 then
                                -- if Torso is not part of this color set due to old character, then set it to the first value in order to fix it
                                if tonumber("0x" .. v) ~= skin.Torso then
                                    skin.Torso = tonumber("0x" .. v)
                                    break
                                end
                            end
                        end

                        break
                    end
                end
            end
        end

        if not next(__data) then
            return skin
        end

        if skin.HeadType and skin.HeadType == 0 then
            skin.HeadType = tonumber("0x" .. __data.Heads[1])
        end

        if skin.BodyType and skin.BodyType == 0 then
            skin.BodyType = tonumber("0x" .. __data.Body[1])
        end

        if skin.LegsType and skin.LegsType == 0 then
            skin.LegsType = tonumber("0x" .. __data.Legs[1])
        end

        if skin.Torso and skin.Torso == 0 then
            skin.Torso = tonumber("0x" .. __data.Body[1])
        end

        return skin
    end

    function LoadPlayer(sex)
        if not HasModelLoaded(sex) then
            RequestModel(sex, false)
            repeat Wait(0) until HasModelLoaded(sex)
        end
    end

    FaceFeatures = {
        head = {
            ["Head Width"] = { hash = 0x84D6, comp = "HeadSize" },
            ["Face Width"] = { hash = 41396, comp = "FaceW" },
            ["Face Depth"] = { hash = 12281, comp = "FaceD" },
            ["Forehead Size"] = { hash = 13059, comp = "FaceS" },
            ["Neck Width"] = { hash = 36277, comp = "NeckW" },
            ["Neck Depth"] = { hash = 60890, comp = "NeckD" },
        },

        eyesandbrows = {
            ["Brows Height"] = { hash = 0x3303, comp = "EyeBrowH" },
            ["Brows Width"] = { hash = 0x2FF9, comp = "EyeBrowW" },
            ["Brows Depth"] = { hash = 0x4AD1, comp = "EyeBrowD" },
            ["Eyes Depth"] = { hash = 0xEE44, comp = "EyeD" },
            ["Eyes Angle"] = { hash = 0xD266, comp = "EyeAng" },
            ["Eyes Distance"] = { hash = 0xA54E, comp = "EyeDis" },
            ["Eyes Height"] = { hash = 0xDDFB, comp = "EyeH" },
            ["Eyelid Height"] = { hash = 0x8B2B, comp = "EyeLidH" },
            ["Eyelid Width"] = { hash = 0x1B6B, comp = "EyeLidW" },
            ["Eyelid Left O/Close"] = { hash = 52902, comp = "EyeLidL" },
            ["Eyelid Right O/Close"] = { hash = 22421, comp = "EyeLidR" },
        },

        ears = {
            ["Ears Width"] = { hash = 0xC04F, comp = "EarsW" },
            ["Ears Angle"] = { hash = 0xB6CE, comp = "EarsA" },
            ["Ears Height"] = { hash = 0x2844, comp = "EarsH" },
            ["Ears Depth"] = { hash = 0xED30, comp = "EarsD" },
        },
        cheek = {
            ["CheekBone Height"] = { hash = 0x6A0B, comp = "CheekBonesH" },
            ["CheekBone Width"] = { hash = 0xABCF, comp = "CheekBonesW" },
            ["CheekBone Depth"] = { hash = 0x358D, comp = "CheekBonesD" },
        },
        jaw = {
            ["Jaw Height"] = { hash = 0x8D0A, comp = "JawH" },
            ["Jaw Width"] = { hash = 0xEBAE, comp = "JawW" },
            ["Jaw Depth"] = { hash = 0x1DF6, comp = "JawD" },
        },
        chin = {
            ["Chin Height"] = { hash = 0x3C0F, comp = "ChinH" },
            ["Chin Width"] = { hash = 0xC3B2, comp = "ChinW" },
            ["Chin Depth"] = { hash = 0xE323, comp = "ChinD" },
        },
        nose = {
            ["Nose Width"] = { hash = 0x6E7F, comp = "NoseW" },
            ["Nose Size"] = { hash = 0x3471, comp = "NoseS" },
            ["Nose Height"] = { hash = 0x03F5, comp = "NoseH" },
            ["Nose Angle"] = { hash = 0x34B1, comp = "NoseAng" },
            ["Nose Curvature"] = { hash = 0xF156, comp = "NoseC" },
            ["Nose Distance"] = { hash = 0x561E, comp = "NoseDis" },
        },
        mouthandlips = {
            ["Mouth Width"] = { hash = 0xF065, comp = "MouthW" },
            ["Mouth Depth"] = { hash = 0xAA69, comp = "MouthD" },
            ["Mouth DistanceX"] = { hash = 0x7AC3, comp = "MouthX" },
            ["Mouth DistanceY"] = { hash = 0x410D, comp = "MouthY" },
            ["Lip Upper Height"] = { hash = 0x1A00, comp = "ULiphH" },
            ["Lip Upper Width"] = { hash = 0x91C1, comp = "ULiphW" },
            ["Lip Upper Depth"] = { hash = 0xC375, comp = "ULiphD" },
            ["Lip Lower Height"] = { hash = 0xBB4D, comp = "LLiphH" },
            ["Lip Lower Width"] = { hash = 0xB0B0, comp = "LLiphW" },
            ["Lip Lower Depth"] = { hash = 0x5D16, comp = "LLiphD" },
            ["Mouth Corner Left Withd"] = { hash = 57350, comp = "MouthCLW" },
            ["Mouth Corner Right Withd"] = { hash = 60292, comp = "MouthCRW" },
            ["Mouth Corner Left Depth"] = { hash = 40950, comp = "MouthCLD" },
            ["Mouth Corner Right Depth"] = { hash = 49299, comp = "MouthCRD" },
            ["Mouth Corner Left Height"] = { hash = 46661, comp = "MouthCLH" },
            ["Mouth Corner Right Height"] = { hash = 55718, comp = "MouthCRH" },
            ["Mouth Corner Left Lips Distance"] = { hash = 22344, comp = "MouthCLLD" },
            ["Mouth Corner Right Lips Distance"] = { hash = 9423, comp = "MouthCRLD" },
        },
        upperbody = {
            ["Arms Size"] = { hash = 46032, comp = "ArmsS" },
            ["Upper Shoulders Size"] = { hash = 50039, comp = "ShouldersS" },
            ["Back Shoulders Thickness"] = { hash = 7010, comp = "ShouldersT" },
            ["Back Muscles"] = { hash = 18046, comp = "ShouldersM" }, -- shoulder blades / back muscles
            ["Chest Size"] = { hash = 27779, comp = "ChestS" },
            ["Waist Width"] = { hash = 50460, comp = "WaistW" },
            ["Hips Size"] = { hash = 49787, comp = "HipsS" }, -- hip width / stomach size
        },

        lowerbody = {
            ["Tights Size"] = { hash = 64834, comp = "LegsS" },
            ["Calves Size"] = { hash = 42067, comp = "CalvesS" },
        },

    }



    HashList = {
        Gunbelt     = 0x9B2C8B89,
        Mask        = 0x7505EF42,
        Holster     = 0xB6B6122D,
        Loadouts    = 0x83887E88,
        Coat        = 0xE06D30CE,
        Cloak       = 0x3C1A74CD,
        EyeWear     = 0x5E47CA6,
        Bracelet    = 0x7BC10759,
        Skirt       = 0xA0E3AB7F,
        Poncho      = 0xAF14310B,
        Spats       = 0x514ADCEA,
        NeckTies    = 0x7A96FACA,
        Spurs       = 0x18729F39,
        Pant        = 0x1D4C528A,
        Suspender   = 0x877A2CF7,
        Glove       = 0xEABE0032,
        Satchels    = 0x94504D26,
        GunbeltAccs = 0xF1542D11,
        CoatClosed  = 0x662AC34,
        Buckle      = 0xFAE9107F,
        RingRh      = 0x7A6BBD0B,
        Belt        = 0xA6D134C6,
        Accessories = 0x79D7DF96,
        Shirt       = 0x2026C46D,
        Gauntlets   = 0x91CE9B20,
        Chap        = 0x3107499B,
        NeckWear    = 0x5FC29285,
        Boots       = 0x777EC6EF,
        Vest        = 0x485EE834,
        RingLh      = 0xF16A1D23,
        Hat         = 0x9925C067,
        Dress       = 0xA2926F9B,
        Badge       = 0x3F7F3587,
        armor       = 0x72E6EF74,
        Hair        = 0x864B03AE,
        Beard       = 0xF8016BCA,
        bow         = 0x8E84A2AA,
    }
end
