RegisterNetEvent('rsg-discord:getdata', function()
    local src = source
    local activePlayers = GetPlayers()
    local playerName = GetPlayerName(src)
    local maxServerCapacity = GetConvarInt("sv_maxClients", 128)
    
    -- Safety check for template existence
    if not Config.Discord.Template then
        return
    end
    
    local template = Config.Discord.Template
    
    local replacements = {
        ["{ID}"] = src,
        ["{NAME}"] = playerName,
        ["{PLAYERS_COUNT}"] = #activePlayers .. "/" .. maxServerCapacity,
        ["{PLAYERS}"] = tostring(#activePlayers),
        ["{MAX_PLAYERS}"] = tostring(maxServerCapacity),
        ["{SERVER_NAME}"] = GetConvar("sv_hostname", "FiveM Server"),
    }
    
    local pattern = "{(.-)}"
    local result = template:gsub(pattern, function(key)
        return replacements['{' .. key .. '}'] or ('{' .. key .. '}')
    end)
    
    TriggerClientEvent('rsg-discord:receivedata', src, result)
end)