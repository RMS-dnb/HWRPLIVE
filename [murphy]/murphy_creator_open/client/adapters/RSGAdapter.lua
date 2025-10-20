if Config.framework == 'rsg-core' then
    local myChars  = {}
    charselectpeds = {}
    headsonscreen  = {}
    PedAccess      = false
    PlayerInfo     = {}
    PlayerSex      = {}
    local RSGCore  = exports['rsg-core']:GetCoreObject()

    RegisterNetEvent('murphy_creator:LaunchCharSelect', function(characters, pedperm, slots)
        ShutdownLoadingScreen()
        ShutdownLoadingScreenNui()
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
            if value.citizenid ~= nil then
                PlayerInfo[key] = {
                    firstname = value.charinfo.firstname,
                    lastname = value.charinfo.lastname,
                    characterid = value.citizenid,
                    informations = value.informations,
                    charid = value.citizenid,
                }
                if value.charinfo.gender == 0 then
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
                    ApplyCachePedDataToPed(data.PedHandler, peddata, value.citizenid)
                    print("Characters[" .. value.citizenid .. "] loaded")
                else
                    print("Loading existing character: " .. tostring(value.citizenid))
                    RSGCore.Functions.TriggerCallback('rsg-multicharacter:server:getAppearance', function(appearance)
                        local skinTable = appearance.skin or {}
                        DataSkin = appearance.skin
                        local clothesTable = appearance.clothes or {}
                        local sex = tonumber(skinTable.sex) == 1 and `mp_male` or `mp_female`
                        print("Loading skin for character: " .. tostring(value.citizenid))
                        if sex ~= nil then
                            RequestModel(sex)
                            while not HasModelLoaded(sex) do
                                Wait(0)
                            end
                            data.PedHandler = CreatePed(sex, data.coords, 0.0, false, false, false, false)
                            repeat Wait(0) until DoesEntityExist(data.PedHandler)
                            charselectpeds[key] = data.PedHandler
                            -- EquipMetaPedOutfitPreset(data.PedHandler, 0, false)
                            SetEntityCoords(data.PedHandler, data.coords)
                            SetEntityHeading(data.PedHandler, data.heading)
                            FreezeEntityPosition(data.PedHandler, false)
                            SetEntityInvincible(data.PedHandler, true)
                            SetBlockingOfNonTemporaryEvents(data.PedHandler, true)
                            NetworkSetEntityInvisibleToNetwork(data.PedHandler, true)
                            SetEntityAsMissionEntity(data.PedHandler, true, true)
                            print(data.PedHandler, Citizen.InvokeNative(0xA0BC8FAED8CFEB3C, data.PedHandler),
                                GetEntityCoords(data.PedHandler))
                            while Citizen.InvokeNative(0xA0BC8FAED8CFEB3C, data.PedHandler) ~= 1 do
                                Wait(1)
                            end
                            exports['rsg-appearance']:ApplySkinMultiChar(skinTable, data.PedHandler, clothesTable)
                            print("Character skin applied: " .. tostring(value.citizenid))
                            TriggerEvent("murphy_clothes:ApplyClothesToCharid", value.citizenid, data.PedHandler)
                            TriggerEvent("murphy_barber:loadbarberoverlayOnCharacter", value.citizenid,
                                data.PedHandler)
                        end
                    end, value.citizenid)
                end
            else
                print("Loading new character: " .. tostring(value.citizenid))
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
            if value.citizenid ~= nil then
                ExistingChar = true
                name = value.charinfo.firstname .. " " .. value.charinfo.lastname
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

    RegisterNetEvent("murphy_creator:PlaySelectedChar", function(id)
        TriggerServerEvent("murphy_creator:RemovePlayerFromInstance")
        DoScreenFadeOut(0)
        repeat Wait(0) until IsScreenFadedOut()
        Wait(1000)
        SwitchOffCam(false)
        DisplayRadar(true)
        DisplayHud(true)
        TriggerServerEvent('rsg-multicharacter:server:loadUserData',  myChars[id], false)
        Wait(5000)
        TriggerServerEvent('rsg-appearance:server:LoadSkin')
        Wait(500)
        TriggerServerEvent('rsg-appearance:server:LoadClothes', 1)
        local PlayerData = RSGCore.Functions.GetPlayerData()
        local ped = PlayerPedId()
        FreezeEntityPosition(ped, false)
        SetEntityCoords(ped, PlayerData.position.x, PlayerData.position.y, PlayerData.position.z)
        SetEntityHeading(ped, PlayerData.position.w)
        TriggerServerEvent('RSGCore:Server:OnPlayerLoaded')
        TriggerEvent('RSGCore:Client:OnPlayerLoaded')

    end)

    AddEventHandler("RSGCore:Client:OnPlayerLoaded", function ()
        Wait(2000)
        TriggerEvent("murphy_creator:loadskin")
    end)

    RegisterNetEvent("murphy_creator:loadskin", function()
        Callback.triggerServer("murphy_creator:GetPedData", function(peddata)
            print("Loading skin")
            CachePedData = peddata
            local ped
            local healthCore = GetAttributeCoreValue(PlayerPedId(), 0) -- Get health core value
            local stamCore = GetAttributeCoreValue(PlayerPedId(), 1)   -- Get health core value
            local health = GetEntityHealth(PlayerPedId())              -- Get health value
            local stam = GetPedStamina(PlayerPedId())                  -- Get stamina value
            print(json.encode(CachePedData))
            if next(CachePedData) == nil then
                --- If no data in murphy_creator, load default skin for framework
                print("No skin data in murphy_creator")
                TriggerServerEvent('rsg-appearance:server:LoadSkin')
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

            print(healthCore, stamCore, health, stam)
            Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 0, healthCore) -- Set Health Core back to what it was
            Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 1, stamCore)
            SetEntityHealth(PlayerPedId(), health)                                 -- Set health back to what it was
            Citizen.InvokeNative(0xA9EC16C7, PlayerId(), stam)                     -- SetPlayerStamina & GetPlayerMaxStamina
            Citizen.InvokeNative(0x675680D089BFA21F, PlayerPedId(), stam)
        end)
    end)

    RegisterNetEvent("murphy_creator:createnewchar", function(data)
        TriggerServerEvent('rsg-multicharacter:server:createCharacter', data)
        Wait(2000)
        exports.weathersync:setSyncEnabled(true)
        TriggerServerEvent('RSGCore:Server:OnPlayerLoaded')
        TriggerEvent('RSGCore:Client:OnPlayerLoaded')
        TriggerServerEvent("murphy_creator:RemovePlayerFromInstance")
        Wait(2000)
        TriggerEvent("murphy_creator:loadskin")
    end)
end
