local RSGCore = exports['rsg-core']:GetCoreObject()
local spawnedPeds = {}
lib.locale()

Citizen.CreateThread(function()
    for _, v in pairs(Config.Warehouse) do
        if v.showblip == true then
            local WarehouseBlip = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords)
            SetBlipSprite(WarehouseBlip, GetHashKey(Config.Blip.blipSprite), true)
            SetBlipScale(WarehouseBlip, Config.Blip.blipScale)
            Citizen.InvokeNative(0x9CB1A1623062F402, WarehouseBlip, Config.Blip.blipName)
        end
    end
end)

CreateThread(function()
    while true do
        Wait(500)
        for k,v in pairs(Config.Warehouse) do
            local playerCoords = GetEntityCoords(cache.ped)
            local distance = #(playerCoords - v.npccoords.xyz)

            if distance < Config.DistanceSpawn and not spawnedPeds[k] then
                local spawnedPed = NearPed(v.npcmodel, v.npccoords, v.title, v.storagename, v.maxweight, v.slots, v.joblocked, v.allowedjobs)
                spawnedPeds[k] = { spawnedPed = spawnedPed }
            end
            
            if distance >= Config.DistanceSpawn and spawnedPeds[k] then
                if Config.FadeIn then
                    for i = 255, 0, -51 do
                        Wait(50)
                        SetEntityAlpha(spawnedPeds[k].spawnedPed, i, false)
                    end
                end
                DeletePed(spawnedPeds[k].spawnedPed)
                spawnedPeds[k] = nil
            end
        end
    end
end)

function NearPed(npcmodel, npccoords, title, storagename, maxweight, slots, joblocked, allowedjobs)
    RequestModel(npcmodel)
    while not HasModelLoaded(npcmodel) do
        Wait(50)
    end
    spawnedPed = CreatePed(npcmodel, npccoords.x, npccoords.y, npccoords.z - 1.0, npccoords.w, false, false, 0, 0)
    SetEntityAlpha(spawnedPed, 0, false)
    SetRandomOutfitVariation(spawnedPed, true)
    SetEntityCanBeDamaged(spawnedPed, false)
    SetEntityInvincible(spawnedPed, true)
    FreezeEntityPosition(spawnedPed, true)
    SetBlockingOfNonTemporaryEvents(spawnedPed, true)
    SetPedCanBeTargetted(spawnedPed, false)
    if Config.FadeIn then
        for i = 0, 255, 51 do
            Wait(50)
            SetEntityAlpha(spawnedPed, i, false)
        end
    end
    exports.ox_target:addLocalEntity(spawnedPed, {
        {
            name = 'npc_warehouse',
            icon = 'far fa-eye',
            label = locale('cl_lang_1'),
            onSelect = function()
                -- Check job access on client side before triggering server event
                if joblocked then
                    local PlayerData = RSGCore.Functions.GetPlayerData()
                    local playerJob = PlayerData.job.name
                    local hasAccess = false
                    
                    -- Check if player's job is in the allowed jobs list
                    for _, job in pairs(allowedjobs) do
                        if playerJob == job then
                            hasAccess = true
                            break
                        end
                    end
                    
                    -- If player doesn't have access, show notification and return
                    if not hasAccess then
                        RSGCore.Functions.Notify('You do not have the required job to access this warehouse', 'error', 3000)
                        return
                    end
                end
                
                -- If not job locked or player has access, trigger server event
                TriggerServerEvent('rex-warehouse:server:openwarehouse', title, storagename, maxweight, slots)
            end,
            distance = 3.0
        }
    })
    return spawnedPed
end

-- cleanup
AddEventHandler("onResourceStop", function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    for k,v in pairs(spawnedPeds) do
        DeletePed(spawnedPeds[k].spawnedPed)
        spawnedPeds[k] = nil
    end
end)