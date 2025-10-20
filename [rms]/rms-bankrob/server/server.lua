local RSGCore = exports['rsg-core']:GetCoreObject()
local DropItems = {} 

-- Helper function to get random amount for item
local function GetRandomAmount(itemType)
    if Config.DropRewards[itemType] then
        return math.random(Config.DropRewards[itemType].min, Config.DropRewards[itemType].max)
    end
    return 1 -- Default amount if not found in config
end

-- Function to get all online players with law enforcement jobs
local function GetOnlineLawEnforcement(allowedJobs)
    local lawOfficers = {}
    local players = RSGCore.Functions.GetPlayers()
    
    for _, playerId in pairs(players) do
        local player = RSGCore.Functions.GetPlayer(playerId)
        if player and player.PlayerData.job then
            local jobName = player.PlayerData.job.name
            -- Check if player's job is in the allowed law jobs list
            for _, allowedJob in pairs(allowedJobs or {}) do
                if jobName == allowedJob then
                    table.insert(lawOfficers, {
                        playerId = playerId,
                        job = jobName,
                        coords = GetEntityCoords(GetPlayerPed(playerId))
                    })
                    break
                end
            end
        end
    end
    
    return lawOfficers
end

-- Function to get bank configuration by coordinates
local function GetBankByCoords(coords)
    if not Config.banks then return nil end
    
    for _, bank in pairs(Config.banks) do
        if bank.coords and bank.radius then
            local distance = #(vector3(coords.x, coords.y, coords.z) - bank.coords)
            if distance <= bank.radius then
                return bank
            end
        end
    end
    return nil
end

-- Function to check law enforcement requirements for a specific bank
local function CheckLawRequirements(bankCoords, src)
    -- Get the bank configuration
    local bank = GetBankByCoords(bankCoords)
    if not bank then
        return false, "Bank configuration not found"
    end
    
    -- Check if law enforcement checks are globally disabled
    if not Config.LawEnforcement or not Config.LawEnforcement.enabled then
        return true, "Law checks disabled globally"
    end
    
    -- Check if law enforcement checks are disabled for this specific bank
    if not bank.lawRequirements or not bank.lawRequirements.enabled then
        return true, "Law checks disabled for this bank"
    end
    
    -- Get online law enforcement officers
    local lawOfficers = GetOnlineLawEnforcement(bank.lawRequirements.allowedJobs)
    local requiredOfficers = bank.lawRequirements.minOfficers or Config.LawEnforcement.minOnlineOfficers or 1
    
    -- Check if enough officers are online
    if #lawOfficers < requiredOfficers then
        local message = bank.lawRequirements.blockMessage or 
                       string.format("This bank requires at least %d law enforcement officers online! (%d/%d online)", 
                                   requiredOfficers, #lawOfficers, requiredOfficers)
        return false, message
    end
    
    -- Optional: Check for nearby law enforcement (if checkRadius is specified)
    local checkRadius = bank.lawRequirements.checkRadius
    if checkRadius and checkRadius > 0 then
        local playerCoords = GetEntityCoords(GetPlayerPed(src))
        local nearbyOfficers = 0
        
        for _, officer in pairs(lawOfficers) do
            local distance = #(playerCoords - officer.coords)
            if distance <= checkRadius then
                nearbyOfficers = nearbyOfficers + 1
            end
        end
        
        -- For now, we'll just log nearby officers but not enforce proximity
        -- You can enable this check if you want to require nearby officers
        -- if nearbyOfficers < 1 then
        --     return false, "No law enforcement in the area!"
        -- end
    end
    
    return true, "Law requirements met"
end

-- Function to notify law enforcement about bank robbery
local function NotifyLawEnforcement(bankName, coords, allowedJobs)
    if not Config.LawEnforcement.notifyLawOnRobbery then
        return
    end
    
    local lawOfficers = GetOnlineLawEnforcement(allowedJobs)
    local message = string.format("BANK ROBBERY IN PROGRESS: %s", bankName)
    
    for _, officer in pairs(lawOfficers) do
        TriggerClientEvent('ox_lib:notify', officer.playerId, {
            title = 'URGENT: Bank Robbery',
            description = message,
            type = 'error',
            duration = 10000
        })
        
        -- Optional: Add blip or other alert mechanisms here
        TriggerClientEvent('rsg-bankrob:client:lawAlert', officer.playerId, {
            bankName = bankName,
            coords = coords,
            message = message
        })
    end
end

RegisterNetEvent('rsg-vault:server:giveRewards')
AddEventHandler('rsg-vault:server:giveRewards', function(rewards)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    
    if Player then
        Player.Functions.AddMoney('cash', rewards.cash)
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Robbery Successful',
            description = 'You got $' .. rewards.cash,
            type = 'success'
        })
        
        if rewards.diamonds then
            Player.Functions.AddItem('diamond_uncut', rewards.diamonds)
            TriggerClientEvent('ox_lib:notify', src, {
                title = 'Valuable Found',
                description = 'You found ' .. rewards.diamonds .. ' diamonds!',
                type = 'success'
            })
        end
    end
end)

RegisterNetEvent('mack-moneystash:server:CreateDrop')
AddEventHandler('mack-moneystash:server:CreateDrop', function(dropId, coords, propModel, item)
    local src = source
    local amount = GetRandomAmount(item)
    DropItems[dropId] = {
        item = item,
        amount = amount
    }
    TriggerClientEvent('mack-moneystash:client:CreateDropProp', src, dropId, coords, propModel)
end)

RegisterNetEvent('mack-moneystash:server:PickupDrop')
AddEventHandler('mack-moneystash:server:PickupDrop', function(dropId)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    
    if Player and DropItems[dropId] then
        local dropData = DropItems[dropId]
        local item = dropData.item
        local amount = dropData.amount
        
        Player.Functions.AddItem(item, amount)
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Item Picked Up',
            description = 'You picked up ' .. amount .. 'x ' .. item,
            type = 'success'
        })
        
        DropItems[dropId] = nil 
        TriggerClientEvent('mack-moneystash:client:RemoveDropProp', src, dropId)
    else
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Error',
            description = 'Invalid drop or already picked up!',
            type = 'error'
        })
    end
end)

-- New event to check law requirements before allowing robbery
RegisterNetEvent('rsg-bankrob:server:checkLawRequirements')
AddEventHandler('rsg-bankrob:server:checkLawRequirements', function(bankCoords, callbackEventName)
    local src = source
    local canRob, message = CheckLawRequirements(bankCoords, src)
    
    TriggerClientEvent(callbackEventName, src, canRob, message)
end)

-- Enhanced bank robbery start event with law enforcement checks
RegisterNetEvent('rsg-bankrob:server:startRobbery')
AddEventHandler('rsg-bankrob:server:startRobbery', function(bankName, bankCoords)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    
    if not Player then
        return
    end
    
    -- Check law enforcement requirements
    local canRob, message = CheckLawRequirements(bankCoords, src)
    
    if not canRob then
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Robbery Blocked',
            description = message,
            type = 'error',
            duration = 5000
        })
        return
    end
    
    -- If checks pass, notify law enforcement and proceed
    local bank = GetBankByCoords(bankCoords)
    if bank and bank.lawRequirements then
        NotifyLawEnforcement(bankName, bankCoords, bank.lawRequirements.allowedJobs)
    end
    
    -- Continue with normal robbery logic
    TriggerClientEvent('rsg-bankrob:client:proceedWithRobbery', src)
end)

RegisterNetEvent('ols-bankrob:server:unlockBankDoor', function(doorName)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    
    if not Player then
        return
    end
    
    exports.oxmysql:fetch('SELECT id FROM ox_doorlock WHERE name = ?', {doorName}, function(result)
        if not result or not result[1] then
            TriggerClientEvent('ox_lib:notify', src, {
                title = 'Error',
                description = 'Door configuration not found!',
                type = 'error'
            })
            return
        end
        
        local doorId = result[1].id
        
        TriggerEvent('ox_doorlock:setState', doorId, 0)
        
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Success',
            description = string.format('The %s has been blown open!', doorName),
            type = 'success'
        })
        
        TriggerClientEvent('ox_doorlock:client:refreshAll', -1)
    end)
end)

RSGCore.Functions.CreateUseableItem("dynamite", function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if Player.Functions.RemoveItem("dynamite", 1, item.slot) then
        TriggerClientEvent("rsg-bank:client:tntPlanted", src)
    else
        TriggerClientEvent("lib.notify", src, {title = 'Error', description = 'Failed to remove TNT', type = 'error'})
    end
end)

RegisterNetEvent('rsg-bank:server:removeTNT')
AddEventHandler('rsg-bank:server:removeTNT', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    
    if Player then
        if Player.Functions.RemoveItem("dynamite", 1) then
            TriggerClientEvent("lib.notify", src, {title = 'TNT Used', description = 'You placed TNT on the vault.', type = 'success'})
        else
            TriggerClientEvent("lib.notify", src, {title = 'Error', description = 'Failed to remove TNT', type = 'error'})
        end
    end
end)

RegisterNetEvent('rsg-bank:client:resetDoor')
AddEventHandler('rsg-bank:client:resetDoor', function(doorId)
    if doorId then
        explodedDoors[doorId] = nil
        lib.notify({
            title = 'Door Reset',
            description = 'Door has been reset by admin',
            type = 'success'
        })
    end
end)

RegisterNetEvent('rsg-bank:client:resetAllDoors')
AddEventHandler('rsg-bank:client:resetAllDoors', function()
    explodedDoors = {}
    lib.notify({
        title = 'All Doors Reset',
        description = 'All bank doors have been reset',
        type = 'success'
    })
end)

-- Command for admins to check current law enforcement status
RSGCore.Commands.Add('lawcheck', 'Check current law enforcement status', {}, false, function(source, args)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    
    if not Player then return end
    
    -- Check if player is admin (adjust this check based on your permission system)
    if Player.PlayerData.job.name ~= 'admin' and not RSGCore.Functions.HasPermission(src, 'admin') then
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Access Denied',
            description = 'You need admin permissions to use this command',
            type = 'error'
        })
        return
    end
    
    -- Display law enforcement status for each bank
    for _, bank in pairs(Config.banks) do
        if bank.lawRequirements and bank.lawRequirements.enabled then
            local lawOfficers = GetOnlineLawEnforcement(bank.lawRequirements.allowedJobs)
            local requiredOfficers = bank.lawRequirements.minOfficers or 1
            local status = #lawOfficers >= requiredOfficers and "✅ AVAILABLE" or "❌ BLOCKED"
            
            TriggerClientEvent('ox_lib:notify', src, {
                title = bank.name,
                description = string.format('%s - Officers: %d/%d', status, #lawOfficers, requiredOfficers),
                type = #lawOfficers >= requiredOfficers and 'success' or 'error',
                duration = 5000
            })
        else
            TriggerClientEvent('ox_lib:notify', src, {
                title = bank.name,
                description = '✅ ALWAYS AVAILABLE (No law requirements)',
                type = 'inform',
                duration = 5000
            })
        end
    end
end)