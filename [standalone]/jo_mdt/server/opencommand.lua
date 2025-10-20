-- Server-side script for MDT job restrictions
local RSGCore = exports['rsg-core']:GetCoreObject()

-- Server-side filter for MDT access checks
exports.jo_mdt:registerFilter('canGetMDT', function(canGet, source, stationKey)
    local Player = RSGCore.Functions.GetPlayer(source)
    
    if not Player then return false end
    
    local playerJob = Player.PlayerData.job.name
    
    -- List of jobs allowed to use the MDT
    local allowedJobs = {
        ['doj'] = true,
        ['usms'] = true,
        ['naso'] = true,
        ['nhso'] = true,
        ['lso'] = true
    }
    
    -- Check if player's job is in the allowed list
    return allowedJobs[playerJob] or false
end)