local RSGCore = exports['rsg-core']:GetCoreObject()
lib.locale()

---------------------------------------------
-- warehouse storage
---------------------------------------------
RegisterServerEvent('rex-warehouse:server:openwarehouse', function(title, storagename, maxweight, slots, joblocked, allowedjobs)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    
    -- Check if warehouse is job locked
    if joblocked then
        local playerJob = Player.PlayerData.job.name
        local hasAccess = false
        
        -- Check if player's job is in the allowed jobs list
        for _, job in pairs(allowedjobs) do
            if playerJob == job then
                hasAccess = true
                break
            end
        end
        
        -- If player doesn't have access, send notification and return
        if not hasAccess then
            RSGCore.Functions.Notify(src, locale('no_access_job'), 'error', 3000)
            return
        end
    end
    
    local citizenid = Player.PlayerData.citizenid
    local data = { label = title, maxweight = maxweight, slots = slots }
    local stashName = citizenid..storagename
    exports['rsg-inventory']:OpenInventory(src, stashName, data)
end)