local RSGCore = exports['rsg-core']:GetCoreObject()
local SpawnedProps = {}
local isBusy = false
local fx_group = "scr_dm_ftb"
local fx_name = "scr_mp_chest_spawn_smoke"
local fx_scale = 0.3

---------------------------------------------
-- spawn props
---------------------------------------------
Citizen.CreateThread(function()
    while true do
        Wait(150)

        local pos = GetEntityCoords(cache.ped)
        local InRange = false

        for i = 1, #Config.PlayerProps do
            local prop = vector3(Config.PlayerProps[i].x, Config.PlayerProps[i].y, Config.PlayerProps[i].z)
            local dist = #(pos - prop)
            if dist >= 50.0 then goto continue end

            local hasSpawned = false
            InRange = true

            for z = 1, #SpawnedProps do
                local p = SpawnedProps[z]

                if p.id == Config.PlayerProps[i].id then
                    hasSpawned = true
                end
            end

            if hasSpawned then goto continue end

            local modelHash = Config.PlayerProps[i].hash
            local data = {}
            
            if not HasModelLoaded(modelHash) then
                RequestModel(modelHash)
                while not HasModelLoaded(modelHash) do
                    Wait(1)
                end
            end
            
            data.id = Config.PlayerProps[i].id
            data.obj = CreateObject(modelHash, Config.PlayerProps[i].x, Config.PlayerProps[i].y, Config.PlayerProps[i].z -1.2, false, false, false)
            SetEntityHeading(data.obj, Config.PlayerProps[i].h)
            SetEntityAsMissionEntity(data.obj, true)
            PlaceObjectOnGroundProperly(data.obj)
            Wait(1000)
            FreezeEntityPosition(data.obj, true)
            SetModelAsNoLongerNeeded(data.obj)

            if Config.EnableVegModifier then
                -- veg modifiy
                local veg_modifier_sphere = 0
                
                if veg_modifier_sphere == nil or veg_modifier_sphere == 0 then
                    local veg_radius = 3.0
                    local veg_Flags =  1 + 2 + 4 + 8 + 16 + 32 + 64 + 128 + 256
                    local veg_ModType = 1
                    
                    veg_modifier_sphere = AddVegModifierSphere(Config.PlayerProps[i].x, Config.PlayerProps[i].y, Config.PlayerProps[i].z, veg_radius, veg_ModType, veg_Flags, 0)
                    
                else
                    RemoveVegModifierSphere(Citizen.PointerValueIntInitialized(veg_modifier_sphere), 0)
                    veg_modifier_sphere = 0
                end
            end

            SpawnedProps[#SpawnedProps + 1] = data
            hasSpawned = false

            -- create target for the entity
            exports['rsg-target']:AddTargetEntity(data.obj, {
                options = {
                    {
                        type = 'client',
                        icon = 'far fa-eye',
                        label = 'Open Moneybox',
                        action = function()
                            TriggerEvent('rex-moneybox:client:openmoneybox', data.id, data.obj)
                        end
                    },
                },
                distance = 3
            })
            -- end of target

            ::continue::
        end

        if not InRange then
            Wait(5000)
        end
    end
end)

---------------------------------------------
-- open moneybox menu
---------------------------------------------
RegisterNetEvent('rex-moneybox:client:openmoneybox', function(boxid, entity)
    RSGCore.Functions.TriggerCallback('rex-moneybox:server:getallpropdata', function(result)
        lib.registerContext({
            id = 'moneybox_menu',
            title = 'Moneybox $'..result[1].cashamount,
            options = {
                {
                    title = 'Add Cash',
                    icon = 'fa-solid fa-sack-dollar',
                    iconColor = 'green',
                    event = 'rex-moneybox:client:addcash',
                    args = {
                        boxid = boxid
                    },
                    arrow = true
                },
                {
                    title = 'Remove Cash',
                    icon = 'fa-solid fa-sack-dollar',
                    iconColor = 'red',
                    event = 'rex-moneybox:client:removecash',
                    args = {
                        boxid = boxid
                    },
                    arrow = true
                },
                {
                    title = 'Pickup Moneybox',
                    icon = 'fa-solid fa-box',
                    event = 'rex-moneybox:client:pickupmoneybox',
                    args = {
                        boxid = boxid,
                        entity = entity,
                    },
                    arrow = true
                },
            }
        })
        lib.showContext('moneybox_menu')
    end, boxid)
end)

-------------------------------------------------------------------------------------------
-- add cash
-------------------------------------------------------------------------------------------
RegisterNetEvent('rex-moneybox:client:addcash', function(data)
    RSGCore.Functions.TriggerCallback('rex-moneybox:server:getallpropdata', function(result)
        local input = lib.inputDialog('Add Cash : $'..result[1].cashamount, {
            { 
                type = 'input',
                label = 'Amount',
                icon = 'fa-solid fa-dollar-sign',
                required = true
            },
        })
        
        if not input then
            return
        end

        RSGCore.Functions.TriggerCallback('rex-moneybox:server:cashcallback', function(playercash)

            local cash = tonumber(result[1].cashamount)
            local amount = tonumber(input[1])

            if amount > playercash then
                lib.notify({ title = 'Insufficient Funds', type = 'error', duration = 7000 })
                return
            end
            
            local updatecash = (amount + cash)
            
            TriggerServerEvent('rex-moneybox:server:updatecash', 'add', data.boxid, updatecash, amount)

        end)

    end, data.boxid)
end)

-------------------------------------------------------------------------------------------
-- remove cash
-------------------------------------------------------------------------------------------
RegisterNetEvent('rex-moneybox:client:removecash', function(data)
    RSGCore.Functions.TriggerCallback('rex-moneybox:server:getallpropdata', function(result)
        local input = lib.inputDialog('Remove Cash : $'..result[1].cashamount, {
            { 
                type = 'input',
                label = 'Amount',
                icon = 'fa-solid fa-dollar-sign',
                required = true
            },
        })
        
        if not input then
            return
        end

        local cash = tonumber(result[1].cashamount)
        local amount = tonumber(input[1])
        
        if amount > cash then
            lib.notify({ title = 'Insufficient Funds', type = 'error', duration = 7000 })
            return
        end
        
        local updatecash = (cash - amount)
        
        TriggerServerEvent('rex-moneybox:server:updatecash', 'remove', data.boxid, updatecash, amount)
        
    end, data.boxid)
end)

---------------------------------------------
-- pickup moneybox
---------------------------------------------
RegisterNetEvent('rex-moneybox:client:pickupmoneybox', function(data)

    if not isBusy then
        isBusy = true
        local anim1 = `WORLD_HUMAN_CROUCH_INSPECT`
        FreezeEntityPosition(cache.ped, true)
        TaskStartScenarioInPlace(cache.ped, anim1, 0, true)
        Wait(3000)
        ClearPedTasks(cache.ped)
        local boxcoords = GetEntityCoords(data.entity)
        local fxcoords = vector3(boxcoords.x, boxcoords.y, boxcoords.z)
        UseParticleFxAsset(fx_group)
        smoke = StartParticleFxNonLoopedAtCoord(fx_name, fxcoords, 0.0, 0.0, 0.0, fx_scale, false, false, false, true)

        RSGCore.Functions.TriggerCallback('rex-moneybox:server:getallpropdata', function(result)
            local cashamount = tonumber(result[1].cashamount)
            TriggerServerEvent('rex-moneybox:server:pickupmoneybox', data.boxid, Config.MoneyBoxItem, cashamount)
        end, data.boxid)

        FreezeEntityPosition(cache.ped, false)
        isBusy = false
        return
    else
        lib.notify({ title = 'You are busy doing someting!', type = 'error', duration = 7000 })
    end

end)

---------------------------------------------
-- remove prop object
---------------------------------------------
RegisterNetEvent('rex-moneybox:client:removePropObject')
AddEventHandler('rex-moneybox:client:removePropObject', function(prop)
    for i = 1, #SpawnedProps do
        local o = SpawnedProps[i]

        if o.id == prop then
            SetEntityAsMissionEntity(o.obj, false)
            FreezeEntityPosition(o.obj, false)
            DeleteObject(o.obj)
        end
    end
end)

---------------------------------------------
-- update props
---------------------------------------------
RegisterNetEvent('rex-moneybox:client:updatePropData')
AddEventHandler('rex-moneybox:client:updatePropData', function(data)
    Config.PlayerProps = data
end)

---------------------------------------------
-- place prop
---------------------------------------------
RegisterNetEvent('rex-moneybox:client:placeNewProp')
AddEventHandler('rex-moneybox:client:placeNewProp', function(proptype, pHash, pos, heading)
    RSGCore.Functions.TriggerCallback('rex-moneybox:server:countprop', function(result)

        if result > Config.MaxMoneyBoxes then
            lib.notify({ title = 'Max Moneyboxes Reached', type = 'error', duration = 7000 })
            return
        end

        if CanPlacePropHere(pos) and not IsPedInAnyVehicle(PlayerPedId(), false) and not isBusy then
            isBusy = true
            local anim1 = `WORLD_HUMAN_CROUCH_INSPECT`
            FreezeEntityPosition(cache.ped, true)
            TaskStartScenarioInPlace(cache.ped, anim1, 0, true)
            Wait(10000)
            ClearPedTasks(cache.ped)
            FreezeEntityPosition(cache.ped, false)
            TriggerServerEvent('rex-moneybox:server:newProp', proptype, pos, heading, pHash)
            isBusy = false
            return
        else
            lib.notify({ title = 'Can\'t Place Here', type = 'error', duration = 7000 })
        end

    end, proptype)

end)

---------------------------------------------
-- check to see if prop can be place here
---------------------------------------------
function CanPlacePropHere(pos)
    local canPlace = true

    for i = 1, #Config.PlayerProps do
        local checkprops = vector3(Config.PlayerProps[i].x, Config.PlayerProps[i].y, Config.PlayerProps[i].z)
        local dist = #(pos - checkprops)
        if dist < 3 then
            canPlace = false
        end
    end
    return canPlace
end

---------------------------------------------
-- clean up
---------------------------------------------
AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end

    for i = 1, #SpawnedProps do
        local props = SpawnedProps[i].obj
        SetEntityAsMissionEntity(props, false)
        FreezeEntityPosition(props, false)
        DeleteObject(props)
    end
end)
