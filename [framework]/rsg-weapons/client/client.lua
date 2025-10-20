-- local RSGCore = exports['rsg-core']:GetCoreObject()
-- lib.locale()
-- local UsedWeapons = {}
-- local weaponInHands = {}
-- local currentWeaponSerial = nil

-- ------------------------------------------
-- -- weapon in hands export
-- ------------------------------------------
-- exports('weaponInHands', function()
--     if weaponInHands ~= nil then
--         return weaponInHands
--     end
-- end)

-- exports('UsedWeapons', function(serial)
--     UsedWeapons[serial] = nil
-- end)

-- exports('GetUsedWeapons', function()
--     return UsedWeapons
-- end)

-- ------------------------------------------
-- -- Check Weapon Serial export
-- ------------------------------------------
-- exports('CheckWeaponSerial', function()
--     local serial = nil
--     local hash = nil
--     local _, wepHash = GetCurrentPedWeapon(cache.ped, true, 0, true)

--     if currentWeaponSerial then
--         for k, v in pairs(weaponInHands) do
--             if tonumber(wepHash) == tonumber(k) then
--                 hash = k
--                 serial = v

--                 break
--             end
--         end
--     end

--     if Config.Debug then
--         print('^5Weapon Serial^7   : ^2'..tostring(serial)..'^7')
--         print('^5Weapon Hash^7     : ^2'..tostring(hash)..'^7')
--     end

--     return serial, hash
-- end)

-- ------------------------------------------
-- -- BASSICS FUNTIONS
-- ------------------------------------------

-- local function getGuidFromItemId(inventoryId, itemData, category, slotId)
-- 	local outItem = DataView.ArrayBuffer(8 * 13)

-- 	if not itemData then
-- 		itemData = 0
-- 	end

-- 	local success = Citizen.InvokeNative(0x886DFD3E185C8A89, inventoryId, itemData, category, slotId, outItem:Buffer())
-- 	if success then
-- 		return outItem:Buffer() 
-- 	else
-- 		return nil
-- 	end
-- end

-- local function addWardrobeInventoryItem(itemName, slotHash)
--     local itemHash = GetHashKey(itemName)
--     local addReason = GetHashKey("ADD_REASON_DEFAULT")
--     local inventoryId = 1

--     local isValid = Citizen.InvokeNative(0x6D5D51B188333FD1, itemHash, 0) 
--     if not isValid then
--         return false
--     end

--     local characterItem = getGuidFromItemId(inventoryId, nil, GetHashKey("CHARACTER"), 0xA1212100)
--     if not characterItem then
--         return false
--     end

--     local wardrobeItem = getGuidFromItemId(inventoryId, characterItem, GetHashKey("WARDROBE"), 0x3DABBFA7)
--     if not wardrobeItem then
--         return false
--     end

--     local itemData = DataView.ArrayBuffer(8 * 13)
--     local isAdded = Citizen.InvokeNative(0xCB5D11F9508A928D, inventoryId, itemData:Buffer(), wardrobeItem, itemHash,
--         slotHash, 1, addReason)
--     if not isAdded then
--         return false
--     end

--     local equipped = Citizen.InvokeNative(0x734311E2852760D0, inventoryId, itemData:Buffer(), true)
--     return equipped;
-- end


-- ------------------------------------------
-- -- use weapon
-- ------------------------------------------
-- RegisterNetEvent('rsg-weapons:client:UseWeapon', function(weaponData)
--     local weaponName = tostring(weaponData.name)
--     local hash = joaat(weaponData.name)
--     local wepSerial = tostring(weaponData.info.serial)
--     local wepQuality = weaponData.info.quality
--     local EquippedWeapons = exports['rsg-weapons']:EquippedWeapons() or {}
--     local isWeaponAGun = Citizen.InvokeNative(0x705BE297EEBDB95D, hash)
--     local isWeaponOneHanded = Citizen.InvokeNative(0xD955FEE4B87AFA07, hash)

--     if wepQuality > 1 then

--         for k, v in pairs(EquippedWeapons) do
--             if v.hash == hash then
--                 WeaponAPI.used2 = true
--                 break
--             end
--         end

--         if not UsedWeapons[wepSerial] then
--             UsedWeapons[wepSerial] = {
--                 name = weaponData.name,
--                 WeaponHash = hash,
--                 data = weaponData,
--                 serie = weaponData.info.serial,
--             }

--             if weaponName == 'weapon_bow' or weaponName == 'weapon_bow_improved' then
--                 GiveWeaponToPed(cache.ped, hash, 0, false, true)
--                 SetCurrentPedWeapon(cache.ped,hash,true)
--             end

--             if isWeaponAGun and isWeaponOneHanded then
--                 addWardrobeInventoryItem("CLOTHING_ITEM_M_OFFHAND_000_TINT_004", 0xF20B6B4A)
--                 addWardrobeInventoryItem("UPGRADE_OFFHAND_HOLSTER", 0x39E57B01)
--                 if WeaponAPI.used2 then
--                     WeaponAPI.EquipWeapon(weaponName, 1, wepSerial, hash)
--                 else
--                     WeaponAPI.EquipWeapon(weaponName, 0, wepSerial, hash)
--                 end
--             else
--                 GiveWeaponToPed(cache.ped, hash, 0, false, true)
--                 SetCurrentPedWeapon(cache.ped,hash,true)
--             end

--             SetAmmoInClip(cache.ped, hash, 0)

--             if Config.Debug then
--                 print("Weapon Serial: "..wepSerial)
--                 print("Weapon Hash: "..hash)
--             end

--             currentWeaponSerial = wepSerial
--             weaponInHands[hash] = wepSerial

--             if Config.WeaponComponents then
--                 TriggerEvent('ricx_guns:addc', weaponName, hash, weaponData.info)
--                 TriggerServerEvent('rsg-weaponcomp:server:check_comps')
--             end
--         else
--             if Config.Debug then
--                 print('removing weapon ')
--             end
--             WeaponAPI.RemoveWeaponFromPeds(weaponName, wepSerial)
--             UsedWeapons[wepSerial] = nil
--         end

--         -- set degradation
--         local entityIndex = GetCurrentPedWeaponEntityIndex(cache.ped, 0)
--         local object = GetObjectIndexFromEntityIndex(entityIndex)
--         if not DoesEntityExist(object) then return end
--         if wepQuality == 100 then
--             Citizen.InvokeNative(0xA7A57E89E965D839, object, 0.0)-- SetWeaponDegradation(
--         else
--             local currentDeg = (1.0 - (wepQuality / 100))
--             Citizen.InvokeNative(0xA7A57E89E965D839, object, currentDeg) -- SetWeaponDegradation(
--         end

--         weaponInHands[hash] = wepSerial

--     else
--         WeaponAPI.RemoveWeaponFromPeds(weaponName, wepSerial)
--         UsedWeapons[wepSerial] = nil
--         TriggerEvent('rsg-weapons:client:brokenweapon', wepSerial)

--         if Config.WeaponComponents then -- false need /loadweapon load
--             TriggerServerEvent("rsg-weaponcomp:server:removeComponents", "DEFAULT", weaponName, wepSerial)
--             Wait(0)
--             TriggerEvent('ricx_guns:addc', weaponName, hash, weaponData.info)
--             TriggerServerEvent('rsg-weaponcomp:server:check_comps')
--         end

--         lib.notify({ title = locale('cl_weapon_degraded'), type = 'error', duration = 5000 })
        
--     end
-- end)

-- RegisterNetEvent('rsg-weapons:client:UseThrownWeapon', function(weaponData) 
--     local weaponName = tostring(weaponData.name)
--     local hash = joaat(weaponData.name)
--     local ammoType = Config.ThrowableWeaponAmmoTypes[weaponName]
--     local ammoDefinition = exports['rsg-ammo']:GetAmmoTypes()[ammoType]
--     if not ammoDefinition then 
--         --notify
--         lib.print.info('neni defi', ammoType, weaponName)
--         return
--     end

--     local originalAmount = GetPedAmmoByType(cache.ped, ammoDefinition.hash)
--     local desiredAmount = originalAmount + ammoDefinition.refill
--     if ammoDefinition.maxAmmo < desiredAmount then
--         lib.notify({ title = locale('cl_ammo_max'), type = 'error', duration = 5000 })
--         return
--     end
    
--     if not HasPedGotWeapon(cache.ped, hash) then
--         GiveWeaponToPed(cache.ped, hash, 0)
--     end

--     AddAmmoToPedByType(cache.ped, ammoDefinition.hash, ammoDefinition.refill)
--     SetCurrentPedWeapon(cache.ped, hash, true)
--     TriggerServerEvent('rsg-weapons:server:removeitem', weaponName, 1)
-- end)

-- RegisterNetEvent('rsg-weapons:client:UseEquipment', function(weaponData) 
--     local weaponName = tostring(weaponData.name)
--     local hash = joaat(weaponData.name)

--     if weaponName == 'weapon_melee_torch' then
--         if not HasPedGotWeapon(cache.ped, hash) then
--             GiveWeaponToPed(cache.ped, hash, 0, false, true)
--             SetCurrentPedWeapon(cache.ped, hash, true)
--             TriggerServerEvent('rsg-weapons:server:removeitem', weaponName, 1)
--         end

--         return
--     end

--     if not HasPedGotWeapon(cache.ped, hash) then
--         GiveWeaponToPed(cache.ped, hash, 0, false, true)
--         SetCurrentPedWeapon(cache.ped, hash, true)
--     else
--         RemoveWeaponFromPed(cache.ped, hash)
--     end
-- end)

-- ------------------------------------------
-- -- degrade weapon when shooting
-- ------------------------------------------
-- CreateThread(function()
--     while true do
--         Wait(1)
--         if IsPedShooting(cache.ped) then
--             local heldWeapon = Citizen.InvokeNative(0x8425C5F057012DAB, cache.ped) -- GetPedCurrentHeldWeapon(
--             local serialHeld = weaponInHands[heldWeapon]
--             if heldWeapon ~= nil and heldWeapon ~= -1569615261 then
--                 TriggerServerEvent('rsg-weapons:server:degradeWeapon', serialHeld)
--             end
--         end
--     end
-- end)

-- ------------------------------------------
-- -- set weapon damage modifier
-- ------------------------------------------
-- CreateThread(function()
--     while true do
--         Wait(1)
--         SetPlayerWeaponDamageModifier(PlayerId(), Config.WeaponDmg)
--         SetPlayerMeleeWeaponDamageModifier(PlayerId(), Config.MeleeDmg)
--         if IsPlayerFreeAiming(PlayerId()) then
--             DisableControlAction(0, 0x8FFC75D6, true)
--         end
--     end
-- end)

-- ------------------------------------------
-- -- repair weapon
-- ------------------------------------------
-- ------------------------------------------
-- -- repair weapon
-- ------------------------------------------
-- RegisterNetEvent('rsg-weapons:client:repairweapon', function()
--     local heldWeapon = Citizen.InvokeNative(0x8425C5F057012DAB, cache.ped) -- GetPedCurrentHeldWeapon(
--     local currentSerial = weaponInHands[heldWeapon]
--     local hasItem = RSGCore.Functions.HasItem('weapon_repair_kit', 1)
--      if hasItem and currentSerial ~= nil and heldWeapon ~= -1569615261 then
--         LocalPlayer.state:set("inv_busy", true, true) -- lock inventory
--         lib.progressBar({
--             duration = Config.RepairTime,
--             position = 'bottom',
--             useWhileDead = false,
--             canCancel = false,
--             disable = {
--                 move = true,
--                 mouse = true,
                
--             },
--             label = locale('cl_repairing_weapon'),
--         })
--         TriggerServerEvent('rsg-weapons:server:removeitem', 'weapon_repair_kit', 1)
--         TriggerServerEvent('rsg-weapons:server:repairweapon', currentSerial)
--         LocalPlayer.state:set("inv_busy", false, true) -- unlock inventory
--     else
--         lib.notify({ title = locale('cl_no_weapon_found'), description = locale('cl_no_weapon_found_desc'), type = 'inform', icon = 'fa-solid fa-gun', iconAnimation = 'shake', duration = 7000 })
--     end
-- end)
-- ------------------------------------------
-- -- broken repair weapon choice yes/no
-- ------------------------------------------
-- RegisterNetEvent('rsg-weapons:client:brokenweapon', function(serial)
--     local input = lib.inputDialog(locale('cl_weapon_repair'), {
--         {
--             type = 'select',
--             label = locale('cl_weapon_repair_p'),
--             options = {
--                 { value = 'yes', text = locale('cl_reapir_yes') },
--                 { value = 'no', text =  locale('cl_reapir_no') }
--             },
--             required = true
--         },
--     })
--     if not input then return end
--     if input[1] == 'yes' then
--         TriggerEvent('rsg-weapons:client:repairbrokenweapon', serial)
--     end
-- end)

-- ------------------------------------------
-- -- repair broken weapon
-- ------------------------------------------
-- RegisterNetEvent('rsg-weapons:client:repairbrokenweapon', function(serial)

--     local hasItem = RSGCore.Functions.HasItem('weapon_repair_kit', 1)
--     if hasItem and serial ~= nil then
--         LocalPlayer.state:set("inv_busy", true, true) --
--         lib.progressBar({
--             duration = Config.RepairTime,
--             position = 'bottom',
--             useWhileDead = false,
--             canCancel = false,
--             disable = {
--                 move = true,
--                 mouse = true,
               
--             },
--             label = locale('cl_repairing_weapon'),
--         })
--         TriggerServerEvent('rsg-weapons:server:removeitem', 'weapon_repair_kit', 1)
--         TriggerServerEvent('rsg-weapons:server:repairweapon', serial)
--     else
--         lib.notify({ title = locale('cl_item_need'), description = locale('cl_item_need_desc'), type = 'inform', icon = 'fa-solid fa-gun', iconAnimation = 'shake', duration = 7000 } )
--     end
-- end)
local RSGCore = exports['rsg-core']:GetCoreObject()
lib.locale()
local UsedWeapons = {}
local weaponInHands = {}
local currentWeaponSerial = nil

--[[ LONG ARM LIMIT ]]---------------------------------------------------------
-- List of all “long arms” you want to restrict to 1 at a time.
-- Add / remove as needed.
local LongArmWeapons = {
    ['weapon_rifle_boltaction']      = true,
    ['weapon_rifle_springfield']     = true,
    ['weapon_repeater_winchester']   = true,
    ['weapon_repeater_evans']        = true,
    ['weapon_repeater_henry']        = true,
    ['weapon_repeater_carbine']      = true,
    ['weapon_shotgun_doublebarrel']  = true,
    ['weapon_shotgun_pump']          = true,
    ['weapon_shotgun_repeating']     = true,
    ['weapon_shotgun_sawedoff']      = false,
    ['weapon_rifle_varmint']         = true,
    ['weapon_rifle_elephant']         = true,
}
-- Track the serial of the currently equipped long arm (if any)
local currentLongArm = nil
--[[ LONG ARM LIMIT END ]]-----------------------------------------------------

exports('weaponInHands', function()
    return weaponInHands
end)

exports('UsedWeapons', function(serial)
    UsedWeapons[serial] = nil
    --[[ LONG ARM LIMIT ]]
    if currentLongArm == serial then
        currentLongArm = nil
    end
end)

exports('GetUsedWeapons', function()
    return UsedWeapons
end)

CreateThread(function()
    while true do
        local ped = cache.ped
        local hasThrowableWeapons = false
        
        for weaponName, ammoType in pairs(Config.ThrowableWeaponAmmoTypes) do
            local weaponHash = joaat(weaponName)
            
            if HasPedGotWeapon(ped, weaponHash) then
                hasThrowableWeapons = true
                local ammoDefinition = exports['rsg-ammo']:GetAmmoTypes()[ammoType]
                
                if ammoDefinition then
                    local currentAmmo = GetPedAmmoByType(ped, ammoDefinition.hash)
                    
                    if currentAmmo <= 0 then
                        RemoveWeaponFromPed(ped, weaponHash)
                        lib.print.info('Removed empty throwable weapon:', weaponName)
                    end
                end
            end
        end
        
        -- Adjust wait time based on whether player has throwable weapons
        if hasThrowableWeapons then
            Wait(500) -- Check more frequently when player has throwables
        else
            Wait(3000) -- Check less frequently when no throwables
        end
    end
end)

local thrownWeapons = {
    [GetHashKey('w_melee_hatchet02')] = 'weapon_melee_cleaver',  -- cleaver
    [GetHashKey('mp005_s_melee_bolascoiled')] = 'weapon_thrown_bolas',
    [GetHashKey('mp008_s_melee_bolas02_coiled')] = 'weapon_thrown_bolas_hawkmoth',
    [GetHashKey('mp008_s_melee_bolas03_coiled')] = 'weapon_thrown_bolas_ironspiked',
    [GetHashKey('mp008_s_melee_bolas04_coiled')] = 'weapon_thrown_bolas_intertwined',
    [GetHashKey('w_melee_knife05')] = 'weapon_thrown_throwing_knives',
    [GetHashKey('w_melee_tomahawk02')] = 'weapon_thrown_tomahawk_ancient',
    [GetHashKey('w_melee_tomahawk01')] = 'weapon_thrown_tomahawk',
    [GetHashKey('w_melee_hatchet07')] = 'weapon_melee_hatchet_hunter',
    [GetHashKey('w_melee_hatchet01')] = 'weapon_melee_hatchet',
}

local targetedEntities = {}

Citizen.CreateThread(function()
    while true do
        Wait(5000)

        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)

        for propHash, itemName in pairs(thrownWeapons) do
            local weaponEntity = GetClosestObjectOfType(coords.x, coords.y, coords.z, 3.0, propHash, false, false, false)
            if weaponEntity and DoesEntityExist(weaponEntity) then
                local netId = NetworkGetNetworkIdFromEntity(weaponEntity)

                if not targetedEntities[netId] then
                    targetedEntities[netId] = true

                    exports['rsg-target']:AddTargetEntity(weaponEntity, {
                        options = {
                            {
                                icon = 'fas fa-hand-paper',
                                label = 'Pick Up ' .. itemName:gsub('weapon_', ''):gsub('_', ' '):gsub('^%l', string.upper),
                                action = function(entity)
                                    local pickedId = NetworkGetNetworkIdFromEntity(entity)
                                    TriggerServerEvent('cleaver:pickup', pickedId, itemName)
                                end,
                            },
                        },
                        distance = 15.0
                    })
                end
            end
        end
    end
end)

exports('CheckWeaponSerial', function()
    local serial = nil
    local hash = nil
    local _, wepHash = GetCurrentPedWeapon(cache.ped, true, 0, true)

    if currentWeaponSerial then
        for k, v in pairs(weaponInHands) do
            if tonumber(wepHash) == tonumber(k) then
                hash = k
                serial = v
                break
            end
        end
    end

    if Config.Debug then
        print('^5Weapon Serial^7   : ^2'..tostring(serial)..'^7')
        print('^5Weapon Hash^7     : ^2'..tostring(hash)..'^7')
    end

    return serial, hash
end)

RegisterNetEvent('rsg-weapons:client:UseWeapon', function(weaponData)
    local weaponName = tostring(weaponData.name)
    local hash = joaat(weaponData.name)
    local wepSerial = tostring(weaponData.info.serial)
    local wepQuality = weaponData.info.quality
    local EquippedWeapons = exports['rsg-weapons']:EquippedWeapons() or {}
    local isWeaponAGun = Citizen.InvokeNative(0x705BE297EEBDB95D, hash)
    local isWeaponOneHanded = Citizen.InvokeNative(0xD955FEE4B87AFA07, hash)

    --[[ LONG ARM LIMIT ]]-----------------------------------------------------
    -- Block equipping another long arm if one is already on the back
    if LongArmWeapons[weaponName] then
        if currentLongArm and currentLongArm ~= wepSerial then
            lib.notify({
                title = 'Long Arm Limit',
                description = 'You can only carry one long arm on your back!',
                type = 'error',
                duration = 5000
            })
            return
        end
    end
    --[[ LONG ARM LIMIT END ]]-------------------------------------------------

    if wepQuality > 1 then
        if not UsedWeapons[wepSerial] then
            UsedWeapons[wepSerial] = {
                name = weaponData.name,
                WeaponHash = hash,
                data = weaponData,
                serie = wepSerial,
            }

            if weaponName == 'weapon_bow' or weaponName == 'weapon_bow_improved' then
                GiveWeaponToPed(cache.ped, hash, 0, false, true)
                SetCurrentPedWeapon(cache.ped, hash, true)
            elseif isWeaponAGun and isWeaponOneHanded then
                WeaponAPI.EquipWeapon(weaponName, 0, wepSerial, hash) -- force main hand
            else
                GiveWeaponToPed(cache.ped, hash, 0, false, true)
                SetCurrentPedWeapon(cache.ped, hash, true)
            end

            SetAmmoInClip(cache.ped, hash, 0)
            currentWeaponSerial = wepSerial
            weaponInHands[hash] = wepSerial

            --[[ LONG ARM LIMIT ]]
            if LongArmWeapons[weaponName] then
                currentLongArm = wepSerial
            end

            if Config.WeaponComponents then
                TriggerEvent('ricx_guns:addc', weaponName, hash, weaponData.info)
                TriggerServerEvent('rsg-weaponcomp:server:check_comps')
            end
        else
            WeaponAPI.RemoveWeaponFromPeds(weaponName, wepSerial)
            UsedWeapons[wepSerial] = nil

            --[[ LONG ARM LIMIT ]]
            if currentLongArm == wepSerial then
                currentLongArm = nil
            end
        end

        local entityIndex = GetCurrentPedWeaponEntityIndex(cache.ped, 0)
        local object = GetObjectIndexFromEntityIndex(entityIndex)
        if DoesEntityExist(object) then
            local currentDeg = wepQuality == 100 and 0.0 or (1.0 - (wepQuality / 100))
            Citizen.InvokeNative(0xA7A57E89E965D839, object, currentDeg)
        end
    else
        WeaponAPI.RemoveWeaponFromPeds(weaponName, wepSerial)
        UsedWeapons[wepSerial] = nil

        --[[ LONG ARM LIMIT ]]
        if currentLongArm == wepSerial then
            currentLongArm = nil
        end

        TriggerEvent('rsg-weapons:client:brokenweapon', wepSerial)

        if Config.WeaponComponents then
            TriggerServerEvent("rsg-weaponcomp:server:removeComponents", "DEFAULT", weaponName, wepSerial)
            Wait(0)
            TriggerEvent('ricx_guns:addc', weaponName, hash, weaponData.info)
            TriggerServerEvent('rsg-weaponcomp:server:check_comps')
        end

        lib.notify({ title = locale('cl_weapon_degraded'), type = 'error', duration = 5000 })
    end
end)

-- Track ammo count changes for throwable weapons
local throwableWeapons = {}

RegisterNetEvent('rsg-weapons:client:UseThrownWeapon', function(weaponData)
    local weaponName = tostring(weaponData.name)
    local hash = joaat(weaponData.name)
    local ammoType = Config.ThrowableWeaponAmmoTypes[weaponName]
    local ammoDefinition = exports['rsg-ammo']:GetAmmoTypes()[ammoType]
    
    if not ammoDefinition then
        lib.print.info('Missing ammo definition:', ammoType, weaponName)
        return
    end

    local originalAmount = GetPedAmmoByType(cache.ped, ammoDefinition.hash)
    local desiredAmount = originalAmount + ammoDefinition.refill
    
    if ammoDefinition.maxAmmo < desiredAmount then
        lib.notify({ title = locale('cl_ammo_max'), type = 'error', duration = 5000 })
        return
    end

    if not HasPedGotWeapon(cache.ped, hash) then
        GiveWeaponToPed(cache.ped, hash, 0)
    end

    AddAmmoToPedByType(cache.ped, ammoDefinition.hash, ammoDefinition.refill)
    SetCurrentPedWeapon(cache.ped, hash, true)
    
    -- Track this throwable weapon
    throwableWeapons[hash] = {
        weaponName = weaponName,
        ammoType = ammoType,
        ammoHash = ammoDefinition.hash,
        lastAmmoCount = GetPedAmmoByType(cache.ped, ammoDefinition.hash)
    }
    
    -- Don't remove item here - wait until actually thrown
end)

-- Monitor ammo count changes for throwable weapons
CreateThread(function()
    while true do
        Wait(100) -- Check every 100ms
        
        for weaponHash, data in pairs(throwableWeapons) do
            if HasPedGotWeapon(cache.ped, weaponHash) then
                local currentAmmo = GetPedAmmoByType(cache.ped, data.ammoHash)
                
                -- If ammo decreased, weapon was thrown
                if currentAmmo < data.lastAmmoCount then
                    local ammoUsed = data.lastAmmoCount - currentAmmo
                    
                    -- Remove items from inventory based on ammo used
                    for i = 1, ammoUsed do
                        TriggerServerEvent('rsg-weapons:server:removeitem', data.weaponName, 1)
                    end
                    
                    -- Update tracked ammo count
                    data.lastAmmoCount = currentAmmo
                    
                    -- If no ammo left, remove weapon and stop tracking
                    if currentAmmo == 0 then
                        RemoveWeaponFromPed(cache.ped, weaponHash)
                        throwableWeapons[weaponHash] = nil
                    end
                end
            else
                -- Weapon was removed, stop tracking
                throwableWeapons[weaponHash] = nil
            end
        end
    end
end)

RegisterNetEvent('rsg-weapons:client:UseEquipment', function(weaponData)
    local weaponName = tostring(weaponData.name)
    local hash = joaat(weaponData.name)

    if weaponName == 'weapon_melee_torch' then
        if not HasPedGotWeapon(cache.ped, hash) then
            GiveWeaponToPed(cache.ped, hash, 0, false, true)
            SetCurrentPedWeapon(cache.ped, hash, true)
            TriggerServerEvent('rsg-weapons:server:removeitem', weaponName, 1)
        end
        return
    end

    if not HasPedGotWeapon(cache.ped, hash) then
        GiveWeaponToPed(cache.ped, hash, 0, false, true)
        SetCurrentPedWeapon(cache.ped, hash, true)
    else
        RemoveWeaponFromPed(cache.ped, hash)
    end
end)

CreateThread(function()
    while true do
        Wait(1)
        if IsPedShooting(cache.ped) then
            local heldWeapon = Citizen.InvokeNative(0x8425C5F057012DAB, cache.ped)
            local serialHeld = weaponInHands[heldWeapon]
            if heldWeapon and heldWeapon ~= -1569615261 then
                TriggerServerEvent('rsg-weapons:server:degradeWeapon', serialHeld)
            end
        end
    end
end)

CreateThread(function()
    while true do
        Wait(1)
        SetPlayerWeaponDamageModifier(PlayerId(), Config.WeaponDmg)
        SetPlayerMeleeWeaponDamageModifier(PlayerId(), Config.MeleeDmg)
        if IsPlayerFreeAiming(PlayerId()) then
            DisableControlAction(0, 0x8FFC75D6, true)
        end
    end
end)

RegisterNetEvent('rsg-weapons:client:repairweapon', function()
    local heldWeapon = Citizen.InvokeNative(0x8425C5F057012DAB, cache.ped)
    local currentSerial = weaponInHands[heldWeapon]
    local hasItem = RSGCore.Functions.HasItem('weapon_repair_kit', 1)

    if hasItem and currentSerial and heldWeapon ~= -1569615261 then
        LocalPlayer.state:set("inv_busy", true, true)
        lib.progressBar({
            duration = Config.RepairTime,
            position = 'bottom',
            useWhileDead = false,
            canCancel = false,
            disable = { move = true, mouse = true },
            label = locale('cl_repairing_weapon'),
        })
        TriggerServerEvent('rsg-weapons:server:removeitem', 'weapon_repair_kit', 1)
        TriggerServerEvent('rsg-weapons:server:repairweapon', currentSerial)
        LocalPlayer.state:set("inv_busy", false, true)
    else
        lib.notify({
            title = locale('cl_no_weapon_found'),
            description = locale('cl_no_weapon_found_desc'),
            type = 'inform',
            icon = 'fa-solid fa-gun',
            iconAnimation = 'shake',
            duration = 7000
        })
    end
end)

RegisterNetEvent('rsg-weapons:client:brokenweapon', function(serial)
    local input = lib.inputDialog(locale('cl_weapon_repair'), {
        {
            type = 'select',
            label = locale('cl_weapon_repair_p'),
            options = {
                { value = 'yes', text = locale('cl_reapir_yes') },
                { value = 'no',  text = locale('cl_reapir_no')  }
            },
            required = true
        },
    })

    if input and input[1] == 'yes' then
        TriggerEvent('rsg-weapons:client:repairbrokenweapon', serial)
    end
end)

RegisterNetEvent('rsg-weapons:client:repairbrokenweapon', function(serial)
    local hasItem = RSGCore.Functions.HasItem('weapon_repair_kit', 1)
    if hasItem and serial then
        LocalPlayer.state:set("inv_busy", true, true)
        lib.progressBar({
            duration = Config.RepairTime,
            position = 'bottom',
            useWhileDead = false,
            canCancel = false,
            disable = { move = true, mouse = true },
            label = locale('cl_repairing_weapon'),
        })
        TriggerServerEvent('rsg-weapons:server:removeitem', 'weapon_repair_kit', 1)
        TriggerServerEvent('rsg-weapons:server:repairweapon', serial)
        LocalPlayer.state:set("inv_busy", false, true)
    else
        lib.notify({
            title = locale('cl_item_need'),
            description = locale('cl_item_need_desc'),
            type = 'inform',
            icon = 'fa-solid fa-gun',
            iconAnimation = 'shake',
            duration = 7000
        })
    end
end)

--[[ LONG ARM LIMIT (Optional Safety Checker)
     In case something desyncs, this will clear currentLongArm if the
     weapon is no longer in UsedWeapons. ]]
CreateThread(function()
    while true do
        Wait(5000)
        if currentLongArm then
            local stillHave = false
            for serial, _ in pairs(UsedWeapons) do
                if serial == currentLongArm then
                    stillHave = true
                    break
                end
            end
            if not stillHave then
                currentLongArm = nil
            end
        end
    end
end)
--[[ LONG ARM LIMIT END ]]-----------------------------------------------------


CreateThread(function()
    while true do
        Wait(1)
        if IsPedShooting(cache.ped) then
            local heldWeapon = Citizen.InvokeNative(0x8425C5F057012DAB, cache.ped)
            local serialHeld = weaponInHands[heldWeapon]
            if heldWeapon and heldWeapon ~= -1569615261 then
                TriggerServerEvent('rsg-weapons:server:degradeWeapon', serialHeld)
            end
        end
    end
end)

CreateThread(function()
    while true do
        Wait(1)
        SetPlayerWeaponDamageModifier(PlayerId(), Config.WeaponDmg)
        SetPlayerMeleeWeaponDamageModifier(PlayerId(), Config.MeleeDmg)
        if IsPlayerFreeAiming(PlayerId()) then
            DisableControlAction(0, 0x8FFC75D6, true)
        end
    end
end)

RegisterNetEvent('rsg-weapons:client:repairweapon', function()
    local heldWeapon = Citizen.InvokeNative(0x8425C5F057012DAB, cache.ped)
    local currentSerial = weaponInHands[heldWeapon]
    local hasItem = RSGCore.Functions.HasItem('weapon_repair_kit', 1)

    if hasItem and currentSerial and heldWeapon ~= -1569615261 then
        LocalPlayer.state:set("inv_busy", true, true)
        lib.progressBar({
            duration = Config.RepairTime,
            position = 'bottom',
            useWhileDead = false,
            canCancel = false,
            disable = { move = true, mouse = true },
            label = locale('cl_repairing_weapon'),
        })
        TriggerServerEvent('rsg-weapons:server:removeitem', 'weapon_repair_kit', 1)
        TriggerServerEvent('rsg-weapons:server:repairweapon', currentSerial)
        LocalPlayer.state:set("inv_busy", false, true)
    else
        lib.notify({
            title = locale('cl_no_weapon_found'),
            description = locale('cl_no_weapon_found_desc'),
            type = 'inform',
            icon = 'fa-solid fa-gun',
            iconAnimation = 'shake',
            duration = 7000
        })
    end
end)

RegisterNetEvent('rsg-weapons:client:brokenweapon', function(serial)
    local input = lib.inputDialog(locale('cl_weapon_repair'), {
        {
            type = 'select',
            label = locale('cl_weapon_repair_p'),
            options = {
                { value = 'yes', text = locale('cl_reapir_yes') },
                { value = 'no',  text = locale('cl_reapir_no')  }
            },
            required = true
        },
    })

    if input and input[1] == 'yes' then
        TriggerEvent('rsg-weapons:client:repairbrokenweapon', serial)
    end
end)

RegisterNetEvent('rsg-weapons:client:repairbrokenweapon', function(serial)
    local hasItem = RSGCore.Functions.HasItem('weapon_repair_kit', 1)
    if hasItem and serial then
        LocalPlayer.state:set("inv_busy", true, true)
        lib.progressBar({
            duration = Config.RepairTime,
            position = 'bottom',
            useWhileDead = false,
            canCancel = false,
            disable = { move = true, mouse = true },
            label = locale('cl_repairing_weapon'),
        })
        TriggerServerEvent('rsg-weapons:server:removeitem', 'weapon_repair_kit', 1)
        TriggerServerEvent('rsg-weapons:server:repairweapon', serial)
        LocalPlayer.state:set("inv_busy", false, true)
    else
        lib.notify({
            title = locale('cl_item_need'),
            description = locale('cl_item_need_desc'),
            type = 'inform',
            icon = 'fa-solid fa-gun',
            iconAnimation = 'shake',
            duration = 7000
        })
    end
end)
