
if Config.DevMode then
    Citizen.CreateThread(function()
        while true do
            Wait(0)
            if IsRawKeyPressed(0x72) then -- F2
            print ("F2 Pressed")
                -- TriggerEvent("murphy_creator:LaunchCharSelect")
                -- TriggerEvent("murphy_creator:LaunchCreator")
                TriggerServerEvent("murphy_creator:getCharacters")
            end
        end
    end)
end

local charselectpeds = {}
-- RegisterNetEvent("murphy_creator:LaunchCharSelect", function()
--     local headsonscreen = {}
--     local id = 0
    
-- end)

RegisterNetEvent("murphy_creator:OpenCharSelect", function()
    TriggerServerEvent("murphy_creator:getCharacters")
end)

RegisterNetEvent("murphy_creator:LaunchCreator", function()
    FreezeEntityPosition(PlayerPedId(), false)
    local selectedgender = "female"
    if CachePedData.gender == "Male" then selectedgender = "male" end
    for k, v in pairs(MURPHY_ASSETS[selectedgender]) do
        if hairstyleCache[k] == nil then
            hairstyleCache[k] = {}
            hairstyleCache[k].model = 0
            hairstyleCache[k].texture = 0
        end
    end

    overlay_all_layers = deepcopy(baseoverlay)


    local model = "mp_male"
    local coords = vector3(-2785.515, -3058.224, -13.34043)
    local heading = 349.0
    -- RequestModel(GetHashKey(model))
    -- while not HasModelLoaded(GetHashKey(model)) do
    --     Wait(1)
    -- end
    -- SetPlayerModel(PlayerId(), GetHashKey(model))
    -- local entity = CreatePed_2(GetHashKey(model), 0.0,0.0,0.0, 0.0, false, true)
    -- repeat
    --     Wait(1)
    -- until DoesEntityExist(entity)
    Wait(10) 
    -- EquipMetaPedOutfitPreset(CachePed, 3, false)
    
    
    SetEntityCoords(CachePed, coords)
    SetEntityHeading(CachePed, heading)

    DisplayRadar(false)
    Wait(200)
    ApplyCachePedDataToPedPlayer()
    RemoveAllClothesExceptEssentials(CachePed)
    Light()
    MoveCam("default")
    SetNuiFocus(true, true)
    SendNUIMessage(
        {
            type = "showCharGlobalMenu",
        }
    )

   
end)

RegisterCommand(Config.LoadSkinCommand, function (source, args, raw)
    TriggerEvent("murphy_creator:loadskin")
end)

AddEventHandler("onResourceStop", function(resource)
    if resource == GetCurrentResourceName() then
        for k, v in pairs(charselectpeds) do
            if DoesEntityExist(v) then
                DeleteEntity(v)
            end
        end
    end
end)