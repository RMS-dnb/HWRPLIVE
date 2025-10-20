local RSGCore = exports['rsg-core']:GetCoreObject()
local SpawnedCampFires = {}
local CategoryMenus = {}
local fx_group = "scr_dm_ftb"
local fx_name = "scr_mp_chest_spawn_smoke"
local fx_scale = 1.0
lib.locale()

local function CanPlacePropHere(playercoords)
    local x, y, z = table.unpack(playercoords)
    local town = Citizen.InvokeNative(0x43AD8FC02B429D33, x, y, z, 1)
    return not town
end

RegisterNetEvent('rex-campfire:client:setupcampfire', function(firecoords, heading, propmodel, item)
    local playercoords = GetEntityCoords(cache.ped)
    if not CanPlacePropHere(playercoords) then
        return lib.notify({ title = locale('cl_lang_12'), description = locale('cl_lang_13'), type = 'error', duration = 7000 })
    end
    if #(playercoords - firecoords) > Config.PlaceDistance then
        return lib.notify({ title = locale('cl_lang_2'), description = locale('cl_lang_3'), type = 'error', duration = 5000 })
    end

    TaskStartScenarioInPlace(cache.ped, `WORLD_HUMAN_CROUCH_INSPECT`, 0, true)
    Wait(5000)

    local campfire = CreateObject(propmodel, firecoords, true, false, true)
    local netId = NetworkGetNetworkIdFromEntity(campfire)
    SetNetworkIdExistsOnAllMachines(netId, true)

    AddVegModifierSphere(firecoords.x, firecoords.y, firecoords.z, 1.5, 1, 511, 0)

    exports.ox_target:addLocalEntity(campfire, {
        {
            name = 'single_campfire',
            icon = 'far fa-eye',
            label = 'Destroy Campfire',
            distance = 1.5,
            onSelect = function()
                TriggerEvent('rex-campfire:client:destorycampfire', {
                    campfireNetId = netId,
                    firecoords = firecoords
                })
            end
        },
        {
            name = 'single_campfire',
            icon = 'far fa-eye',
            label = 'Cooking Menu',
            distance = 1.5,
            onSelect = function()
               exports['cw-crafting']:setCraftingOpen(true, "camping")
            end
        }
    })

    table.insert(SpawnedCampFires, { netId = netId, coords = firecoords })
    ClearPedTasks(cache.ped)
    TriggerServerEvent('rex-campfire:server:deleteitem', item, 1)
end)

RegisterNetEvent('rex-campfire:client:openmenu', function(data)
    lib.registerContext({
        id = 'campfire',
        title = locale('cl_lang_4'),
        options = {
          
            {
                title = locale('cl_lang_6'),
                icon = 'fa-regular fa-circle-xmark',
                event = 'rex-campfire:client:destorycampfire',
                args = data,
                arrow = true
            },
        }
    })
    lib.showContext('campfire')
end)

RegisterNetEvent('rex-campfire:client:destorycampfire', function(data)
    local ped = cache.ped
    local campfire = NetworkGetEntityFromNetworkId(data.campfireNetId)
    if not DoesEntityExist(campfire) then return end

    TaskStartScenarioInPlace(ped, 'WORLD_HUMAN_BUCKET_POUR_LOW', 0, true)
    Wait(5000)

    SetEntityAsMissionEntity(campfire, false, false)
    FreezeEntityPosition(campfire, false)
    DeleteObject(campfire)

    UseParticleFxAsset(fx_group)
    StartParticleFxNonLoopedAtCoord(fx_name, data.firecoords.x, data.firecoords.y, data.firecoords.z, 0.0, 0.0, 0.0, fx_scale, false, false, false, true)
    ClearPedTasksImmediately(ped)
end)

RegisterNetEvent('rex-campfire:client:cookingmenu', function()
    local menu = {
        id = 'cooking_menu',
        title = locale('cl_lang_7'),
        options = {}
    }

    for category, MenuData in pairs(CategoryMenus) do
        table.insert(menu.options, {
            title = category,
            event = 'rex-campfire:client:' .. category,
            arrow = true
        })
    end

    lib.registerContext(menu)
    lib.showContext(menu.id)
end)

RegisterNetEvent('rex-campfire:client:cookitem', function(data)
    local hasItem = RSGCore.Functions.HasItem('weapon_melee_knife', 1)
    if not hasItem then
        return lib.notify({ title = locale('cl_lang_8'), description = locale('cl_lang_9'), type = 'error', duration = 5000 })
    end

    RSGCore.Functions.TriggerCallback('rex-campfire:server:checkingredients', function(hasRequired)
        if hasRequired then
            LocalPlayer.state:set('inv_busy', true, true)
            lib.progressBar({
                duration = data.cooktime,
                position = 'bottom',
                canCancel = false,
                disableControl = true,
                disable = { move = true, mouse = true },
                useWhileDead = false,
                anim = {
                    dict = 'amb_camp@world_player_fire_cook_knife@male_a@wip_base',
                    clip = 'wip_base',
                    flag = 17
                },
                prop = {
                    {
                        model = `w_melee_knife06`,
                        bone = 16750,
                        pos = vec3(-0.01, -0.02, 0.02),
                        rot = vec3(190.0, 0.0, 0.0)
                    },
                    {
                        model = `p_redefleshymeat01xa`,
                        bone = 16750,
                        pos = vec3(0.00, 0.02, -0.20),
                        rot = vec3(0.0, 0.0, 0.0)
                    }
                },
                label = locale('cl_lang_10') .. RSGCore.Shared.Items[data.receive].label
            })
            TriggerServerEvent('rex-campfire:server:finishcooking', data)
            LocalPlayer.state:set('inv_busy', false, true)
        else
            lib.notify({ title = locale('cl_lang_11'), type = 'inform', duration = 7000 })
        end
    end, data.ingredients)
end)

CreateThread(function()
    for _, v in ipairs(Config.Cooking) do
        local meta = {}
        local label = RSGCore.Shared.Items[tostring(v.receive)].label
        local icon = "nui://" .. Config.Image .. RSGCore.Shared.Items[tostring(v.receive)].image

        for _, ing in ipairs(v.ingredients) do
            table.insert(meta, { label = RSGCore.Shared.Items[ing.item].label, value = ing.amount })
        end

        local option = {
            title = label,
            icon = icon,
            metadata = meta,
            event = 'rex-campfire:client:cookitem',
            args = {
                title = label,
                category = v.category,
                ingredients = v.ingredients,
                cooktime = v.cooktime,
                receive = v.receive,
                giveamount = v.giveamount
            }
        }

        if not CategoryMenus[v.category] then
            CategoryMenus[v.category] = {
                id = 'cooking_menu_' .. v.category,
                title = v.category,
                menu = 'cooking_menu',
                onBack = function() end,
                options = { option }
            }
        else
            table.insert(CategoryMenus[v.category].options, option)
        end
    end

    for category, MenuData in pairs(CategoryMenus) do
        RegisterNetEvent('rex-campfire:client:' .. category)
        AddEventHandler('rex-campfire:client:' .. category, function()
            lib.registerContext(MenuData)
            lib.showContext(MenuData.id)
        end)
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    for _, fire in ipairs(SpawnedCampFires) do
        local entity = NetworkGetEntityFromNetworkId(fire.netId)
        if DoesEntityExist(entity) then
            SetEntityAsMissionEntity(entity, false)
            FreezeEntityPosition(entity, false)
            DeleteObject(entity)
        end
    end
end)
