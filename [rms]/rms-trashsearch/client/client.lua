local RSGCore = exports['rsg-core']:GetCoreObject()
local isBusy = false

---------------------------------
-- targets
---------------------------------
CreateThread(function()
    exports['rsg-target']:AddTargetModel(Config.TrashCans, {
        options = {
            {
                type = 'client',
                event = 'rex-trashsearch:client:searchtrash',
                icon = 'fa-solid fa-trash-can',
                label = Lang:t('client.lang_1'),
            },
        },
        distance = Config.ObjectDistance
    })
end)

---------------------------------
-- search dumpster
---------------------------------
RegisterNetEvent('rex-trashsearch:client:searchtrash', function()
    if GetVehiclePedIsIn(cache.ped, false) ~= 0 then return end
    if isBusy then return end

    isBusy = true
    local trashcanObject = nil
    local coords = nil

    for i = 1, #Config.TrashCans do
        local obj = Config.TrashCans[i]
        local pos = GetEntityCoords(cache.ped)
        local dumpster = GetClosestObjectOfType(pos, Config.ObjectDistance, obj, false, false, false)
        if dumpster and dumpster ~= 0 then
            trashcanObject = dumpster
            coords = GetEntityCoords(trashcanObject)
            if coords then break end
        end
    end

    TaskTurnPedToFaceEntity(cache.ped, trashcanObject, -1)

    if coords then
        RSGCore.Functions.TriggerCallback('rex-trashsearch:server:checktrashcan', function(exists)
            if not exists then
                lib.progressBar({
                    label = Lang:t('client.lang_2'),
                    duration = 4000,
                    position = 'bottom',
                    useWhileDead = false,
                    canCancel = true,
                    disable = {
                        move = true,
                        combat = true,
                        mouse = true
                    },
                    anim = {
                        dict = 'mech_pickup@loot@horse_saddlebags@live@lt',
                        clip = 'base',
                        flag = 1,
                    },
                })
                ClearPedTasks(cache.ped)
                TriggerServerEvent('rex-trashsearch:server:searchedtrashcan', coords)
                TriggerServerEvent('rex-trashsearch:server:givereward')
            else
                lib.notify({
                    description = Lang:t('client.lang_3'),
                    type = 'error'
                })
                ClearPedTasks(cache.ped)
            end
        end, coords)
        isBusy = false
    end
end)