local RSGCore = exports['rsg-core']:GetCoreObject()

local MinePrompt
local active = false
local tool
local metadata = {}
local hastool = false
local mineSpot
local Mined = {}
local isSwinging = false -- Add swing state tracking
local swingCooldown = false -- Add cooldown tracking

local RockGroup = GetRandomIntInRange(0, 0xffffff)

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

local function FPrompt(text, button, hold)
    Citizen.CreateThread(function()
        PropPrompt = nil
        local str = text or "Put Away"
        local buttonhash = button or Config.StopMiningKey
        local holdbutton = hold or false
        PropPrompt = PromptRegisterBegin()
        PromptSetControlAction(PropPrompt, buttonhash)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(PropPrompt, str)
        PromptSetEnabled(PropPrompt, false)
        PromptSetVisible(PropPrompt, false)
        PromptSetGroup(PropPrompt, RockGroup)
        PromptSetHoldMode(PropPrompt, holdbutton)
        PromptRegisterEnd(PropPrompt)
    end)
end

local function LMPrompt(text, button)
    Citizen.CreateThread(function()
        UsePrompt = nil
        local str = text or "Use"
        local buttonhash = button or Config.MineKey
        UsePrompt = PromptRegisterBegin()
        PromptSetControlAction(UsePrompt, buttonhash)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(UsePrompt, str)
        PromptSetEnabled(UsePrompt, false)
        PromptSetVisible(UsePrompt, false)
        PromptSetGroup(UsePrompt, RockGroup)
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

local function GetArrayKey(array, value)
    for k, v in pairs(array) do
        if v == value then
            return k
        end
    end
end

local function StartSpotCooldown(spot)
    if not spot or contains(Mined, spot) then return end
    table.insert(Mined, spot)
    Citizen.SetTimeout(spot.timeout, function()
        table.remove(Mined, GetArrayKey(Mined, spot))
    end)
end

local function Mine()
    Citizen.CreateThread(function()
        local str = Config.Language.MinePrompt
        MinePrompt = Citizen.InvokeNative(0x04F97DE45A519419)
        PromptSetControlAction(MinePrompt, Config.MinePromptKey)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(MinePrompt, str)
        PromptSetEnabled(MinePrompt, true)
        PromptSetVisible(MinePrompt, true)
        PromptSetHoldMode(MinePrompt, true)
        PromptSetGroup(MinePrompt, RockGroup)
        PromptRegisterEnd(MinePrompt)
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
    ForceEntityAiAndAnimationUpdate(tool, true)
    Citizen.InvokeNative(0x3A50753042B6891B, ped, "PITCH_FORKS")
    Wait(50)
    tool = CreateObject(joaat("p_pickaxe01x"), GetOffsetFromEntityInWorldCoords(ped, 0.0, 0.0, 0.0), true, true, true)
    AttachEntityToEntity(tool, ped, GetPedBoneIndex(ped, 7966), 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0, 0, 0, 0, 2, 1, 0, 0)
    Wait(500)
end

local function UnequipTool()
    local ped = PlayerPedId()
    DeleteObject(tool)
    hastool = false
    isSwinging = false -- Reset swing state
    swingCooldown = false -- Reset cooldown
    Citizen.InvokeNative(0x89F5E7ADECCCB49C, ped, "normal")
    Citizen.InvokeNative(0x2208438012482A1A, ped, true, true)
    ForceEntityAiAndAnimationUpdate(ped, true)
    ClearPedTasks(ped)
end

-- New function to handle swing completion
local function CompleteSwing()
    Citizen.CreateThread(function()
        -- Wait for animation to complete (adjust timing as needed)
        Wait(2000) -- 2 seconds for swing animation
        
        -- Only give reward if still mining and swing completed
        if active and isSwinging then
            if Config.UseMinigame then
                local randomizer = math.random(Config.maxDifficulty, Config.minDifficulty)
                local testplayer = exports["syn_minigame"]:taskBar(randomizer, 7)
                if testplayer == 100 then
                    TriggerServerEvent('BGS_Mining:addItem', mineSpot)
                end
            else
                TriggerServerEvent('BGS_Mining:addItem', mineSpot)
            end
        end
        
        -- Reset swing state and start cooldown
        isSwinging = false
        swingCooldown = true
        
        -- Cooldown period before next swing (adjust as needed)
        Wait(1000) -- 1 second cooldown
        swingCooldown = false
    end)
end

local function goMine()
    active = true
    local swing = 0
    local swingcount = math.random(Config.MinSwing, Config.MaxSwing)
    local ped = PlayerPedId()
    PromptSetEnabled(PropPrompt, true)
    PromptSetVisible(PropPrompt, true)
    PromptSetEnabled(UsePrompt, true)
    PromptSetVisible(UsePrompt, true)
    PromptSetVisible(MinePrompt, false)
    
    while active do
        local MiningGroupName = CreateVarString(10, 'LITERAL_STRING', Config.Language.PromptLabel)
        PromptSetActiveGroupThisFrame(RockGroup, MiningGroupName)
        FreezeEntityPosition(PlayerPedId(), true)
        
        if IsPedDeadOrDying(PlayerPedId(), true) then
            swing = 0
            active = false
            StartSpotCooldown(mineSpot)
            UnequipTool()
        elseif IsControlJustPressed(0, Config.MineKey) and not isSwinging and not swingCooldown then
            -- Only allow swing if not already swinging and not in cooldown
            isSwinging = true
            swing = swing + 1
            
            -- Play swing animation
            Anim(ped, 'amb_work@world_human_pickaxe_new@working@male_a@trans', 'pre_swing_trans_after_swing', -1, 0)
            
            -- Check if this is the last swing
            if swing >= swingcount then
                -- For the last swing, wait for completion before ending
                Citizen.CreateThread(function()
                    -- Start swing completion process
                    CompleteSwing()
                    -- Wait for the swing to complete before ending mining
                    Wait(3000) -- Wait for animation + reward processing
                    if active then -- Only end if still active
                        active = false
                        StartSpotCooldown(mineSpot)
                    end
                end)
            else
                -- Start swing completion process for non-final swings
                CompleteSwing()
            end
            
        elseif IsControlJustPressed(0, Config.StopMiningKey) then
            active = false
            StartSpotCooldown(mineSpot)
            UnequipTool()
            Wait(500)
        end

        Wait(1)
    end
    PromptSetEnabled(PropPrompt, false)
    PromptSetVisible(PropPrompt, false)
    PromptSetEnabled(UsePrompt, false)
    PromptSetVisible(UsePrompt, false)
    PromptSetVisible(MinePrompt, true)
    FreezeEntityPosition(PlayerPedId(), false)
end

-- Mining locations
CreateThread(function()
    FPrompt(Config.Language.StopPrompt)
    LMPrompt(Config.Language.SwingPrompt, Config.MineKey)
    Mine()
    while true do
        Wait(1)
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        if hastool then
            DisableControlAction(0, 0x07CE1E61, false)
            DisableControlAction(0, 0xB2F377E8, false)
            DisableControlAction(0, 0xADEAF48C, false)
            Citizen.InvokeNative(0xFCCC886EDE3C63EC, PlayerPedId(), 2, true)
            for mining, v in pairs(Config.MiningLocations) do
                local distance = #(coords - vector3(v.coords.x, v.coords.y, v.coords.z))
                if distance < 1.0 and not active and not contains(Mined, v) and not IsPedOnMount(ped) and not IsPedInAnyVehicle(ped) and not IsPedDeadOrDying(ped) then
                    local MiningGroupName = CreateVarString(10, 'LITERAL_STRING', Config.Language.PromptLabel)
                    PromptSetActiveGroupThisFrame(RockGroup, MiningGroupName)
                    PromptSetEnabled(MinePrompt, true)
                elseif distance < 1.0 and not active and contains(Mined, v) and not IsPedOnMount(ped) and not IsPedInAnyVehicle(ped) and not IsPedDeadOrDying(ped) then
                    local MiningGroupName = CreateVarString(10, 'LITERAL_STRING', Config.Language.PromptLabel)
                    PromptSetActiveGroupThisFrame(RockGroup, MiningGroupName)
                    PromptSetEnabled(MinePrompt, false)
                end
                if v.showmarker == true and distance < 100 then
                    Citizen.InvokeNative(0x2A32FAA57B937173, 0x07DCE236, v.coords.x, v.coords.y, v.coords.z - 1, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1.0, 1.0, 1.0, 255, 215, 0, 155, false, false, false, 1, false, false, false)
                end
                if PromptHasHoldModeCompleted(MinePrompt) and distance < 1.0 then
                    mineSpot = v
                    SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true, 0, false, false)
                    Citizen.Wait(500)
                    TriggerServerEvent("BGS_Mining:pickaxecheck", metadata)
                end
            end
        end
    end
end)

CreateThread(function()
    while true do
        Wait(1000)
        if hastool then
            TriggerServerEvent("BGS_Mining:CountCheck")
        end
    end
end)

RegisterNetEvent('BGS_Mining:AttachPickaxe')
AddEventHandler('BGS_Mining:AttachPickaxe', function(meta)
    if not hastool then
        EquipTool()
    else
        UnequipTool()
    end
    metadata = meta
end)

RegisterNetEvent('BGS_Mining:RemovePickaxe')
AddEventHandler('BGS_Mining:RemovePickaxe', function()
    UnequipTool()
end)

RegisterNetEvent("BGS_Mining:pickaxechecked")
AddEventHandler("BGS_Mining:pickaxechecked", function(meta, broken)
    metadata = meta
    if broken then
        exports.ox_lib:notify({
            title = 'Mining',
            description = 'Your pickaxe broke!',
            type = 'error',
            duration = 3000
        })
        UnequipTool()
    else
        goMine()
    end
end)

RegisterNetEvent("BGS_Mining:nopickaxe")
AddEventHandler("BGS_Mining:nopickaxe", function()
    active = false
end)