local RSGCore = exports['rsg-core']:GetCoreObject()

local spawnedPeds = {}
local Backpack = nil

local function NearNPC(npcmodel, npccoords, heading)
    local spawnedPed = CreatePed(npcmodel, npccoords.x, npccoords.y, npccoords.z - 1.0, heading, false, false, 0, 0)
    SetEntityAlpha(spawnedPed, 0, false)
    SetRandomOutfitVariation(spawnedPed, true)
    SetEntityCanBeDamaged(spawnedPed, false)
    SetEntityInvincible(spawnedPed, true)
    FreezeEntityPosition(spawnedPed, true)
    SetBlockingOfNonTemporaryEvents(spawnedPed, true)

    Backpack = CreateObject(`p_ambpack05x`, GetEntityCoords(spawnedPed), true, true, false)
    local BoneIndex = GetEntityBoneIndexByName(spawnedPed, 'CP_Back')
    AttachEntityToEntity(Backpack, spawnedPed, BoneIndex, vector3(-0.5, 0.0, 0.08), vector3(-80.0, 0.0, -90.0), true, true, false, true, 1, true)

    -- set relationship group between npc and player
    SetPedRelationshipGroupHash(spawnedPed, GetPedRelationshipGroupHash(spawnedPed))
    SetRelationshipBetweenGroups(1, GetPedRelationshipGroupHash(spawnedPed), `PLAYER`)

    if Config.FadeIn then
        for i = 0, 255, 51 do
            Wait(50)
            SetEntityAlpha(spawnedPed, i, false)
        end
    end

    return spawnedPed
end

-- CreateThread(function()
--     for k,v in pairs(Config.nativeLocations) do
--         local coords = v.coords2
--         local newpoint = lib.points.new({
--             coords = coords,
--             heading = coords.w,
--             distance = Config.DistanceSpawn,
--             model = v.model,
--             ped = nil,
--             id = v.id
--         })

--         newpoint.onEnter = function(self)
--             if not self.ped then
--                 lib.requestModel(self.model, 10000)
--                 self.ped = NearNPC(self.model, self.coords, self.heading)

--                 pcall(function ()
--                     exports['rsg-target']:AddTargetEntity(self.ped, {
--                         options = {
--                             {
--                                 icon = 'fa-solid fa-eye',
--                                 label = Lang:t('client.lang_1'),
--                                 targeticon = 'fa-solid fa-eye',
--                                 action = function()
--                                     TriggerServerEvent('rsg-shops:server:openstore', 'native', 'native', 'Native Accessories')
--                                 end
--                             },
--                         },
--                         distance = 2.0,
--                     })
--                 end)
--             end
--         end

--         newpoint.onExit = function(self)
--             exports['rsg-target']:RemoveTargetEntity(self.ped, Lang:t('client.lang_1'))
--             if self.ped and DoesEntityExist(self.ped) then
--                 if Config.FadeIn then
--                     for i = 255, 0, -51 do
--                         Wait(50)
--                         SetEntityAlpha(self.ped, i, false)
--                     end
--                 end
--                 DeleteEntity(self.ped)
--                 self.ped = nil
--             end
--         end

--         spawnedPeds[k] = newpoint
--     end
-- end)
CreateThread(function()
    for k,v in pairs(Config.nativeLocations) do
        local coords = v.coords2
        local newpoint = lib.points.new({
            coords = coords,
            heading = coords.w,
            distance = Config.DistanceSpawn,
            model = v.model,
            ped = nil,
            id = v.id
        })

        newpoint.onEnter = function(self)
            if not self.ped then
                lib.requestModel(self.model, 10000)
                self.ped = NearNPC(self.model, self.coords, self.heading)

                pcall(function ()
                    exports['rsg-target']:AddTargetEntity(self.ped, {
                        options = {
                            {
                                icon = 'fa-solid fa-eye',
                                label = Lang:t('client.lang_1'),
                                targeticon = 'fa-solid fa-eye',
                                job = {
                                    ["native"] = 0
                                },
                                action = function()
                                    TriggerServerEvent('rsg-shops:server:openstore', 'native', 'native', 'Native Accessories')
                                end
                            },
                        },
                        distance = 2.0,
                    })
                end)
            end
        end

        newpoint.onExit = function(self)
            exports['rsg-target']:RemoveTargetEntity(self.ped, Lang:t('client.lang_1'))
            if self.ped and DoesEntityExist(self.ped) then
                if Config.FadeIn then
                    for i = 255, 0, -51 do
                        Wait(50)
                        SetEntityAlpha(self.ped, i, false)
                    end
                end
                DeleteEntity(self.ped)
                self.ped = nil
            end
        end

        spawnedPeds[k] = newpoint
    end
end)

-- cleanup
AddEventHandler("onResourceStop", function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    for k, v in pairs(spawnedPeds) do
        exports['rsg-target']:RemoveTargetEntity(v.ped, Lang:t('client.lang_1'))
        if v.ped and DoesEntityExist(v.ped) then
            SetEntityAsMissionEntity(Backpack)
            DeleteObject(Backpack)
            DeleteEntity(v.ped)
        end

        spawnedPeds[k] = nil
    end
end)
