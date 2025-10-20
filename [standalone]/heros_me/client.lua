local RSGCore = exports['rsg-core']:GetCoreObject()

local displayTime = 7000 -- in ms
local displayedText = nil
local descText = nil
local descDisabled = false
local displayData = {}

-- ========== COMMANDS ========== --

-- /me command
RegisterCommand('me', function(_, args)
    local text = '* ' .. table.concat(args, ' ') .. ' *'
    local localText = text
    displayedText = localText
    TriggerServerEvent('3dme:shareDisplay', localText)

    Citizen.CreateThread(function()
        Citizen.Wait(displayTime)
        if displayedText == localText then
            displayedText = nil
        end
    end)
end)

-- /do command
RegisterCommand('do', function(_, args)
    local text = '* ' .. table.concat(args, ' ') .. ' *'
    local localText = text
    displayedText = localText
    TriggerServerEvent('3dme:shareDisplay', localText)

    Citizen.CreateThread(function()
        Citizen.Wait(displayTime)
        if displayedText == localText then
            displayedText = nil
        end
    end)
end)

-- /desc command
RegisterCommand('desc', function(_, args)
    local text = table.concat(args, ' '):gsub("^%s*(.-)%s*$", "%1") -- trim
    if descText then
        TriggerServerEvent('3dme:removeDisplay')
        descText = nil
    else
        descText = text
        TriggerServerEvent('3dme:shareDisplay', "desc:" .. text)
    end
end)

-- /toggledesc command
RegisterCommand('toggledesc', function()
    descDisabled = not descDisabled
    if descDisabled then
        RSGCore.Functions.Notify('All desc messages are now hidden.', 'success')
    else
        RSGCore.Functions.Notify('All desc messages are now visible.', 'success')
    end
end)

-- ========== DRAWING FUNCTIONS ========== --

-- For /me and /do
function DrawText3D(x, y, z, text)
    local onScreen, _x, _y = GetScreenCoordFromWorldCoord(x, y, z)
    local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
    if onScreen then
        SetTextScale(0.30, 0.30)
        SetTextFontForCurrentCommand(1)
        SetTextColor(255, 143, 0, 100)
        SetTextCentre(1)
        DisplayText(str, _x, _y)
        local factor = string.len(text) / 225
        DrawSprite("feeds", "toast_bg", _x, _y + 0.0125, 0.005 + factor, 0.03, 0.1, 20, 20, 20, 200, 0)
    end
end

-- For /desc
function DrawDescText3D(x, y, z, text)
    local onScreen, _x, _y = GetScreenCoordFromWorldCoord(x, y, z)
    local str = CreateVarString(10, "LITERAL_STRING", text, Citizen.ResultAsLong())
    if onScreen then
        SetTextScale(0.30, 0.30)
        SetTextFontForCurrentCommand(1)
        SetTextColor(255, 255, 255, 255)
        SetTextCentre(1)
        DisplayText(str, _x, _y)
    end
end

-- ========== SERVER EVENTS ========== --

RegisterNetEvent('3dme:triggerDisplay')
AddEventHandler('3dme:triggerDisplay', function(text, sourcePlayer)
    local playerId = GetPlayerFromServerId(sourcePlayer)
    if playerId ~= -1 then
        displayData[sourcePlayer] = {
            text = text,
            playerId = playerId,
            startTime = GetGameTimer()
        }

        -- Remove automatically if not a desc
        if string.sub(text, 1, 5) ~= "desc:" then
            Citizen.CreateThread(function()
                Citizen.Wait(displayTime)
                displayData[sourcePlayer] = nil
            end)
        end
    end
end)

RegisterNetEvent('3dme:removeDisplay')
AddEventHandler('3dme:removeDisplay', function(sourcePlayer)
    if sourcePlayer then
        displayData[sourcePlayer] = nil
        if sourcePlayer == GetPlayerServerId(PlayerId()) then
            descText = nil
        end
    else
        displayData = {}
        descText = nil
    end
end)

-- ========== RENDER LOOP ========== --

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(0)
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)

        -- Draw personal /me or /do
        if displayedText then
            DrawText3D(coords.x, coords.y, coords.z + 0.25, displayedText)
        end

        -- Draw personal /desc
        if descText and not descDisabled then
            DrawDescText3D(coords.x, coords.y, coords.z + 0.85, descText)
        end

        -- Draw others' 3D text
        for sourceId, data in pairs(displayData) do
            local targetPed = GetPlayerPed(data.playerId)
            if targetPed and targetPed ~= 0 then
                local targetCoords = GetEntityCoords(targetPed)
                local distance = #(coords - targetCoords)

                if distance <= 15.0 then
                    if string.sub(data.text, 1, 5) == "desc:" then
                        if not descDisabled then
                            local cleanText = string.sub(data.text, 6)
                            DrawDescText3D(targetCoords.x, targetCoords.y, targetCoords.z + 0.85, cleanText)
                        end
                    else
                        DrawText3D(targetCoords.x, targetCoords.y, targetCoords.z + 0.25, data.text)
                    end
                end
            end
        end
    end
end)
