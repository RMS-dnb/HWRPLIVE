local RSGCore = exports['rsg-core']:GetCoreObject()
local explodedVaults = {}
local explodedDoors = {} 
local cooldownTimers = {}

--[[ local function HasTNT()
    local Player = RSGCore.Functions.GetPlayerData()
    if not Player or not Player.items then return false end
    for _, item in pairs(Player.items) do
        if item.name == "dynamite" and item.amount > 0 then
            return true
        end
    end
    return false
end
 ]]
local lastNotifyTime = 0
local NOTIFY_COOLDOWN = 5000 -- 5 seconds in milliseconds

local function HasTNT()
    local Player = RSGCore.Functions.GetPlayerData()
    if not Player or not Player.items then return false end

    local hasDynamite = false
    local hasDetonator = false

    for _, item in pairs(Player.items) do
        if item.name == "dynamite" and item.amount > 0 then
            hasDynamite = true
        elseif item.name == "detonator" and item.amount > 0 then
            hasDetonator = true
        end
    end

    if not hasDynamite or not hasDetonator then
        local currentTime = GetGameTimer()
        if currentTime - lastNotifyTime >= NOTIFY_COOLDOWN then
            if not hasDynamite and not hasDetonator then
                RSGCore.Functions.Notify("You are missing both DYNAMITE and a DETONATOR!", "error")
            elseif not hasDynamite then
                RSGCore.Functions.Notify("You are missing DYNAMITE!", "error")
            elseif not hasDetonator then
                RSGCore.Functions.Notify("You are missing a DETONATOR!", "error")
            end
            lastNotifyTime = currentTime
        end
        return false
    end

    return true
end

local function RemoveTNT()
    TriggerServerEvent('rsg-bank:server:removeTNT')
end

local function GetRandomOffset(coords, radius)
    local angle = math.random() * 2 * math.pi
    local r = radius * math.sqrt(math.random())
    local x = coords.x + r * math.cos(angle)
    local y = coords.y + r * math.sin(angle)
    return vector3(x, y, coords.z)
end

local function GetRandomHighTierItem()
    if not Config.Tiers or not Config.Tiers.High then
        return 'diamond_uncut'
    end
    local tier = Config.Tiers.High
    local items = {}
    for _, item in ipairs(tier.Weapons or {}) do table.insert(items, item) end
    for _, item in ipairs(tier.AmmoBoxes or {}) do table.insert(items, item) end
    for _, item in ipairs(tier.Items or {}) do table.insert(items, item) end
    if #items == 0 then return 'diamond_uncut' end
    return items[math.random(1, #items)]
end

-- Function to get bank configuration by player coordinates
local function GetCurrentBank()
    local playerCoords = GetEntityCoords(PlayerPedId())
    
    if not Config or not Config.banks then 
        print("DEBUG: Config or Config.banks is nil")
        return nil 
    end
    
    for _, bank in pairs(Config.banks) do
        if bank.coords and bank.radius then
            local distance = #(playerCoords - bank.coords)
            print(string.format("DEBUG: Bank: %s, Player: %s, Distance: %.2f, Radius: %.2f", 
                bank.name or "Unknown", 
                tostring(playerCoords), 
                distance, 
                bank.radius
            ))
            
            -- Increased radius check for vault interactions (vaults can be further from bank center)
            local checkRadius = bank.radius * 2.0  -- Double the radius for vault checks
            if distance <= checkRadius then
                print("DEBUG: Found bank: " .. (bank.name or "Unknown"))
                return bank
            end
        end
    end
    
    print("DEBUG: No bank found near player position")
    return nil
end

-- Alternative function to get bank by vault coordinates
local function GetBankByVaultCoords(vaultCoords)
    if not Config or not Config.banks then return nil end
    
    for _, bank in pairs(Config.banks) do
        if bank.vaults then
            for _, vault in pairs(bank.vaults) do
                if vault.coords then
                    local distance = #(vaultCoords - vault.coords)
                    if distance <= 5.0 then  -- If within 5 units of any vault
                        return bank
                    end
                end
            end
        end
    end
    return nil
end

-- Function to check law requirements before attempting robbery
local function CheckLawRequirementsForRobbery(callback, vaultCoords)
    local currentBank = nil
    
    -- Try to get bank by player position first
    currentBank = GetCurrentBank()
    
    -- If that fails and we have vault coordinates, try to get bank by vault position
    if not currentBank and vaultCoords then
        currentBank = GetBankByVaultCoords(vaultCoords)
        print("DEBUG: Trying to find bank by vault coords")
    end
    
    if not currentBank then
        print("DEBUG: Still no bank found, checking all banks...")
        -- Debug: Show all bank distances
        local playerCoords = GetEntityCoords(PlayerPedId())
        for i, bank in pairs(Config.banks) do
            if bank.coords then
                local distance = #(playerCoords - bank.coords)
                print(string.format("DEBUG: Bank %d (%s): Distance %.2f", i, bank.name or "Unknown", distance))
            end
        end
        
        callback(false, "You are not near any bank!")
        return
    end
    
    print("DEBUG: Using bank: " .. (currentBank.name or "Unknown"))
    
    -- Check if this bank has law requirements
    if not currentBank.lawRequirements or not currentBank.lawRequirements.enabled then
        callback(true, "No law enforcement requirements for this location")
        return
    end
    
    -- Request law check from server
    TriggerServerEvent('rsg-bankrob:server:checkLawRequirements', currentBank.coords, 'rsg-bankrob:client:lawCheckResult')
    
    -- Store callback for when server responds
    lawCheckCallback = callback
end

-- Handle law check response from server
RegisterNetEvent('rsg-bankrob:client:lawCheckResult')
AddEventHandler('rsg-bankrob:client:lawCheckResult', function(canRob, message)
    if lawCheckCallback then
        lawCheckCallback(canRob, message)
        lawCheckCallback = nil
    end
end)

-- Handle law enforcement alert
RegisterNetEvent('rsg-bankrob:client:lawAlert')
AddEventHandler('rsg-bankrob:client:lawAlert', function(data)
    -- Create blip for law enforcement
    local blip = BlipAddForCoords(1664425300, data.coords.x, data.coords.y, data.coords.z)
    SetBlipSprite(blip, `blip_radius_search`, true)
    BlipAddModifier(blip, `BLIP_MODIFIER_MP_COLOR_2`)
    
    -- Remove blip after 5 minutes
    SetTimeout(300000, function()
        if BlipIsValid(blip) then
            RemoveBlip(blip)
        end
    end)
    
    -- Play alert sound (optional)
    PlaySoundFrontend("CHECKPOINT_PERFECT", "HUD_MINI_GAME_SOUNDSET", true, 1)
end)

-- Handle proceeding with robbery after law checks pass
RegisterNetEvent('rsg-bankrob:client:proceedWithRobbery')
AddEventHandler('rsg-bankrob:client:proceedWithRobbery', function()
    -- lib.notify({
    --     title = 'Robbery Started',
    --     description = 'Law enforcement has been alerted!',
    --     type = 'warning',
    --     duration = 5000
    -- })
end)

local function GetBankDoorById(doorId)
    if not Config or not Config.BankDoors then return nil end
    for _, door in pairs(Config.BankDoors) do
        if door.id == doorId then
            return door
        end
    end
    return nil
end

local function IsBankDoorOnCooldown(doorId)
    local lastExplosion = explodedDoors[doorId]
    local door = GetBankDoorById(doorId)
    if lastExplosion and door then
        local timePassed = GetGameTimer() - lastExplosion
        return timePassed < (door.timeout or 1200000)
    end
    return false
end

local function GetBankDoorCooldownRemaining(doorId)
    local lastExplosion = explodedDoors[doorId]
    local door = GetBankDoorById(doorId)
    if lastExplosion and door then
        local timePassed = GetGameTimer() - lastExplosion
        local remaining = (door.timeout or 1200000) - timePassed
        if remaining > 0 then
            local minutes = math.floor(remaining / 60000)
            local seconds = math.floor((remaining % 60000) / 1000)
            return string.format('%02d:%02d', minutes, seconds)
        end
    end
    return nil
end

local function CleanupExpiredDoors()
    local currentTime = GetGameTimer()
    
    for doorId, explosionTime in pairs(explodedDoors) do
        local door = GetBankDoorById(doorId)
        if door then
            local timePassed = currentTime - explosionTime
            local timeout = door.timeout or 1200000 
            
            if timePassed >= timeout then
                explodedDoors[doorId] = nil
                
                lib.notify({
                    title = 'Door Reset',
                    description = 'The ' .. (door.label or 'door') .. ' can be blown up again!',
                    type = 'info',
                    duration = 3000
                })
            end
        end
    end
end

local function ExplodeBankDoor(doorId, explosionCoords)
    local door = GetBankDoorById(doorId)
    if not door then return end
    
    SetTimeout((Config.DoorExplosionSettings and Config.DoorExplosionSettings.delay) or 8000, function()
        AddExplosion(
            explosionCoords.x, 
            explosionCoords.y, 
            explosionCoords.z, 
            (Config.explosion and Config.explosion.door and Config.explosion.door.type) or 25, 
            (Config.explosion and Config.explosion.door and Config.explosion.door.radius) or 15.0, 
            true, 
            true, 
            (Config.explosion and Config.explosion.door and Config.explosion.door.shake) or 1.5
        )
        
        explodedDoors[doorId] = GetGameTimer()
        TriggerServerEvent('ols-bankrob:server:unlockBankDoor', door.doorlock_name)
        
        lib.notify({
            title = 'Door Destroyed!',
            description = (Config.DoorExplosionSettings and Config.DoorExplosionSettings.notify_success) or 'The door has been blown open!',
            type = 'success',
            duration = 4000
        })
    end)
end

local function AttemptPlantTNTOnBankDoor(doorId)
    -- First check law requirements
    CheckLawRequirementsForRobbery(function(canRob, message)
        if not canRob then
            lib.notify({
                title = 'Robbery Blocked',
                description = message,
                type = 'error',
                duration = 5000
            })
            return
        end

        -- Proceed with TNT planting if law requirements are met
        local door = GetBankDoorById(doorId)
        if not door then
            lib.notify({
                title = 'Error',
                description = 'Door configuration not found!',
                type = 'error'
            })
            return
        end

        local ped = PlayerPedId()
        local playerCoords = GetEntityCoords(ped)

        if #(playerCoords - door.coords) > (door.interact_distance or 2.5) then
            lib.notify({
                title = 'Too Far!',
                description = 'You need to be closer to the door!',
                type = 'error'
            })
            return
        end

        if IsBankDoorOnCooldown(doorId) then
            local remaining = GetBankDoorCooldownRemaining(doorId)
            lib.notify({
                title = 'On Cooldown',
                description = remaining and ('Wait %s before trying again!'):format(remaining) or 'This door is on cooldown!',
                type = 'error',
                duration = 4000
            })
            return
        end

        if explodedDoors[doorId] then
            lib.notify({
                title = 'Already Destroyed',
                description = 'This door has already been blown open!',
                type = 'error',
                duration = 6000
            })
            return
        end

        if not HasTNT() then
            lib.notify({
                title = 'No TNT',
                description = "You don't have any TNT!",
                type = 'error',
                duration = 6000
            })
            return
        end

        -- Load animation dictionary before using it
        local animDict = (Config.animations and Config.animations.plantingTNT and Config.animations.plantingTNT.dict) or "amb_work@world_human_crouch_inspect@male_c@idle_c"
        RequestAnimDict(animDict)
        while not HasAnimDictLoaded(animDict) do
            Wait(100)
        end

        -- send criminal activity tip when planting starts
        TriggerServerEvent('rsg-tips:server:addCriminalActivity', "Suspicious activity at Bank!", nil, GetEntityCoords(PlayerPedId()))

        if lib.progressBar({
            duration = (Config.DoorInteraction and Config.DoorInteraction.plant_tnt_duration) or 5000,
            label = 'Planting TNT on door...',
            useWhileDead = false,
            canCancel = true,
            disable = {
                move = true,
                car = true,
                combat = true
            },
            anim = {
                dict = animDict,
                clip = (Config.animations and Config.animations.plantingTNT and Config.animations.plantingTNT.clip) or "idle_h",
                flag = (Config.animations and Config.animations.plantingTNT and Config.animations.plantingTNT.flag) or 1
            }
        }) then
            RemoveTNT()

            lib.notify({
                title = 'TNT Planted!',
                description = (Config.DoorExplosionSettings and Config.DoorExplosionSettings.notify_planting) or 'TNT Planted - Run for cover!',
                type = 'warning',
                duration = 6000
            })

            -- Notify law enforcement and server
            local currentBank = GetCurrentBank()
            if currentBank then
                TriggerServerEvent('rsg-bankrob:server:startRobbery', currentBank.name, currentBank.coords)
            end

            ExplodeBankDoor(doorId, door.explosion_coords)
        else
            lib.notify({
                title = 'Cancelled',
                description = 'TNT planting was interrupted.',
                type = 'error'
            })
        end
    end)
end


local function CreateBankDoorTargets()
    if not Config or not Config.BankDoors then return end
    
    for _, door in pairs(Config.BankDoors) do
        if door.model and door.id and door.doorlock_name then
            exports.ox_target:addModel(door.model, {
                {
                    name = 'plant_tnt_bankdoor_' .. door.id,
                    label = 'Plant TNT on ' .. (door.label or 'Door'),
                    icon = 'fas fa-bomb',
                    distance = door.interact_distance or 2.5,
                    canInteract = function(entity)
                        local ped = PlayerPedId()
                        local playerCoords = GetEntityCoords(ped)
                        
                        if #(playerCoords - door.coords) > (door.interact_distance or 2.5) then
                            return false
                        end
                        
                        if not HasTNT() then
                            return false
                        end
                        
                        if IsBankDoorOnCooldown(door.id) then
                            return false
                        end
                        
                        return true
                    end,
                    onSelect = function(data)
                        AttemptPlantTNTOnBankDoor(door.id)
                    end
                }
            })
        end
    end
end

Citizen.CreateThread(function()
    while true do
        CleanupExpiredDoors()
        Wait(60000) 
    end
end)

local function ExplodeVault(vaultId, vaultCoords)
    SetTimeout(10000, function()
        AddExplosion(vaultCoords.x, vaultCoords.y, vaultCoords.z, Config.explosion.vault.type, Config.explosion.vault.radius, true, true, Config.explosion.vault.shake)
        explodedVaults[vaultId] = true
        Wait(1000)
        
        local spawnAmount = 10 
        for i = 1, spawnAmount do
            local dropId = "vault_drop_" .. vaultId .. "_" .. tostring(GetGameTimer()) .. "_" .. i
            local dropCoords = GetRandomOffset(vaultCoords, 2.5) 
            local item = GetRandomHighTierItem()
            local propModel = Config.PropMapping[item] or 'p_ammobox01x'
            TriggerServerEvent('mack-moneystash:server:CreateDrop', dropId, dropCoords, propModel, item)
        end
    end)
end

local function ExplodeDoor(doorId, doorCoords)
    SetTimeout(8000, function()
        AddExplosion(doorCoords.x, doorCoords.y, doorCoords.z, Config.explosion.door.type, Config.explosion.door.radius, true, true, Config.explosion.door.shake)
        explodedDoors[doorId] = true
    end)
end

local function GetVaultById(vaultId)
    if not Config or not Config.banks then return nil end
    for _, bank in pairs(Config.banks) do
        if bank.vaults then
            for _, vault in pairs(bank.vaults) do
                if vault.id == vaultId then
                    return vault
                end
            end
        end
    end
    return nil
end

local function IsVaultOnCooldown(id)
    local lastRobbery = cooldownTimers[id]
    local vault = GetVaultById(id)
    if lastRobbery and vault then
        local timePassed = GetGameTimer() - lastRobbery
        return timePassed < vault.timeout
    end
    return false
end

local function SetVaultCooldown(id)
    cooldownTimers[id] = GetGameTimer()
end

-- Enhanced vault TNT planting with law checks
local function AttemptPlantTNTOnVault(vaultId, vaultCoords)
    -- Send criminal activity tip first  
    TriggerServerEvent('rsg-tips:server:addCriminalActivity', "Explosion at Bank!", nil, GetEntityCoords(PlayerPedId()))
    
    CheckLawRequirementsForRobbery(function(canRob, message)
        if not canRob then
            lib.notify({
                title = 'Robbery Blocked',
                description = message,
                type = 'error',
                duration = 5000
            })
            return
        end
        
        if not HasTNT() then
            lib.notify({title = 'No TNT', description = 'You dont have any TNT!', type = 'error'})
            return
        end
        
        -- Load animation dictionary before using it
        local animDict = (Config.animations and Config.animations.plantingTNT and Config.animations.plantingTNT.dict) or "amb_work@world_human_crouch_inspect@male_c@idle_c"
        RequestAnimDict(animDict)
        while not HasAnimDictLoaded(animDict) do
            Wait(100)
        end
        
        if lib.progressBar({
            duration = 75000,
            label = 'Planting TNT...',
            useWhileDead = false,
            canCancel = false,
            disable = {move = true, car = true, combat = true},
            anim = {
                dict = animDict,
                clip = (Config.animations and Config.animations.plantingTNT and Config.animations.plantingTNT.clip) or "idle_h",
                flag = (Config.animations and Config.animations.plantingTNT and Config.animations.plantingTNT.flag) or 1
            }
        }) then
            RemoveTNT()
            lib.notify({title = 'TNT Planted', description = 'Run for cover!', type = 'success'})
            
            SetVaultCooldown(vaultId)
            
            -- Notify law enforcement and server
            local currentBank = GetCurrentBank()
            if not currentBank then
                currentBank = GetBankByVaultCoords(vaultCoords)
            end
            
            if currentBank then
                TriggerServerEvent('rsg-bankrob:server:startRobbery', currentBank.name, currentBank.coords)
            end
            
            ExplodeVault(vaultId, vaultCoords)
        else
            lib.notify({title = 'Failed', description = 'TNT planting was interrupted.', type = 'error'})
        end
    end, vaultCoords)  -- Pass vault coordinates to the function
end

Citizen.CreateThread(function()
    Wait(2000)
    CreateBankDoorTargets()
    
    if Config and Config.banks then
        for _, bank in pairs(Config.banks) do
            if bank.vaults then
                for _, vault in pairs(bank.vaults) do
                    if vault.model then
                        exports.ox_target:addModel(vault.model, {
                            {
                                name = 'plant_tnt_' .. vault.id,
                                label = 'Plant TNT on ' .. vault.label,
                                icon = 'fas fa-bomb',
                                canInteract = function(entity)
                                    local ped = PlayerPedId()
                                    local playerCoords = GetEntityCoords(ped)
                                    if #(playerCoords - vault.coords) > 5.0 then
                                        return false
                                    end
                                    if IsVaultOnCooldown(vault.id) then
                                        return false
                                    end
                                    return not (explodedVaults[vault.id] or false)
                                end,
                                onSelect = function(data)
                                    AttemptPlantTNTOnVault(vault.id, vault.coords)
                                end
                            }
                        })
                    end
                end
            end
            
            if bank.doors then
                for _, door in pairs(bank.doors) do
                    if door.model then
                        exports.ox_target:addModel(door.model, {
                            {
                                name = 'plant_tnt_door_' .. door.id,
                                label = 'Plant TNT on ' .. door.label,
                                icon = 'fas fa-bomb',
                                canInteract = function(entity)
                                    local ped = PlayerPedId()
                                    local playerCoords = GetEntityCoords(ped)
                                    if #(playerCoords - door.coords) > 5.0 then
                                        return false
                                    end
                                    if IsVaultOnCooldown(door.id) then
                                        lib.notify({title = 'Door Locked', description = 'This door is on cooldown!', type = 'error'})
                                        return false
                                    end
                                    return not (explodedDoors[door.id] or false)
                                end,
                                onSelect = function(data)
                                    -- Send criminal activity tip first
                                    TriggerServerEvent('rsg-tips:server:addCriminalActivity', "Suspicious activity at Bank!", nil, GetEntityCoords(PlayerPedId()))
                                    
                                    CheckLawRequirementsForRobbery(function(canRob, message)
                                        if not canRob then
                                            lib.notify({
                                                title = 'Robbery Blocked',
                                                description = message,
                                                type = 'error',
                                                duration = 5000
                                            })
                                            return
                                        end
                                        
                                        if not HasTNT() then
                                            lib.notify({title = 'No TNT', description = 'You dont have any TNT!', type = 'error'})
                                            return
                                        end
                                        
                                        -- Load animation dictionary before using it
                                        local animDict = (Config.animations and Config.animations.plantingTNT and Config.animations.plantingTNT.dict) or "amb_work@world_human_crouch_inspect@male_c@idle_c"
                                        RequestAnimDict(animDict)
                                        while not HasAnimDictLoaded(animDict) do
                                            Wait(100)
                                        end
                                        
                                        if lib.progressBar({
                                            duration = 150000,
                                            label = 'Planting TNT...',
                                            useWhileDead = false,
                                            canCancel = false,
                                            disable = {move = true, car = true, combat = true},
                                            anim = {
                                                dict = animDict,
                                                clip = (Config.animations and Config.animations.plantingTNT and Config.animations.plantingTNT.clip) or "idle_h",
                                                flag = (Config.animations and Config.animations.plantingTNT and Config.animations.plantingTNT.flag) or 1
                                            }
                                        }) then
                                            RemoveTNT()
                                            lib.notify({title = 'TNT Planted', description = 'Run for cover!', type = 'success'})
                                            SetVaultCooldown(door.id)
                                            
                                            -- Notify law enforcement
                                            local currentBank = GetCurrentBank()
                                            if currentBank then
                                                TriggerServerEvent('rsg-bankrob:server:startRobbery', currentBank.name, currentBank.coords)
                                            end
                                            
                                            ExplodeDoor(door.id, door.coords)
                                        else
                                            lib.notify({title = 'Failed', description = 'TNT planting was interrupted.', type = 'error'})
                                        end
                                    end)
                                end
                            }
                        })
                    end
                end
            end
        end
    end
end)