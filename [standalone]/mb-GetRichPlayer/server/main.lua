RSGCore = exports['rsg-core']:GetCoreObject()

function sendToDiscord(message) --Functions to send the log to discord
    local time = os.date("*t")

    local embed = {
            {
                ["color"] = Config.LogColour, --Set color
                ["author"] = {
                    ["icon_url"] = Config.AvatarURL, -- et avatar
                    ["name"] = Config.ServerName, --Set name
                },
                ["title"] = "**".. Config.LogTitle .."**", --Set title
                ["description"] = message, --Set message
                ["footer"] = {
                    ["text"] = '' ..time.year.. '/' ..time.month..'/'..time.day..' '.. time.hour.. ':'..time.min, --Get time
                },
            }
        }

    PerformHttpRequest(Config.WebHook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = embed}), { ['Content-Type'] = 'application/json' })
end

Citizen.CreateThread(function()
    while (Config.SendLogByTime.enable) do
        Citizen.Wait(Config.SendLogByTime.time * (60 * 1000)) --Wait time before trigger the event
        TriggerEvent("mb-GetRichPlayer:server:sendLog") --Trigger sending log event
    end
end)

--Admin command to trigger the event without waititng for the timer or simply you disable the auto log feature
RSGCore.Commands.Add(Lang:t("command.name"), Lang:t("command.help"), {}, false, function()
    if (Config.OnlyTopRichest.enable) then
        TriggerEvent("mb-GetRichPlayer:server:getTopPlayerMoney", Config.LogMessageType)
    else
        TriggerEvent("mb-GetRichPlayer:server:getAllPlayerMoney", Config.LogMessageType)
    end
end, 'admin')

--- Event for TOP RICHEST ONLY
-- Event for TOP RICHEST ONLY
RegisterNetEvent("mb-GetRichPlayer:server:getTopPlayerMoney", function(type)
    local query = "SELECT `name`, `money`, `citizenid`, `license`, JSON_VALUE(money, '$.cash') AS `cash`, JSON_VALUE(money, '$.bank') AS `bank`, JSON_VALUE(money, '$.valbank') AS `valbank`, JSON_VALUE(money, '$.blkbank') AS `blkbank`, JSON_VALUE(money, '$.rhobank') AS `rhobank`, JSON_VALUE(money, '$.armbank') AS `armbank`, JSON_VALUE(money, '$.bloodmoney') AS `bloodmoney`, (JSON_VALUE(money, '$.cash') + JSON_VALUE(money, '$.bank') + JSON_VALUE(money, '$.valbank') + JSON_VALUE(money, '$.blkbank') + JSON_VALUE(money, '$.rhobank') + JSON_VALUE(money, '$.armbank') + JSON_VALUE(money, '$.bloodmoney')) AS `total_money` FROM `players` ORDER BY `total_money` DESC LIMIT ?"
    local topRichestPlayers = MySQL.Sync.fetchAll(query, {Config.OnlyTopRichest.top})
    local resultWithLicense = ''

    for _, v in pairs(topRichestPlayers) do
        local formattedMessage = string.format(
            "%d. %s (%s) | license:%s | Cash: $%.2f | Bank: $%.2f | ValBank: $%.2f | BLKBank: $%.2f | RHOBank: $%.2f | ARMBank: $%.2f | BloodMoney: $%.2f | TOTAL MONEY: $%.2f",
            _, 
            v["name"], 
            v["citizenid"], 
            v["license"], 
            v["cash"], 
            v["bank"], 
            v["valbank"], 
            v["blkbank"], 
            v["rhobank"], 
            v["armbank"], 
            v["bloodmoney"], 
            v["total_money"]
        )
        resultWithLicense = resultWithLicense .. "`" .. formattedMessage .. "`\n"
    end

    sendToDiscord(resultWithLicense) -- Send log to discord
end)

-- Event for ALL PLAYER
RegisterNetEvent("mb-GetRichPlayer:server:getAllPlayerMoney", function(type)
    local query = "SELECT `name`, `money`, `citizenid`, `license`, JSON_VALUE(money, '$.cash') AS `cash`, JSON_VALUE(money, '$.bank') AS `bank`, JSON_VALUE(money, '$.valbank') AS `valbank`, JSON_VALUE(money, '$.blkbank') AS `blkbank`, JSON_VALUE(money, '$.rhobank') AS `rhobank`, JSON_VALUE(money, '$.armbank') AS `armbank`, JSON_VALUE(money, '$.bloodmoney') AS `bloodmoney`, (JSON_VALUE(money, '$.cash') + JSON_VALUE(money, '$.bank') + JSON_VALUE(money, '$.valbank') + JSON_VALUE(money, '$.blkbank') + JSON_VALUE(money, '$.rhobank') + JSON_VALUE(money, '$.armbank') + JSON_VALUE(money, '$.bloodmoney')) AS `total_money` FROM `players`"
    local topRichestPlayers = MySQL.Sync.fetchAll(query)
    local resultWithLicense = ''

    for _, v in pairs(topRichestPlayers) do
        local formattedMessage = string.format(
            "%d. %s (%s) | license:%s | Cash: $%.2f | Bank: $%.2f | ValBank: $%.2f | BLKBank: $%.2f | RHOBank: $%.2f | ARMBank: $%.2f | BloodMoney: $%.2f | TOTAL MONEY: $%.2f",
            _, 
            v["name"], 
            v["citizenid"], 
            v["license"], 
            v["cash"], 
            v["bank"], 
            v["valbank"], 
            v["blkbank"], 
            v["rhobank"], 
            v["armbank"], 
            v["bloodmoney"], 
            v["total_money"]
        )
        resultWithLicense = resultWithLicense .. "`" .. formattedMessage .. "`\n"
    end

    sendToDiscord(resultWithLicense) -- Send log to discord
end)




-- You can continue the same pattern for `standard` and `short` types


--Auto send log to discord
RegisterNetEvent("mb-GetRichPlayer:server:sendLog", function()
    if (Config.OnlyTopRichest.enable) then
        TriggerEvent("mb-GetRichPlayer:server:getTopPlayerMoney", Config.LogMessageType)
    else
        TriggerEvent("mb-GetRichPlayer:server:getAllPlayerMoney", Config.LogMessageType)
    end
end)