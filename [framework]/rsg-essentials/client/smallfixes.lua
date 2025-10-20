local RSGCore = exports['rsg-core']:GetCoreObject()
lib.locale()
local PauseOpen = false

-- ped drown / boat sink fix
CreateThread(function()
    while true do
        Wait(0)
        SetPedResetFlag(cache.ped, 364)
    end
end)

-- change voice proximity
CreateThread(function()
    while true do
        Wait(0)
        if IsControlJustPressed(0, RSGCore.Shared.Keybinds['J']) then
            ExecuteCommand('cycleproximity')
        end
    end
end)

-- wagon stuck fix
CreateThread(function()
    local vehiclePool = {}
    local wagon = 0
    local driver = 0
    local horse = 0
    while true do
        vehiclePool = GetGamePool('CVehicle')
        for i = 1, #vehiclePool do
            wagon = vehiclePool[i]
            -- is wagon stopped
            --if IsEntityAVehicle(wagon) and IsVehicleStopped(wagon) then
            if IsEntityAVehicle(wagon) and IsVehicleStopped(wagon) and not IsEntityAMissionEntity(wagon) then
                -- get the horse
                horse = GetPedInDraftHarness(wagon, 0)
                -- if vehicle stopped but the horse walks = buggy wagon
                if IsPedWalking(horse) then
                    -- delete driver & wagon
                    driver = GetDriverOfVehicle(wagon)
                    if driver ~= cache.ped then
                        if driver then
                            DeleteEntity(driver)
                        end
                        RemoveVehicleLightPropSets(wagon)
                        RemoveVehiclePropSets(wagon)
                        DeleteEntity(wagon)
                    end
                end
            end
        end
        Wait(1000)
    end
end)

-- pause menu animation
CreateThread(function()
    while true do
        Wait(100)

        if IsPauseMenuActive() and not PauseOpen and Config.PauseReadBook then
            SetCurrentPedWeapon(cache.ped, 0xA2719263, true) -- set unarmed
            SetCurrentPedWeapon(cache.ped, joaat('weapon_unarmed'))
            if not IsPedOnMount(cache.ped) then
                TaskStartScenarioInPlace(cache.ped, joaat('WORLD_HUMAN_SIT_GROUND_READING_BOOK'), -1, true, "StartScenario", 0, false)
            end
            PauseOpen = true
        end

        if not IsPauseMenuActive() and PauseOpen then
            ClearPedTasks(cache.ped)
            Wait(4000)
            SetCurrentPedWeapon(cache.ped, 0xA2719263, true) -- set unarmed
            SetCurrentPedWeapon(cache.ped, joaat('weapon_unarmed'))
            PauseOpen = false
        end
    end
end)

-- Disable Controls 
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(3)
        --DisableControlAction(0, 0xAC4BD4F1, true) -- Disable weapon wheel | TAB (while holding)
        --DisableControlAction(0, 0xB238FE0B, true) -- Disable toggle holster | TAB TAB (fast tapping)
        -- if WheelMenuSpace then
        --     DisableControlAction(0, 0xCF8A4ECA, true) -- disable left alt hud | LEFT ALT (fast tapping)
        -- end
        -- LEFT ALT HUD
        DisableControlAction(0, 0xCF8A4ECA, true) -- disable left alt hud | LEFT ALT (fast tapping)
        DisableControlAction(0, 0x9CC7A1A4, true) -- disable Ability Loadout prompt
    end
end)

-- handle dead or dying animals / thanks to rms_dnb
-- local pickedUpAnimals = {}
-- CreateThread(function()
--     while true do
--         local sleep = 900000 -- every 15 min
--         print(locale('cl_clean_cycle'))
--         local pedPool = GetGamePool('CPed')
--         print(locale('cl_num_ped')..": " .. #pedPool)
--         local deadAnimalsCount = 0

--         for i = 1, #pedPool do
--             local ped = pedPool[i]

--             -- Check if the ped is an animal
--             if Citizen.InvokeNative(0x9A100F1CF4546629, ped) and IsEntityDead(ped) then
--                 print(locale('cl_num_animal')..": " .. ped)

--                 -- Check if the animal is attached to another entity
--                 if IsEntityAttachedToAnyPed(ped) then
--                     -- Mark the animal as picked up
--                     pickedUpAnimals[ped] = true
--                     print(locale('cl_num_animal_b')..": " .. ped)
--                 elseif not pickedUpAnimals[ped] then
--                     -- Check if the entity still exists
--                     if DoesEntityExist(ped) then
--                         if GetPedTimeOfDeath(ped) < GetGameTimer() then --check if dead long enough
--                             -- Try to delete the entity
--                             DeleteEntity(ped)

--                             -- Check if deletion was successful
--                             if DoesEntityExist(ped) then
--                                 print(locale('cl_num_animal_c')..": " .. ped)
--                                 SetEntityAsNoLongerNeeded(ped)
--                                 SetEntityHealth(ped, 0)
--                             else
--                                 print(locale('cl_num_animal_d')..": " .. ped)
--                                 deadAnimalsCount = deadAnimalsCount + 1
--                             end
--                         end
--                     else
--                         print(locale('cl_num_animal_e')..": " .. ped)
--                     end
--                 else
--                     print(locale('cl_num_animal_f')..": " .. ped)
--                 end
--             end
--         end
--         print(locale('cl_num_animal_g')..": " .. deadAnimalsCount)
--         print(locale('cl_num_animal_h'))
--         Wait(sleep)
--     end
-- end)
----------JULY27NEWEST
-- local pickedUpAnimals = {}
-- local animalDeathTimes = {}
-- local animalCheckInterval = 3600000 -- 1 hour (in ms)
-- local animalDeleteDelay = 60000 -- 1 minute after death

-- -- Safe entity deletion with crash protection
-- local function DeleteEntitySafe(entity)
--     if not entity or not DoesEntityExist(entity) then return end
--     local ok, err = pcall(function()
--         if NetworkGetEntityIsNetworked(entity) then
--             if NetworkGetEntityOwner(entity) == PlayerId() then
--                 SetEntityAsMissionEntity(entity, true, true)
--                 DeleteEntity(entity)
--             end
--         else
--             SetEntityAsMissionEntity(entity, true, true)
--             DeleteEntity(entity)
--         end
--         if DoesEntityExist(entity) then
--             SetEntityAsNoLongerNeeded(entity)
--             SetEntityHealth(entity, 0)
--         end
--     end)
--     if not ok then
--         print("^1[AnimalCleanup] Error deleting entity: " .. tostring(err) .. "^0")
--     end
-- end

-- -- Check if ped is an animal
-- local function IsPedAnimal(ped)
--     local ok, result = pcall(function()
--         return ped and DoesEntityExist(ped) and Citizen.InvokeNative(0x9A100F1CF4546629, ped)
--     end)
--     return ok and result
-- end

-- -- Main cleanup thread
-- CreateThread(function()
--     while true do
--         local pedPool = GetGamePool('CPed')
--         local deadAnimalsCount = 0
--         local currentTime = GetGameTimer()

--         for _, ped in ipairs(pedPool) do
--             if DoesEntityExist(ped) and not IsPedAPlayer(ped) and IsPedAnimal(ped) then
--                 local ok, deadCheck = pcall(function()
--                     return IsEntityDead(ped)
--                 end)

--                 if ok and deadCheck then
--                     if not animalDeathTimes[ped] then
--                         animalDeathTimes[ped] = currentTime
--                     end

--                     if IsEntityAttachedToAnyPed(ped) then
--                         pickedUpAnimals[ped] = true
--                     elseif not pickedUpAnimals[ped] then
--                         if currentTime - animalDeathTimes[ped] >= animalDeleteDelay then
--                             DeleteEntitySafe(ped)
--                             if not DoesEntityExist(ped) then
--                                 deadAnimalsCount = deadAnimalsCount + 1
--                                 animalDeathTimes[ped] = nil
--                                 pickedUpAnimals[ped] = nil
--                             end
--                         end
--                     end
--                 else
--                     animalDeathTimes[ped] = nil
--                     pickedUpAnimals[ped] = nil
--                 end
--             end
--         end

--         print("^3[AnimalCleanup] Cycle complete. Dead animals removed: " .. deadAnimalsCount .. "^0")
--         Wait(animalCheckInterval) -- Wait 1 hour
--     end
-- end)



-- RegisterNetEvent('rsg-essentials:client:pvpToggle',function()
--     local ped = PlayerPedId()

--     if pvp == true then
--         SetRelationshipBetweenGroups(1,`PLAYER`, `PLAYER`)
--         NetworkSetFriendlyFireOption(false)
--         Citizen.InvokeNative(0xB8DE69D9473B7593, ped, 6) -- Disable choking other people

--         pvp = false

--         lib.notify({ title = locale('cl_pvp_toggle_off'), type = 'info', icon = 'fa-solid fa-shield', iconAnimation = 'shake', duration = 7000 })
--         return
--     end

--     SetRelationshipBetweenGroups(5, `PLAYER`, `PLAYER`)
--     NetworkSetFriendlyFireOption(true)
--     Citizen.InvokeNative(0x949B2F9ED2917F5D, ped, 6) -- Enable choking other people

--     pvp = true

--     lib.notify({ title = locale('cl_pvp_toggle_on'), type = 'info', icon = 'fa-solid fa-shield', iconAnimation = 'shake', duration = 7000 })

-- end)


-- RegisterCommand("pvp", function()
--     TriggerEvent("rsg-essentials:client:pvpToggle")
-- end, false)

-------------------------------

-- no boats swimiing
boatsinvincible = true -- Sets all boats to be invincible
NoSinkZone = true -- stops boats from sinking when past the sink zone border
InfSwim = true -- allows infinite swimming, similar to gta 5 swimming

--no touchy below this, unless you know what you're doing!

function CheckPlayerWaterStatus()
    if IsPedSwimming(PlayerPedId()) and InfSwim then
        local stam = GetAttributeCoreValue(PlayerPedId(), 1)
        Citizen.InvokeNative(0xC6258F41D86676E0, PlayerPedId(), 1, stam > 2 and stam or 5)
    end
end

function StopBoatFromSinking()
    if IsPedInAnyBoat(PlayerPedId()) then
        local veh = GetVehiclePedIsIn(PlayerPedId(), false)
        local health = GetEntityMaxHealth(veh)
        SetEntityInvincible(veh, true)
    else
        SetEntityInvincible(veh, false)
    end
end

function SinkZone()
    if NoSinkZone then
        Citizen.InvokeNative(0xC1E8A365BF3B29F2, PlayerPedId(), 364, 1) -- stop boat from sinking past sink zones
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        CheckPlayerWaterStatus()
        SinkZone()
        if boatsinvincible then
            StopBoatFromSinking()
        end
    end
end)

------------
--remove tab wheel map showing
CreateThread(function()
    local DisableTabWheelCompass = true -- true / false
	
    if DisableTabWheelCompass then
	while true do
		Wait(1) --Default 1
        if Citizen.InvokeNative(0x96FD694FE5BE55DC, GetHashKey("hud_quick_select")) == 1322164459 or Citizen.InvokeNative(0x96FD694FE5BE55DC, GetHashKey("hud_quick_select")) == 400623090 then
		DisplayRadar(false)
			end
		end
	end
end)


--disable natives opening doors in game cupbaord drawers
Citizen.CreateThread(function()
    while true do
      Citizen.Wait(0)
      --Citizen.InvokeNative(0xFC094EF26DD153FA,2)   -- _UIPROMPT_DISABLE_PROMPT_TYPE_THIS_FRAME, disable "open\close drawer\clipboard\cabinet\etc" prompt types.
      Citizen.InvokeNative(0xFE99B66D079CF6BC, 0, 0xFF8109D8, true) -- search saddle bags
      
      
  end
end)

-- ---horse side attack
-- Citizen.CreateThread(function()
--     local wasOnMount = false
--     while true do
--         Citizen.Wait(0)
--         local ped = PlayerPedId()
--         local isOnMount = IsPedOnMount(ped)

--         -- Automatically activate when mounted
--         if isOnMount then
--             if not wasOnMount then
--                 -- Player just mounted, activate the feature
--                 SetPedConfigFlag(ped, 560, true)
--                 wasOnMount = true
--             end

--             -- Safety check: keep flag active while mounted
--             if not IsPedConfigFlagSet(ped, 560) then
--                 SetPedConfigFlag(ped, 560, true)
--             end
--         elseif wasOnMount then
--             -- Player dismounted, deactivate the feature
--             SetPedConfigFlag(ped, 560, false)
--             wasOnMount = false
--         end
--     end
-- end)

-- Citizen.CreateThread(function()
--     -- Add a delay to ensure game is fully loaded
--     Citizen.Wait(1000)
    
--     -- Start your mount detection thread
--     StartMountDetection()
-- end)

-- -- Separate function for the mount detection logic
-- function StartMountDetection()
--     local wasOnMount = false
    
--     Citizen.CreateThread(function()
--         while true do
--             Citizen.Wait(0)
--             local ped = PlayerPedId()
            
--             -- Check for errors
--             if not ped or ped == 0 then
--                 Citizen.Wait(1000) -- Wait longer if player isn't ready
--                 goto continue
--             end
            
--             local isOnMount = IsPedOnMount(ped)
            
--             -- Automatically activate when mounted
--             if isOnMount then
--                 if not wasOnMount then
--                     -- Player just mounted, activate the feature
--                     SetPedConfigFlag(ped, 560, true)
--                     SetPedConfigFlag(ped, 561, true) -- herbs
--                     wasOnMount = true
--                 end
                
--                 -- Safety check: keep flag active while mounted
--                 if not IsPedConfigFlagSet(ped, 560) then
--                     SetPedConfigFlag(ped, 560, true)
--                     SetPedConfigFlag(ped, 561, true) -- herbs
--                 end
--             elseif wasOnMount then
--                 -- Player dismounted, deactivate the feature
--                 SetPedConfigFlag(ped, 560, false)
--                 SetPedConfigFlag(ped, 561, false) -- herbs
--                 wasOnMount = false
--             end
            
--             ::continue::
--         end
--     end)
-- end

-- Register for game events that happen after restart
RegisterNetEvent('playerSpawned')
AddEventHandler('playerSpawned', function()
    -- This ensures the script runs when player spawns after restart
    StartMountDetection()
end)

---open map animation
local MenuOuvert = false

Citizen.CreateThread(function()
	while true do
		Wait(0)
		local playerPed = PlayerPedId()
		if IsAppActive(`MAP`) ~= 0 and not MenuOuvert then
			SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true) -- unarm player
			MenuOuvert = true
			SortirMap()
			Wait(2000)
			local player = PlayerPedId()
            local coords = GetEntityCoords(player) 
            local props = CreateObject(GetHashKey("mp001_mp_map01x"), coords.x, coords.y, coords.z, 1, 0, 1)
            prop = props
            SetEntityAsMissionEntity(prop,true,true)
            RequestAnimDict("mech_carry_box")
            while not HasAnimDictLoaded("mech_carry_box") do
            Citizen.Wait(100)
            end
            Citizen.InvokeNative(0xEA47FE3719165B94, player,"mech_carry_box", "idle", 1.0, 8.0, -1, 31, 0, 0, 0, 0)
            Citizen.InvokeNative(0x6B9BBD38AB0796DF, prop,player,GetEntityBoneIndexByName(player,"SKEL_L_Finger12"), 0.20, 0.00, -0.15, 0.0, 0.0, 90.0, true, true, false, true, 1, true)
		end
        if IsAppActive(`MAP`) ~= 1 and MenuOuvert then
		MenuOuvert = false
        RangerMap()
		ClearPedSecondaryTask(GetPlayerPed(PlayerId()))
     	DetachEntity(prop,false,true)
        ClearPedTasks(player)
        DeleteObject(prop)
		end
	end
end)

function SortirMap()
    local ped = PlayerPedId()
	animateMap("mech_inspection@two_fold_map@satchel", "enter")
end

function RangerMap()
    ClearPedTasks(PlayerPedId())
    RemoveAnimDict(dictar)
    local ped = PlayerPedId()
	animateMap(ped, "mech_inspection@two_fold_map@satchel", "exit_satchel")
end

RegisterCommand("testanim",function()
    animateMap("mech_inspection@newspaper@satchel", "enter")
end)

function animateMap(v1,v2)
    local dictar = v1
    local antar = v2
    if not DoesAnimDictExist(dictar) then
		print("Invalid animation dictionary: " .. dictar)
		return
	end
	RequestAnimDict(dictar)
	while not HasAnimDictLoaded(dictar) do
		Citizen.Wait(0)
	end
    TaskPlayAnim(PlayerPedId(), dictar, antar, -1.0, -0.5, -1   ,14, 0, true, 0, false, 0, false)
end


-- RegisterCommand("testmap", function(source, args, rawCommand)
--     local player = PlayerPedId()
--     local coords = GetEntityCoords(player)
    
--     -- Create the map prop
--     local props = CreateObject(GetHashKey("mp001_mp_map01x"), coords.x, coords.y, coords.z, 1, 0, 1)
--     prop = props
--     SetEntityAsMissionEntity(prop, true, true)
    
--     -- Request animation dictionary
--     RequestAnimDict("mech_inspection@mini_map@base")
--     while not HasAnimDictLoaded("mech_inspection@mini_map@base") do
--         Citizen.Wait(100)
--     end
    
--     -- Play animation
--     TaskPlayAnim(player, "mech_inspection@mini_map@base", "hold", 8.0, -8.0, -1, 25, 0, false, false, false)
    
--     -- Attach prop to player with your specified values
--     Citizen.InvokeNative(0x6B9BBD38AB0796DF, prop, player, GetEntityBoneIndexByName(player, "XH_L_Hand00"), -0.06, 0.12, 0.36, -10.0, -120.0, -40.0, true, true, false, true, 1, true)
    
--     print("Map animation started! Use /stopmap to stop it.")
-- end, false)

-- RegisterCommand("stopmap", function(source, args, rawCommand)
--     local player = PlayerPedId()
    
--     -- Clear animation and detach/delete prop
--     ClearPedSecondaryTask(player)
--     if prop then
--         DetachEntity(prop, false, true)
--         DeleteObject(prop)
--         prop = nil
--     end
--     ClearPedTasks(player)
    
--     print("Map animation stopped!")
-- end, false)

-- --disable weaponweehl
-- CreateThread(function()
--     while true do
--         Wait(0)
--         DisableControlAction(0, 'INPUT_OPEN_WHEEL_MENU', true)     -- TAB (weapon wheel)
--         --DisableControlAction(0, 'INPUT_TOGGLE_HOLSTER', true)      -- Quick holster (tap TAB)
--         --DisableControlAction(0, 'INPUT_TWIRL_PISTOL', true)        -- Pistol spin (double tap TAB)
--     end
-- end)

--autoaim
Citizen.CreateThread(function()
    while true do
        Wait(500)
        local player = PlayerId()
        if NetworkIsPlayerActive(player) then
            Citizen.InvokeNative(0x54F0DDBB6C7D1626, player, false) -- Disable auto-lock-on
            break
        end
    end
end)

-- Entity Safety Wrapper
-- Prevents invalid entity calls and logs the source

-- Wrap native calls safely
local _NetworkGetNetworkIdFromEntity = NetworkGetNetworkIdFromEntity
function NetworkGetNetworkIdFromEntity(entity)
    if not DoesEntityExist(entity) then
        print(('[EntitySafety] ^1WARNING: Invalid entity for NetworkGetNetworkIdFromEntity in resource: %s^7')
            :format(GetCurrentResourceName()))
        return 0
    end
    return _NetworkGetNetworkIdFromEntity(entity)
end

local _DeleteEntity = DeleteEntity
function DeleteEntity(entity)
    if DoesEntityExist(entity) then
        _DeleteEntity(entity)
    else
        print(('[EntitySafety] ^3Skipping DeleteEntity (invalid entity) from resource: %s^7')
            :format(GetCurrentResourceName()))
    end
end

local _SetEntityAsMissionEntity = SetEntityAsMissionEntity
function SetEntityAsMissionEntity(entity, p1, p2)
    if DoesEntityExist(entity) then
        _SetEntityAsMissionEntity(entity, p1, p2)
    else
        print(('[EntitySafety] ^3Skipping SetEntityAsMissionEntity (invalid entity) from resource: %s^7')
            :format(GetCurrentResourceName()))
    end
end

-- Optionally wrap other common entity functions
local _NetworkRegisterEntityAsNetworked = NetworkRegisterEntityAsNetworked
function NetworkRegisterEntityAsNetworked(entity)
    if DoesEntityExist(entity) then
        return _NetworkRegisterEntityAsNetworked(entity)
    else
        print(('[EntitySafety] ^3Skipping NetworkRegisterEntityAsNetworked (invalid entity) from resource: %s^7')
            :format(GetCurrentResourceName()))
    end
end
