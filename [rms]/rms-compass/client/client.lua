local RSGCore = exports['rsg-core']:GetCoreObject()
local hasCompass = false
local showUI = true -- Default ON
local debugMode = false

local function DebugPrint(msg)
    if debugMode then
        print("[Minimap] "..msg)
    end
end

-- Check for compass in inventory
local function CheckForCompass()
    local playerData = RSGCore.Functions.GetPlayerData()
    hasCompass = false
    if playerData and playerData.items then
        for _, item in pairs(playerData.items) do
            if item.name == "compass" then
                hasCompass = true
                break
            end
        end
    end
    DebugPrint("Compass Check: "..tostring(hasCompass))
end

-- Update minimap based on current state
local function UpdateMinimap()
    if hasCompass and showUI then
        -- Show radar/minimap
        DisplayRadar(true)
        Citizen.InvokeNative(0xE67C6DFD386EA5E7, true) -- _DISPLAY_HUD_COMPONENT_THIS_FRAME (hud component 1 = minimap)
        Citizen.InvokeNative(0x2B4C56F4D01211B1, 1) -- _SET_RADAR_ZOOM_LEVEL_THIS_FRAME to default zoom level
        DebugPrint("Compass ON - minimap shown")
    else
        -- Hide radar/minimap
        DisplayRadar(false)
        DebugPrint("Compass OFF - minimap hidden")
    end
end

-- Toggle compass UI
local function ToggleCompass()
    if not hasCompass then
        RSGCore.Functions.Notify("You don't have a compass!")
        return
    end

    showUI = not showUI
    if showUI then
        RSGCore.Functions.Notify("Compass enabled", "success")
    else
        RSGCore.Functions.Notify("Compass disabled")
    end
    UpdateMinimap()
end

-- Listen for usable item event from server
RegisterNetEvent("rsg-compass:toggleCompass", function()
    ToggleCompass()
end)

-- Check compass on player load and inventory update
RegisterNetEvent('RSGCore:Client:OnPlayerLoaded', function()
    CheckForCompass()
    UpdateMinimap()
end)

RegisterNetEvent('RSGCore:Player:SetPlayerData', function()
    CheckForCompass()
    UpdateMinimap()
end)



local hardHat = nil
local minerLight = nil

RegisterCommand("equipminer", function()
    local ped = PlayerPedId()

    -- Load models
    local hardHatModel = GetHashKey("p_hardhat_01x")
    local lightModel = GetHashKey("p_minerlight_01x")

    RequestModel(hardHatModel)
    while not HasModelLoaded(hardHatModel) do Wait(10) end

    RequestModel(lightModel)
    while not HasModelLoaded(lightModel) do Wait(10) end

    -- Create and attach hard hat
    hardHat = CreateObject(hardHatModel, 1.0, 1.0, 1.0, true, true, true)
    AttachEntityToEntity(hardHat, ped, GetPedBoneIndex(ped, 0x796e), 0.0, 0.02, 0.03, 0.0, 0.0, 180.0, true, true, false, true, 1, true)

    -- Create and attach miner light
    minerLight = CreateObject(lightModel, 1.0, 1.0, 1.0, true, true, true)
    AttachEntityToEntity(minerLight, ped, GetPedBoneIndex(ped, 0x796e), 0.02, 0.03, 0.05, 0.0, 0.0, 180.0, true, true, false, true, 1, true)

    TriggerEvent("ox_lib:notify", { description = "Miner outfit equipped!", type = "success" })
end)

RegisterCommand("removeminer", function()
    if hardHat then DeleteEntity(hardHat) hardHat = nil end
    if minerLight then DeleteEntity(minerLight) minerLight = nil end
    TriggerEvent("ox_lib:notify", { description = "Miner outfit removed!", type = "error" })
end)
