local RSGCore = exports['rsg-core']:GetCoreObject()
local playersInRace = {}
local raceStarted = false
local rewardAmount = 100 -- Adjust this value for the reward
local racePoints = {}
local totalLaps = 1
local raceResults = {}
local currentRaceFinishers = {}


RegisterServerEvent('horse_race:setLaps')
AddEventHandler('horse_race:setLaps', function(laps)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    
    totalLaps = laps
    TriggerClientEvent('horse_race:syncLaps', -1, totalLaps)
    TriggerClientEvent('ox_lib:notify', -1, {
        title = 'Horse Race',
        description = 'Race laps set to ' .. totalLaps .. ' by ' .. Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname,
        type = 'inform'
    })
end)




RegisterServerEvent('horse_race:joinRace')
AddEventHandler('horse_race:joinRace', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    
    if #racePoints == 0 then
        TriggerClientEvent('ox_lib:notify', src, {title = 'Horse Race', description = 'No track has been created yet!', type = 'error'})
        return
    end
    
    if raceStarted then
        TriggerClientEvent('ox_lib:notify', src, {title = 'Horse Race', description = 'The race has already started!', type = 'error'})
        return
    end
    
    if playersInRace[src] then
        TriggerClientEvent('ox_lib:notify', src, {title = 'Horse Race', description = 'You are already in the race!', type = 'error'})
        return
    end
    
    local playerName = Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname
    playersInRace[src] = playerName
    TriggerClientEvent('horse_race:joinedRace', src)
    TriggerClientEvent('horse_race:updatePlayers', -1, playersInRace, raceStarted)
    TriggerClientEvent('ox_lib:notify', src, {title = 'Horse Race', description = 'You have joined the race!', type = 'success'})
   
end)


function tableCount(tbl)
    local count = 0
    for _ in pairs(tbl) do count = count + 1 end
    return count
end

RegisterServerEvent('horse_race:trackCreated')
AddEventHandler('horse_race:trackCreated', function(points)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    racePoints = points
    
    TriggerClientEvent('horse_race:syncTrack', -1, points, true)
    TriggerClientEvent('ox_lib:notify', -1, {title = 'Horse Race', description = 'Track has been created! Players can now join.', type = 'success'})
end)


-- Leave race event
RegisterServerEvent('horse_race:leaveRace')
AddEventHandler('horse_race:leaveRace', function()
    local src = source
    if playersInRace[src] then
        playersInRace[src] = nil
        TriggerClientEvent('horse_race:leftRace', src)
        TriggerClientEvent('horse_race:updatePlayers', -1, playersInRace, raceStarted)
        
    end
end)

RegisterServerEvent('horse_race:startRace')
AddEventHandler('horse_race:startRace', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    
    
    if not Player then
       
        TriggerClientEvent('ox_lib:notify', src, {title = 'Horse Race', description = 'Error: Player data not found!', type = 'error'})
        return
    end
    
    local playerName = Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname
   
    
    
    if #racePoints == 0 then
        TriggerClientEvent('ox_lib:notify', src, {title = 'Horse Race', description = 'No track has been created yet!', type = 'error'})
       
        return
    end
    
    if tableCount(playersInRace) < 1 then  
        TriggerClientEvent('ox_lib:notify', src, {title = 'Horse Race', description = 'At least 2 players are required to start the race!', type = 'error'})
        
        return
    end
    
    if raceStarted then
        TriggerClientEvent('ox_lib:notify', src, {title = 'Horse Race', description = 'The race is already in progress!', type = 'error'})
       
        return
    end
    
    
    raceStarted = true
    TriggerClientEvent('horse_race:updatePlayers', -1, playersInRace, raceStarted)
    TriggerClientEvent('ox_lib:notify', -1, {
        title = 'Horse Race',
        description = 'The race has been started by ' .. playerName .. '! Get ready!',
        type = 'success'
    })
    
end)


function tableCount(tbl)
    local count = 0
    for _ in pairs(tbl) do count = count + 1 end
    return count
end


RegisterServerEvent('horse_race:finishRace')
AddEventHandler('horse_race:finishRace', function(playerLaps)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if playersInRace[src] and playerLaps >= totalLaps then
        local playerName = Player.PlayerData.charinfo.firstname .. ' ' .. Player.PlayerData.charinfo.lastname
        
        
        local position = #currentRaceFinishers + 1
        table.insert(currentRaceFinishers, {name = playerName, position = position, laps = totalLaps})
        
        
        TriggerClientEvent('horse_race:showFinisherNotification', -1, playerName, position)
        
        
        if position == 1 then
            Player.Functions.AddMoney('cash', rewardAmount)
            TriggerClientEvent('horse_race:rewardReceived', src, rewardAmount)
        end
        
        playersInRace[src] = nil
        
        
        TriggerClientEvent('horse_race:syncResults', -1, currentRaceFinishers)
        
        
        if next(playersInRace) == nil then
            
            table.insert(raceResults, {finishers = currentRaceFinishers, raceId = #raceResults + 1})
            if #raceResults > 5 then
                table.remove(raceResults, 1) 
            end
            currentRaceFinishers = {} 
            racePoints = {}
            playersInRace = {}
            raceStarted = false
            totalLaps = 1
            TriggerClientEvent('horse_race:updatePlayers', -1, playersInRace, raceStarted)
            TriggerClientEvent('horse_race:syncResults', -1, currentRaceFinishers) 
        end
    end
end)

RegisterNetEvent('horse_race:syncResults')
AddEventHandler('horse_race:syncResults', function(results)
    raceResults = results
end)

RegisterServerEvent('horse_race:resetRace')
AddEventHandler('horse_race:resetRace', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    
    racePoints = {}
    playersInRace = {}
    raceStarted = false
    totalLaps = 1
    raceResults = {} 
    currentRaceFinishers = {} 
    
    TriggerClientEvent('horse_race:resetRace', -1, true)
end)

RSGCore.Functions.CreateUseableItem('racebook', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    
    if not Player then return end
    
    -- Trigger client event to open race menu
    TriggerClientEvent('rsg-racing:client:OpenRaceMenu', src)
end)