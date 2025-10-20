local RSGCore = exports['rsg-core']:GetCoreObject()

function FPrompt(text, button, hold)
    Citizen.CreateThread(function()
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
    end)
end

function LMPrompt(text, button, hold)
    Citizen.CreateThread(function()
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
    end)
end

function EPrompt(text, button, hold)
    Citizen.CreateThread(function()
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
    end)
end

function Anim(actor, dict, body, duration, flags, introtiming, exittiming)
    Citizen.CreateThread(function()
        RequestAnimDict(dict)
        local dur = duration or -1
        local flag = flags or 1
        local intro = tonumber(introtiming) or 1.0
        local exit = tonumber(exittiming) or 1.0
        timeout = 5
        while (not HasAnimDictLoaded(dict) and timeout > 0) do
            timeout = timeout - 1
            if timeout == 0 then
                print("Animation Failed to Load")
            end
            Citizen.Wait(300)
        end
        TaskPlayAnim(actor, dict, body, intro, exit, dur, flag --[[1 for repeat--]], 1, false, false, false, 0, true)
    end)
end

function StopAnim(dict, body)
    Citizen.CreateThread(function()
        StopAnimTask(PlayerPedId(), dict, body, 1.0)
    end)
end


--Fan
RegisterNetEvent('prop:fan')
AddEventHandler('prop:fan', function() 
    FPrompt("Put Away", 0x3B24C470, false)
    LMPrompt("Little Wave", 0x07B8BEAF, false)
    --ExecuteCommand('close')
    local ped = PlayerPedId()
    local male = IsPedMale(ped)
    local x,y,z = table.unpack(GetEntityCoords(ped, true))
    
    local righthand = GetEntityBoneIndexByName(ped, "SKEL_R_Finger13")

    Anim(ped,"amb_wander@code_human_fan_wander@female_a@trans","nonfan_trans_fan",-1,30)
    Wait(1000)
    local fan = CreateObject(GetHashKey('P_CS_FAN01X'), x, y, z + 0.2, true, true, true)
    AttachEntityToEntity(fan, ped, righthand, 0.0, 0.0, -0.02, 0.0, 120.0, 55.0, true, true, false, true, 1, true)
    
    PlayEntityAnim(fan, "nonfan_trans_fan_fan", "amb_wander@code_human_fan_wander@female_a@trans", 0.0, 0, 0, "OpenFan", 0.0, 0)
    Wait(2233)
    Anim(ped,"amb_rest@world_human_fan@female_a@base","base",-1,31)
    
    while not IsEntityPlayingAnim(ped,"amb_rest@world_human_fan@female_a@base","base", 3) do
        Wait(100)
    end

    if proppromptdisplayed == false then
        PromptSetEnabled(PropPrompt, true)
        PromptSetVisible(PropPrompt, true)
        PromptSetEnabled(UsePrompt, true)
        PromptSetVisible(UsePrompt, true)
        proppromptdisplayed = true
	end

    while  IsEntityPlayingAnim(ped, "amb_rest@world_human_fan@female_a@base","base", 3) do

        Wait(5)
		if IsControlJustReleased(0, 0x3B24C470) then
            PromptSetEnabled(PropPrompt, false)
            PromptSetVisible(PropPrompt, false)
            PromptSetEnabled(UsePrompt, false)
            PromptSetVisible(UsePrompt, false)
            proppromptdisplayed = false

            Anim(ped, "amb_wander@code_human_fan_wander@female_a@trans", "fan_trans_nonfan", -1, 30)
            Wait(100)
            PlayEntityAnim(fan, "fan_trans_nonfan_fan", "amb_wander@code_human_fan_wander@female_a@trans", 0.0, 0, 0, "CloseFan", 0.0, 0)
            Wait(1800)
            DeleteEntity(fan)
            ClearPedSecondaryTask(ped)
            ClearPedTasks(ped)
            Wait(10)
		end
        
        if IsControlJustReleased(0, 0x07B8BEAF) then
            Wait(500)
            if IsControlPressed(0, 0x07B8BEAF) then
                Anim(ped, "amb_rest@world_human_fan@female_a@idle_c","idle_g", -1, 30, 0)
                Wait(11800)
                Anim(ped, "amb_rest@world_human_fan@female_a@base","base", -1, 31, 0)
                Wait(100)
            else
                Anim(ped, "amb_rest@world_human_fan@female_a@idle_a","idle_a", -1, 30, 0)
                Wait(5400)
                Anim(ped, "amb_rest@world_human_fan@female_a@base","base", -1, 31, 0)
                Wait(100)
            end
        end
    end

    PromptSetEnabled(PropPrompt, false)
    PromptSetVisible(PropPrompt, false)
    PromptSetEnabled(UsePrompt, false)
    PromptSetVisible(UsePrompt, false)
    proppromptdisplayed = false

    DetachEntity(fan, true, true)
    ClearPedSecondaryTask(ped)
    RemoveAnimDict("amb_wander@code_human_fan_wander@female_a@trans")
    RemoveAnimDict("amb_rest@world_human_fan@female_a@base")
    RemoveAnimDict("amb_rest@world_human_fan@female_a@idle_a")
    RemoveAnimDict("amb_rest@world_human_fan@female_a@idle_c")
    Wait(100)
    ClearPedTasks(ped)
end)

-- RegisterNetEvent('consumables:client:Usefirstaid', function()
--     local ped = PlayerPedId()
--     local hasItem = RSGCore.Functions.HasItem('firstaid', 1)
    
--     if hasItem then
--         RSGCore.Functions.Progressbar("use_firstaid", "Using first aid kit..", 4000, false, true, {
--             disableMovement = false,
--             disableCarMovement = false,
--             disableMouse = false,
--             disableCombat = true,
--         }, {
--             animDict = "mini_games@story@mob4@heal_jules@bandage@arthur",
--             anim = "bandage_fast",
--             flags = 1,
--         }, {}, {}, function() -- Done
--             StopAnimTask(ped, "mini_games@story@mob4@heal_jules@bandage@arthur", "bandage_fast", 1.0)
--             TriggerServerEvent('consumables:server:removeitem', 'firstaid', 1)
--             SetEntityHealth(ped, GetEntityHealth(ped) + 300)
--             TriggerEvent("fuzzy_wounds:ResetLimbs", source)
--             TriggerEvent("fuzzy_wounds:RemoveBleed", source)
--             TriggerEvent('RSGCore:Notify', "You have used the first aid kit", 'success')
--         end, function() -- Cancel
--             StopAnimTask(ped, "mini_games@story@mob4@heal_jules@bandage@arthur", "bandage_fast", 1.0)
--             TriggerEvent('RSGCore:Notify', "You have canceled the use of the first aid kit", 'error')
--         end)
--     else
--         TriggerEvent('RSGCore:Notify', "You don't have any first aid kit!", 'error')
--     end
-- end)

-- RegisterNetEvent('consumables:client:Usefirstaid', function()
--     local ped = PlayerPedId()
--     local hasItem = RSGCore.Functions.HasItem('firstaid', 1)
    
--     if hasItem then
--         if lib.progressBar({
--             duration = 4000,
--             label = 'Using first aid kit...',
--             useWhileDead = false,
--             canCancel = true,
--             disable = {
--                 move = false,
--                 car = false,
--                 mouse = false,
--                 combat = true
--             },
--             anim = {
--                 dict = "mini_games@story@mob4@heal_jules@bandage@arthur",
--                 clip = "bandage_fast"
--             },
--         }) then
--             -- Progress finished successfully
--             StopAnimTask(ped, "mini_games@story@mob4@heal_jules@bandage@arthur", "bandage_fast", 1.0)
--             TriggerServerEvent('consumables:server:removeitem', 'firstaid', 1)
--             SetEntityHealth(ped, GetEntityHealth(ped) + 300)
--             TriggerEvent("fuzzy_wounds:ResetLimbs", source)
--             TriggerEvent("fuzzy_wounds:RemoveBleed", source)
--             TriggerEvent('RSGCore:Notify', "You have used the first aid kit", 'success')
--         else
--             -- Progress was cancelled
--             StopAnimTask(ped, "mini_games@story@mob4@heal_jules@bandage@arthur", "bandage_fast", 1.0)
--             TriggerEvent('RSGCore:Notify', "You have canceled the use of the first aid kit", 'error')
--         end
--     else
--         TriggerEvent('RSGCore:Notify', "You don't have any first aid kit!", 'error')
--     end
-- end)


---------------------
--medic
-----
-- RegisterNetEvent('consumables:client:UseGauze', function()
--     local ped = PlayerPedId()
--     local hasItem = RSGCore.Functions.HasItem('gauze', 1)
    
--     if hasItem then
--         RSGCore.Functions.Progressbar("use_gauze", "Using gauze..", 4000, false, true, {
--             disableMovement = false,
--             disableCarMovement = false,
--             disableMouse = false,
--             disableCombat = true,
--         }, {
--             animDict = "mini_games@story@mob4@heal_jules@bandage@arthur",
--             anim = "bandage_fast",
--             flags = 1,
--         }, {}, {}, function() -- Done
--             StopAnimTask(ped, "mini_games@story@mob4@heal_jules@bandage@arthur", "bandage_fast", 1.0)
--             TriggerServerEvent('consumables:server:removeitem', 'gauze', 1)
--             SetEntityHealth(ped, GetEntityHealth(ped) + 300)
--             --TriggerEvent("fuzzy_wounds:ResetLimbs", source)
--             TriggerEvent("fuzzy_wounds:RemoveBleed", source)
--             TriggerEvent('RSGCore:Notify', "You have used the gauze and stopped the bleeding", 'success')
--         end, function() -- Cancel
--             StopAnimTask(ped, "mini_games@story@mob4@heal_jules@bandage@arthur", "bandage_fast", 1.0)
--             TriggerEvent('RSGCore:Notify', "You have canceled the use of the gauze", 'error')
--         end)
--     else
--         TriggerEvent('RSGCore:Notify', "You don't have any gauze!", 'error')
--     end
-- end)


-- local morfinaCount = 0 -- Variable para llevar la cuenta de las veces que se usa la morfina

-- RegisterNetEvent('consumables:client:Usemorfina')
-- AddEventHandler('consumables:client:Usemorfina', function()
--     local playerId = PlayerId()
--     local ped = PlayerPedId()
--     local tier = 2
--     local hasItem = RSGCore.Functions.HasItem('morfina', 1)
    
--     if hasItem then
--         RSGCore.Functions.Progressbar("use_morfina", "Injecting morphine..", 2000, false, true, {
--             disableMovement = false,
--             disableCarMovement = false,
--             disableMouse = false,
--             disableCombat = true,
--         }, {
--             animDict = "mech_inventory@item@stimulants@inject@quick",
--             anim = "quick_stimulant_inject_rhand",
--             flags = 1,
--         }, {}, {}, function() -- Done
--             StopAnimTask(ped, "mech_inventory@item@stimulants@inject@quick", "quick_stimulant_inject_rhand", 1.0)
--             TriggerServerEvent('consumables:server:removeitem', 'morfina', 1)
--             TriggerEvent("fuzzy_wounds:UseMorphine", tier)
            
            
--             Citizen.InvokeNative(0xC6258F41D86676E0, ped, 1, 900) -- Establecer stamina a 900 (tiempo en segundos)
--             EnableAttributeOverpower(ped, 1, 900.0) -- Aumentar stamina a 3x
            
--             PlaySoundFrontend(-1, "Core_Fill_Up", "Consumption_Sounds", true)
--             TriggerEvent('RSGCore:Notify', "You have injected yourself with morphine", 'success')

--             morfinaCount = morfinaCount + 1 -- Incrementar el contador de uso de morfina

--             if morfinaCount > 1 then -- Si el jugador usa morfina por segunda vez
--                 AnimpostfxPlay("PlayerHealthPoor")
--                 Citizen.Wait(30000) -- Esperar 30 segundos
--             end
--             if morfinaCount > 2 then -- Si el jugador usa morfina por segunda vez
--                 SetPedToRagdollWithFall(PlayerPedId(), 1500, 2000, 1, GetEntityForwardVector(ped), 1.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0)
--                 AnimpostfxPlay("PlayerHealthPoor")
--                 Citizen.Wait(60000) -- Esperar 30 segundos
--                 TriggerEvent('RSGCore:Notify', "You have injected too much morphine", 'error')

--             end
--         end, function() -- Cancel
--             StopAnimTask(ped, "mech_inventory@item@stimulants@inject@quick", "quick_stimulant_inject_rhand", 1.0)
--             TriggerEvent('RSGCore:Notify', "You have not been able to inject yourself with morphine", 'error')
--         end)
--     else
--         TriggerEvent('RSGCore:Notify', "You don't have Morphine", 'error')
--     end
-- end)

-- RegisterNetEvent('hospital:client:UseBandage', function(itemName)
--     local ped = PlayerPedId()
--     local dict = loadAnimDict('script_re@gold_panner@gold_success')
--     TaskPlayAnim(PlayerPedId(), dict, 'SEARCH01', 8.0, 8.0, -1, 1, false, false, false)
--     ClearPedTasks(PlayerPedId())
--     RSGCore.Functions.Progressbar("using bandage", "Using a Field Bandage..", 4000, false, true, {
--         disableMovement = false,
--         disableCarMovement = false,
--         disableMouse = false,
--         disableCombat = true,
--     }, {
--         animDict = BandageDict,
--         anim = BandageAnim,
--         flags = 1,
--     }, {}, {}, function() -- Done
--         TriggerEvent("inventory:client:ItemBox", RSGCore.Shared.Items[itemName], "remove")
--         SetEntityHealth(ped, GetEntityHealth(ped) + 60)
--         -- health adjust
--         Citizen.InvokeNative(0xC6258F41D86676E0, ped, 0, (GetAttributeCoreValue(ped, 0) + 30))
--         -- end health adjust
--     end, function() -- Cancel
--         StopAnimTask(ped, BandageDict, BandageAnim, 1.0)
--         RSGCore.Functions.Notify(Lang:t('error.canceled'), 'error')
--     end)
-- end)




-- RegisterNetEvent('hospital:client:UseHerbalBandage', function(itemName)
--     local ped = PlayerPedId()
--     local dict = loadAnimDict('script_re@gold_panner@gold_success')
--     TaskPlayAnim(PlayerPedId(), dict, 'SEARCH01', 8.0, 8.0, -1, 1, false, false, false)
--     ClearPedTasks(PlayerPedId())
--     RSGCore.Functions.Progressbar("using bandage", "Using a Herbal Bandage..", 4000, false, true, {
--         disableMovement = false,
--         disableCarMovement = false,
--         disableMouse = false,
--         disableCombat = true,
--     }, {
--         animDict = BandageDict,
--         anim = BandageAnim,
--         flags = 1,
--     }, {}, {}, function() -- Done
--         TriggerEvent("inventory:client:ItemBox", RSGCore.Shared.Items[itemName], "remove")
--         SetEntityHealth(ped, GetEntityHealth(ped) + 200)
--         -- health adjust
--         Citizen.InvokeNative(0xC6258F41D86676E0, ped, 0, (GetAttributeCoreValue(ped, 0) + 200))
--         -- end health adjust
--     end, function() -- Cancel
--         StopAnimTask(ped, BandageDict, BandageAnim, 1.0)
--         RSGCore.Functions.Notify(Lang:t('error.canceled'), 'error')
--     end)
-- end)

-- RegisterNetEvent('hospital:client:UseMedicBandage', function(itemName)
--     local playerPed = PlayerPedId()
--     local closestPlayer, closestDistance = GetClosestPlayer()

--     if closestPlayer ~= -1 and closestDistance <= 2.5 then
--         -- Trigger animation on the medic (the player using the bandage)
--         TriggerEvent('hospital:client:PlayBandageAnimation', playerPed)

--         -- Apply the bandage effect on the target player
--         TriggerServerEvent('hospital:server:ApplyBandage', GetPlayerServerId(closestPlayer), itemName)

--         -- Notify the player that they are healing someone else
--         RSGCore.Functions.Notify("You are healing the closest person.", "success")
--     else
--         -- No player nearby, apply bandage to yourself
--         ApplyBandageEffect(playerPed, itemName)

--         -- Notify the player that they are healing themselves
--         RSGCore.Functions.Notify("You are healing yourself.", "success")
--     end
-- end)


-- RegisterNetEvent('hospital:client:PlayBandageAnimation', function(medicPed)
--     local dict = loadAnimDict('script_re@gold_panner@gold_success')

--     -- Play animation on the medic
--     TaskPlayAnim(medicPed, dict, 'SEARCH01', 8.0, 8.0, -1, 1, false, false, false)

--     RSGCore.Functions.Progressbar("using bandage", "Using a Medic Bandage..", 4000, false, true, {
--         disableMovement = false,
--         disableCarMovement = false,
--         disableMouse = false,
--         disableCombat = true,
--     }, {}, {}, {}, function() -- Done
--         -- Animation completed
--         StopAnimTask(medicPed, dict, 'SEARCH01', 1.0)
--     end, function() -- Cancel
--         StopAnimTask(medicPed, dict, 'SEARCH01', 1.0)
--         RSGCore.Functions.Notify("Bandage use canceled", 'error')
--     end)
-- end)

-- RegisterNetEvent('hospital:client:ReceiveBandage', function(itemName)
--     local playerPed = PlayerPedId()

--     -- Apply the bandage effect on the target player (the person being healed)
--     ApplyBandageEffect(playerPed, itemName)
-- end)

-- function ApplyBandageEffect(playerPed, itemName)
--     ClearPedTasks(playerPed)
--     TriggerEvent("inventory:client:ItemBox", RSGCore.Shared.Items[itemName], "remove")
--     SetEntityHealth(playerPed, GetEntityHealth(playerPed) + 200)
--     Citizen.InvokeNative(0xC6258F41D86676E0, playerPed, 0, (GetAttributeCoreValue(playerPed, 0) + 200))
-- end

-- function GetClosestPlayer()
--     local players = GetActivePlayers()
--     local closestDistance = -1
--     local closestPlayer = -1
--     local playerPed = PlayerPedId()
--     local playerCoords = GetEntityCoords(playerPed)

--     for i=1, #players, 1 do
--         local targetPed = GetPlayerPed(players[i])
--         if targetPed ~= playerPed then
--             local targetCoords = GetEntityCoords(targetPed)
--             local distance = #(playerCoords - targetCoords)

--             if closestDistance == -1 or closestDistance > distance then
--                 closestPlayer = players[i]
--                 closestDistance = distance
--             end
--         end
--     end

--     return closestPlayer, closestDistance
-- end



-- RegisterNetEvent("consumables:client:drinkcoffee", function(itemName)
--     if isBusy then
--         return
--     else
--         isBusy = not isBusy
--         sleep = 5000
--         SetCurrentPedWeapon(PlayerPedId(), GetHashKey("weapon_unarmed"))
--         local kopi = CreateObject("P_MUGCOFFEE01X", GetEntityCoords(PlayerPedId()), true, true, false, false, true)
--         Citizen.InvokeNative(0x669655FFB29EF1A9, kopi, 0, "CTRL_cupFill", 1.0)
--         TaskItemInteraction_2(PlayerPedId(), GetHashKey("CONSUMABLE_COFFEE"), kopi, GetHashKey("P_MUGCOFFEE01X_PH_R_HAND"), GetHashKey("DRINK_COFFEE_HOLD"), 1, 0, -1)
--         TriggerServerEvent("RSGCore:Server:SetMetaData", "thirst", RSGCore.Functions.GetPlayerData().metadata["thirst"] + ConsumeablesDrink[itemName])
--         TriggerServerEvent('hud:server:RelieveStress', math.random(10, 20))
       
--         isBusy = not isBusy
--     end
-- end)


