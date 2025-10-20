-- Client-side script for MDT job restrictions
local RSGCore = exports['rsg-core']:GetCoreObject()

-- Client-side filter to restrict MDT access
exports.jo_mdt:registerFilter('canOpenMDT', function(canOpen)
    local Player = RSGCore.Functions.GetPlayerData()
    local playerJob = Player.job.name
    
    -- List of jobs allowed to use the MDT
    local allowedJobs = {
        ['doj'] = true,
        ['usms'] = true,
        ['naso'] = true,
        ['nhso'] = true,
        ['lso'] = true
    }
    
    -- Only allow access if player has an allowed job
    if allowedJobs[playerJob] then
        return true
    else
        RSGCore.Functions.Notify('You do not have access to the MDT', 'error')
        return false
    end
end)