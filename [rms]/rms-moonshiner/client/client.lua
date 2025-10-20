local RSGCore = exports['rsg-core']:GetCoreObject()
local SpawnedProps = {}
local isBusy = false

---------------------------------------------
-- spawn props
---------------------------------------------
Citizen.CreateThread(function()
    while true do
        Wait(150)

        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
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
            data.builder = Config.PlayerProps[i].builder
            data.obj = CreateObject(modelHash, Config.PlayerProps[i].x, Config.PlayerProps[i].y, Config.PlayerProps[i].z -1.2, false, false, false)
            SetEntityHeading(data.obj, Config.PlayerProps[i].h)
            SetEntityAsMissionEntity(data.obj, true)
            PlaceObjectOnGroundProperly(data.obj)
            Wait(1000)
            FreezeEntityPosition(data.obj, true)
            SetModelAsNoLongerNeeded(data.obj)

            -- veg modifiy
            local veg_modifier_sphere = 0
            
            if veg_modifier_sphere == nil or veg_modifier_sphere == 0 then
                local veg_radius = 3.0
                local veg_Flags =  1 + 2 + 4 + 8 + 16 + 32 + 64 + 128 + 256
                local veg_ModType = 1
                
                veg_modifier_sphere = Citizen.InvokeNative(0xFA50F79257745E74, Config.PlayerProps[i].x, Config.PlayerProps[i].y, Config.PlayerProps[i].z, veg_radius, veg_ModType, veg_Flags, 0)
                
            else
                Citizen.InvokeNative(0x9CF1836C03FB67A2, Citizen.PointerValueIntInitialized(veg_modifier_sphere), 0)
                veg_modifier_sphere = 0
            end

            if Config.PlayerProps[i].proptype == 'campmoonshine' then
                -- create target for the entity
                exports['rsg-target']:AddTargetEntity(data.obj, {
                    options = {
                        {
                            type = 'client',
                            event = 'rms-moonshiner:client:mainmenu',
                            icon = 'fa-solid fa-tent',
                            label = Lang:t('client.lang_2'),
                            builder = data.builder,
                            canInteract = function(entity)
                                local PlayerData = RSGCore.Functions.GetPlayerData()
                                return PlayerData.citizenid == data.builder
                            end
                        },
                        {
                            type = 'client',
                            event = 'rms-moonshiner:client:leodestroystill',
                            icon = 'fa-solid fa-hammer',
                            label = 'Destroy Moonshine Still',
                            builder = data.builder,
                            propid = data.id,
                            canInteract = function(entity)
                                local PlayerData = RSGCore.Functions.GetPlayerData()
                                return PlayerData.job.type == 'leo'
                            end
                        },
                    },
                    distance = 5
                })
                -- end of target
            end

            SpawnedProps[#SpawnedProps + 1] = data
            hasSpawned = false

            ::continue::
        end

        if not InRange then
            Wait(5000)
        end
    end
end)

---------------------------------------------
-- camp menu
---------------------------------------------
RegisterNetEvent('rms-moonshiner:client:mainmenu', function(data)
    local PlayerData = RSGCore.Functions.GetPlayerData()
    local playercid = PlayerData.citizenid
    if playercid == data.builder then
        lib.registerContext({
            id = 'camp_mainmenu',
            title = Lang:t('client.lang_2'),
            options = {
                {
                    title = Lang:t('client.lang_3'),
                    description = Lang:t('client.lang_4'),
                    icon = 'fa-solid fa-campground',
                    event = 'rms-moonshiner:client:campitemsmenu', 
                    args = { cid = playercid },
                    arrow = true
                },
                {
                    title = Lang:t('client.lang_5'),
                    description = Lang:t('client.lang_6'),
                    icon = 'fa-solid fa-box',
                    event = 'rms-moonshiner:client:campstorage',
                    arrow = true
                },
                {
                    title = Lang:t('client.lang_2'),
                    description = Lang:t('client.lang_2'),
                    icon = 'fa-solid fa-box',
                    event = 'rms-moonshiner:client:moonshinemainmenu',
                    arrow = true
                },
            }
        })
        lib.showContext("camp_mainmenu")
    end
end)


---------------------------------------------
-- camp deployed
---------------------------------------------
RegisterNetEvent('rms-moonshiner:client:campitemsmenu')
AddEventHandler('rms-moonshiner:client:campitemsmenu', function(data)
    local options = {}
    for k, v in pairs(Config.PlayerProps) do
        if v.builder == data.cid then
            options[#options + 1] = {
                title = RSGCore.Shared.Items[v.proptype].label,
                icon = 'fa-solid fa-box',
                event = 'rms-moonshiner:client:propmenu',
                args = { propid = v.id },
                arrow = true,
            }
        end
        lib.registerContext({
            id = 'camp_deployed',
            title = Lang:t('client.lang_12'),
            menu = 'camp_mainmenu',
            onBack = function() end,
            position = 'top-right',
            options = options
        })
        lib.showContext('camp_deployed')        
    end
end)

---------------------------------------------
-- prop menu
---------------------------------------------
RegisterNetEvent('rms-moonshiner:client:propmenu', function(data)
    RSGCore.Functions.TriggerCallback('rms-moonshiner:server:getallpropdata', function(result)
        if Config.EnableCredit then
            lib.registerContext({
                id = 'camp_propmenu',
                title = RSGCore.Shared.Items[result[1].proptype].label,
                menu = 'camp_deployed',
                onBack = function() end,
                options = {
                    {
                        title = Lang:t('client.lang_13')..result[1].credit,
                        description = Lang:t('client.lang_14'),
                        icon = 'fa-solid fa-coins',
                    },
                    {
                        title = Lang:t('client.lang_15'),
                        description = Lang:t('client.lang_16'),
                        icon = 'fa-solid fa-plus',
                        iconColor = 'green',
                        event = 'rms-moonshiner:client:addcredit',
                        args = { 
                            propid = result[1].propid,
                            credit = result[1].credit
                        },
                        arrow = true
                    },
                    {
                        title = Lang:t('client.lang_17'),
                        description = Lang:t('client.lang_18'),
                        icon = 'fa-solid fa-minus',
                        iconColor = 'red',
                        event = 'rms-moonshiner:client:removecredit',
                        args = { 
                            propid = result[1].propid,
                            credit = result[1].credit
                        },
                        arrow = true
                    },
                }
            })
        else
            lib.registerContext({
                id = 'camp_propmenu',
                title = RSGCore.Shared.Items[result[1].proptype].label,
                menu = 'camp_deployed',
                onBack = function() end,
                options = {
                    {
                        title = Lang:t('client.lang_19'),
                        description = Lang:t('client.lang_20'),
                        icon = 'fa-solid fa-box',
                        iconColor = 'red',
                        event = 'rms-moonshiner:client:packuptent',
                        args = { 
                            propid = result[1].propid,
                            item = result[1].proptype
                        },
                        arrow = true
                    },
                }
            })
        end
        lib.showContext("camp_propmenu")
    end, data.propid)
end)

---------------------------------------------
-- packup campsite
---------------------------------------------
RegisterNetEvent('rms-moonshiner:client:packuptent', function(data)
    if data.item == 'campmoonshine' then
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        DoScreenFadeOut(500)
        Wait(1000)
        Citizen.InvokeNative(0x203BEFFDBE12E96A, ped, pos.x, pos.y +4, pos.z -0.8)
        if DoesBlipExist (blip) then
           RemoveBlip(blip)
        end
        Wait(1500)
        TriggerServerEvent('rms-moonshiner:server:destroyProp', data.propid, data.item)
        DoScreenFadeIn(1800)
    else
        TriggerServerEvent('rms-moonshiner:server:destroyProp', data.propid, data.item)
    end
end)

---------------------------------------------
-- add credit
---------------------------------------------
RegisterNetEvent('rms-moonshiner:client:addcredit', function(data)
    local PlayerData = RSGCore.Functions.GetPlayerData()
    local cash = tonumber(PlayerData.money['cash'])
    local input = lib.inputDialog(Lang:t('client.lang_21'), {
        { 
            label = Lang:t('client.lang_22'),
            type = 'input',
            required = true,
            icon = 'fa-solid fa-dollar-sign'
        },
    })
    
    if not input then
        return
    end
    
    if tonumber(input[1]) == nil then
        return
    end

    if cash >= tonumber(input[1]) then
        local creditadjust = data.credit + tonumber(input[1])
        TriggerServerEvent('rms-moonshiner:server:addcredit', creditadjust, tonumber(input[1]), data.propid )
    else
        lib.notify({ title = Lang:t('client.lang_23'), description = Lang:t('client.lang_24'), type = 'error', duration = 5000 })
    end
end)

---------------------------------------------
-- remove credit
---------------------------------------------
RegisterNetEvent('rms-moonshiner:client:removecredit', function(data)
    local PlayerData = RSGCore.Functions.GetPlayerData()
    local cash = tonumber(PlayerData.money['cash'])
    local input = lib.inputDialog(Lang:t('client.lang_25'), {
        { 
            label = Lang:t('client.lang_26'),
            type = 'input',
            required = true,
            icon = 'fa-solid fa-dollar-sign'
        },
    })
    
    if not input then
        return
    end
    
    if tonumber(input[1]) == nil then
        return
    end
    if tonumber(input[1]) < tonumber(data.credit)  then
        local creditadjust = tonumber(data.credit) - tonumber(input[1])
        TriggerServerEvent('rms-moonshiner:server:removecredit', creditadjust, tonumber(input[1]), data.propid )
    else
        lib.notify({ title = Lang:t('client.lang_27'), description = Lang:t('client.lang_28'), type = 'error', duration = 5000 })
    end
end)

RegisterNetEvent('rms-moonshiner:client:removecredit', function(data)
    local PlayerData = RSGCore.Functions.GetPlayerData()
    local input = lib.inputDialog(Lang:t('client.lang_25'), {
        { 
            label = Lang:t('client.lang_26'),
            type = 'input',
            required = true,
            icon = 'fa-solid fa-box'
        },
    })

    if not input then return end

    local amount = tonumber(input[1])
    if not amount then return end

    -- Check how many 'bread' items the player has
    local itemAmount = 0
    for _, item in pairs(PlayerData.items) do
        if item.name == "bread" then
            itemAmount = item.amount
            break
        end
    end

    if amount > itemAmount then
        lib.notify({ 
            title = Lang:t('client.lang_27'), 
            description = 'You dont have enough Camp supplies to pay that much.', 
            type = 'error', 
            duration = 5000 
        })
        return
    end

    if amount <= tonumber(data.credit) then
        local creditadjust = tonumber(data.credit) - amount
        TriggerServerEvent('rms-moonshiner:server:removecredit', creditadjust, amount, data.propid )
    else
        lib.notify({ 
            title = Lang:t('client.lang_27'), 
            description = Lang:t('client.lang_28'), 
            type = 'error', 
            duration = 5000 
        })
    end
end)

---------------------------------------------
-- LEO destroy moonshine still
---------------------------------------------
RegisterNetEvent('rms-moonshiner:client:leodestroystill', function(data)
    local PlayerData = RSGCore.Functions.GetPlayerData()
    
    -- Double check they're LEO
    if PlayerData.job.type ~= 'leo' then
        lib.notify({ 
            title = 'Access Denied', 
            description = 'Only law enforcement can destroy stills', 
            type = 'error', 
            duration = 5000 
        })
        return
    end
    
    -- Confirm destruction
    local alert = lib.alertDialog({
        header = 'Destroy Moonshine Still',
        content = 'Are you sure you want to destroy this illegal moonshine operation? This action cannot be undone.',
        centered = true,
        cancel = true
    })
    
    if alert == 'confirm' then
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        
        -- Play destruction animation
        FreezeEntityPosition(ped, true)
        TaskStartScenarioInPlace(ped, `WORLD_HUMAN_HAMMER`, 0, true)
        
        lib.notify({ 
            title = 'Destroying Still', 
            description = 'Breaking down the moonshine operation...', 
            type = 'inform', 
            duration = 5000 
        })
        
        Wait(10000)
        
        ClearPedTasks(ped)
        FreezeEntityPosition(ped, false)
        
        -- Trigger server to destroy the prop
        TriggerServerEvent('rms-moonshiner:server:leodestroyProp', data.propid)
        
        lib.notify({ 
            title = 'Still Destroyed', 
            description = 'The illegal moonshine operation has been shut down', 
            type = 'success', 
            duration = 5000 
        })
    end
end)

---------------------------------------------
-- remove prop object
---------------------------------------------
RegisterNetEvent('rms-moonshiner:client:removePropObject')
AddEventHandler('rms-moonshiner:client:removePropObject', function(prop)
    for i = 1, #SpawnedProps do
        local o = SpawnedProps[i]

        if o.id == prop then
            SetEntityAsMissionEntity(o.obj, false)
            FreezeEntityPosition(o.obj, false)
            DeleteObject(o.obj)
        end
    end
    Wait(1000)
    if lib.isTextUIOpen() then
        Wait(500)
        lib.hideTextUI()
    end
end)

---------------------------------------------
-- update props
---------------------------------------------
RegisterNetEvent('rms-moonshiner:client:updatePropData')
AddEventHandler('rms-moonshiner:client:updatePropData', function(data)
    Config.PlayerProps = data
end)

---------------------------------------------
-- place prop
---------------------------------------------
RegisterNetEvent('rms-moonshiner:client:placeNewProp')
AddEventHandler('rms-moonshiner:client:placeNewProp', function(proptype, pHash, item, pos, heading)
    RSGCore.Functions.TriggerCallback('rms-moonshiner:server:countprop', function(result)
        if proptype == 'p_beartrap01x' and result > 0 then
            lib.notify({ title = Lang:t('client.lang_29'), description = Lang:t('client.lang_30'), type = 'error', duration = 7000 })
            return
        end

        local ped = PlayerPedId()
        if CanPlacePropHere(pos) and not IsPedInAnyVehicle(PlayerPedId(), false) and not isBusy then
            isBusy = true
            local anim1 = `WORLD_HUMAN_CROUCH_INSPECT`
            FreezeEntityPosition(ped, true)
            TaskStartScenarioInPlace(ped, anim1, 0, true)
            Wait(10000)
            ClearPedTasks(ped)
            FreezeEntityPosition(ped, false)
            TriggerServerEvent('rms-moonshiner:server:newProp', proptype, pos, heading, pHash)
            isBusy = false

            return
        end

        lib.notify({ title = Lang:t('client.lang_31'), description = Lang:t('client.lang_32'), type = 'error', duration = 7000 })

        Wait(3000)
    end, proptype)
end)

---------------------------------------------
-- check to see if prop can be place here
---------------------------------------------
function CanPlacePropHere(pos)
    local canPlace = true

    local ZoneTypeId = 1
    local x,y,z =  table.unpack(GetEntityCoords(PlayerPedId()))
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
-- rob camp
---------------------------------------------
RegisterNetEvent('rms-moonshiner:client:robcamp')
AddEventHandler('rms-moonshiner:client:robcamp', function(data)
    local PlayerData = RSGCore.Functions.GetPlayerData()
    local playercid = PlayerData.citizenid
    if playercid ~= data.cid then
        local hasItem = RSGCore.Functions.HasItem('lockpick', 1)
        if hasItem == true then
            TriggerServerEvent('rms-moonshiner:server:removeitem', 'lockpick', 1)			
            local success = lib.skillCheck({'easy', 'easy', {areaSize = 60, speedMultiplier = 1}, 'easy'}, {'e'})
            if success == true then
                TriggerServerEvent("inventory:server:OpenInventory", "stash", "camp_" .. data.builder)
            else
                lib.notify({ title = Lang:t('client.lang_33'), description = Lang:t('client.lang_34'), type = 'error', duration = 7000 })
            end
        else
            lib.notify({ title = Lang:t('client.lang_35'), description = Lang:t('client.lang_36'), type = 'error', duration = 7000 })
        end
    else
        lib.notify({ title = Lang:t('client.lang_37'), description = Lang:t('client.lang_38'), type = 'error', duration = 7000 })
    end
end)

---------------------------------------------
-- camp storage
---------------------------------------------
RegisterNetEvent('rms-moonshiner:client:campstorage', function()
    local PlayerData = RSGCore.Functions.GetPlayerData()
    local playercid = PlayerData.citizenid
    TriggerServerEvent("rms-moonshiner:server:openinventory", 'camp_' .. playercid)
end)

---------------------------------------------
-- buy camp equipment
---------------------------------------------
RegisterNetEvent('rms-moonshiner:client:campingequipment')
AddEventHandler('rms-moonshiner:client:campingequipment', function()
    TriggerServerEvent('rsg-shops:server:openstore', 'moonshine', 'moonshine', 'Moonshine Equipment')
end)

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