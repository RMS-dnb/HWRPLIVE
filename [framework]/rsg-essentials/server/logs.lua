local RSGCore = exports['rsg-core']:GetCoreObject()
lib.locale()

local Webhooks = {
    ['default'] = '',
    ['givemoney'] = 'https://discord.com/api/webhooks/1356454310682038524/nUB1HbS4IoWXLSuZFeF5mU0Y-IXPnvR6A4aa9g2C02vGQsTcnhH_hCRmIeiqMIOiuE54',
    ['anticheat'] = 'https://discord.com/api/webhooks/1353082452754694238/sbvi7-81Tu9B9JWRjJx_k9w9zXqSejpFTBpkPVmajoR4yMr7WFtbnHw1sRH01u9IBe47',
    ['levels'] = '',
    ['playermoney'] = 'https://discord.com/api/webhooks/1353082544991768586/sUCLg0v6NtV3aET46vIcJcYWb6iLBWGMQ2u5sFED18TjySAC6I5P0Bih7lxm8ZmVy0i7',
    -- ['joinleave'] = 'https://discord.com/api/webhooks/1365180528009023578/for7GJDgPeOLStypH0BexHgFeaD0ry2r7-hkkVnoJhOGCIdwrTG303c9wjG6xy23vxTV',
    ['banking'] = 'https://discord.com/api/webhooks/1353084033931808850/9RvpqmWSuH7YXcW4j1-NRI80V4X8f2KtDVnSGOor8tBBR9G0CxUs-F16mr2cH7JbT-fF',
    ['ooc'] = 'https://discord.com/api/webhooks/1353084708384149544/uwcP1CpfW44zOgygE6-RhYGK2RszzIvA7dd5FZp88r7mXptJ87zetnrUz6Hl9ohaTzQO',
    ['playerinventory'] = 'https://discord.com/api/webhooks/1353084759332487329/uNJI-JewWnkyNSfBg5pVTrOfDRZyq2yprKxJREsEiZy0ziPd_G_spDFqXyhdWtpAsQSL',
    ['playerinventoryset'] = 'https://discord.com/api/webhooks/1368653206502248531/gTMFXuMFIQcVEysqzCx0mBwzWiZNsYtamK1n0Lxqg6iFLro9F99lUyM_9FK7vTYg3RQ7',
    ['playerinventoryclear'] = 'https://discord.com/api/webhooks/1368653775882944544/kGa5qdQGZebSnlNgTTeQBwTaqI8kgWCsVDnqOwD-z4YmYppI5nYBftkSo0rDSifxMSkh',
    ['playerinventoryitemadd'] = 'https://discord.com/api/webhooks/1368654463971233883/BqdENuir7-eu5TiAEgtVi5-gYtWxvu8fq770OkMOuIOPQVIpbToqYqiiLd220s-_XzxH',
    ['playerinventoryitemremove'] = 'https://discord.com/api/webhooks/1368654855836799006/rP9Qcz2fyrdUPQGMQldJJGNeHkD1_qf8lVhhm--qhD9ONeV8-HLCMo5A6te4ke03ejVB',
    ['robbing'] = 'https://discord.com/api/webhooks/1353084837111791626/q6gZshvYW7RPMgjHu7jfKYz5es2wnkOpYk1j14pU11UVvKlQeJz_8-Fq-cBwqzqIXypn',
    ['stash'] = 'https://discord.com/api/webhooks/1353084899631824970/jjf47RqH7bwFd8vw9AwQmCn5jUPAy0Nnr6n8204qOAxaJ8P914LDigEy9hRYDJGhu369',
    ['drop'] = 'https://discord.com/api/webhooks/1353084955261009920/rmkv5WRwzXwVyFNjumIYd1DbPMQc7OPrHuG6Pyob2OxteMG71OKFXgAYx5dO6hqnLb5k',
    ['dealers'] = '',
    ['shops'] = 'https://discord.com/api/webhooks/1353085025381515275/XH6piOVIAzKHzrXYqQ7v-Cm2RFwOpEkcRtwaPNeWkKaUeSZUqEzLTk3Z48v2f2hcI2Do',
    ['bans'] = 'https://discord.com/api/webhooks/1353085086324752414/dw4lz5PAw31bbjskjzNiyiu84ggaCpsh8f9rXk3Gx1tBevMIpPkqSdmhj7SmBRfEyXqA',
    ['bossmenu'] = 'https://discord.com/api/webhooks/1353085180734345429/kQISH6f4TmiXs6dGK5q62qP7GH_Qkjimd9MPjlFUGCQ5sjxnBqovJhhGml7bEkRad_a9',
    ['gangmenu'] = 'https://discord.com/api/webhooks/1353085224623542312/fx_tOjc0fbC5gypaMyyhQaLjPdsm7pxfuQVWXr0zNPzKJLGTOQhTYTz6R-5MRX33RuNk',
    ['fishing'] = 'https://discord.com/api/webhooks/1353085273323606026/W9QiYk3S3D101T53A802ZS4ra0VfOuZ2XXJhiDZ4pZ0wSk0eGTmcQAHJNCeFIoOY2SzP',
    ['goldpanning'] = 'https://discord.com/api/webhooks/1353085273323606026/W9QiYk3S3D101T53A802ZS4ra0VfOuZ2XXJhiDZ4pZ0wSk0eGTmcQAHJNCeFIoOY2SzP',
    ['loot'] = 'https://discord.com/api/webhooks/1353085442576220252/oPgITx9cPgRQJEJPq4gplzJfUV_1R3eAOYJr58HZ2VZd7uzD0x_R1chNV3JzqI--Vd5W',
    ['hotel'] = 'https://discord.com/api/webhooks/1353085551044984842/GS9u1rZvg4y97Yww5WgHzvYG3Q1cCWj3hunvSz90gfrOrwONQaFho0pxHUKn-iKoS-HA',
    ['beekeeper'] = '',
    ['ranch'] = '',
    ['adminmenu'] = 'https://discord.com/api/webhooks/1353085629709160458/NVoDlxfORQ2JR_5AAQjqE1GB_yc2gxf_fHjZ5a9kSrw0xM3Gsw0Jtw4p48rdGyzhhRPB',
    ['warehouse'] = 'https://discord.com/api/webhooks/1366967851378020412/mq5TspOjhwUcW9oOQI0JKmEXpkQhMaS4gtWBZWFl_aGHX5SOceiFTesJcp0PHh1fI8wa',
    ['horsetrainer'] = '',
    ['crafting'] = 'https://discord.com/api/webhooks/1353085728224968744/U8b58sh3H6rLAj0KkZ53whtJrgknqXuHxWEbein_5aoO4l2lAsecNoxNQZSgt8hzlF0E',
    ['death'] = 'https://discord.com/api/webhooks/1353085773229985802/8OugwT954gLAd9mblJmJNRA8j9qAhVfivcCVThaLIqV3x4tBNeOtjgF1Xcx57d1LwGIf',
    
    ['rextrapper'] = 'https://discord.com/api/webhooks/1355283914427465888/GYT-PCo5-3_jXaMkvP9-Q2nMnzEQcrs0h3rqlDS5ozedWC0ZwM_912sgQX9Gx9SNsY7Z',
    ['rexhouses'] = 'https://discord.com/api/webhooks/1353085551044984842/GS9u1rZvg4y97Yww5WgHzvYG3Q1cCWj3hunvSz90gfrOrwONQaFho0pxHUKn-iKoS-HA',
    ['medical'] = 'https://discord.com/api/webhooks/1364455240748892230/g_aLRMT5cugyGSRrYhJ3J3hirG9gCe1gxEfH4SUGVQxfEy8Dk9KXqz2U_G12hwBSRwE_',
    ['drugs'] = 'https://discord.com/api/webhooks/1366858795518525460/LgAKRiZfaynoEsOdnMHCzTiKxccbZxfD8KYw-cl9SYMSPZW-Ghn-YA4cLludLw60aapk',
    ['noclip'] = 'https://discord.com/api/webhooks/1366949126004281435/vd6vaItQR1FN5GlbIxAKIB7Kmj4amhVuVHpGS_ZW3YgsWrELHdBp7rlXBISsvNmun3Sl',
    ['characters'] = 'https://discord.com/api/webhooks/1367295878108282891/UbB3yxeHJgVZVZaP9X0ffNSXtdhvs7ljziyKL4LGYlMIgv10_yMTEg-6D6qjsrJu2lNh',
    ['robbery'] = 'https://discord.com/api/webhooks/1367308550560284683/8gRiDAR_BlbFW-mq5AkskuFILpuHbguVIkBAvNUu58vrOFC6piwRQUnC6_kzZD-snHLK',
    ['graverobbery'] = 'https://discord.com/api/webhooks/1367634931081281586/19w6E1A7IWe1d6u95WrYZOdNKtDLHX95wcmKUk-JO8zZrXXNGeadbQURB-HTiSMv-ZNN',
    ['seller'] = 'https://discord.com/api/webhooks/1368276393200455872/bEN6ji26v_i3N-crtRAujl_ShgGhxD82SU79ZCPKnB-GlinFgcqvdk2BXMespN_53iPj',
    ['aloe'] = 'https://discord.com/api/webhooks/1368283744586170398/AWUjBaywk2akKey2HTpJ0szXOlPJet8EOwjknrrQXe0n49NJ-TxjsEHrtp2p-QVbFBks',
    ['duty'] = 'https://discord.com/api/webhooks/1379992472758915113/uscx0L7Ngi5gE3d8Gy4lehHRuSUnRpN5P02MEExVMoSaUSqOIMJhiMRMULduOCZvD-hU',
}

local Colors = { -- https://www.spycolor.com/
    ['default'] = 14423100,
    ['blue'] = 255,
    ['red'] = 16711680,
    ['green'] = 65280,
    ['white'] = 16777215,
    ['black'] = 0,
    ['orange'] = 16744192,
    ['yellow'] = 16776960,
    ['pink'] = 16761035,
    ["lightgreen"] = 65309,
}

RegisterNetEvent('rsg-log:server:CreateLog', function(name, title, color, message, tagEveryone)
    local tag = tagEveryone or false
    local webHook = Webhooks[name] or Webhooks['default']
    local embedData = {
        {
            ['title'] = title,
            ['color'] = Colors[color] or Colors['default'],
            ['footer'] = {
                ['text'] = os.date('%c'),
            },
            ['description'] = message,
            ['author'] = {
                ['name'] = Config.DiscordWHAuthorName,
                ['icon_url'] = Config.DiscordWHImage,
            },
        }
    }
    PerformHttpRequest(webHook, function() end, 'POST', json.encode({ username = Config.DiscordWHLogUserName, embeds = embedData}), { ['Content-Type'] = 'application/json' })
    Citizen.Wait(100)
    if tag then
        PerformHttpRequest(webHook, function() end, 'POST', json.encode({ username = Config.DiscordWHLogUserName, content = '@everyone'}), { ['Content-Type'] = 'application/json' })
    end
end)

RSGCore.Commands.Add('testwebhook', locale('sv_test_your_webhook'), {}, false, function()
    TriggerEvent('rsg-log:server:CreateLog', 'testwebhook', locale('sv_test_webhook'), 'default', locale('sv_webhook_successfully'))
end, 'god')






-- local RSGCore = exports['rsg-core']:GetCoreObject()
-- lib.locale()

-- local Webhooks = {
--     ['default'] = 'fivemerr',
--     ['testwebhook'] = 'fivemerr',
--     ['anticheat'] = 'fivemerr',
--     ['levels'] = 'fivemerr',
--     ['playermoney'] = 'fivemerr',
--     ['joinleave'] = 'fivemerr',
--     ['banking'] = 'fivemerr',
--     ['ooc'] = 'fivemerr',
--     ['playerinventory'] = 'fivemerr',
--     ['robbing'] = 'fivemerr',
--     ['stash'] = 'fivemerr',
--     ['drop'] = 'fivemerr',
--     ['dealers'] = 'fivemerr',
--     ['shops'] = 'fivemerr',
--     ['bans'] = 'fivemerr',
--     ['bossmenu'] = 'fivemerr',
--     ['gangmenu'] = 'fivemerr',
--     ['fishing'] = 'fivemerr',
--     ['goldpanning'] = 'fivemerr',
--     ['loot'] = 'fivemerr',
--     ['hotel'] = 'fivemerr',
--     ['beekeeper'] = 'fivemerr',
--     ['ranch'] = 'fivemerr',
--     ['adminmenu'] = 'fivemerr',
--     ['report'] = 'fivemerr',
--     ['horsetrainer'] = 'fivemerr',
--     ['crafting'] = 'fivemerr',
--     ['death'] = 'fivemerr',
-- }

-- local Colors = {
--     ['default'] = 14423100,
--     ['blue'] = 255,
--     ['red'] = 16711680,
--     ['green'] = 65280,
--     ['white'] = 16777215,
--     ['black'] = 0,
--     ['orange'] = 16744192,
--     ['yellow'] = 16776960,
--     ['pink'] = 16761035,
--     ['lightgreen'] = 65309,
-- }

-- local useFiveMerr = false
-- local fiveMerrKey = GetConvar('fivemerr:key', '')

-- if fiveMerrKey ~= '' then
--     useFiveMerr = true
--     print("^2[Logging] FiveMerr logging enabled!^0")
-- end

-- RegisterNetEvent('rsg-log:server:CreateLog', function(name, title, color, message, source)
--     local logSource = source or "Unknown"
--     local resourceName = GetCurrentResourceName()
--     local webhookType = Webhooks[name] or Webhooks['default']

--     if webhookType == "fivemerr" then
--         -- Send log to FiveMerr API
--         local endpoint = 'https://api.fivemerr.com/v1/logs'
--         local headers = {
--             ['Authorization'] = GetConvar('fivemerr:key', ''),
--             ['Content-Type'] = 'application/json',
--             ['User-Agent'] = 'ox_lib'
--         }

--         local logData = {
--             level = "info",
--             message = "[" .. resourceName .. "] " .. title .. " - " .. message,
--             resource = resourceName,
--             metadata = {
--                 event = name,
--                 playerid = logSource,
--             }
--         }

--         PerformHttpRequest(endpoint, function(status, responseText)
--             if status ~= 200 then
--                 print("^1[FiveMerr] Log failed! Status: " .. status .. " Response: " .. (responseText or "nil") .. "^0")
--             end
--         end, 'POST', json.encode(logData), headers)
--     else
--         print("^1[Logging] No valid webhook found for '" .. name .. "', skipping log.^0")
--     end
-- end)

-- RSGCore.Commands.Add('testwebhook', locale('sv_test_your_webhook'), {}, false, function()
--     TriggerEvent('rsg-log:server:CreateLog', 'testwebhook', locale('sv_test_webhook'), 'default', locale('sv_webhook_successfully'))
-- end, 'god')
