-- local RSGCore = exports['rsg-core']:GetCoreObject()
-- local WashPrompt, DrinkPrompt, FillCanteenPrompt, GoldpanPrompt
-- local RiverGroup = GetRandomIntInRange(0, 0xFFFFFF)
-- local isDrinking = false
-- local isFillingCanteen = false
-- local isGoldpanning = false -- Prevent goldpan spam
-- lib.locale()

-- -- Function to create prompts
-- local function CreatePrompt(actionKey, labelKey, group)
--     local prompt = Citizen.InvokeNative(0x04F97DE45A519419)
--     PromptSetControlAction(prompt, RSGCore.Shared.Keybinds[actionKey])
--     local str = CreateVarString(10, 'LITERAL_STRING', locale(labelKey))
--     PromptSetText(prompt, str)
--     PromptSetEnabled(prompt, true)
--     PromptSetVisible(prompt, true)
--     PromptSetHoldMode(prompt, true)
--     PromptSetGroup(prompt, group)
--     PromptRegisterEnd(prompt)
--     return prompt
-- end

-- LoadAnim = function(dic)
--     RequestAnimDict(dic)
--     while not HasAnimDictLoaded(dic) do
--         Wait(0)
--     end
-- end

-- -- Initialize Prompts
-- local function InitPrompts()
--     DrinkPrompt = CreatePrompt('Z', 'cl_drink', RiverGroup)
--     FillCanteenPrompt = CreatePrompt('G', 'cl_canteen_take_a', RiverGroup)
--     GoldpanPrompt = CreatePrompt('Q', 'cl_goldpan_take_f', RiverGroup)
-- end

-- CreateThread(function()
--     InitPrompts()

--     while true do
--         Wait(4)

--         -- Only allow prompts when crouching
--         if Config.Crouch then
--             local crouched = GetPedCrouchMovement(cache.ped)
--             if crouched == 0 then -- NOT crouching
--                 goto continue
--             end
--         end

--         local coords = GetEntityCoords(cache.ped)
--         local water = Citizen.InvokeNative(0x5BA7A68A346A5A91, coords.x + 3, coords.y + 3, coords.z)

--         for _, waterType in pairs(Config.WaterTypes) do
--             if water == waterType["waterhash"] and IsPedOnFoot(cache.ped) and IsEntityInWater(cache.ped) then

--                 local waterText = CreateVarString(10, 'LITERAL_STRING', waterType["name"])
--                 PromptSetActiveGroupThisFrame(RiverGroup, waterText)

--                 -- Drink Action
--                 if not isDrinking and PromptHasHoldModeCompleted(DrinkPrompt) then
--                     isDrinking = true
--                     TriggerEvent('rsg-river:client:drink')
--                     TriggerEvent('rex-farming:client:collectwater') -- optional water bucket logic

--                     Citizen.SetTimeout(3000, function()
--                         isDrinking = false
--                     end)
--                 end

--                 -- Fill Canteen
--                 if not isFillingCanteen and PromptHasHoldModeCompleted(FillCanteenPrompt) then
--                     isFillingCanteen = true
--                     TriggerEvent('rsg-waterpump:client:canteenfill')

--                     Citizen.SetTimeout(3000, function()
--                         isFillingCanteen = false
--                     end)
--                 end

--                 -- Goldpan Stones
--                 if not isGoldpanning and PromptHasHoldModeCompleted(GoldpanPrompt) then
--                     isGoldpanning = true
--                     TriggerEvent('rex-goldpanning:client:startgoldpanning')

--                     Citizen.SetTimeout(3000, function()
--                         isGoldpanning = false
--                     end)
--                 end
--             end
--         end

--         ::continue::
--     end
-- end)

local RSGCore = exports['rsg-core']:GetCoreObject()
local WashPrompt
local RiverGroup = GetRandomIntInRange(0, 0xFFFFFF)
local isWashing = false -- Prevent spam
lib.locale()

-- Wash Prompt
local function CreateWashPrompt(group)
    local prompt = Citizen.InvokeNative(0x04F97DE45A519419) -- PromptRegisterBegin
    PromptSetControlAction(prompt, RSGCore.Shared.Keybinds['ENTER'])
    local str = CreateVarString(10, 'LITERAL_STRING', "Wash")
    PromptSetText(prompt, str)
    PromptSetEnabled(prompt, true)
    PromptSetVisible(prompt, true)
    PromptSetHoldMode(prompt, true)
    PromptSetGroup(prompt, group)
    PromptRegisterEnd(prompt)
    return prompt
end

-- Load Animations
local function LoadAnim(dic)
    RequestAnimDict(dic)
    while not HasAnimDictLoaded(dic) do
        Wait(0)
    end
end

-- Wash animation & cleaning effect
local function StartWash(dic, anim)
    LoadAnim(dic)
    TaskPlayAnim(PlayerPedId(), dic, anim, 1.0, 8.0, 5000, 0, 0.0, false, false, false)
    Citizen.Wait(5000)
    ClearPedTasks(PlayerPedId())
    ClearPedEnvDirt(PlayerPedId())
    ClearPedBloodDamage(PlayerPedId())
    N_0xe3144b932dfdff65(PlayerPedId(), 0.0, -1, 1, 1) -- reset dirt
    ClearPedDamageDecalByZone(PlayerPedId(), 10, "ALL")
    Citizen.InvokeNative(0x7F5D88333EE8A86F, PlayerPedId(), 1)
    TriggerServerEvent("RSGCore:Server:SetMetaData", "cleanliness", 25)
end

-- Init Prompts
local function InitPrompts()
    WashPrompt = CreateWashPrompt(RiverGroup)
end

-- Main thread
CreateThread(function()
    InitPrompts()

    while true do
        Wait(4)

        -- Skip iteration if crouch is required and player is not crouching
        if Config.Crouch and GetPedCrouchMovement(cache.ped) == 0 then
            goto continue
        end

        local coords = GetEntityCoords(cache.ped)
        local water = Citizen.InvokeNative(0x5BA7A68A346A5A91, coords.x + 3, coords.y + 3, coords.z)

        for _, waterType in pairs(Config.WaterTypes) do
            if water == waterType["waterhash"] and IsPedOnFoot(cache.ped) and IsEntityInWater(cache.ped) then
                local waterText = CreateVarString(10, 'LITERAL_STRING', waterType["name"])
                PromptSetActiveGroupThisFrame(RiverGroup, waterText)

                -- Wash Action
                if not isWashing and PromptHasHoldModeCompleted(WashPrompt) then
                    isWashing = true
                    StartWash("amb_misc@world_human_wash_face_bucket@ground@male_a@idle_d", "idle_l")
                    Citizen.SetTimeout(5000, function() isWashing = false end)
                end
            end
        end

        ::continue::
    end
end)
