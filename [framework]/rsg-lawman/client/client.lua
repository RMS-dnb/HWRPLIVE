local RSGCore = exports['rsg-core']:GetCoreObject()
local blipEntries = {}
local timer = Config.AlertTimer
local badge = false
local cachedPlayers = {}
lib.locale()
local lastHealth = 0
local lastPedHealth = {} -- Store previous health of NPCs
local lastAlertTime = 0 -- Cooldown system to prevent spam alerts
local alertCooldown = 5000 -- 5 seconds between alerts

local function GetPlayers()
    RSGCore.Functions.TriggerCallback('rsg-lawman:server:GetPlayers', function(players)
        -- Add self-jail option at the top of the list
        local selfPlayer = RSGCore.Functions.GetPlayerData()
        local selfOption = {
            value = 'self',
            label = '[SELF] Jail Yourself'
        }
        cachedPlayers = {selfOption}  -- Start with self option
        
        -- Add other players
        for _, player in pairs(players) do
            table.insert(cachedPlayers, player)
        end
    end)
    return cachedPlayers
end
-- ------------------------------------
-- -- prompts and blips if needed
-- ------------------------------------
-- CreateThread(function()
--     for _, v in pairs(Config.LawOfficeLocations) do
--         exports['rsg-core']:createPrompt(v.prompt, v.coords, RSGCore.Shared.Keybinds[Config.Keybind], "Open Menu", { -- Direct string instead of locale
--             type = 'client',
--             event = 'rsg-lawman:client:mainmenu',
--             args = { v.jobaccess, v.prompt },
--         })
        
--         if v.showblip == true then
--             local LawMenuBlip = BlipAddForCoords(1664425300, v.coords)
--             SetBlipSprite(LawMenuBlip, joaat(v.blipsprite), true)
--             SetBlipScale(LawMenuBlip, v.blipscale)
--             SetBlipName(LawMenuBlip, v.name)
--         end
--     end
-- end)


CreateThread(function()
    for _, v in pairs(Config.LawOfficeLocations) do
        
        exports.ox_target:addBoxZone({
            coords = v.coords,
            size = vec3(2.0, 2.0, 2.0),
            drawSprite = false,
            rotation = 0,
            debug = false,
            options = {
                {
                    name = 'law_office_' .. v.prompt,
                    icon = 'fas fa-gavel',
                    label = 'Law Menu',
                    drawSprite = false,
                    canInteract = function()
                        return true
                    end,
                    onSelect = function()
                        local result = lib.callback.await('btc-fines:server:getAllUnpaidFines', false)

                            if result.success then
                                local options = {}

                                if #result.fines == 0 then
                                    table.insert(options, {
                                        title = 'No unpaid fines found',
                                        icon = 'ban',
                                        disabled = true
                                    })
                                else
                                    for _, fine in pairs(result.fines) do
                                        table.insert(options, {
                                            title = ('$%s | %s %s | %s'):format(fine.fine, fine.firstname, fine.lastname, fine.description),
                                            description = ('Issued by: %s | %s'):format(fine.officername, fine.date),
                                            icon = 'gavel'
                                        })
                                    end
                                end

                                lib.registerContext({
                                    id = 'btc_unpaid_fines_list',
                                    title = 'All Unpaid Fines',
                                    options = options
                                })

                                lib.showContext('btc_unpaid_fines_list')
                            else
                                lib.notify({ title = 'Error', description = result.message or 'Failed to retrieve fines.', type = 'error' })
                            end
                        TriggerEvent('rsg-lawman:client:mainmenu', v.jobaccess, v.prompt)
                    end
                },
                {
                    name = 'fines_' .. v.prompt,
                    icon = 'fas fa-gavel',
                    label = 'Pending Fines',
                    drawSprite = false,
                    canInteract = function()
                        return true
                    end,
                    onSelect = function()
                        local result = lib.callback.await('btc-fines:server:getAllUnpaidFines', false)

                        if result.success then
                            local options = {}

                            if #result.fines == 0 then
                                table.insert(options, {
                                    title = 'No unpaid fines found',
                                    icon = 'ban',
                                    disabled = true
                                })
                            else
                                for _, fine in pairs(result.fines) do
                                    table.insert(options, {
                                        title = ('$%s | %s %s | %s'):format(fine.fine, fine.firstname, fine.lastname, fine.description),
                                        description = ('Issued by: %s | %s'):format(fine.officername, fine.date),
                                        icon = 'gavel'
                                    })
                                end
                            end

                            lib.registerContext({
                                id = 'btc_unpaid_fines_list',
                                title = 'All Unpaid Fines',
                                options = options
                            })

                            lib.showContext('btc_unpaid_fines_list')
                        else
                            lib.notify({ title = 'Error', description = result.message or 'Failed to retrieve fines.', type = 'error' })
                        end
                    end
                },
                {
                    name = 'evidence_lockers_menu_' .. v.prompt,
                    icon = 'fas fa-box',
                    label = 'Evidence Lockers',
                    drawSprite = false,
                    onSelect = function()
                        local playerType = lib.callback.await('rsg-lawman:server:CheckJobType', false)
                        if not playerType then lib.notify({ 
                                title = locale('cl_no_job'), 
                                description = "You aint law",
                                type = 'error', 
                                duration = 7000 
                            })
                            return 
                        end
                        local playerJob =   lib.callback.await('rsg-lawman:server:CheckJob', false)
                        local options = {
                                    {
                                        title = 'Locker - General',
                                        icon = 'box',
                                        onSelect = function()
                                            TriggerServerEvent('rsg-lawman:server:storageNames', 'general')
                                        end,
                                        disabled = (playerJob ~= 'doj') and (playerJob ~= 'usms')
                                    },
                                    {
                                        title = 'Locker - NHSO',
                                        icon = 'box',
                                        onSelect = function()
                                            TriggerServerEvent('rsg-lawman:server:storageNames', 'nhso')
                                        end,
                                        disabled = (playerJob ~= 'nhso') and (playerJob ~= 'doj') and (playerJob ~= 'usms')
                                    },
                                    {
                                        title = 'Locker - LSO',
                                        icon = 'box',
                                        onSelect = function()
                                            TriggerServerEvent('rsg-lawman:server:storageNames', 'lso')
                                        end,
                                        disabled = (playerJob ~= 'lso') and (playerJob ~= 'doj') and (playerJob ~= 'usms')
                                    },
                                    {
                                        title = 'Locker - NASO',
                                        icon = 'box',
                                        onSelect = function()
                                            TriggerServerEvent('rsg-lawman:server:storageNames', 'naso')
                                        end,
                                        disabled = (playerJob ~= 'naso') and (playerJob ~= 'doj') and (playerJob ~= 'usms')
                                    }

                                }

                                lib.registerContext({
                                    id = 'evidence_lockers_menu',
                                    title = 'Evidence Lockers',
                                    options = options
                                })

                                lib.showContext('evidence_lockers_menu')
                    end
                }
            }
        })
        
        -- Keep the blip creation as it was
        if v.showblip == true then
            local LawMenuBlip = BlipAddForCoords(1664425300, v.coords)
            SetBlipSprite(LawMenuBlip, joaat(v.blipsprite), true)
            SetBlipScale(LawMenuBlip, v.blipscale)
            SetBlipName(LawMenuBlip, v.name)
        end
    end
end)


RegisterNetEvent('rsg-lawman:client:mainmenu', function(jobaccess, name)
    local PlayerData = RSGCore.Functions.GetPlayerData()
    local playerjob = PlayerData.job.name  -- Specific job name (e.g., "vallaw")
    local jobtype = PlayerData.job.type    -- Job type (e.g., "leo")
    
    -- Debug info
    print("Player Job Name: " .. tostring(playerjob))
    print("Player Job Type: " .. tostring(jobtype))
    
    -- Handle when jobaccess is a table
    local hasAccess = false
    
    if type(jobaccess) == "table" then
        -- Check if player's job name is a value in the table (array style)
        for i, jobName in ipairs(jobaccess) do
            print("Checking against job value: " .. tostring(jobName))
            if playerjob == jobName or jobtype == jobName or (jobtype == "leo" and jobName == "leo") then
                hasAccess = true
                break
            end
        end
    else
        -- For string comparison
        hasAccess = (playerjob == jobaccess or jobtype == jobaccess or jobtype == "leo")
    end
    
    if hasAccess then
        lib.registerContext({
            id = 'lawoffice_mainmenu',
            title = locale('cl_menu'),
            options = {
                {
                    title = locale('cl_boss'),
                    description = locale('cl_boss_a'),
                    icon = 'fa-solid fa-user-tie',
                    event = 'rsg-bossmenu:client:mainmenu',
                    arrow = true
                },
                {
                    title = locale('cl_duty'),
                    icon = 'fa-solid fa-shield-heart',
                    event = 'rsg-lawman:client:ToggleDuty',
                    arrow = true
                },
                {
                    title = locale('cl_armo'),
                    description = locale('cl_armo_a'),
                    icon = 'fa-solid fa-person-rifle',
                    onSelect = function()
                        TriggerEvent('rsg-lawman:client:openarmoury', name)
                    end,
                    arrow = true
                },
                -- {
                --     title = locale('cl_vehicles'),
                --     description = locale('cl_vehicles_a'),
                --     icon = 'fa-solid fa-horse',
                --     event = 'rsg-lawman:client:vehiclemenu',
                --     arrow = true
                -- }
            }
        })
        lib.showContext("lawoffice_mainmenu")
    else
        -- Detailed error message showing what was checked
        local accessInfo = "Required jobs: "
        if type(jobaccess) == "table" then
            for i, jobName in ipairs(jobaccess) do
                accessInfo = accessInfo .. jobName .. ", "
            end
        else
            accessInfo = accessInfo .. tostring(jobaccess)
        end
        
        lib.notify({ 
            title = locale('cl_no_job'), 
            description = accessInfo .. " | Your job: " .. tostring(playerjob) .. " (Type: " .. tostring(jobtype) .. ")",
            type = 'error', 
            duration = 7000 
        })
    end
end)

-- RegisterNetEvent('rsg-lawman:client:vehiclemenu', function()
--     local PlayerData = RSGCore.Functions.GetPlayerData()
--     local playerjob = PlayerData.job.name
    
--     if playerjob == 'vallaw' or PlayerData.job.type == 'leo' then
--         local options = {}
        
--         -- Add locations for wagon
--         table.insert(options, {
--             title = locale('cl_spawn_location'),
--             description = locale('cl_select_spawn_location'),
--             icon = 'fa-solid fa-map-marker',
--             menu = 'law_wagon_locations',
--             arrow = true
--         })
        
--         -- Add locations for horse
--         table.insert(options, {
--             title = locale('cl_spawn_police_horse'),
--             description = locale('cl_spawn_police_horse_desc'),
--             icon = 'fa-solid fa-horse',
--             menu = 'law_horse_locations',
--             arrow = true
--         })
        
--         lib.registerContext({
--             id = 'law_vehicle_menu',
--             title = locale('cl_vehicles'),
--             options = options
--         })
        
--         -- Register wagon locations submenu
--         local wagonOptions = {}
--         for location, _ in pairs(Config.SpawnLocations) do
--             local locationName = location:gsub("_", " ")
--             locationName = locationName:gsub("^%l", string.upper)
            
--             table.insert(wagonOptions, {
--                 title = locale('cl_spawn_police_wagon_in') .. " " .. locationName,
--                 description = locale('cl_spawn_police_wagon_desc'),
--                 icon = 'fa-solid fa-horse',
--                 event = 'rsg-lawman:client:spawnvehicle',
--                 args = { model = 'policeWagon01x', location = location },
--                 arrow = true
--             })
--         end
        
--         lib.registerContext({
--             id = 'law_wagon_locations',
--             title = locale('cl_spawn_police_wagon'),
--             menu = 'law_vehicle_menu',
--             options = wagonOptions
--         })
        
--         -- Register horse locations submenu
--         local horseOptions = {}
--         for location, _ in pairs(Config.SpawnLocations) do
--             local locationName = location:gsub("_", " ")
--             locationName = locationName:gsub("^%l", string.upper)
            
--             table.insert(horseOptions, {
--                 title = locale('cl_spawn_police_horse_in') .. " " .. locationName,
--                 description = locale('cl_spawn_police_horse_desc'),
--                 icon = 'fa-solid fa-horse',
--                 event = 'rsg-lawman:client:spawnhorse',
--                 args = { model = 'a_c_horse_americanstandardbred_palominodapple', location = location },
--                 arrow = true
--             })
--         end
        
--         lib.registerContext({
--             id = 'law_horse_locations',
--             title = locale('cl_spawn_police_horse'),
--             menu = 'law_vehicle_menu',
--             options = horseOptions
--         })
        
--         lib.showContext("law_vehicle_menu")
--     else
--         lib.notify({ title = locale('cl_no_job'), type = 'error', duration = 5000 })
--     end
-- end)

-- -- Vehicle spawn handler
-- RegisterNetEvent('rsg-lawman:client:spawnvehicle', function(data)
--     local PlayerData = RSGCore.Functions.GetPlayerData()
    
--     -- Check if player is on duty
--     if not PlayerData.job.onduty then
--         lib.notify({ title = locale('cl_need_duty'), type = 'error', duration = 5000 })
--         return
--     end
    
--     local location = data.location or 'valentine' -- Default to Valentine if no location specified
    
--     -- Get spawn coordinates from config
--     local spawnCoords
--     if Config.SpawnLocations[location] and Config.SpawnLocations[location].wagon then
--         spawnCoords = Config.SpawnLocations[location].wagon
--     else
--         lib.notify({ title = 'Invalid spawn location', type = 'error', duration = 5000 })
--         return
--     end
    
--     -- Check if there's already a vehicle nearby to prevent spam
--     if IsAnyVehicleNearPoint(spawnCoords.x, spawnCoords.y, spawnCoords.z, 5.0) then
--         lib.notify({ title = locale('cl_area_occupied'), type = 'error', duration = 5000 })
--         return
--     end
    
--     -- Request the model
--     local modelHash = GetHashKey(data.model)
--     RequestModel(modelHash)
--     local timeout = 0
    
--     while not HasModelLoaded(modelHash) do
--         timeout = timeout + 100
--         Wait(100)
--         if timeout > 5000 then
--             lib.notify({ title = locale('cl_model_failed'), type = 'error', duration = 5000 })
--             return
--         end
--     end
    
--     -- Spawn the vehicle
--     local vehicle = CreateVehicle(modelHash, spawnCoords.x, spawnCoords.y, spawnCoords.z, spawnCoords.w, true, false)
--     SetEntityAsMissionEntity(vehicle, true, true)
--     SetVehicleOnGroundProperly(vehicle)
--     SetModelAsNoLongerNeeded(modelHash)
    
--     -- Add blip to vehicle
--     local blip = Citizen.InvokeNative(0x23F74C2FDA6E7C61, -1749618580, vehicle)
--     SetBlipSprite(blip, joaat('blip_ambient_police_wagon'))
--     SetBlipScale(blip, 0.7)
--     Citizen.InvokeNative(0x9CB1A1623062F402, blip, "Police Wagon")
    
--     -- Get location name for notification
--     local locationName = location:gsub("_", " ")
--     locationName = locationName:gsub("^%l", string.upper)
    
--     lib.notify({ title = locale('cl_vehicle_spawned_in'):format(locationName), type = 'success', duration = 5000 })
-- end)

-- -- Horse spawn handler (similar to vehicle but with horse-specific code)
-- RegisterNetEvent('rsg-lawman:client:spawnhorse', function(data)
--     local PlayerData = RSGCore.Functions.GetPlayerData()
    
--     -- Check if player is on duty
--     if not PlayerData.job.onduty then
--         lib.notify({ title = locale('cl_need_duty'), type = 'error', duration = 5000 })
--         return
--     end
    
--     local location = data.location or 'valentine' -- Default to Valentine if no location specified
    
--     -- Get spawn coordinates from config
--     local spawnCoords
--     if Config.SpawnLocations[location] and Config.SpawnLocations[location].horse then
--         spawnCoords = Config.SpawnLocations[location].horse
--     else
--         lib.notify({ title = 'Invalid spawn location', type = 'error', duration = 5000 })
--         return
--     end
    
--     -- Request the model
--     local modelHash = GetHashKey(data.model)
--     RequestModel(modelHash)
--     local timeout = 0
    
--     while not HasModelLoaded(modelHash) do
--         timeout = timeout + 100
--         Wait(100)
--         if timeout > 5000 then
--             lib.notify({ title = locale('cl_model_failed'), type = 'error', duration = 5000 })
--             return
--         end
--     end
    
--     -- Spawn the horse
--     local horse = CreatePed(modelHash, spawnCoords.x, spawnCoords.y, spawnCoords.z, spawnCoords.w, true, false, false, false)
--     SetModelAsNoLongerNeeded(modelHash)
-- 	Citizen.InvokeNative(0x283978A15512B2FE, horse, true)
    
--     Citizen.InvokeNative(0xD3A7B003ED343FD9, horse, 0x20359E53, true, true, true) -- Saddle
--     Citizen.InvokeNative(0xD3A7B003ED343FD9, horse, 0x508B80B9, true, true, true) -- Blanket
--     Citizen.InvokeNative(0xD3A7B003ED343FD9, horse, 0xF0C30271, true, true, true) -- Bag
--     Citizen.InvokeNative(0xD3A7B003ED343FD9, horse, 0x12F0DF9F, true, true, true) -- Bedroll
--     Citizen.InvokeNative(0xD3A7B003ED343FD9, horse, 0x67AF7302, true, true, true) -- Stirrups
-- 	Citizen.InvokeNative(0xD3A7B003ED343FD9, horse, 0x635E387C, true, true, true) --lantern
    
--     -- Add blip to horse
--     local blip = Citizen.InvokeNative(0x23F74C2FDA6E7C61, -1749618580, horse)
--     SetBlipSprite(blip, joaat('blip_mp_horse'))
--     SetBlipScale(blip, 0.7)
--     Citizen.InvokeNative(0x9CB1A1623062F402, blip, "Police Horse")
    
--     -- Get location name for notification
--     local locationName = location:gsub("_", " ")
--     locationName = locationName:gsub("^%l", string.upper)
    
--     lib.notify({ title = locale('cl_horse_spawned_in'):format(locationName), type = 'success', duration = 5000 })
-- end)

------------------------------------------
-- law office armoury
------------------------------------------
-- RegisterNetEvent('rsg-lawman:client:openarmoury')
-- AddEventHandler('rsg-lawman:client:openarmoury', function(id)
--     RSGCore.Functions.GetPlayerData(function(PlayerData)
--         if PlayerData.job.type == "leo" and PlayerData.job.grade.level >= Config.ArmouryAccessGrade then
--             TriggerServerEvent('rsg-shops:server:openstore', 'armoury', 'armoury', locale('cl_shop'))
--        else
--             lib.notify({ title = locale('cl_no_rank'), type = 'error', duration = 7000 })
--         end
--     end)
-- end)

RegisterNetEvent('rsg-lawman:client:openarmoury')
AddEventHandler('rsg-lawman:client:openarmoury', function(locationId)
    RSGCore.Functions.GetPlayerData(function(PlayerData)
        if PlayerData.job.type == "leo" and PlayerData.job.grade.level >= Config.ArmouryAccessGrade then
            TriggerServerEvent('rsg-shops:server:openstore', 'armoury', 'armoury', 'armoury')
        else
            lib.notify({ title = locale('cl_no_rank'), type = 'error', duration = 7000 })
        end
    end)
end)
-- ------------------------------------------
-- -- send player to jail
-- ------------------------------------------
-- -- RegisterNetEvent('rsg-lawman:client:jailplayer', function(playerId, time)
-- --     TriggerServerEvent('rsg-lawman:server:jailplayer', playerId, tonumber(time))
-- -- end)

-- -- RegisterNetEvent('rsg-lawman:client:sendtojail', function(time)
-- --     TriggerServerEvent('rsg-lawman:server:sethandcuffstatus', false)
-- --     isHandcuffed = false
-- --     isEscorted = false
-- --     ClearPedTasks(cache.ped)
-- --     DetachEntity(cache.ped, true, false)
-- --     TriggerEvent('rsg-prison:client:Enter', time)
-- -- end)

-- -- local function openJailerMenu()
-- --     local players = GetPlayers()
    
-- --     local input = lib.inputDialog('Jail Player', {
-- --         {type = 'select', label = 'Select Player', options = players, required = true},
-- --         {type = 'number', label = 'Jail Time', description = 'Jail time in minutes', required = true, min = 1, max = 60}
-- --     })
    
-- --     if input then
-- --         local selectedPlayer = input[1]
-- --         local time = tonumber(input[2])
        
-- --         if selectedPlayer == 'self' then
-- --             -- Get the local player's server ID
-- --             local playerId = GetPlayerServerId(PlayerId())
-- --             TriggerServerEvent('rsg-lawman:server:JailPlayer', playerId, time)
-- --         else
-- --             TriggerServerEvent('rsg-lawman:server:JailPlayer', tonumber(selectedPlayer), time)
-- --         end
-- --     end
-- -- end

-- -- -- Register the command
-- -- -- RegisterCommand('jailer', function()
-- -- --     openJailerMenu()
-- -- -- end)

-- -- -- Fallback event handler
-- -- RegisterNetEvent('rsg-lawman:client:OpenJailMenu', function()
-- --     openJailerMenu()
-- -- end)

-- -- RegisterNetEvent('rsg-lawman:client:JailerMenu', function()
-- --     local PlayerJob = RSGCore.Functions.GetPlayerData().job
    
-- --     -- Check if player is in a law enforcement job
-- --     if PlayerJob.type ~= 'leo' then 
-- --         lib.notify({
-- --             title = 'Jail Menu',
-- --             description = 'You do not have permission to access this menu.',
-- --             type = 'error'
-- --         })
-- --         return 
-- --     end

-- --     lib.registerContext({
-- --         id = 'jailer_mainmenu',
-- --         title = 'Jail Management',
-- --         options = {
-- --             {
-- --                 title = 'Jail Player',
-- --                 description = 'Jail a player by ID',
-- --                 icon = 'fa-solid fa-handcuffs',
-- --                 event = 'rsg-lawman:client:JailPlayerInput',
-- --                 arrow = true
-- --             },
-- --             {
-- --                 title = 'Release Player',
-- --                 description = 'Release a jailed player',
-- --                 icon = 'fa-solid fa-unlock',
-- --                 event = 'rsg-lawman:client:ReleasePlayerInput',
-- --                 arrow = true
-- --             },
-- --             {
-- --                 title = 'Jail Logs',
-- --                 description = 'View jail records',
-- --                 icon = 'fa-solid fa-book',
-- --                 event = 'rsg-lawman:client:JailLogs',
-- --                 arrow = true
-- --             }
-- --         }
-- --     })
-- --     lib.showContext("jailer_mainmenu")
-- -- end)

-- -- RegisterNetEvent('rsg-lawman:client:JailPlayerInput', function()
-- --     local players = GetPlayers()
    
-- --     local input = lib.inputDialog('Jail Player', {
-- --         {type = 'select', label = 'Select Player', options = players, required = true},
-- --         {type = 'number', label = 'Jail Time', description = 'Jail time in minutes', required = true, min = 1, max = 60}
-- --     })
    
-- --     if input then
-- --         local selectedPlayer = input[1]
-- --         local jailTime = tonumber(input[2])
        
-- --         if selectedPlayer and jailTime then
-- --             if selectedPlayer == 'self' then
-- --                 -- Get the local player's server ID
-- --                 local playerId = GetPlayerServerId(PlayerId())
-- --                 TriggerServerEvent('rsg-lawman:server:JailPlayer', playerId, jailTime)
-- --             else
-- --                 TriggerServerEvent('rsg-lawman:server:JailPlayer', tonumber(selectedPlayer), jailTime)
-- --             end
-- --         end
-- --     end
-- end)

RegisterNetEvent('rsg-lawman:client:lawmanAlert', function(coords, text)
    text = tostring(text)

    -- Safely convert coords to a vector3 if it's a valid table
    if type(coords) == "table" and coords.x and coords.y and coords.z then
        coords = vector3(coords.x, coords.y, coords.z)
    else
        print("Invalid coords passed to lawmanAlert: ", json.encode(coords))
        return
    end

    local timer = Config.AlertTimer or 60
    local ped = PlayerPedId()

    -- make sure blipEntries exists
    blipEntries = blipEntries or {}

    -- create blip
    local blip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, coords.x, coords.y, coords.z)
    SetBlipSprite(blip, -693644997)
    Citizen.InvokeNative(0x662D364ABF16DE2F, blip, GetHashKey('BLIP_MODIFIER_MP_COLOR_4')) -- red
    Citizen.InvokeNative(0x662D364ABF16DE2F, blip, GetHashKey('BLIP_MODIFIER_AREA_PULSE'))
    SetBlipScale(blip, 0.8)
    Citizen.InvokeNative(0x9CB1A1623062F402, blip, text)

    -- store blip in list
    blipEntries[#blipEntries + 1] = { coords = coords, handle = blip }

    -- GPS route if enabled
    if Config.AddGPSRoute then
        StartGpsMultiRoute(`COLOR_RED`, true, true)
        AddPointToGpsMultiRoute(coords)
        SetGpsMultiRouteRender(true)
    end

    -- show notification
    lib.notify({ title = text, type = 'inform', duration = 10000 })

    -- timer thread
    CreateThread(function()
        while timer > 0 do
            Wait(1000)
            timer -= 1

            local pcoord = GetEntityCoords(ped)
            local distance = #(coords - pcoord)

            if Config.Debug then
                print(('Distance to Alert Blip: %.2f metres | %ds left'):format(distance, timer))
            end

            if distance < 5.0 then break end
        end

        -- remove blip
        for i = #blipEntries, 1, -1 do
            local entry = blipEntries[i]
            if entry.handle == blip then
                if Config.Debug then
                    print(('Removing blip %s at %s'):format(entry.handle, tostring(entry.coords)))
                end
                if DoesBlipExist(entry.handle) then
                    RemoveBlip(entry.handle)
                end
                table.remove(blipEntries, i)
                break
            end
        end

        -- clear GPS
        if Config.AddGPSRoute then
            ClearGpsMultiRoute()
        end
    end)
end)

------------------------------------------
-- handcuff player
------------------------------------------
-- RegisterNetEvent('rsg-lawman:client:cuffplayer', function()
--     if not IsPedRagdoll(cache.ped) then
--         local player, distance = RSGCore.Functions.GetClosestPlayer()
--         if player ~= -1 and distance < 1.5 then
--             local result = RSGCore.Functions.HasItem('handcuffs')
--             if result then
--                 local playerId = GetPlayerServerId(player)
--                 if not IsPedInAnyVehicle(GetPlayerPed(player)) and not IsPedInAnyVehicle(cache.ped) then
--                     TriggerServerEvent('rsg-lawman:server:cuffplayer', playerId, false)
--                     -- HandCuffAnimation()
--                 else
--                     lib.notify({ title = locale('cl_failed'), description = locale('cl_failed_a'), type = 'error', duration = 5000 })
--                 end
--             else
--                 lib.notify({ title = locale('cl_handcuffs'), description = locale('cl_handcuffs_a'), type = 'error', duration = 5000 })
--             end
--         else
--             lib.notify({ title = locale('cl_nearby'), type = 'error', duration = 5000 })
--         end
--     else
--         Wait(2000)
--     end
-- end)

-- ------------------------------------------
-- -- do handcuff player
-- ------------------------------------------
-- RegisterNetEvent('rsg-lawman:client:getcuffed', function(playerId, isSoftcuff)
--     if not isHandcuffed then
--         isHandcuffed = true
--         TriggerServerEvent('rsg-lawman:server:sethandcuffstatus', true)
--         TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5, 'cuff', 0.6)
--         ClearPedTasksImmediately(cache.ped)
--         if GetPedCurrentHeldWeapon(cache.ped) ~= joaat("WEAPON_UNARMED") then
--             SetCurrentPedWeapon(cache.ped, `WEAPON_UNARMED`, true)
--         end
--         if not isSoftcuff then
--             cuffType = 16
--             lib.notify({ title = locale('cl_cuffed'), type = 'inform', duration = 5000 })
--         else
--             cuffType = 49
--             lib.notify({ title = locale('cl_cuffed'), description = locale('cl_cuffed_a'), type = 'inform', duration = 5000 })
--         end
--     else
--         isHandcuffed = false
--         isEscorted = false
--         TriggerEvent('hospital:client:isEscorted', isEscorted)
--         DetachEntity(cache.ped, true, false)
--         TriggerServerEvent('rsg-lawman:server:sethandcuffstatus', false)
--         TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 5, 'uncuff', 0.6)
--         ClearPedTasksImmediately(cache.ped)
--         SetEnableHandcuffs(cache.ped, false)
--         DisablePlayerFiring(cache.ped, false)
--         SetPedCanPlayGestureAnims(cache.ped, true)
--         DisplayRadar(true)
--         if cuffType == 49 then
--             FreezeEntityPosition(cache.ped, false)
--         end
--         lib.notify({ title = locale('cl_uncuffed'), type = 'inform', duration = 5000 })
--     end
-- end)

-- ------------------------------------------
-- -- handcuff player loop
-- ------------------------------------------
-- CreateThread(function()
--     while true do
--         Wait(1)
--         if isEscorted or isHandcuffed then
--             DisableControlAction(0, 0x295175BF, true) -- Disable break
--             DisableControlAction(0, 0x6E9734E8, true) -- Disable suicide
--             DisableControlAction(0, 0xD8F73058, true) -- Disable aiminair
--             DisableControlAction(0, 0x4CC0E2FE, true) -- B key
--             DisableControlAction(0, 0xDE794E3E, true) -- Cover
--             DisableControlAction(0, 0x06052D11, true) -- Cover
--             DisableControlAction(0, 0x5966D52A, true) -- Cover
--             DisableControlAction(0, 0xCEFD9220, true) -- Cover
--             DisableControlAction(0, 0xC75C27B0, true) -- Cover
--             DisableControlAction(0, 0x41AC83D1, true) -- Cover
--             DisableControlAction(0, 0xADEAF48C, true) -- Cover
--             DisableControlAction(0, 0x9D2AEA88, true) -- Cover
--             DisableControlAction(0, 0xE474F150, true) -- Cover
--             DisableControlAction(0, 0xB2F377E8, true) -- Attack
--             DisableControlAction(0, 0xC1989F95, true) -- Attack 2
--             DisableControlAction(0, 0x07CE1E61, true) -- Melee Attack 1
--             DisableControlAction(0, 0xF84FA74F, true) -- MOUSE2
--             DisableControlAction(0, 0xCEE12B50, true) -- MOUSE3
--             DisableControlAction(0, 0x8FFC75D6, true) -- Shift
--             DisableControlAction(0, 0xD9D0E1C0, true) -- SPACE
--             DisableControlAction(0, 0xF3830D8E, true) -- J
--             DisableControlAction(0, 0x80F28E95, true) -- L
--             DisableControlAction(0, 0xDB096B85, true) -- CTRL
--             DisableControlAction(0, 0xE30CD707, true) -- R
--         end

--         if cuffType == 16 and isHandcuffed then  -- soft cuff
--             SetEnableHandcuffs(cache.ped, true)
--             DisablePlayerFiring(cache.ped, true)
--             SetPedCanPlayGestureAnims(cache.ped, false)
--             DisplayRadar(false)
--         end

--         if cuffType == 49 and isHandcuffed then  -- hard cuff
--             SetEnableHandcuffs(cache.ped, true)
--             DisablePlayerFiring(cache.ped, true)
--             SetPedCanPlayGestureAnims(cache.ped, false)
--             DisplayRadar(false)
--             FreezeEntityPosition(cache.ped, true)
--         end

--         if not isHandcuffed and not isEscorted then
--             Wait(2000)
--         end
--     end
-- end)

------------------------------------------
-- Toggle On-Duty
------------------------------------------
AddEventHandler('rsg-lawman:client:ToggleDuty', function()
    RSGCore.Functions.GetPlayerData(function(PlayerData)
        if PlayerData.job.type == "leo" then
            TriggerServerEvent("RSGCore:ToggleDuty")
            return
        end
    end)
end)

-- ------------------------------------------
-- -- escort player
-- ------------------------------------------
-- RegisterNetEvent('rsg-lawman:client:escortplayer', function()
--     local player, distance = RSGCore.Functions.GetClosestPlayer()
--     if player ~= -1 and distance < 2.5 then
--         local playerId = GetPlayerServerId(player)
--         if not isHandcuffed and not isEscorted then
--             TriggerServerEvent("rsg-lawman:server:escortplayer", playerId)
--         end
--     else
--         lib.notify({ title = locale('cl_nearby'), type = 'error', duration = 5000 })
--     end
-- end)

-- ------------------------------------------
-- -- do escort player
-- ------------------------------------------
-- RegisterNetEvent('rsg-lawman:client:getescorted', function(playerId)
--     RSGCore.Functions.GetPlayerData(function(PlayerData)
--         if PlayerData.metadata["isdead"] or isHandcuffed then
--             if not isEscorted then
--                 isEscorted = true
--                 TriggerServerEvent('rsg-lawman:server:setescortstatus', true)
--                 draggerId = playerId
--                 local dragger = GetPlayerPed(GetPlayerFromServerId(playerId))
--                 SetEntityCoords(cache.ped, GetOffsetFromEntityInWorldCoords(dragger, 0.0, 0.45, 0.0))
--                 AttachEntityToEntity(cache.ped, dragger, 11816, 0.45, 0.45, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
--             else
--                 isEscorted = false
--                 TriggerServerEvent('rsg-lawman:server:setescortstatus', false)
--                 DetachEntity(cache.ped, true, false)
--             end
--         end
--     end)
-- end)

------------------------------------------
-- law badge
------------------------------------------
RegisterNetEvent('rsg-lawman:client:lawbadge', function()
    RSGCore.Functions.GetPlayerData(function(PlayerData)
        local jobname = PlayerData.job.name
        if jobname == 'vallaw' or jobname == 'rholaw' or jobname == 'blklaw' or jobname == 'strlaw' or jobname == 'stdenlaw' then
            if badge == false then
                if not IsPedMale(cache.ped) then -- female
                    Citizen.InvokeNative(0xD3A7B003ED343FD9, cache.ped, 0x0929677D, true, true, true) -- ApplyShopItemToPed
                    Citizen.InvokeNative(0xCC8CA3E88256E58F, cache.ped, 0, 1, 1, 1, false) -- UpdatePedVariation
                else -- male
                    Citizen.InvokeNative(0xD3A7B003ED343FD9, cache.ped, 0xDB4C451D, true, false, true) -- ApplyShopItemToPed
                    Citizen.InvokeNative(0xCC8CA3E88256E58F, cache.ped, 0, 1, 1, 1, false) -- UpdatePedVariation
                end
                lib.notify({ title = locale('cl_badge_on'), type = 'inform', position = 'center-right', duration = 5000 })
                badge = true
            else
                if not IsPedMale(cache.ped) then -- female
                    Citizen.InvokeNative(0x0D7FFA1B2F69ED82, cache.ped, 0x0929677D, 0, 0) -- RemoveShopItemFromPed
                    Citizen.InvokeNative(0xCC8CA3E88256E58F, cache.ped, 0, 1, 1, 1, false) -- UpdatePedVariation
                else -- male
                    Citizen.InvokeNative(0x0D7FFA1B2F69ED82, cache.ped, 0xDB4C451D, 0, 0) -- RemoveShopItemFromPed
                    Citizen.InvokeNative(0xCC8CA3E88256E58F, cache.ped, 0, 1, 1, 1, false) -- UpdatePedVariation
                end
                lib.notify({ title = locale('cl_badge_off'), type = 'inform', position = 'center-right', duration = 5000 })
                badge = false
            end
        else
            lib.notify({ title = locale('cl_only_law'),  type = 'inform',  position = 'center-right',  duration = 5000 })
        end
    end)
end)

------------------------------------------
-- search other players inventory
------------------------------------------
RegisterNetEvent('rsg-lawman:client:searchplayer', function()
    if not IsPedRagdoll(cache.ped) then
        local player, distance = RSGCore.Functions.GetClosestPlayer()
        if player ~= -1 and distance < Config.SearchDistance then
            local playerPed = GetPlayerPed(player)
            local playerId = GetPlayerServerId(player)
            local isdead = IsEntityDead(playerPed)
            local cuffed = IsPedCuffed(playerPed)
            local hogtied = Citizen.InvokeNative(0x3AA24CCC0D451379, playerPed)
            local lassoed = Citizen.InvokeNative(0x9682F850056C9ADE, playerPed)
            local ragdoll = IsPedRagdoll(playerPed)
            if isdead or cuffed or hogtied or lassoed or ragdoll or IsEntityPlayingAnim(playerPed, "script_proc@robberies@homestead@lonnies_shack@deception", "hands_up_loop", 3) then
                TriggerServerEvent('rsg-lawman:server:SearchPlayer')
            else
                lib.notify({ title = locale('cl_search'), type = 'inform', position = 'center-right', duration = 5000 })
            end
        else
            lib.notify({ title = locale('cl_nearby'), type = 'inform', position = 'center-right', duration = 5000 })
        end
    else
        lib.notify({ title = locale('cl_no_be_able'), type = 'inform', position = 'center-right', duration = 5000 })
    end
end)

------------------------------------------
-- open law trashcan
------------------------------------------
RegisterNetEvent('rsg-lawman:client:openstorage', function()
    RSGCore.Functions.GetPlayerData(function(PlayerData)
        if PlayerData.job.type == 'leo' then
            local jobname = PlayerData.job.name
            TriggerServerEvent('rsg-lawman:server:storage', jobname)
        end
    end)
end)

CreateThread(function()
    if cache.ped then
        lastHealth = GetEntityHealth(cache.ped)
    end
end)

-- Helper function to get location name
local function GetLocationName(coords)
    local town = GetClosestTown(coords)
    return town or "Unknown Location"
end

-- Get closest town name
function GetClosestTown(coords)
    -- Define major locations in the game
    local locations = {
        ["Saint Denis"] = vector3(2683.0, -1455.0, 46.0),
        ["Valentine"] = vector3(-283.0, 805.0, 119.0),
        ["Blackwater"] = vector3(-875.0, -1328.0, 43.0),
        ["Rhodes"] = vector3(1359.0, -1299.0, 77.0),
        ["Annesburg"] = vector3(2913.0, 1311.0, 44.0),
        ["Strawberry"] = vector3(-1826.0, -420.0, 160.0),
        ["Tumbleweed"] = vector3(-5517.0, -2940.0, -2.0),
        ["Armadillo"] = vector3(-3743.0, -2595.0, -13.0),
        ["Van Horn"] = vector3(2985.0, 571.0, 44.0),
    }
    
    local closestDist = math.huge
    local closestLocation = "Wilderness"
    
    for name, loc in pairs(locations) do
        local dist = #(coords - loc)
        if dist < closestDist then
            closestDist = dist
            closestLocation = name
        end
    end
    
    return closestLocation
end

local function IsEntityAnimal(entity)
    if not DoesEntityExist(entity) then return false end
    
    local pedType = GetPedType(entity) -- Get the ped type
    
    return pedType == 28 -- Animals have ped type 28 in RedM
end

-- Monitor player deaths
CreateThread(function()
    -- Only run this thread if player death alerts are enabled
    if not Config.EnablePlayerDeathAlerts then return end
    
    while true do
        Wait(1000) -- Check every second
        
        if cache.ped and DoesEntityExist(cache.ped) then
            local currentHealth = GetEntityHealth(cache.ped)
            
            -- Detect if player just died
            if currentHealth <= 0 and lastHealth > 0 then
                local coords = GetEntityCoords(cache.ped)
                local location = GetLocationName(coords)
                local killer = GetPedSourceOfDeath(cache.ped)
                
                -- Ensure killer is valid and not an animal
                local alertText = "Person Down near " .. location
                
                if killer and DoesEntityExist(killer) then
                    local killerType = GetEntityType(killer)
                    
                    if killerType == 1 and IsPedAPlayer(killer) then
                        alertText = "Murder reported near " .. location
                    elseif killerType == 1 and not IsEntityAnimal(killer) then
                        alertText = "Suspicious death near " .. location
                    end
                end
                
                -- Cooldown system to prevent spam
                if GetGameTimer() - lastAlertTime > alertCooldown then
                    TriggerServerEvent('rsg-lawman:server:lawmanAlert', alertText, coords)
					TriggerServerEvent('rsg-tips:server:addCriminalActivity', "murder of person", nil, GetEntityCoords(PlayerPedId()))
                    lastAlertTime = GetGameTimer()
                end
            end
            
            lastHealth = currentHealth
        end
    end
end)

CreateThread(function()
    -- Only run this thread if NPC death alerts are enabled
    if not Config.EnableNPCDeathAlerts then return end
    
    while true do
        Wait(1000)
        
        if cache.ped and DoesEntityExist(cache.ped) then
            local playerCoords = GetEntityCoords(cache.ped)
            local peds = GetGamePool('CPed')
            
            for _, ped in ipairs(peds) do
                if ped ~= cache.ped and not IsPedAPlayer(ped) and not IsEntityAnimal(ped) then
                    local currentHealth = GetEntityHealth(ped)
                    local lastPedHealthValue = lastPedHealth[ped] or currentHealth
                    
                    -- Detect if NPC just died
                    if currentHealth <= 0 and lastPedHealthValue > 0 then
                        local pedCoords = GetEntityCoords(ped)
                        local distance = #(playerCoords - pedCoords)
                        
                        -- Only alert for deaths within configured distance
                        if distance <= Config.AlertDistance then
                            local location = GetLocationName(pedCoords)
                            local killer = GetPedSourceOfDeath(ped)
                            
                            local alertText = "Civilian Down near " .. location
                            
                            -- Add context if killed by player
                            if killer == cache.ped then
                                alertText = "Shooting civilians near " .. location
                            end
                            
                            -- Cooldown system to prevent spam
                            if GetGameTimer() - lastAlertTime > alertCooldown then
                                TriggerServerEvent('rsg-lawman:server:lawmanAlert', alertText, pedCoords)
								TriggerServerEvent('rsg-tips:server:addCriminalActivity', "murder of citizen ", nil, GetEntityCoords(PlayerPedId()))
                                lastAlertTime = GetGameTimer()
                            end
                        end
                    end
                    
                    lastPedHealth[ped] = currentHealth
                end
            end
            
            -- Cleanup old ped entries
            for ped in pairs(lastPedHealth) do
                if not DoesEntityExist(ped) then
                    lastPedHealth[ped] = nil
                end
            end
        end
    end
end)