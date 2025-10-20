local RSGCore = exports['rsg-core']:GetCoreObject()
local SpawnedProps = {}
local isBusy = false
local fx_group = "scr_dm_ftb"
local fx_name = "scr_mp_chest_spawn_smoke"
local fx_scale = 1.0

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
                        event = 'rex-stashes:client:openstash',
                        icon = "far fa-eye",
                        label = Lang:t('client.lang_1'),
                        stashid = data.id,
                    },
                    {
                        type = 'client',
                        event = 'rex-stashes:client:distroystash',
                        icon = "far fa-eye",
                        label = Lang:t('client.lang_2'),
                        stashid = data.id,
                        entity = data.obj,
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

-- ---------------------------------------------
-- -- open stash
-- ---------------------------------------------
RegisterNetEvent('rex-stashes:client:openstash', function(data)
    local stashName = 'stash'..data.stashid
    print("Client Event Triggered: Opening stash with ID: ", stashName) -- Debug print
    TriggerServerEvent('rex-stashes-hotel:server:openinventory', stashName)
end)



---------------------------------------------
-- distroy stash
---------------------------------------------
RegisterNetEvent('rex-stashes:client:distroystash', function(data)

    -- confirm destroy
    local input = lib.inputDialog(Lang:t('client.lang_3'), {
        {
            label = Lang:t('client.lang_4'),
            description = Lang:t('client.lang_5'),
            type = 'select',
            options = {
                { value = 'yes', label = Lang:t('client.lang_6') },
                { value = 'no', label = Lang:t('client.lang_7') }
            },
            required = true
        },
    })
        
    if not input then
        return
    end
    
    if input[1] == 'no' then
        return
    end

    -- progress bar
    lib.progressBar({
        duration = Config.DestroyTime,
        position = 'bottom',
        useWhileDead = false,
        canCancel = false,
        disableControl = true,
        label = Lang:t('client.lang_8'),
    })
    
    local stashcoords = GetEntityCoords(data.entity)
    local fxcoords = vector3(stashcoords.x, stashcoords.y, stashcoords.z)
    UseParticleFxAsset(fx_group)
    smoke = StartParticleFxNonLoopedAtCoord(fx_name, fxcoords, 0.0, 0.0, 0.0, fx_scale, false, false, false, true)
    TriggerServerEvent('rex-stashes:server:destroyProp', data.stashid, 'playerstash')
end)

---------------------------------------------
-- remove prop object
---------------------------------------------
RegisterNetEvent('rex-stashes:client:removePropObject')
AddEventHandler('rex-stashes:client:removePropObject', function(prop)
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
RegisterNetEvent('rex-stashes:client:updatePropData')
AddEventHandler('rex-stashes:client:updatePropData', function(data)
    Config.PlayerProps = data
end)

---------------------------------------------
-- place prop
---------------------------------------------
RegisterNetEvent('rex-stashes:client:placeNewProp')
AddEventHandler('rex-stashes:client:placeNewProp', function(proptype, pHash, pos, heading)
    -- Add isBusy check at the start to prevent multiple attempts
    if isBusy then
        lib.notify({ title = "Already placing a stash!", type = 'error', duration = 3000 })
        return
    end
    
    RSGCore.Functions.TriggerCallback('rex-stashes:server:countprop', function(result)
        print("Current stash count for player: ", result) -- Debug print
        
        if result >= 1 then
            print("Placement blocked - player already has", result, "stashes") -- Debug print
            lib.notify({ title = "You can only place 1 stash!", type = 'error', duration = 7000 })
            return
        end

        if CanPlacePropHere(pos) and not IsPedInAnyVehicle(PlayerPedId(), false) and not isBusy then
            print("Placement validation passed, starting placement...") -- Debug print
            isBusy = true
            local anim1 = `WORLD_HUMAN_CROUCH_INSPECT`
            FreezeEntityPosition(cache.ped, true)
            TaskStartScenarioInPlace(cache.ped, anim1, 0, true)
            Wait(10000)
            ClearPedTasks(cache.ped)
            FreezeEntityPosition(cache.ped, false)
            -- ONLY trigger server event if placement is successful
            TriggerServerEvent('rex-stashes:server:newProp', proptype, pos, heading, pHash)
            isBusy = false
            return
        else
            -- Placement failed - don't remove item
            print("Placement validation failed") -- Debug print
            lib.notify({ title = Lang:t('client.lang_10'), type = 'error', duration = 7000 })
        end

    end, proptype)

end)

---------------------------------------------
-- check to see if prop can be place here
---------------------------------------------
function CanPlacePropHere(pos)
    local canPlace = true

    local ZoneTypeId = 1
    local x,y,z =  table.unpack(GetEntityCoords(cache.ped))
    local town = Citizen.InvokeNative(0x43AD8FC02B429D33, x,y,z, ZoneTypeId)
    if town ~= false then
        canPlace = false
    end

    for i = 1, #Config.PlayerProps do
        local checkprops = vector3(Config.PlayerProps[i].x, Config.PlayerProps[i].y, Config.PlayerProps[i].z)
        local dist = #(pos - checkprops)
        if dist < 1.3 then
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