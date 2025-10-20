local RSGCore = exports['rsg-core']:GetCoreObject()

lib.locale()

local spawnedNpc

local function spawnSyncedNPC()
    local spawnPos, model = lib.callback.await('rms-blackmarket:server:GetNpcSpawnData', false)
    if not spawnPos or not model then return end

    if DoesEntityExist(spawnedNpc) then return end

    RequestModel(model)
    while not HasModelLoaded(model) do
        Wait(10)
    end

    spawnedNpc = CreatePed(GetHashKey(model), spawnPos.x, spawnPos.y, spawnPos.z - 1.0, spawnPos.w, false, false, 0, 0)

    SetEntityAlpha(spawnedNpc, 0, false)
    SetRandomOutfitVariation(spawnedNpc, true)
    SetEntityCanBeDamaged(spawnedNpc, false)
    SetEntityInvincible(spawnedNpc, true)
    FreezeEntityPosition(spawnedNpc, true)
    SetBlockingOfNonTemporaryEvents(spawnedNpc, true)
    SetPedCanBeTargetted(spawnedNpc, false)
    SetModelAsNoLongerNeeded(model)

    for i = 0, 255, 51 do
        Wait(50)
        SetEntityAlpha(spawnedNpc, i, false)
    end

    exports.ox_target:addLocalEntity(spawnedNpc, {
        {
            name = 'npc_blackmarket',
            icon = 'far fa-eye',
            label = locale('cl_lang_1'),
            onSelect = function()
                local hasFines = lib.callback.await('rms-blackmarket:server:CheckFines', false)
                if not hasFines then
                    TriggerEvent('rex-blackmarket:client:mainmenu')
                end
            end,
            distance = 3.0
        }
    })
end

CreateThread(function()
    spawnSyncedNPC()
end)

RegisterNetEvent('rms-blackmarket:client:RespawnNpc', function()
    if DoesEntityExist(spawnedNpc) then
        DeleteEntity(spawnedNpc)
    end
    spawnedNpc = nil
    spawnSyncedNPC()
end)

-- update npc move to new location
RegisterNetEvent('rex-blackmarket:client:update', function()
    if spawnedNpc == nil or not DoesEntityExist(spawnedNpc) then
        spawnSyncedNPC()
    else
        exports.ox_target:removeEntity(spawnedNpc, 'npc_blackmarket')
        DeleteEntity(spawnedNpc)
        Wait(1000)
        spawnSyncedNPC()
    end
end)


-- main menu
RegisterNetEvent('rex-blackmarket:client:mainmenu', function()
    lib.registerContext({
        id = 'main_menu',
        title = locale('cl_lang_2'),
        position = 'top-right',
        options = {
            {
                title = locale('cl_lang_3'), -- Wash Bloodmoney
                icon = 'fa-solid fa-hand-sparkles',
                event = 'rex-blackmarket:client:washbloodmoney',
                arrow = true
            },
            {
                title = 'Clean MONEYBAG',
                icon = 'fa-solid fa-sack-dollar',
                event = 'rex-blackmarket:client:cleanmoneybag',
                arrow = true
            },
            {
                title = locale('cl_lang_4'), -- Open Shop
                icon = 'fa-solid fa-shop',
                event = 'rms-blacksmith:client:openshop',
                arrow = true
            },
        }
    })
    lib.showContext('main_menu')
end)

-- Updated bloodmoney washing function
RegisterNetEvent('rex-blackmarket:client:washbloodmoney', function()
    RSGCore.Functions.TriggerCallback('rex-blackmarket:server:bloodmoneycallback', function(bloodmoney)
        LocalPlayer.state:set("inv_busy", true, true)

        local input = lib.inputDialog(locale('cl_lang_5') .. Config.MaxWash .. ')', {
            {
                label = locale('cl_lang_6'),
                description = locale('cl_lang_7') .. bloodmoney,
                type = 'input',
                icon = 'fa-solid fa-hashtag',
                required = true
            },
        })

        if not input then
            LocalPlayer.state:set("inv_busy", false, true)
            return
        end

        local washmoney = tonumber(input[1])
        if washmoney <= Config.MaxWash then
            if bloodmoney >= washmoney then
                if lib.progressBar({
                    duration = Config.WashTime * washmoney,
                    position = 'bottom',
                    useWhileDead = false,
                    canCancel = false,
                    disableControl = true,
                    disable = {
                        move = true,
                        mouse = true,
                    },
                    label = locale('cl_lang_8'),
                }) then
                    -- FIXED: Use separate event for bloodmoney
                    TriggerServerEvent('rex-blackmarket:server:washbloodmoney', washmoney)
                end
            else
                lib.notify({ title = locale('cl_lang_9'), type = 'error', duration = 7000 })
            end
        else
            lib.notify({ title = locale('cl_lang_10') .. Config.MaxWash, type = 'error', duration = 7000 })
        end

        LocalPlayer.state:set("inv_busy", false, true)
    end)
end)

-- Updated moneybag cleaning function
RegisterNetEvent('rex-blackmarket:client:cleanmoneybag', function()
    local input = lib.inputDialog('Clean MONEYBAGs', {
        {
            label = 'How many MONEYBAGs do you want to clean?',
            type = 'input',
            icon = 'dollar-sign',
            required = true
        }
    })

    if not input then return end
    local amount = tonumber(input[1])
    if not amount or amount <= 0 then
        lib.notify({ title = 'Black Market', description = 'Invalid amount.', type = 'error' })
        return
    end

    if lib.progressBar({
        duration = 3000 * amount,
        position = 'bottom',
        useWhileDead = false,
        canCancel = false,
        disableControl = true,
        disable = {
            move = true,
            mouse = true,
        },
        label = 'Cleaning '..amount..' MONEYBAG(s)...',
    }) then
        -- FIXED: Use separate event for moneybag
        TriggerServerEvent('rex-blackmarket:server:cleanmoneybag', amount)
    end
end)

RegisterNetEvent('rex-blackmarket:client:notify', function(message, type)
    lib.notify({
        title = 'Black Market',
        description = message,
        type = type or 'info',
        duration = 7000
    })
end)


-- cleanup on stop
AddEventHandler("onResourceStop", function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    exports.ox_target:removeEntity(spawnedNpc, 'npc_blackmarket')
    DeleteEntity(spawnedNpc)
    spawnedNpc = nil
end)


-----------------------------------------------------------------
-- trapper shop
-----------------------------------------------------------------
RegisterNetEvent('rms-blacksmith:client:openshop', function()
    TriggerServerEvent('rsg-shops:server:openstore', 'blackmarket', 'blackmarket', 'Blackmarket')
end)
