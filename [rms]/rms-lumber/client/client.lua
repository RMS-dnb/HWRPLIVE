local RSGCore = exports['rsg-core']:GetCoreObject()

local CutPrompt
local active = false
local tool
local metadata = {}
local hastool = false
local cutSpot
local tree
local Cut = {}
local ChoppedTrees = {}
local lastChopTime = 0 -- 3-second swing cooldown
local chopCooldown = 3000 

local LumberGroup = GetRandomIntInRange(0, 0xffffff)

-- Helper functions
local function contains(table, element)
    if table ~= 0 then
        for k, v in pairs(table) do
            if v == element then
                return true
            end
        end
    end
    return false
end

local function GetArrayKey(array, value)
    for k,v in pairs(array) do
        if v == value then
            return k
        end
    end
end

local function StartSpotCooldown()
    Citizen.CreateThread(function()
        if not cutSpot then
            local treeStored = tree
            Citizen.Wait(Config.TreeTimeout)
            table.remove(ChoppedTrees, GetArrayKey(ChoppedTrees, treeStored))
        else
            local trackedSpot = cutSpot
            table.insert(Cut, trackedSpot)
            Citizen.Wait(trackedSpot.timeout)
            table.remove(Cut, GetArrayKey(Cut, trackedSpot))
        end
    end)
end

local function FPrompt(text, button, hold)
    Citizen.CreateThread(function()
        PropPrompt = nil
        local str = text or "Put Away"
        local buttonhash = button or Config.StopCuttingKey
        local holdbutton = hold or false
        PropPrompt = PromptRegisterBegin()
        PromptSetControlAction(PropPrompt, buttonhash)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(PropPrompt, str)
        PromptSetEnabled(PropPrompt, false)
        PromptSetVisible(PropPrompt, false)
        PromptSetGroup(PropPrompt, LumberGroup)
        PromptSetHoldMode(PropPrompt, holdbutton)
        PromptRegisterEnd(PropPrompt)
    end)
end

local function LMPrompt(text, button)
    Citizen.CreateThread(function()
        UsePrompt = nil
        local str = text or "Use"
        local buttonhash = button or Config.CutTreeKey
        UsePrompt = PromptRegisterBegin()
        PromptSetControlAction(UsePrompt, buttonhash)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(UsePrompt, str)
        PromptSetEnabled(UsePrompt, false)
        PromptSetVisible(UsePrompt, false)
        PromptSetGroup(UsePrompt, LumberGroup)
        PromptRegisterEnd(UsePrompt)
    end)
end

local function Anim(actor, dict, body, duration, flags, introtiming, exittiming)
    Citizen.CreateThread(function()
        RequestAnimDict(dict)
        local dur = duration or -1
        local flag = flags or 1
        local intro = tonumber(introtiming) or 1.0
        local exit = tonumber(exittiming) or 1.0
        while (not HasAnimDictLoaded(dict)) do
            Citizen.Wait(10)
        end
        TaskPlayAnim(actor, dict, body, intro, exit, dur, flag, 1, false, false, false)
    end)
end

local function Chop()
    Citizen.CreateThread(function()
        local str = 'Chop'
        CutPrompt = Citizen.InvokeNative(0x04F97DE45A519419)
        PromptSetControlAction(CutPrompt, Config.CutPromptKey)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(CutPrompt, str)
        PromptSetEnabled(CutPrompt, true)
        PromptSetVisible(CutPrompt, true)
        PromptSetHoldMode(CutPrompt, true)
        PromptSetGroup(CutPrompt, LumberGroup)
        PromptRegisterEnd(CutPrompt)
    end)
end

local function EquipTool()
    hastool = true
    SetCurrentPedWeapon(PlayerPedId(), `WEAPON_UNARMED`, true)
    if tool then
        DeleteEntity(tool)
    end
    Wait(500)
    local ped = PlayerPedId()
    Citizen.InvokeNative(0x89F5E7ADECCCB49C, ped, "carry_pitchfork")
    Citizen.InvokeNative(0x2208438012482A1A, ped, true, true)
    ForceEntityAiAndAnimationUpdate(ped, true)
    Citizen.InvokeNative(0x3A50753042B6891B, ped, "PITCH_FORKS")
    Wait(50)
    tool = CreateObject(joaat("p_axe02x"), GetOffsetFromEntityInWorldCoords(ped, 0.0, 0.0, 0.0), true, true, true)
    AttachEntityToEntity(tool, ped, GetPedBoneIndex(ped, 7966), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 2, 1, 0, 0)
    Wait(500)
end

local function UnequipTool()
    local ped = PlayerPedId()
    DeleteObject(tool)
    hastool = false
    Citizen.InvokeNative(0x89F5E7ADECCCB49C, ped, "normal")
    Citizen.InvokeNative(0x2208438012482A1A, ped, true, true)
    ForceEntityAiAndAnimationUpdate(ped, true)
    ClearPedTasks(ped)
end

local function goChop()
    active = true
    local swing = 0
    local swingcount = math.random(Config.MinSwing, Config.MaxSwing)
    local ped = PlayerPedId()
    PromptSetEnabled(PropPrompt, true)
    PromptSetVisible(PropPrompt, true)
    PromptSetEnabled(UsePrompt, true)
    PromptSetVisible(UsePrompt, true)
    PromptSetVisible(CutPrompt, false)
    while active do
        local LumberGroupName = CreateVarString(10, 'LITERAL_STRING', Config.PromptGroupName)
        PromptSetActiveGroupThisFrame(LumberGroup, LumberGroupName)
        FreezeEntityPosition(PlayerPedId(), true)
        if IsPedDeadOrDying(PlayerPedId(), true) then
            swing = 0
            active = false
            StartSpotCooldown()
            UnequipTool()
        elseif IsControlJustPressed(0, Config.CutTreeKey) then
            local currentTime = GetGameTimer()
            if currentTime - lastChopTime >= chopCooldown then
                lastChopTime = currentTime
                swing = swing + 1
                Anim(ped, "amb_work@world_human_tree_chop_new@working@pre_swing@male_a@trans", "pre_swing_trans_after_swing", -1, 0)
                if Config.UseMinigame then
                    local testplayer = exports["syn_minigame"]:taskBar(math.random(Config.maxDifficulty, Config.minDifficulty), 7)
                    if testplayer == 100 then
                        TriggerServerEvent('BGS_Lumber:addItem', cutSpot)
                    end
                else
                    TriggerServerEvent('BGS_Lumber:addItem', cutSpot)
                end
                Wait(500)
            end
        elseif IsControlJustPressed(0, Config.StopCuttingKey) then
            active = false
            StartSpotCooldown()
            UnequipTool()
            Wait(500)
        end

        if swing == swingcount then
            swing = 0
            active = false
            StartSpotCooldown()
        end
        Wait(1)
    end
    PromptSetEnabled(PropPrompt, false)
    PromptSetVisible(PropPrompt, false)
    PromptSetEnabled(UsePrompt, false)
    PromptSetVisible(UsePrompt, false)
    PromptSetVisible(CutPrompt, true)
    FreezeEntityPosition(PlayerPedId(), false)
end

-- Draw markers
CreateThread(function()
    while true do
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        local sleep = 1000
        if hastool and Config.CuttingLocations and type(Config.CuttingLocations) == "table" then
            for _, v in pairs(Config.CuttingLocations) do
                if v.showmarker and v.coords and GetDistanceBetweenCoords(coords, v.coords, true) < 100 then
                    sleep = 0
                    DrawMarker(1, v.coords.x, v.coords.y, v.coords.z - 0.75, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 215, 0, 155, false, false, 2, false, nil, nil, false)
                end
            end
        end
        Wait(sleep)
    end
end)

-- Chopping locations
CreateThread(function()
    FPrompt()
    LMPrompt("Swing", Config.CutTreeKey)
    Chop()
    while true do
        local sleep = 1000
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        if Config.UseCuttingLocations and hastool and Config.CuttingLocations then
            sleep = 0
            for _, v in pairs(Config.CuttingLocations) do
                if v.coords then
                    local LumberGroupName = CreateVarString(10, 'LITERAL_STRING', Config.PromptGroupName)
                    if GetDistanceBetweenCoords(coords, v.coords) < 1.0 and not active and not contains(Cut, v) and not IsPedOnMount(ped) and not IsPedInAnyVehicle(ped) and not IsPedDeadOrDying(ped) then
                        PromptSetActiveGroupThisFrame(LumberGroup, LumberGroupName)
                        PromptSetEnabled(CutPrompt, true)
                    elseif GetDistanceBetweenCoords(coords, v.coords) < 1.0 and not active and contains(Cut, v) then
                        PromptSetActiveGroupThisFrame(LumberGroup, LumberGroupName)
                        PromptSetEnabled(CutPrompt, false)
                    end
                    if PromptHasHoldModeCompleted(CutPrompt) and GetDistanceBetweenCoords(coords, v.coords) < 1.0 then
                        cutSpot = v
                        SetCurrentPedWeapon(PlayerPedId(), joaat("WEAPON_UNARMED"), true)
                        Citizen.Wait(500)
                        TriggerServerEvent("BGS_Lumber:axecheck", metadata)
                    end
                end
            end
        end
        Wait(sleep)
    end
end)

-- Tree detection
CreateThread(function()
    while true do
        local sleep = 1000
        if hastool then
            sleep = 0
            local itemSet = CreateItemset(true)
            local size = Citizen.InvokeNative(0x59B57C4B06531E1E, GetEntityCoords(PlayerPedId()), Config.MinimumDistance, itemSet, 3, Citizen.ResultAsInteger())
            if size > 0 then
                for index = 0, size do
                    local entity = GetIndexedItemInItemset(index, itemSet)
                    local coords = GetEntityCoords(entity)
                    local model_hash = GetEntityModel(entity)
                    for _, v in ipairs(Config.Trees) do
                        local pedCoords = GetEntityCoords(PlayerPedId())
                        while joaat(v.model) == model_hash and not contains(ChoppedTrees, coords) and GetDistanceBetweenCoords(pedCoords, coords) < Config.MinimumDistance do
                            Wait(1)
                            pedCoords = GetEntityCoords(PlayerPedId())
                            local LumberGroupName = CreateVarString(10, 'LITERAL_STRING', Config.PromptGroupName)
                            PromptSetActiveGroupThisFrame(LumberGroup, LumberGroupName)
                            PromptSetEnabled(CutPrompt, true)
                            if PromptHasHoldModeCompleted(CutPrompt) then
                                cutSpot = false
                                tree = coords
                                table.insert(ChoppedTrees, tree)
                                SetCurrentPedWeapon(PlayerPedId(), joaat("WEAPON_UNARMED"), true)
                                Citizen.Wait(500)
                                TriggerServerEvent("BGS_Lumber:axecheck", metadata)
                            end
                        end
                        while joaat(v.model) == model_hash and contains(ChoppedTrees, coords) and GetDistanceBetweenCoords(pedCoords, coords) < Config.MinimumDistance do
                            Wait(1)
                            pedCoords = GetEntityCoords(PlayerPedId())
                            local LumberGroupName = CreateVarString(10, 'LITERAL_STRING', Config.PromptGroupName)
                            PromptSetActiveGroupThisFrame(LumberGroup, LumberGroupName)
                            PromptSetEnabled(CutPrompt, false)
                        end
                    end
                end
            end
            if IsItemsetValid(itemSet) then
                DestroyItemset(itemSet)
            end
        end
        Wait(sleep)
    end
end)

-- Disable controls while holding axe
CreateThread(function()
    while true do
        local sleep = 1000
        if hastool then
            sleep = 0
            DisableControlAction(0, 0x07CE1E61, false)
            DisableControlAction(0, 0xB2F377E8, false)
            DisableControlAction(0, 0xADEAF48C, false)
            Citizen.InvokeNative(0xFCCC886EDE3C63EC, PlayerPedId(), 2, true)
        end
        Wait(sleep)
    end
end)

-- Item check
CreateThread(function()
    while true do
        Wait(1000)
        if hastool then
            TriggerServerEvent("BGS_Lumber:CountCheck")
        end
    end
end)

-- Event handlers
RegisterNetEvent('BGS_Lumber:AttachAxe')
AddEventHandler('BGS_Lumber:AttachAxe', function(meta)
    if not hastool then
        EquipTool()
    else
        UnequipTool()
    end
    metadata = meta
end)

RegisterNetEvent('BGS_Lumber:RemoveAxe')
AddEventHandler('BGS_Lumber:RemoveAxe', function()
    UnequipTool()
end)

RegisterNetEvent("BGS_Lumber:axechecked")
AddEventHandler("BGS_Lumber:axechecked", function(meta, broken)
    metadata = meta
    if broken then
        RSGCore.Functions.Notify("Your axe broke!", "error")
        UnequipTool()
    else
        goChop()
    end
end)
