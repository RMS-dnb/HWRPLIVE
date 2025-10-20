local RSGCore = exports['rsg-core']:GetCoreObject()
local showingprompt, makingmash = false, false
local fx_group, fx_name = "scr_adv_sok", "scr_adv_sok_torchsmoke"
local smoke, mooncoords
local activeSmokes = {}
local activeCookings = {}
local activeProgressBars = {} -- Add this to track progress bars

-- Setup target interaction
-- exports['rsg-target']:AddTargetModel(Config.MoonshineProp, {
--     options = {
--         {
--             type = "client",
--             event = 'rms-moonshiner:client:moonshinemainmenu',
--             icon = "far fa-eye",
--             label = Lang:t('moonshine.lang_1'),
--             distance = 3.0,
--             builder = data.builder
--         },
--     }
-- }) 
-- Organize recipes into category-based menus
local categoryMenus = {}

for _, v in ipairs(Config.MoonshineRecipes) do
    local ingredientsMetadata = {}
    local setheader = RSGCore.Shared.Items[tostring(v.receive)].label
    local itemimg = "nui://"..Config.Image..RSGCore.Shared.Items[tostring(v.receive)].image

    for _, ingredient in ipairs(v.ingredients) do
        table.insert(ingredientsMetadata, {
            label = RSGCore.Shared.Items[ingredient.item].label,
            value = ingredient.amount
        })
    end

    local option = {
        title = setheader,
        icon = itemimg,
        event = 'rms-moonshiner:client:moonshineingredients',
        metadata = ingredientsMetadata,
        args = {
            title = setheader,
            ingredients = v.ingredients,
            maketime = v.maketime,
            receive = v.receive,
            giveamount = v.giveamount
        }
    }

    if not categoryMenus[v.category] then
        categoryMenus[v.category] = {
            id = 'moonshine_menu_' .. v.category,
            title = v.category,
            menu = 'moonshine_main_menu',
            onBack = function() end,
            options = { option }
        }
    else
        table.insert(categoryMenus[v.category].options, option)
    end
end

-- Register category menus
for category, menuData in pairs(categoryMenus) do
    RegisterNetEvent('rms-moonshiner:client:' .. category, function()
        lib.registerContext(menuData)
        lib.showContext(menuData.id)
    end)
end

-- Main menu
RegisterNetEvent('rms-moonshiner:client:moonshinemainmenu', function()
    local mainMenu = {
        id = 'moonshine_main_menu',
        title = Lang:t('moonshine.lang_2'),
        options = {}
    }

    for category, _ in pairs(categoryMenus) do
        table.insert(mainMenu.options, {
            title = category,
            description = Lang:t('moonshine.lang_3') .. category,
            icon = 'fa-solid fa-kitchen-set',
            event = 'rms-moonshiner:client:' .. category,
            arrow = true
        })
    end

    lib.registerContext(mainMenu)
    lib.showContext(mainMenu.id)
end)

-- Input for how many batches to make
RegisterNetEvent('rms-moonshiner:client:moonshineingredients', function(data)
    local input = lib.inputDialog(Lang:t('moonshine.lang_4'), {
        { type = 'input', label = Lang:t('moonshine.lang_5'), required = true, min = 1, max = 10 },
    })

    if not input then return end
    local makeamount = tonumber(input[1])

    if makeamount then
        RSGCore.Functions.TriggerCallback('rms-moonshiner:server:checkingredients', function(hasRequired)
            if hasRequired then
                TriggerEvent('rms-moonshiner:client:domoonshinecook', data.title, data.ingredients, tonumber(data.maketime * makeamount), data.receive, data.giveamount, makeamount)
            else
                RSGCore.Functions.Notify(Lang:t('moonshine.lang_missing_ingredients'), 'error')
            end
        end, data.ingredients, makeamount)
    end
end)

-- Start cooking moonshine
RegisterNetEvent('rms-moonshiner:client:domoonshinecook', function(title, ingredients, maketime, receive, giveamount, makeamount)
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local object = GetClosestObjectOfType(coords, 3.0, Config.MoonshineProp, false, false, false)

    if not object then
        RSGCore.Functions.Notify("No still found nearby", "error")
        return
    end

    LocalPlayer.state:set("inv_busy", true, true)
    mooncoords = GetEntityCoords(object)
    local fxcoords = vector3(mooncoords.x, mooncoords.y + 0.8, mooncoords.z - 3.0)

    -- Add this cooking to active cookings
    local cookingId = #activeCookings + 1
    activeCookings[cookingId] = {
        coords = mooncoords,
        startTime = GetGameTimer(),
        endTime = GetGameTimer() + maketime,
        shouldStop = false,
        exploded = false,
        fxcoords = fxcoords
    }
    
    -- Start monitoring distance from still
    local monitorThread = CreateThread(function()
        MonitorStillDistance(mooncoords, maketime, cookingId)
    end)
    activeCookings[cookingId].monitorThread = monitorThread

    -- Notify server to sync smoke globally
    TriggerServerEvent('grrp_moonshiners:SyncSmoke', "start", fxcoords)

    -- Handle cooking in a separate thread
    CreateThread(function()
        local progressCompleted = lib.progressBar({
            duration = maketime,
            position = 'bottom',
            label = Lang:t('moonshine.lang_6') .. title,
            canCancel = true,
            disableControl = true,
            useWhileDead = false,
        })

        LocalPlayer.state:set("inv_busy", false, true)

        -- Handle progress bar results
        if progressCompleted then
            -- Check if cooking wasn't interrupted by explosion
            if activeCookings[cookingId] and not activeCookings[cookingId].exploded then
                print("Cooking completed successfully, starting 5 minute smoke timer")
                
                -- Give the player their moonshine
                TriggerServerEvent('rms-moonshiner:server:finishmoonshining', ingredients, receive, giveamount, makeamount)

                -- Mark cooking as complete but keep fxcoords for smoke stopping
                local smokeFxCoords = activeCookings[cookingId].fxcoords
                activeCookings[cookingId].shouldStop = true
                activeCookings[cookingId] = nil

                -- Schedule smoke to stop after 5 minutes
                CreateThread(function()
                    print("Starting 5 minute countdown for smoke")
                    Wait(5 * 60 * 1000) -- 5 minutes
                    print("5 minutes passed, stopping smoke")
                    TriggerServerEvent('grrp_moonshiners:SyncSmoke', "stop", smokeFxCoords)
                end)
            else
                print("Cooking was interrupted by explosion")
                -- Cooking was interrupted by explosion, stop smoke immediately
                TriggerServerEvent('grrp_moonshiners:SyncSmoke', "stop", fxcoords)
            end
        else
            print("Progress bar was cancelled")
            -- Progress bar was cancelled, stop smoke immediately
            if activeCookings[cookingId] then
                activeCookings[cookingId].shouldStop = true
                activeCookings[cookingId] = nil
            end
            TriggerServerEvent('grrp_moonshiners:SyncSmoke', "stop", fxcoords)
        end
    end)
end)

-- Triggered from server to start synced smoke
RegisterNetEvent('grrp_moonshiners:StartCookingSmoke')
AddEventHandler('grrp_moonshiners:StartCookingSmoke', function(pos)
    UseParticleFxAsset(fx_group)
    local fxHandle = StartParticleFxLoopedAtCoord(
        fx_name, 
        pos.x, pos.y, pos.z, 
        -2.0, 0.0, 0.0, -- rotation
        5.0, false, false, false, true -- increased scale (was 2.0)
    )
    
    -- Stronger smoke settings
    Citizen.InvokeNative(0x9DDC222D85D5AF2A, fxHandle, 50.0) -- ~density/multiplier
    SetParticleFxLoopedAlpha(fxHandle, 1.0)
    SetParticleFxLoopedColour(fxHandle, 0.05, 0.05, 0.05, false) -- Almost pitch black

    table.insert(activeSmokes, { fxHandle = fxHandle, coords = pos })
end)

-- Triggered from server to stop synced smoke
RegisterNetEvent('grrp_moonshiners:StopCookingSmoke')
AddEventHandler('grrp_moonshiners:StopCookingSmoke', function(pos)
    for i, v in ipairs(activeSmokes) do
        if v.coords.x == pos.x and v.coords.y == pos.y and v.coords.z == pos.z then
            StopParticleFxLooped(v.fxHandle, true)
            table.remove(activeSmokes, i)
            break
        end
    end
end)

-- Clean up smoke if resource stops
AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    for _, smoke in ipairs(activeSmokes) do
        if smoke.fxHandle then
            StopParticleFxLooped(smoke.fxHandle, true)
        end
    end
end)

-- Function to create explosion at still
function ExplodeMoonshineStill(stillCoords, cookingId)
    -- Delete any active smoke effects for this still
    for i, smoke in ipairs(activeSmokes) do
        if #(vector3(smoke.coords.x, smoke.coords.y, smoke.coords.z) - stillCoords) < 2.0 then
            if DoesParticleFxLoopedExist(smoke.fxHandle) then
                StopParticleFxLooped(smoke.fxHandle, true)
            end
            table.remove(activeSmokes, i)
            break
        end
    end

    -- Create explosion at the still
    AddExplosion(stillCoords.x, stillCoords.y, stillCoords.z, 25, 5.0, true, false, 1.0)

    -- Delete the still entity nearby
    local stillEntity = GetClosestObjectOfType(stillCoords, 3.0, Config.MoonshineProp, false, false, false)
    if DoesEntityExist(stillEntity) then
        DeleteEntity(stillEntity)
    end

    -- Mark cooking as exploded
    if activeCookings[cookingId] then
        activeCookings[cookingId].exploded = true
        activeCookings[cookingId].shouldStop = true
        
        -- Get the propid from the cooking data
        local propid = activeCookings[cookingId].propid
        
        -- Trigger server event to remove the still from the database
        TriggerServerEvent('rms-moonshiner:server:stillexploded', propid)
    end

    -- Notify player
    RSGCore.Functions.Notify("Your moonshine still exploded! You were too far away.", "error")
    
    -- Reset player state
    LocalPlayer.state:set("inv_busy", false, true)
end

-- Monitor distance from still during cooking
function MonitorStillDistance(stillCoords, cookTime, cookingId)
    while activeCookings[cookingId] and not activeCookings[cookingId].shouldStop do
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local distance = #(playerCoords - stillCoords)
        
        if distance > 15.0 then
            ExplodeMoonshineStill(stillCoords, cookingId)
            return
        end
        
        -- Exit if cooking is done
        if GetGameTimer() > activeCookings[cookingId].endTime then
            return
        end
        
        Wait(1000) -- Check every second
    end
end