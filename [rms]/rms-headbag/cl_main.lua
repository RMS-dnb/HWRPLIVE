local headMask = false
local Object = nil

RegisterNetEvent('RemoveHeadBag', function()
    if Object and DoesEntityExist(Object) then
        DeleteEntity(Object)
        SetEntityAsNoLongerNeeded(Object)
    end
    SendNUIMessage({ action = "remove" })
    headMask = false
end)

RegisterNetEvent("StartThread", function()
    local ped = PlayerPedId()

    Object = CreateObject(GetHashKey("p_bucket03x"), 0.0, 0.0, 0.0, true, true, true)
    AttachEntityToEntity(Object, ped, GetPedBoneIndex(ped, 21030), 0.2, -0.02, 0.0, 0.0, 270.0, 60.0, true, true, false, true, 1, true)
    SetEntityCompletelyDisableCollision(Object, false, true)
    SendNUIMessage({ action = "open" })

    headMask = true

    while headMask do
        Wait(10)
        if IsEntityDead(ped) then
            if not Config.RemoveonDeath then
                TriggerEvent("OnRespawn")
            else
                if Object and DoesEntityExist(Object) then
                    DeleteEntity(Object)
                end
                SendNUIMessage({ action = "remove" })
                headMask = false
                break
            end
        end
    end
end)

AddEventHandler("playerSpawned", function()
    if Object and DoesEntityExist(Object) then
        DeleteEntity(Object)
    end
    SetEntityAsNoLongerNeeded(Object)
    headMask = false
end)

RegisterNetEvent("CheckThread")
AddEventHandler("CheckThread", function()
    local closestPlayer, closestDistance = GetClosestPlayer()
    local playerPed = PlayerPedId()

    if closestPlayer == -1 or closestDistance > 2.0 then
        lib.notify({
            title = "No Players",
            description = "No players nearby!",
            type = "error"
        })
    else
        if not headMask then
            TriggerServerEvent("nc-headbag:getClosestPlayer", GetPlayerServerId(closestPlayer))
            headMask = true
        else
            TriggerServerEvent("nc-headbag:getClosestPlayer2", GetPlayerServerId(closestPlayer))
            headMask = false
        end
    end
end)

function GetClosestPlayer()
    local players = GetActivePlayers()
    local closestDistance = -1
    local closestPlayer = -1
    local playerPed = PlayerPedId()
    local playerId = PlayerId()
    local coords = GetEntityCoords(playerPed)

    for i = 1, #players do
        local tgt = GetPlayerPed(players[i])
        if players[i] ~= playerId then
            local targetCoords = GetEntityCoords(tgt)
            local distance = #(coords - targetCoords)

            if closestDistance == -1 or distance < closestDistance then
                closestPlayer = players[i]
                closestDistance = distance
            end
        end
    end

    return closestPlayer, closestDistance
end

function OnRespawn()
    if Object and DoesEntityExist(Object) then
        DeleteEntity(Object)
    end
    SetEntityAsNoLongerNeeded(Object)
    SendNUIMessage({ action = "remove" })
    headMask = false
end

RegisterNetEvent("OnRespawn", OnRespawn)

RegisterCommand(Config.bucketcommand, function()
    if headMask then
        TriggerServerEvent("nc-headbag:givebagback")
        TriggerEvent("CheckThread")
    end
end)
