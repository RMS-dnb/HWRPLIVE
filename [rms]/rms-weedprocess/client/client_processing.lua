local RSGCore = exports['rsg-core']:GetCoreObject()

---------------------------------
-- process weed (cannabis_bud -> cannabis)
---------------------------------
RegisterNetEvent('rex-drugrunner:client:ProcessWeed', function()

    local input = lib.inputDialog('Process Cannabis Buds', {
        {
            type = 'number',
            label = 'Amount to Process',
            description = 'How many buds do you want to process?',
            icon = 'leaf',
            required = true,
            min = 1,
            max = 100 -- optional: limit how much they can do at once
        }
    })

    if not input then return end

    local amount = tonumber(input[1])
    if not amount or amount <= 0 then return end

    local hasItem = RSGCore.Functions.HasItem('weed', amount)

    if not hasItem then
        RSGCore.Functions.Notify(Lang:t('client.lang_23'), 'error', 2500)
        return
    end

    if lib.progressBar({
        label = 'Processing Cannabis Buds',
        duration = Config.ProcessTime * amount, -- process time scales with amount
        position = 'bottom',
        useWhileDead = false,
        canCancel = true,
        disable = {
            move = true,
            combat = true,
            mouse = true
        },
        anim = {
            dict = 'script_rc@cldn@ig@rsc2_ig1_questionshopkeeper',
            clip = 'inspectfloor_player',
            flag = 16
        },
    }) then
        ClearPedTasks(cache.ped)
        TriggerServerEvent('rex-drugrunner:server:ProcessWeed', amount)
    end

end)


