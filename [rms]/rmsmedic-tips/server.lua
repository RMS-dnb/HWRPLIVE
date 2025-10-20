local RSGCore = exports['rsg-core']:GetCoreObject()
local CONFIG = {
    MAX_WANTED_BOUNTY = 10000,
    MAX_LOCATION_DISTANCE = 500.0,
    NOTIFICATION_DURATION = 8000,
    DATABASE_TIMEOUT = 5000,
    ACTIVITY_BLIP = {
        SPRITE = -1282792512, -- Radius blip
        COLOR = 0xFF0000FF,   -- Red color in ARGB
        RADIUS = 100.0,       -- 100 meters
        DURATION = 30000      -- 30 seconds
    }
}
local DynamicZones = {}
local NamedLocations = {
    -- Major Towns
    ["Valentine"] = {x = -284.49, y = 804.42, z = 119.38},
    ["Saint Denis"] = {x = 2631.9, y = -1242.4, z = 53.9},
    ["Rhodes"] = {x = 1346.35, y = -1307.9, z = 77.0},
    ["Blackwater"] = {x = -732.51, y = -1252.44, z = 44.73},
    ["Strawberry"] = {x = -1770.73, y = -391.03, z = 156.69},
    ["Tumbleweed"] = {x = -5517.17, y = -2937.8, z = -1.95},
    ["Armadillo"] = {x = -3666.15, y = -2626.54, z = -13.75},
    ["Van Horn"] = {x = 2985.76, y = 571.24, z = 44.63},
    ["Annesburg"] = {x = 2923.16, y = 1351.93, z = 44.86},
    ["Caliga Hall"] = {x = 1917.10, y = -1337.77, z = 42.76},
    
    -- Smaller Settlements
    ["Butcher Creek"] = {x = 2517.75, y = 811.94, z = 74.95},
    ["Emerald Ranch"] = {x = 1417.90, y = 267.01, z = 89.63},
    ["Lagras"] = {x = 2034.56, y = -642.36, z = 42.09},
    ["Manzanita Post"] = {x = -1990.20, y = -1530.51, z = 114.33},
    ["Wapiti"] = {x = 446.36, y = 2150.68, z = 221.89},
    ["Colter"] = {x = -1354.39, y = 2421.61, z = 307.47},
    ["Braithwaite Manor"] = {x = 1011.20, y = -1741.60, z = 46.57},
    ["Thieves Landing"] = {x = -1389.46, y = -2378.92, z = 43.11},
    ["Fort Mercer"] = {x = -4214.88, y = -3442.10, z = 37.08},
    ["MacFarlane's Ranch"] = {x = -2386.59, y = -2378.02, z = 61.19},
    
    -- Ranches & Farms
    ["Beecher's Hope"] = {x = -1643.93, y = -1358.64, z = 83.30},
    ["Painted Sky"] = {x = -1337.41, y = 499.19, z = 93.43},
    ["Hanging Dog Ranch"] = {x = -1801.48, y = 410.93, z = 113.75},
    ["Downes Ranch"] = {x = -813.39, y = 347.36, z = 97.69},
    ["Carmody Dell"] = {x = 1077.10, y = 495.70, z = 96.42},
    ["Larned Sod"] = {x = 1787.36, y = 862.34, z = 113.44},
    ["Guthrie Farm"] = {x = 1185.15, y = 427.12, z = 92.83},
    ["Aberdeen Pig Farm"] = {x = 2010.00, y = -762.00, z = 42.00},
    ["Hill Haven Ranch"] = {x = -1508.00, y = -333.00, z = 155.00},
    ["Watson's Cabin"] = {x = -2071.78, y = 552.54, z = 119.87},
    
    -- Landmarks & Regions
    ["Ambarino"] = {x = -304.94, y = 1774.36, z = 195.20},
    ["New Hanover"] = {x = 879.09, y = 284.30, z = 118.21},
    ["Lemoyne"] = {x = 1889.42, y = -922.59, z = 42.66},
    ["West Elizabeth"] = {x = -1347.55, y = -665.33, z = 100.80},
    ["New Austin"] = {x = -3404.04, y = -2536.42, z = 0.67},
    ["Grizzlies East"] = {x = 776.74, y = 1927.16, z = 258.37},
    ["Grizzlies West"] = {x = -1823.33, y = 1268.12, z = 214.99},
    ["Bayou Nwa"] = {x = 2262.89, y = -780.19, z = 41.66},
    ["Bluewater Marsh"] = {x = 2359.50, y = 186.66, z = 45.23},
    ["Big Valley"] = {x = -1585.85, y = -174.48, z = 132.43},
    
    -- Water Bodies
    ["Flat Iron Lake"] = {x = -700.47, y = -1244.20, z = 43.21},
    ["Lannahechee River"] = {x = 2078.75, y = -584.36, z = 41.04},
    ["Upper Montana River"] = {x = -2035.89, y = 216.16, z = 101.12},
    ["Dakota River"] = {x = -456.04, y = 33.73, z = 97.81},
    ["Kamassa River"] = {x = 2093.01, y = -272.14, z = 42.23},
    ["Owanjila"] = {x = -2040.30, y = -403.60, z = 142.25},
    ["O'Creagh's Run"] = {x = 1939.53, y = 1209.45, z = 171.89},
    ["Aurora Basin"] = {x = -1981.33, y = -1778.23, z = 116.42},
    ["Elysian Pool"] = {x = 1789.22, y = 876.01, z = 110.93},
    ["Moonstone Pond"] = {x = 1642.37, y = 2212.15, z = 329.93},
    
    -- Points of Interest
    ["Bacchus Bridge"] = {x = 573.12, y = 1707.39, z = 186.62},
    ["Cornwall Kerosene & Tar"] = {x = 2471.24, y = 1454.35, z = 85.75},
    ["Beaver Hollow"] = {x = 2369.65, y = 1048.65, z = 85.06},
    ["Bronte Mansion"] = {x = 2384.44, y = -1146.53, z = 46.63},
    ["Abandoned Church"] = {x = 2752.80, y = -1017.68, z = 45.74},
    ["Face Rock"] = {x = -1089.22, y = 2717.87, z = 318.08},
    ["Meteor House"] = {x = 887.66, y = 1925.21, z = 233.88},
    ["Mysterious Hill Home"] = {x = 1487.61, y = 797.78, z = 93.33},
    ["Shady Belle"] = {x = 1784.80, y = -1352.74, z = 43.12},
    ["Micah's Hideout"] = {x = -1166.02, y = 1728.12, z = 194.85},
    
    -- Camps & Hideouts
    ["Clemens Point"] = {x = 1898.21, y = -1868.95, z = 43.13},
    ["Horseshoe Overlook"] = {x = -131.22, y = 593.88, z = 114.22},
    ["Whiskey Tree"] = {x = 591.90, y = 1691.84, z = 187.65},
    ["Twin Rocks"] = {x = -3949.35, y = -2140.81, z = -5.22},
    ["Six Point Cabin"] = {x = -2369.38, y = 124.16, z = 216.15},
    ["Dodd's Bluff"] = {x = 2166.25, y = -618.00, z = 42.12},
    ["Fort Brennand"] = {x = 2386.07, y = 1686.28, z = 96.39},
    ["The Loft"] = {x = -1546.35, y = 2097.94, z = 314.31},
    ["Ewing Basin"] = {x = -1339.35, y = 2419.42, z = 306.45},
    ["Nekoti Rock"] = {x = -1672.65, y = 1596.49, z = 194.44},
    
    -- Train Stations
    ["Valentine Station"] = {x = -174.39, y = 628.33, z = 114.09},
    ["Saint Denis Station"] = {x = 2748.80, y = -1398.40, z = 46.18},
    ["Rhodes Station"] = {x = 1225.80, y = -1293.60, z = 76.90},
    ["Blackwater Station"] = {x = -875.04, y = -1328.78, z = 43.96},
    ["Wallace Station"] = {x = -1301.03, y = 398.76, z = 95.38},
    ["Riggs Station"] = {x = -1095.55, y = -575.33, z = 82.41},
    ["Emerald Station"] = {x = 1524.11, y = 439.28, z = 90.68},
    ["Annesburg Station"] = {x = 2932.22, y = 1283.22, z = 44.65},
    ["Bacchus Station"] = {x = 569.95, y = 1678.96, z = 186.48},
    ["Benedict Point"] = {x = -5230.30, y = -3468.08, z = -21.00}
}

local function isLawmanOrBountyHunter(player)
    return Config.LawmenJobs[player.PlayerData.job.name] or player.PlayerData.job.name == "bountyhunter"
end
-- local function initializeWantedDatabase()
--     MySQL.query([[
--         CREATE TABLE IF NOT EXISTS wanted_players (
--             citizenid VARCHAR(50) PRIMARY KEY,
--             charName VARCHAR(255) NOT NULL,  -- Changed from 'name' to 'charName'
--             crime VARCHAR(255) NOT NULL,
--             bounty INT NOT NULL,
--             timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
--         )
--     ]])
-- end

local function safeDatabaseQuery(query, params, isInsert)
    local success, result = pcall(function()
        if isInsert then
            return MySQL.insert.await(query, params)
        else
            return MySQL.query.await(query, params)
        end
    end)
    
    if not success then
        print(string.format("[Database Error] Query failed: %s - Error: %s", query, tostring(result)))
        return false, nil
    end
    return true, result
end

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        --initializeWantedDatabase()
        
    end
end)

lib.callback.register('medics-tips:getOnlinePlayers', function(source)
    local players = {}
    for _, playerId in ipairs(GetPlayers()) do
        local player = RSGCore.Functions.GetPlayer(tonumber(playerId))
        if player then
            local charName = player.PlayerData.charinfo.firstname .. ' ' .. player.PlayerData.charinfo.lastname
            table.insert(players, {
                serverId = playerId,
                charName = charName,  
                citizenid = player.PlayerData.citizenid
            })
        end
    end
    return players
end)

-- RegisterNetEvent('medics-tips:server:addWantedPlayer')
-- AddEventHandler('medics-tips:server:addWantedPlayer', function(serverId, crime, bounty)
--     local src = source
--     local Player = RSGCore.Functions.GetPlayer(src)
--     if not Player or not isLawmanOrBountyHunter(Player) then return end
    
--     local Target = RSGCore.Functions.GetPlayer(tonumber(serverId))
--     if Target then
--         local charName = Target.PlayerData.charinfo.firstname .. ' ' .. Target.PlayerData.charinfo.lastname
--         MySQL.insert('INSERT INTO wanted_players (citizenid, charName, crime, bounty) VALUES (?, ?, ?, ?) ON DUPLICATE KEY UPDATE crime = ?, bounty = ?, timestamp = CURRENT_TIMESTAMP', {
--             Target.PlayerData.citizenid,
--             charName,
--             crime,
--             bounty,
--             crime,
--             bounty
--         })
        
        
--         local Players = RSGCore.Functions.GetPlayers()
--         for _, playerId in ipairs(Players) do
--             local targetPlayer = RSGCore.Functions.GetPlayer(playerId)
--             if targetPlayer and isLawmanOrBountyHunter(targetPlayer) then
--                 TriggerClientEvent('medics-tips:client:notifyWanted', playerId, {
--                     charName = charName,
--                     crime = crime,
--                     bounty = bounty
--                 })
--             end
--         end
--     end
-- end)

-- lib.callback.register('medics-tips:getWantedPlayers', function(source)
--     local Player = RSGCore.Functions.GetPlayer(source)
--     if not Player or not isLawmanOrBountyHunter(Player) then
--         print(string.format("[GetWantedPlayers] Player %d lacks permission or not found", source))
--         return {}
--     end
    
--     local success, wanted = safeDatabaseQuery(
--         'SELECT * FROM wanted_players ORDER BY timestamp DESC',
--         {},
--         false
--     )
    
--     if not success or not wanted then
--         print(string.format("[GetWantedPlayers] Database query failed for player %d", source))
--         return {}
--     end
    
--     local enhancedWanted = {}
--     for _, wantedPlayer in ipairs(wanted) do
--         local player = RSGCore.Functions.GetPlayerByCitizenId(wantedPlayer.citizenid)
--         table.insert(enhancedWanted, {
--             citizenid = wantedPlayer.citizenid,
--             charName = wantedPlayer.charName,
--             crime = wantedPlayer.crime,
--             bounty = wantedPlayer.bounty,
--             timestamp = wantedPlayer.timestamp,
--             serverId = player and player.PlayerData.source or nil
--         })
--     end
    
--     return enhancedWanted
-- end)

-- lib.callback.register('medics-tips:removeWantedPlayer', function(source, citizenid)
--     local Player = RSGCore.Functions.GetPlayer(source)
--     if not Player or not Config.LawmenJobs[Player.PlayerData.job.name] then return false end
    
--     local affectedRows = MySQL.update.await('DELETE FROM wanted_players WHERE citizenid = ?', { citizenid })
--     return affectedRows > 0
-- end)


local function initializeDatabase()
    MySQL.query([[
        CREATE TABLE IF NOT EXISTS medic_activities (
            id INT AUTO_INCREMENT PRIMARY KEY,
            activityType VARCHAR(255) NOT NULL,
            location VARCHAR(255) NOT NULL,
            coords VARCHAR(255), -- Store coordinates as JSON string
            timestamp DATETIME DEFAULT CURRENT_TIMESTAMP
        )
    ]])
end

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        initializeDatabase()
    end
end)


local function getNearestLocation(coords)
    local closestDistance = 999999.0
    local closestLocation = "Wilderness"
    
    for name, position in pairs(NamedLocations) do
        local distance = #(vector3(coords.x, coords.y, coords.z) - vector3(position.x, position.y, position.z))
        if distance < closestDistance then
            closestDistance = distance
            closestLocation = name
        end
    end
    
    
    if closestDistance <= 500.0 then
        return closestLocation
    else
        return "Wilderness"
    end
end


local function addDynamicLocation(locationName, coords)
    if not locationName or not coords then return false end
    
    NamedLocations[locationName] = coords
    return true
end


local function addCriminalActivity(activityType, coords)
    if not activityType or #activityType > 255 then
        return false, "Invalid activity type"
    end
    
    if not coords then
        return false, "Missing coordinates"
    end
    
    local location, distance = getNearestLocation(coords)
    local coordsJson = json.encode({x = coords.x, y = coords.y, z = coords.z})
    
    local success, result = safeDatabaseQuery(
        'INSERT INTO medic_activities (activityType, location, coords) VALUES (?, ?, ?)',
        {activityType, location, coordsJson},
        true
    )
    
    if not success then
        return false, "Database insertion failed"
    end
    
    -- Notify lawmen and create map blips
    local Players = RSGCore.Functions.GetPlayers()
    for _, playerId in ipairs(Players) do
        local Player = RSGCore.Functions.GetPlayer(playerId)
        if Player and Config.LawmenJobs[Player.PlayerData.job.name] then
            TriggerClientEvent('ox_lib:notify', playerId, {
                title = 'Medical Activity',
                description = string.format('Medical Emergency reported in %s: %s', location, activityType),
                type = 'inform',
                duration = CONFIG.NOTIFICATION_DURATION
            })
            
            -- Trigger client-side blip creation
            TriggerClientEvent('medics-tips:client:addActivityBlip', playerId, {
                coords = coords,
                location = location,
                activityType = activityType
            })
        end
    end
    
    return true, result
end

RegisterNetEvent('medics-tips:server:addCriminalActivity')
AddEventHandler('medics-tips:server:addCriminalActivity', function(description, _, coords)
    local src = source
    local activityType = description or "Suspicious Activity"
    
    local success = addCriminalActivity(activityType, coords)
    if not success then
        print("Failed to save criminal activity to database for player " .. src)
    end
end)


lib.callback.register('medics-tips:getActivities', function(source)
    local activities = MySQL.query.await('SELECT * FROM medic_activities ORDER BY timestamp DESC')
    if not activities then
       
        return nil
    end
    
   
    for _, activity in ipairs(activities) do
        if type(activity.timestamp) == "number" then
            local seconds = math.floor(activity.timestamp / 1000) -- Convert ms to seconds
            local formatted = os.date("%m/%d/%Y %H:%M", seconds) -- Format as MM/DD/YYYY HH:MM
            activity.formattedTimestamp = formatted
        else
            activity.formattedTimestamp = "Unknown time"
        end
    end
    
   
    return activities
end)

lib.callback.register('medics-tips:deleteActivity', function(source, activityId)
    local Player = RSGCore.Functions.GetPlayer(source)
    
    if not Player then
        print(string.format("[DeleteActivity] Error: No player found for source %d", source))
        return false
    end
    
    if not Config.LawmenJobs[Player.PlayerData.job.name] then
        print(string.format("[DeleteActivity] Error: Player %d (%s) lacks permission", source, Player.PlayerData.charinfo.firstname .. " " .. Player.PlayerData.charinfo.lastname))
        return false
    end
    
    if not activityId or type(activityId) ~= "number" then
        print(string.format("[DeleteActivity] Error: Invalid activityId '%s' from player %d", tostring(activityId), source))
        return false
    end
    
    local existsQuery = MySQL.query.await('SELECT id, coords FROM medic_activities WHERE id = ?', { activityId })
    if not existsQuery or #existsQuery == 0 then
        print(string.format("[DeleteActivity] Warning: Activity ID %d not found in database for player %d", activityId, source))
        return false
    end
    
    local success, error = pcall(function()
        return MySQL.update.await('DELETE FROM medic_activities WHERE id = ?', { activityId })
    end)
    
    if success and error > 0 then
        print(string.format("[DeleteActivity] Success: Deleted activity ID %d by player %d (%d rows affected)", activityId, source, error))
        
        -- Notify clients to remove blip
        local coords = json.decode(existsQuery[1].coords)
        local Players = RSGCore.Functions.GetPlayers()
        for _, playerId in ipairs(Players) do
            local targetPlayer = RSGCore.Functions.GetPlayer(playerId)
            if targetPlayer and Config.LawmenJobs[targetPlayer.PlayerData.job.name] then
                TriggerClientEvent('medics-tips:client:removeActivityBlip', playerId, coords)
            end
        end
        
        return true
    else
        print(string.format("[DeleteActivity] Error: Deletion failed for activity ID %d by player %d - %s", activityId, source, tostring(error)))
        return false
    end
end)

-- Exports
exports('addDynamicLocation', addDynamicLocation)
exports('addCriminalActivity', addCriminalActivity)
exports('getNearestLocation', getNearestLocation)