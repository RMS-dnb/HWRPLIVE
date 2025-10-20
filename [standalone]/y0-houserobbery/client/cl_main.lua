-- local RSGCore = exports['rsg-core']:GetCoreObject()
-- lib.locale()

-- CreateThread(function()
--     for k, v in pairs(Config.HousesToRob) do
--         exports.ox_target:addSphereZone({
--             name = v.name,
--             coords = vec3(v.entercoords.x, v.entercoords.y, v.entercoords.z),
--             radius = 1.0,
--             debug = false,
--             drawSprite = false,
--             options = {
--                 label = locale('Rob_House'),
--                 canInteract = function()
--                     return RSGCore.Functions.HasItem(Config.BreakInItem, 1) 
--                 end,
--                 onSelect = function()
--                     local count = lib.callback.await('y0-houserobbery:server:checkLawmen')
--                     if count < Config.lawmenMinimun then
--                         RSGCore.Functions.Notify("Not enough lawmen in town!", "error", 5000)
--                         return
--                     end

--                     local inCooldown = lib.callback.await('y0-houserobbery:server:checkCooldown', false, k, v)
--                     if inCooldown then return end

--                     local firstPlayer = lib.callback.await('y0-houserobbery:TriggerCooldown', false, "activate", k)
--                     if not firstPlayer then return end

--                     local playerPed = PlayerPedId()
--                     local animDict = Config.Animations.HouseEnter.anim
--                     local animClip = Config.Animations.HouseEnter.clip

--                     RequestAnimDict(animDict)
--                     while not HasAnimDictLoaded(animDict) do
--                         Citizen.Wait(100)
--                     end

--                     SetEntityHeading(playerPed, GetEntityHeading(playerPed))
--                     local entercoords = vec3(v.entercoords.x, v.entercoords.y, v.entercoords.z - 1.0)
--                     SetEntityCoords(playerPed, entercoords, true, false, false, false)
--                     SetEntityHeading(playerPed, v.entercoords.w)
--                     TaskPlayAnim(playerPed, animDict, animClip, 8.0, -8.0, -1, 1, 0.0, false, false, false)

--                     local success = Minigame()
--                     if success then
--                         ClearPedTasks(playerPed)
--                         local entercoords2 = vec3(v.entercoords.x, v.entercoords.y, v.entercoords.z)
--                         local chance = math.random(1, 99)
--                         if chance < Config.PoliceChance then
--                             TriggerPolice(entercoords2)
--                         end
--                         lib.callback.await('y0-houserobbery:server:removeItem', false, Config.BreakInItem)
--                         EnterHouse(k, v)
--                     else
--                         lib.callback.await('y0-houserobbery:server:removeItem', false, Config.BreakInItem)
--                     end
--                     ClearPedTasks(playerPed)
--                 end,
--             }
--         })
--     end
-- end)
local RSGCore = exports['rsg-core']:GetCoreObject()
lib.locale()

CreateThread(function()
    for k, v in pairs(Config.HousesToRob) do
        exports.ox_target:addSphereZone({
            name = v.name,
            coords = vec3(v.entercoords.x, v.entercoords.y, v.entercoords.z),
            radius = 1.0,
            debug = false,
            drawSprite = false,
            options = {
                label = locale('Rob_House'),
                canInteract = function()
                    -- Check for item
                    if not RSGCore.Functions.HasItem(Config.BreakInItem, 1) then
                        return false
                    end

                    -- Time check (night only: 20:00 - 05:59)
                    local hour = GetClockHours()
                    if hour >= 20 or hour < 6 then
                        return true
                    end

                    -- Not allowed during the day
                    return false
                end,
                onSelect = function()
                    local count = lib.callback.await('y0-houserobbery:server:checkLawmen')
                    if count < Config.lawmenMinimun then
                        RSGCore.Functions.Notify("Not enough lawmen in town!", "error", 5000)
                        return
                    end

                    local inCooldown = lib.callback.await('y0-houserobbery:server:checkCooldown', false, k, v)
                    if inCooldown then return end

                    local firstPlayer = lib.callback.await('y0-houserobbery:TriggerCooldown', false, "activate", k)
                    if not firstPlayer then return end

                    local playerPed = PlayerPedId()
                    local animDict = Config.Animations.HouseEnter.anim
                    local animClip = Config.Animations.HouseEnter.clip

                    RequestAnimDict(animDict)
                    while not HasAnimDictLoaded(animDict) do
                        Citizen.Wait(100)
                    end

                    SetEntityHeading(playerPed, GetEntityHeading(playerPed))
                    local entercoords = vec3(v.entercoords.x, v.entercoords.y, v.entercoords.z - 1.0)
                    SetEntityCoords(playerPed, entercoords, true, false, false, false)
                    SetEntityHeading(playerPed, v.entercoords.w)
                    TaskPlayAnim(playerPed, animDict, animClip, 8.0, -8.0, -1, 1, 0.0, false, false, false)

                    local success = Minigame()
                    if success then
                        ClearPedTasks(playerPed)
                        local entercoords2 = vec3(v.entercoords.x, v.entercoords.y, v.entercoords.z)
                        local chance = math.random(1, 99)
                        if chance < Config.PoliceChance then
                            TriggerPolice(entercoords2)
                        end
                        lib.callback.await('y0-houserobbery:server:removeItem', false, Config.BreakInItem)
                        EnterHouse(k, v)
                    else
                        lib.callback.await('y0-houserobbery:server:removeItem', false, Config.BreakInItem)
                    end
                    ClearPedTasks(playerPed)
                end,
            }
        })
    end
end)
