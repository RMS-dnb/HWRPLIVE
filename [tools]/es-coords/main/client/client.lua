-- RegisterKeyMapping('eyestore', 'Open Eyes Store Coords Menu', 'keyboard', 'J')

local isMenuOpen = false
local isAnimating = false
local favoriteMarkers = {}
local uniqueCoordinates = {}
local markerRotation = 0.0
local teleportKey = 38 -- E tuşu

local function isCoordinateUnique(x, y, z)
    local key = string.format("%.2f,%.2f,%.2f", x, y, z)
    if uniqueCoordinates[key] then
        return false
    end
    uniqueCoordinates[key] = true
    return true
end

local function TeleportToLocation(x, y, z, h)
    local playerPed = PlayerPedId()
    
    DoScreenFadeOut(500)
    Citizen.Wait(500)
    
    SetEntityCoords(playerPed, x, y, z)
    if h then
        SetEntityHeading(playerPed, h)
    end
    
    Citizen.Wait(500)
    DoScreenFadeIn(500)
end

RegisterNUICallback('TeleportToLocation', function(data, cb)
    if data.x and data.y and data.z then
        TeleportToLocation(data.x, data.y, data.z, data.h)
        cb('ok')
    else
        cb('error')
    end
end)

RegisterNUICallback('UpdateFavorites', function(data, cb)
    favoriteMarkers = {}
    uniqueCoordinates = {}
    
    if data.favorites then
        for _, marker in pairs(data.favorites) do
            if isCoordinateUnique(marker.x, marker.y, marker.z) then
                table.insert(favoriteMarkers, {
                    x = marker.x,
                    y = marker.y,
                    z = marker.z,
                    h = marker.h,
                    name = marker.name or "Favori Konum"
                })
            end
        end
    end
    
    cb('ok')
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if isMenuOpen then
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            
            markerRotation = markerRotation + 0.5
            if markerRotation > 360.0 then
                markerRotation = 0.0
            end
            
            for _, marker in pairs(favoriteMarkers) do
                local x, y, z = marker.x, marker.y, marker.z
                local name = marker.name
                local distance = #(playerCoords - vector3(x, y, z))
                
                if distance < 100.0 then
                    DrawMarker(
                        1, 
                        x, y, z - 1.0,
                        0.0, 0.0, 0.0, 
                        0.0, 0.0, 0.0, 
                        1.0, 1.0, 1.0,
                        0, 255, 255, 200, 
                        false, 
                        false, 
                        2, 
                        false,
                        nil, 
                        nil, 
                        false 
                    )

                    DrawMarker(
                        42, 
                        x, y, z - 0.5,
                        0.0, 0.0, 0.0,
                        0.0, 0.0, 0.0,
                        0.3, 0.3, 0.3, 
                        255, 255, 255, 200, 
                        false,
                        true, 
                        2, 
                        true, 
                        nil, 
                        nil, 
                        false 
                    )
                    
                    local onScreen, screenX, screenY = World3dToScreen2d(x, y, z + 0.2)
                    if onScreen then
                        local factor = (string.len(name)) / 370
                        DrawRect(screenX, screenY + 0.0125, 0.015 + factor, 0.03, 0, 0, 0, 150) 
                        SetTextScale(0.35, 0.35)
                        SetTextFont(4)
                        SetTextProportional(1)
                        SetTextColour(255, 255, 255, 215)
                        SetTextEntry("STRING")
                        SetTextCentre(1)
                        AddTextComponentString(name)
                        DrawText(screenX, screenY)
                    end
                    
                    local distanceText = string.format("%.1fm", distance)
                    local distanceOnScreen, distanceScreenX, distanceScreenY = World3dToScreen2d(x, y, z - 0.1)
                    if distanceOnScreen then
                        local distanceFactor = (string.len(distanceText)) / 370
                        DrawRect(distanceScreenX, distanceScreenY + 0.0125, 0.015 + distanceFactor, 0.03, 0, 0, 0, 150)
                        SetTextScale(0.3, 0.3)
                        SetTextFont(4)
                        SetTextProportional(1)
                        SetTextColour(255, 255, 255, 215)
                        SetTextEntry("STRING")
                        SetTextCentre(1)
                        AddTextComponentString(distanceText)
                        DrawText(distanceScreenX, distanceScreenY)
                    end
                    if distance < 2.0 and IsControlJustPressed(0, teleportKey) then
                        TeleportToLocation(x, y, z, marker.h)
                    end
                end
            end
        end
    end
end)

RegisterCommand('coords', function()
    if isAnimating then return end
    
    isMenuOpen = not isMenuOpen
    isAnimating = true
    
    SetNuiFocus(isMenuOpen, isMenuOpen)
    SendNUIMessage({
        type = 'SET_VISIBILITY',
        show = isMenuOpen,
        animation = true,
        animationType = isMenuOpen and 'open' or 'close'
    })
    
    if isMenuOpen then
        SendNUIMessage({
            type = 'GET_FAVORITES'
        })
    end
    
    Citizen.SetTimeout(500, function()
        isAnimating = false
    end)
end)

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        if isMenuOpen then
            if IsControlJustPressed(0, 200) then -- ESC key
                if isAnimating then return end
                
                isMenuOpen = false
                isAnimating = true
                
                SetNuiFocus(false, false)
                SendNUIMessage({
                    type = 'SET_VISIBILITY',
                    show = false,
                    animation = true,
                    animationType = 'close'
                })
                
                Citizen.SetTimeout(300, function()
                    isAnimating = false
                end)
            end
            
            DisableControlAction(0, 24, true) -- Attack
            DisableControlAction(0, 25, true) -- Aim
            DisableControlAction(0, 263, true) -- MeleeAttack1
            DisableControlAction(0, 264, true) -- MeleeAttack2
            DisableControlAction(0, 257, true) -- Attack2
            
            EnableControlAction(0, 32, true) -- W
            EnableControlAction(0, 33, true) -- S
            EnableControlAction(0, 34, true) -- A
            EnableControlAction(0, 35, true) -- D
            EnableControlAction(0, 22, true) -- Jump
            EnableControlAction(0, 21, true) -- Sprint
            EnableControlAction(0, 23, true) -- Enter Vehicle
            EnableControlAction(0, 75, true) -- Exit Vehicle
            
            EnableControlAction(0, 1, true) -- Look Left/Right
            EnableControlAction(0, 2, true) -- Look Up/Down
            
            EnableControlAction(0, 71, true) -- Vehicle Forward
            EnableControlAction(0, 72, true) -- Vehicle Backward
            EnableControlAction(0, 59, true) -- Vehicle Left/Right
            
            EnableControlAction(0, 36, true) -- Duck
            EnableControlAction(0, 37, true) -- Select Weapon
            EnableControlAction(0, 38, true) -- Pickup
            EnableControlAction(0, 39, true) -- Sprint
            EnableControlAction(0, 40, true) -- Special Ability
            EnableControlAction(0, 44, true) -- Cover
            EnableControlAction(0, 45, true) -- Reload
            EnableControlAction(0, 46, true) -- Talk
            EnableControlAction(0, 47, true) -- Detonate
            EnableControlAction(0, 48, true) -- HUDSpecial
            EnableControlAction(0, 49, true) -- Jump
            EnableControlAction(0, 50, true) -- Look Behind
            EnableControlAction(0, 51, true) -- Look Left/Right
            EnableControlAction(0, 52, true) -- Look Up/Down
            EnableControlAction(0, 53, true) -- Look Up
            EnableControlAction(0, 54, true) -- Look Down
            EnableControlAction(0, 55, true) -- Look Left
            EnableControlAction(0, 56, true) -- Look Right
            EnableControlAction(0, 57, true) -- Sprint
            EnableControlAction(0, 58, true) -- Special Ability PC
            EnableControlAction(0, 59, true) -- Special Ability Secondary
        end
    end
end)

Citizen.CreateThread(function()
    while true do
        if isMenuOpen then
            local playerPed = PlayerPedId()
            local coords = GetEntityCoords(playerPed)
            local heading = GetEntityHeading(playerPed)
            
            SendNUIMessage({
                type = 'UPDATE_COORDS',
                data = {
                    x = math.floor(coords.x * 100) / 100, 
                    y = math.floor(coords.y * 100) / 100, 
                    z = math.floor(coords.z * 100) / 100, 
                    h = math.floor(heading * 100) / 100   
                }
            })
        end
        Citizen.Wait(100)
    end
end)

RegisterNUICallback('Close', function()
    if isAnimating then return end
    
    isMenuOpen = false
    isAnimating = true
    
    SetNuiFocus(false, false)
    SendNUIMessage({
        type = 'SET_VISIBILITY',
        show = false,
        animation = true,
        animationType = 'close'
    })
    
    Citizen.SetTimeout(300, function()
        isAnimating = false
    end)
end)

RegisterNUICallback('CopyToClipboard', function(data, cb)
    local text = data.text
    if text then
        SendNUIMessage({
            type = 'COPY_TO_CLIPBOARD',
            text = text
        })

        cb({
            status = "success"
        })
    end
end)

RegisterNUICallback('COPY_SUCCESS', function(data, cb)
    if data and data.text then
        TriggerEvent('es-hud:notify', 'Koordinat kopyalandı!')
    end
    cb('ok')
end)

RegisterNetEvent('es-hud:notify')
AddEventHandler('es-hud:notify', function(message)
    SetNotificationTextEntry('STRING')
    AddTextComponentString(message)
    DrawNotification(false, false)
end)

Citizen.CreateThread(function()
    SendNUIMessage({
        type = 'INIT_CLIPBOARD'
    })
end)