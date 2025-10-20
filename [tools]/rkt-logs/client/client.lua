CreateThread(function()
    local lastPedAimed
    while true do
        Wait(1000)
        local letSleep = true
        local playerPed = PlayerPedId()
		local exist, weapon = GetCurrentPedWeapon(PlayerPedId()) 

        if DoesEntityExist(playerPed) then
            if IsPedArmed(playerPed, 4) then
                letSleep = false

                local isAiming, targetPed = GetEntityPlayerIsFreeAimingAt(PlayerId(-1))
                if isAiming and targetPed ~= lastPedAimed then
                    lastPedAimed = targetPed

                    if DoesEntityExist(targetPed) and IsEntityAPed(targetPed) then
                        if IsPedAPlayer(targetPed) then
                            local targetId = NetworkGetPlayerIndexFromPed(targetPed)

                            if targetId then
                                local pedId = GetPlayerServerId(targetId)
                                
                                if pedId and (pedId > 0) then
                                    print('1')
                                    TriggerServerEvent('rkt-logs:aimlogs', pedId)
                                end
                            end
                        end
                    end
                end
            end
        end

        if letSleep then
            Wait(1000)
        end
    end 
end)

local playerArmor = 0

CreateThread(function()
	local DeathReason, Killer, DeathCauseHash, Weapon

	while true do
        local sleep = true
		Wait(1000)
		
		if IsEntityDead(PlayerPedId()) then
            sleep = false
			Wait(500)
			local PedKiller = GetPedSourceOfDeath(PlayerPedId())
			DeathCauseHash = GetPedCauseOfDeath(PlayerPedId())
			Weapon = WeaponNames[tostring(DeathCauseHash)]

			if IsEntityAPed(PedKiller) and IsPedAPlayer(PedKiller) then
				Killer = NetworkGetPlayerIndexFromPed(PedKiller)
			elseif IsEntityAVehicle(PedKiller) and IsEntityAPed(GetPedInVehicleSeat(PedKiller, -1)) and IsPedAPlayer(GetPedInVehicleSeat(PedKiller, -1)) then
				Killer = NetworkGetPlayerIndexFromPed(GetPedInVehicleSeat(PedKiller, -1))
			end
			
			if (Killer == PlayerId()) then
				DeathReason = 'committed suicide'
			elseif (Killer == nil) then
				DeathReason = 'died'
			else
				if IsMelee(DeathCauseHash) then
                    DeathReason = 'assassinated'
                elseif IsTorch(DeathCauseHash) then
                    DeathReason = 'burned'
                elseif IsKnife(DeathCauseHash) then
                    DeathReason = 'stabbed'
                elseif IsPistol(DeathCauseHash) then
                    DeathReason = 'shot by a pistol'
                elseif IsRifle(DeathCauseHash) then
                    DeathReason = 'shot by a rifle'
                elseif IsShotgun(DeathCauseHash) then
                    DeathReason = 'shot by a shotgun'
                elseif IsSniper(DeathCauseHash) then
                    DeathReason = 'shot by a sniper'
                else
                    DeathReason = 'killed'
                end

			end
			
			TriggerServerEvent('rkt-logs:killlogs', GetPlayerServerId(Killer), DeathReason, Weapon)
			Killer = nil
			DeathReason = nil
			DeathCauseHash = nil
			Weapon = nil
		end
		
		while IsEntityDead(PlayerPedId()) do
			Wait(0)
		end

        if sleep then Wait(500) end
	end
end)

function IsMelee(Weapon)
    local Weapons = {
        'WEAPON_UNARMED',
        'WEAPON_MELEE_KNIFE',
        'WEAPON_MELEE_KNIFE_BEAR',
        'WEAPON_MELEE_KNIFE_CIVIL_WAR',
        'WEAPON_MELEE_KNIFE_JAWBONE',
        'WEAPON_MELEE_KNIFE_JOHN',
        'WEAPON_MELEE_KNIFE_MINER',
        'WEAPON_MELEE_KNIFE_VAMPIRE',
        'WEAPON_MELEE_LANTERN_ELECTRIC',
        'WEAPON_MELEE_TORCH',
        'WEAPON_MELEE_HATCHET',
        'WEAPON_MELEE_HATCHET_DOUBLE_BIT',
        'WEAPON_MELEE_HATCHET_DOUBLE_BIT_RUSTED',
        'WEAPON_MELEE_HATCHET_HEWING',
        'WEAPON_MELEE_HATCHET_HUNTER',
        'WEAPON_MELEE_HATCHET_HUNTER_RUSTED',
        'WEAPON_MELEE_HATCHET_VIKING',
        'WEAPON_MELEE_CLEAVER',
        'WEAPON_MELEE_BROKEN_SWORD',
        'WEAPON_MELEE_ANCIENT_HATCHET'
    }
    for _, CurrentWeapon in ipairs(Weapons) do
        if GetHashKey(CurrentWeapon) == Weapon then
            return true
        end
    end
    return false
end

function IsTorch(Weapon)
    return GetHashKey('WEAPON_MELEE_TORCH') == Weapon
end

function IsKnife(Weapon)
    local Weapons = {
        'WEAPON_MELEE_KNIFE',
        'WEAPON_MELEE_KNIFE_BEAR',
        'WEAPON_MELEE_KNIFE_CIVIL_WAR',
        'WEAPON_MELEE_KNIFE_JAWBONE',
        'WEAPON_MELEE_KNIFE_JOHN',
        'WEAPON_MELEE_KNIFE_MINER',
        'WEAPON_MELEE_KNIFE_VAMPIRE'
    }
    for _, CurrentWeapon in ipairs(Weapons) do
        if GetHashKey(CurrentWeapon) == Weapon then
            return true
        end
    end
    return false
end

function IsPistol(Weapon)
    local Weapons = {
        'WEAPON_PISTOL_M1899',
        'WEAPON_PISTOL_MAUSER',
        'WEAPON_PISTOL_MAUSER_DRUNK',
        'WEAPON_PISTOL_SEMIAUTO',
        'WEAPON_PISTOL_VOLCANIC'
    }
    for _, CurrentWeapon in ipairs(Weapons) do
        if GetHashKey(CurrentWeapon) == Weapon then
            return true
        end
    end
    return false
end

function IsRevolver(Weapon)
    local Weapons = {
        'WEAPON_REVOLVER_CATTLEMAN',
        'WEAPON_REVOLVER_CATTLEMAN_JOHN',
        'WEAPON_REVOLVER_CATTLEMAN_MEXICAN',
        'WEAPON_REVOLVER_CATTLEMAN_PIG',
        'WEAPON_REVOLVER_DOUBLEACTION',
        'WEAPON_REVOLVER_DOUBLEACTION_EXOTIC',
        'WEAPON_REVOLVER_DOUBLEACTION_GAMBLER',
        'WEAPON_REVOLVER_DOUBLEACTION_MICAH',
        'WEAPON_REVOLVER_LEMAT',
        'WEAPON_REVOLVER_SCHOFIELD',
        'WEAPON_REVOLVER_SCHOFIELD_CALLOWAY',
        'WEAPON_REVOLVER_SCHOFIELD_GOLDEN'
    }
    for _, CurrentWeapon in ipairs(Weapons) do
        if GetHashKey(CurrentWeapon) == Weapon then
            return true
        end
    end
    return false
end

function IsRepeater(Weapon)
    local Weapons = {
        'WEAPON_REPEATER_CARBINE',
        'WEAPON_REPEATER_EVANS',
        'WEAPON_REPEATER_HENRY',
        'WEAPON_REPEATER_WINCHESTER'
    }
    for _, CurrentWeapon in ipairs(Weapons) do
        if GetHashKey(CurrentWeapon) == Weapon then
            return true
        end
    end
    return false
end

function IsRifle(Weapon)
    local Weapons = {
        'WEAPON_RIFLE_BOLTACTION',
        'WEAPON_RIFLE_SPRINGFIELD',
        'WEAPON_RIFLE_VARMINT'
    }
    for _, CurrentWeapon in ipairs(Weapons) do
        if GetHashKey(CurrentWeapon) == Weapon then
            return true
        end
    end
    return false
end

function IsShotgun(Weapon)
    local Weapons = {
        'WEAPON_SHOTGUN_DOUBLEBARREL',
        'WEAPON_SHOTGUN_DOUBLEBARREL_EXOTIC',
        'WEAPON_SHOTGUN_PUMP',
        'WEAPON_SHOTGUN_REPEATING',
        'WEAPON_SHOTGUN_SAWEDOFF',
        'WEAPON_SHOTGUN_SEMIAUTO'
    }
    for _, CurrentWeapon in ipairs(Weapons) do
        if GetHashKey(CurrentWeapon) == Weapon then
            return true
        end
    end
    return false
end

function IsSniper(Weapon)
    local Weapons = {
        'WEAPON_SNIPERRIFLE_CARCANO',
        'WEAPON_SNIPERRIFLE_ROLLINGBLOCK',
        'WEAPON_SNIPERRIFLE_ROLLINGBLOCK_EXOTIC'
    }
    for _, CurrentWeapon in ipairs(Weapons) do
        if GetHashKey(CurrentWeapon) == Weapon then
            return true
        end
    end
    return false
end

function IsThrown(Weapon)
    local Weapons = {
        'WEAPON_THROWN_DYNAMITE',
        'WEAPON_THROWN_MOLOTOV',
        'WEAPON_THROWN_THROWING_KNIVES',
        'WEAPON_THROWN_TOMAHAWK',
        'WEAPON_THROWN_TOMAHAWK_ANCIENT'
    }
    for _, CurrentWeapon in ipairs(Weapons) do
        if GetHashKey(CurrentWeapon) == Weapon then
            return true
        end
    end
    return false
end

function IsBow(Weapon)
    return GetHashKey('WEAPON_BOW') == Weapon
end

function IsLasso(Weapon)
    return GetHashKey('WEAPON_LASSO') == Weapon
end
WeaponNames = {
	[tostring(GetHashKey('WEAPON_UNARMED'))] = 'Unarmed',
	[tostring(GetHashKey('WEAPON_MELEE_KNIFE'))] = 'KNIFE',
	[tostring(GetHashKey('WEAPON_MELEE_KNIFE_BEAR'))] = 'KNIFE BEAR',
	[tostring(GetHashKey('WEAPON_MELEE_KNIFE_CIVIL_WAR'))] = 'KNIFE CIVIL WAR',
	[tostring(GetHashKey('WEAPON_MELEE_KNIFE_JAWBONE'))] = 'KNIFE JAWBONE',
	[tostring(GetHashKey('WEAPON_MELEE_KNIFE_JOHN'))] = 'KNIFE JOHN',
	[tostring(GetHashKey('WEAPON_MELEE_KNIFE_MINER'))] = 'KNIFE MINER',
	[tostring(GetHashKey('WEAPON_MELEE_KNIFE_VAMPIRE'))] = 'KNIFE VAMPIRE',
	[tostring(GetHashKey('WEAPON_MELEE_LANTERN_ELECTRIC'))] = 'LANTERN ELECTRIC',
	[tostring(GetHashKey('WEAPON_MELEE_MACHETE'))] = 'MACHETE',
	[tostring(GetHashKey('WEAPON_MELEE_TORCH'))] = 'TORCH',
	[tostring(GetHashKey('WEAPON_MOONSHINEJUG'))] = 'MOONSHINEJUG',
	[tostring(GetHashKey('WEAPON_PISTOL_M1899'))] = 'PISTOL M1899',
	[tostring(GetHashKey('WEAPON_PISTOL_MAUSER'))] = 'PISTOL MAUSER',
	[tostring(GetHashKey('WEAPON_PISTOL_MAUSER_DRUNK'))] = 'PISTOL MAUSER DRUNK',
	[tostring(GetHashKey('WEAPON_PISTOL_SEMIAUTO'))] = 'PISTOL SEMIAUTO',
	[tostring(GetHashKey('WEAPON_PISTOL_VOLCANIC'))] = 'PISTOL VOLCANIC',
	[tostring(GetHashKey('WEAPON_REPEATER_CARBINE'))] = 'REPEATER CARBINE',
	[tostring(GetHashKey('WEAPON_REPEATER_EVANS'))] = 'REPEATER EVANS',
	[tostring(GetHashKey('WEAPON_REPEATER_HENRY'))] = 'REPEATER HENR',
	[tostring(GetHashKey('WEAPON_REPEATER_WINCHESTER'))] = 'REPEATER WINCHESTER',
	[tostring(GetHashKey('WEAPON_REVOLVER_CATTLEMAN'))] = 'REVOLVER CATTLEMAN',
	[tostring(GetHashKey('WEAPON_REVOLVER_CATTLEMAN_JOHN'))] = 'REVOLVER CATTLEMAN JOHN',
	[tostring(GetHashKey('WEAPON_REVOLVER_CATTLEMAN_MEXICAN'))] = 'REVOLVER CATTLEMAN MEXICAN',
	[tostring(GetHashKey('WEAPON_REVOLVER_CATTLEMAN_PIG'))] = 'REVOLVER CATTLEMAN PIG',
	[tostring(GetHashKey('WEAPON_REVOLVER_DOUBLEACTION'))] = 'REVOLVER DOUBLEACTION',
	[tostring(GetHashKey('WEAPON_REVOLVER_DOUBLEACTION_EXOTIC'))] = 'REVOLVER DOUBLEACTION EXOTIC',
	[tostring(GetHashKey('WEAPON_REVOLVER_DOUBLEACTION_GAMBLER'))] = 'REVOLVER DOUBLEACTION GAMBLER',
	[tostring(GetHashKey('WEAPON_REVOLVER_DOUBLEACTION_MICAH'))] = 'REVOLVER DOUBLEACTION MICAH',
	[tostring(GetHashKey('WEAPON_REVOLVER_LEMAT'))] = 'REVOLVER LEMAT',
	[tostring(GetHashKey('WEAPON_REVOLVER_SCHOFIELD'))] = 'REVOLVER SCHOFIELD',
	[tostring(GetHashKey('WEAPON_REVOLVER_SCHOFIELD_CALLOWAY'))] = 'REVOLVER SCHOFIELD CALLOWAY',
	[tostring(GetHashKey('WEAPON_REVOLVER_SCHOFIELD_GOLDEN'))] = 'REVOLVER SCHOFIELD GOLDEN',
	[tostring(GetHashKey('WEAPON_RIFLE_BOLTACTION'))] = 'RIFLE BOLTACTION',
	[tostring(GetHashKey('WEAPON_RIFLE_SPRINGFIELD'))] = 'RIFLE SPRINGFIELD',
	[tostring(GetHashKey('WEAPON_RIFLE_VARMINT'))] = 'RIFLE VARMINT',
	[tostring(GetHashKey('WEAPON_SHOTGUN_DOUBLEBARREL'))] = 'SHOTGUN DOUBLEBARREL',
	[tostring(GetHashKey('WEAPON_SHOTGUN_DOUBLEBARREL_EXOTIC'))] = 'SHOTGUN DOUBLEBARREL EXOTIC',
	[tostring(GetHashKey('WEAPON_SHOTGUN_PUMP'))] = 'SHOTGUN PUMP',
	[tostring(GetHashKey('WEAPON_SHOTGUN_REPEATING'))] = 'SHOTGUN REPEATING',
	[tostring(GetHashKey('WEAPON_SHOTGUN_SAWEDOFF'))] = 'SHOTGUN SAWEDOFF',
	[tostring(GetHashKey('OBJECT'))] = 'Object',
	[tostring(GetHashKey('WEAPON_SHOTGUN_SEMIAUTO'))] = 'SHOTGUN SEMIAUTO',
	[tostring(GetHashKey('WEAPON_SNIPERRIFLE_CARCANO'))] = 'SNIPERRIFLE CARCANO',
	[tostring(GetHashKey('WEAPON_SNIPERRIFLE_ROLLINGBLOCK'))] = 'SNIPERRIFLE ROLLINGBLOCK',
	[tostring(GetHashKey('WEAPON_SNIPERRIFLE_ROLLINGBLOCK_EXOTIC'))] = 'SNIPERRIFLE ROLLINGBLOCK EXOTIC',
	[tostring(GetHashKey('WEAPON_THROWN_DYNAMITE'))] = 'DYNAMITE',
	[tostring(GetHashKey('WEAPON_THROWN_MOLOTOV'))] = 'MOLOTOV',
	[tostring(GetHashKey('WEAPON_THROWN_THROWING_KNIVES'))] = 'THROWING KNIVES',
	[tostring(GetHashKey('WEAPON_THROWN_TOMAHAWK'))] = 'TOMAHAWK',
	[tostring(GetHashKey('WEAPON_THROWN_TOMAHAWK_ANCIENT'))] = 'TOMAHAWK ANCIENT',
	[tostring(GetHashKey('WEAPON_MELEE_HATCHET_VIKING'))] = 'HATCHET VIKING',
	[tostring(GetHashKey('WEAPON_MELEE_HATCHET_HUNTER_RUSTED'))] = 'HATCHET HUNTER RUSTED',
	[tostring(GetHashKey('WEAPON_MELEE_HATCHET_HUNTER'))] = 'HATCHET HUNTER',
	[tostring(GetHashKey('WEAPON_MELEE_HATCHET_HEWING'))] = 'HATCHET HEWING',
	[tostring(GetHashKey('WEAPON_MELEE_HATCHET_DOUBLE_BIT_RUSTED'))] = 'HATCHET DOUBLE BIT RUSTED',
	[tostring(GetHashKey('WEAPON_MELEE_HATCHET_DOUBLE_BIT'))] = 'HATCHET DOUBLE BIT',
	[tostring(GetHashKey('WEAPON_MELEE_HATCHET'))] = 'HATCHET',
	[tostring(GetHashKey('WEAPON_MELEE_CLEAVER'))] = 'CLEAVER',
	[tostring(GetHashKey('WEAPON_MELEE_BROKEN_SWORD'))] = 'BROKEN SWORD',
	[tostring(GetHashKey('WEAPON_MELEE_ANCIENT_HATCHET'))] = 'ANCIENT HATCHET',
	[tostring(GetHashKey('WEAPON_LASSO'))] = 'LASSO',
	[tostring(GetHashKey('WEAPON_FISHINGROD'))] = 'FISHINGROD',
	[tostring(GetHashKey('WEAPON_BOW'))] = 'BOW'
}