local RSGCore = exports['rsg-core']:GetCoreObject()
lib.locale()

-----------------------
-- use bandage
-----------------------
-- RSGCore.Functions.CreateUseableItem('bandage', function(source, item)
--     local src = source
--     TriggerClientEvent('rsg-medic:client:usebandage', src, item.name)
-- end)

---------------------------------
-- medic storage
---------------------------------
RegisterNetEvent('rsg-medic:server:openstash', function(location)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    local data = { label = locale('sv_medical_storage'), maxweight = Config.StorageMaxWeight, slots = Config.StorageMaxSlots }
    local stashName = 'medic_' .. location
    exports['rsg-inventory']:OpenInventory(src, stashName, data)
end)

----------------------------------
-- Admin Revive Player
----------------------------------
----------------------------------
-- Admin Revive Player
----------------------------------
RSGCore.Commands.Add('revive', locale('sv_revive'), {{name = 'id', help = locale('sv_revive_2')}}, false, function(source, args)
    local src = source
    local target = args[1] and tonumber(args[1]) or src

    local Player = RSGCore.Functions.GetPlayer(target)
    if not Player then
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_no_online'), type = 'error', duration = 7000 })
        return
    end

    -- Ensure the correct player gets revived
    TriggerClientEvent("fx-hud:client:ForceHeal", Player.PlayerData.source)
    TriggerClientEvent("RMS_Poison:UseAntidote", Player.PlayerData.source)
    Wait (5000)  

    -- Also trigger the admin revive event if needed
    TriggerClientEvent('rsg-medic:client:adminRevive', Player.PlayerData.source)
end, 'admin')


-- Admin Kill Player
RSGCore.Commands.Add('kill', locale('sv_kill'), {{name = 'id', help = locale('sv_kill_id')}}, true, function(source, args)
    local src = source
    local target = tonumber(args[1])

    local Player = RSGCore.Functions.GetPlayer(target)
    if not Player then
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_no_online'), type = 'error', duration = 7000 })
        return
    end

    TriggerClientEvent('rsg-medic:client:KillPlayer', Player.PlayerData.source)
end, 'admin')

RSGCore.Commands.Add('heal', locale('sv_heal'), {{name = 'id', help = locale('sv_heal_2')}}, false, function(source, args)
    local src = source
    local target = args[1] and tonumber(args[1]) or src

    local Player = RSGCore.Functions.GetPlayer(target)
    if not Player then
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_no_online'), type = 'error', duration = 7000 })
        return
    end

    -- Ensure the correct player gets healed
    TriggerClientEvent("fx-hud:client:ForceHeal", Player.PlayerData.source)
    TriggerClientEvent("RMS_Poison:UseAntidote", Player.PlayerData.source)
    Wait (5000) 

    -- Also trigger the admin heal event if needed
    TriggerClientEvent('rsg-medic:client:adminHeal', Player.PlayerData.source)
end, 'admin')

RSGCore.Commands.Add('spawnheal', locale('sv_heal'), {{name = 'id', help = locale('sv_heal_2')}}, false, function(source, args)
    local src = source
    local target = args[1] and tonumber(args[1]) or src

    local Player = RSGCore.Functions.GetPlayer(target)
    if not Player then
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_no_online'), type = 'error', duration = 7000 })
        return
    end

    -- Ensure the correct player gets healed
    TriggerClientEvent("fx-hud:client:ForceHeal", Player.PlayerData.source)
    
    Wait (5000) 

    -- Also trigger the admin heal event if needed
    --TriggerClientEvent('rsg-medic:client:adminHeal', Player.PlayerData.source)
end, 'admin')


----------------------
-- EVENTS 
-----------------------
-- Death Actions: Remove Inventory / Cash
RegisterNetEvent('rsg-medic:server:deathactions', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)

    if Config.WipeInventoryOnRespawn then
        Player.Functions.ClearInventory()
        MySQL.Async.execute('UPDATE players SET inventory = ? WHERE citizenid = ?', { json.encode({}), Player.PlayerData.citizenid })
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lost_all'), type = 'info', duration = 7000 })
    end

    if Config.WipeCashOnRespawn then
        Player.Functions.SetMoney('cash', 0)
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lost_cash'), type = 'info', duration = 7000 })
    end
    if Config.WipeBloodmoneyOnRespawn then
        Player.Functions.SetMoney('bloodmoney', 0)
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lost_bloodmoney'), type = 'info', duration = 7000 })
    end
end)

-- Get Players Health
RSGCore.Functions.CreateCallback('rsg-medic:server:getplayerhealth', function(source, cb)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local health = Player.PlayerData.metadata['health']
    cb(health)
end)

-- Set Player Health
RegisterNetEvent('rsg-medic:server:SetHealth', function(amount)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)

    if not Player then return end

    amount = tonumber(amount)

    if amount > Config.MaxHealth then
        amount = Config.MaxHealth
    end

    Player.Functions.SetMetaData('health', amount)
end)

-- -- Medic Revive Player
-- RegisterNetEvent('rsg-medic:server:RevivePlayer', function(playerId)
--     local src = source
--     local Player = RSGCore.Functions.GetPlayer(src)
--     local Patient = RSGCore.Functions.GetPlayer(playerId)

--     if not Patient then return end

--     if Player.PlayerData.job.name ~= Config.JobRequired then
--         TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_not_medic'), type = 'error', duration = 7000 })
--         return
--     end

--     --if Player.Functions.RemoveItem('firstaid', 1) then
--         --TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items['firstaid'], 'remove')
--         TriggerClientEvent('rsg-medic:client:playerRevive', Patient.PlayerData.source)
--     --end
-- end)

-- Medic Revive Player
RegisterNetEvent('rsg-medic:server:RevivePlayer', function(playerId)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local Patient = RSGCore.Functions.GetPlayer(playerId)

    if not Patient then return end

    --if Player.Functions.RemoveItem('firstaid', 1) then
        --TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items['firstaid'], 'remove')
        TriggerClientEvent('rsg-medic:client:playerRevive', Patient.PlayerData.source)
    --end
end)

-- Useable items (firstaid, tonic, wildtonic)
RSGCore.Functions.CreateUseableItem('firstaid', function(source, item)
    -- Trigger the client to use the first aid item
    TriggerClientEvent('rsg-medic:client:useFirstAid', source)

    -- Remove the first aid item from the player after use
    local Player = RSGCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem('firstaid', 1) then
        TriggerClientEvent('rsg-inventory:client:ItemBox', source, RSGCore.Shared.Items['firstaid'], 'remove')
    end
end)

RSGCore.Functions.CreateUseableItem('tonic', function(source, item)
    -- Trigger the client to use the tonic item
    TriggerClientEvent('rsg-medic:client:useFirstAid2', source)

    -- Remove the tonic item from the player after use
    local Player = RSGCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem('tonic', 1) then
        TriggerClientEvent('rsg-inventory:client:ItemBox', source, RSGCore.Shared.Items['tonic'], 'remove')
    end
end)

RSGCore.Functions.CreateUseableItem('wildtonic', function(source, item)
    -- Trigger the client to use the wildtonic item
    TriggerClientEvent('rsg-medic:client:useFirstAid2', source)

    -- Remove the wildtonic item from the player after use
    local Player = RSGCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem('wildtonic', 1) then
        TriggerClientEvent('rsg-inventory:client:ItemBox', source, RSGCore.Shared.Items['wildtonic'], 'remove')
    end
end)

-- Medic Revive Player
RegisterNetEvent('rsg-medic:server:RevivePlayer', function(playerId)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local Patient = RSGCore.Functions.GetPlayer(playerId)

    if not Patient then return end

    --if Player.Functions.RemoveItem('firstaid', 1) then
        --TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items['firstaid'], 'remove')
        TriggerClientEvent('rsg-medic:client:playerRevive', Patient.PlayerData.source)
    --end
end)

-- -- Doctor Bag Useable Item
-- RSGCore.Functions.CreateUseableItem('doctorbag', function(source)
--     local src = source
--     local Player = RSGCore.Functions.GetPlayer(src)
--     local item = Player.Functions.GetItemByName('doctorbag')

--     if Player.PlayerData.job.name ~= 'medic' then
--         TriggerClientEvent('ox_lib:notify', src, {title = 'You are not a doctor', type = 'error', duration = 7000 })
--         return
--     end
    
--     if item then
--         -- Check if item has metadata for tracking remaining uses
--         local remainingUses = 10
--         if item.info then
--             remainingUses = item.info.remainingUses or 10
--         else
--             item.info = {}
--         end
        
--         -- Decrement remaining uses
--         remainingUses = remainingUses - 1
        
--         if remainingUses <= 0 then
--             -- Remove item if no uses remain
--             if Player.Functions.RemoveItem('doctorbag', 1, item.slot) then
--                 --TriggerClientEvent('rsg-medic:client:useTonic', src)
--                 TriggerClientEvent('rsg-medic:client:useFirstAid', source)
--                 TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items['doctorbag'], 'remove')
--                 TriggerClientEvent('RSGCore:Notify', src, 'You used the last doctorbag.', 'primary')
--             end
--         else
--             -- Remove the original item
--             Player.Functions.RemoveItem('doctorbag', 1, item.slot)
            
--             -- Add the item back with updated metadata
--             item.info.remainingUses = remainingUses
--             Player.Functions.AddItem('doctorbag', 1, item.slot, item.info)
            
--             -- Trigger the tonic effect
--             --TriggerClientEvent('rsg-medic:client:useTonic', src)
--             TriggerClientEvent('rsg-medic:client:useFirstAid', source)
            
--             -- Notify player about remaining uses
--             TriggerClientEvent('RSGCore:Notify', src, 'Doctorbag used. ' .. remainingUses .. ' uses remaining.', 'primary')
--         end
--     end
-- end)

-- Medic Revive Player
RegisterNetEvent('rsg-medic:server:RevivePlayer', function(playerId)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local Patient = RSGCore.Functions.GetPlayer(playerId)

    if not Patient then return end

    --if Player.Functions.RemoveItem('firstaid', 1) then
        --TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items['firstaid'], 'remove')
        TriggerClientEvent('rsg-medic:client:playerRevive', Patient.PlayerData.source)
    --end
end)

lib.callback.register('rsg-medic:server:caninteract', function(source, job)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local playerJob = Player.PlayerData.job.name

    if job == playerJob then
        return true
    end

    return false
end)

-- Doctor Bag Useable Item
RSGCore.Functions.CreateUseableItem('doctorbag', function(source)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local item = Player.Functions.GetItemByName('doctorbag')

    if Player.PlayerData.job.type ~= 'medic' and Player.PlayerData.job.type ~= 'privatedoctor' then
        TriggerClientEvent('ox_lib:notify', src, {title = 'You are not a doctor', type = 'error', duration = 7000 })
        return
    end

    
    if item then
        -- Check if item has metadata for tracking remaining uses
        local remainingUses = 10
        if item.info then
            remainingUses = item.info.remainingUses or 10
        else
            item.info = {}
        end
        
        -- Decrement remaining uses
        remainingUses = remainingUses - 1
        
        if remainingUses <= 0 then
            -- Remove item if no uses remain
            if Player.Functions.RemoveItem('doctorbag', 1, item.slot) then
                --TriggerClientEvent('rsg-medic:client:useTonic', src)
                TriggerClientEvent('rsg-medic:client:useFirstAid', source)
                TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items['doctorbag'], 'remove')
                TriggerClientEvent('RSGCore:Notify', src, 'You used the last doctorbag.', 'primary')
            end
        else
            -- Remove the original item
            Player.Functions.RemoveItem('doctorbag', 1, item.slot)
            
            -- Add the item back with updated metadata
            item.info.remainingUses = remainingUses
            Player.Functions.AddItem('doctorbag', 1, item.slot, item.info)
            
            -- Trigger the tonic effect
            --TriggerClientEvent('rsg-medic:client:useTonic', src)
            TriggerClientEvent('rsg-medic:client:useFirstAid', source)
            
            -- Notify player about remaining uses
            TriggerClientEvent('RSGCore:Notify', src, 'Doctorbag used. ' .. remainingUses .. ' uses remaining.', 'primary')
        end
    end
end)

-- Improvised Doctor Bag Useable Item
RSGCore.Functions.CreateUseableItem('improviseddoctorbag', function(source)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local item = Player.Functions.GetItemByName('improviseddoctorbag')

    if Player.PlayerData.job.type ~= 'wilddoctor' then
        TriggerClientEvent('ox_lib:notify', src, {title = 'You are not a wild doctor', type = 'error', duration = 7000 })
        return
    end
    
    if item then
        -- Check if item has metadata for tracking remaining uses
        local remainingUses = 10
        if item.info then
            remainingUses = item.info.remainingUses or 10
        else
            item.info = {}
        end
        
        -- Decrement remaining uses
        remainingUses = remainingUses - 1
        
        if remainingUses <= 0 then
            -- Remove item if no uses remain
            if Player.Functions.RemoveItem('improviseddoctorbag', 1, item.slot) then
                --TriggerClientEvent('rsg-medic:client:useTonic', src)
                TriggerClientEvent('rsg-medic:client:useFirstAid', source)
                TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items['improviseddoctorbag'], 'remove')
                TriggerClientEvent('RSGCore:Notify', src, 'You used the last improvised doctorbag.', 'primary')
            end
        else
            -- Remove the original item
            Player.Functions.RemoveItem('improviseddoctorbag', 1, item.slot)
            
            -- Add the item back with updated metadata
            item.info.remainingUses = remainingUses
            Player.Functions.AddItem('improviseddoctorbag', 1, item.slot, item.info)
            
            -- Trigger the tonic effect
            --TriggerClientEvent('rsg-medic:client:useTonic', src)
            TriggerClientEvent('rsg-medic:client:useFirstAid', source)
            
            -- Notify player about remaining uses
            TriggerClientEvent('RSGCore:Notify', src, 'Improvised doctorbag used. ' .. remainingUses .. ' uses remaining.', 'primary')
        end
    end
end)


RegisterNetEvent('rsg-medic:server:TreatWounds', function(playerId)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local Patient = RSGCore.Functions.GetPlayer(playerId)

    if not Patient then return end

    if Player.PlayerData.job.type ~= 'medic' and Player.PlayerData.job.type ~= 'privatedoctor' and Player.PlayerData.job.type ~= 'wilddoctor'  then
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_not_medic'), type = 'error', duration = 7000 })
        return
    end

    if Player.Functions.RemoveItem('bandage', 1) then
        TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items['bandage'], 'remove')
        TriggerClientEvent('rsg-medic:client:HealInjuries', Patient.PlayerData.source, 'full')
    end
end)

-- -- Medic Alert
-- RegisterNetEvent('rsg-medic:server:medicAlert', function(text)
--     local src = source
--     local ped = GetPlayerPed(src)
--     local coords = GetEntityCoords(ped)
--     local players = RSGCore.Functions.GetRSGPlayers()

--     for _, v in pairs(players) do
--         if v.PlayerData.job.type == 'medic' or v.PlayerData.job.type == 'wilddoctor' then
--             TriggerClientEvent('rsg-medic:client:medicAlert', v.PlayerData.source, coords, text)
--         end
--     end
-- end)
-- Extra Safe Medic Alert - Multiple safety checks
RegisterNetEvent('rsg-medic:server:medicAlert', function(text)
    local src = source
    local ped = GetPlayerPed(src)
    local coords = GetEntityCoords(ped)
    local players = RSGCore.Functions.GetRSGPlayers()

    for _, v in pairs(players) do
        -- Multiple safety checks
        if v and v.PlayerData and v.PlayerData.job and v.PlayerData.source and
           (v.PlayerData.job.type == 'medic' or v.PlayerData.job.type == 'wilddoctor') and 
           v.PlayerData.job.onduty == true and
           GetPlayerPing(v.PlayerData.source) > 0 then -- Extra check to ensure player is actually connected
            
            TriggerClientEvent('rsg-medic:client:medicAlert', v.PlayerData.source, coords, text)
        end
    end
end)

--------------------------
-- Medics On-Duty Callback
-------------------------
RSGCore.Functions.CreateCallback('rsg-medic:server:getmedics', function(source, cb)
    local amount = 0
    local players = RSGCore.Functions.GetRSGPlayers()
    for k, v in pairs(players) do
        if v.PlayerData.job.type == 'wilddoctor' and v.PlayerData.job.onduty or v.PlayerData.job.type == 'medic' and v.PlayerData.job.onduty  then
            amount = amount + 1
        end
    end
    cb(amount)
end)

---------------------------------
-- remove item
---------------------------------
RegisterServerEvent('rsg-medic:server:removeitem', function(item, amount)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    Player.Functions.RemoveItem(item, amount)
    TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items[item], 'remove', amount)
end)

---------------------------------
-- check if dead
---------------------------------
RegisterNetEvent('rsg-medic:server:CheckIfDead', function(targetId)
    local src = source
    local target = GetPlayerPed(targetId)
    
    if target then
        if IsEntityDead(target) then
            TriggerClientEvent('rsg-medic:client:ProceedWithFirstAid', src, targetId)
        else
            TriggerClientEvent('ox_lib:notify', src, {
                title = 'Player is not injured',
                type = 'error'
            })
        end
    end
end)

RegisterNetEvent('rsg-medic:server:CheckIfTargetDead', function(targetId)
    local src = source
    TriggerClientEvent('rsg-medic:client:ReportDeathState', targetId, src)
end)

RegisterNetEvent('rsg-medic:server:ReportDeathState', function(requesterId, isDead)
    if isDead then
        TriggerClientEvent('rsg-medic:client:ProceedWithFirstAid', requesterId, source)
    else
        TriggerClientEvent('ox_lib:notify', requesterId, {
            title = 'Player is not dead',
            type = 'error'
        })
    end
end)

---------------------------------
-- Nearest Medic Tracking
---------------------------------
local medicPositions = {}

-- Medics broadcast their coords while on duty
RegisterNetEvent('rsg-medic:server:updateMyMedicPos', function(pos)
    local src = source
    if not pos or type(pos.x) ~= "number" then
        medicPositions[src] = nil
        return
    end
    medicPositions[src] = { x = pos.x, y = pos.y, z = pos.z, ts = os.time() }
end)

-- Dead players request closest medic
RegisterNetEvent('rsg-medic:server:requestClosestMedic', function(requesterPos)
    local src = source
    if not requesterPos or type(requesterPos.x) ~= "number" then
        TriggerClientEvent('rsg-medic:client:updateClosestMedic', src, -1)
        return
    end

    -- prune old entries
    local now = os.time()
    for k,v in pairs(medicPositions) do
        if (now - (v.ts or 0)) > 20 then
            medicPositions[k] = nil
        end
    end

    local closestDist
    for _, pos in pairs(medicPositions) do
        local dx = requesterPos.x - pos.x
        local dy = requesterPos.y - pos.y
        local dz = requesterPos.z - pos.z
        local dist = math.sqrt(dx*dx + dy*dy + dz*dz)
        if not closestDist or dist < closestDist then
            closestDist = dist
        end
    end

    if closestDist then
        TriggerClientEvent('rsg-medic:client:updateClosestMedic', src, math.floor(closestDist))
    else
        TriggerClientEvent('rsg-medic:client:updateClosestMedic', src, -1)
    end
end)

-- Cleanup when player drops
AddEventHandler('playerDropped', function()
    medicPositions[source] = nil
end)
