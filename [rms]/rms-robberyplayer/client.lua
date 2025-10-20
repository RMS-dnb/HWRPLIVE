local RSGCore = exports['rsg-core']:GetCoreObject()
local DeliverPrompt
local hasAlreadyEnteredMarker, lastZone
local currentZone = nil
local active = false
local pressed = false
local canRob = true

-- Cache frequently used values
local playerPed = PlayerPedId()
local lastPedUpdate = 0
local PED_UPDATE_INTERVAL = 1000 -- Update ped reference every 1 second

----------------
--- PROMPT SETUP
----------------
function SetupDeliverPrompt()
    local str = 'Rob'
    DeliverPrompt = PromptRegisterBegin()
    PromptSetControlAction(DeliverPrompt, "INPUT_CREATOR_ACCEPT") -- E key
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(DeliverPrompt, str)
    PromptSetEnabled(DeliverPrompt, false)
    PromptSetVisible(DeliverPrompt, false)
    PromptSetHoldMode(DeliverPrompt, true)
    PromptRegisterEnd(DeliverPrompt)
end

----------------
--- PROMPT VISIBILITY HANDLER
----------------
CreateThread(function()
    while true do
        if currentZone then
            if not active then
                PromptSetEnabled(DeliverPrompt, true)
                PromptSetVisible(DeliverPrompt, true)
                active = true
            end
            if PromptHasHoldModeCompleted(DeliverPrompt) then
                PromptSetEnabled(DeliverPrompt, false)
                PromptSetVisible(DeliverPrompt, false)
                pressed = true
                active = false
                currentZone = nil
            end
            Wait(0) -- Only run fast when needed
        else
            Wait(500) -- Longer wait when not in zone
        end
    end
end)

----------------
--- ZONE DETECTION (OPTIMIZED)
----------------
CreateThread(function()
    SetupDeliverPrompt()
    
    while true do
        local currentTime = GetGameTimer()
        
        -- Update cached playerPed reference periodically
        if currentTime - lastPedUpdate > PED_UPDATE_INTERVAL then
            playerPed = PlayerPedId()
            lastPedUpdate = currentTime
        end
        
        local isInMarker = false
        local target, distance = RSGCore.Functions.GetClosestPlayer()

        if target ~= -1 and distance < 2 then
            local targetPed = GetPlayerPed(target)
            local isDead = IsEntityDead(targetPed)
            local cuffed = IsPedCuffed(targetPed)

            if not isDead and cuffed then
                isInMarker = true
                currentZone = 'rob'
                lastZone = 'rob'
            end
        end

        if isInMarker and not hasAlreadyEnteredMarker then
            hasAlreadyEnteredMarker = true
            TriggerEvent('btc-roberyplayer:inZone', currentZone)
        elseif not isInMarker and hasAlreadyEnteredMarker then
            hasAlreadyEnteredMarker = false
            TriggerEvent('btc-roberyplayer:offZone', lastZone)
        end
        
        -- Dynamic wait times
        if isInMarker then
            Wait(100) -- Check more frequently when near target
        else
            Wait(500) -- Less frequent when not near anyone
        end
    end
end)

AddEventHandler('btc-roberyplayer:inZone', function(zone)
    currentZone = zone
end)

AddEventHandler('btc-roberyplayer:offZone', function(zone)
    if active then
        PromptSetEnabled(DeliverPrompt, false)
        PromptSetVisible(DeliverPrompt, false)
        active = false
        pressed = false
    end
    currentZone = nil
end)

----------------
--- ROB PLAYER WHEN PROMPT PRESSED (OPTIMIZED)
----------------
CreateThread(function()
    while true do
        if pressed and canRob then
            local target, distance = RSGCore.Functions.GetClosestPlayer()
            if target ~= -1 and distance < 2 then
                local targetPed = GetPlayerPed(target)
                local targetId = GetPlayerServerId(target)
                local isDead = IsEntityDead(targetPed)
                local cuffed = IsPedCuffed(targetPed)

                if not isDead and cuffed then
                    canRob = false
                    TriggerServerEvent('btc-roberyplayer:RobPlayer', targetId)
                    SetTimeout(5000, function() canRob = true end)
                    pressed = false
                end
            end
            Wait(100) -- Quick check when action needed
        else
            Wait(200) -- Less frequent when no action needed
        end
    end
end)

---------------
-- INVENTORY LOCK (OPTIMIZED)
---------------

-- Cache restraint states to avoid redundant checks
local restraintState = {
    wasLassoed = false,
    wasRestrained = false,
    lastCheck = 0
}

local RESTRAINT_CHECK_INTERVAL = 500

-- Simple lasso lock
CreateThread(function()
    while true do
        local currentTime = GetGameTimer()
        
        if currentTime - restraintState.lastCheck > RESTRAINT_CHECK_INTERVAL then
            local isLassoed = Citizen.InvokeNative(0x9682F850056C9ADE, playerPed)
            
            if isLassoed and not restraintState.wasLassoed then
                LocalPlayer.state:set("inv_busy", true, true)
                restraintState.wasLassoed = true
            elseif not isLassoed and restraintState.wasLassoed then
                LocalPlayer.state:set("inv_busy", false, true)
                restraintState.wasLassoed = false
            end
            
            restraintState.lastCheck = currentTime
        end
        
        Wait(RESTRAINT_CHECK_INTERVAL)
    end
end)

-- Enhanced restraint lock (consolidated with lasso lock for efficiency)
CreateThread(function()
    while true do
        local currentTime = GetGameTimer()
        
        if currentTime - restraintState.lastCheck > RESTRAINT_CHECK_INTERVAL then
            -- Only check these if we haven't already checked recently
            local isLassoed = Citizen.InvokeNative(0x9682F850056C9ADE, playerPed)
            local isCuffed = IsPedCuffed(playerPed)
            local isHogtied = Citizen.InvokeNative(0x3AA24CCC0D451379, playerPed)
            local isRagdoll = IsPedRagdoll(playerPed)
            local isHandsUp = IsEntityPlayingAnim(playerPed, "script_proc@robberies@homestead@lonnies_shack@deception", "hands_up_loop", 3)
            
            local isRestrained = isLassoed or isCuffed or isHogtied or isRagdoll or isHandsUp
            
            if isRestrained and not restraintState.wasRestrained then
                LocalPlayer.state:set("inv_busy", true, true)
                restraintState.wasRestrained = true
            elseif not isRestrained and restraintState.wasRestrained then
                LocalPlayer.state:set("inv_busy", false, true)
                restraintState.wasRestrained = false
            end
        end
        
        Wait(RESTRAINT_CHECK_INTERVAL)
    end
end)