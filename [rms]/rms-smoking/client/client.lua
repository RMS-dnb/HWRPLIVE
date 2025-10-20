local RSGCore = exports['rsg-core']:GetCoreObject()
lib.locale()

local function DropPrompt(text, button, hold)
    CreateThread(function()
        proppromptdisplayed = false
        PropPrompt = nil
        local str = Config.Prompts.Drop
        local buttonhash = Config.Prompts.DropKey
        local holdbutton = hold or false
        PropPrompt = PromptRegisterBegin()
        PromptSetControlAction(PropPrompt, buttonhash)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(PropPrompt, str)
        PromptSetEnabled(PropPrompt, false)
        PromptSetVisible(PropPrompt, false)
        PromptSetHoldMode(PropPrompt, holdbutton)
        PromptRegisterEnd(PropPrompt)
        PromptSetGroup(PropPrompt, SmokingGroup)
    end)
end

local function SmokePrompt(text, button, hold)
    CreateThread(function()
        UsePrompt = nil
        local str = Config.Prompts.Smoke
        local buttonhash = Config.Prompts.SmokeKey
        local holdbutton = hold or false
        UsePrompt = PromptRegisterBegin()
        PromptSetControlAction(UsePrompt, buttonhash)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(UsePrompt, str)
        PromptSetEnabled(UsePrompt, false)
        PromptSetVisible(UsePrompt, false)
        PromptSetHoldMode(UsePrompt, holdbutton)
        PromptRegisterEnd(UsePrompt)
        PromptSetGroup(UsePrompt, SmokingGroup)
    end)
end

local function StancePrompt(text, button, hold)
    CreateThread(function()
        ChangeStance = nil
        local str = Config.Prompts.Change
        local buttonhash = Config.Prompts.ChangeKey
        local holdbutton = hold or false
        ChangeStance = PromptRegisterBegin()
        PromptSetControlAction(ChangeStance, buttonhash)
        str = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(ChangeStance, str)
        PromptSetEnabled(ChangeStance, false)
        PromptSetVisible(ChangeStance, false)
        PromptSetHoldMode(ChangeStance, holdbutton)
        PromptRegisterEnd(ChangeStance)
        PromptSetGroup(ChangeStance, SmokingGroup)
    end)
end

local function Anim(actor, dict, body, duration, flags, introtiming, exittiming)
    CreateThread(function()
        RequestAnimDict(dict)
        local dur = duration or -1
        local flag = flags or 1
        local intro = tonumber(introtiming) or 1.0
        local exit = tonumber(exittiming) or 1.0
        timeout = 5
        while (not HasAnimDictLoaded(dict) and timeout > 0) do
            timeout = timeout - 1
            if timeout == 0 then
                print(locale('cl_lang_1'))
            end
            Wait(300)
        end
        TaskPlayAnim(actor, dict, body, intro, exit, dur, flag --[[1 for repeat--]], 1, false, false, false, 0, true)
    end)
end

local function StopAnim(dict, body)
    CreateThread(function()
        StopAnimTask(cache.ped, dict, body, 1.0)
    end)
end

---------------------------------
-- cigarette
---------------------------------
RegisterNetEvent('rex-smoking:client:cigarette')
AddEventHandler('rex-smoking:client:cigarette', function()
    --TriggerServerEvent('hud:server:RelieveStress', Config.CigaretteRelieveStress)
    DropPrompt(Config.Drop, Config.Prompts.DropKey, false)
    SmokePrompt(Config.Smoke, Config.Prompts.SmokeKey, false)
    StancePrompt(Config.Change, Config.Prompts.ChangeKey, false)
    local male = IsPedMale(cache.ped)
    local x, y, z = table.unpack(GetEntityCoords(cache.ped, true))
    local cigaret = CreateObject(GetHashKey('P_CIGARETTE01X'), x, y, z + 0.2, true, true, true)
    local righthand = GetEntityBoneIndexByName(cache.ped, "SKEL_R_Finger13")
    local mouth = GetEntityBoneIndexByName(cache.ped, "skel_head")
    if male then
        AttachEntityToEntity(cigaret, cache.ped, mouth, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
        Anim(cache.ped, "amb_rest@world_human_smoking@male_c@stand_enter", "enter_back_rf", 5400, 0)
        Wait(1000)
        AttachEntityToEntity(cigaret, cache.ped, righthand, 0.03, -0.01, 0.0, 0.0, 90.0, 0.0, true, true, false, true, 1,
            true)
        Wait(1000)
        AttachEntityToEntity(cigaret, cache.ped, mouth, -0.017, 0.1, -0.01, 0.0, 90.0, -90.0, true, true, false, true, 1,
            true)
        Wait(3000)
        AttachEntityToEntity(cigaret, cache.ped, righthand, 0.017, -0.01, -0.01, 0.0, 120.0, 10.0, true, true, false, true, 1,
            true)
        Wait(1000)
        Anim(cache.ped, "amb_rest@world_human_smoking@male_c@base", "base", -1, 30)
        RemoveAnimDict("amb_rest@world_human_smoking@male_c@stand_enter")
        Wait(1000)
    else --female
        AttachEntityToEntity(cigaret, cache.ped, mouth, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
        Anim(cache.ped, "amb_rest@world_human_smoking@female_c@base", "base", -1, 30)
        Wait(1000)
        AttachEntityToEntity(cigaret, cache.ped, righthand, 0.01, 0.0, 0.01, 0.0, -160.0, -130.0, true, true, false, true, 1, true)
        Wait(2500)
    end

    local stance = "c"

    if proppromptdisplayed == false then
        PromptSetEnabled(PropPrompt, true)
        PromptSetVisible(PropPrompt, true)
        PromptSetEnabled(UsePrompt, true)
        PromptSetVisible(UsePrompt, true)
        PromptSetEnabled(ChangeStance, true)
        PromptSetVisible(ChangeStance, true)
        proppromptdisplayed = true
    end

    if male then
        while IsEntityPlayingAnim(cache.ped, "amb_rest@world_human_smoking@male_c@base", "base", 3)
            or IsEntityPlayingAnim(cache.ped, "amb_rest@world_human_smoking@nervous_stressed@male_b@base", "base", 3)
            or IsEntityPlayingAnim(cache.ped, "amb_rest@world_human_smoking@male_d@base", "base", 3)
            or IsEntityPlayingAnim(cache.ped, "amb_wander@code_human_smoking_wander@male_a@base", "base", 3) do
            Wait(5)
            if IsControlJustReleased(0, Config.Prompts.DropKey) then
                PromptSetEnabled(PropPrompt, false)
                PromptSetVisible(PropPrompt, false)
                PromptSetEnabled(UsePrompt, false)
                PromptSetVisible(UsePrompt, false)
                PromptSetEnabled(ChangeStance, false)
                PromptSetVisible(ChangeStance, false)
                proppromptdisplayed = false

                ClearPedSecondaryTask(cache.ped)
                Anim(cache.ped, "amb_rest@world_human_smoking@male_a@stand_exit", "exit_back", -1, 1)
                Wait(2800)
                DetachEntity(cigaret, true, true)
                SetEntityVelocity(cigaret, 0.0, 0.0, -1.0)
                Wait(1500)
                ClearPedSecondaryTask(cache.ped)
                ClearPedTasks(cache.ped)
                Wait(10)
            end
            if IsControlJustReleased(0, Config.Prompts.ChangeKey) then
                if stance == "c" then
                    Anim(cache.ped, "amb_rest@world_human_smoking@nervous_stressed@male_b@base", "base", -1, 30)
                    Wait(1000)
                    while not IsEntityPlayingAnim(cache.ped, "amb_rest@world_human_smoking@nervous_stressed@male_b@base", "base", 3) do
                        Wait(100)
                    end
                    stance = "b"
                elseif stance == "b" then
                    Anim(cache.ped, "amb_rest@world_human_smoking@male_d@base", "base", -1, 30)
                    Wait(1000)
                    while not IsEntityPlayingAnim(cache.ped, "amb_rest@world_human_smoking@male_d@base", "base", 3) do
                        Wait(100)
                    end
                    stance = "d"
                elseif stance == "d" then
                    Anim(cache.ped, "amb_rest@world_human_smoking@male_d@trans", "d_trans_a", -1, 30)
                    Wait(4000)
                    Anim(cache.ped, "amb_wander@code_human_smoking_wander@male_a@base", "base", -1, 30, 0)
                    while not IsEntityPlayingAnim(cache.ped, "amb_wander@code_human_smoking_wander@male_a@base", "base", 3) do
                        Wait(100)
                    end
                    stance = "a"
                else --stance=="a"
                    Anim(cache.ped, "amb_rest@world_human_smoking@male_a@trans", "a_trans_c", -1, 30)
                    Wait(4233)
                    Anim(cache.ped, "amb_rest@world_human_smoking@male_c@base", "base", -1, 30, 0)
                    while not IsEntityPlayingAnim(cache.ped, "amb_rest@world_human_smoking@male_c@base", "base", 3) do
                        Wait(100)
                    end
                    stance = "c"
                end
            end
            if stance == "c" then
                if IsControlJustReleased(0, Config.Prompts.SmokeKey) then
                    exports['fx-hud']:setStatus("stress",-2)
                    Wait(500)
                    if IsControlPressed(0, Config.Prompts.SmokeKey) then
                        Anim(cache.ped, "amb_rest@world_human_smoking@male_c@idle_a", "idle_b", -1, 30, 0)
                        Wait(21166)
                        Anim(cache.ped, "amb_rest@world_human_smoking@male_c@base", "base", -1, 30, 0)
                        Wait(100)
                    else
                        Anim(cache.ped, "amb_rest@world_human_smoking@male_c@idle_a", "idle_a", -1, 30, 0)
                        Wait(8500)
                        Anim(cache.ped, "amb_rest@world_human_smoking@male_c@base", "base", -1, 30, 0)
                        Wait(100)
                    end
                end
            elseif stance == "b" then
                if IsControlJustReleased(0, Config.Prompts.SmokeKey) then
                    exports['fx-hud']:setStatus("stress",-2)
                    Wait(500)
                    if IsControlPressed(0, Config.Prompts.SmokeKey) then
                        Anim(cache.ped, "amb_rest@world_human_smoking@nervous_stressed@male_b@idle_c", "idle_g", -1, 30, 0)
                        Wait(13433)
                        Anim(cache.ped, "amb_rest@world_human_smoking@nervous_stressed@male_b@base", "base", -1, 30, 0)
                        Wait(100)
                    else
                        Anim(cache.ped, "amb_rest@world_human_smoking@nervous_stressed@male_b@idle_a", "idle_a", -1, 30, 0)
                        Wait(3199)
                        Anim(cache.ped, "amb_rest@world_human_smoking@nervous_stressed@male_b@base", "base", -1, 30, 0)
                        Wait(100)
                    end
                end
            elseif stance == "d" then
                if IsControlJustReleased(0, Config.Prompts.SmokeKey) then
                    exports['fx-hud']:setStatus("stress",-2)
                    Wait(500)
                    if IsControlPressed(0, Config.Prompts.SmokeKey) then
                        Anim(cache.ped, "amb_rest@world_human_smoking@male_d@idle_a", "idle_b", -1, 30, 0)
                        Wait(7366)
                        Anim(cache.ped, "amb_rest@world_human_smoking@male_d@base", "base", -1, 30, 0)
                        Wait(100)
                    else
                        Anim(cache.ped, "amb_rest@world_human_smoking@male_d@idle_c", "idle_g", -1, 30, 0)
                        Wait(7866)
                        Anim(cache.ped, "amb_rest@world_human_smoking@male_d@base", "base", -1, 30, 0)
                        Wait(100)
                    end
                end
            else --stance=="a"
                if IsControlJustReleased(0, Config.Prompts.SmokeKey) then
                    exports['fx-hud']:setStatus("stress",-2)
                    Wait(500)
                    if IsControlPressed(0, Config.Prompts.SmokeKey) then
                        Anim(cache.ped, "amb_rest@world_human_smoking@male_a@idle_a", "idle_b", -1, 30, 0)
                        Wait(12533)
                        Anim(cache.ped, "amb_wander@code_human_smoking_wander@male_a@base", "base", -1, 30, 0)
                        Wait(100)
                    else
                        Anim(cache.ped, "amb_rest@world_human_smoking@male_a@idle_a", "idle_a", -1, 30, 0)
                        Wait(8200)
                        Anim(cache.ped, "amb_wander@code_human_smoking_wander@male_a@base", "base", -1, 30, 0)
                        Wait(100)
                    end
                end
            end
        end
    else --if female
        while IsEntityPlayingAnim(cache.ped, "amb_rest@world_human_smoking@female_c@base", "base", 3)
            or IsEntityPlayingAnim(cache.ped, "amb_rest@world_human_smoking@female_b@base", "base", 3)
            or IsEntityPlayingAnim(cache.ped, "amb_rest@world_human_smoking@female_a@base", "base", 3) do
            Wait(5)
            if IsControlJustReleased(0, Config.Prompts.DropKey) then
                PromptSetEnabled(PropPrompt, false)
                PromptSetVisible(PropPrompt, false)
                PromptSetEnabled(UsePrompt, false)
                PromptSetVisible(UsePrompt, false)
                PromptSetEnabled(ChangeStance, false)
                PromptSetVisible(ChangeStance, false)
                proppromptdisplayed = false

                ClearPedSecondaryTask(cache.ped)
                Anim(cache.ped, "amb_rest@world_human_smoking@female_b@trans", "b_trans_fire_stand_a", -1, 1)
                Wait(3800)
                DetachEntity(cigaret, true, true)
                Wait(800)
                ClearPedSecondaryTask(cache.ped)
                ClearPedTasks(cache.ped)
                Wait(10)
            end
            if IsControlJustReleased(0, Config.Prompts.ChangeKey) then
                if stance == "c" then
                    Anim(cache.ped, "amb_rest@world_human_smoking@female_b@base", "base", -1, 30)
                    Wait(1000)
                    while not IsEntityPlayingAnim(cache.ped, "amb_rest@world_human_smoking@female_b@base", "base", 3) do
                        Wait(100)
                    end
                    stance = "b"
                elseif stance == "b" then
                    Anim(cache.ped, "amb_rest@world_human_smoking@female_b@trans", "b_trans_a", -1, 30)
                    Wait(5733)
                    Anim(cache.ped, "amb_rest@world_human_smoking@female_a@base", "base", -1, 30, 0)
                    while not IsEntityPlayingAnim(cache.ped, "amb_rest@world_human_smoking@female_a@base", "base", 3) do
                        Wait(100)
                    end
                    stance = "a"
                else --stance=="a"
                    Anim(cache.ped, "amb_rest@world_human_smoking@female_c@base", "base", -1, 30)
                    Wait(1000)
                    while not IsEntityPlayingAnim(cache.ped, "amb_rest@world_human_smoking@female_c@base", "base", 3) do
                        Wait(100)
                    end
                    stance = "c"
                end
            end

            if stance == "c" then
                if IsControlJustReleased(0, Config.Prompts.SmokeKey) then
                    exports['fx-hud']:setStatus("stress",-2)
                    Wait(500)
                    if IsControlPressed(0, Config.Prompts.SmokeKey) then
                        Anim(cache.ped, "amb_rest@world_human_smoking@female_c@idle_a", "idle_a", -1, 30, 0)
                        Wait(9566)
                        Anim(cache.ped, "amb_rest@world_human_smoking@female_c@base", "base", -1, 30, 0)
                        Wait(100)
                    else
                        Anim(cache.ped, "amb_rest@world_human_smoking@female_c@idle_b", "idle_f", -1, 30, 0)
                        Wait(8133)
                        Anim(cache.ped, "amb_rest@world_human_smoking@female_c@base", "base", -1, 30, 0)
                        Wait(100)
                    end
                end
            elseif stance == "b" then
                if IsControlJustReleased(0, Config.Prompts.SmokeKey) then
                    exports['fx-hud']:setStatus("stress",-2)
                    Wait(500)
                    if IsControlPressed(0, Config.Prompts.SmokeKey) then
                        Anim(cache.ped, "amb_rest@world_human_smoking@female_b@idle_b", "idle_f", -1, 30, 0)
                        Wait(8033)
                        Anim(cache.ped, "amb_rest@world_human_smoking@female_b@base", "base", -1, 30, 0)
                        Wait(100)
                    else
                        Anim(cache.ped, "amb_rest@world_human_smoking@female_b@idle_a", "idle_b", -1, 30, 0)
                        Wait(4266)
                        Anim(cache.ped, "amb_rest@world_human_smoking@female_b@base", "base", -1, 30, 0)
                        Wait(100)
                    end
                end
            else --stance=="a"
                if IsControlJustReleased(0, Config.Prompts.SmokeKey) then
                    exports['fx-hud']:setStatus("stress",-2)
                    Wait(500)
                    if IsControlPressed(0, Config.Prompts.SmokeKey) then
                        Anim(cache.ped, "amb_rest@world_human_smoking@female_a@idle_b", "idle_d", -1, 30, 0)
                        Wait(14566)
                        Anim(cache.ped, "amb_rest@world_human_smoking@female_a@base", "base", -1, 30, 0)
                        Wait(100)
                    else
                        Anim(cache.ped, "amb_rest@world_human_smoking@female_a@idle_a", "idle_b", -1, 30, 0)
                        Wait(6100)
                        Anim(cache.ped, "amb_rest@world_human_smoking@female_a@base", "base", -1, 30, 0)
                        Wait(100)
                    end
                end
            end
        end
    end

    PromptSetEnabled(PropPrompt, false)
    PromptSetVisible(PropPrompt, false)
    PromptSetEnabled(UsePrompt, false)
    PromptSetVisible(UsePrompt, false)
    PromptSetEnabled(ChangeStance, false)
    PromptSetVisible(ChangeStance, false)
    proppromptdisplayed = false

    DetachEntity(cigaret, true, true)
    ClearPedSecondaryTask(cache.ped)
    RemoveAnimDict("amb_wander@code_human_smoking_wander@male_a@base")
    RemoveAnimDict("amb_rest@world_human_smoking@male_a@idle_a")
    RemoveAnimDict("amb_rest@world_human_smoking@nervous_stressed@male_b@base")
    RemoveAnimDict("amb_rest@world_human_smoking@nervous_stressed@male_b@idle_a")
    RemoveAnimDict("amb_rest@world_human_smoking@nervous_stressed@male_b@idle_g")
    RemoveAnimDict("amb_rest@world_human_smoking@male_c@base")
    RemoveAnimDict("amb_rest@world_human_smoking@male_c@idle_a")
    RemoveAnimDict("amb_rest@world_human_smoking@male_d@base")
    RemoveAnimDict("amb_rest@world_human_smoking@male_d@idle_a")
    RemoveAnimDict("amb_rest@world_human_smoking@male_d@idle_c")
    RemoveAnimDict("amb_rest@world_human_smoking@male_a@trans")
    RemoveAnimDict("amb_rest@world_human_smoking@male_c@trans")
    RemoveAnimDict("amb_rest@world_human_smoking@male_d@trans")
    RemoveAnimDict("amb_rest@world_human_smoking@female_a@base")
    RemoveAnimDict("amb_rest@world_human_smoking@female_a@idle_a")
    RemoveAnimDict("amb_rest@world_human_smoking@female_a@idle_b")
    RemoveAnimDict("amb_rest@world_human_smoking@female_b@base")
    RemoveAnimDict("amb_rest@world_human_smoking@female_b@idle_a")
    RemoveAnimDict("amb_rest@world_human_smoking@female_b@idle_b")
    RemoveAnimDict("amb_rest@world_human_smoking@female_c@base")
    RemoveAnimDict("amb_rest@world_human_smoking@female_c@idle_a")
    RemoveAnimDict("amb_rest@world_human_smoking@female_c@idle_b")
    RemoveAnimDict("amb_rest@world_human_smoking@female_b@trans")
    Wait(100)
    ClearPedTasks(cache.ped)
end)

---------------------------------
-- cigarette
---------------------------------
RegisterNetEvent('rex-smoking:client:cigarettebusiness')
AddEventHandler('rex-smoking:client:cigarettebusiness', function()
    DropPrompt(Config.Drop, Config.Prompts.DropKey, false)
    SmokePrompt(Config.Smoke, Config.Prompts.SmokeKey, false)
    StancePrompt(Config.Change, Config.Prompts.ChangeKey, false)
    local male = IsPedMale(cache.ped)
    local x, y, z = table.unpack(GetEntityCoords(cache.ped, true))
    local cigaret = CreateObject(GetHashKey('P_CIGARETTE01X'), x, y, z + 0.2, true, true, true)
    local righthand = GetEntityBoneIndexByName(cache.ped, "SKEL_R_Finger13")
    local mouth = GetEntityBoneIndexByName(cache.ped, "skel_head")
    if male then
        AttachEntityToEntity(cigaret, cache.ped, mouth, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
        Anim(cache.ped, "amb_rest@world_human_smoking@male_c@stand_enter", "enter_back_rf", 5400, 0)
        Wait(1000)
        AttachEntityToEntity(cigaret, cache.ped, righthand, 0.03, -0.01, 0.0, 0.0, 90.0, 0.0, true, true, false, true, 1,
            true)
        Wait(1000)
        AttachEntityToEntity(cigaret, cache.ped, mouth, -0.017, 0.1, -0.01, 0.0, 90.0, -90.0, true, true, false, true, 1,
            true)
        Wait(3000)
        AttachEntityToEntity(cigaret, cache.ped, righthand, 0.017, -0.01, -0.01, 0.0, 120.0, 10.0, true, true, false, true, 1,
            true)
        Wait(1000)
        Anim(cache.ped, "amb_rest@world_human_smoking@male_c@base", "base", -1, 30)
        RemoveAnimDict("amb_rest@world_human_smoking@male_c@stand_enter")
        Wait(1000)
    else --female
        AttachEntityToEntity(cigaret, cache.ped, mouth, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
        Anim(cache.ped, "amb_rest@world_human_smoking@female_c@base", "base", -1, 30)
        Wait(1000)
        AttachEntityToEntity(cigaret, cache.ped, righthand, 0.01, 0.0, 0.01, 0.0, -160.0, -130.0, true, true, false, true, 1, true)
        Wait(2500)
    end

    local stance = "c"

    if proppromptdisplayed == false then
        PromptSetEnabled(PropPrompt, true)
        PromptSetVisible(PropPrompt, true)
        PromptSetEnabled(UsePrompt, true)
        PromptSetVisible(UsePrompt, true)
        PromptSetEnabled(ChangeStance, true)
        PromptSetVisible(ChangeStance, true)
        proppromptdisplayed = true
    end

    if male then
        while IsEntityPlayingAnim(cache.ped, "amb_rest@world_human_smoking@male_c@base", "base", 3)
            or IsEntityPlayingAnim(cache.ped, "amb_rest@world_human_smoking@nervous_stressed@male_b@base", "base", 3)
            or IsEntityPlayingAnim(cache.ped, "amb_rest@world_human_smoking@male_d@base", "base", 3)
            or IsEntityPlayingAnim(cache.ped, "amb_wander@code_human_smoking_wander@male_a@base", "base", 3) do
            Wait(5)
            if IsControlJustReleased(0, Config.Prompts.DropKey) then
                PromptSetEnabled(PropPrompt, false)
                PromptSetVisible(PropPrompt, false)
                PromptSetEnabled(UsePrompt, false)
                PromptSetVisible(UsePrompt, false)
                PromptSetEnabled(ChangeStance, false)
                PromptSetVisible(ChangeStance, false)
                proppromptdisplayed = false

                ClearPedSecondaryTask(cache.ped)
                Anim(cache.ped, "amb_rest@world_human_smoking@male_a@stand_exit", "exit_back", -1, 1)
                Wait(2800)
                DetachEntity(cigaret, true, true)
                SetEntityVelocity(cigaret, 0.0, 0.0, -1.0)
                Wait(1500)
                ClearPedSecondaryTask(cache.ped)
                ClearPedTasks(cache.ped)
                Wait(10)
            end
            if IsControlJustReleased(0, Config.Prompts.ChangeKey) then
                if stance == "c" then
                    Anim(cache.ped, "amb_rest@world_human_smoking@nervous_stressed@male_b@base", "base", -1, 30)
                    Wait(1000)
                    while not IsEntityPlayingAnim(cache.ped, "amb_rest@world_human_smoking@nervous_stressed@male_b@base", "base", 3) do
                        Wait(100)
                    end
                    stance = "b"
                elseif stance == "b" then
                    Anim(cache.ped, "amb_rest@world_human_smoking@male_d@base", "base", -1, 30)
                    Wait(1000)
                    while not IsEntityPlayingAnim(cache.ped, "amb_rest@world_human_smoking@male_d@base", "base", 3) do
                        Wait(100)
                    end
                    stance = "d"
                elseif stance == "d" then
                    Anim(cache.ped, "amb_rest@world_human_smoking@male_d@trans", "d_trans_a", -1, 30)
                    Wait(4000)
                    Anim(cache.ped, "amb_wander@code_human_smoking_wander@male_a@base", "base", -1, 30, 0)
                    while not IsEntityPlayingAnim(cache.ped, "amb_wander@code_human_smoking_wander@male_a@base", "base", 3) do
                        Wait(100)
                    end
                    stance = "a"
                else --stance=="a"
                    Anim(cache.ped, "amb_rest@world_human_smoking@male_a@trans", "a_trans_c", -1, 30)
                    Wait(4233)
                    Anim(cache.ped, "amb_rest@world_human_smoking@male_c@base", "base", -1, 30, 0)
                    while not IsEntityPlayingAnim(cache.ped, "amb_rest@world_human_smoking@male_c@base", "base", 3) do
                        Wait(100)
                    end
                    stance = "c"
                end
            end
            if stance == "c" then
                if IsControlJustReleased(0, Config.Prompts.SmokeKey) then
                    exports['fx-hud']:setStatus("stress",-5)
                    Wait(500)
                    if IsControlPressed(0, Config.Prompts.SmokeKey) then
                        Anim(cache.ped, "amb_rest@world_human_smoking@male_c@idle_a", "idle_b", -1, 30, 0)
                        Wait(21166)
                        Anim(cache.ped, "amb_rest@world_human_smoking@male_c@base", "base", -1, 30, 0)
                        Wait(100)
                    else
                        Anim(cache.ped, "amb_rest@world_human_smoking@male_c@idle_a", "idle_a", -1, 30, 0)
                        Wait(8500)
                        Anim(cache.ped, "amb_rest@world_human_smoking@male_c@base", "base", -1, 30, 0)
                        Wait(100)
                    end
                end
            elseif stance == "b" then
                if IsControlJustReleased(0, Config.Prompts.SmokeKey) then
                    exports['fx-hud']:setStatus("stress",-5)
                    Wait(500)
                    if IsControlPressed(0, Config.Prompts.SmokeKey) then
                        Anim(cache.ped, "amb_rest@world_human_smoking@nervous_stressed@male_b@idle_c", "idle_g", -1, 30, 0)
                        Wait(13433)
                        Anim(cache.ped, "amb_rest@world_human_smoking@nervous_stressed@male_b@base", "base", -1, 30, 0)
                        Wait(100)
                    else
                        Anim(cache.ped, "amb_rest@world_human_smoking@nervous_stressed@male_b@idle_a", "idle_a", -1, 30, 0)
                        Wait(3199)
                        Anim(cache.ped, "amb_rest@world_human_smoking@nervous_stressed@male_b@base", "base", -1, 30, 0)
                        Wait(100)
                    end
                end
            elseif stance == "d" then
                if IsControlJustReleased(0, Config.Prompts.SmokeKey) then
                    exports['fx-hud']:setStatus("stress",-5)
                    Wait(500)
                    if IsControlPressed(0, Config.Prompts.SmokeKey) then
                        Anim(cache.ped, "amb_rest@world_human_smoking@male_d@idle_a", "idle_b", -1, 30, 0)
                        Wait(7366)
                        Anim(cache.ped, "amb_rest@world_human_smoking@male_d@base", "base", -1, 30, 0)
                        Wait(100)
                    else
                        Anim(cache.ped, "amb_rest@world_human_smoking@male_d@idle_c", "idle_g", -1, 30, 0)
                        Wait(7866)
                        Anim(cache.ped, "amb_rest@world_human_smoking@male_d@base", "base", -1, 30, 0)
                        Wait(100)
                    end
                end
            else --stance=="a"
                if IsControlJustReleased(0, Config.Prompts.SmokeKey) then
                    exports['fx-hud']:setStatus("stress",-5)
                    Wait(500)
                    if IsControlPressed(0, Config.Prompts.SmokeKey) then
                        Anim(cache.ped, "amb_rest@world_human_smoking@male_a@idle_a", "idle_b", -1, 30, 0)
                        Wait(12533)
                        Anim(cache.ped, "amb_wander@code_human_smoking_wander@male_a@base", "base", -1, 30, 0)
                        Wait(100)
                    else
                        Anim(cache.ped, "amb_rest@world_human_smoking@male_a@idle_a", "idle_a", -1, 30, 0)
                        Wait(8200)
                        Anim(cache.ped, "amb_wander@code_human_smoking_wander@male_a@base", "base", -1, 30, 0)
                        Wait(100)
                    end
                end
            end
        end
    else --if female
        while IsEntityPlayingAnim(cache.ped, "amb_rest@world_human_smoking@female_c@base", "base", 3)
            or IsEntityPlayingAnim(cache.ped, "amb_rest@world_human_smoking@female_b@base", "base", 3)
            or IsEntityPlayingAnim(cache.ped, "amb_rest@world_human_smoking@female_a@base", "base", 3) do
            Wait(5)
            if IsControlJustReleased(0, Config.Prompts.DropKey) then
                PromptSetEnabled(PropPrompt, false)
                PromptSetVisible(PropPrompt, false)
                PromptSetEnabled(UsePrompt, false)
                PromptSetVisible(UsePrompt, false)
                PromptSetEnabled(ChangeStance, false)
                PromptSetVisible(ChangeStance, false)
                proppromptdisplayed = false

                ClearPedSecondaryTask(cache.ped)
                Anim(cache.ped, "amb_rest@world_human_smoking@female_b@trans", "b_trans_fire_stand_a", -1, 1)
                Wait(3800)
                DetachEntity(cigaret, true, true)
                Wait(800)
                ClearPedSecondaryTask(cache.ped)
                ClearPedTasks(cache.ped)
                Wait(10)
            end
            if IsControlJustReleased(0, Config.Prompts.ChangeKey) then
                if stance == "c" then
                    Anim(cache.ped, "amb_rest@world_human_smoking@female_b@base", "base", -1, 30)
                    Wait(1000)
                    while not IsEntityPlayingAnim(cache.ped, "amb_rest@world_human_smoking@female_b@base", "base", 3) do
                        Wait(100)
                    end
                    stance = "b"
                elseif stance == "b" then
                    Anim(cache.ped, "amb_rest@world_human_smoking@female_b@trans", "b_trans_a", -1, 30)
                    Wait(5733)
                    Anim(cache.ped, "amb_rest@world_human_smoking@female_a@base", "base", -1, 30, 0)
                    while not IsEntityPlayingAnim(cache.ped, "amb_rest@world_human_smoking@female_a@base", "base", 3) do
                        Wait(100)
                    end
                    stance = "a"
                else --stance=="a"
                    Anim(cache.ped, "amb_rest@world_human_smoking@female_c@base", "base", -1, 30)
                    Wait(1000)
                    while not IsEntityPlayingAnim(cache.ped, "amb_rest@world_human_smoking@female_c@base", "base", 3) do
                        Wait(100)
                    end
                    stance = "c"
                end
            end

            if stance == "c" then
                if IsControlJustReleased(0, Config.Prompts.SmokeKey) then
                    exports['fx-hud']:setStatus("stress",-5)
                    Wait(500)
                    if IsControlPressed(0, Config.Prompts.SmokeKey) then
                        Anim(cache.ped, "amb_rest@world_human_smoking@female_c@idle_a", "idle_a", -1, 30, 0)
                        Wait(9566)
                        Anim(cache.ped, "amb_rest@world_human_smoking@female_c@base", "base", -1, 30, 0)
                        Wait(100)
                    else
                        Anim(cache.ped, "amb_rest@world_human_smoking@female_c@idle_b", "idle_f", -1, 30, 0)
                        Wait(8133)
                        Anim(cache.ped, "amb_rest@world_human_smoking@female_c@base", "base", -1, 30, 0)
                        Wait(100)
                    end
                end
            elseif stance == "b" then
                if IsControlJustReleased(0, Config.Prompts.SmokeKey) then
                    exports['fx-hud']:setStatus("stress",-5)
                    Wait(500)
                    if IsControlPressed(0, Config.Prompts.SmokeKey) then
                        Anim(cache.ped, "amb_rest@world_human_smoking@female_b@idle_b", "idle_f", -1, 30, 0)
                        Wait(8033)
                        Anim(cache.ped, "amb_rest@world_human_smoking@female_b@base", "base", -1, 30, 0)
                        Wait(100)
                    else
                        Anim(cache.ped, "amb_rest@world_human_smoking@female_b@idle_a", "idle_b", -1, 30, 0)
                        Wait(4266)
                        Anim(cache.ped, "amb_rest@world_human_smoking@female_b@base", "base", -1, 30, 0)
                        Wait(100)
                    end
                end
            else --stance=="a"
                if IsControlJustReleased(0, Config.Prompts.SmokeKey) then
                    exports['fx-hud']:setStatus("stress",-5)
                    Wait(500)
                    if IsControlPressed(0, Config.Prompts.SmokeKey) then
                        Anim(cache.ped, "amb_rest@world_human_smoking@female_a@idle_b", "idle_d", -1, 30, 0)
                        Wait(14566)
                        Anim(cache.ped, "amb_rest@world_human_smoking@female_a@base", "base", -1, 30, 0)
                        Wait(100)
                    else
                        Anim(cache.ped, "amb_rest@world_human_smoking@female_a@idle_a", "idle_b", -1, 30, 0)
                        Wait(6100)
                        Anim(cache.ped, "amb_rest@world_human_smoking@female_a@base", "base", -1, 30, 0)
                        Wait(100)
                    end
                end
            end
        end
    end

    PromptSetEnabled(PropPrompt, false)
    PromptSetVisible(PropPrompt, false)
    PromptSetEnabled(UsePrompt, false)
    PromptSetVisible(UsePrompt, false)
    PromptSetEnabled(ChangeStance, false)
    PromptSetVisible(ChangeStance, false)
    proppromptdisplayed = false

    DetachEntity(cigaret, true, true)
    ClearPedSecondaryTask(cache.ped)
    RemoveAnimDict("amb_wander@code_human_smoking_wander@male_a@base")
    RemoveAnimDict("amb_rest@world_human_smoking@male_a@idle_a")
    RemoveAnimDict("amb_rest@world_human_smoking@nervous_stressed@male_b@base")
    RemoveAnimDict("amb_rest@world_human_smoking@nervous_stressed@male_b@idle_a")
    RemoveAnimDict("amb_rest@world_human_smoking@nervous_stressed@male_b@idle_g")
    RemoveAnimDict("amb_rest@world_human_smoking@male_c@base")
    RemoveAnimDict("amb_rest@world_human_smoking@male_c@idle_a")
    RemoveAnimDict("amb_rest@world_human_smoking@male_d@base")
    RemoveAnimDict("amb_rest@world_human_smoking@male_d@idle_a")
    RemoveAnimDict("amb_rest@world_human_smoking@male_d@idle_c")
    RemoveAnimDict("amb_rest@world_human_smoking@male_a@trans")
    RemoveAnimDict("amb_rest@world_human_smoking@male_c@trans")
    RemoveAnimDict("amb_rest@world_human_smoking@male_d@trans")
    RemoveAnimDict("amb_rest@world_human_smoking@female_a@base")
    RemoveAnimDict("amb_rest@world_human_smoking@female_a@idle_a")
    RemoveAnimDict("amb_rest@world_human_smoking@female_a@idle_b")
    RemoveAnimDict("amb_rest@world_human_smoking@female_b@base")
    RemoveAnimDict("amb_rest@world_human_smoking@female_b@idle_a")
    RemoveAnimDict("amb_rest@world_human_smoking@female_b@idle_b")
    RemoveAnimDict("amb_rest@world_human_smoking@female_c@base")
    RemoveAnimDict("amb_rest@world_human_smoking@female_c@idle_a")
    RemoveAnimDict("amb_rest@world_human_smoking@female_c@idle_b")
    RemoveAnimDict("amb_rest@world_human_smoking@female_b@trans")
    Wait(100)
    ClearPedTasks(cache.ped)
end)

---------------------------------
-- joint
---------------------------------
RegisterNetEvent('rex-smoking:client:joint')
AddEventHandler('rex-smoking:client:joint', function()
    --TriggerServerEvent('hud:server:RelieveStress', Config.CigaretteRelieveStress)
    exports['fx-hud']:setStatus("thirst",-10)
    exports['fx-hud']:setStatus("hunger",-10)
    exports['fx-hud']:setStatus("health",10)
    DropPrompt(Config.Drop, Config.Prompts.DropKey, false)
    SmokePrompt(Config.Smoke, Config.Prompts.SmokeKey, false)
    StancePrompt(Config.Change, Config.Prompts.ChangeKey, false)
    local male = IsPedMale(cache.ped)
    local x, y, z = table.unpack(GetEntityCoords(cache.ped, true))
    local cigaret = CreateObject(GetHashKey('P_CIGARETTE01X'), x, y, z + 0.2, true, true, true)
    local righthand = GetEntityBoneIndexByName(cache.ped, "SKEL_R_Finger13")
    local mouth = GetEntityBoneIndexByName(cache.ped, "skel_head")
    if male then
        AttachEntityToEntity(cigaret, cache.ped, mouth, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
        Anim(cache.ped, "amb_rest@world_human_smoking@male_c@stand_enter", "enter_back_rf", 5400, 0)
        Wait(1000)
        AttachEntityToEntity(cigaret, cache.ped, righthand, 0.03, -0.01, 0.0, 0.0, 90.0, 0.0, true, true, false, true, 1,
            true)
        Wait(1000)
        AttachEntityToEntity(cigaret, cache.ped, mouth, -0.017, 0.1, -0.01, 0.0, 90.0, -90.0, true, true, false, true, 1,
            true)
        Wait(3000)
        AttachEntityToEntity(cigaret, cache.ped, righthand, 0.017, -0.01, -0.01, 0.0, 120.0, 10.0, true, true, false, true, 1,
            true)
        Wait(1000)
        Anim(cache.ped, "amb_rest@world_human_smoking@male_c@base", "base", -1, 30)
        RemoveAnimDict("amb_rest@world_human_smoking@male_c@stand_enter")
        Wait(1000)
    else --female
        AttachEntityToEntity(cigaret, cache.ped, mouth, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
        Anim(cache.ped, "amb_rest@world_human_smoking@female_c@base", "base", -1, 30)
        Wait(1000)
        AttachEntityToEntity(cigaret, cache.ped, righthand, 0.01, 0.0, 0.01, 0.0, -160.0, -130.0, true, true, false, true, 1, true)
        Wait(2500)
    end

    local stance = "c"

    if proppromptdisplayed == false then
        PromptSetEnabled(PropPrompt, true)
        PromptSetVisible(PropPrompt, true)
        PromptSetEnabled(UsePrompt, true)
        PromptSetVisible(UsePrompt, true)
        PromptSetEnabled(ChangeStance, true)
        PromptSetVisible(ChangeStance, true)
        proppromptdisplayed = true
    end

    if male then
        while IsEntityPlayingAnim(cache.ped, "amb_rest@world_human_smoking@male_c@base", "base", 3)
            or IsEntityPlayingAnim(cache.ped, "amb_rest@world_human_smoking@nervous_stressed@male_b@base", "base", 3)
            or IsEntityPlayingAnim(cache.ped, "amb_rest@world_human_smoking@male_d@base", "base", 3)
            or IsEntityPlayingAnim(cache.ped, "amb_wander@code_human_smoking_wander@male_a@base", "base", 3) do
            Wait(5)
            if IsControlJustReleased(0, Config.Prompts.DropKey) then
                PromptSetEnabled(PropPrompt, false)
                PromptSetVisible(PropPrompt, false)
                PromptSetEnabled(UsePrompt, false)
                PromptSetVisible(UsePrompt, false)
                PromptSetEnabled(ChangeStance, false)
                PromptSetVisible(ChangeStance, false)
                proppromptdisplayed = false

                ClearPedSecondaryTask(cache.ped)
                Anim(cache.ped, "amb_rest@world_human_smoking@male_a@stand_exit", "exit_back", -1, 1)
                Wait(2800)
                DetachEntity(cigaret, true, true)
                SetEntityVelocity(cigaret, 0.0, 0.0, -1.0)
                Wait(1500)
                ClearPedSecondaryTask(cache.ped)
                ClearPedTasks(cache.ped)
                Wait(10)
            end
            if IsControlJustReleased(0, Config.Prompts.ChangeKey) then
                if stance == "c" then
                    Anim(cache.ped, "amb_rest@world_human_smoking@nervous_stressed@male_b@base", "base", -1, 30)
                    Wait(1000)
                    while not IsEntityPlayingAnim(cache.ped, "amb_rest@world_human_smoking@nervous_stressed@male_b@base", "base", 3) do
                        Wait(100)
                    end
                    stance = "b"
                elseif stance == "b" then
                    Anim(cache.ped, "amb_rest@world_human_smoking@male_d@base", "base", -1, 30)
                    Wait(1000)
                    while not IsEntityPlayingAnim(cache.ped, "amb_rest@world_human_smoking@male_d@base", "base", 3) do
                        Wait(100)
                    end
                    stance = "d"
                elseif stance == "d" then
                    Anim(cache.ped, "amb_rest@world_human_smoking@male_d@trans", "d_trans_a", -1, 30)
                    Wait(4000)
                    Anim(cache.ped, "amb_wander@code_human_smoking_wander@male_a@base", "base", -1, 30, 0)
                    while not IsEntityPlayingAnim(cache.ped, "amb_wander@code_human_smoking_wander@male_a@base", "base", 3) do
                        Wait(100)
                    end
                    stance = "a"
                else --stance=="a"
                    Anim(cache.ped, "amb_rest@world_human_smoking@male_a@trans", "a_trans_c", -1, 30)
                    Wait(4233)
                    Anim(cache.ped, "amb_rest@world_human_smoking@male_c@base", "base", -1, 30, 0)
                    while not IsEntityPlayingAnim(cache.ped, "amb_rest@world_human_smoking@male_c@base", "base", 3) do
                        Wait(100)
                    end
                    stance = "c"
                end
            end
            if stance == "c" then
                if IsControlJustReleased(0, Config.Prompts.SmokeKey) then
                    exports['fx-hud']:setStatus("stress",-10)
                    Wait(500)
                    if IsControlPressed(0, Config.Prompts.SmokeKey) then
                        Anim(cache.ped, "amb_rest@world_human_smoking@male_c@idle_a", "idle_b", -1, 30, 0)
                        Wait(21166)
                        Anim(cache.ped, "amb_rest@world_human_smoking@male_c@base", "base", -1, 30, 0)
                        Wait(100)
                    else
                        Anim(cache.ped, "amb_rest@world_human_smoking@male_c@idle_a", "idle_a", -1, 30, 0)
                        Wait(8500)
                        Anim(cache.ped, "amb_rest@world_human_smoking@male_c@base", "base", -1, 30, 0)
                        Wait(100)
                    end
                end
            elseif stance == "b" then
                if IsControlJustReleased(0, Config.Prompts.SmokeKey) then
                    exports['fx-hud']:setStatus("stress",-10)
                    Wait(500)
                    if IsControlPressed(0, Config.Prompts.SmokeKey) then
                        Anim(cache.ped, "amb_rest@world_human_smoking@nervous_stressed@male_b@idle_c", "idle_g", -1, 30, 0)
                        Wait(13433)
                        Anim(cache.ped, "amb_rest@world_human_smoking@nervous_stressed@male_b@base", "base", -1, 30, 0)
                        Wait(100)
                    else
                        Anim(cache.ped, "amb_rest@world_human_smoking@nervous_stressed@male_b@idle_a", "idle_a", -1, 30, 0)
                        Wait(3199)
                        Anim(cache.ped, "amb_rest@world_human_smoking@nervous_stressed@male_b@base", "base", -1, 30, 0)
                        Wait(100)
                    end
                end
            elseif stance == "d" then
                if IsControlJustReleased(0, Config.Prompts.SmokeKey) then
                    exports['fx-hud']:setStatus("stress",-10)
                    Wait(500)
                    if IsControlPressed(0, Config.Prompts.SmokeKey) then
                        Anim(cache.ped, "amb_rest@world_human_smoking@male_d@idle_a", "idle_b", -1, 30, 0)
                        Wait(7366)
                        Anim(cache.ped, "amb_rest@world_human_smoking@male_d@base", "base", -1, 30, 0)
                        Wait(100)
                    else
                        Anim(cache.ped, "amb_rest@world_human_smoking@male_d@idle_c", "idle_g", -1, 30, 0)
                        Wait(7866)
                        Anim(cache.ped, "amb_rest@world_human_smoking@male_d@base", "base", -1, 30, 0)
                        Wait(100)
                    end
                end
            else --stance=="a"
                if IsControlJustReleased(0, Config.Prompts.SmokeKey) then
                    exports['fx-hud']:setStatus("stress",-10)
                    Wait(500)
                    if IsControlPressed(0, Config.Prompts.SmokeKey) then
                        Anim(cache.ped, "amb_rest@world_human_smoking@male_a@idle_a", "idle_b", -1, 30, 0)
                        Wait(12533)
                        Anim(cache.ped, "amb_wander@code_human_smoking_wander@male_a@base", "base", -1, 30, 0)
                        Wait(100)
                    else
                        Anim(cache.ped, "amb_rest@world_human_smoking@male_a@idle_a", "idle_a", -1, 30, 0)
                        Wait(8200)
                        Anim(cache.ped, "amb_wander@code_human_smoking_wander@male_a@base", "base", -1, 30, 0)
                        Wait(100)
                    end
                end
            end
        end
    else --if female
        while IsEntityPlayingAnim(cache.ped, "amb_rest@world_human_smoking@female_c@base", "base", 3)
            or IsEntityPlayingAnim(cache.ped, "amb_rest@world_human_smoking@female_b@base", "base", 3)
            or IsEntityPlayingAnim(cache.ped, "amb_rest@world_human_smoking@female_a@base", "base", 3) do
            Wait(5)
            if IsControlJustReleased(0, Config.Prompts.DropKey) then
                PromptSetEnabled(PropPrompt, false)
                PromptSetVisible(PropPrompt, false)
                PromptSetEnabled(UsePrompt, false)
                PromptSetVisible(UsePrompt, false)
                PromptSetEnabled(ChangeStance, false)
                PromptSetVisible(ChangeStance, false)
                proppromptdisplayed = false

                ClearPedSecondaryTask(cache.ped)
                Anim(cache.ped, "amb_rest@world_human_smoking@female_b@trans", "b_trans_fire_stand_a", -1, 1)
                Wait(3800)
                DetachEntity(cigaret, true, true)
                Wait(800)
                ClearPedSecondaryTask(cache.ped)
                ClearPedTasks(cache.ped)
                Wait(10)
            end
            if IsControlJustReleased(0, Config.Prompts.ChangeKey) then
                if stance == "c" then
                    Anim(cache.ped, "amb_rest@world_human_smoking@female_b@base", "base", -1, 30)
                    Wait(1000)
                    while not IsEntityPlayingAnim(cache.ped, "amb_rest@world_human_smoking@female_b@base", "base", 3) do
                        Wait(100)
                    end
                    stance = "b"
                elseif stance == "b" then
                    Anim(cache.ped, "amb_rest@world_human_smoking@female_b@trans", "b_trans_a", -1, 30)
                    Wait(5733)
                    Anim(cache.ped, "amb_rest@world_human_smoking@female_a@base", "base", -1, 30, 0)
                    while not IsEntityPlayingAnim(cache.ped, "amb_rest@world_human_smoking@female_a@base", "base", 3) do
                        Wait(100)
                    end
                    stance = "a"
                else --stance=="a"
                    Anim(cache.ped, "amb_rest@world_human_smoking@female_c@base", "base", -1, 30)
                    Wait(1000)
                    while not IsEntityPlayingAnim(cache.ped, "amb_rest@world_human_smoking@female_c@base", "base", 3) do
                        Wait(100)
                    end
                    stance = "c"
                end
            end

            if stance == "c" then
                if IsControlJustReleased(0, Config.Prompts.SmokeKey) then
                    exports['fx-hud']:setStatus("stress",-10)
                    Wait(500)
                    if IsControlPressed(0, Config.Prompts.SmokeKey) then
                        Anim(cache.ped, "amb_rest@world_human_smoking@female_c@idle_a", "idle_a", -1, 30, 0)
                        Wait(9566)
                        Anim(cache.ped, "amb_rest@world_human_smoking@female_c@base", "base", -1, 30, 0)
                        Wait(100)
                    else
                        Anim(cache.ped, "amb_rest@world_human_smoking@female_c@idle_b", "idle_f", -1, 30, 0)
                        Wait(8133)
                        Anim(cache.ped, "amb_rest@world_human_smoking@female_c@base", "base", -1, 30, 0)
                        Wait(100)
                    end
                end
            elseif stance == "b" then
                if IsControlJustReleased(0, Config.Prompts.SmokeKey) then
                    exports['fx-hud']:setStatus("stress",-10)
                    Wait(500)
                    if IsControlPressed(0, Config.Prompts.SmokeKey) then
                        Anim(cache.ped, "amb_rest@world_human_smoking@female_b@idle_b", "idle_f", -1, 30, 0)
                        Wait(8033)
                        Anim(cache.ped, "amb_rest@world_human_smoking@female_b@base", "base", -1, 30, 0)
                        Wait(100)
                    else
                        Anim(cache.ped, "amb_rest@world_human_smoking@female_b@idle_a", "idle_b", -1, 30, 0)
                        Wait(4266)
                        Anim(cache.ped, "amb_rest@world_human_smoking@female_b@base", "base", -1, 30, 0)
                        Wait(100)
                    end
                end
            else --stance=="a"
                if IsControlJustReleased(0, Config.Prompts.SmokeKey) then
                    exports['fx-hud']:setStatus("stress",-10)
                    Wait(500)
                    if IsControlPressed(0, Config.Prompts.SmokeKey) then
                        Anim(cache.ped, "amb_rest@world_human_smoking@female_a@idle_b", "idle_d", -1, 30, 0)
                        Wait(14566)
                        Anim(cache.ped, "amb_rest@world_human_smoking@female_a@base", "base", -1, 30, 0)
                        Wait(100)
                    else
                        Anim(cache.ped, "amb_rest@world_human_smoking@female_a@idle_a", "idle_b", -1, 30, 0)
                        Wait(6100)
                        Anim(cache.ped, "amb_rest@world_human_smoking@female_a@base", "base", -1, 30, 0)
                        Wait(100)
                    end
                end
            end
        end
    end

    PromptSetEnabled(PropPrompt, false)
    PromptSetVisible(PropPrompt, false)
    PromptSetEnabled(UsePrompt, false)
    PromptSetVisible(UsePrompt, false)
    PromptSetEnabled(ChangeStance, false)
    PromptSetVisible(ChangeStance, false)
    proppromptdisplayed = false

    DetachEntity(cigaret, true, true)
    ClearPedSecondaryTask(cache.ped)
    RemoveAnimDict("amb_wander@code_human_smoking_wander@male_a@base")
    RemoveAnimDict("amb_rest@world_human_smoking@male_a@idle_a")
    RemoveAnimDict("amb_rest@world_human_smoking@nervous_stressed@male_b@base")
    RemoveAnimDict("amb_rest@world_human_smoking@nervous_stressed@male_b@idle_a")
    RemoveAnimDict("amb_rest@world_human_smoking@nervous_stressed@male_b@idle_g")
    RemoveAnimDict("amb_rest@world_human_smoking@male_c@base")
    RemoveAnimDict("amb_rest@world_human_smoking@male_c@idle_a")
    RemoveAnimDict("amb_rest@world_human_smoking@male_d@base")
    RemoveAnimDict("amb_rest@world_human_smoking@male_d@idle_a")
    RemoveAnimDict("amb_rest@world_human_smoking@male_d@idle_c")
    RemoveAnimDict("amb_rest@world_human_smoking@male_a@trans")
    RemoveAnimDict("amb_rest@world_human_smoking@male_c@trans")
    RemoveAnimDict("amb_rest@world_human_smoking@male_d@trans")
    RemoveAnimDict("amb_rest@world_human_smoking@female_a@base")
    RemoveAnimDict("amb_rest@world_human_smoking@female_a@idle_a")
    RemoveAnimDict("amb_rest@world_human_smoking@female_a@idle_b")
    RemoveAnimDict("amb_rest@world_human_smoking@female_b@base")
    RemoveAnimDict("amb_rest@world_human_smoking@female_b@idle_a")
    RemoveAnimDict("amb_rest@world_human_smoking@female_b@idle_b")
    RemoveAnimDict("amb_rest@world_human_smoking@female_c@base")
    RemoveAnimDict("amb_rest@world_human_smoking@female_c@idle_a")
    RemoveAnimDict("amb_rest@world_human_smoking@female_c@idle_b")
    RemoveAnimDict("amb_rest@world_human_smoking@female_b@trans")
    Wait(100)
    ClearPedTasks(cache.ped)
end)

---------------------------------
-- cigar
---------------------------------
RegisterNetEvent('rex-smoking:client:cigar')
AddEventHandler('rex-smoking:client:cigar', function()
    --TriggerServerEvent('hud:server:RelieveStress', Config.CigarRelieveStress)
    exports['fx-hud']:setStatus("stress",-50)
    exports['fx-hud']:setStatus("thirst",-5)
    DropPrompt(Config.Drop, Config.Prompts.DropKey, false)
    local prop_name = 'P_CIGAR01X'
    local dict = 'amb_rest@world_human_smoke_cigar@male_a@idle_b'
    local anim = 'idle_d'
    local x, y, z = table.unpack(GetEntityCoords(cache.ped, true))
    local prop = CreateObject(GetHashKey(prop_name), x, y, z + 0.2, true, true, true)
    local boneIndex = GetEntityBoneIndexByName(cache.ped, 'SKEL_R_Finger12')
    local smoking = false

    if not IsEntityPlayingAnim(cache.ped, dict, anim, 3) then
        local waiting = 0
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            waiting = waiting + 100
            Wait(100)
            if waiting > 5000 then
                print('issue with animation')
                break
            end
        end

        Wait(100)
        AttachEntityToEntity(prop, cache.ped, boneIndex, 0.01, -0.00500, 0.01550, 0.024, 300.0, -40.0, true, true, false, true,
            1, true)
        TaskPlayAnim(cache.ped, dict, anim, 8.0, -8.0, -1, 31, 0, true, 0, false, 0, false)
        Wait(1000)

        if proppromptdisplayed == false then
            PromptSetEnabled(PropPrompt, true)
            PromptSetVisible(PropPrompt, true)
            proppromptdisplayed = true
        end

        smoking = true
        while smoking do
            if IsEntityPlayingAnim(cache.ped, dict, anim, 3) then
                DisableControlAction(0, 0x07CE1E61, true)
                DisableControlAction(0, 0xF84FA74F, true)
                DisableControlAction(0, 0xCEE12B50, true)
                DisableControlAction(0, 0xB2F377E8, true)
                DisableControlAction(0, 0x8FFC75D6, true)
                DisableControlAction(0, 0xD9D0E1C0, true)

                if IsControlPressed(0, 0x3B24C470) then
                    PromptSetEnabled(PropPrompt, false)
                    PromptSetVisible(PropPrompt, false)
                    proppromptdisplayed = false
                    smoking = false
                    ClearPedSecondaryTask(cache.ped)
                    DeleteObject(prop)
                    RemoveAnimDict(dict)
                    break
                end
            else
                TaskPlayAnim(cache.ped, dict, anim, 8.0, -8.0, -1, 31, 0, true, 0, false, 0, false)
            end
            Wait(0)
        end
    end
end)



---------------------------------
-- pipe
---------------------------------
RegisterNetEvent('rex-smoking:client:pipe')
AddEventHandler('rex-smoking:client:pipe', function()
    --TriggerServerEvent('hud:server:RelieveStress', Config.PipeRelieveStress)
    exports['fx-hud']:setStatus("thirst",-5)
    DropPrompt(Config.Drop, Config.Prompts.DropKey, false)
    SmokePrompt(Config.Smoke, Config.Prompts.SmokeKey, false)
    StancePrompt(Config.Change, Config.Prompts.ChangeKey, false)
    local male = IsPedMale(cache.ped)
    local x, y, z = table.unpack(GetEntityCoords(cache.ped, true))
    local pipe= CreateObject(GetHashKey('P_PIPE01X'), x, y, z + 0.2, true, true, true)
    local righthand = GetEntityBoneIndexByName(cache.ped, "SKEL_R_Finger13")
    AttachEntityToEntity(pipe, cache.ped, righthand, 0.005, -0.045, 0.0, -170.0, 10.0, -15.0, true, true, false, true, 1, true)
    Anim(cache.ped,"amb_wander@code_human_smoking_wander@male_b@trans","nopipe_trans_pipe",-1,30)
    Wait(9000)
    Anim(cache.ped,"amb_rest@world_human_smoking@male_b@base","base",-1,31)

    while not IsEntityPlayingAnim(cache.ped,"amb_rest@world_human_smoking@male_b@base","base", 3) do
        Wait(100)
    end

    if proppromptdisplayed == false then
        PromptSetEnabled(PropPrompt, true)
        PromptSetVisible(PropPrompt, true)
        PromptSetEnabled(UsePrompt, true)
        PromptSetVisible(UsePrompt, true)
        PromptSetEnabled(ChangeStance, true)
        PromptSetVisible(ChangeStance, true)
        proppromptdisplayed = true
	end

    while IsEntityPlayingAnim(cache.ped, "amb_rest@world_human_smoking@male_b@base","base", 3) do

        Wait(2)
        if IsControlJustReleased(0, 0x3B24C470) then
            PromptSetEnabled(PropPrompt, false)
            PromptSetVisible(PropPrompt, false)
            PromptSetEnabled(UsePrompt, false)
            PromptSetVisible(UsePrompt, false)
            PromptSetEnabled(ChangeStance, false)
            PromptSetVisible(ChangeStance, false)
            proppromptdisplayed = false

            Anim(cache.ped, "amb_wander@code_human_smoking_wander@male_b@trans", "pipe_trans_nopipe", -1, 30)
            Wait(6066)
            DeleteEntity(pipe)
            ClearPedSecondaryTask(cache.ped)
            ClearPedTasks(cache.ped)
            Wait(10)
        end
        
        if IsControlJustReleased(0, 0xD51B784F) then
            exports['fx-hud']:setStatus("stress",-4)
            Anim(cache.ped, "amb_rest@world_human_smoking@pipe@proper@male_d@wip_base", "wip_base", -1, 30)
            Wait(5000)
            Anim(cache.ped, "amb_rest@world_human_smoking@male_b@base","base", -1, 31)
            Wait(100)
        end

        if IsControlJustReleased(0, 0x07B8BEAF) then
            if healing then
                local amount = 10
                if lesshealing then
                    amount = 5
                end
                if GetAttributeCoreValue(cache.ped, 0) + amount <= 100 then
                    local addhp = GetAttributeCoreValue(cache.ped, 0) + amount
                    Citizen.InvokeNative(0xC6258F41D86676E0, cache.ped, 0, addhp)
                else
                    Citizen.InvokeNative(0xC6258F41D86676E0, cache.ped, 0, 100)
                end
            end
            Anim(cache.ped, "amb_rest@world_human_smoking@male_b@idle_a","idle_a", -1, 30, 0)
            Wait(22600)
            Anim(cache.ped, "amb_rest@world_human_smoking@male_b@base","base", -1, 31, 0)
            Wait(100)
        end
    end

    PromptSetEnabled(PropPrompt, false)
    PromptSetVisible(PropPrompt, false)
    PromptSetEnabled(UsePrompt, false)
    PromptSetVisible(UsePrompt, false)
    PromptSetEnabled(ChangeStance, false)
    PromptSetVisible(ChangeStance, false)
    proppromptdisplayed = false

    DetachEntity(pipe, true, true)
    ClearPedSecondaryTask(cache.ped)
    RemoveAnimDict("amb_wander@code_human_smoking_wander@male_b@trans")
    RemoveAnimDict("amb_rest@world_human_smoking@male_b@base")
    RemoveAnimDict("amb_rest@world_human_smoking@pipe@proper@male_d@wip_base")
    RemoveAnimDict("amb_rest@world_human_smoking@male_b@idle_a")
    RemoveAnimDict("amb_rest@world_human_smoking@male_b@idle_b")
    Wait(100)
    ClearPedTasks(cache.ped)
    pipeon = false
end)

---------------------------------
-- chewing tobacco
---------------------------------
RegisterNetEvent('rex-smoking:client:chewingtobacco')
AddEventHandler('rex-smoking:client:chewingtobacco', function()
    --TriggerServerEvent('hud:server:RelieveStress', Config.ChewingRelieveStress)
    exports['fx-hud']:setStatus("stress",-15)
    DropPrompt(Config.Drop, Config.Prompts.DropKey, false)
    SmokePrompt(Config.Smoke, Config.Prompts.SmokeKey, false)
    StancePrompt(Config.Change, Config.Prompts.ChangeKey, false)
    local x, y, z = table.unpack(GetEntityCoords(cache.ped, true))
    local righthand = GetEntityBoneIndexByName(cache.ped, "SKEL_R_Finger13")

    local basedict = "amb_misc@world_human_chew_tobacco@male_a@base"
    local basedictB = "amb_misc@world_human_chew_tobacco@male_b@base"
    local MaleA =
    {
        [1] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_a@idle_a",['anim'] = "idle_a" },
        [2] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_a@idle_a",['anim'] = "idle_b" },
        [3] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_a@idle_a",['anim'] = "idle_c" },
        [4] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_a@idle_b",['anim'] = "idle_d" },
        [5] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_a@idle_b",['anim'] = "idle_e" },
        [6] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_a@idle_b",['anim'] = "idle_f" },
        [7] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_a@idle_c",['anim'] = "idle_g" },
        [8] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_a@idle_c",['anim'] = "idle_h" },
        [9] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_a@idle_c",['anim'] = "idle_i" },
        [7] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_a@idle_d",['anim'] = "idle_j" },
        [8] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_a@idle_d",['anim'] = "idle_k" },
        [9] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_a@idle_d",['anim'] = "idle_l" }
    }
    local MaleB =
    {
        [1] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_b@idle_a",['anim'] = "idle_a" },
        [2] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_b@idle_a",['anim'] = "idle_b" },
        [3] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_b@idle_a",['anim'] = "idle_c" },
        [4] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_b@idle_b",['anim'] = "idle_d" },
        [5] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_b@idle_b",['anim'] = "idle_e" },
        [6] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_b@idle_b",['anim'] = "idle_f" },
        [7] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_b@idle_c",['anim'] = "idle_g" },
        [8] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_b@idle_c",['anim'] = "idle_h" },
        [9] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_b@idle_c",['anim'] = "idle_i" },
        [7] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_b@idle_d",['anim'] = "idle_j" },
        [8] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_b@idle_d",['anim'] = "idle_k" },
        [9] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_b@idle_d",['anim'] = "idle_l" }
    }
    local stance = "MaleA"

    RequestAnimDict("amb_misc@world_human_chew_tobacco@male_a@idle_a")
    RequestAnimDict("amb_misc@world_human_chew_tobacco@male_a@idle_b")
    RequestAnimDict("amb_misc@world_human_chew_tobacco@male_a@idle_c")
    RequestAnimDict("amb_misc@world_human_chew_tobacco@male_a@idle_d")
    RequestAnimDict("amb_misc@world_human_chew_tobacco@male_b@idle_a")
    RequestAnimDict("amb_misc@world_human_chew_tobacco@male_b@idle_b")
    RequestAnimDict("amb_misc@world_human_chew_tobacco@male_b@idle_c")
    RequestAnimDict("amb_misc@world_human_chew_tobacco@male_b@idle_d")

    Anim(cache.ped, "amb_misc@world_human_chew_tobacco@male_a@stand_enter", "enter_back", -1, 30)
    Wait(2500)
    local chewingtobacco = CreateObject(GetHashKey('S_TOBACCOTIN01X'), x, y, z + 0.2, true, true, true)
    Wait(10)
    AttachEntityToEntity(chewingtobacco, cache.ped, righthand, 0.0, -0.05, 0.02, 30.0, 180.0, 0.0, true, true, false, true, 1,
        true)
    Wait(6000)
    DeleteEntity(chewingtobacco)
    Wait(3500)
    Anim(cache.ped, basedict, "base", -1, 31, 0)

    while not IsEntityPlayingAnim(cache.ped, basedict, "base", 3) do
        Wait(100)
    end

    if proppromptdisplayed == false then
        PromptSetEnabled(PropPrompt, true)
        PromptSetVisible(PropPrompt, true)
        PromptSetEnabled(UsePrompt, true)
        PromptSetVisible(UsePrompt, true)
        PromptSetEnabled(ChangeStance, true)
        PromptSetVisible(ChangeStance, true)
        proppromptdisplayed = true
    end

    while IsEntityPlayingAnim(cache.ped, basedict, "base", 3) or IsEntityPlayingAnim(cache.ped, basedictB, "base", 3) do
        Wait(5)
        if IsControlJustReleased(0, 0x3B24C470) then
            PromptSetEnabled(PropPrompt, false)
            PromptSetVisible(PropPrompt, false)
            PromptSetEnabled(UsePrompt, false)
            PromptSetVisible(UsePrompt, false)
            PromptSetEnabled(ChangeStance, false)
            PromptSetVisible(ChangeStance, false)
            proppromptdisplayed = false

            Anim(cache.ped, "amb_misc@world_human_chew_tobacco@male_b@idle_b", "idle_d", 5500, 30)
            Wait(5500)
            ClearPedSecondaryTask(cache.ped)
            ClearPedTasks(cache.ped)
            Wait(10)
        end

        if IsControlJustReleased(0, 0x07B8BEAF) then
            local random = math.random(1, 9)
            if stance == "MaleA" then
                randomdict = MaleA[random]['dict']
                randomanim = MaleA[random]['anim']
            else
                randomdict = MaleB[random]['dict']
                randomanim = MaleB[random]['anim']
            end
            animduration = GetAnimDuration(randomdict, randomanim) * 1000
            Wait(100)
            PromptSetEnabled(PropPrompt, false)
            PromptSetVisible(PropPrompt, false)
            PromptSetEnabled(UsePrompt, false)
            PromptSetVisible(UsePrompt, false)
            PromptSetEnabled(ChangeStance, false)
            PromptSetVisible(ChangeStance, false)
            Anim(cache.ped, randomdict, randomanim, -1, 30, 0)
            Wait(animduration)
            if stance == "MaleA" then
                Anim(cache.ped, basedict, "base", -1, 31, 0)
            else
                Anim(cache.ped, basedictB, "base", -1, 31, 0)
            end
            PromptSetEnabled(PropPrompt, true)
            PromptSetVisible(PropPrompt, true)
            PromptSetEnabled(UsePrompt, true)
            PromptSetVisible(UsePrompt, true)
            PromptSetEnabled(ChangeStance, true)
            PromptSetVisible(ChangeStance, true)
            Wait(100)
        end
        if IsControlJustReleased(0, 0xD51B784F) then
            if stance == "MaleA" then
                Anim(cache.ped, "amb_misc@world_human_chew_tobacco@male_a@trans", "a_trans_b", -1, 30)
                PromptSetEnabled(PropPrompt, false)
                PromptSetVisible(PropPrompt, false)
                PromptSetEnabled(UsePrompt, false)
                PromptSetVisible(UsePrompt, false)
                PromptSetEnabled(ChangeStance, false)
                PromptSetVisible(ChangeStance, false)
                Wait(7333)
                Anim(cache.ped, basedictB, "base", -1, 30, 0)
                while not IsEntityPlayingAnim(cache.ped, basedictB, "base", 3) do
                    Wait(100)
                end
                PromptSetEnabled(PropPrompt, true)
                PromptSetVisible(PropPrompt, true)
                PromptSetEnabled(UsePrompt, true)
                PromptSetVisible(UsePrompt, true)
                PromptSetEnabled(ChangeStance, true)
                PromptSetVisible(ChangeStance, true)
                stance = "MaleB"
            else
                Anim(cache.ped, "amb_misc@world_human_chew_tobacco@male_b@trans", "b_trans_a", -1, 30)
                PromptSetEnabled(PropPrompt, false)
                PromptSetVisible(PropPrompt, false)
                PromptSetEnabled(UsePrompt, false)
                PromptSetVisible(UsePrompt, false)
                PromptSetEnabled(ChangeStance, false)
                PromptSetVisible(ChangeStance, false)
                Wait(5833)
                Anim(cache.ped, basedict, "base", -1, 30, 0)
                while not IsEntityPlayingAnim(cache.ped, basedict, "base", 3) do
                    Wait(100)
                end
                PromptSetEnabled(PropPrompt, true)
                PromptSetVisible(PropPrompt, true)
                PromptSetEnabled(UsePrompt, true)
                PromptSetVisible(UsePrompt, true)
                PromptSetEnabled(ChangeStance, true)
                PromptSetVisible(ChangeStance, true)
                stance = "MaleA"
            end
        end
    end

    PromptSetEnabled(PropPrompt, false)
    PromptSetVisible(PropPrompt, false)
    PromptSetEnabled(UsePrompt, false)
    PromptSetVisible(UsePrompt, false)
    PromptSetEnabled(ChangeStance, false)
    PromptSetVisible(ChangeStance, false)
    proppromptdisplayed = false

    DetachEntity(chewingtobacco, true, true)
    ClearPedSecondaryTask(cache.ped)
    RemoveAnimDict("amb_misc@world_human_chew_tobacco@male_a@stand_enter")
    RemoveAnimDict(base)
    RemoveAnimDict("amb_misc@world_human_chew_tobacco@male_a@idle_a")
    RemoveAnimDict("amb_misc@world_human_chew_tobacco@male_a@idle_b")
    RemoveAnimDict("amb_misc@world_human_chew_tobacco@male_a@idle_c")
    RemoveAnimDict("amb_misc@world_human_chew_tobacco@male_a@idle_d")
    RemoveAnimDict("amb_misc@world_human_chew_tobacco@male_b@idle_a")
    RemoveAnimDict("amb_misc@world_human_chew_tobacco@male_b@idle_b")
    RemoveAnimDict("amb_misc@world_human_chew_tobacco@male_b@idle_c")
    RemoveAnimDict("amb_misc@world_human_chew_tobacco@male_b@idle_d")
    Wait(100)
    ClearPedTasks(cache.ped)
end)

---------------------------------
-- chewing tobacco
---------------------------------
RegisterNetEvent('rex-smoking:client:chewinggum')
AddEventHandler('rex-smoking:client:chewinggum', function()
    --TriggerServerEvent('hud:server:RelieveStress', Config.ChewingRelieveStress)
    exports['fx-hud']:setStatus("stress",-45)
    exports['fx-hud']:setStatus("thirst",-15)
    
    DropPrompt(Config.Drop, Config.Prompts.DropKey, false)
    SmokePrompt(Config.Smoke, Config.Prompts.SmokeKey, false)
    StancePrompt(Config.Change, Config.Prompts.ChangeKey, false)
    local x, y, z = table.unpack(GetEntityCoords(cache.ped, true))
    local righthand = GetEntityBoneIndexByName(cache.ped, "SKEL_R_Finger13")

    local basedict = "amb_misc@world_human_chew_tobacco@male_a@base"
    local basedictB = "amb_misc@world_human_chew_tobacco@male_b@base"
    local MaleA =
    {
        [1] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_a@idle_a",['anim'] = "idle_a" },
        [2] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_a@idle_a",['anim'] = "idle_b" },
        [3] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_a@idle_a",['anim'] = "idle_c" },
        [4] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_a@idle_b",['anim'] = "idle_d" },
        [5] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_a@idle_b",['anim'] = "idle_e" },
        [6] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_a@idle_b",['anim'] = "idle_f" },
        [7] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_a@idle_c",['anim'] = "idle_g" },
        [8] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_a@idle_c",['anim'] = "idle_h" },
        [9] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_a@idle_c",['anim'] = "idle_i" },
        [7] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_a@idle_d",['anim'] = "idle_j" },
        [8] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_a@idle_d",['anim'] = "idle_k" },
        [9] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_a@idle_d",['anim'] = "idle_l" }
    }
    local MaleB =
    {
        [1] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_b@idle_a",['anim'] = "idle_a" },
        [2] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_b@idle_a",['anim'] = "idle_b" },
        [3] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_b@idle_a",['anim'] = "idle_c" },
        [4] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_b@idle_b",['anim'] = "idle_d" },
        [5] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_b@idle_b",['anim'] = "idle_e" },
        [6] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_b@idle_b",['anim'] = "idle_f" },
        [7] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_b@idle_c",['anim'] = "idle_g" },
        [8] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_b@idle_c",['anim'] = "idle_h" },
        [9] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_b@idle_c",['anim'] = "idle_i" },
        [7] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_b@idle_d",['anim'] = "idle_j" },
        [8] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_b@idle_d",['anim'] = "idle_k" },
        [9] = { ['dict'] = "amb_misc@world_human_chew_tobacco@male_b@idle_d",['anim'] = "idle_l" }
    }
    local stance = "MaleA"

    RequestAnimDict("amb_misc@world_human_chew_tobacco@male_a@idle_a")
    RequestAnimDict("amb_misc@world_human_chew_tobacco@male_a@idle_b")
    RequestAnimDict("amb_misc@world_human_chew_tobacco@male_a@idle_c")
    RequestAnimDict("amb_misc@world_human_chew_tobacco@male_a@idle_d")
    RequestAnimDict("amb_misc@world_human_chew_tobacco@male_b@idle_a")
    RequestAnimDict("amb_misc@world_human_chew_tobacco@male_b@idle_b")
    RequestAnimDict("amb_misc@world_human_chew_tobacco@male_b@idle_c")
    RequestAnimDict("amb_misc@world_human_chew_tobacco@male_b@idle_d")

    Anim(cache.ped, "amb_misc@world_human_chew_tobacco@male_a@stand_enter", "enter_back", -1, 30)
    Wait(2500)
    local chewingtobacco = CreateObject(GetHashKey('S_TOBACCOTIN01X'), x, y, z + 0.2, true, true, true)
    Wait(10)
    AttachEntityToEntity(chewingtobacco, cache.ped, righthand, 0.0, -0.05, 0.02, 30.0, 180.0, 0.0, true, true, false, true, 1,
        true)
    Wait(6000)
    DeleteEntity(chewingtobacco)
    Wait(3500)
    Anim(cache.ped, basedict, "base", -1, 31, 0)

    while not IsEntityPlayingAnim(cache.ped, basedict, "base", 3) do
        Wait(100)
    end

    if proppromptdisplayed == false then
        PromptSetEnabled(PropPrompt, true)
        PromptSetVisible(PropPrompt, true)
        PromptSetEnabled(UsePrompt, true)
        PromptSetVisible(UsePrompt, true)
        PromptSetEnabled(ChangeStance, true)
        PromptSetVisible(ChangeStance, true)
        proppromptdisplayed = true
    end

    while IsEntityPlayingAnim(cache.ped, basedict, "base", 3) or IsEntityPlayingAnim(cache.ped, basedictB, "base", 3) do
        Wait(5)
        if IsControlJustReleased(0, 0x3B24C470) then
            PromptSetEnabled(PropPrompt, false)
            PromptSetVisible(PropPrompt, false)
            PromptSetEnabled(UsePrompt, false)
            PromptSetVisible(UsePrompt, false)
            PromptSetEnabled(ChangeStance, false)
            PromptSetVisible(ChangeStance, false)
            proppromptdisplayed = false

            Anim(cache.ped, "amb_misc@world_human_chew_tobacco@male_b@idle_b", "idle_d", 5500, 30)
            Wait(5500)
            ClearPedSecondaryTask(cache.ped)
            ClearPedTasks(cache.ped)
            Wait(10)
        end

        if IsControlJustReleased(0, 0x07B8BEAF) then
            local random = math.random(1, 9)
            if stance == "MaleA" then
                randomdict = MaleA[random]['dict']
                randomanim = MaleA[random]['anim']
            else
                randomdict = MaleB[random]['dict']
                randomanim = MaleB[random]['anim']
            end
            animduration = GetAnimDuration(randomdict, randomanim) * 1000
            Wait(100)
            PromptSetEnabled(PropPrompt, false)
            PromptSetVisible(PropPrompt, false)
            PromptSetEnabled(UsePrompt, false)
            PromptSetVisible(UsePrompt, false)
            PromptSetEnabled(ChangeStance, false)
            PromptSetVisible(ChangeStance, false)
            Anim(cache.ped, randomdict, randomanim, -1, 30, 0)
            Wait(animduration)
            if stance == "MaleA" then
                Anim(cache.ped, basedict, "base", -1, 31, 0)
            else
                Anim(cache.ped, basedictB, "base", -1, 31, 0)
            end
            PromptSetEnabled(PropPrompt, true)
            PromptSetVisible(PropPrompt, true)
            PromptSetEnabled(UsePrompt, true)
            PromptSetVisible(UsePrompt, true)
            PromptSetEnabled(ChangeStance, true)
            PromptSetVisible(ChangeStance, true)
            Wait(100)
        end
        if IsControlJustReleased(0, 0xD51B784F) then
            if stance == "MaleA" then
                Anim(cache.ped, "amb_misc@world_human_chew_tobacco@male_a@trans", "a_trans_b", -1, 30)
                PromptSetEnabled(PropPrompt, false)
                PromptSetVisible(PropPrompt, false)
                PromptSetEnabled(UsePrompt, false)
                PromptSetVisible(UsePrompt, false)
                PromptSetEnabled(ChangeStance, false)
                PromptSetVisible(ChangeStance, false)
                Wait(7333)
                Anim(cache.ped, basedictB, "base", -1, 30, 0)
                while not IsEntityPlayingAnim(cache.ped, basedictB, "base", 3) do
                    Wait(100)
                end
                PromptSetEnabled(PropPrompt, true)
                PromptSetVisible(PropPrompt, true)
                PromptSetEnabled(UsePrompt, true)
                PromptSetVisible(UsePrompt, true)
                PromptSetEnabled(ChangeStance, true)
                PromptSetVisible(ChangeStance, true)
                stance = "MaleB"
            else
                Anim(cache.ped, "amb_misc@world_human_chew_tobacco@male_b@trans", "b_trans_a", -1, 30)
                PromptSetEnabled(PropPrompt, false)
                PromptSetVisible(PropPrompt, false)
                PromptSetEnabled(UsePrompt, false)
                PromptSetVisible(UsePrompt, false)
                PromptSetEnabled(ChangeStance, false)
                PromptSetVisible(ChangeStance, false)
                Wait(5833)
                Anim(cache.ped, basedict, "base", -1, 30, 0)
                while not IsEntityPlayingAnim(cache.ped, basedict, "base", 3) do
                    Wait(100)
                end
                PromptSetEnabled(PropPrompt, true)
                PromptSetVisible(PropPrompt, true)
                PromptSetEnabled(UsePrompt, true)
                PromptSetVisible(UsePrompt, true)
                PromptSetEnabled(ChangeStance, true)
                PromptSetVisible(ChangeStance, true)
                stance = "MaleA"
            end
        end
    end

    PromptSetEnabled(PropPrompt, false)
    PromptSetVisible(PropPrompt, false)
    PromptSetEnabled(UsePrompt, false)
    PromptSetVisible(UsePrompt, false)
    PromptSetEnabled(ChangeStance, false)
    PromptSetVisible(ChangeStance, false)
    proppromptdisplayed = false

    DetachEntity(chewingtobacco, true, true)
    ClearPedSecondaryTask(cache.ped)
    RemoveAnimDict("amb_misc@world_human_chew_tobacco@male_a@stand_enter")
    RemoveAnimDict(base)
    RemoveAnimDict("amb_misc@world_human_chew_tobacco@male_a@idle_a")
    RemoveAnimDict("amb_misc@world_human_chew_tobacco@male_a@idle_b")
    RemoveAnimDict("amb_misc@world_human_chew_tobacco@male_a@idle_c")
    RemoveAnimDict("amb_misc@world_human_chew_tobacco@male_a@idle_d")
    RemoveAnimDict("amb_misc@world_human_chew_tobacco@male_b@idle_a")
    RemoveAnimDict("amb_misc@world_human_chew_tobacco@male_b@idle_b")
    RemoveAnimDict("amb_misc@world_human_chew_tobacco@male_b@idle_c")
    RemoveAnimDict("amb_misc@world_human_chew_tobacco@male_b@idle_d")
    Wait(100)
    ClearPedTasks(cache.ped)
end)


--USE Native PIPE
RegisterNetEvent('rex-smoking:client:peacepipe')
AddEventHandler('rex-smoking:client:peacepipe', function() 
    --TriggerServerEvent('hud:server:RelieveStress', Config.PipeRelieveStress)
    exports['fx-hud']:setStatus("stress",-20)
    DropPrompt(Config.Drop, Config.Prompts.DropKey, false)
    SmokePrompt(Config.Smoke, Config.Prompts.SmokeKey, false)
    StancePrompt(Config.Change, Config.Prompts.ChangeKey, false)
    ExecuteCommand('close')
    local ped = PlayerPedId()
    local male = IsPedMale(ped)
    local x,y,z = table.unpack(GetEntityCoords(ped, true))
    local pipe = CreateObject(GetHashKey("p_peacepipe01x"), x, y, z + 0.2, true, true, true)
    local righthand = GetEntityBoneIndexByName(ped, "SKEL_R_Finger13")
                                            -- del y atras//derech izquier//arriba abajo
    -- AttachEntityToEntity(pipe, ped, righthand, -0.13, -0.025, 0.18, -170.0, 20.0, -15.0, true, true, false, false, 1, true)
    AttachEntityToEntity(pipe, ped, righthand, -0.06, -0.025, 0.15, -170.0, 20.0, -22.0, true, true, false, false, 1, true)
    Anim(ped,"script_story@ntv1@ig@ig_8","ig8_loop_p_peacepipe02",-1,30)
    Wait(3000)
    Anim(ped,"amb_rest@world_human_smoking@male_b@base","base",-1,31)

    while not IsEntityPlayingAnim(ped,"amb_rest@world_human_smoking@male_b@base","base", 3) do
        Wait(100)
    end

    if proppromptdisplayed == false then
        PromptSetEnabled(PropPrompt, true)
        PromptSetVisible(PropPrompt, true)
        PromptSetEnabled(UsePrompt, true)
        PromptSetVisible(UsePrompt, true)
        PromptSetEnabled(ChangeStance, true)
        PromptSetVisible(ChangeStance, true)
        proppromptdisplayed = true
	end

    while IsEntityPlayingAnim(ped, "amb_rest@world_human_smoking@male_b@base","base", 3) do

        Wait(5)
		if IsControlJustReleased(0, 0x3B24C470) then
            PromptSetEnabled(PropPrompt, false)
            PromptSetVisible(PropPrompt, false)
            PromptSetEnabled(UsePrompt, false)
            PromptSetVisible(UsePrompt, false)
            PromptSetEnabled(ChangeStance, false)
            PromptSetVisible(ChangeStance, false)
            proppromptdisplayed = false

            Anim(ped, "amb_wander@code_human_smoking_wander@male_b@trans", "pipe_trans_nopipe", -1, 30)
            Wait(6066)
            DeleteEntity(pipe)
            ClearPedSecondaryTask(ped)
            ClearPedTasks(ped)
            Wait(10)
		end
        
        if IsControlJustReleased(0, 0xD51B784F) then
            Anim(ped, "amb_rest@world_human_smoking@pipe@proper@male_d@wip_base", "wip_base", -1, 30)
            Wait(5000)
            Anim(ped, "amb_rest@world_human_smoking@male_b@base","base", -1, 31)
            Wait(100)
        end

        if IsControlJustReleased(0, 0x07B8BEAF) then
            Wait(500)
            if IsControlPressed(0, 0x07B8BEAF) then
                Anim(ped, "amb_rest@world_human_smoking@male_b@idle_b","idle_d", -1, 30, 0)
                Wait(15599)
                Anim(ped, "amb_rest@world_human_smoking@male_b@base","base", -1, 31, 0)
                Wait(100)
            else
                Anim(ped, "amb_rest@world_human_smoking@male_b@idle_a","idle_a", -1, 30, 0)
                Wait(22600)
                Anim(ped, "amb_rest@world_human_smoking@male_b@base","base", -1, 31, 0)
                Wait(100)
            end
        end
    end

    PromptSetEnabled(PropPrompt, false)
    PromptSetVisible(PropPrompt, false)
    PromptSetEnabled(UsePrompt, false)
    PromptSetVisible(UsePrompt, false)
    PromptSetEnabled(ChangeStance, false)
    PromptSetVisible(ChangeStance, false)
    proppromptdisplayed = false

    DetachEntity(pipe, true, true)
    ClearPedSecondaryTask(ped)
    RemoveAnimDict("amb_wander@code_human_smoking_wander@male_b@trans")
    RemoveAnimDict("amb_rest@world_human_smoking@male_b@base")
    RemoveAnimDict("amb_rest@world_human_smoking@pipe@proper@male_d@wip_base")
    RemoveAnimDict("amb_rest@world_human_smoking@male_b@idle_a")
    RemoveAnimDict("amb_rest@world_human_smoking@male_b@idle_b")
    Wait(100)
    
    ClearPedTasks(ped)
end)



--USE opium PIPE
RegisterNetEvent('rex-smoking:client:opiumpipe')
AddEventHandler('rex-smoking:client:opiumpipe', function() 
    --TriggerServerEvent('hud:server:RelieveStress', Config.PipeRelieveStress)
    exports['fx-hud']:setStatus("stress",-25)
    DropPrompt(Config.Drop, Config.Prompts.DropKey, false)
    SmokePrompt(Config.Smoke, Config.Prompts.SmokeKey, false)
    StancePrompt(Config.Change, Config.Prompts.ChangeKey, false)
    ExecuteCommand('close')
    local ped = PlayerPedId()
    local male = IsPedMale(ped)
    local x,y,z = table.unpack(GetEntityCoords(ped, true))
    local pipe = CreateObject(GetHashKey("p_opiumpipe01x"), x, y, z + 0.2, true, true, true)
    local righthand = GetEntityBoneIndexByName(ped, "SKEL_R_Finger13")
                                            -- del y atras//derech izquier//arriba abajo
    AttachEntityToEntity(pipe, ped, righthand, -0.0, -0.025, 0.0, -170.0, 20.0, -15.0, true, true, false, false, 1, true)
    --AttachEntityToEntity(pipe, ped, righthand, -0.06, -0.025, 0.15, 0.0, 0.0, -90.0, true, true, false, false, 1, true)

    Anim(ped,"script_story@ntv1@ig@ig_8","ig8_loop_p_peacepipe02",-1,30)
    Wait(3000)
    Anim(ped,"amb_rest@world_human_smoking@male_b@base","base",-1,31)

    while not IsEntityPlayingAnim(ped,"amb_rest@world_human_smoking@male_b@base","base", 3) do
        Wait(100)
    end

    if proppromptdisplayed == false then
        PromptSetEnabled(PropPrompt, true)
        PromptSetVisible(PropPrompt, true)
        PromptSetEnabled(UsePrompt, true)
        PromptSetVisible(UsePrompt, true)
        PromptSetEnabled(ChangeStance, true)
        PromptSetVisible(ChangeStance, true)
        proppromptdisplayed = true
	end

    while IsEntityPlayingAnim(ped, "amb_rest@world_human_smoking@male_b@base","base", 3) do

        Wait(5)
		if IsControlJustReleased(0, 0x3B24C470) then
            PromptSetEnabled(PropPrompt, false)
            PromptSetVisible(PropPrompt, false)
            PromptSetEnabled(UsePrompt, false)
            PromptSetVisible(UsePrompt, false)
            PromptSetEnabled(ChangeStance, false)
            PromptSetVisible(ChangeStance, false)
            proppromptdisplayed = false

            Anim(ped, "amb_wander@code_human_smoking_wander@male_b@trans", "pipe_trans_nopipe", -1, 30)
            Wait(6066)
            DeleteEntity(pipe)
            ClearPedSecondaryTask(ped)
            ClearPedTasks(ped)
            Wait(10)
		end
        
        if IsControlJustReleased(0, 0xD51B784F) then
            Anim(ped, "amb_rest@world_human_smoking@pipe@proper@male_d@wip_base", "wip_base", -1, 30)
            Wait(5000)
            Anim(ped, "amb_rest@world_human_smoking@male_b@base","base", -1, 31)
            Wait(100)
        end

        if IsControlJustReleased(0, 0x07B8BEAF) then
            Wait(500)
            if IsControlPressed(0, 0x07B8BEAF) then
                Anim(ped, "amb_rest@world_human_smoking@male_b@idle_b","idle_d", -1, 30, 0)
                Wait(15599)
                Anim(ped, "amb_rest@world_human_smoking@male_b@base","base", -1, 31, 0)
                Wait(100)
            else
                Anim(ped, "amb_rest@world_human_smoking@male_b@idle_a","idle_a", -1, 30, 0)
                Wait(22600)
                Anim(ped, "amb_rest@world_human_smoking@male_b@base","base", -1, 31, 0)
                Wait(100)
            end
        end
    end

    PromptSetEnabled(PropPrompt, false)
    PromptSetVisible(PropPrompt, false)
    PromptSetEnabled(UsePrompt, false)
    PromptSetVisible(UsePrompt, false)
    PromptSetEnabled(ChangeStance, false)
    PromptSetVisible(ChangeStance, false)
    proppromptdisplayed = false

    DetachEntity(pipe, true, true)
    ClearPedSecondaryTask(ped)
    RemoveAnimDict("amb_wander@code_human_smoking_wander@male_b@trans")
    RemoveAnimDict("amb_rest@world_human_smoking@male_b@base")
    RemoveAnimDict("amb_rest@world_human_smoking@pipe@proper@male_d@wip_base")
    RemoveAnimDict("amb_rest@world_human_smoking@male_b@idle_a")
    RemoveAnimDict("amb_rest@world_human_smoking@male_b@idle_b")
    Wait(100)
    
    ClearPedTasks(ped)
end)
