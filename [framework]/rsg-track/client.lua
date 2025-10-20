local RSGCore = exports['rsg-core']:GetCoreObject()
local ox_lib = exports['ox_lib']
local hasPassedStart = false
local inRace = false
local raceStarted = false
local playersInRace = {}
local startObject = nil
local finishObject = nil
local trackCreated = false
local startObjects = {}
local finishObjects = {}
local raceBlip = nil
local playerLaps = 0
local totalLaps = 1
local particleHandles = {}
local raceResults = {}
local currentRaceFinishers = {}
local lastWinner = nil


function SendChatMessage(message)
    TriggerEvent('chat:addMessage', {
        color = {255, 255, 0}, 
        multiline = true,
        args = {" Horse Race", message}
    })
end

local racePoints = {
    { x = -1528.76, y = -1646.45, z = 81.13 }, -- Start point
    { x = -1532.09, y = -1620.52, z = 81.65 }  -- End point
}

local function ClearParticles()
    for _, handle in pairs(particleHandles) do
        if DoesParticleFxLoopedExist(handle) then
            StopParticleFxLooped(handle, false)
        end
    end
    particleHandles = {}
end



local function ApplyParticleEffect(checkpointCoords)
    if not checkpointCoords then
        print("Error: Invalid checkpoint coordinates")
        return nil
    end
    
    local ptfxDictionary = "scr_net_target_races"
    local ptfxName = "scr_net_target_fire_ring_mp"
    local particleHandle
    
    if not HasNamedPtfxAssetLoaded(ptfxDictionary) then
        RequestNamedPtfxAsset(ptfxDictionary)
        local counter = 0
        while not HasNamedPtfxAssetLoaded(ptfxDictionary) and counter <= 300 do
            Wait(0)
            counter = counter + 1
        end
    end
    
    if HasNamedPtfxAssetLoaded(ptfxDictionary) then
        UseParticleFxAsset(ptfxDictionary)
        particleHandle = StartParticleFxLoopedAtCoord(ptfxName, 
            checkpointCoords.x, 
            checkpointCoords.y, 
            checkpointCoords.z + 1.5,
            0.0, 0.0, 0.0,
            4.5, false, false, false, false)
        
        
        if particleHandle then
            SetParticleFxLoopedColour(particleHandle, 1.0, 0.0, 0.0, false) -- Red color
        end
    end
    return particleHandle
end



function OpenRaceMenu()
    
    lib.registerContext({
        id = 'horse_race_menu',
        title = '🐎 Horse Race Menu 🏇', 
        options = {
            {
                title = '🏁 Create Track', 
                description = 'Set up the race start and end points 🎯',
                onSelect = function()
                    CreateRaceTrack()
                end,
                disabled = trackCreated
            },
            {
                title = '🐴 Join Race', 
                description = 'Join the upcoming horse race 🏃‍♂️',
                disabled = not trackCreated or raceStarted,
                onSelect = function()
                   
                    TriggerServerEvent('horse_race:joinRace')
                end
            },
			{
                title = '� Set Laps', 
                description = 'Set number of laps for the race (1-5)',
                onSelect = function()
                    local input = lib.inputDialog('Set Laps', {
                        {type = 'number', label = 'Number of Laps', description = 'Enter laps (1-5)', required = true, min = 1, max = 5}
                    })
                    if input then
                        totalLaps = input[1]
                        TriggerServerEvent('horse_race:setLaps', totalLaps)
                        ShowNotification('Race set to ' .. totalLaps .. ' laps!')
                    end
                end,
                disabled = raceStarted or not trackCreated
            },
            {
                title = '🚪 Leave Race', 
                description = 'Leave the race if joined 👋',
                event = 'horse_race:leaveRace',
                args = {},
                disabled = not inRace or raceStarted
            },
            {
                title = '▶️ Start Race', 
                description = 'Start the race (Host only) 🎉',
                onSelect = function()
                   
                    TriggerServerEvent('horse_race:startRace')
                end,
                disabled = not trackCreated or raceStarted or #playersInRace < 1
            },
            {
                title = '👥 View Participants', 
                description = 'See who is in the race 📋',
                onSelect = function()
                    local participantList = 'Participants: '
                    for _, name in pairs(playersInRace) do
                        participantList = participantList .. name .. ', '
                    end
                    ShowNotification(participantList:sub(1, -3))
                end,
                disabled = not trackCreated
            },
            {
                title = '▶️ Race Results',
                description = 'View recent race results ▶️',
                onSelect = function()
                    print("[DEBUG] Before displaying results, raceResults: " .. json.encode(raceResults))
                    if #raceResults == 0 then
                        if #currentRaceFinishers > 0 then
                            
                            local resultText = 'Current Race Finishers:\n'
                            for _, finisher in ipairs(currentRaceFinishers) do
                                resultText = resultText .. finisher.position .. '. ' .. finisher.name .. ' - ' .. 
                                          (finisher.laps or totalLaps) .. ' laps\n'
                            end
                            ShowNotification(resultText)
                        else
                            ShowNotification('No race results available yet!')
                        end
                    else
                        local resultText = 'Recent Race Results:\n'
                        for _, race in ipairs(raceResults) do
                            resultText = resultText .. 'Race ' .. race.raceId .. ':\n'
                            for _, finisher in ipairs(race.finishers) do
                                resultText = resultText .. finisher.position .. '. ' .. finisher.name .. ' - ' .. 
                                          (finisher.laps or totalLaps) .. ' laps\n'
                            end
                            resultText = resultText .. '\n'
                        end
                        if lastWinner then
                            resultText = resultText .. 'Last Winner: ' .. lastWinner
                        end
                        ShowNotification(resultText)
                    end
                end
            },
            {
                title = '🔄 Reset Track', 
                description = 'Reset the current race track and all race data 🗑️',
                onSelect = function()
                    
                    TriggerServerEvent('horse_race:resetRace')
                end,
                disabled = not trackCreated or raceStarted
            }
        }
    })
    lib.showContext('horse_race_menu')
end


-- RegisterCommand('racerace', function()
--     OpenRaceMenu()
-- end, false)

RegisterNetEvent('rsg-racing:client:OpenRaceMenu', function()
    OpenRaceMenu()
end)


function ShowNotification(message)
    
    lib.notify({
        title = 'Horse Race',
        description = message,
        type = 'inform',
        duration = 5000
    })
end

function CreateRaceTrack()
    racePoints = {}
    ShowNotification('Go to the start point and press J to set it')
    Citizen.CreateThread(function()
        while #racePoints < 2 do
            Citizen.Wait(0)
            local playerPed = PlayerPedId()
            local coords = GetEntityCoords(playerPed)
            DrawMarker(28, coords.x, coords.y, coords.z, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 1.5, 255, 0, 0, 150, false, true, 2, nil, nil, false)
            
            if IsControlJustPressed(0,  0xF3830D8E) then -- J key
                table.insert(racePoints, {x = coords.x, y = coords.y, z = coords.z})
                if #racePoints == 1 then
                    ShowNotification('Start point set! Now set the end point')
                elseif #racePoints == 2 then
                    ShowNotification('Track created successfully!')
                    trackCreated = true
                    TriggerServerEvent('horse_race:trackCreated', racePoints)
                    OpenRaceMenu() 
                end
            end
        end
    end)
end

RegisterNetEvent('horse_race:syncTrack')
AddEventHandler('horse_race:syncTrack', function(points, created)
    racePoints = points
    trackCreated = created
    
    if created then
        if racePoints[1] then
            TriggerEvent('rNotify:ShowTopNotification', "Horse Race", "A horse race is being organized! Check the racecourse in Blackwater. Use /racerace to join.", 4000)
        end
    end
end)

function SpawnRaceObjects()
    if #racePoints < 2 then return end 
    
    
    ClearParticles() 
    
   
    local startParticle = ApplyParticleEffect(racePoints[1])
    if startParticle then
        table.insert(particleHandles, startParticle)
    end
    
    
    local finishParticle = ApplyParticleEffect(racePoints[2])
    if finishParticle then
        table.insert(particleHandles, finishParticle)
    end
end

RegisterNetEvent('horse_race:deleteObject')
AddEventHandler('horse_race:deleteObject', function(netId)
    local entity = NetworkGetEntityFromNetworkId(netId)
    if DoesEntityExist(entity) then
        SetEntityAsMissionEntity(entity, true, true)
        DeleteObject(entity)
       
    else
        
    end
end)

function RemoveRaceObjects()
    ClearBlipsAndParticles()
end

local function StartRaceCountdown()
    local count = 10
    local container = DatabindingAddDataContainerFromPath("", "MPCountdown")
    local dataString = DatabindingAddDataString(container, "Timer", count)
    local dataBoolean = DatabindingAddDataBool(container, "showTimer", true)
    
   
    
    
   
    
    Citizen.CreateThread(function()
        for i = count, 1, -1 do
            DatabindingWriteDataString(dataString, tostring(i))
            
            
            if i == 5 then
                --SendChatMessage("^*Race starting in 5 seconds!")
            elseif i == 3 then
                --SendChatMessage("^*3...")
            elseif i == 2 then
                --SendChatMessage("^*2...")
            elseif i == 1 then
                --SendChatMessage("^*1...")
            end
            
            Citizen.Wait(1000)
        end
        
        
        if UiStateMachineExists(190275865) then
            UiStateMachineDestroy(190275865)
        end
        if DatabindingIsEntryValid(dataString) then
            DatabindingRemoveDataEntry(dataString)
        end
        if DatabindingIsEntryValid(dataBoolean) then
            DatabindingWriteDataBool(dataBoolean, false)
            DatabindingRemoveDataEntry(dataBoolean)
        end
        if DatabindingIsEntryValid(container) then
            DatabindingRemoveDataEntry(container)
        end
        
        
        ShowNotification('The race has begun!', 'success', 3000)
    end)
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if raceStarted then
            SpawnRaceObjects()
            if inRace then
                local playerPed = PlayerPedId()
                local coords = GetEntityCoords(playerPed)
                local startPoint = racePoints[1]
                local endPoint = racePoints[2]

               
                if not hasPassedStart and Vdist(coords.x, coords.y, coords.z, startPoint.x, startPoint.y, startPoint.z) < 5.0 then
                    ShowNotification('You are at the starting line! ??')
                    hasPassedStart = true
                    
                end

                
                if hasPassedStart and Vdist(coords.x, coords.y, coords.z, endPoint.x, endPoint.y, endPoint.z) < 5.0 then
                    playerLaps = playerLaps + 1
                    ShowNotification('Lap ' .. playerLaps .. ' of ' .. totalLaps .. ' completed!')
                    hasPassedStart = false 
                    

                    
                    if playerLaps >= totalLaps then
                        ShowNotification('You finished the race! ??')
                        TriggerServerEvent('horse_race:finishRace', playerLaps)
                        inRace = false
                        playerLaps = 0
                       
                    end
                end
            end
        else
           
            if not inRace then
                RemoveRaceObjects()
            end
            hasPassedStart = false
            playerLaps = 0
        end
    end
end)

RegisterNetEvent('horse_race:syncLaps')
AddEventHandler('horse_race:syncLaps', function(laps)
    totalLaps = laps
    
end)


RegisterNetEvent('horse_race:updatePlayers')
AddEventHandler('horse_race:updatePlayers', function(playerList, started)
    playersInRace = playerList
    raceStarted = started
    if not started and #currentRaceFinishers > 0 then
        
        table.insert(raceResults, {finishers = currentRaceFinishers, raceId = #raceResults + 1})
        if #raceResults > 5 then
            table.remove(raceResults, 1)
        end
        currentRaceFinishers = {}
    end
    
end)

RegisterNetEvent('horse_race:joinedRace')
AddEventHandler('horse_race:joinedRace', function()
    inRace = true
    playerLaps = 0  
    ShowNotification('You have joined the race! Wait for it to start.')
   
end)


RegisterNetEvent('horse_race:leftRace')
AddEventHandler('horse_race:leftRace', function()
    inRace = false
    playerLaps = 0
    ShowNotification('You have left the race.')
    
end)


RegisterNetEvent('horse_race:rewardReceived')
AddEventHandler('horse_race:rewardReceived', function(amount)
    ShowNotification('You won the race and received $' .. amount .. '!')
   
end)

RegisterNetEvent('horse_race:showFinisherNotification')
AddEventHandler('horse_race:showFinisherNotification', function(playerName, position)
    TriggerEvent('rNotify:ShowTopNotification', "Horse Race", playerName .. " finished in position " .. position .. "!", 2000)
    if position == 1 then
        TriggerEvent('rNotify:ShowTopNotification', "RACE ENDED", playerName .. " - WELL DONE TO THE WINNER!", 4000)
        lastWinner = playerName
    end
    
end)

RegisterNetEvent('horse_race:showWinnerNotification')
AddEventHandler('horse_race:showWinnerNotification', function(winnerName)
    TriggerEvent('rNotify:ShowTopNotification', "Horse Race", winnerName .. " has won the race! ", 2000)
    TriggerEvent('rNotify:ShowTopNotification', "RACE ENDED", winnerName .. " - WELL DONE TO THE WINNER!", 4000)
    lastWinner = winnerName
    
end)

RegisterNetEvent('horse_race:syncResults')
AddEventHandler('horse_race:syncResults', function(finishers)
    currentRaceFinishers = finishers
   
end)


RegisterNetEvent('horse_race:raceUpdate')
AddEventHandler('horse_race:raceUpdate', function(message)
    SendChatMessage(message)
end)

function RemoveRaceObjects()
    ClearParticles() 
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if raceStarted then
            SpawnRaceObjects()
            if inRace then
                local playerPed = PlayerPedId()
                local coords = GetEntityCoords(playerPed)
                local startPoint = racePoints[1]
                local endPoint = racePoints[2]

                
                if not hasPassedStart and Vdist(coords.x, coords.y, coords.z, startPoint.x, startPoint.y, startPoint.z) < 5.0 then
                    ShowNotification('You are at the starting line! ??')
                    hasPassedStart = true
                    
                end

                
                if hasPassedStart and Vdist(coords.x, coords.y, coords.z, endPoint.x, endPoint.y, endPoint.z) < 5.0 then
                    playerLaps = playerLaps + 1
                    ShowNotification('Lap ' .. playerLaps .. ' of ' .. totalLaps .. ' completed!')
                    hasPassedStart = false 
                    

                   
                    if playerLaps >= totalLaps then
                        ShowNotification('You finished the race! ??')
                        TriggerServerEvent('horse_race:finishRace', playerLaps)
                        inRace = false
                        playerLaps = 0
                       
                    else
                        
                    end
                end
            end
        else
            if not inRace then
                RemoveRaceObjects()
                
            end
            hasPassedStart = false
            playerLaps = 0
        end
    end
end)

RegisterNetEvent('horse_race:finishRace')
AddEventHandler('horse_race:finishRace', function()
    
    if not raceStarted then
        
        RemoveRaceObjects()
    end
end)

RegisterNetEvent('horse_race:resetRace')
AddEventHandler('horse_race:resetRace', function(manual)
    racePoints = {}
    inRace = false
    raceStarted = false
    playersInRace = {}
    trackCreated = false
    hasPassedStart = false
    playerLaps = 0
    totalLaps = 1
    if manual then
        raceResults = {}
        currentRaceFinishers = {}
        lastWinner = nil
    end
    RemoveRaceObjects()
    
end)

RegisterNetEvent('horse_race:deleteObject')
AddEventHandler('horse_race:deleteObject', function(netId)
    local entity = NetworkGetEntityFromNetworkId(netId)
    if DoesEntityExist(entity) then
        SetEntityAsMissionEntity(entity, true, true)
        DeleteObject(entity)
        
        for i, obj in ipairs(startObjects) do
            if obj == entity then table.remove(startObjects, i) break end
        end
        for i, obj in ipairs(finishObjects) do
            if obj == entity then table.remove(finishObjects, i) break end
        end
       
    else
        
    end
end)


AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        ClearParticles()
    end
end)