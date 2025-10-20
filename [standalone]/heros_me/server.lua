local logEnabled = false

RegisterServerEvent('3dme:shareDisplay')
AddEventHandler('3dme:shareDisplay', function(text)
    local src = source
    
    -- Get all players and send to everyone - let client handle range checking
    local players = GetPlayers()
    
    for _, playerId in ipairs(players) do
        local targetId = tonumber(playerId)
        TriggerClientEvent('3dme:triggerDisplay', targetId, text, src)
    end
    
    if logEnabled then
        setLog(text, src)
    end
end)

RegisterServerEvent('3dme:removeDisplay')
AddEventHandler('3dme:removeDisplay', function()
    local src = source
    
    -- Send remove event to all players
    local players = GetPlayers()
    
    for _, playerId in ipairs(players) do
        local targetId = tonumber(playerId)
        TriggerClientEvent('3dme:removeDisplay', targetId)
    end
end)

-- function setLog(text, source)
--     local time = os.date("%d/%m/%Y %X")
--     local name = GetPlayerName(source)
--     local identifier = GetPlayerIdentifiers(source)
--     local data = time .. ' : ' .. name .. ' - ' .. identifier[1] .. ' : ' .. text
--     print(data)
-- end

