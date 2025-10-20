local RSGCore = exports['rsg-core']:GetCoreObject()

-- Event to create a new fine
RegisterNetEvent('medic-fines:client:createfine', function(infratorid, id, location)
    local playerPed = PlayerPedId()
    SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true) -- unarm player
    Wait(1000)
    -- Start notebook animation
    Citizen.InvokeNative(0x524B54361229154F, PlayerPedId(), GetHashKey("world_human_write_notebook"), 9999999999, true,
        false, false, false)

    local menu = jo.menu.create('finesmenu', {
        title = Language.lang_3,
        subtitle = Language.lang_4,
        onEnter = function()
        end,
        onBack = function()
            jo.menu.show(false)
            TriggerEvent('medic-fines:client:endanimation')
        end,
        onExit = function()
            TriggerEvent('medic-fines:client:endanimation')
        end,
    })

    -- Add fine creation option
    menu:addItem({
        title = Language.lang_5,
        icon = 'plus',
        statistics = {
            { value = Language.lang_6 },
        },
        onClick = function()
            jo.menu.show(false)
            local input = lib.inputDialog(Language.lang_7, {
                { type = 'input',    label = Language.lang_12, description = Language.lang_13, required = true, min = 2,         max = 16 },
                { type = 'input',    label = Language.lang_14, description = Language.lang_15, required = true, min = 2,         max = 16 },
                { type = 'textarea', label = Language.lang_8,  description = Language.lang_9,  autosize = true, required = true, min = 1, max = 500 },
                { type = 'number',   label = Language.lang_10, description = Language.lang_11, icon = 'hashtag' } })

            if not input then
                jo.menu.show(true)
                return
            end
            
            if input then
                local name = input[1]
                local lastname = input[2]
                local description = input[3]
                local fine = tonumber(input[4])
                TriggerServerEvent('medic-fines:server:registerfine', infratorid, name, lastname, description, fine,
                    location)
                TriggerEvent('medic-fines:client:endanimation')
            end
        end
    })

    -- Add archives option
    menu:addItem({
        title = Language.lang_16,
        icon = 'tick',
        statistics = {
            { value = Language.lang_17 },
        },
        onClick = function()
            jo.menu.show(false)
            TriggerServerEvent('medic-fines:server:getarchivesall')
        end,
    })

    -- Send the menu to the NUI
    menu:send()

    -- Define the current menu
    jo.menu.setCurrentMenu('finesmenu', false, true)

    -- Show the menu
    jo.menu.show(true, true, false)
end)

-- Event to end animation 
RegisterNetEvent('medic-fines:client:endanimation', function()
    local playerPed = PlayerPedId()
    FreezeEntityPosition(PlayerPedId(), false)
    Wait(1000)
    ClearPedSecondaryTask(PlayerPedId())
    ClearPedTasks(PlayerPedId())
end)

-- Event for showing all archives

RegisterNetEvent('medic-fines:client:archivesall', function(archives, location, jobtype)
    if archives == nil or #archives == 0 then
        jo.notif.rightError(Language.lang_31)
        TriggerEvent('medic-fines:client:endanimation')
        return
    end

    local menu = jo.menu.create('archivesmenuall', {
        title = Language.lang_3,
        subtitle = Language.lang_18,
        onEnter = function()
        end,
        onBack = function()
            -- This was trying to go back to finesmenu, but if opened directly from command
            -- there is no finesmenu to go back to
            jo.menu.show(false)
            TriggerEvent('medic-fines:client:endanimation')
        end,
        onExit = function()
            jo.menu.show(false)
            TriggerEvent('medic-fines:client:endanimation')
        end,
    })

    if jobtype == 'leo' then
        for _, v in pairs(archives) do
            menu:addItem({
                title = v.Name .. ' ' .. v.LastName,
                priceRight = v.Fine,
                icon = 'buyclothes',
                statistics = {
                    { label = Language.lang_19, value = v.Date },
                    { label = Language.lang_21, value = v.Officer },
                    { label = Language.lang_22, value = v.Location },
                    { label = Language.lang_23, value = v.Description },
                },
                onClick = function()
                    if location == v.Location then
                        local PlayerJob = RSGCore.Functions.GetPlayerData().job
                        if PlayerJob.isboss then
                            local alert = lib.alertDialog({
                                header = Language.lang_24,
                                content = Language.lang_25,
                                centered = true,
                                cancel = true
                            })

                            if alert == 'confirm' then
                                TriggerServerEvent('medic-fines:server:deletefine', v.FineId)
                                TriggerEvent('medic-fines:client:endanimation')
                                jo.menu.show(false)
                            end
                        else
                            jo.notif.rightError(Language.lang_26)
                        end
                    else
                        jo.notif.rightError(Language.lang_27)
                    end
                end,
            })
        end
    else
        for _, v in pairs(archives) do
            if location == v.Location then
                menu:addItem({
                    title = v.Name .. ' ' .. v.LastName,
                    priceRight = v.Fine,
                    icon = 'buyclothes',
                    statistics = {
                        { label = Language.lang_19, value = v.Date },
                        { label = Language.lang_21, value = v.Officer },
                        { label = Language.lang_22, value = v.Location },
                        { label = Language.lang_23, value = v.Description },
                    },
                    onClick = function()
                        local PlayerJob = RSGCore.Functions.GetPlayerData().job
                        if PlayerJob.isboss then
                            local alert = lib.alertDialog({
                                header = Language.lang_24,
                                content = Language.lang_25,
                                centered = true,
                                cancel = true
                            })

                            if alert == 'confirm' then
                                TriggerServerEvent('medic-fines:server:deletefine', v.FineId)
                                TriggerEvent('medic-fines:client:endanimation')
                                jo.menu.show(false)
                            end
                        else
                            jo.notif.rightError(Language.lang_26)
                        end
                    end,
                })
            end
        end
    end

    -- Send the menu to the NUI
    menu:send()

    -- Define the current menu
    jo.menu.setCurrentMenu('archivesmenuall', false, true)

    -- Show the menu
    jo.menu.show(true, true, false)
end)

 

-- Event for showing player's fines
RegisterNetEvent('medic-fines:client:myfinesmenu', function(archives, citizenid)
    if archives == nil or #archives == 0 then
        jo.notif.rightError(Language.lang_31)
        TriggerEvent('medic-fines:client:endanimation')
        return
    end
    
    local menu = jo.menu.create('myfinesmenu', {
        title = Language.lang_3,
        subtitle = Language.lang_18,
        onEnter = function()
        end,
        onBack = function()
            jo.menu.show(false)
            TriggerEvent('medic-fines:client:endanimation')
        end,
        onExit = function()
            TriggerEvent('medic-fines:client:endanimation')
        end,
    })

    local hasFines = false
    for _, v in pairs(archives) do
        if citizenid == v.InfratorId then
            hasFines = true
            menu:addItem({
                title = v.Name .. ' ' .. v.LastName,
                priceRight = v.Fine,
                icon = 'buyclothes',
                statistics = {
                    { label = Language.lang_19, value = v.Date },
                    { label = Language.lang_21, value = v.Officer },
                    { label = Language.lang_22, value = v.Location },
                    { label = Language.lang_23, value = v.Description },
                },
                onClick = function()
                    TriggerServerEvent('medic-fines:server:payfine', v.FineId, v.Fine, v.Location)
                    TriggerEvent('medic-fines:client:endanimation')
                    jo.menu.show(false)
                end,
            })
        end
    end

    -- If no fines were found for this citizen, close menu and show notification
    if not hasFines then
        jo.notif.rightError(Language.lang_31)
        TriggerEvent('medic-fines:client:endanimation')
        return
    end

    -- Send the menu to the NUI
    menu:send()

    -- Define the current menu
    jo.menu.setCurrentMenu('myfinesmenu', false, true)

    -- Show the menu
    jo.menu.show(true, true, false)
end)

-- Event for when no fines exist
RegisterNetEvent('medic-fines:client:nofines', function()
    jo.notif.rightError(Language.lang_31)
    TriggerEvent('medic-fines:client:endanimation')
end)