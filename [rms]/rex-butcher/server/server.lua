local RSGCore = exports['rsg-core']:GetCoreObject()
lib.locale()

RegisterServerEvent('rex-butcher:server:reward')
AddEventHandler('rex-butcher:server:reward', function(rewardmoney, rewarditem, quality, name)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    
    if not Player then return end
    if Config.Debug == true then
        print("money: "..tostring(rewardmoney))
        print("item: "..tostring(rewarditem))
        print("quality: "..tostring(quality))
    end
    if quality == 'poor' then
        local rewardPoor = rewardmoney * Config.PoorMultiplier
        Player.Functions.AddMoney('cash', rewardPoor)
        TriggerClientEvent('rNotify:NotifyLeft', src, 
                'Butcher', 
                "You received $" .. rewardPoor, 
                "generic_textures", "tick", 4000)
        Player.Functions.AddItem(rewarditem, 1)
        TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items[rewarditem], 'add', 1)
        TriggerEvent('rsg-log:server:CreateLog', Config.WebhookName, Config.WebhookTitle, Config.WebhookColour, GetPlayerName(src) .. locale('sv_lang_1') .. name .. locale('sv_lang_4') .. rewardmoney * Config.PoorMultiplier, false)
    end
    if quality == 'good' then
        local rewardGood = rewardmoney * Config.GoodMultiplier
        Player.Functions.AddMoney('cash', rewardGood)
        Player.Functions.AddItem(rewarditem, 2)
        TriggerClientEvent('rNotify:NotifyLeft', src, 
                'Butcher', 
                "You received $" .. rewardGood, 
                "generic_textures", "tick", 4000)
        TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items[rewarditem], 'add', 2)
        TriggerEvent('rsg-log:server:CreateLog', Config.WebhookName, Config.WebhookTitle, Config.WebhookColour, GetPlayerName(src) .. locale('sv_lang_2') .. name .. locale('sv_lang_4') .. rewardmoney * Config.GoodMultiplier, false)
    end
    if quality == 'perfect' then
         local rewardPerfect = rewardmoney * Config.PerfectMultiplier
        Player.Functions.AddMoney('cash', rewardPerfect)
        Player.Functions.AddItem(rewarditem, 3)
        TriggerClientEvent('rNotify:NotifyLeft', src, 
                'Butcher', 
                "You received $" .. rewardPerfect, 
                "generic_textures", "tick", 4000)
        TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items[rewarditem], 'add', 3)
        TriggerEvent('rsg-log:server:CreateLog', Config.WebhookName, Config.WebhookTitle, Config.WebhookColour, GetPlayerName(src) .. locale('sv_lang_3') .. name .. locale('sv_lang_4') .. rewardmoney * Config.PerfectMultiplier, false)
    end
end)
