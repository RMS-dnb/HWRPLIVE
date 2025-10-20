if Config.framework == "REDEMRP2k23" then
    PlayerSkins = {}
    PlayerClothes = {}
    PlayerSex = {}
    PlayerInfo = {}
    PlayerCreatorData = {}
    charselectpeds = {}
    headsonscreen = {}
    PedAccess = false
    RegisterNetEvent('murphy_creator:LaunchCharSelect', function(characters, skins, clothes, pedperm, slots)
        headsonscreen = {}
        PlayerSkins = {}
        PlayerClothes = {}
        PlayerSex = {}
        PlayerInfo = {}
        PlayerCreatorData = {}
        charselectpeds = {}
        ActiveCam = 0
        currentCamDestionation = ""
        camCoords = false
        baseHeading = false
        rotatePedIndex = 0
        PedAccess = pedperm
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
        for k, v in ipairs(characters) do
            PlayerSkins[v.characterid] = FindCharacterSkin(skins, v.characterid)
            PlayerSex[v.characterid] = PlayerSkins[v.characterid].sex
            PlayerClothes[v.characterid] = FindCharacterClothes(clothes, v.characterid)
            PlayerInfo[v.characterid] = {
                firstname = v.firstname,
                lastname = v.lastname,
                characterid = v.characterid,
                informations =
                    v.informations,
                charid = v.citizenid,
            }
            PlayerCreatorData[v.characterid] = v.peddata
        end
        local remainingslots = slots
        print("Remaining slots: " .. remainingslots)
        for index, v in pairs(DecorSettings.pedslots) do
            if remainingslots > 0 then
                remainingslots = remainingslots - 1
            else
                break
            end
            local coords = v.coords
            local heading = v.heading
            local ped
            if PlayerInfo[index] then
                if next(PlayerCreatorData[index]) ~= nil then
                    local model = GetHashKey(PlayerCreatorData[index].pedmodel.model)
                    RequestModel(model)
                    while not HasModelLoaded(model) do
                        Wait(100)
                    end
                    characters[index] = CreatePed_2(model, 0.0, 0.0, 0.0, 0.0, false, true)
                    while not DoesEntityExist(characters[index]) do
                        Wait(100)
                    end
                    ped = characters[index]
                    if PlayerCreatorData[index].pedmodel.model ~= "mp_female" and PlayerCreatorData[index].pedmodel.model ~= "mp_male" then
                        EquipMetaPedOutfitPreset(ped, PlayerCreatorData[index].pedmodel.outfit, false)
                    end

                    charselectpeds[PlayerInfo[index].characterid] = ped
                    SetEntityCoords(ped, coords)
                    SetEntityHeading(ped, heading)
                    print("Characters[" .. index .. "] spawned")
                    NetworkSetEntityInvisibleToNetwork(ped, true)
                    SetEntityAsMissionEntity(ped, true, true)
                    Citizen.InvokeNative(0x283978A15512B2FE, ped, true)
                    SetEntityInvincible(ped, true)
                    SetEntityCanBeDamagedByRelationshipGroup(ped, false, GetHashKey("PLAYER"))
                    RemoveHairsAndBeards(ped)
                    ApplyCachePedDataToPed(ped, PlayerCreatorData[index], PlayerInfo[index].charid)
                else
                    local model = GetHashKey("mp_female")
                    if PlayerSex[index] == 1 then
                        model = GetHashKey("mp_male")
                    end
                    RequestModel(model)
                    while not HasModelLoaded(model) do
                        Wait(100)
                    end
                    characters[index] = CreatePed_2(model, 0.0, 0.0, 0.0, 0.0, false, true)
                    while not DoesEntityExist(characters[index]) do
                        Wait(100)
                    end
                    ped = characters[index]
                    charselectpeds[PlayerInfo[index].characterid] = ped
                    SetEntityCoords(ped, coords)
                    SetEntityHeading(ped, heading)
                    print("Characters[" .. index .. "] spawned")
                    NetworkSetEntityInvisibleToNetwork(ped, true)
                    SetEntityAsMissionEntity(ped, true, true)
                    Citizen.InvokeNative(0x283978A15512B2FE, ped, true)
                    SetEntityInvincible(ped, true)
                    SetEntityCanBeDamagedByRelationshipGroup(ped, false, GetHashKey("PLAYER"))
                    TriggerEvent("RedEM:client:ApplySkin", PlayerSkins[index], ped, PlayerClothes[index])
                end
                -- FreezeEntityPosition(ped, true)
                if v.scenario then
                    TaskStartScenarioInPlace(ped, v.scenario, -1, false)
                end
                if v.scenariopoint then
                    local scenario_coords
                    local DataStruct = DataView.ArrayBuffer(256 * 4)
                    local is_data_exists = Citizen.InvokeNative(0x345EC3B7EBDE1CB5, GetEntityCoords(ped), 1.5,
                        DataStruct:Buffer(), 10)
                    if is_data_exists ~= false then
                        for i = 1, is_data_exists, 1 do
                            local scenario = DataStruct:GetInt32(8 * i)
                            local hash = GetScenarioPointType(scenario)
                            print("Scenario Hash: " .. hash)
                            if v.scenariopoint == hash then
                                TaskUseScenarioPoint(ped, scenario, 0, 0, false);
                            end
                        end
                    end
                end
                Wait(1000)
                local headCoords = GetPedBoneCoords(ped, 21030, 0.0, 0.0, 0.0)
                local retval, headx, heady = GetScreenCoordFromWorldCoord(headCoords.x, headCoords.y,
                    headCoords.z + 0.2)
                table.insert(headsonscreen, {
                    id = PlayerInfo[index].characterid,
                    name = PlayerInfo[index].firstname .. " " .. PlayerInfo[index].lastname,
                    ExistingChar = true,
                    startPosition = {
                        x = headx,
                        y = heady
                    }
                })
            else
                if ped == nil then
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
                    characters[index] = CreatePed_2(model, 0.0, 0.0, 0.0, 0.0, false, true)
                    while not DoesEntityExist(characters[index]) do
                        Wait(100)
                    end
                    local ped = characters[index]

                    SetEntityCoords(ped, coords)
                    SetEntityHeading(ped, heading)
                    charselectpeds["new" .. index] = ped
                    print("Characters[" .. index .. "] spawned")
                    NetworkSetEntityInvisibleToNetwork(ped, true)
                    SetEntityAsMissionEntity(ped, true, true)
                    Citizen.InvokeNative(0x283978A15512B2FE, ped, true)
                    SetEntityInvincible(ped, true)
                    SetEntityCanBeDamagedByRelationshipGroup(ped, false, GetHashKey("PLAYER"))
                    EquipMetaPedOutfitPreset(ped, 3, false)
                    -- FreezeEntityPosition(ped, true)
                    SetEntityAlpha(ped, 150, false)
                    if v.scenario then
                        TaskStartScenarioInPlace(ped, v.scenario, -1, false)
                    end
                    if v.scenariopoint then
                        local scenario_coords
                        local DataStruct = DataView.ArrayBuffer(256 * 4)
                        local is_data_exists = Citizen.InvokeNative(0x345EC3B7EBDE1CB5, GetEntityCoords(ped), 1.5,
                            DataStruct:Buffer(), 10)
                        if is_data_exists ~= false then
                            for i = 1, is_data_exists, 1 do
                                local scenario = DataStruct:GetInt32(8 * i)
                                local hash = GetScenarioPointType(scenario)
                                print("Scenario Hash: " .. hash)
                                if v.scenariopoint == hash then
                                    TaskUseScenarioPoint(ped, scenario, 0, 0, false);
                                end
                            end
                        end
                    end
                    Wait(1000)
                    local headCoords = GetPedBoneCoords(ped, 21030, 0.0, 0.0, 0.0)
                    local retval, headx, heady = GetScreenCoordFromWorldCoord(headCoords.x, headCoords.y,
                        headCoords.z + 0.2)
                    table.insert(headsonscreen, {
                        id = index,
                        name = "None",
                        ExistingChar = false,
                        startPosition = {
                            x = headx,
                            y = heady
                        }
                    })
                end
            end
        end
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
        TriggerServerEvent("redemrp:selectCharacter", id)
        TriggerEvent("redemrp_charselect:removeLoadingScreen")
        TriggerServerEvent("murphy_creator:RemovePlayerFromInstance")
        Wait(2000)
        TriggerEvent("murphy_creator:loadskin")
    end)

    RegisterNetEvent('redemrp_charselect:client:FinishSelection')
    AddEventHandler('redemrp_charselect:client:FinishSelection', function()
        TriggerEvent("redemrp_charselect:removeLoadingScreen")
        Wait(2000)
        print("Loading skin")
        TriggerEvent("murphy_creator:loadskin")
        TriggerServerEvent("murphy_creator:RemovePlayerFromInstance")
    end)

    RegisterNetEvent('redemrp_respawn:client:Revived')
    AddEventHandler('redemrp_respawn:client:Revived', function()
        print("Loading skin")
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
            local stam = GetPedStamina(PlayerPedId())              -- Get stamina value

            if next(CachePedData) == nil then
                --- If no data in murphy_creator, load default skin for framework
                print("No skin data in murphy_creator")
                TriggerServerEvent("RedEM:server:LoadSkin", true)
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
            Citizen.InvokeNative(0xA9EC16C7, PlayerId(), stam)                              -- SetPlayerStamina & GetPlayerMaxStamina
            Citizen.InvokeNative(0x675680D089BFA21F, PlayerPedId(), stam)
        end)
    end)

    function FindCharacterClothes(clothes, charid)
        for k, v in ipairs(clothes) do
            if v.charid == charid then
                print("Identity Clothes Found")
                return json.decode(v.clothes)
            end
        end
        return {}
    end

    function FindCharacterSkin(skins, charid)
        for k, v in ipairs(skins) do
            if v.charid == charid then
                print("Identity SKIN Found")
                return json.decode(v.skin)
            end
        end
        return {}
    end

    AddEventHandler("onResourceStop", function(resource)
        if resource == GetCurrentResourceName() then
            for k, v in pairs(charselectpeds) do
                if DoesEntityExist(v) then
                    DeleteEntity(v)
                end
            end
        end
    end)
end
