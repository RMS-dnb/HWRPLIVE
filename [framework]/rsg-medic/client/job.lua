local RSGCore = exports['rsg-core']:GetCoreObject()
local blipEntries = {}
local transG = Config.DeathTimer
lib.locale()


CreateThread(function()
    for k, v in pairs(Config.MenuDoctors) do
        local options = {
            {
                name = 'toggle_duty'..k,
                icon = 'fas fa-user-md',
                label = 'Toggle Duty',
                onSelect = function(data)
                    local canDuty = lib.callback.await('rsg-medic:server:caninteract', false, v.job)
                    if canDuty then
                        TriggerServerEvent("RSGCore:ToggleDuty")
                    else
                        lib.notify({
                            title = 'Incorrect job',
                            type = 'error',
                            icon = 'fa-solid fa-kit-medical',
                            iconAnimation = 'shake',
                            duration = 7000
                        })
                    end
                end,
            },
            {
                name = 'doctor_stash'..k,
                icon = 'fas fa-box-open',
                label = 'Open Storage',
                onSelect = function(data)
                    local canDuty = lib.callback.await('rsg-medic:server:caninteract', false, v.job)
                    if canDuty then
                    TriggerServerEvent('rsg-medic:server:openstash', 'doctor_stash'..k)
                    else
                        lib.notify({
                            title = 'Incorrect job',
                            type = 'error',
                            icon = 'fa-solid fa-kit-medical',
                            iconAnimation = 'shake',
                            duration = 7000
                        })
                    end
                end,
            },
        }

        if v.business then
            table.insert(options, {
                name = 'doctor_menuboss'..k,
                icon = 'fas fa-box-open',
                label = 'Boss Menu',
                onSelect = function(data)
                    local canDuty = lib.callback.await('rsg-medic:server:caninteract', false, v.job)
                    if canDuty then
                        TriggerEvent('rsg-bossmenu:client:mainmenu')
                    else
                        lib.notify({
                            title = 'Incorrect job',
                            type = 'error',
                            icon = 'fa-solid fa-kit-medical',
                            iconAnimation = 'shake',
                            duration = 7000
                        })
                    end
                end,
            })
        end

        exports.ox_target:addBoxZone({
            name = v.name,
            label = v.label,
            coords = v.coords,
            size = vec3(3, 3, 3),
            rotation = 160.0,
            debug = false,
            options = options
        })
    end
end)

------------------------
--- FUNCTIONS 
------------------------
-- Get Closest Player
local GetClosestPlayer = function()
    local coords = GetEntityCoords(cache.ped)
    local closestDistance = -1
    local closestPlayer = -1
    local closestPlayers = RSGCore.Functions.GetPlayersFromCoords()

    for i = 1, #closestPlayers, 1 do
        if closestPlayers[i] ~= PlayerId() then
            local ped = GetPlayerPed(closestPlayers[i])
            local pos = GetEntityCoords(ped)
            local distance = #(pos - coords)

            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = closestPlayers[i]
                closestDistance = distance
            end
        end
    end

    return closestPlayer, closestDistance
end



------------------------
--- EVENTS
------------------------
-- Toggle On-Duty
AddEventHandler('rsg-medic:client:ToggleDuty', function()
    RSGCore.Functions.GetPlayerData(function(PlayerData)
        local PlayerJob = PlayerData.job

        if PlayerJob.name ~= Config.JobRequired then
            lib.notify({ title = locale('cl_not_medic'), type = 'error', icon = 'fa-solid fa-kit-medical', iconAnimation = 'shake', duration = 7000 })
            return
        end

        TriggerServerEvent("RSGCore:ToggleDuty")
    end)
end)

-- Medic Revive Player
AddEventHandler('rsg-medic:client:RevivePlayer', function()
    local hasItem = RSGCore.Functions.HasItem('firstaid', 1)
    if not hasItem then
        lib.notify({ title = locale('cl_need_kit'), type = 'error', icon = 'fa-solid fa-kit-medical', iconAnimation = 'shake',  duration = 7000  })
        return
    end

    local player, distance = GetClosestPlayer()
    if player == -1 or distance >= 5.0 then
        lib.notify({ title = locale('cl_player_nearby'), type = 'error', icon = 'fa-solid fa-kit-medical', iconAnimation = 'shake', duration = 7000 })
        return
    end

    local playerId = GetPlayerServerId(player)
    local tped = GetPlayerPed(GetPlayerFromServerId(playerId))

    TaskTurnPedToFaceEntity(cache.ped, tped, -1)

    Wait(3000)

    FreezeEntityPosition(cache.ped, true)
    TaskStartScenarioInPlace(cache.ped, `WORLD_HUMAN_CROUCH_INSPECT`, -1, true, false, false, false)

    Wait(5000)

    ExecuteCommand('me Reviving')

    lib.progressBar({
        duration = Config.MedicReviveTime,
        position = 'bottom',
        useWhileDead = false,
        canCancel = false,
        disableControl = true,
        disable = {
            move = true,
            mouse = false,
        },
        label = locale('cl_reviving'),
    })

    ClearPedTasks(cache.ped)
    FreezeEntityPosition(cache.ped, false)
    TriggerServerEvent('rsg-medic:server:RevivePlayer', playerId)
    transG = 0

end)

-- Medic Treat Wounds
AddEventHandler('rsg-medic:client:TreatWounds', function()
    local hasItem = RSGCore.Functions.HasItem('bandage', 1)
    if not hasItem then
        lib.notify({ title = locale('cl_need_bandage'), type = 'error', icon = 'fa-solid fa-kit-medical', iconAnimation = 'shake', duration = 7000 })
        return
    end

    local player, distance = GetClosestPlayer()
    if player == -1 or distance >= 5.0 then
        lib.notify({ title = locale('cl_player_nearby'), type = 'error', icon = 'fa-solid fa-kit-medical', iconAnimation = 'shake', duration = 7000 })
        return
    end

    local ped = PlayerPedId()
    local playerId = GetPlayerServerId(player)
    local tped = GetPlayerPed(GetPlayerFromServerId(playerId))

    TaskTurnPedToFaceEntity(cache.ped, tped, -1)

    Wait(3000)

    FreezeEntityPosition(cache.ped, true)
    TaskStartScenarioInPlace(cache.ped, `WORLD_HUMAN_CROUCH_INSPECT`, -1, true, false, false, false)

    Wait(5000)

    ExecuteCommand('me Treating Wounds')

    lib.progressBar({
        duration = Config.MedicTreatTime,
        position = 'bottom',
        useWhileDead = false,
        canCancel = false,
        disableControl = true,
        disable = {
            move = true,
            mouse = false,
        },
        label = locale('cl_treating'),
    })

    ClearPedTasks(cache.ped)
    FreezeEntityPosition(cache.ped, false)
    TriggerServerEvent('rsg-medic:server:TreatWounds', playerId)
    transG = 0

end)

-- Medic Treat Wounds
RegisterNetEvent('rsg-medic:client:HealInjuries', function()
    local ped = cache.ped

    -- Heal cores
    SetAttributeCoreValue(ped, 0, 100) -- Health Core
    SetAttributeCoreValue(ped, 1, 100) -- Stamina Core
    SetAttributeCoreValue(ped, 2, 100) -- Dead Eye Core

    -- Restore actual health
    SetEntityHealth(ped, GetEntityMaxHealth(ped))

    -- Refill hunger & thirst
    TriggerServerEvent("RSGCore:Server:SetMetaData", "hunger", 100)
    TriggerServerEvent("RSGCore:Server:SetMetaData", "thirst", 100)

    -- Clear blood
    ClearPedBloodDamage(ped)
end)


-- Medic Alert
RegisterNetEvent('rsg-medic:client:medicAlert', function(coords, text)
    lib.notify({ title = locale('cl_info'), description = text, type = 'info', duration = 7000 })

    local blip = BlipAddForCoords(1664425300, coords.x, coords.y, coords.z)
    local blip2 = BlipAddForCoords(1664425300, coords.x, coords.y, coords.z)

    SetBlipSprite(blip, 1109348405)
    SetBlipSprite(blip2, -184692826)
    BlipAddModifier(blip, GetHashKey('BLIP_MODIFIER_AREA_PULSE'))
    BlipAddModifier(blip2, GetHashKey('BLIP_MODIFIER_AREA_PULSE'))
    SetBlipScale(blip, 0.8)
    SetBlipScale(blip2, 2.0)
    SetBlipName(blip, text)
    SetBlipName(blip2, text)

    blipEntries[#blipEntries + 1] = {coords = coords, handle = blip}
    blipEntries[#blipEntries + 1] = {coords = coords, handle = blip2}

    -- Add GPS Route

    if Config.AddGPSRoute then
        StartGpsMultiRoute(`COLOR_GREEN`, true, true)
        AddPointToGpsMultiRoute(coords)
        SetGpsMultiRouteRender(true)
    end

    CreateThread(function ()
        while transG ~= 0 do
            Wait(180 * 4)

            local pcoord = GetEntityCoords(cache.ped)
            local distance = #(coords - pcoord)
            transG = transG - 1

            if Config.Debug then
                print(locale('cl_player_blip') .. tostring(distance) .. locale('cl_m'))
            end

            if transG <= 0 or distance < 5.0 then
                for i = 1, #blipEntries do
                    local blips = blipEntries[i]
                    local bcoords = blips.coords

                    if coords == bcoords then
                        if Config.Debug then
                            print('')
                            print(locale('cl_blip')..tostring(bcoords))
                            print(locale('cl_blip_remove')..tostring(blipEntries[i].handle))
                            print('')
                        end

                        RemoveBlip(blipEntries[i].handle)
                    end
                end

                transG = Config.DeathTimer

                if Config.AddGPSRoute then
                    ClearGpsMultiRoute(coords)
                end

                return
            end
        end
    end)
end)

-- Cleanup
local resource = GetCurrentResourceName()
AddEventHandler("onResourceStop", function(resourceName)
    if resource ~= resourceName then return end

    ClearGpsMultiRoute(coords)

    for i = 1, #blipEntries do
        if blipEntries[i].handle then
            RemoveBlip(blipEntries[i].handle)
        end
    end
end)
