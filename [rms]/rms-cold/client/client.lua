RSGCore = exports['rsg-core']:GetCoreObject()
local hascold = false
local roundtemp = 0

RegisterNetEvent('rsg-cold:cure')
AddEventHandler('rsg-cold:cure', function()
    local ped = PlayerPedId()
    local src = source
    if hascold then
        RSGCore.Functions.Progressbar("take_cold_medicine", "Using Cold Medicine..", 4000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = "mini_games@story@mob4@heal_jules@bandage@arthur",
            anim = "bandage_fast",
            flags = 1,
        }, {}, {}, function() 
            hascold = false
            TriggerServerEvent('rsg-cold:removemedicine', source)
            StopAnimTask(ped, "mini_games@story@mob4@heal_jules@bandage@arthur", "bandage_fast", 1.0)
            RSGCore.Functions.Notify('You took the medicine!', 'success')
            local chanceToDie = math.random(0, 100)          
        end, function() 
            StopAnimTask(ped, "mini_games@story@mob4@heal_jules@bandage@arthur", "bandage_fast", 1.0)
            RSGCore.Functions.Notify('You canceled the medicine!', 'success')
        end)
    else
        RSGCore.Functions.Notify('You don\'t have a cold!', 'error')
    end
end)

RegisterNetEvent('rsg-cold:cure1')
AddEventHandler('rsg-cold:cure1', function()
    local ped = PlayerPedId()
    local src = source
    if hascold then
        RSGCore.Functions.Progressbar("take_cold_medicine", "Using Bonebroth..", 4000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = "mini_games@story@mob4@heal_jules@bandage@arthur",
            anim = "bandage_fast",
            flags = 1,
        }, {}, {}, function() 
            hascold = false
            TriggerServerEvent('rsg-cold:removemedicine', source)
            StopAnimTask(ped, "mini_games@story@mob4@heal_jules@bandage@arthur", "bandage_fast", 1.0)
            RSGCore.Functions.Notify('You took the medicine!', 'success')
            local chanceToDie = math.random(0, 100)          
        end, function() 
            StopAnimTask(ped, "mini_games@story@mob4@heal_jules@bandage@arthur", "bandage_fast", 1.0)
            RSGCore.Functions.Notify('You canceled the medicine!', 'success')
        end)
    else
        RSGCore.Functions.Notify('You don\'t have a cold!', 'error')
    end
end)
RegisterNetEvent('rsg-cold:cure2')
AddEventHandler('rsg-cold:cure2', function()
    local ped = PlayerPedId()
    local src = source
    if hascold then
        RSGCore.Functions.Progressbar("take_cold_medicine", "Using Onion Syrup..", 4000, false, true, {
            disableMovement = false,
            disableCarMovement = false,
            disableMouse = false,
            disableCombat = true,
        }, {
            animDict = "mini_games@story@mob4@heal_jules@bandage@arthur",
            anim = "bandage_fast",
            flags = 1,
        }, {}, {}, function() 
            hascold = false
            TriggerServerEvent('rsg-cold:removemedicine', source)
            StopAnimTask(ped, "mini_games@story@mob4@heal_jules@bandage@arthur", "bandage_fast", 1.0)
            RSGCore.Functions.Notify('You took the medicine!', 'success')
            local chanceToDie = math.random(0, 100)          
        end, function() 
            StopAnimTask(ped, "mini_games@story@mob4@heal_jules@bandage@arthur", "bandage_fast", 1.0)
            RSGCore.Functions.Notify('You canceled the medicine!', 'success')
        end)
    else
        RSGCore.Functions.Notify('You don\'t have a cold!', 'error')
    end
end)

local function SpreadCold()
    if Config.ColdSpread and hascold then
        local closestPlayer, closestDistance = RSGCore.Functions.GetClosestPlayer()
        if closestPlayer ~= -1 and closestDistance < 4.0 then
            TriggerServerEvent('rsg-cold:spreadPlayer', GetPlayerServerId(closestPlayer))
        end
    end
end

RegisterNetEvent('rsg-cold:spread')
AddEventHandler('rsg-cold:spread', function(source)
    if Config.Debug then
        print('You received the cold')
    end
    hascold = true
    ApplyColdEffects(source)
end)

Citizen.CreateThread(function()
    while true do
        Wait(100)                 
        if hascold then
            Citizen.Wait(math.random(Config.SicktickMin, Config.SicktickMax))
            local ped = PlayerPedId()
            local coldchance = math.random(0, 100)
            SpreadCold()    
            Citizen.Wait(8000)
            SetEntityHealth(ped, GetEntityHealth(ped) - Config.Healthtake)
            local chanceToRagdoll = math.random(0, 100)
            RSGCore.Functions.Notify('You have a dangerous cold!')
            if Config.Debug then
                print('You have a cold')
            end
            if chanceToRagdoll > (100 - Config.chanceToRagdoll) then
                SetPedToRagdoll(ped, 6000, 6000, 0, 0, 0, 0)
            end
        end
    end
end)

local lastNotificationTime = 0 -- Initialize the last notification time
local notificationCooldown = 600 -- Set a cooldown period in seconds (10 minutes)
local hascold = false -- Initialize the cold status

Citizen.CreateThread(function()
    while true do
        Wait(10000) -- Wait for 10 seconds
        local temp = GetTemperature() -- Function to get the current temperature
        local coldchance = math.random(0, 100) -- Generate a random number between 0 and 100

        -- Debug output
        if Config.Debug then
            print('Temperature:', temp)
            print('Coldchance:', coldchance)
        end

        -- Check if the temperature is below -5
        if temp < -5 then
            -- Check if the random chance exceeds the configured threshold
            if coldchance > Config.Sickchance then
                local currentTime = GetGameTimer() / 1000 -- Convert to seconds
                -- Check if the cooldown period has passed since the last notification
                if currentTime - lastNotificationTime >= notificationCooldown then
                    hascold = true
                    RSGCore.Functions.Notify('You have a dangerous cold!')
                    lastNotificationTime = currentTime -- Update the last notification time
                    if Config.Debug then
                        print('You have a cold')
                    end
                end
            end
        end
    end
end)

function GetTemperature()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    return Citizen.InvokeNative(0xB98B78C3768AF6E0, coords.x, coords.y, coords.z) 
end
