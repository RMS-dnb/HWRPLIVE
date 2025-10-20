local RSGCore = exports['rsg-core']:GetCoreObject()
local SearchedTrashcans = {}

---------------------------------
-- searched trashcan
---------------------------------
RegisterNetEvent('rex-trashsearch:server:searchedtrashcan', function(coords)
    local exists = false
    for i = 1, #SearchedTrashcans do
        local trashcan = SearchedTrashcans[i]
        if trashcan == coords then
            exists = true
            break
        end
    end
    if not exists then
        SearchedTrashcans[#SearchedTrashcans + 1] = coords
    end
end)

---------------------------------
-- check trashcan
---------------------------------
RSGCore.Functions.CreateCallback('rex-trashsearch:server:checktrashcan', function(source, cb, coords)
    local exists = false
    for i = 1, #SearchedTrashcans do
        local trashcan = SearchedTrashcans[i]
        if trashcan == coords then
            exists = true
            break
        end
    end
    cb(exists)
end)

---------------------------------
-- give reward item
---------------------------------
RegisterNetEvent('rex-trashsearch:server:givereward', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end

    local givereward = math.random(100)
    local rewardchance = math.random(100)

    if givereward > (100 - Config.GiveRewardChance) then
        local randomItem
        if rewardchance > (100 - Config.RareItemChance) then
            randomItem = Config.RareRewardItems[math.random(#Config.RareRewardItems)]
        else
            randomItem = Config.CommonRewardItems[math.random(#Config.CommonRewardItems)]
        end
        
        Player.Functions.AddItem(randomItem, 1)
        TriggerClientEvent('inventory:client:ItemBox', src, RSGCore.Shared.Items[randomItem], 'add', 1)
        -- Added notification showing what item was found
        TriggerClientEvent('ox_lib:notify', src, {
            description = 'You found a ' .. RSGCore.Shared.Items[randomItem].label,
            type = 'success'
        })
    else
        TriggerClientEvent('ox_lib:notify', src, {
            description = Lang:t('server.lang_1'),
            type = 'error'
        })
    end
end)

---------------------------------------------
-- trashcan reset
---------------------------------------------
lib.cron.new(Config.TrashCronJob, function()
    SearchedTrashcans = {}
    if Config.CronNotification then
        print('trash cronjob ran')
    end
end)