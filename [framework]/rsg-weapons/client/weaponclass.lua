WeaponAPI = {}
WeaponAPI.used = false
--WeaponAPI.used2 = false

local EquippedWeapons = {}

------------------------------------------
-- equiped weapons export
------------------------------------------
exports('EquippedWeapons', function()
    return EquippedWeapons
end)
--------------------------------------------------------------

local ItemdatabaseIsKeyValid = function(weaponHash, unk)
    return Citizen.InvokeNative(0x6D5D51B188333FD1, weaponHash , unk)
end

local InventoryAddItemWithGuid = function(inventoryId, itemData, parentItem, itemHash, slotHash, amount, addReason)
    return Citizen.InvokeNative(0xCB5D11F9508A928D, inventoryId, itemData, parentItem, itemHash, slotHash, amount, addReason);
end

local InventoryEquipItemWithGuid = function(inventoryId , itemData , bEquipped)
    return Citizen.InvokeNative(0x734311E2852760D0, inventoryId , itemData , bEquipped)
end

local getGuidFromItemId = function(inventoryId, itemData, category, slotId)
	local outItem = DataView.ArrayBuffer(8 * 13)
	local success = Citizen.InvokeNative(0x886DFD3E185C8A89, inventoryId, itemData and itemData or 0, category, slotId, outItem:Buffer())
	return success and outItem or nil
end

local moveInventoryItem = function(inventoryId, old, new, slot)
    local outGUID = DataView.ArrayBuffer(8 * 13)
    if not slot then slot = 1 end
    local sHash = "SLOTID_WEAPON_" .. tostring(slot)
    local success = Citizen.InvokeNative(0xDCCAA7C3BFD88862, inventoryId, old, new, joaat(sHash), 1, outGUID:Buffer())
    return success and outGUID or nil
end

WeaponAPI.EquipWeapon = function(weaponName, slot, id, hash)
    -- Prevent dual wielding: if a weapon is already equipped, remove it first
    if #EquippedWeapons > 0 then
        print("Weapon already equipped, removing current weapon to prevent dual wield")
        WeaponAPI.RemoveWeaponFromPeds(EquippedWeapons[1].name, EquippedWeapons[1].id)
    end
    
    -- Force slot to 0 (primary weapon slot) to prevent dual wielding
    slot = 0
    
    local weaponHash = joaat(weaponName)
    local slotHash = joaat("SLOTID_WEAPON_" .. tostring(slot))
    local addReason = ADD_REASON_DEFAULT
    local inventoryId = 1
    local playerPedId = PlayerPedId()

    local isValid = ItemdatabaseIsKeyValid(weaponHash, 0)
    if not isValid then
        print("Weapon not valid")
        return false
    end

    local characterItem = getGuidFromItemId(inventoryId, nil, joaat("CHARACTER"), 0xA1212100) --return func_1367(joaat("CHARACTER"), func_2485(), -1591664384, bParam0);
	if not characterItem then
		print("featureless")
		return false
	end

	local weaponItem = getGuidFromItemId(inventoryId, characterItem:Buffer(), 923904168, -740156546) --return func_1367(923904168, func_1889(1), -740156546, 0);
	if not weaponItem then
		print("sem armas")
		return false
	end

    local itemData = DataView.ArrayBuffer(8 * 13)
    local isAdded = InventoryAddItemWithGuid(inventoryId, itemData:Buffer(), weaponItem:Buffer(), weaponHash, slotHash, 1, addReason)
    if not isAdded then
        print("Not added")
        return false
    end

    local equipped = InventoryEquipItemWithGuid(inventoryId, itemData:Buffer(), true)
    if not equipped then
        print("Unable to equip")
        return false
    end

    WeaponAPI.used = true
    Citizen.InvokeNative(0x12FB95FE3D579238, playerPedId, itemData:Buffer(), true, slot, false, false)

    if id then
        local nWeapon = {
            id = id,
	    name = weaponName,
            hash = hash,
            guid = itemData:Buffer(),
        }
        -- Clear the equipped weapons table and add only the new weapon
        EquippedWeapons = {}
        table.insert(EquippedWeapons, nWeapon)
    end

    return true
end

WeaponAPI.RemoveWeaponFromPeds = function(weaponName, serial)
    local isWeaponAGun = Citizen.InvokeNative(0x705BE297EEBDB95D, joaat(weaponName))
    local isWeaponOneHanded = Citizen.InvokeNative(0xD955FEE4B87AFA07, joaat(weaponName))
    local playerPedId = PlayerPedId()
    local inventoryId = 1

    local weaponRemoved = false
    if isWeaponAGun and isWeaponOneHanded then
        for k, v in pairs(EquippedWeapons) do
            if v.id == serial then
                Citizen.InvokeNative(0x3E4E811480B3AE79, 1, v.guid, 1, joaat("REMOVE_REASON_DEFAULT"))
                table.remove(EquippedWeapons, k)
                weaponRemoved = true
                break
            end
        end
    end

    -- Since we're preventing dual wield, we don't need to move weapons around
    -- Just remove the weapon and clear the equipped weapons
    if weaponRemoved then
        exports['rsg-weapons']:UsedWeapons(serial)
        WeaponAPI.used = false
        -- Clear all equipped weapons since we only allow one
        EquippedWeapons = {}
    else
        RemoveWeaponFromPed(playerPedId, joaat(weaponName), true, 0)
        exports['rsg-weapons']:UsedWeapons(serial)
        WeaponAPI.used = false
        -- Clear equipped weapons table
        EquippedWeapons = {}
    end
end
exports('RemoveWeaponFromPeds', WeaponAPI.RemoveWeaponFromPeds)

return WeaponAPI