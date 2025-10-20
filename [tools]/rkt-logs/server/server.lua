RSGCore = exports['rsg-core']:GetCoreObject()

function SendWebhookEmbed(webhook,embed)
	if webhook ~= nil and webhook ~= "" then
        PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({embeds = embed}), { ['Content-Type'] = 'application/json' })
	end
end

local webhooks = {
    stashWebhook = '',
    vipsWebhook = '',
    vipHousesWebhook = '',
    vipItems = '',
    test = '',
    connectWebhook = 'https://discord.com/api/webhooks/1365180528009023578/for7GJDgPeOLStypH0BexHgFeaD0ry2r7-hkkVnoJhOGCIdwrTG303c9wjG6xy23vxTV',
    disconnectWebhook = 'https://discord.com/api/webhooks/1353085442576220252/oPgITx9cPgRQJEJPq4gplzJfUV_1R3eAOYJr58HZ2VZd7uzD0x_R1chNV3JzqI--Vd5W',
    killWebhook = 'https://discord.com/api/webhooks/1353085773229985802/8OugwT954gLAd9mblJmJNRA8j9qAhVfivcCVThaLIqV3x4tBNeOtjgF1Xcx57d1LwGIf',
    pagarWebhook = '',
    bancoWebhook = '',
   
    adminMoney = 'https://discord.com/api/webhooks/',
   

}

RegisterServerEvent('rkt:server:embed', function(webhook,embed)
    SendWebhookEmbed(webhooks[webhook],embed)
end)

RegisterNetEvent('logConnect', function()
    local src = source
    local playerIp = GetPlayerEndpoint(src)
    local playerPing = GetPlayerPing(src)
    local xPlayer = RSGCore.Functions.GetPlayer(src)
    local job = xPlayer.PlayerData.job.name
    local gang = xPlayer.PlayerData.gang.name
    local name =  xPlayer.PlayerData.charinfo.firstname.. " " ..xPlayer.PlayerData.charinfo.lastname
    local citizenid = xPlayer.PlayerData.citizenid
    --ocal steamName = GetPlayerName(src)
    --local steam = RSGCore.Functions.GetIdentifier(src, "steam")
    local discord = RSGCore.Functions.GetIdentifier(src, "discord")
    local license = RSGCore.Functions.GetIdentifier(src, "license")
    local embeds = { 
        { 
            title = string.upper(name).." "..'JOINED THE SERVER', 
            description = "",
            thumbnail = { url = "" },
            fields = {
                { name = "**CITIZENID**", value = "`" .. citizenid .. "` \n" },
                { name = "**SOURCE**", value = "`" .. src .. "` \n" }, 
                --{ name = "**STEAM**", value = "`" .. steamName .. "` \n" }, 
                { name = "**JOB**", value = "`" .. job .. "` \n" }, 
                { name = "**GANG**", value = "`" .. gang .. "` \n" },
                --{ name = "**STEAM**", value = "`" .. steam .. "` \n" }, 
                { name = "**DISCORD**", value = "`" .. discord .. "` \n" },
                { name = "**LICENSE**", value = "`" .. license .. "` \n" }, 
                { name = "**IP**", value = "`" .. playerIp .. "` \n" },
                { name = "**PING**", value = "`" .. playerPing .. "` \n" }, 
            },
            footer = { 
                text = os.date("\n[Data]: %d/%m/%Y [Hour]: %H:%M:%S"), 
                icon_url = ""
            }, 
            color = 5763719
        } 
    }
    TriggerEvent('rkt:server:embed','connectWebhook', embeds)
end)

AddEventHandler('playerDropped', function(reason)
    local src = source
    if not src then return end
    local playerIp = GetPlayerEndpoint(src)
    local playerPing = GetPlayerPing(src)
    local xPlayer = RSGCore.Functions.GetPlayer(src)
    if not xPlayer then return end
    local job = xPlayer.PlayerData.job.name
    local gang = xPlayer.PlayerData.gang.name
    local name =  xPlayer.PlayerData.charinfo.firstname.. " " ..xPlayer.PlayerData.charinfo.lastname
    local citizenid = xPlayer.PlayerData.citizenid
    --local steamName = GetPlayerName(src)
    --local steam = RSGCore.Functions.GetIdentifier(src, "steam")
    local discord = RSGCore.Functions.GetIdentifier(src, "discord")
    local license = RSGCore.Functions.GetIdentifier(src, "license")
    local coords = GetEntityCoords(GetPlayerPed(src))

    local embeds = { 
        { 
            title = string.upper(name).." "..'LEFT THE SERVER', 
            description = "",
            thumbnail = { url = "" },
            fields = { 
                { name = "**CITIZENID**", value = "`" .. citizenid .. "` \n" },
                { name = "**SOURCE**", value = "`" .. src .. "` \n" }, 
                --{ name = "**NOME STEAM**", value = "`" .. steamName .. "` \n" }, 
                { name = "**JOB**", value = "`" .. job .. "` \n" }, 
                { name = "**GANG**", value = "`" .. gang .. "` \n" },
                --{ name = "**STEAM**", value = "`" .. steam .. "` \n" }, 
                { name = "**DISCORD**", value = "`" .. discord .. "` \n" },
                { name = "**LICENSE**", value = "`" .. license .. "` \n" }, 
                { name = "**IP**", value = "`" .. playerIp .. "` \n" },
                { name = "**PING**", value = "`" .. playerPing .. "` \n" },
                { name = "**REASON**", value = "`" .. reason .. "` \n" },
                { name = "**COORDS**", value = "`" .. coords .. "` \n" },
            },
            footer = { 
                text = os.date("\n[Data]: %d/%m/%Y [HOUR]: %H:%M:%S"), 
                icon_url = ""
            }, 
            color = 15548997
        } 
    }
    TriggerEvent('rkt:server:embed','disconnectWebhook', embeds)
end)

AddEventHandler('chatMessage', function(source, name, message)
    PerformHttpRequest('YOUR_WEBHOOK', function(err, text, headers) end, 'POST', json.encode({embeds={{title="__**Chat Logs**__",description="\nPlayer name: "..name.. "`["..source.."]`\nType: "..message.."",color=16711680}}}), { ['Content-Type'] = 'application/json' })
end)

-- RegisterServerEvent('rkt-logs:aimlogs')
-- AddEventHandler('rkt-logs:aimlogs', function(pedId)
--     local name,id = GetPlayerName(source), QBCore.Functions.GetPlayer(source)
--     local tname,tid = GetPlayerName(pedId), ESX.GetPlayerFromId(pedId)

--     PerformHttpRequest('YOUR_WEBHOOK', function(err, text, headers) end, 'POST', json.encode({embeds={{title="__**Aim Logs**__",description="\nPlayer name: "..name.. "`["..id.source.."]`\nIs aiming: "..tname.." `["..tid.source.."]`",color=16711680}}}), { ['Content-Type'] = 'application/json' })
-- end)

RegisterServerEvent('rkt-logs:killlogs')
AddEventHandler('rkt-logs:killlogs', function(killer, reason, weapon)
    if killer == 0 then killer = source end
    if weapon == nil then weapon = 'none' end
    if reason == nil then reason = 'none' end
    if not source then return end
    local src = source
    local xPlayer = RSGCore.Functions.GetPlayer(src)
    local job = xPlayer.PlayerData.job.name
    local gang = xPlayer.PlayerData.gang.name
    local name =  xPlayer.PlayerData.charinfo.firstname.. " " ..xPlayer.PlayerData.charinfo.lastname
    local citizenid = xPlayer.PlayerData.citizenid
    --local steamName = GetPlayerName(src)
    --local steam = RSGCore.Functions.GetIdentifier(src, "steam")
    local discord = RSGCore.Functions.GetIdentifier(src, "discord")
    local license = RSGCore.Functions.GetIdentifier(src, "license")

    local killer = tonumber(killer)

    local xKiller = RSGCore.Functions.GetPlayer(killer)
    local killerJob = xKiller.PlayerData.job.name
    local killerGang = xKiller.PlayerData.gang.name
    local killerName =  xKiller.PlayerData.charinfo.firstname.. " " ..xKiller.PlayerData.charinfo.lastname
    local killerCitizenid = xKiller.PlayerData.citizenid
    --local killerSteamName = GetPlayerName(killer)
    --local killerSteam = RSGCore.Functions.GetIdentifier(killer, "steam")
    local killerDiscord = RSGCore.Functions.GetIdentifier(killer, "discord")
    local killerLicense = RSGCore.Functions.GetIdentifier(killer, "license")

    local embeds = { 
        { 
            title = 'DEATHS', 
            description = "",
            thumbnail = { url = "" },
            fields = { 
                { name = "**DIED**", value = "`" .. name .. "` \n" },
                { name = "**CITIZENID/**", value = "`" .. citizenid .. "` \n" },
                { name = "**SOURCE**", value = "`" .. src .. "` \n" }, 
                --{ name = "**STEAM**", value = "`" .. steamName .. "` \n" }, 
                { name = "**JOB**", value = "`" .. job .. "` \n" }, 
                { name = "**GANG**", value = "`" .. gang .. "` \n" },
                --{ name = "**STEAM**", value = "`" .. steam .. "` \n" }, 
                { name = "**DISCORD**", value = "`" .. discord .. "` \n" },
                { name = "**LICENSE**", value = "`" .. license .. "` \n" }, 
                {name = "\u{200B}", value = "\u{200B}"}, -- Separator
                { name = "**KILLER**", value = "`" .. killerName .. "` \n" },
                { name = "**CITIZENID**", value = "`" .. killerCitizenid .. "` \n" },
                { name = "**SOURCE**", value = "`" .. killer .. "` \n" }, 
                --{ name = "**STEAM NAME**", value = "`" .. killerSteamName .. "` \n" }, 
                { name = "**EMPREGO**", value = "`" .. killerJob .. "` \n" }, 
                { name = "**GANG**", value = "`" .. killerGang .. "` \n" },
                --{ name = "**STEAM**", value = "`" .. killerSteam .. "` \n" }, 
                { name = "**DISCORD**", value = "`" .. killerDiscord .. "` \n" },
                { name = "**LICENSE**", value = "`" .. killerLicense .. "` \n" }, 
                {name = "\u{200B}", value = "\u{200B}"}, -- Separator
                { name = "**REASON**", value = "`" .. reason .. "` \n" },
                { name = "**USED WEAPON**", value = "`" .. weapon .. "` \n" },
            },
            footer = { 
                text = os.date("\n[Data]: %d/%m/%Y [Hours]: %H:%M:%S"), 
                icon_url = ""
            }, 
            color = 16705372
        } 
    }
    TriggerEvent('rkt:server:embed','killWebhook', embeds)
end)

RegisterServerEvent('rkt-logs:paymentCash', function(xPlayer, xTarget, amount)
    local src = tonumber(xPlayer)
    local killer = tonumber(xTarget)
    local xPlayer = RSGCore.Functions.GetPlayer(xPlayer)
    local job = xPlayer.PlayerData.job.name
    local gang = xPlayer.PlayerData.gang.name
    local name =  xPlayer.PlayerData.charinfo.firstname.. " " ..xPlayer.PlayerData.charinfo.lastname
    local citizenid = xPlayer.PlayerData.citizenid
    --local steamName = GetPlayerName(src)
   -- local steam = RSGCore.Functions.GetIdentifier(src, "steam")
    local discord = RSGCore.Functions.GetIdentifier(src, "discord")
    local license = RSGCore.Functions.GetIdentifier(src, "license")

    local xKiller = RSGCore.Functions.GetPlayer(killer)
    local killerJob = xKiller.PlayerData.job.name
    local killerGang = xKiller.PlayerData.gang.name
    local killerName =  xKiller.PlayerData.charinfo.firstname.. " " ..xKiller.PlayerData.charinfo.lastname
    local killerCitizenid = xKiller.PlayerData.citizenid
    --local killerSteamName = GetPlayerName(killer)
   -- local killerSteam = RSGCore.Functions.GetIdentifier(killer, "steam")
    local killerDiscord = RSGCore.Functions.GetIdentifier(killer, "discord")
    local killerLicense = RSGCore.Functions.GetIdentifier(killer, "license")

    local embeds = { 
        { 
            title = 'GAVE MONEY $'..amount, 
            description = "",
            thumbnail = { url = "" },
            fields = { 
                { name = "**PAYER**", value = "`" .. name .. "` \n" },
                { name = "**CITIZENID/RG**", value = "`" .. citizenid .. "` \n" },
                { name = "**SOURCE**", value = "`" .. src .. "` \n" }, 
                --{ name = "**NOME STEAM**", value = "`" .. steamName .. "` \n" }, 
                { name = "**JOB**", value = "`" .. job .. "` \n" }, 
                { name = "**GANG**", value = "`" .. gang .. "` \n" },
                --{ name = "**STEAM**", value = "`" .. steam .. "` \n" }, 
                { name = "**DISCORD**", value = "`" .. discord .. "` \n" },
                { name = "**LICENSE**", value = "`" .. license .. "` \n" }, 
                {name = "\u{200B}", value = "\u{200B}"}, -- Separator
                { name = "**RECEIVER**", value = "`" .. killerName .. "` \n" },
                { name = "**CITIZENID/RG**", value = "`" .. killerCitizenid .. "` \n" },
                { name = "**SOURCE**", value = "`" .. killer .. "` \n" }, 
                --{ name = "**STEAM NAME**", value = "`" .. killerSteamName .. "` \n" }, 
                { name = "**JOB**", value = "`" .. killerJob .. "` \n" }, 
                { name = "**GANG**", value = "`" .. killerGang .. "` \n" },
                --{ name = "**STEAM**", value = "`" .. killerSteam .. "` \n" }, 
                { name = "**DISCORD**", value = "`" .. killerDiscord .. "` \n" },
                { name = "**LICENSE**", value = "`" .. killerLicense .. "` \n" }, 
                {name = "\u{200B}", value = "\u{200B}"}, -- Separator
            },
            footer = { 
                text = os.date("\n[Data]: %d/%m/%Y [HOUR]: %H:%M:%S"), 
                icon_url = ""
            }, 
            color = 16705372
        } 
    }
    TriggerEvent('rkt:server:embed','pagarWebhook', embeds)
end)

-- CreateThread(function ()
--     local hookId = exports.ox_inventory:registerHook('swapItems', function(payload)
--         -- print(json.encode(payload, { indent = true }))
--         if  payload.fromType == 'player' and payload.toType == 'glovebox' then
--             local plate = payload.toInventory:gsub("glove", "")
--             local data = {
--                 src = payload.source,
--                 amount = payload.count,
--                 item = payload.fromSlot.label,
--                 weight = payload.weight,
--                 from = payload.fromInventory,
--                 to = payload.toInventory,
--                 action = 'Added to Glovebox '..'  \nPLATE:'..plate..' ',
--                 color = 5793266
--             }
--             stashLogs(data)
--         end

--         if  payload.fromType == 'glovebox' and payload.toType == 'player' then
--             local plate = payload.fromInventory:gsub("glove", "")
--             local data = {
--                 src = payload.source,
--                 amount = payload.count,
--                 item = payload.fromSlot.label,
--                 weight = payload.weight,
--                 from = payload.fromInventory,
--                 to = payload.toInventory,
--                 action = 'Removed from Glovebox '..'  \nPLATE:'..plate..' ',
--                 color = 15418782
--             }
--             stashLogs(data)
--         end

--         if  payload.fromType == 'player' and payload.toType == 'trunk' then
--             local plate = payload.toInventory:gsub("trunk", "")
--             local data = {
--                 src = payload.source,
--                 amount = payload.count,
--                 item = payload.fromSlot.label,
--                 weight = payload.weight,
--                 from = payload.fromInventory,
--                 to = payload.toInventory,
--                 action = 'Added to Trunk '..'  \nPLATE:'..plate..' ',
--                 color = 5793266
--             }
--             stashLogs(data)
--         end

--         if  payload.fromType == 'trunk' and payload.toType == 'player' then
--             local plate = payload.fromInventory:gsub("trunk", "")
--             local data = {
--                 src = payload.source,
--                 amount = payload.count,
--                 item = payload.fromSlot.label,
--                 weight = payload.weight,
--                 from = payload.fromInventory,
--                 to = payload.toInventory,
--                 action = 'Removed from Trunk '..'  \nPLATE:'..plate..' ',
--                 color = 15418782
--             }
--             stashLogs(data)
--         end

--         if payload.toInventory == payload.fromInventory then
--             local data = {
--                 src = payload.source,
--                 amount = payload.count,
--                 item = payload.fromSlot.label,
--                 weight = payload.weight,
--                 from = payload.fromInventory,
--                 to = payload.toInventory,
--                 action = 'Moveu no inventário',
--                 color = 16705372
--             }
--             stashLogs(data)
--         end
        
--         if payload.toType == 'player' then
--             local action = 'Removed'
--             local color = 15548997

--             if payload.fromType == 'drop' then
--                 action = 'Added'
--                 color = 5763719
--             end
--             local data = {
--                 src = payload.source,
--                 amount = payload.count,
--                 item = payload.fromSlot.label,
--                 weight = payload.weight,
--                 from = payload.fromInventory,
--                 to = payload.toInventory,
--                 action = action,
--                 color = color
--             }
--             stashLogs(data)
--         end

--         if payload.toType == 'drop' then
--             local data = {
--                 src = payload.source,
--                 amount = payload.count,
--                 item = payload.fromSlot.label,
--                 weight = payload.weight,
--                 from = payload.fromInventory,
--                 to = payload.toInventory,
--                 action = 'DROPPED',
--                 color = 15548997
--             }
--             stashLogs(data)
--         end

--         if payload.toType == 'stash' then
--             local data = {
--                 src = payload.source,
--                 amount = payload.count,
--                 item = payload.fromSlot.label,
--                 weight = payload.weight,
--                 from = payload.fromInventory,
--                 to = payload.toInventory,
--                 action = 'Added',
--                 color = 5763719
--             }
--             stashLogs(data)
--         end
--         return true
--     end, {
--         typeFilter = {
--             ['stash'] = true,
--             ['player'] = true,
--             ['drop'] = true,
--             ['glovebox'] = true,
--             ['trunk'] = true,
--         }
--     })
-- end)

-- CreateThread(function ()
--     local hookId = exports.ox_inventory:registerHook('swapItems', function(payload)
--         print(json.encode(payload, { indent = true }))
        
--     end, {
--         typeFilter = {
--             ['glovebox'] = true,
--             ['trunk'] = true,
--         }
--     })
-- end)

function stashLogs(data)
    local src = data.src
    if not src then return end
    local xPlayer = RSGCore.Functions.GetPlayer(src)
    local job = xPlayer.PlayerData.job.name
    local gang = xPlayer.PlayerData.gang.name
    local name =  xPlayer.PlayerData.charinfo.firstname.. " " ..xPlayer.PlayerData.charinfo.lastname
    local citizenid = xPlayer.PlayerData.citizenid
    --local steamName = GetPlayerName(src)
    --local steam = RSGCore.Functions.GetIdentifier(src, "steam")
    local discord = RSGCore.Functions.GetIdentifier(src, "discord")
    local license = RSGCore.Functions.GetIdentifier(src, "license")

    local embeds = { 
        { 
            title = string.upper(name).." "..string.upper(data.action)..string.upper(' '..data.amount..'x '..data.item), 
            description = "",
            thumbnail = { url = "" },
            fields = {
                { name = "**CITIZENID**", value = "`" .. citizenid .. "` \n" },
                { name = "**SOURCE**", value = "`" .. src .. "` \n" }, 
                --{ name = "**STEAM NAME**", value = "`" .. steamName .. "` \n" }, 
                { name = "**JOB**", value = "`" .. job .. "` \n" }, 
                { name = "**GANG**", value = "`" .. gang .. "` \n" },
                --{ name = "**STEAM**", value = "`" .. steam .. "` \n" }, 
                { name = "**DISCORD**", value = "`" .. discord .. "` \n" },
                { name = "**LICENSE**", value = "`" .. license .. "` \n" }, 
                { name = "**INFOS**", value = "`" ..'FROM SOURCE/STASH/DROP: '..data.from..' \nTO SOURCE/STASH/DROP: '..data.to..' \nAmount '..data.amount..' x ' ..data.item .. "` \n" },
            },
            footer = { 
                text = os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S"), 
                icon_url = ""
            }, 
            color = data.color
        } 
    }
    TriggerEvent('rkt:server:embed','invWebhook', embeds)
end

RegisterNetEvent('logs:server:moneyCommands', function(data)
    local src = data.target
    if not src then return end
    if not data.src then return end
    local staff = GetPlayerName(data.src)
    local staffDisc = RSGCore.Functions.GetIdentifier(data.src, "discord")
    local xPlayer = RSGCore.Functions.GetPlayer(src)
    local job = xPlayer.PlayerData.job.name
    local gang = xPlayer.PlayerData.gang.name
    local name =  xPlayer.PlayerData.charinfo.firstname.. " " ..xPlayer.PlayerData.charinfo.lastname
    local citizenid = xPlayer.PlayerData.citizenid
    --local steamName = GetPlayerName(src)
    --local steam = RSGCore.Functions.GetIdentifier(src, "steam")
    local discord = RSGCore.Functions.GetIdentifier(src, "discord")
    local license = RSGCore.Functions.GetIdentifier(src, "license")

    local embeds = { 
        { 
            title = string.upper(staff).." "..string.upper(data.type)..string.upper(' '..data.amount..' IN '.. data.whare..' TO ' .. steamName), 
            description = "",
            thumbnail = { url = "" },
            fields = {
                { name = "*DISCORD STAFF*", value = "`" .. staffDisc .. "` \n" },
                { name = "**CITIZENID/RG**", value = "`" .. citizenid .. "` \n" },
                { name = "**SOURCE**", value = "`" .. src .. "` \n" }, 
                --{ name = "**NOME STEAM**", value = "`" .. steamName .. "` \n" }, 
                { name = "**JOB**", value = "`" .. job .. "` \n" }, 
                { name = "**GANG**", value = "`" .. gang .. "` \n" },
                --{ name = "**STEAM**", value = "`" .. steam .. "` \n" }, 
                { name = "**DISCORD**", value = "`" .. discord .. "` \n" },
                { name = "**LICENSE**", value = "`" .. license .. "` \n" }, 
            },
            footer = { 
                text = os.date("\n[Data]: %d/%m/%Y [Hours]: %H:%M:%S"), 
                icon_url = ""
            }, 
            color = data.color
        } 
    }
    TriggerEvent('rkt:server:embed','adminMoney', embeds)
end)


RegisterNetEvent('logs:server:itemCommands', function(data)
    local src = tonumber(data.target)
    if not src then return end
    if not data.src then return end
    local staff = GetPlayerName(data.src)
    local staffDisc = RSGCore.Functions.GetIdentifier(data.src, "discord")
    local xPlayer = RSGCore.Functions.GetPlayer(src)
    local job = xPlayer.PlayerData.job.name
    local gang = xPlayer.PlayerData.gang.name
    local name =  xPlayer.PlayerData.charinfo.firstname.. " " ..xPlayer.PlayerData.charinfo.lastname
    local citizenid = xPlayer.PlayerData.citizenid
    --local steamName = GetPlayerName(src)
    --local steam = RSGCore.Functions.GetIdentifier(src, "steam")
    local discord = RSGCore.Functions.GetIdentifier(src, "discord")
    local license = RSGCore.Functions.GetIdentifier(src, "license")

    local embeds = { 
        { 
            title = string.upper(staff).." ADDED ITEM "..amount..'x '..item..' TO.', 
            description = "",
            thumbnail = { url = "" },
            fields = {
                { name = "*DISCORD STAFF*", value = "`" .. staffDisc .. "` \n" },
                { name = "**CITIZENID**", value = "`" .. citizenid .. "` \n" },
                { name = "**SOURCE**", value = "`" .. src .. "` \n" }, 
                --{ name = "**STEAM NAME**", value = "`" .. steamName .. "` \n" }, 
                { name = "**JOB**", value = "`" .. job .. "` \n" }, 
                { name = "**GANG**", value = "`" .. gang .. "` \n" },
                --{ name = "**STEAM**", value = "`" .. steam .. "` \n" }, 
                { name = "**DISCORD**", value = "`" .. discord .. "` \n" },
                { name = "**LICENSE**", value = "`" .. license .. "` \n" }, 
            },
            footer = { 
                text = os.date("\n[Data]: %d/%m/%Y [Hora]: %H:%M:%S"), 
                icon_url = ""
            }, 
            color = data.color
        } 
    }
    TriggerEvent('rkt:server:embed','adminItem', embeds)
end)