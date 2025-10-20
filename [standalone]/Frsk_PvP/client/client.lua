local combatEnabled = false
local playerGroup = GetHashKey('PLAYER')
local toggleKey = 0xA5BDCD3C -- Key code for the ']' key
local tabKey = 0xB238FE0B -- Key code for the 'Tab' key
local leftClickKey = 0x07CE1E61 -- Key code for the left mouse button (primary attack)

local function EnablePvp(enable)
    if enable then
        SetRelationshipBetweenGroups(5, playerGroup, playerGroup)
        NetworkSetFriendlyFireOption(true)
    else
        SetRelationshipBetweenGroups(1, playerGroup, playerGroup)
        NetworkSetFriendlyFireOption(false)
    end
end

local function sendUIMessage(combatEnabled)
    SendNUIMessage({
        type = 'updateCombatState',
        combatEnabled = combatEnabled
    })
end

local function toggleCombat()
    combatEnabled = not combatEnabled
    EnablePvp(combatEnabled)
    
    TriggerEvent('chat:addMessage', {
        color = {255, 255, 128},
        args = {'PVP', combatEnabled and 'on' or 'off'}
    })
    
    sendUIMessage(combatEnabled)
end

local function checkWeaponDrawn()
    local playerPed = PlayerPedId()
    local hasWeapon, weaponHash = GetCurrentPedWeapon(playerPed, true)
    if hasWeapon and weaponHash ~= GetHashKey('WEAPON_UNARMED') then
        if not combatEnabled then
            toggleCombat()
        end
    end
end

local function checkPlayerDamaged()
    local playerPed = PlayerPedId()
    if HasEntityBeenDamagedByAnyPed(playerPed) then
        if not combatEnabled then
            toggleCombat()
        end
        ClearEntityLastDamageEntity(playerPed)
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0) -- Always run this loop
        if IsControlJustReleased(0, toggleKey) then
            toggleCombat()
        end
        if not combatEnabled then
            -- Disable PvP-related controls
            DisableControlAction(0, GetHashKey('INPUT_MELEE_ATTACK'), true)
            DisableControlAction(0, GetHashKey('INPUT_MELEE_GRAPPLE_ATTACK'), true)
            DisableControlAction(0, GetHashKey('INPUT_MELEE_GRAPPLE'), true)
            DisableControlAction(0, GetHashKey('INPUT_MELEE_GRAPPLE_CHOKE'), true)
            -- Disable weapon equipping (Tab key)
            DisableControlAction(0, tabKey, true)
            -- Disable left mouse button (primary attack)
            DisableControlAction(0, leftClickKey, true)
        else
            -- Enable PvP-related controls (restoring default state)
            EnableControlAction(0, GetHashKey('INPUT_MELEE_ATTACK'), true)
            EnableControlAction(0, GetHashKey('INPUT_MELEE_GRAPPLE_ATTACK'), true)
            EnableControlAction(0, GetHashKey('INPUT_MELEE_GRAPPLE'), true)
            EnableControlAction(0, GetHashKey('INPUT_MELEE_GRAPPLE_CHOKE'), true)
        end
        -- Check if weapon is drawn and enable PvP
        checkWeaponDrawn()
        -- Check if player has received damage and enable PvP
        checkPlayerDamaged()
    end
end)

Citizen.CreateThread(function()
    EnablePvp(combatEnabled)
    sendUIMessage(combatEnabled)
end)
