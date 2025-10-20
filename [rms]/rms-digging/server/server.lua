-- SERVER SIDE --

local RSGCore = exports['rsg-core']:GetCoreObject()

---------------------------------
-- give reward item
---------------------------------
RegisterNetEvent('rex-digging:server:givereward', function(digtype, outlawstatus)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    
    if not Player then return end
    
    local citizenid = Player.PlayerData.citizenid
    local firstName = Player.PlayerData.charinfo.firstname or "Unknown"
    local lastName = Player.PlayerData.charinfo.lastname or "Unknown"
    local fullName = firstName .. ' ' .. lastName
    
    if digtype == 'grave' then
        local randomItem = Config.GraveyardItems[math.random(#Config.GraveyardItems)]
        Player.Functions.AddItem(randomItem, 1)
        TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items[randomItem], 'add', 1)
        
        -- Log the grave robbing event (FIXED - missing closing parenthesis)
        TriggerEvent("rsg-log:server:CreateLog", "graverobbery", "Grave Robbery", "red",
            "**[GRAVE ROBBERY]** " .. fullName .. " (" .. citizenid .. ") robbed a grave and found **" .. randomItem .. "**"
        )
        
        -- update outlaw status
        -- (Your existing outlaw status code would go here)
    end
end)

---------------------------------
-- Handle law alerts (NEW - to fix the alert issue)
---------------------------------
RegisterNetEvent('rsg-lawman:server:lawmanAlert', function(coords, message)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    
    if not Player then return end
    
    local Players = RSGCore.Functions.GetPlayers()
    
    for i = 1, #Players do
        local LawPlayer = RSGCore.Functions.GetPlayer(Players[i])
        if LawPlayer then
            local jobType = LawPlayer.PlayerData.job.type
            -- Check if player has a law enforcement job type
            if jobType == 'leo' then
                -- Send alert only to law enforcement
                TriggerClientEvent('rsg-lawman:client:lawmanAlert', Players[i], coords, message)
            end
        end
    end
end)

lib.callback.register('rex-digging:server:checkLawmen',function(source)

    local lawcount = 0
    local players = RSGCore.Functions.GetRSGPlayers()
    for k, v in pairs(players) do
        if v.PlayerData.job.type == 'leo' and v.PlayerData.job.onduty then
            lawcount = lawcount + 1
        end
    end
    return lawcount
end)