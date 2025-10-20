local spawnedPeds = {}
lib.locale()

CreateThread(function()
    while true do
        Wait(500)
        for k,v in pairs(Config.PlayerSaloonLocations) do
            local playerCoords = GetEntityCoords(cache.ped)
            local distance = #(playerCoords - v.npccoords.xyz)
            
            -- Add location-based target zones instead of spawning peds
            if distance < Config.DistanceSpawn and not spawnedPeds[k] then
                -- Create target zone at the location
                local targetOptions = {
                    {
                        name = 'location_saloon_' .. k,
                        icon = 'far fa-eye',
                        label = locale('cl_lang_47'),
                        onSelect = function()
                            TriggerEvent('rex-saloon:client:opensaloon', v.saloonid, v.jobaccess, v.name, v.buyprice)
                        end,
                        distance = 4.0
                    }
                }
                
                -- Add location-based target
                local targetId = exports.ox_target:addSphereZone({
                    coords = v.npccoords.xyz,
                    radius = 2.0,
                    drawSprite = false,  -- This disables the blue dot
                    options = targetOptions
                })
                
                spawnedPeds[k] = { targetId = targetId }
            end
            
            -- Remove target zones when player moves away
            if distance >= Config.DistanceSpawn and spawnedPeds[k] then
                exports.ox_target:removeZone(spawnedPeds[k].targetId)
                spawnedPeds[k] = nil
            end
        end
    end
end)

-- Cleanup
AddEventHandler("onResourceStop", function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    for k,v in pairs(spawnedPeds) do
        if v.targetId then
            exports.ox_target:removeZone(v.targetId)
        end
        spawnedPeds[k] = nil
    end
end)