local RSGCore = exports['rsg-core']:GetCoreObject()



----------------------------------------------------
-- Generate unique gang ID
----------------------------------------------------
local function GenerateGangId()
    local UniqueFound = false
    local gangId = nil
    while not UniqueFound do
        gangId = tostring(RSGCore.Shared.RandomStr(4) .. RSGCore.Shared.RandomInt(4)):upper()
        local result = MySQL.prepare.await("SELECT COUNT(*) as count FROM gangs WHERE gang_id = ?", { gangId })
        if result == 0 then
            UniqueFound = true
        end
    end
    return gangId
end

----------------------------------------------------
-- Get Citizen ID from server ID
----------------------------------------------------
RSGCore.Functions.CreateCallback('rsg-gangs:server:getcitizenid', function(source, cb, serverId)
    local targetPlayer = RSGCore.Functions.GetPlayer(serverId)
    if targetPlayer then
        cb(targetPlayer.PlayerData.citizenid)
    else
        cb(nil)
    end
end)

----------------------------------------------------
-- Kick a gang member (boss only)
----------------------------------------------------
RegisterServerEvent('rsg-gangs:server:kickmember', function(targetCitizenId)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    local citizenid = Player.PlayerData.citizenid

    -- Check if the player is the boss
    local gangInfo = MySQL.query.await('SELECT g.gang_id, g.gang_name, gm.role FROM gangs g JOIN gang_members gm ON g.gang_id = gm.gang_id WHERE gm.citizenid = ?', { citizenid })
    if not gangInfo[1] or gangInfo[1].role ~= 'boss' then
        TriggerClientEvent('ox_lib:notify', src, {title = 'Gang Error', description = 'Only the gang boss can kick members!', type = 'error', duration = 5000 })
        return
    end

    local gangId = gangInfo[1].gang_id
    local gangName = gangInfo[1].gang_name

    -- Check if the target is in the gang and not the boss
    local targetInfo = MySQL.query.await('SELECT role FROM gang_members WHERE gang_id = ? AND citizenid = ?', { gangId, targetCitizenId })
    if not targetInfo[1] then
        TriggerClientEvent('ox_lib:notify', src, {title = 'Gang Error', description = 'Selected player is not in the gang!', type = 'error', duration = 5000 })
        return
    end
    if targetInfo[1].role == 'boss' then
        TriggerClientEvent('ox_lib:notify', src, {title = 'Gang Error', description = 'Cannot kick the gang boss!', type = 'error', duration = 5000 })
        return
    end

    -- Remove the member from the gang
    MySQL.update('DELETE FROM gang_members WHERE gang_id = ? AND citizenid = ?', { gangId, targetCitizenId })
    TriggerClientEvent('ox_lib:notify', src, {title = 'Gang Success', description = 'Member kicked from ' .. gangName, type = 'success', duration = 5000 })

    -- Notify the kicked member if online
    local targetPlayer = RSGCore.Functions.GetPlayerByCitizenId(targetCitizenId)
    if targetPlayer then
        TriggerClientEvent('ox_lib:notify', targetPlayer.PlayerData.source, {title = 'Gang Notice', description = 'You have been kicked from ' .. gangName, type = 'error', duration = 5000 })
    end
end)

----------------------------------------------------
-- Create a new gang
----------------------------------------------------
RegisterServerEvent('rsg-gangs:server:creategang', function(gangName)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    local citizenid = Player.PlayerData.citizenid
    local cashBalance = Player.PlayerData.money["bloodmoney"]
    local creationCost = Config.GangCreationCost

    -- Check if player is already in a gang
    local existingGang = MySQL.prepare.await("SELECT COUNT(*) as count FROM gang_members WHERE citizenid = ?", { citizenid })
    if existingGang > 0 then
        TriggerClientEvent('ox_lib:notify', src, {title = 'Gang Error', description = 'You are already in a gang!', type = 'error', duration = 5000 })
        return
    end

    
    if cashBalance >= creationCost then
        local gangId = GenerateGangId()
        
		MySQL.insert('INSERT INTO gangs (gang_id, gang_name, leader_citizenid, funds) VALUES (?, ?, ?, ?)', {
            gangId,
            gangName,
            citizenid,
            0
        })
        -- Add player as boss to gang_members
        MySQL.insert('INSERT INTO gang_members (gang_id, citizenid, role) VALUES (?, ?, ?)', {
            gangId,
            citizenid,
            'boss'
        })
        Player.Functions.RemoveMoney('bloodmoney', creationCost)
        TriggerClientEvent('ox_lib:notify', src, {title = 'Gang Success', description = 'Gang created: ' .. gangName, type = 'success', duration = 5000 })
    else
        TriggerClientEvent('ox_lib:notify', src, {title = 'Gang Error', description = 'You need $' .. creationCost .. ' blood money to create a gang!', type = 'error', duration = 5000 })
    end
end)

RegisterServerEvent('rsg-gangs:server:addmember', function(targetCitizenId)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    local citizenid = Player.PlayerData.citizenid

    -- Check if the player is the boss
    local gangInfo = MySQL.query.await('SELECT g.gang_id, g.gang_name, gm.role FROM gangs g JOIN gang_members gm ON g.gang_id = gm.gang_id WHERE gm.citizenid = ?', { citizenid })
    if not gangInfo[1] or gangInfo[1].role ~= 'boss' then
        TriggerClientEvent('ox_lib:notify', src, {title = 'Gang Error', description = 'Only the gang boss can add members!', type = 'error', duration = 5000 })
        return
    end

    local gangId = gangInfo[1].gang_id
    local gangName = gangInfo[1].gang_name

    -- Check if the target exists and is not already in a gang
    local targetGang = MySQL.prepare.await("SELECT COUNT(*) as count FROM gang_members WHERE citizenid = ?", { targetCitizenId })
    if targetGang > 0 then
        TriggerClientEvent('ox_lib:notify', src, {title = 'Gang Error', description = 'This player is already in a gang!', type = 'error', duration = 5000 })
        return
    end

    -- Check if the target player exists in the players table
    local targetPlayerInfo = MySQL.query.await('SELECT citizenid FROM players WHERE citizenid = ?', { targetCitizenId })
    if not targetPlayerInfo[1] then
        TriggerClientEvent('ox_lib:notify', src, {title = 'Gang Error', description = 'Invalid Citizen ID!', type = 'error', duration = 5000 })
        return
    end

    -- Add the target to the gang as a member
    MySQL.insert('INSERT INTO gang_members (gang_id, citizenid, role) VALUES (?, ?, ?)', {
        gangId,
        targetCitizenId,
        'member'
    })

    TriggerClientEvent('ox_lib:notify', src, {title = 'Gang Success', description = 'Added member to ' .. gangName, type = 'success', duration = 5000 })

    -- Notify the added member if online
    local targetPlayer = RSGCore.Functions.GetPlayerByCitizenId(targetCitizenId)
    if targetPlayer then
        TriggerClientEvent('ox_lib:notify', targetPlayer.PlayerData.source, {title = 'Gang Notice', description = 'You have been added to ' .. gangName, type = 'success', duration = 5000 })
    end
end)

----------------------------------------------------
-- Get player's gang information
----------------------------------------------------
RSGCore.Functions.CreateCallback('rsg-gangs:server:getganginfo', function(source, cb)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    local citizenid = Player.PlayerData.citizenid
    local gangInfo = MySQL.query.await('SELECT g.gang_id, g.gang_name, g.funds, gm.role, gm.citizenid FROM gangs g JOIN gang_members gm ON g.gang_id = gm.gang_id WHERE gm.citizenid = ?', { citizenid })
    cb(gangInfo[1] or {})
end)

----------------------------------------------------
-- Deposit funds to gang
----------------------------------------------------
RegisterServerEvent('rsg-gangs:server:depositfunds', function(amount)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    local citizenid = Player.PlayerData.citizenid
    local cashBalance = Player.PlayerData.money["cash"]

    if cashBalance >= amount and amount > 0 then
        local gangInfo = MySQL.query.await('SELECT g.gang_id, g.funds FROM gangs g JOIN gang_members gm ON g.gang_id = gm.gang_id WHERE gm.citizenid = ?', { citizenid })
        if gangInfo[1] then
            local newFunds = gangInfo[1].funds + amount
            MySQL.update('UPDATE gangs SET funds = ? WHERE gang_id = ?', { newFunds, gangInfo[1].gang_id })
            Player.Functions.RemoveMoney('cash', amount)
            TriggerClientEvent('ox_lib:notify', src, {title = 'Gang Success', description = 'Deposited $' .. amount .. ' to gang funds', type = 'success', duration = 5000 })
        else
            TriggerClientEvent('ox_lib:notify', src, {title = 'Gang Error', description = 'You are not in a gang!', type = 'error', duration = 5000 })
        end
    else
        TriggerClientEvent('ox_lib:notify', src, {title = 'Gang Error', description = 'Invalid amount or insufficient funds!', type = 'error', duration = 5000 })
    end
end)

----------------------------------------------------
-- Withdraw funds from gang (boss only)
----------------------------------------------------
RegisterServerEvent('rsg-gangs:server:withdrawfunds', function(amount)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    local citizenid = Player.PlayerData.citizenid

    local gangInfo = MySQL.query.await('SELECT g.gang_id, g.funds, gm.role FROM gangs g JOIN gang_members gm ON g.gang_id = gm.gang_id WHERE gm.citizenid = ?', { citizenid })
    if gangInfo[1] and gangInfo[1].role == 'boss' then
        if gangInfo[1].funds >= amount and amount > 0 then
            local newFunds = gangInfo[1].funds - amount
            MySQL.update('UPDATE gangs SET funds = ? WHERE gang_id = ?', { newFunds, gangInfo[1].gang_id })
            Player.Functions.AddMoney('cash', amount)
            TriggerClientEvent('ox_lib:notify', src, {title = 'Gang Success', description = 'Withdrew $' .. amount .. ' from gang funds', type = 'success', duration = 5000 })
        else
            TriggerClientEvent('ox_lib:notify', src, {title = 'Gang Error', description = 'Invalid amount or insufficient gang funds!', type = 'error', duration = 5000 })
        end
    else
        TriggerClientEvent('ox_lib:notify', src, {title = 'Gang Error', description = 'Only the gang boss can withdraw funds!', type = 'error', duration = 5000 })
    end
end)

----------------------------------------------------
-- Open gang stash
----------------------------------------------------
RegisterServerEvent('rsg-gangs:server:openinventory', function(stashName, invWeight, invSlots)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    local data = { label = 'Gang Stash', maxweight = invWeight, slots = invSlots }
    exports['rsg-inventory']:OpenInventory(src, stashName, data)
end)

----------------------------------------------------
-- Disband gang (boss only)
----------------------------------------------------
RegisterServerEvent('rsg-gangs:server:disbandgang', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    local citizenid = Player.PlayerData.citizenid

    local gangInfo = MySQL.query.await('SELECT g.gang_id, gm.role FROM gangs g JOIN gang_members gm ON g.gang_id = gm.gang_id WHERE gm.citizenid = ?', { citizenid })
    if gangInfo[1] and gangInfo[1].role == 'boss' then
        local gangId = gangInfo[1].gang_id
        MySQL.update('DELETE FROM gangs WHERE gang_id = ?', { gangId })
        MySQL.update('DELETE FROM gang_members WHERE gang_id = ?', { gangId })
        MySQL.update('DELETE FROM inventories WHERE identifier = ?', { 'gang_' .. gangId })
        TriggerClientEvent('ox_lib:notify', src, {title = 'Gang Success', description = 'Gang disbanded successfully', type = 'success', duration = 5000 })
    else
        TriggerClientEvent('ox_lib:notify', src, {title = 'Gang Error', description = 'Only the gang boss can disband the gang!', type = 'error', duration = 5000 })
    end
end)

----------------------------------------------------
-- Get gang info and list all gangs
----------------------------------------------------
RSGCore.Functions.CreateCallback('rsg-gangs:server:getallgangs', function(source, cb)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    local citizenid = Player.PlayerData.citizenid

    
    local playerGang = MySQL.query.await('SELECT g.gang_id, g.gang_name, gm.role FROM gangs g JOIN gang_members gm ON g.gang_id = gm.gang_id WHERE gm.citizenid = ?', { citizenid })
    
    local allGangs = MySQL.query.await('SELECT gang_id, gang_name FROM gangs')

    cb({
        playerGang = playerGang[1] or {},
        allGangs = allGangs or {}
    })
end)

----------------------------------------------------
-- Get gang members for promotion menu
----------------------------------------------------
RSGCore.Functions.CreateCallback('rsg-gangs:server:getgangmembers', function(source, cb, gangId)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    local citizenid = Player.PlayerData.citizenid

    -- Check if the player is the boss
    local gangInfo = MySQL.query.await('SELECT gm.role FROM gangs g JOIN gang_members gm ON g.gang_id = gm.gang_id WHERE gm.citizenid = ? AND g.gang_id = ?', { citizenid, gangId })
    if not gangInfo[1] or gangInfo[1].role ~= 'boss' then
        TriggerClientEvent('ox_lib:notify', src, {title = 'Gang Error', description = 'Only the gang boss can view members!', type = 'error', duration = 5000 })
        cb({})
        return
    end

    -- Fetch all members (including boss for viewing, not just non-bosses)
    local members = MySQL.query.await('SELECT gm.citizenid, gm.role, COALESCE(p.name, gm.citizenid) AS display_name FROM gang_members gm LEFT JOIN players p ON gm.citizenid = p.citizenid WHERE gm.gang_id = ?', { gangId })
    cb(members or {})
end)

----------------------------------------------------
-- Promote member to boss
----------------------------------------------------
RegisterServerEvent('rsg-gangs:server:promotetoboss', function(newBossCitizenId)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    local citizenid = Player.PlayerData.citizenid

    
    local gangInfo = MySQL.query.await('SELECT g.gang_id, g.gang_name, gm.role FROM gangs g JOIN gang_members gm ON g.gang_id = gm.gang_id WHERE gm.citizenid = ?', { citizenid })
    if not gangInfo[1] or gangInfo[1].role ~= 'boss' then
        TriggerClientEvent('ox_lib:notify', src, {title = 'Gang Error', description = 'Only the gang boss can promote a new boss!', type = 'error', duration = 5000 })
        return
    end

    local gangId = gangInfo[1].gang_id
    local gangName = gangInfo[1].gang_name

    
    local newBossInfo = MySQL.query.await('SELECT role FROM gang_members WHERE gang_id = ? AND citizenid = ?', { gangId, newBossCitizenId })
    if not newBossInfo[1] then
        TriggerClientEvent('ox_lib:notify', src, {title = 'Gang Error', description = 'Selected player is not in the gang!', type = 'error', duration = 5000 })
        return
    end

    
    MySQL.update('UPDATE gang_members SET role = ? WHERE gang_id = ? AND citizenid = ?', { 'leader', gangId, citizenid })
    MySQL.update('UPDATE gang_members SET role = ? WHERE gang_id = ? AND citizenid = ?', { 'boss', gangId, newBossCitizenId })
    
    MySQL.update('UPDATE gangs SET leader_citizenid = ? WHERE gang_id = ?', { newBossCitizenId, gangId })

    TriggerClientEvent('ox_lib:notify', src, {title = 'Gang Success', description = 'New boss set for ' .. gangName, type = 'success', duration = 5000 })

    
    local newBossPlayer = RSGCore.Functions.GetPlayerByCitizenId(newBossCitizenId)
    if newBossPlayer then
        TriggerClientEvent('ox_lib:notify', newBossPlayer.PlayerData.source, {title = 'Gang Success', description = 'You are now the boss of ' .. gangName, type = 'success', duration = 5000 })
    end
end)

----------------------------------------------------
-- Command to manually set gang boss (admin only)
----------------------------------------------------
RSGCore.Commands.Add('setgangboss', 'Set a player as gang boss', {{name = 'citizenid', help = 'Citizen ID of the new boss'}}, true, function(source, args)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end

    
    if not RSGCore.Functions.HasPermission(src, 'admin') then
        TriggerClientEvent('ox_lib:notify', src, {title = 'Gang Error', description = 'You do not have permission to use this command!', type = 'error', duration = 5000 })
        return
    end

    local newBossCitizenId = args[1]
    if not newBossCitizenId then
        TriggerClientEvent('ox_lib:notify', src, {title = 'Gang Error', description = 'Please provide a citizen ID!', type = 'error', duration = 5000 })
        return
    end

    
    local gangInfo = MySQL.query.await('SELECT g.gang_id, g.gang_name FROM gangs g JOIN gang_members gm ON g.gang_id = gm.gang_id WHERE gm.citizenid = ?', { newBossCitizenId })
    if not gangInfo[1] then
        TriggerClientEvent('ox_lib:notify', src, {title = 'Gang Error', description = 'Player is not in a gang!', type = 'error', duration = 5000 })
        return
    end

    local gangId = gangInfo[1].gang_id
    local gangName = gangInfo[1].gang_name

    
    local currentBoss = MySQL.query.await('SELECT citizenid FROM gang_members WHERE gang_id = ? AND role = ?', { gangId, 'boss' })
    if currentBoss[1] then
        
        MySQL.update('UPDATE gang_members SET role = ? WHERE gang_id = ? AND citizenid = ?', { 'leader', gangId, currentBoss[1].citizenid })
    end

   
    MySQL.update('UPDATE gang_members SET role = ? WHERE gang_id = ? AND citizenid = ?', { 'boss', gangId, newBossCitizenId })
    MySQL.update('UPDATE gangs SET leader_citizenid = ? WHERE gang_id = ?', { newBossCitizenId, gangId })

    TriggerClientEvent('ox_lib:notify', src, {title = 'Gang Success', description = 'Set new boss for ' .. gangName, type = 'success', duration = 5000 })

    
    local newBossPlayer = RSGCore.Functions.GetPlayerByCitizenId(newBossCitizenId)
    if newBossPlayer then
        TriggerClientEvent('ox_lib:notify', newBossPlayer.PlayerData.source, {title = 'Gang Success', description = 'You are now the boss of ' .. gangName, type = 'success', duration = 5000 })
    end
end, 'admin')

RegisterServerEvent('rsg-gangs:server:addgangfunds', function(gangId, amount) MySQL.update.await('UPDATE gangs SET funds = funds + ? WHERE gang_id = ?', { amount, gangId }) end)