-- local CORE = exports[Config.Framework]:GetCoreObject()

-- RegisterServerEvent("ip_walkanim:getwalk")
-- AddEventHandler("ip_walkanim:getwalk", function()
--     local _source = source
--     local Player = CORE.Functions.GetPlayer(_source)
--     local citizenId = Player.PlayerData.citizenid
--     MySQL.Async.fetchScalar('SELECT walk FROM players WHERE citizenid = @citizenid', {['citizenid'] = citizenId}, function(result)
--         if result[1] then
--             local walk = result[1].walk
--             TriggerClientEvent("ip-walkanim:getwalk", _source, walk)
--         end
--     end)
-- end)

-- RegisterServerEvent("ip_walkanim:setwalk")
-- AddEventHandler("ip_walkanim:setwalk", function(animations)
--     local _source = source
--     local walk = animations
--     local Player = CORE.Functions.GetPlayer(_source)
--     local citizenId = Player.PlayerData.citizenid
--     MySQL.Async.execute("UPDATE players Set walk = @walk WHERE citizenid = @citizenid", {['walk'] = walk,['citizenid'] = citizenId})
-- end)

-- AddEventHandler('onResourceStart', function(resource)
-- 	if GetCurrentResourceName() ~= "bangdai-emotes" then
-- 		StopResource(resource)
--     end
-- end)


local CORE = exports[Config.Framework]:GetCoreObject()

-- GET walk style from database and send to client
RegisterServerEvent("ip_walkanim:getwalk")
AddEventHandler("ip_walkanim:getwalk", function()
    local src = source
    local Player = CORE.Functions.GetPlayer(src)
    if not Player then return end

    local citizenId = Player.PlayerData.citizenid

    MySQL.Async.fetchScalar('SELECT walk FROM players WHERE citizenid = @citizenid', {
        ['@citizenid'] = citizenId
    }, function(walk)
        if walk then
            TriggerClientEvent("ip-walkanim:getwalk", src, walk)
        end
    end)
end)

-- SET walk style in database
RegisterServerEvent("ip_walkanim:setwalk")
AddEventHandler("ip_walkanim:setwalk", function(animations)
    local src = source
    local Player = CORE.Functions.GetPlayer(src)
    if not Player then return end

    local citizenId = Player.PlayerData.citizenid

    MySQL.Async.execute("UPDATE players SET walk = @walk WHERE citizenid = @citizenid", {
        ['@walk'] = animations,
        ['@citizenid'] = citizenId
    })
end)
