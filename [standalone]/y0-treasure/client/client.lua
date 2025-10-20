local RSGCore = exports['rsg-core']:GetCoreObject()
lib.locale()

Entities = {}


CreateThread(function()
    for k, v in pairs(Config.Treasures) do
        local zone = lib.zones.box({
            coords = vec3(v.location.x, v.location.y, v.location.z),
            size = vec3(5, 5, 5),
            rotation = 45,
            debug = false,
            onEnter = function()
                for _, ent in pairs(Entities) do
                    if ent.label == v.reward then
                        return 
                    end
                end

                local model = GetHashKey(v.prop)
                RequestModel(model)
                while not HasModelLoaded(model) do Wait(0) end

                local entity = CreateObject(model, v.location.x, v.location.y, v.location.z, true, false, false)
                SetEntityRotation(entity, v.rotation.x, v.rotation.y, v.rotation.z, 2, true)
                FreezeEntityPosition(entity, true)

                table.insert(Entities, {
                    entity = entity,
                    spawned = true,
                    label = v.reward 
                })

                exports.ox_target:addLocalEntity(entity, {
                    name = v.name,
                    label = v.label,
                    icon = 'fa-solid fa-gem',
                    onSelect = function(data)
                        local canInteract = lib.callback.await('y0-treasure:server:CheckTreasure', false, v)
                        if canInteract then
                            TriggerServerEvent('y0-treasure:server:StartTreasure', v)

                            if v.minigame then
                                local success = lib.skillCheck({'easy', 'easy', {areaSize = 60, speedMultiplier = 1}, 'easy'}, {'w', 'a', 's', 'd'})
                                if success then 
                                    TriggerServerEvent('y0-treasure:server:CompleteTreasure', v)
                                    lib.notify({ title = 'Treasure', description = 'You found something', type = 'success' })
                                end
                            else
                                local success2 = lib.progressBar({
                                    duration = 2000,
                                    label = 'Searching',
                                    canCancel = false,
                                    disable = { car = true }
                                }) 
                                if success2 then
                                    TriggerServerEvent('y0-treasure:server:CompleteTreasure', v)
                                    lib.notify({ title = 'Treasure', description = 'You found something', type = 'success' })
                                end
                            end
                        end
                    end
                })
            end,
            onExit = function()
                for i, ent in ipairs(Entities) do
                    if ent.label == v.reward then
                        DeleteObject(ent.entity)
                        DeleteEntity(ent.entity)
                        table.remove(Entities, i)
                        break
                    end
                end
            end
        })
    end
end)



AddEventHandler("onResourceStop", function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    for _, ent in pairs(Entities) do
        DeleteObject(ent.entity)
    end
    Entities = {}
end)