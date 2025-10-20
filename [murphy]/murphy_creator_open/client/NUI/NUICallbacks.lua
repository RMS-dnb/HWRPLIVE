local camOnHead = false
local processingcam = false
local teethanim = false
local eyesanim = false
local changingGender = false
-- Callback for showing the edition menu
RegisterNUICallback("showEditionMenu", function(data, cb)
    PlaySound("SELECT", "HUD_SHOP_SOUNDSET")
    local pinId = data.pinId
    local pinName = data.pinName
    local elemId = data.elemId
    local subElemName = data.subElemName
    DisplayPins = false
    print("Show Edition Menu triggered")
    print("Pin ID:", pinId, "Pin Name:", pinName, "Element ID:", elemId, "Sub Element Name:", subElemName)

    if elemId == "barber" then
        OpenBarberMenu()
    elseif elemId == "clothes" then
        CreatorLight = false
        OpenClothesMenu()
    else
        local arrayData = {}
        if EditionElem[elemId] then
            -- Convertir la table en tableau indexé numériquement
            print(EditionElem[elemId].division)
            for _, i in pairs(EditionElem[elemId].division) do
                for j, elem in pairs(i.elements) do
                    if elem.type == "slider" then
                        if CachePedData.expressions[elem.id] == nil then
                            elem.startValue = 50
                        else
                            elem.startValue = scale(CachePedData.expressions[elem.id], ExpressionsMaxValues[elem.id].min,
                                ExpressionsMaxValues[elem.id].max, 0, 100)
                        end
                    end
                    if elem.type == "matrice" then
                        if CachePedData.expressions[elem.XHashes] == nil then
                            elem.startPositionX = 0.5
                        else
                            elem.startPositionX = scale(CachePedData.expressions[elem.XHashes],
                                ExpressionsMaxValues[elem.XHashes].min,
                                ExpressionsMaxValues[elem.XHashes].max, 0, 1)
                        end
                        if CachePedData.expressions[elem.YHashes] == nil then
                            elem.startPositionY = 0.5
                        else
                            elem.startPositionY = scale(CachePedData.expressions[elem.YHashes],
                                ExpressionsMaxValues[elem.YHashes].min,
                                ExpressionsMaxValues[elem.YHashes].max, 0, 1)
                        end
                    end
                end
            end
            local elem = deepcopy(EditionElem[elemId])
            if elemId == "headshape" then
                if CachePedData.pedmodel.model ~= "mp_male" and CachePedData.pedmodel.model ~= "mp_female" then
                    table.remove(elem.division, 1)
                end
            end
            table.insert(arrayData, elem)
            ------------------
            --- Renvoyer les startpositions
        end
        EditionMenu(true, arrayData)

        -- Add your logic here
    end
    SendNUIMessage(
        {
            type = "hideEditApparenceMenu",

        }
    )
    if elemId == "eyes" then
        SendNUIMessage(
            {
                type = "openEyesPersoMenu",
                eyesColours = EyeColours
            }
        )
    end
    MoveCam(pinId)
    Wait(1001)
end)

-- Callback for canceling character edition
RegisterNUICallback("cancelCharEdition", function(data, cb)
    PlaySound("BACK", "HUD_SHOP_SOUNDSET")
    MoveCam("edit")
    EditionMenu(false)
    local ped = CachePed
    local x, y, z = table.unpack(GetEntityCoords(ped))
    if not baseHeading then
        baseHeading = GetEntityHeading(ped)
        -- Stocker l'offset initial pour que 180 corresponde à baseHeading
        angleOffset = 180 - baseHeading
    end
    local targetHeading = (180 - angleOffset) % 360
    local rad = math.rad(targetHeading)
    local distance = 1.0
    local targetX = x + (math.sin(-rad) * distance)
    local targetY = y + (math.cos(-rad) * distance)
    TaskTurnPedToFaceCoord(ped, targetX, targetY, z, 0)
    DisplayPins = true

    Wait(1000)

    LoadApparenceMenu()

    OpenApperanceMenu()

    -- Add your logic here

    cb("ok")
end)

RegisterNetEvent("murphy_creator:BackFromClothing", function()
    PlaySound("BACK", "HUD_SHOP_SOUNDSET")
    ActiveCam = 0
    MoveCam("edit")

    EditionMenu(false)
    local ped = CachePed
    local x, y, z = table.unpack(GetEntityCoords(ped))
    if not baseHeading then
        baseHeading = GetEntityHeading(ped)
        -- Stocker l'offset initial pour que 180 corresponde à baseHeading
        angleOffset = 180 - baseHeading
    end
    local targetHeading = (180 - angleOffset) % 360
    local rad = math.rad(targetHeading)
    local distance = 1.0
    local targetX = x + (math.sin(-rad) * distance)
    local targetY = y + (math.cos(-rad) * distance)
    TaskTurnPedToFaceCoord(ped, targetX, targetY, z, 0)
    DisplayPins = true
    Light()
    Wait(1000)
    LoadApparenceMenu()
    OpenApperanceMenu()
end)

-- Callback for handling camera changes
RegisterNUICallback("cameraChange", function(data, cb)
    local cameraName = data.cameraName
    local value = data.value

    print("Camera Change triggered")
    print("Camera Name:", cameraName, "Value:", value)

    if cameraName == "Z" then
        local outputvalue = scale(value, 1, 360, 15.0, 50.0)
        if ActiveCam == 1 then
            SetCamFov(Cam1, outputvalue)
        else
            SetCamFov(Cam2, outputvalue)
        end
        PlaySound("Amount_Increase", "HUD_Donate_Sounds")
    end

    if cameraName == "R" then
        local ped = CachePed
        local x, y, z = table.unpack(GetEntityCoords(ped))

        -- Initialiser le heading de base si pas encore fait
        if not baseHeading then
            baseHeading = GetEntityHeading(ped)
            -- Stocker l'offset initial pour que 180 corresponde à baseHeading
            angleOffset = 180 - baseHeading
        end

        -- Calculer le heading cible directement
        local targetHeading = (value - angleOffset) % 360
        local rad = math.rad(targetHeading)

        -- Calculer un point à 1 unité devant le ped selon le heading voulu
        local distance = 1.0
        local targetX = x + (math.sin(-rad) * distance)
        local targetY = y + (math.cos(-rad) * distance)

        TaskTurnPedToFaceCoord(ped, targetX, targetY, z, 0)
        PlaySound("Amount_Decrease",
            "HUD_Donate_Sounds")
    end
end)

-- Callback for handling matrix element updates
RegisterNUICallback("matriceElem", function(data, cb)
    local item = data.item
    local matriceId = data.matriceId
    local x = data.X
    local y = data.Y

    local XHashes = data.XHashes
    local YHashes = data.YHashes
    local Xoutputvalue = scale(x, 0, 1, ExpressionsMaxValues[XHashes].min, ExpressionsMaxValues[XHashes].max)
    local Youtputvalue = scale(y, 0, 1, ExpressionsMaxValues[YHashes].min, ExpressionsMaxValues[YHashes].max)

    local ped = CachePed

    print("Matrix Element Update triggered")
    print("Item:", item, "Matrix ID:", matriceId, "X:", x, XHashes, "Y:", y, YHashes)
    PlaySound("Amount_Decrease", "HUD_Donate_Sounds")
    IsPedReadyToRender(ped)
    SetCharExpression(ped, ExpressionsHashes[XHashes], Xoutputvalue)
    SetCharExpression(ped, ExpressionsHashes[YHashes], Youtputvalue)
    CachePedData.expressions[XHashes] = Xoutputvalue
    CachePedData.expressions[YHashes] = Youtputvalue
    UpdatePedVariation(ped)
end)

-- Callback for handling matrix element updates
RegisterNUICallback("sliderCharChange", function(data, cb)
    local value = data.value
    local ElementID = data.ElementID
    local ped = CachePed
    print(ExpressionsMaxValues[ElementID].min)
    local outputvalue = scale(value, 0, 100, ExpressionsMaxValues[ElementID].min, ExpressionsMaxValues[ElementID].max)
    print("Matrix Element Update triggered")
    print("Value:", value, "Element ID:", ElementID)
    PlaySound("Amount_Increase", "HUD_Donate_Sounds")

    IsPedReadyToRender(ped)
    SetCharExpression(ped, ExpressionsHashes[ElementID], outputvalue)
    CachePedData.expressions[ElementID] = outputvalue
    UpdatePedVariation(ped)
end)

RegisterNUICallback("cancelCharCreation", function(data, cb)
    PlaySound("BACK", "HUD_SHOP_SOUNDSET")
    print("cancelCharCreation triggered")
    CachePedData = deepcopy(DefaultCachePedData)
    ApplyCachePedDataToPedPlayer()
    SendNUIMessage(
        {
            type = "hideCharGlobalMenu",
        }
    )
    MoveCam("charselect",
        {
            coords = DecorSettings.charselectcam.coords,
            target = DecorSettings.charselectcam.target,
            fov = DecorSettings
                .charselectcam.fov
        }, false)
    Wait(1500)
    SendNUIMessage(
        {
            type = "openSelectCharMenu",
            pinsSelectChar = headsonscreen,
        }
    )
end)

RegisterNUICallback("CreateChar", function(data, cb)
    print("CreateChar triggered")
    CharacterName = nil
    SendNUIMessage({ type = "getAllCharDatas", })
    repeat
        Wait(100)
    until CharacterName ~= nil
    if tostring(CharacterName) == "" or tostring(CharacterSurname) == "" or tostring(CharacterBirthDay) == "" or tostring(CharacterBirthMonth) == "" or tostring(CharacterBirthYear) == "" or tostring(CharacterLore) == "" then
        PlaySound("UNAFFORDABLE", "Ledger_Sounds")
        print("Missing informations, please fill all fields")
    else
        -- if CachePed ~= PlayerPedId() then
        -- DeleteEntity(CachePed)
        -- end
        PlaySound("SELECT", "HUD_SHOP_SOUNDSET")
        SendNUIMessage(
            {
                type = "hideCharGlobalMenu",
            }
        )
        Wait(1000)
        SendNUIMessage(
            {
                type = "openSpawnMenu",
                spawnLocation = SpawnLocation,
            }
        )
    end
end)

RegisterNUICallback("spawnPreview", function(data, cb)
    local spawnLocationId = data.SpawnLocationId
    local spawnLocationName = data.SpawnLocationName
    PlaySound("SELECT", "HUD_SHOP_SOUNDSET")
    print("spawnPreview triggered")
    print("Spawn Location ID:", spawnLocationId, "Spawn Location Name:", spawnLocationName)
    SetEntityCoords(PlayerPedId(), SpawnLocation[spawnLocationId].pedspawn)
    SetEntityHeading(PlayerPedId(), SpawnLocation[spawnLocationId].pedspawnheading)
    FreezeEntityPosition(PlayerPedId(), true)
    DoScreenFadeOut(1000)
    for k, v in pairs(charselectpeds) do
        if DoesEntityExist(v) then
            DeleteEntity(v)
        end
    end
    Wait(1000)
    Citizen.InvokeNative("0x387AD749E3B69B70", SpawnLocation[spawnLocationId].coords, 0.0, 0.0, 0.0, 5.0, 0) --- Load the scene
    while not IsLoadSceneLoaded() do
        Wait(100)
    end
    Citizen.InvokeNative("0x5A8B01199C3E79C3") -- Stop the loading
    MoveCam(spawnLocationName,
        {
            coords = SpawnLocation[spawnLocationId].coords,
            target = SpawnLocation[spawnLocationId].target,
            fov =
                SpawnLocation[spawnLocationId].fov
        }, true)
    Wait(1000)
    DoScreenFadeIn(1000)
end)

RegisterNUICallback("spawnCharacter", function(data, cb)
    local spawnLocationId = data.SpawnLocationId
    local spawnLocationName = data.SpawnLocationName
    PlaySound("SELECT", "HUD_SHOP_SOUNDSET")
    print("spawnCharacter triggered")
    print("Spawn Location ID:", spawnLocationId, "Spawn Location Name:", spawnLocationName)
    SetNuiFocus(false, false)
    -- TriggerServerEvent("redemrp:createCharacter", "test", "test")
    data.firstname = CharacterName
    data.lastname = CharacterSurname
    data.coords = SpawnLocation[spawnLocationId].pedspawn
    data.lore = CharacterLore
    data.birthday = CharacterBirthDay
    data.birthmonth = CharacterBirthMonth
    data.birthyear = CharacterBirthYear
    data.gender = CachePedData.gender
    data.pedspawn = SpawnLocation[spawnLocationId].pedspawn
    data.pedspawnheading = SpawnLocation[spawnLocationId].pedspawnheading
    data.skintone = CachePedData.skintone
    data.body = tonumber("0x" .. DefaultChar[CachePedData.gender][CachePedData.skintone].Body[CachePedData.upperbody])
    data.legs = tonumber("0x" .. DefaultChar[CachePedData.gender][CachePedData.skintone].Legs[CachePedData.lowerbody])
    DeleteObject(lamp)
    DeleteObject(lamp2)
    CreatorLight = false
    SendNUIMessage(
        {
            type = "hideSpawnMenu",
        }
    )
    Callback.triggerServer('murphy_creator:CreateNewCharacter', function(result)
        if result then
            Callback.triggerServer('murphy_creator:SavePreset', function(result, outfitid)
                if result then
                    SetEntityCoords(PlayerPedId(), SpawnLocation[spawnLocationId].pedspawn)
                    SetEntityHeading(PlayerPedId(), SpawnLocation[spawnLocationId].pedspawnheading)
                    Wait(2000)
                    SwitchOffCam(true)
                    FreezeEntityPosition(PlayerPedId(), false)
                    TriggerEvent("murphy_creator:loadskin")
                end
            end, hairstyleCache, overlay_all_layers, "Base", 0, IsPedMale(CachePed))
        end
    end, data, CachePedData)
end)


RegisterNUICallback("EditChart", function(data, cb)
    PlaySound("SELECT", "HUD_SHOP_SOUNDSET")
    print("EditChart triggered")
    if changingGender == true then
        PlaySound("UNAFFORDABLE", "Ledger_Sounds")
        return
    end

    SendNUIMessage(
        {
            type = "hideCharGlobalMenu",
        }
    )
    MoveCam("edit")
    Wait(1200)
    LoadApparenceMenu()
    DisplayPins = true
    OpenApperanceMenu()
end)

RegisterNUICallback("CharValues", function(data, cb)
    print("CharValues triggered")
    CharacterName = data.CharacterName
    CharacterSurname = data.CharacterSurname
    CharacterLore = data.CharacterLore
    CharacterBirthDay = data.CharacterBirthDay
    CharacterBirthMonth = data.CharacterBirthMonth
    CharacterBirthYear = data.CharacterBirthYear
    CharacterIsAPed = data.CharacterIsAPed
    CharacterSexe = data.CharacterSexe
    print("Character Name:", CharacterName)
    print("Character Surname:", CharacterSurname)
    print("Character Lore:", CharacterLore)
    print("Character BirthDay:", CharacterBirthDay)
    print("Character BirthMonth:", CharacterBirthMonth)
    print("Character BirthYear:", CharacterBirthYear)
    print("Character IsAPed:", CharacterIsAPed)
    print("Character Sexe:", CharacterSexe)
end)


RegisterNUICallback("sexeStatusChanged", function(data, cb)
    if changingGender == false then
        changingGender = true
        CachePedData = deepcopy(DefaultCachePedData)
        SendNUIMessage(
            {
                type = "changeuserSexe",
                userSexe = data.currentSexe,
            }
        )
        local currentSexe = data.currentSexe
        PlaySound("Amount_Increase", "HUD_Donate_Sounds")
        CreatorLight = false
        Wait(1000)

        local model = "mp_male"
        if currentSexe == "Female" then model = "mp_female" end
        CachePedData.gender = currentSexe
        CachePedData.pedmodel = { model = model, outfit = 0 }
        local coords = vector3(-2785.515, -3058.224, -13.34043)
        local heading = 349.0
        RequestModel(GetHashKey(model))
        while not HasModelLoaded(GetHashKey(model)) do
            Wait(1)
        end
        if CachePed ~= PlayerPedId() then
            DeleteEntity(CachePed)
        end
        SetPlayerModel(PlayerId(), GetHashKey(model))
        CachePed = PlayerPedId()
        -- local entity = CreatePed_2(GetHashKey(model), 0.0, 0.0, 0.0, 0.0, false, true)
        Wait(10)
        EquipMetaPedOutfitPreset(CachePed, 0, false)

        ApplyCachePedDataToPedPlayer()
        RemoveAllClothesExceptEssentials(CachePed)
        Light()
        SetEntityCoords(CachePed, coords)
        SetEntityHeading(CachePed, heading)
        hairstyleCache = {}
        local selectedgender = "female"
        if CachePedData.gender == "Male" then selectedgender = "male" end
        for k, v in pairs(MURPHY_ASSETS[selectedgender]) do
            if hairstyleCache[k] == nil then
                hairstyleCache[k] = {}
                hairstyleCache[k].model = 0
                hairstyleCache[k].texture = 0
            end
        end
        Wait(1500)
        changingGender = false
    else
        PlaySound("UNAFFORDABLE", "Ledger_Sounds")
    end
end)

local cachePedSelection, cachePedVariation = 0, 0
RegisterNUICallback("pedValue", function(data, cb)
    print(CachePedData.gender)
    local model = data.id
    local outfit = tonumber(data.item)
    if outfit == nil then outfit = 0 end
    outfit = outfit - 1
    if outfit < 0 then outfit = 0 end
    if cachePedSelection == model and cachePedVariation == outfit then
        PlaySound("UNAFFORDABLE", "Ledger_Sounds")
        return
    end
    local cachegender = CachePedData.gender
    CachePedData = deepcopy(DefaultCachePedData)
    CachePedData.gender = cachegender
    if model ~= cachePedSelection then
        PlaySound("SELECT", "HUD_SHOP_SOUNDSET")
        cachePedSelection = model
        cachePedVariation = outfit
    else
        if cachePedVariation > outfit then
            PlaySound("Amount_Decrease", "HUD_Donate_Sounds")
        else
            PlaySound("Amount_Increase", "HUD_Donate_Sounds")
        end
        cachePedVariation = outfit
    end
    CachePedData.pedmodel = { model = model, outfit = outfit }

    NPCAssetsToPed(model, outfit)
    RemoveAllClothesExceptEssentials(PlayerPedId(), true)
    DisplayHud(true)
    ShowAdvancedRightNotification(Lang.Creator["Ped Warning"], "menu_textures", "menu_icon_alert", "COLOR_RED", 8000)
    print(CachePedData.gender)
end)

RegisterNUICallback("PedSelection", function(data, cb)
    if PedAccess == false then
        PlaySound("UNAFFORDABLE", "Ledger_Sounds")
        return
    end
    PlaySound("SELECT", "HUD_SHOP_SOUNDSET")
    SendNUIMessage({ type = "getAllCharDatas", })
    Wait(100)
    SendNUIMessage({ type = "hideCharGlobalMenu", })
    local count = 0
    local modelcount = 0
    local pedtoshow = {}
    for k, v in pairs(PedList[CharacterSexe]) do
        if not string.find(v.name, "cs_") then
            count = count + v.totalAmount
            table.insert(pedtoshow, v)
            modelcount = modelcount + 1
        end
    end
    SendNUIMessage(
        {
            type = "showPedsList",
            pedsList = pedtoshow,
        }
    )
end)

RegisterNUICallback("PedTrueFalse", function(data, cb)
    PlaySound("SELECT", "HUD_SHOP_SOUNDSET")
    local userPed = data.userPed
    print("PedTrueFalse triggered", userPed)
    print(CachePedData.gender)
    if userPed == "false" and CachePedData.pedmodel.model ~= "mp_male" and CachePedData.pedmodel.model ~= "mp_female" then
        CreatorLight = false
        Wait(1000)
        local model = "mp_male"
        local gender = CachePedData.gender
        CachePedData = deepcopy(DefaultCachePedData)
        CachePedData.gender = gender
        if CachePedData.gender == "Female" then model = "mp_female" end

        CachePedData.pedmodel = { model = model, outfit = 0 }
        local coords = vector3(-2785.515, -3058.224, -13.34043)
        local heading = 349.0
        RequestModel(GetHashKey(model))
        while not HasModelLoaded(GetHashKey(model)) do
            Wait(1)
        end
        if CachePed ~= PlayerPedId() then
            DeleteEntity(CachePed)
        end
        SetPlayerModel(PlayerId(), GetHashKey(model))
        CachePed = PlayerPedId()
        Wait(10)
        EquipMetaPedOutfitPreset(CachePed, 0, false)
        ApplyCachePedDataToPedPlayer()
        RemoveAllClothesExceptEssentials(CachePed)
        Light()
        SetEntityCoords(CachePed, coords)
        SetEntityHeading(CachePed, heading)
    end
    print(CachePedData.gender)
end)


RegisterNUICallback("cancelPedSelection", function(data, cb)
    PlaySound("BACK", "HUD_SHOP_SOUNDSET")
    SendNUIMessage(
        {
            type = "showCharGlobalMenu",
        }
    )
    DisplayHud(false)
end)

RegisterNUICallback("globalApparence", function(data, cb)
    local item = tonumber(data.item)
    local elem = data.elem
    print("globalApparence triggered")
    if eyesanim then
        eyesanim = false
        ClearPedTasks(CachePed)
    end
    if processingcam == true then
        PlaySound("UNAFFORDABLE", "Ledger_Sounds")
    else
        if elem == "head" or elem == "tooth" then
            -- if camOnHead == false then
            --     camOnHead = true
            --     processingcam = true
            --     MoveCam("head")
            --     DisplayPins = false
            --     Wait(1000)
            --     processingcam = false
            -- end
            if elem == "tooth" then
                teethanim = true
                if not HasAnimDictLoaded("FACE_HUMAN@GEN_MALE@BASE") then
                    RequestAnimDict("FACE_HUMAN@GEN_MALE@BASE")
                    repeat Wait(0) until HasAnimDictLoaded("FACE_HUMAN@GEN_MALE@BASE")
                end

                if not IsEntityPlayingAnim(CachePed, "FACE_HUMAN@GEN_MALE@BASE", "Face_Dentistry_Loop", 1) then
                    TaskPlayAnim(CachePed, "FACE_HUMAN@GEN_MALE@BASE", "Face_Dentistry_Loop", 1.0, -1.0, -1, 16, 0.0,
                        false, 0, false, "", false)
                end
                IsPedReadyToRender(CachePed)
                ApplyShopItemToPed(Teeth[CachePedData.gender][item].hash, CachePed)
                UpdatePedVariation(CachePed)
                CachePedData.teeth = item
            else
                if teethanim then
                    teethanim = false
                    ClearPedTasks(CachePed)
                end
            end
            if elem == "head" then
                local heads = tonumber("0x" .. DefaultChar[CachePedData.gender][CachePedData.skintone].Heads[item])
                IsPedReadyToRender(CachePed)
                ApplyShopItemToPed(heads, CachePed)
                UpdatePedVariation(CachePed)
                CachePedData.head = item
            end
        else
            if elem == "body" then
                local comp = tonumber(Body[item])
                IsPedReadyToRender(CachePed)
                EquipMetaPedOutfit(comp, CachePed)
                UpdatePedVariation(CachePed)
                CachePedData.body = item
            end
            if elem == "waist" then
                local comp = tonumber(Waist[item])
                IsPedReadyToRender(CachePed)
                EquipMetaPedOutfit(comp, CachePed)
                UpdatePedVariation(CachePed)
                CachePedData.waist = item
            end

            if elem == "legs" then
                local comp = DefaultChar[CachePedData.gender][CachePedData.skintone].Legs[item]
                IsPedReadyToRender(CachePed)
                ApplyShopItemToPed(tonumber("0x" .. comp), CachePed)
                UpdatePedVariation(CachePed)
                CachePedData.lowerbody = item
            end

            if elem == "upper" then
                local comp = DefaultChar[CachePedData.gender][CachePedData.skintone].Body[item]
                IsPedReadyToRender(CachePed)
                ApplyShopItemToPed(tonumber("0x" .. comp), CachePed)
                UpdatePedVariation(CachePed)
                CachePedData.upperbody = item
            end
            if elem == "height" then
                local outputvalue = scale(item, 0, 100, HeightMin, HeightMax)
                IsPedReadyToRender(CachePed)
                SetPedScale(CachePed, outputvalue)
                UpdatePedVariation(CachePed)
                CachePedData.height = outputvalue
            end
            for k, v in pairs(CachePedData.expressions) do
                SetCharExpression(CachePed, ExpressionsHashes[k], v)
            end
            UpdatePedVariation(CachePed)
        end
    end
end)

RegisterNUICallback("SkinColourValue", function(data, cb)
    local item = tonumber(data.item)
    print("SkinColourValue triggered", item)
    PlaySound("SELECT", "HUD_SHOP_SOUNDSET")
    CachePedData.skintone  = item
    CachePedData.lowerbody = 1
    CachePedData.upperbody = 1
    CachePedData.head      = 1
    local SkinColor        = DefaultChar[CachePedData.gender][item]
    local legs             = tonumber("0x" .. SkinColor.Legs[CachePedData.lowerbody])
    local bodyType         = tonumber("0x" .. SkinColor.Body[CachePedData.upperbody])
    local heads            = tonumber("0x" .. SkinColor.Heads[CachePedData.head])
    local headtexture      = joaat(SkinColor.HeadTexture[1])
    local albedo           = texture_types[CachePedData.gender].albedo
    IsPedReadyToRender(CachePed)
    ApplyShopItemToPed(heads, CachePed)
    ApplyShopItemToPed(bodyType, CachePed)
    ApplyShopItemToPed(legs, CachePed)
    Citizen.InvokeNative(0xC5E7204F322E49EB, albedo, headtexture, 0x7FC5B1E1)
    UpdatePedVariation(CachePed)
end)


RegisterNUICallback("EyeColourValue", function(data, cb)
    local item = tonumber(data.item)
    print("EyeColourValue triggered")

    if processingcam == true then
        PlaySound("UNAFFORDABLE", "Ledger_Sounds")
    else
        PlaySound("SELECT", "HUD_SHOP_SOUNDSET")
        if camOnHead == false then
            camOnHead = true
            processingcam = true
            MoveCam("head")
            DisplayPins = false
            Wait(1000)
            processingcam = false
        end
        eyesanim = true
        if not HasAnimDictLoaded("FACE_HUMAN@GEN_MALE@BASE") then
            RequestAnimDict("FACE_HUMAN@GEN_MALE@BASE")
            repeat Wait(0) until HasAnimDictLoaded("FACE_HUMAN@GEN_MALE@BASE")
        end

        if not IsEntityPlayingAnim(CachePed, "FACE_HUMAN@GEN_MALE@BASE", "mood_normal_eyes_wide", 1) then
            TaskPlayAnim(CachePed, "FACE_HUMAN@GEN_MALE@BASE", "mood_normal_eyes_wide", 1.0, -1.0, -1, 16, 0.0, false, 0,
                false, "", false)
        end
        IsPedReadyToRender(CachePed)
        ApplyShopItemToPed(Eyes[CachePedData.gender][item], CachePed)
        UpdatePedVariation(CachePed)
        CachePedData.eyes = item
    end
end)

RegisterNUICallback("CancelApparenceEdition", function(data, cb)
    print("CancelApparenceEdition triggered")
    PlaySound("BACK", "HUD_SHOP_SOUNDSET")
    processingcam = false
    camOnHead = false
    teethanim = false
    eyesanim = false
    ClearPedTasks(CachePed)
    DisplayPins = false
    SendNUIMessage(
        {
            type = "hideEditApparenceMenu",
        }
    )
    MoveCam("base")
    Wait(1200)
    SendNUIMessage(
        {
            type = "showCharGlobalMenu",
        }
    )
end)

RegisterNUICallback("resetApparenceEdition", function(data, cb)
    print("resetApparenceEdition triggered")
    PlaySound("BACK", "HUD_SHOP_SOUNDSET")
    CachePedData = deepcopy(DefaultCachePedData)
    ApplyCachePedDataToPedPlayer()
end)




RegisterNUICallback("UndressApparenceEdition", function(data, cb)
    print("UndressApparenceEdition triggered")
    if CachePedData.pedmodel.model == "mp_male" or CachePedData.pedmodel.model == "mp_female" then
        RemoveAllClothesExceptEssentials(CachePed)
        PlaySound("Select", "HUD_SHOP_SOUNDSET")
    else
        PlaySound("UNAFFORDABLE", "Ledger_Sounds")
    end
end)


--- Callback for char selection
local SelectedChar = nil
RegisterNUICallback("selectedChar", function(data, cb)
    SendNUIMessage(
        {
            type = "hideSelectCharMenu",
        }
    )
    PlaySound("Select", "HUD_SHOP_SOUNDSET")
    local pinId = data.pinId
    local pinName = data.pinName
    print("selectedChar triggered", pinId, pinName)
    SelectedChar = pinId
    print("ped", charselectpeds[pinId])
    MoveCam("selected", nil, nil, charselectpeds[pinId])
    -- MoveCam("selectedped",  {
    --         coords = GetCamCoord(ActualCamera),
    --         target = GetOffsetFromEntityInWorldCoords(charselectpeds[pinId], 0.2, 0.0, 0.2),
    --         fov = 10.0
    --     }, false, charselectpeds[pinId])
    local charinfo = PlayerInfo[SelectedChar]
    local charsex = "Female"
    if PlayerSex[SelectedChar] == 1 then charsex = "Male" end
    local charadata = {
        name = charinfo.firstname .. " " .. charinfo.lastname,
        CharacterSex = charsex,
        lore = charinfo.informations.lore or "No lore",
        DayBirth = charinfo.informations.birthday or 1,
        MonthBirth = charinfo.informations.birthmonth or 1,
        YearBirth = charinfo.informations.birthyear or 2000,
    }
    SendNUIMessage(
        {
            type = "openSelectedCharMenu",
            selectedDataChar = charadata,

        }
    )
end)

RegisterNUICallback("PlaySelectedChar", function(data, cb)
    print("PlaySelectedChar triggered", SelectedChar)
    PlaySound("SELECT", "HUD_SHOP_SOUNDSET")
    TriggerEvent("murphy_creator:PlaySelectedChar", SelectedChar)
    for k, v in pairs(charselectpeds) do
        if DoesEntityExist(v) then
            DeleteEntity(v)
        end
    end
    SendNUIMessage(
        {
            type = "hideSelectedCharMenu",
        }
    )
    SendNUIMessage(
        {
            type = "hideSelectCharMenu",
        }
    )
    SetNuiFocus(false, false)
end)

RegisterNUICallback("DeleteSelectedChar", function(data, cb)
    print("DeleteSelectedChar triggered")
    PlaySound("SELECT", "HUD_SHOP_SOUNDSET")
    for k, v in pairs(charselectpeds) do
        if DoesEntityExist(v) then
            DeleteEntity(v)
        end
    end
    SendNUIMessage(
        {
            type = "hideSelectedCharMenu",
        }
    )
    print("SelectedChar", SelectedChar)
    TriggerServerEvent("murphy_creator:deleteCharacter", SelectedChar)
end)

RegisterNUICallback("CancelSelectedChar", function(data, cb)
    print("CancelSelectedChar triggered")
    PlaySound("BACK", "HUD_SHOP_SOUNDSET")
    MoveCam("charselect",
        {
            coords = DecorSettings.charselectcam.coords,
            target = DecorSettings.charselectcam.target,
            fov = DecorSettings
                .charselectcam.fov
        }, false)
    SendNUIMessage(
        {
            type = "hideSelectedCharMenu",
        }
    )
    Wait(1000)
    SendNUIMessage(
        {
            type = "openSelectCharMenu",
            pinsSelectChar = headsonscreen,
        }
    )
end)

RegisterNUICallback("createNewChar", function(data, cb)
    print("createNewChar triggered")
    SendNUIMessage(
        {
            type = "hideSelectCharMenu",
        }
    )
    TriggerEvent("murphy_creator:LaunchCreator")
    TriggerEvent("murphy_clothing:ResetClothesMenuCreator")
    PlaySound("Select", "HUD_SHOP_SOUNDSET")
end)
