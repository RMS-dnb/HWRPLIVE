local RSGCore = exports['rsg-core']:GetCoreObject()
local spawnedPeds = {}
local myAnimals = {}
local lastFeedTimes = {}
local growthThreads = {}
local lastCollectionTimes = {}
local spawnedPoos = {}
local activeCleanups = {}
local activeButcherCows = {}
local butcherNPC = nil
local butcherPed = nil

local cleanupProgress = 0
local totalPoosRequired = 5
local targetZone = nil

lib.locale()

MapAPI = {}

function MapAPI.setFOW(toggle)
    SetMinimapHideFow(
        toggle
    )
end

function MapAPI.DisplayRadar(toggle)
    DisplayRadar(toggle)
end

function MapAPI.StartGps(start, finish)
    StartGpsMultiRoute(6, true, true)
    AddPointToGpsMultiRoute(start.x, start.y, start.z)
    AddPointToGpsMultiRoute(finish.x, finish.y, finish.z)
    SetGpsMultiRouteRender(true)
end

function MapAPI.StopGps()
    ClearGpsMultiRoute()
end

BlipAPI = {}

function BlipAPI:SetBlip(name, sprite, scale, x, y, z, blipVector)
    local BlipClass = {}

    if not blipVector then
        BlipClass.rawblip =  Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, vector3(x, y, z))
        BlipClass.x = x
        BlipClass.y = y
        BlipClass.z = z
    else
        BlipClass.rawblip =  Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, blipVector)
        BlipClass.vector3 = blipVector
    end

    if type(sprite) == "string" then
        sprite = joaat(sprite)
    end
    SetBlipSprite(BlipClass.rawblip, sprite, true)
    SetBlipScale(BlipClass.rawblip, scale)
    Citizen.InvokeNative(0x9CB1A1623062F402, BlipClass.rawblip, name)

    function BlipClass:Get()
        return self.rawblip
    end

    function BlipClass:Remove()
        RemoveBlip(self.rawblip)
        self.rawblip = nil
    end

    return BlipClass
end

function BlipAPI:AddBlipModifier(blip, modifier)
    local ModifierClass = {}

    function ModifierClass:ApplyModifier()
        if blip and modifier then
            -- Ensure the modifier is in the correct format
            if type(modifier) == "string" then
                modifier = joaat(modifier)
            end
            -- Add the modifier to the blip
            Citizen.InvokeNative(0x662D364ABF16DE2F, blip:Get(), modifier)
        end
    end

    return ModifierClass
end

function BlipAPI:SetRadius(hash, radius, x, y, z)
    local RadiusClass = {}

    RadiusClass.rawrad = Citizen.InvokeNative(0x45f13b7e0a15c880, -1282792512, x, y, z, radius)

    if hash then
        Citizen.InvokeNative(0x74F74D3207ED525C, RadiusClass.rawrad, hash or -1282792512, true)
    end

    RadiusClass.x = x
    RadiusClass.y = y
    RadiusClass.z = z
    
    function RadiusClass:Get()
        return self.rawrad
    end

    function RadiusClass:Remove()
        RemoveBlip(self.rawrad)
        self.rawrad = nil
    end

    return RadiusClass
end

function BlipAPI:RemoveBlip(blip)
    RemoveBlip(blip)
end

local function LoadAnimationDic(dict)
  if not HasAnimDictLoaded(dict) then
      RequestAnimDict(dict)
      while not HasAnimDictLoaded(dict) do
          Citizen.Wait(0)
      end
  end
end

-- 🧑‍🌾 NPC Setup
CreateThread(function()
    for _, v in pairs(Config.RanchSettings) do
        local coords = v.npccoords
        local point = lib.points.new({
            coords   = coords.xyz,
            heading  = coords.w,
            distance = Config.DistanceSpawn,
            model    = v.npcmodel,
            ped      = nil
        })
        point.onEnter = function(self)
            if not self.ped then
                lib.requestModel(self.model, 10000)
                self.ped = CreatePed(self.model, coords.x, coords.y, coords.z - 1.0, coords.w, false, false, 0, 0)
                SetEntityAlpha(self.ped, 0, false)
                SetRandomOutfitVariation(self.ped, true)
                SetEntityCanBeDamaged(self.ped, false)
                SetEntityInvincible(self.ped, true)
                FreezeEntityPosition(self.ped, true)
                SetBlockingOfNonTemporaryEvents(self.ped, true)
                SetPedCanBeTargetted(self.ped, false)
                if Config.FadeIn then
                    for i = 0, 255, 51 do
                        Wait(50)
                        SetEntityAlpha(self.ped, i, false)
                    end
                end

                if Config.EnableTarget then
                    exports.ox_target:addLocalEntity(self.ped, {
    {
        name     = 'npc_ranch_boss',
        icon     = 'fa-solid fa-box',
        label    = 'Boss Menu',
        event    = 'rsg-bossmenu:client:mainmenu',
        distance = 2.0,
        canInteract = function(entity, distance, coords, name)
            local Player = RSGCore.Functions.GetPlayerData()
            return Player.job.name == v.job
        end
    },
    {
        name     = 'npc_ranch_storage',
        icon     = 'fa-solid fa-box',
        label    = 'Ranch Storage',
        event    = 'panboo-ranching:client:openRanchStorage',
        args     = { ranchid = v.ranchid },
        distance = 2.0,
        canInteract = function(entity, distance, coords, name)
            local Player = RSGCore.Functions.GetPlayerData()
            return Player.job.name == v.job
        end
    },
    {
        name     = 'npc_ranch_shop',
        icon     = 'fa-solid fa-box',
        label    = 'Ranch Supply Shop',
        event    = 'panboo-ranching:client:openRanchShop',
        distance = 2.0,
        canInteract = function(entity, distance, coords, name)
            local Player = RSGCore.Functions.GetPlayerData()
            return Player.job.name == v.job
        end
    },
    {
        name     = 'npc_manage_animals',
        icon     = 'fa-solid fa-box',
        label    = 'Manage My Animals',
        event    = 'panboo-ranching:client:viewStoredAnimals',
        distance = 2.0,
        canInteract = function(entity, distance, coords, name)
            local Player = RSGCore.Functions.GetPlayerData()
            return Player.job.name == v.job
        end
    },
    {
        name     = 'npc_buy_animals',
        icon     = 'fa-solid fa-paw',
        label    = 'Buy Farm Animals',
        event    = 'panboo-ranching:client:openRanchMenu',
        distance = 2.0,
        canInteract = function(entity, distance, coords, name)
            local Player = RSGCore.Functions.GetPlayerData()
            return Player.job.name == v.job
        end
    },
    {
        name     = 'npc_butcher_mission',
        icon     = 'fa-solid fa-scissors',
        label    = 'Start Butcher Mission',
        event    = 'panboo-ranching:client:openButcherMenu',
        args     = { butcherLocation = v.butcherLocation, job = v.job },
        distance = 2.0,
        canInteract = function(entity, distance, coords, name)
            local Player = RSGCore.Functions.GetPlayerData()
            return Player.job.name == v.job
        end
    },
    {
        name     = 'npc_retrieve_animals',
        icon     = 'fa-solid fa-people-roof',
        label    = 'Round Up Livestock',
        event    = 'panboo-ranching:client:confirmRetrieveAllAnimals',
        distance = 2.0,
        canInteract = function(entity, distance, coords, name)
            local Player = RSGCore.Functions.GetPlayerData()
            return Player.job.name == v.job
        end
    },
    -- {
    --     name     = 'npc_clean_ranch',
    --     icon     = 'fa-solid fa-broom',
    --     label    = 'Ranch Duty: Clean Pens',
    --     event    = 'panboo-ranching:client:startCleanupMission',
    --     args     = { ranchid = v.ranchid },
    --     distance = 2.0,
    --     canInteract = function(entity, distance, coords, name)
    --         local Player = RSGCore.Functions.GetPlayerData()
    --         return Player.job.name == v.job
    --     end
    -- },
    {
        name     = 'npc_hay_mission',
        icon     = 'fa-solid fa-broom',
        label    = 'Ranch Duty: Hay Delivery',
        event    = 'panboo-ranching:client:startHayDeliveryMission',
        args     = {
            ranchid = v.ranchid,
            hayPileLocation = v.hayPileLocation,
            hayPickupLocation = v.hayPickupLocation,
            wagonModel = v.wagonModel,
            hayPerPickup = v.hayPerPickup,
            maxHay = v.maxHay,
            hayWagonSpawn = v.hayWagonSpawn,
            hayDeliveryLocation = v.hayDeliveryLocation
        },
        distance = 2.0,
        canInteract = function(entity, distance, coords, name)
            local Player = RSGCore.Functions.GetPlayerData()
            return Player.job.name == v.job
        end
    },
    {
        name     = 'npc_grain_mission',
        icon     = 'fa-solid fa-wheat-awn',
        label    = 'Ranch Duty: Grain Delivery',
        event    = 'panboo-ranching:client:startGrainDeliveryMission',
        args     = {
            ranchid = v.ranchid,
            grainStartCoords = v.grainStartCoords,
            grainDropOffCoords = v.grainDropOffCoords,
            grainPickupLocation = v.grainPickupLocation,
            wagonModel = v.wagonModel,
            barrelModel = v.barrelModel,
            barrelCount = v.barrelCount,
            banditChance = v.banditChance,
            banditModels = v.banditModels,
            grainMissionRewards = v.grainMissionRewards
        },
        distance = 2.0,
        canInteract = function(entity, distance, coords, name)
            local Player = RSGCore.Functions.GetPlayerData()
            return Player.job.name == v.job
        end
    },

    {
        name     = 'npc_force_store_animal',
        icon     = 'fa-solid fa-ban',
        label    = 'Force Store Animal',
        event    = 'panboo-ranching:client:forceStoreAnimalDialog',
        distance = 2.0,
        canInteract = function(entity, distance, coords, name)
            local Player = RSGCore.Functions.GetPlayerData()
            return Player.job.name == v.job
        end
    }
})
                end
            end
        end

        point.onExit = function(self)
            exports.ox_target:removeEntity(self.ped, 'npc_manage_animals')
            exports.ox_target:removeEntity(self.ped, 'npc_buy_animals')
            exports.ox_target:removeEntity(self.ped, 'npc_ranch_boss')
            exports.ox_target:removeEntity(self.ped, 'npc_ranch_storage')
            exports.ox_target:removeEntity(self.ped, 'npc_ranch_shop')
            exports.ox_target:removeEntity(self.ped, 'npc_butcher_mission')
            exports.ox_target:removeEntity(self.ped, 'npc_retrieve_animals')
            exports.ox_target:removeEntity(self.ped, 'npc_clean_ranch')
            exports.ox_target:removeEntity(self.ped, 'npc_hay_mission')
            exports.ox_target:removeEntity(self.ped, 'npc_force_store_animal')

            if self.ped then
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

        table.insert(spawnedPeds, point)
    end
end)

AddEventHandler("onResourceStop", function(resource)
    if GetCurrentResourceName() ~= resource then return end
    for _, point in pairs(spawnedPeds) do
            exports.ox_target:removeEntity(point.ped, 'npc_manage_animals')
            exports.ox_target:removeEntity(point.ped, 'npc_buy_animals')
            exports.ox_target:removeEntity(point.ped, 'npc_ranch_boss')
            exports.ox_target:removeEntity(point.ped, 'npc_ranch_storage')
            exports.ox_target:removeEntity(point.ped, 'npc_ranch_shop')
            exports.ox_target:removeEntity(point.ped, 'npc_butcher_mission')
            exports.ox_target:removeEntity(point.ped, 'npc_retrieve_animals')
            exports.ox_target:removeEntity(point.ped, 'npc_clean_ranch')
            exports.ox_target:removeEntity(point.ped, 'npc_hay_mission')
            exports.ox_target:removeEntity(point.ped, 'npc_force_store_animal')
        if point.ped then DeleteEntity(point.ped) end
    end
end)

RegisterNetEvent('panboo-ranching:client:forceStoreAnimalDialog')
AddEventHandler('panboo-ranching:client:forceStoreAnimalDialog', function()
    local input = lib.inputDialog("Force Store Animal", {
        {
            type = "input",
            label = "Animal Name",
            description = "Type the name of the missing animal you want to store",
            required = true
        }
    })

    if not input or not input[1] or input[1] == "" then return end

    TriggerEvent('panboo-ranching:client:tryForceStoreAnimal', input[1])
end)

RegisterNetEvent('panboo-ranching:client:tryForceStoreAnimal')
AddEventHandler('panboo-ranching:client:tryForceStoreAnimal', function(animalName)
    local found = findActiveAnimal(animalName)

    if found and DoesEntityExist(found.entity) then
        lib.notify({
            type = 'error',
            description = animalName .. " is still out and interactable. Try using 'Escort' or 'Return All' 🐐",
            duration = 6000
        })
        return
    end

    TriggerServerEvent('panboo-ranching:server:forceStoreAnimal', animalName)

    lib.notify({
        type = 'success',
        description = animalName .. " was not found, status reset to stored 🐄✅",
        duration = 5000
    })
end)

-- 🐐 Helper: Find active animal by name (expandable later)
function findActiveAnimal(name)
    for _, ped in ipairs(myAnimals) do
        if DoesEntityExist(ped) then
            local pedName = Entity(ped).state.animalName
            if pedName and pedName == name then
                return { entity = ped, name = pedName }
            end
        end
    end
    return nil
end

for _, v in pairs(Config.RanchSettings) do
    exports.ox_target:addBoxZone({
    coords = v.hayPileLocation,
    size = vec3(2.5, 2.5, 2.5),
    rotation = 0.0,
    debug = false,
    options = {
        {
            name = 'pickup_hay',
            icon = 'fa-solid fa-box',
            label = 'Grab Hay Bale',
            event = 'panboo-ranching:client:grabHay',
            args  = { ranchid = v.ranchid},
            canInteract = function(entity, distance, coords, name)
                local Player = RSGCore.Functions.GetPlayerData()
                return Player.job.name == v.job
            end

        },
        {
            name = 'return_hay',
            icon = 'fa-solid fa-arrow-left',
            label = 'Put Hay Back',
            event = 'panboo-ranching:client:returnHayCube',
            args  = { ranchid = v.ranchid},
            canInteract = function(entity, distance, coords, name)
                local Player = RSGCore.Functions.GetPlayerData()
                return Player.job.name == v.job
            end
        }

    }
})
end

RegisterNetEvent('panboo-ranching:client:grabHay')
AddEventHandler('panboo-ranching:client:grabHay', function(args)
    local ranchId = args.args.ranchid
    TriggerServerEvent("panboo-ranching:server:tryGrabHay", ranchId)
end)

RegisterNetEvent("panboo-ranching:client:hayGrabResult")
AddEventHandler("panboo-ranching:client:hayGrabResult", function(success, ranchid, haybales)
    if success then
        TriggerEvent("panboo-ranching:client:grabHayCube", ranchid, haybales)
    else
        lib.notify({
            type = 'error',
            description = "No hay available in the pile. Restock required 🌾",
            duration = 5000
        })
    end
end)

local carryingHay = false
local hayProp = nil

RegisterNetEvent('panboo-ranching:client:grabHayCube')
AddEventHandler('panboo-ranching:client:grabHayCube', function(ranchid, haybales)
    if carryingHay then return end
    local playerPed = PlayerPedId()
    carryingHay = true

    remainingBales = haybales - 1

    local model = `p_haybale01x`
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(10) end

    hayProp = CreateObject(model, 0, 0, 0, true, true, false)

    -- Attach to hand
    AttachEntityToEntity(hayProp, playerPed, GetPedBoneIndex(playerPed, 57005), 0.1, 0.45, -0.05, 0.2, 90.0, 90.0, false, false, false, false, 2, true)
    local animDict = "mech_loco_m@character@arthur@carry@crate_tnt@idle"
    local animName = "idle"

    LoadAnimationDic(animDict)
    TaskPlayAnim(playerPed, animDict, animName, 1.0, 1.0, -1, 25, 0.0,false, false, false, "", false) 
    RemoveAnimDict(animDict)

    TriggerServerEvent("panboo-ranching:server:modifyHayStockpile", ranchid, -1)

    lib.notify({
        type = 'info',
        description = "You picked up a hay bale. You have " .. remainingBales .. " left! Find a hungry animal 🐄",
        duration = 4000
    })
end)

RegisterNetEvent('panboo-ranching:client:returnHayCube')
AddEventHandler('panboo-ranching:client:returnHayCube', function(args)
    local ranchId = args.args.ranchid
    if not carryingHay then
        lib.notify({
            type = 'error',
            description = "You're not carrying any hay to return 🌾",
            duration = 4000
        })
        return
    end

    local playerPed = PlayerPedId()

    -- Clear animation
    ClearPedTasksImmediately(playerPed)

    -- Delete hay prop
    if hayProp and DoesEntityExist(hayProp) then
        DeleteEntity(hayProp)
    end

    hayProp = nil
    carryingHay = false
    TriggerServerEvent("panboo-ranching:server:modifyHayStockpile", ranchId, 1)

    lib.notify({
        type = 'info',
        description = "You returned the hay bale to the stack 📦",
        duration = 4000
    })
end)

RegisterNetEvent('panboo-ranching:client:feedAnimal')
AddEventHandler('panboo-ranching:client:feedAnimal', function(data, name)
    if not data or not data.entity then return end
    local animal = data.entity
    if not DoesEntityExist(animal) then return end

    if not carryingHay then
        lib.notify({
            type = 'error',
            description = "You need to grab some hay first 🌾",
            duration = 4000
        })
        return
    end

    local now = GetGameTimer()
    local cooldown = Config.FeedTimer * 60 * 1000
    local lastFed = lastFeedTimes[data.name] or 0
    if (now - lastFed) < cooldown then
        lib.notify({
            type = 'error',
            description = "This animal isn't ready to eat again yet! 🍽️",
            duration = 5000
        })
        return
    end

    -- Remove hay from player
    ClearPedTasksImmediately(PlayerPedId())
    if hayProp and DoesEntityExist(hayProp) then
        DeleteEntity(hayProp)
    end
    hayProp = nil
    carryingHay = false

    -- Begin feeding behavior
    local animalModel = GetEntityModel(animal)
    ClearPedTasksImmediately(animal)
    Wait(100)
    FreezeEntityPosition(animal, true)
    SetEntityInvincible(animal, true)
    SetBlockingOfNonTemporaryEvents(animal, true)

    local grazingScenarios = {
        [GetHashKey("A_C_Cow")]        = "WORLD_ANIMAL_COW_GRAZING",
        [GetHashKey("A_C_Chicken_01")] = "WORLD_ANIMAL_CHICKEN_EATING",
        [GetHashKey("A_C_Sheep_01")]   = "WORLD_ANIMAL_DEER_GRAZING",
        [GetHashKey("A_C_Pig_01")]   = "WORLD_ANIMAL_DEER_GRAZING"
    }

    local scenario = grazingScenarios[animalModel]
    if scenario then
        TaskStartScenarioInPlace(animal, scenario, 0, true)
        lib.notify({
            type = 'success',
            description = "The animal begins grazing 🌾",
            duration = 5000
        })
    end

        local hayPileModel = `p_haypile03x`
        local boneIndex = GetEntityBoneIndexByName(animal, "SKEL_Head")
        local mouthPos = GetWorldPositionOfEntityBone(animal, boneIndex)

        RequestModel(hayPileModel)
        while not HasModelLoaded(hayPileModel) do Wait(10) end

        local hayPile = CreateObject(hayPileModel, mouthPos.x, mouthPos.y, mouthPos.z - 0.3, true, true, false)
        PlaceObjectOnGroundProperly(hayPile)
        FreezeEntityPosition(hayPile, true)
        local playerPed = PlayerPedId()

        ClearPedTasksImmediately(playerPed)
        Wait(100)
        local animDict = "amb_work@world_human_bale_put_down@1@male_a@stand_exit"
        local animName = "exit_front"

        LoadAnimationDic(animDict)
        TaskPlayAnim(playerPed, animDict, animName, 1.0, 1.0, -1, 1, 1.0, false, false, false, "", false)
        lib.progressCircle({
            duration = 10000,
            position = 'bottom',
            useWhileDead = false,
            canCancel = false,
            label = 'Spreading Hay...',
        })
        ClearPedTasksImmediately(playerPed)

    CreateThread(function()
        local feedDuration = 30 * 1000
        local startTime = GetGameTimer()

        while GetGameTimer() - startTime < feedDuration do
            Wait(1000)
        end

        ClearPedTasksImmediately(animal)
        SetEntityInvincible(animal, false)
        if hayPile and DoesEntityExist(hayPile) then
            DeleteEntity(hayPile)
        end


        lib.notify({
            type = 'info',
            description = "The animal is done feeding. It looks like it has grown a bit. 🌾",
            duration = 5000
        })
    end)

    TriggerServerEvent('panboo-ranching:server:updateGrowth', data.name, Config.GrowthGainedFromFeeding)
    lastFeedTimes[data.name] = now
end)

RegisterNetEvent('panboo-ranching:client:openRanchShop')
AddEventHandler('panboo-ranching:client:openRanchShop', function()
    TriggerServerEvent('panboo-ranching:server:openShop')
end)

RegisterNetEvent('panboo-ranching:client:openRanchStorage')
AddEventHandler('panboo-ranching:client:openRanchStorage', function(args)
    TriggerServerEvent('panboo-ranching:server:openStorage', args.args.ranchid)
end)

-- 🐾 Purchase Flow
RegisterNetEvent('panboo-ranching:client:openRanchMenu')
AddEventHandler('panboo-ranching:client:openRanchMenu', function()
    local options = {}
    for animalKey, animalData in pairs(Config.AnimalsForSale) do
        table.insert(options, {
            title       = animalData.label,
            description = "Buy for $" .. animalData.price,
            icon        = 'fa-solid fa-paw',
            event       = 'panboo-ranching:client:buyAnimal',
            args        = { key = animalKey },
            arrow       = true
        })
    end

    lib.registerContext({ id = 'farm_animal_menu', title = 'Farm Animal Shop', options = options })
    lib.showContext('farm_animal_menu')
end)

RegisterNetEvent('panboo-ranching:client:butcherAnimal')
AddEventHandler('panboo-ranching:client:butcherAnimal', function(entity)
    local name = Entity(entity).state.animalName
    local growth = Entity(entity).state.animalGrowth or 0

    -- 🧪 Growth check
    if growth ~= 100 then
        lib.notify({
            type = 'error',
            description = name .. " isn't full grown enough to butcher!",
            duration = 5000
        })
        return
    end

    -- 🧙‍♂️ Play shearing animation
    ClearPedTasksImmediately(entity)
    Wait(100)
    FreezeEntityPosition(entity, true)
    local model = GetEntityModel(entity)
    if model == GetHashKey("A_C_Sheep_01") then
        TaskStartScenarioInPlace(entity, "WORLD_ANIMAL_SHEEP_INJURED_ON_GROUND", 0, true)
    end
    if model == GetHashKey("A_C_Chicken_01") then
        TaskStartScenarioInPlace(entity, "WORLD_ANIMAL_CHICKEN_RESTING", 0, true)
    end
    if model == GetHashKey("A_C_Pig_01") then
        TaskStartScenarioInPlace(entity, "WORLD_ANIMAL_PIG_INJURED_ON_GROUND", 0, true)
    end
    
    local playerPed = PlayerPedId()

    local animDict = "mech_dynamic@world_player_dynamic_kneel_ground@trans@knife1@male_a"
    local animName = "knife1_trans_kneel1"

    LoadAnimationDic(animDict)
    TaskPlayAnim(playerPed, animDict, animName, 1.0, 1.0, -1, 1, 0.0,false, false, false, "", false) 
    RemoveAnimDict(animDict)

    -- ⏱️ Let animation play for a moment
    lib.progressCircle({
        duration = 15000,
        position = 'bottom',
        useWhileDead = false,
        canCancel = false,
        label = 'Butchering Animal...',
    })
    
    ClearPedTasksImmediately(entity)
    ClearPedTasksImmediately(playerPed)
    FreezeEntityPosition(entity, false)
    TriggerServerEvent('panboo-ranching:server:giveButcherItems', name)

    DeleteEntity(entity)
    lib.notify({
        type = 'success',
        description = name .. " has been butchered!",
        duration = 5000
    })

end)

RegisterNetEvent('panboo-ranching:client:startHayDeliveryMission')
AddEventHandler('panboo-ranching:client:startHayDeliveryMission', function(args)
    local ranchId = args.args.ranchid
    local hayPickupLocation = args.args.hayPickupLocation
    local hayPileLocation = args.args.hayPileLocation
    local wagonModel = args.args.wagonModel
    local hayPerPickup = args.args.hayPerPickup
    local maxHay = args.args.maxHay
    local hayWagonSpawn = args.args.hayWagonSpawn
    local hayDeliveryLocation = args.args.hayDeliveryLocation

    local hayModel = `p_haybale01x`
    local pileModel = `mp001_p_mp_haybalecover01x`
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)

    if not ranchId then
        lib.notify({ type = 'error', description = "No valid ranch identifier received 🐎" })
        return
    end

    -- 🚚 Spawn wagon
    lib.requestModel(wagonModel)
    local wagon = CreateVehicle(wagonModel, hayWagonSpawn.x, hayWagonSpawn.y, hayWagonSpawn.z, 0.0, true, false)
    SetVehicleOnGroundProperly(wagon)
    TaskWarpPedIntoVehicle(playerPed, wagon, -1)

    -- 🧭 GPS to pickup
    BlipAPI:SetBlip("Hay Pickup Location", -902701436, 1.0, hayPickupLocation.x, hayPickupLocation.y, hayPickupLocation.z, hayPickupLocation)
    MapAPI.StartGps(coords, hayPickupLocation)
    lib.notify({ type = 'inform', description = "Drive the wagon to the hay pickup location 🌾" })

    local hayCollected = 0

    -- 🌾 Spawn hay pile
    lib.requestModel(pileModel)
    local hayPile = CreateObject(pileModel, hayPickupLocation.x, hayPickupLocation.y, hayPickupLocation.z - 1, true, true, false)
    local hayPileId = NetworkGetNetworkIdFromEntity(hayPile)
    SetEntityHeading(hayPile, 0)
    PlaceObjectOnGroundProperly(hayPile)
    FreezeEntityPosition(hayPile, true)

    local hayZone = exports.ox_target:addBoxZone({
        coords = hayPickupLocation,
        size = vec3(4.0, 4.0, 4.0),
        rotation = 0.0,
        debug = false,
        options = {
            {
                name = 'pickup_hay_mission',
                icon = 'fa-solid fa-box',
                label = 'Pick Up Hay',
                onSelect = function()
                    if carryingHay then
                        lib.notify({ description = "You're already carrying hay!", type = 'error' })
                        return
                    end

                    lib.requestModel(hayModel, 10000)
                    hayProp = CreateObject(hayModel, 0, 0, 0, true, true, false)
                    AttachEntityToEntity(hayProp, playerPed, GetPedBoneIndex(playerPed, 57005), 0.1, 0.45, -0.05, 0.2, 90.0, 90.0, false, false, false, false, 2, true)

                    local animDict = "mech_loco_m@character@arthur@carry@crate_tnt@idle"
                    LoadAnimationDic(animDict)
                    TaskPlayAnim(playerPed, animDict, "idle", 1.0, 1.0, -1, 25, 0.0, false, false, false)
                    RemoveAnimDict(animDict)

                    carryingHay = true
                    lib.notify({ description = "You picked up a haybale 🌾", type = 'success' })
                end
            }
        }
    })

    -- 🎯 Target: Load Hay into Wagon
    exports.ox_target:addLocalEntity(wagon, {
        {
            name = 'load_hay_wagon',
            icon = 'fa-solid fa-truck-loading',
            label = 'Load Hay into Wagon',
            distance = 3.0,
            canInteract = function()
                return carryingHay
            end,
            onSelect = function()
                hayCollected += 1
                ClearPedTasksImmediately(playerPed)
                DeleteEntity(hayProp)
                hayProp = nil
                carryingHay = false

                lib.notify({ description = "Hay loaded into wagon! (" .. hayCollected .. "/" .. maxHay .. ")", type = 'success' })

                if hayCollected >= maxHay then
                    DeleteEntity(hayPile)
                    if hayZone then
                        exports.ox_target:removeZone('pickup_hay_mission', true)
                        hayZone = nil
                    end
                    BlipAPI:SetBlip("Hay Delivery Location", -902701436, 1.0, hayDeliveryLocation.x, hayDeliveryLocation.y, hayDeliveryLocation.z, hayDeliveryLocation)
                    MapAPI.StartGps(coords, hayDeliveryLocation)
                    lib.notify({ description = "The wagon is fully loaded. Deliver and unload it at your ranch hay pile!", type = 'success' })
                end
            end
        }
    })

    -- 🎯 Target: Unload Hay at Ranch
    exports.ox_target:addLocalEntity(wagon, {
        {
            name = 'unload_hay',
            icon = 'fa-solid fa-box-open',
            label = 'Unload Hay Bale',
            distance = 3.0,
            canInteract = function()
                return hayCollected > 0 and not carryingHay
            end,
            onSelect = function()
                lib.requestModel(hayModel, 10000)
                hayProp = CreateObject(hayModel, 0, 0, 0, true, true, false)
                AttachEntityToEntity(hayProp, playerPed, GetPedBoneIndex(playerPed, 57005), 0.1, 0.45, -0.05, 0.2, 90.0, 90.0, false, false, false, false, 2, true)

                local animDict = "mech_loco_m@character@arthur@carry@crate_tnt@idle"
                LoadAnimationDic(animDict)
                TaskPlayAnim(playerPed, animDict, "idle", 1.0, 1.0, -1, 25, 0.0, false, false, false)
                RemoveAnimDict(animDict)

                carryingHay = true
                hayCollected -= 1
                lib.notify({ description = "You picked up a haybale 🌾", type = 'success' })

                if hayCollected <= 0 then
                    DeleteVehicle(wagon)
                    MapAPI.StopGps()
                    exports.ox_target:removeEntity(wagon, 'unload_hay')
                    lib.notify({ description = "Delivery complete! Ranch restocked 🐄", type = 'success' })
                end
            end
        }
    })
end)

RegisterNetEvent('panboo-ranching:client:startButcherEscort')
AddEventHandler('panboo-ranching:client:startButcherEscort', function(data)
    if not data or not data.model or not data.name then return end

    -- 🛑 Duplication check
    if activeButcherCows and activeButcherCows[data.name] then
        lib.notify({
            type = 'error',
            description = data.name .. " is already being escorted 🐄",
            duration = 4000
        })
        return
    end

    -- ✅ Mark as active before spawn
    activeButcherCows[data.name] = true

    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local heading = GetEntityHeading(playerPed)
    local hash = GetHashKey(data.model)
    local spawnCoords = vector3(coords.x + 2.0, coords.y, coords.z)

    RequestModel(hash)
    while not HasModelLoaded(hash) do Wait(100) end

    local animal = CreatePed(hash, spawnCoords.x, spawnCoords.y, spawnCoords.z, heading, true, false)

    Entity(animal).state:set("animalName", data.name, true)
    Entity(animal).state:set("animalGrowth", data.growth or 0, true)

    SetEntityAlpha(animal, 0, false)
    SetRandomOutfitVariation(animal, true)
    SetEntityCanBeDamaged(animal, true)
    SetEntityInvincible(animal, true)
    FreezeEntityPosition(animal, false)
    SetBlockingOfNonTemporaryEvents(animal, true)
    SetPedCanBeTargetted(animal, true)
    TaskFollowToOffsetOfEntity(animal, playerPed, 0.0, 2.0, 0.0, 2.0, -1, 3.0, true)

    if Config.FadeIn then
        for i = 0, 255, 51 do
            Wait(50)
            SetEntityAlpha(animal, i, false)
        end
    end

    table.insert(myAnimals, animal)

    lib.notify({
        type = 'info',
        description = data.name .. " is now following you to the butcher 🐄",
        duration = 5000
    })

    -- 📦 Track cow for mission
    cowEscortList = cowEscortList or {}
    cowEscortList[data.name] = animal

    -- 🔍 Find matching ranch butcher location by player's job
    local Player = RSGCore.Functions.GetPlayerData()
    local butcherCoords = nil

    for _, ranch in pairs(Config.RanchSettings) do
        if ranch.job == Player.job.name then
            print(ranch.butcherLocation)
            butcherCoords = ranch.butcherLocation
            break
        end
    end


    -- 🧭 Set the blip if valid location found
    if butcherCoords then
        BlipAPI:SetBlip("Butcher Location", 0x919BC110, 1.0, butcherCoords.x, butcherCoords.y, butcherCoords.z, butcherCoords)
        MapAPI.StartGps(coords, butcherCoords)
    end

    if not butcherNPC or not DoesEntityExist(butcherNPC) then
        local butcherModel = `u_m_m_bwmstablehand_01`
        lib.requestModel(butcherModel, 10000)
        butcherNPC = CreatePed(butcherModel, butcherCoords.x, butcherCoords.y, butcherCoords.z - 1.0, butcherCoords.w, false, false, 0, 0)
        local butcherNPCId = NetworkGetNetworkIdFromEntity(butcherNPC)
        SetEntityAlpha(butcherNPC, 0, false)
        SetRandomOutfitVariation(butcherNPC, true)
        SetEntityCanBeDamaged(butcherNPC, false)
        SetEntityInvincible(butcherNPC, true)
        FreezeEntityPosition(butcherNPC, true)
        SetBlockingOfNonTemporaryEvents(butcherNPC, true)
        SetPedCanBeTargetted(butcherNPC, false)
        if Config.FadeIn then
            for i = 0, 255, 51 do
                Wait(50)
                SetEntityAlpha(butcherNPC, i, false)
            end
        end
        while not HasModelLoaded(butcherModel) do Wait(10) end

        exports.ox_target:addLocalEntity(butcherNPC, {
            {
                name = 'npc_butcher_confirm',
                icon = 'fa-solid fa-scissors',
                label = 'Confirm Butchering',
                job = Player.job.name,
                distance = 2.5,
                canInteract = function(entity, distance, coords, name)
                    return cowEscortList and next(cowEscortList) ~= nil
                end,
                onSelect = function()
                    TriggerEvent('panboo-ranching:client:confirmButcherProcess')
                end
            }
        })
    end

    -- 🔁 Refresh menu to reflect escort status
    TriggerEvent('panboo-ranching:client:openButcherMenu')
end)

RegisterNetEvent('panboo-ranching:client:openButcherMenu')
AddEventHandler('panboo-ranching:client:openButcherMenu', function()
    lib.callback('panboo-ranching:server:getButcherReadyCows', false, function(results)
        local options = {}

        for _, cow in pairs(results) do
            local name = cow.name

            if activeButcherCows and activeButcherCows[name] then
                table.insert(options, {
                    title = name .. " [100% Grown] — Escorting...",
                    description = "This cow is already in an active butcher mission.",
                    icon = 'fa-solid fa-cow',
                    disabled = true
                })
            else
                table.insert(options, {
                    title = name .. " [100% Grown]",
                    description = "Escort this cow to the butcher.",
                    icon = 'fa-solid fa-cow',
                    event = 'panboo-ranching:client:startButcherEscort',
                    args = { model = cow.model, name = name }
                })
            end
        end

        lib.registerContext({
            id = 'butcher_cow_menu',
            title = 'Select Cows for Butchering',
            options = options
        })

        lib.showContext('butcher_cow_menu')
    end)
end)

RegisterNetEvent('panboo-ranching:client:confirmButcherProcess')
AddEventHandler('panboo-ranching:client:confirmButcherProcess', function()
    CreateThread(function()
        DoScreenFadeOut(1000)
        while not IsScreenFadedOut() do Wait(100) end

        PlaySoundFrontend("BACK", "RDRO_Character_Creator_Sounds", true, 0)

        lib.progressCircle({
            duration = 10000,
            position = 'bottom',
            useWhileDead = false,
            canCancel = false,
            label = 'Butchering Livestock...',
        })

        MapAPI.StopGps()

        for name, cow in pairs(cowEscortList) do
            if DoesEntityExist(cow) then
                ClearPedTasksImmediately(cow)
                FreezeEntityPosition(cow, true)
                SetEntityInvincible(cow, true)
                SetBlockingOfNonTemporaryEvents(cow, true)
                DeleteEntity(cow)
                TriggerServerEvent('panboo-ranching:server:butcherCow', name)
            end
        end

        cowEscortList = {}
        DeleteEntity(butcherNPC)

        Wait(500)
        DoScreenFadeIn(1000)

        lib.notify({
            type = 'success',
            description = "The cows have been butchered. You received fresh beef 🥩",
            duration = 6000
        })
    end)
end)

RegisterNetEvent('panboo-ranching:client:confirmRetrieveAllAnimals')
AddEventHandler('panboo-ranching:client:confirmRetrieveAllAnimals', function()
    local input = lib.alertDialog({
        header  = "Round Up Livestock?",
        content = "Are you sure you want the ranchers to round up all the livestock that are currently out?",
        centered = true,
        cancel = true
    })

    if input == 'confirm' then
        TriggerEvent('panboo-ranching:client:retrieveAllAnimals')
    end
end)

RegisterNetEvent('panboo-ranching:client:retrieveAllAnimals')
AddEventHandler('panboo-ranching:client:retrieveAllAnimals', function()
    local Player = RSGCore.Functions.GetPlayerData()
    local job = Player.job.name
    local roundedUp = 0

    -- 🧭 World scan for owned animals (fallback if myAnimals is empty)
    local function getNearbyOwnedAnimals()
        local playerPed = PlayerPedId()
        local playerCoords = GetEntityCoords(playerPed)
        local found = {}

        for _, ped in pairs(GetGamePool("CPed")) do
            if IsPedAPlayer(ped) == false and DoesEntityExist(ped) then
                local model = GetEntityModel(ped)
                if model == GetHashKey("A_C_Cow") or model == GetHashKey("A_C_Sheep_01")
                 or model == GetHashKey("A_C_Chicken_01") or model == GetHashKey("A_C_Pig_01") then
                    local dist = #(playerCoords - GetEntityCoords(ped))
                    if dist < 150.0 then
                        local ownerJob = Entity(ped).state.owner
                        if ownerJob == job then
                            table.insert(found, ped)
                        end
                    end
                end
            end
        end

        return found
    end

    local allTargets = {}
    
    -- Add animals from my local list (if available)
    for _, ped in ipairs(myAnimals or {}) do
        if DoesEntityExist(ped) then
            table.insert(allTargets, ped)
        end
    end

    -- Merge scanned animals if not already present
    for _, scanPed in ipairs(getNearbyOwnedAnimals()) do
        local alreadyIncluded = false
        for _, cachedPed in ipairs(allTargets) do
            if scanPed == cachedPed then
                alreadyIncluded = true
                break
            end
        end
        if not alreadyIncluded then
            table.insert(allTargets, scanPed)
        end
    end

    -- 🎯 Clean them up
    for _, animal in ipairs(allTargets) do
        if DoesEntityExist(animal) then
            local name = Entity(animal).state.animalName or "Unnamed"
            roundedUp += 1

            -- Fade out and store
            CreateThread(function()
                for alpha = 255, 0, -51 do
                    Wait(50)
                    SetEntityAlpha(animal, alpha, false)
                end

                DeleteEntity(animal)
                TriggerServerEvent('panboo-ranching:server:storeAnimal', name)

                lib.notify({
                    type = 'info',
                    description = name .. " has been safely returned to the barn 🐄",
                    duration = 4000
                })
            end)
        end
    end

    myAnimals = {} -- reset local cache

    if roundedUp == 0 then
        lib.notify({
            type = 'error',
            description = "No active animals were found to retrieve 🐐",
            duration = 5000
        })
    else
        lib.notify({
            type = 'success',
            description = "Ranchers rounded up " .. roundedUp .. " lost animals 💼",
            duration = 5000
        })
    end
end)

RegisterNetEvent('panboo-ranching:client:buyAnimal')
AddEventHandler('panboo-ranching:client:buyAnimal', function(data)
    if not data or not data.key then return end
    TriggerServerEvent('panboo-ranching:server:buyAnimal', data.key)
end)

RegisterNetEvent('panboo-ranching:client:nameAnimalPrompt')
AddEventHandler('panboo-ranching:client:nameAnimalPrompt', function(model, animalKey)
    local input = lib.inputDialog('Name your animal', {
        { type = 'input', label = 'Animal Name', required = true }
    })
    if not input or not input[1] then return end

    local animalName = input[1]
    lib.callback('panboo-ranching:server:canBuyAnimal', false, function(success)
        if success then
            TriggerServerEvent('panboo-ranching:server:saveAnimal', model, input[1], animalKey)
        else
            lib.notify({ type = 'error', description = "You can't buy this animal. Either your ranch is full or the name is already taken." })
        end
    end, animalName)
    
end)

-- 🐾 Spawn, Feed, Follow, Store, Rename
AddEventHandler('panboo-ranching:client:spawnAnimal', function(data)
    if not data or not data.model or not data.name then return end

    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)
    local heading = GetEntityHeading(playerPed)
    local hash = GetHashKey(data.model)
    local spawnCoords = vector3(coords.x + 2.0, coords.y, coords.z)

    RequestModel(hash)
    while not HasModelLoaded(hash) do Wait(100) end

    local animal = CreatePed(hash, spawnCoords.x, spawnCoords.y, spawnCoords.z, heading, true, false)
    
    local animalNetId = NetworkGetNetworkIdFromEntity(animal)

    Entity(animal).state:set("animalName", data.name, true)
    Entity(animal).state:set("animalGrowth", data.growth or 0, true)
    
    SetEntityAlpha(animal, 0, false)
    SetRandomOutfitVariation(animal, true)
    SetEntityCanBeDamaged(animal, true)
    SetEntityInvincible(animal, true)
    FreezeEntityPosition(animal, false)
    SetBlockingOfNonTemporaryEvents(animal, true)
    SetPedCanBeTargetted(animal, true)

    if Config.FadeIn then
        for i = 0, 255, 51 do
            Wait(50)
            SetEntityAlpha(animal, i, false)
        end
    end
    
    table.insert(myAnimals, animal)

    lib.notify({
        type = 'info',
        description = data.name .. " has been retrieved from the barn 🐾",
        duration = 5000
    })

    TriggerServerEvent("panboo-ranching:server:unstoreAnimal", data.name)
    local model = GetEntityModel(animal)

    local options = {
    {
        name  = 'feed_animal',
        icon  = 'fa-solid fa-seedling',
        label = 'Feed Animal Hay 🌾',
        onSelect = function(data)
            local name = Entity(data.entity).state.animalName
            if not name then
                lib.notify({
                    type = 'error',
                    description = "Can't identify this animal 🐄",
                    duration = 4000
                })
                return
            end

            TriggerEvent('panboo-ranching:client:feedAnimal', {
                entity = data.entity,
                name = name
            })
        end
    },
    {
        name  = 'follow_animal',
        icon  = 'fa-solid fa-person-walking',
        label = 'Escort Animal 🐾',
        event = 'panboo-ranching:client:animalFollow',
        args  = { entity = animal, name = Entity(animal).state.animalName }
    },
    {
        name  = 'stop_following',
        icon  = 'fa-solid fa-ban',
        label = 'Stop Escorting Animal',
        event = 'panboo-ranching:client:stopEscorting',
        args  = { entity = animal, name = Entity(animal).state.animalName }
    }
    }

    -- 🥛 Add milking only for cows
    if model == GetHashKey("A_C_Cow") then
        table.insert(options, 2, {
            name  = 'milk_animal',
            icon  = 'fa-solid fa-glass-water',
            label = 'Milk Cow 🥛',
            distance = 2.0,
            onSelect = function(data)
                milkCow(data.entity)
            end
    })
    end

    -- 🥛 Add milking only for cows
    if model == GetHashKey("A_C_Sheep_01") then
        table.insert(options, 2, {
            name  = 'shear_animal',
            icon  = 'fa-solid fa-scissors',
            label = 'Shear Sheep ✂️',
            distance = 2.0,
            onSelect = function(data)
                shearSheep(data.entity)
            end
    })
    end

    if model == GetHashKey("A_C_Chicken_01") then
        table.insert(options, 2, {
            name  = 'collect_eggs',
            icon  = 'fa-solid fa-egg',
            label = 'Collect Eggs 🥚',
            distance = 2.0,
            onSelect = function(data)
                collectEggs(data.entity)
            end
    })
    end

    if model == GetHashKey("A_C_Pig_01") then
        table.insert(options, 2, {
            name  = 'collect_shrooms',
            icon  = 'fa-solid fa-mushroom',
            label = 'Collect Mushrooms 🍄',
            distance = 2.0,
            onSelect = function(data)
                collectMushrooms(data.entity)
            end
    })
    end

    local growth = Entity(animal).state.animalGrowth or 0
    local name = Entity(animal).state.animalName

    -- Only show butcher option for non-cows at 100% growth
    if growth == 100 and model ~= GetHashKey("A_C_Cow") then
        table.insert(options, {
            name  = 'butcher_animal',
            icon  = 'fa-solid fa-knife',
            label = 'Butcher Animal 🪓',
            distance = 2.0,
            onSelect = function(data)
                TriggerEvent('panboo-ranching:client:butcherAnimal', data.entity)
            end
        })
    end

    exports.ox_target:addEntity(animalNetId, options)

end)

RegisterNetEvent('panboo-ranching:client:stopEscorting')
AddEventHandler('panboo-ranching:client:stopEscorting', function(data)
    if not data or not data.entity then return end
    local animal = data.entity
    if not DoesEntityExist(animal) then return end

    local name = Entity(animal).state.animalName

    ClearPedTasksImmediately(animal)
    FreezeEntityPosition(animal, true)
    SetBlockingOfNonTemporaryEvents(animal, true)
    SetPedFleeAttributes(animal, 0, false)
    SetPedCombatAttributes(animal, 46, true)
    SetPedCombatAttributes(animal, 1424, true)
    SetPedSeeingRange(animal, 0.0)
    SetPedHearingRange(animal, 0.0)

    -- Stop growth loop if active
    if growthThreads and growthThreads[name] then
        growthThreads[name] = nil
    end

    lib.notify({
        type = 'info',
        description = name .. " has stopped following you 🐄",
        duration = 4000
    })
end)

RegisterNetEvent('panboo-ranching:client:animalFollow')
AddEventHandler('panboo-ranching:client:animalFollow', function(data)
    if not data or not data.entity then return end
    local animal = data.entity
    if not DoesEntityExist(animal) then return end

    local name = Entity(animal).state.animalName
    local playerPed = PlayerPedId()

    ClearPedTasksImmediately(animal)
    Wait(100)
    SetPedFleeAttributes(animal, 0, false)
    SetPedCombatAttributes(animal, 46, true)
    SetPedCombatAttributes(animal, 1424, true)
    SetPedSeeingRange(animal, 0.0)
    SetPedHearingRange(animal, 0.0)
    FreezeEntityPosition(animal, false)
    SetBlockingOfNonTemporaryEvents(animal, true)
    SetEntityInvincible(animal, true)
    SetEntityCanBeDamaged(animal, false)
    TaskFollowToOffsetOfEntity(animal, playerPed, 0.0, 2.0, 0.0, 2.0, -1, 3.0, true)

    -- 🧠 Start growth loop, and save handle
    growthThreads[name] = true

    CreateThread(function()
        local timer = 0
        while DoesEntityExist(animal) and growthThreads[name] and timer < 30 do
            Wait(60000)
            TriggerServerEvent('panboo-ranching:server:updateGrowth', name, Config.GrowthWhenHerding)
            timer += 1
        end
        growthThreads[name] = nil -- clean up
    end)

    lib.notify({
        type = 'info',
        description = "The animal is now following you 🐾",
        duration = 5000
    })
end)

RegisterNetEvent('panboo-ranching:client:startCleanupMission')
AddEventHandler('panboo-ranching:client:startCleanupMission', function(args)
    local ranchId = args.args.ranchid
    if not ranchId then
        lib.notify({
            type = 'error',
            description = "No valid ranch identifier received 🐎",
            duration = 4000
        })
        return
    end

    local poopSpots = Config.PooSpawnPoints[ranchId]
    if not poopSpots or #poopSpots == 0 then
        lib.notify({
            type = 'error',
            description = "No messes registered for this ranch 🚫💩",
            duration = 5000
        })
        return
    end

        -- ✅ Initialize progress and textUI
    cleanupProgress = 0
    lib.showTextUI("Poop Cleaned: 0 / " .. totalPoosRequired)

    -- ✅ Spawn networked poo piles
    for _, loc in pairs(poopSpots) do
        local obj = CreateObject('p_poopile01x', loc.x, loc.y, loc.z, true, true, false) -- networked!
        PlaceObjectOnGroundProperly(obj)
        FreezeEntityPosition(obj, true)
        table.insert(spawnedPoos, obj)

        -- ✅ Delay target registration to ensure entity sync
        CreateThread(function()
            Wait(150)
            exports.ox_target:addLocalEntity(obj, {
                {
                    name  = 'clean_poo',
                    icon  = 'fa-solid fa-shovel',
                    label = 'Clean Up',
                    onSelect = function(data)
                        tryCleanPoo(data.entity)
                    end
                }
            })
        end)
    end

    lib.notify({
        type = 'info',
        description = "Cleanup underway at " .. ranchId:gsub("^%l", string.upper):gsub("([A-Z])", " %1") .. " 🧹",
        duration = 5000
    })
end)

-- Track which poop piles are actively being cleaned
local activeCleanups = {}

function tryCleanPoo(entity)
    -- 🛑 Prevent duplicate cleanup on same pile
    if activeCleanups[entity] then
        lib.notify({
            type = 'error',
            description = "You're already cleaning this pile 💩",
            duration = 3000
        })
        return
    end
    activeCleanups[entity] = true

    local hasFork = exports['rsg-inventory']:HasItem(Config.StableCleanupItem)
    if not hasFork then
        lib.notify({
            type = 'error',
            description = "You need a pitchfork to clean this mess 🪓",
            duration = 5000
        })
        activeCleanups[entity] = nil
        return
    end

    local playerPed = PlayerPedId()

    -- ✅ Play cleaning animation
    ClearPedTasksImmediately(playerPed)
    Wait(100)
    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_FARMER_RAKE", 0, true)
    Wait(10000)
    ClearPedTasksImmediately(playerPed)

    -- 🧹 Remove poop entity
    DeleteEntity(entity)

    -- 🎁 Give item and update progress
    TriggerServerEvent('panboo-ranching:server:givePoop', 1)
    cleanupProgress += 1

    lib.showTextUI("Poop Cleaned: " .. cleanupProgress .. " / " .. totalPoosRequired)

    lib.notify({
        type = 'info',
        description = "Cleaned " .. cleanupProgress .. " out of " .. totalPoosRequired .. " piles 💩",
        duration = 4000
    })

    -- ✅ Completion check
    if cleanupProgress >= totalPoosRequired then
        lib.hideTextUI()

        lib.notify({
            type = 'success',
            description = "All livestock messes cleaned! The ranch looks great 🧼✨",
            duration = 6000
        })

        lib.alertDialog({
            header = "Ranchers’ Thanks",
            content = "You’ve kept the ranch spotless. Might be time for a bonus chore...",
            centered = true,
        })
    end

    -- ✅ Release the interaction lock
    activeCleanups[entity] = nil
end

RegisterNetEvent('panboo-ranching:client:viewStoredAnimals')
AddEventHandler('panboo-ranching:client:viewStoredAnimals', function()
    lib.callback('panboo-ranching:server:getMyAnimals', false, function(results)
        if not results or #results == 0 then
            lib.notify({
                type = 'info',
                description = "You have no animals.",
                duration = 5000
            })
            return
        end

        local animalLabels = {
            ['A_C_Cow']     = 'Cow',
            ['A_C_Sheep_01'] = 'Sheep',
            ['A_C_Chicken_01'] = 'Chicken',
            ['A_C_Pig_01'] = 'Pig'
        }
        local options = {}
        for _, animal in pairs(results) do
            local isStored = animal.stored
            local action   = isStored and 'Spawn' or 'Store'
            local status   = isStored and 'Stored' or 'Out'
            local event    = isStored and 'panboo-ranching:client:spawnAnimal' or 'panboo-ranching:client:storeAnimal'
            local args     = isStored
                and { model = animal.model, name = animal.name, growth = animal.growth }
                or findActiveAnimal(animal.name)

            table.insert(options, {
                title       = animal.name .. " [" .. status .. "] " .. "Growth: " .. animal.growth .. "%",
                description = animalLabels[animal.model] or animal.model,
                icon        = isStored and 'fa-box-open' or 'fa-person-walking',
                event       = event,
                args        = args,
                arrow       = true
            })
        end

        lib.registerContext({ id = 'my_farm_animals', title = 'My Animals', options = options })
        lib.showContext('my_farm_animals')
    end)
end)

-- 📦 Store Active Animal
RegisterNetEvent('panboo-ranching:client:storeAnimal')
AddEventHandler('panboo-ranching:client:storeAnimal', function(data)
    if not data or not data.entity or not data.name then return end
    local found = findActiveAnimal(data.name)
    if not found or not DoesEntityExist(found.entity) then
        lib.notify({
            type = 'error',
            description = "Couldn't locate " .. data.name .. " to store 🐄",
            duration = 5000
        })
        return
    end

    if DoesEntityExist(data.entity) then
        for i = 255, 0, -51 do
            Wait(50)
            SetEntityAlpha(data.entity, i, false)
        end
        DeleteEntity(data.entity)
        growthThreads[data.name] = nil
        TriggerServerEvent('panboo-ranching:server:storeAnimal', data.name)
        lib.notify({
            type = 'info',
            description = "The animal has been taken back in to the barn 🐾",
            duration = 5000
        })
    end
end)

function milkCow(entity)
    local name = Entity(entity).state.animalName
    local growth = Entity(entity).state.animalGrowth or 0
    local now = GetGameTimer()
    local cooldown = Config.CollectionTimer * 60 * 1000 -- 5 minutes
    local lastMilked = lastCollectionTimes[name] or 0

    -- 🧪 Cooldown check
    if (now - lastMilked) < cooldown then
        lib.notify({
            type = 'error',
            description = name .. " has been milked recently. Try again later 🕒",
            duration = 5000
        })
        return
    end

    -- 🧪 Growth check
    if growth < 50 then
        lib.notify({
            type = 'error',
            description = name .. " is not mature enough for milking 🐄",
            duration = 5000
        })
        return
    end

    -- 🧪 Bucket check
    local hasBucket = exports['rsg-inventory']:HasItem(Config.MilkingItemRequired)
    if not hasBucket then
        lib.notify({
            type = 'error',
            description = "You need a bucket to collect milk 🪣",
            duration = 5000
        })
        return
    end

    -- 🧙‍♂️ Play milking animation
    ClearPedTasksImmediately(entity)
    Wait(100)
    FreezeEntityPosition(entity, true)
    TaskStartScenarioInPlace(entity, "WORLD_ANIMAL_COW_GRAZING", 0, true) -- grazing anim for realism

    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_CROUCH_INSPECT", 0, true) -- crouch anim for milking posture

    -- ⏱️ Let animation play for a moment
            lib.progressCircle({
            duration = 10000,
            position = 'bottom',
            useWhileDead = false,
            canCancel = false,
            label = 'Milking Cow...',
        })

    ClearPedTasksImmediately(playerPed)
    FreezeEntityPosition(entity, false)
    local milkQty = math.random(Config.MilkMin, Config.MilkMax)

    TriggerServerEvent('panboo-ranching:server:giveMilk', milkQty)
    lastCollectionTimes[name] = now

    lib.notify({
        type = 'success',
        description = "You milked " .. name .. " and got " .. milkQty .. " bottle(s) of milk! 🥛",
        duration = 5000
    })
end

function collectMushrooms(entity)
    local name = Entity(entity).state.animalName
    local growth = Entity(entity).state.animalGrowth or 0
    local now = GetGameTimer()
    local cooldown = Config.CollectionTimer * 60 * 1000 -- 5 minutes
    local lastCollectedMushrooms = lastCollectionTimes[name] or 0 -- reuse table for simplicity

    -- 🧪 Cooldown check
    if (now - lastCollectedMushrooms) < cooldown then
        lib.notify({
            type = 'error',
            description = name .. " hasn't found any mushrooms yet. Try again later. 🍄",
            duration = 5000
        })
        return
    end

    -- 🧪 Growth check
    if growth < 50 then
        lib.notify({
            type = 'error',
            description = name .. " isn't old enough to dig up mushrooms! 🍄",
            duration = 5000
        })
        return
    end

    -- 🧙‍♂️ Play shearing animation
    ClearPedTasksImmediately(entity)
    Wait(100)
    FreezeEntityPosition(entity, true)
    TaskStartScenarioInPlace(entity, "WORLD_ANIMAL_DEER_GRAZING", 0, true) -- grazing anim for realism

    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_CROUCH_INSPECT", 0, true) -- crouch anim for shearing posture

    -- ⏱️ Let animation play for a moment
    lib.progressCircle({
        duration = 10000,
        position = 'bottom',
        useWhileDead = false,
        canCancel = false,
        label = 'Digging up mushrooms...',
    })
    ClearPedTasksImmediately(entity)
    ClearPedTasksImmediately(playerPed)
    FreezeEntityPosition(entity, false)

    TriggerServerEvent('panboo-ranching:server:giveMushrooms', math.random(Config.MushroomMin, Config.MushroomMax))
    lastCollectionTimes[name] = now -- reuse cooldown tracking

    lib.notify({
        type = 'success',
        description = name .. " found " .. mushroomQty .. " mushrooms buried in the dirt! 🍄",
        duration = 5000
    })
end

function shearSheep(entity)
    local name = Entity(entity).state.animalName
    local growth = Entity(entity).state.animalGrowth or 0
    local now = GetGameTimer()
    local cooldown = Config.CollectionTimer * 60 * 1000
    local lastSheared = lastCollectionTimes[name] or 0

    -- 🧪 Cooldown check
    if (now - lastSheared) < cooldown then
        lib.notify({
            type = 'error',
            description = name .. " was sheared recently. Try again later ✂️",
            duration = 5000
        })
        return
    end

    -- 🧪 Growth check
    if growth < 50 then
        lib.notify({
            type = 'error',
            description = name .. " doesn't have enough wool yet 🐑",
            duration = 5000
        })
        return
    end

    -- ✂️ Shears check
    local hasShears = exports['rsg-inventory']:HasItem(Config.SheerSheepItem)
    if not hasShears then
        lib.notify({
            type = 'error',
            description = "You need shears to collect wool ✂️",
            duration = 5000
        })
        return
    end

    -- 🧙‍♂️ Play shearing animation
    ClearPedTasksImmediately(entity)
    Wait(100)
    FreezeEntityPosition(entity, true)
    TaskStartScenarioInPlace(entity, "WORLD_ANIMAL_DEER_GRAZING", 0, true) -- grazing anim for realism

    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_CROUCH_INSPECT", 0, true) -- crouch anim for shearing posture

        lib.progressCircle({
            duration = 10000,
            position = 'bottom',
            useWhileDead = false,
            canCancel = false,
            label = 'Shearing Sheep...',
        })

    ClearPedTasksImmediately(playerPed)
    FreezeEntityPosition(entity, false)

    TriggerServerEvent('panboo-ranching:server:giveWool', math.random(Config.WoolMin, Config.WoolMax))
    lastCollectionTimes[name] = now

    lib.notify({
        type = 'success',
        description = "You sheared " .. name .. " and got " .. woolQty .. " bundle(s) of wool! 🧶",
        duration = 5000
    })
end

function collectEggs(entity)
    local name = Entity(entity).state.animalName
    local growth = Entity(entity).state.animalGrowth or 0
    local now = GetGameTimer()
    local cooldown = Config.CollectionTimer * 60 * 1000
    local lastCollected = lastCollectionTimes[name] or 0

    -- 🧪 Cooldown check
    if (now - lastCollected) < cooldown then
        lib.notify({
            type = 'error',
            description = name .. " laid eggs recently. Try again later 🕒",
            duration = 5000
        })
        return
    end

    -- 🧪 Growth check
    if growth < 50 then
        lib.notify({
            type = 'error',
            description = name .. " isn't mature enough to lay eggs 🐣",
            duration = 5000
        })
        return
    end

    -- 🧺 Basket check
    local hasBasket = exports['rsg-inventory']:HasItem(Config.EggCollectionItem)
    if not hasBasket then
        lib.notify({
            type = 'error',
            description = "You need a basket to collect eggs 🧺",
            duration = 5000
        })
        return
    end

    -- 🧙‍♂️ Play egg collection animation
    ClearPedTasksImmediately(entity)
    Wait(100)
    FreezeEntityPosition(entity, true)
    TaskStartScenarioInPlace(entity, "WORLD_ANIMAL_CHICKEN_EATING", 0, true)

    local playerPed = PlayerPedId()
    TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_CROUCH_INSPECT", 0, true)

    lib.progressCircle({
        duration = 10000,
        position = 'bottom',
        useWhileDead = false,
        canCancel = false,
        label = 'Collecting Eggs...',
    })

    ClearPedTasksImmediately(playerPed)
    FreezeEntityPosition(entity, false)

    TriggerServerEvent('panboo-ranching:server:giveEggs', math.random(Config.EggMin, Config.EggMax))
    lastCollectionTimes[name] = now

    lib.notify({
        type = 'success',
        description = "You collected " .. eggQty .. " egg(s) from " .. name .. "! 🥚",
        duration = 5000
    })
end

RegisterNetEvent('panboo-ranching:client:startGrainDeliveryMission')
AddEventHandler('panboo-ranching:client:startGrainDeliveryMission', function(args)
    TriggerServerEvent('panboo-ranching:server:checkGrainCooldown', args.args.ranchid)
    CachedGrainMissionArgs = args
end)

RegisterNetEvent('panboo-ranching:client:grainCooldownDenied')
AddEventHandler('panboo-ranching:client:grainCooldownDenied', function(remaining)
    lib.notify({
        type = 'error',
        description = "This ranch's grain delivery is on cooldown. Try again in " .. remaining .. " seconds ⏳"
    })
end)

RegisterNetEvent('panboo-ranching:client:grainCooldownApproved')
AddEventHandler('panboo-ranching:client:grainCooldownApproved', function()
    if CachedGrainMissionArgs then
        StartGrainDeliveryMission(CachedGrainMissionArgs)
    end
end)

function StartGrainDeliveryMission(args)
    local ranchId = args.args.ranchid
    local grainPickupLocation = args.args.grainPickupLocation
    local grainDropOffCoords = args.args.grainDropOffCoords
    local wagonModel = args.args.wagonModel
    local barrelModel = args.args.barrelModel
    local barrelCount = args.args.barrelCount
    local grainStartCoords = args.args.grainStartCoords

    local pileModel = barrelModel
    local playerPed = PlayerPedId()
    local coords = GetEntityCoords(playerPed)

    if not ranchId then
        lib.notify({ type = 'error', description = "No valid ranch identifier received 🌾" })
        return
    end

    -- 🚚 Spawn wagon
    lib.requestModel(wagonModel)
    local wagon = CreateVehicle(wagonModel, grainStartCoords.x, grainStartCoords.y, grainStartCoords.z, 0.0, true, false)
    SetVehicleOnGroundProperly(wagon)
    TaskWarpPedIntoVehicle(playerPed, wagon, -1)

    -- 🧭 GPS to pickup
    BlipAPI:SetBlip("Grain Pickup Location", -902701436, 1.0, grainPickupLocation.x, grainPickupLocation.y, grainPickupLocation.z, grainPickupLocation)
    MapAPI.StartGps(coords, grainPickupLocation)
    lib.notify({ type = 'inform', description = "Take the wagon to the grain pickup location" })

    local barrelsCollected = 0

    -- 🌾 Spawn grain pile
    lib.requestModel(barrelModel)
    local grainPile = CreateObject(barrelModel, grainPickupLocation.x, grainPickupLocation.y, grainPickupLocation.z - 1, true, true, false)
    SetEntityHeading(grainPile, 0)
    PlaceObjectOnGroundProperly(grainPile)
    FreezeEntityPosition(grainPile, true)

    local grainZone = exports.ox_target:addBoxZone({
        coords = grainPickupLocation,
        size = vec3(4.0, 4.0, 4.0),
        rotation = 0.0,
        debug = false,
        options = {
            {
                name = 'pickup_grain_mission',
                icon = 'fa-solid fa-box',
                label = 'Pick Up Grain Barrel',
                onSelect = function()
                    if carryingGrain then
                        lib.notify({ description = "You're already carrying a barrel!", type = 'error' })
                        return
                    end

                    lib.requestModel(barrelModel, 10000)
                    grainProp = CreateObject(barrelModel, 0, 0, 0, true, true, false)
                    AttachEntityToEntity(grainProp, playerPed, GetPedBoneIndex(playerPed, 57005), 0.1, 0.45, -0.05, 0.2, 0.0, 90.0, false, false, false, false, 2, true)

                    local animDict = "mech_loco_m@character@arthur@carry@crate_tnt@idle"
                    LoadAnimationDic(animDict)
                    TaskPlayAnim(playerPed, animDict, "idle", 1.0, 1.0, -1, 25, 0.0, false, false, false)
                    RemoveAnimDict(animDict)

                    carryingGrain = true
                    lib.notify({ description = "You picked up a grain barrel 🧺", type = 'success' })
                end
            }
        }
    })

    -- 🎯 Target: Load Grain into Wagon
    exports.ox_target:addLocalEntity(wagon, {
        {
            name = 'load_grain_wagon',
            icon = 'fa-solid fa-truck-loading',
            label = 'Load Grain into Wagon',
            distance = 3.0,
            canInteract = function()
                return carryingGrain
            end,
            onSelect = function()
                barrelsCollected += 1
                ClearPedTasksImmediately(playerPed)
                DeleteEntity(grainProp)
                grainProp = nil
                carryingGrain = false

                lib.notify({ description = "Grain loaded into wagon! (" .. barrelsCollected .. "/" .. barrelCount .. ")", type = 'success' })

                if barrelsCollected >= barrelCount then
                    DeleteEntity(grainPile)
                    if grainZone then
                        exports.ox_target:removeZone('pickup_grain_mission', true)
                        grainZone = nil
                    end
                    TriggerServerEvent('panboo-ranching:server:triggerBanditAmbush', grainPickupLocation)
                    BlipAPI:SetBlip("Grain Delivery Location", -902701436, 1.0, grainDropOffCoords.x, grainDropOffCoords.y, grainDropOffCoords.z, grainDropOffCoords)
                    MapAPI.StartGps(coords, grainDropOffCoords)
                    lib.notify({ description = "The wagon is fully loaded. Deliver and unload it at your ranch drop-off point!", type = 'success' })
                end
            end
        }
    })

    -- 🎯 Target: Unload Grain at Drop-Off
exports.ox_target:addLocalEntity(wagon, {
    {
        name = 'unload_grain',
        icon = 'fa-solid fa-box-open',
        label = 'Unload Grain Barrels',
        distance = 3.0,
        canInteract = function()
            return barrelsCollected > 0 and not carryingGrain and #(GetEntityCoords(playerPed) - grainDropOffCoords) < 50.0
        end,
        onSelect = function()
                DeleteVehicle(wagon)
                MapAPI.StopGps()
                exports.ox_target:removeEntity(wagon, 'unload_grain')
                lib.notify({ description = "Delivery complete!", type = 'success' })
                -- 🎁 Trigger server reward
                TriggerServerEvent('panboo-ranching:server:completeGrainDelivery')
        end
    }
})
end

RegisterNetEvent('panboo-ranching:client:spawnBandits', function(coords)
    TriggerEvent('ox_lib:notify', {
        title = 'Ambush!',
        description = 'Bandits are attacking your wagon!',
        type = 'error'
    })

    Wait(5000)
    local spawned = 0
    local maxBandits = math.random(2, 4)
    while spawned < maxBandits do
        local model = Config.BanditModels[math.random(#Config.BanditModels)]
        RequestModel(model)
        while not HasModelLoaded(model) do Wait(10) end

        local spawnX = coords.x + math.random(-20, 20)
        local spawnY = coords.y + math.random(-20, 20)
        local spawnZ = coords.z

        local bandit = CreatePed(model, spawnX, spawnY, spawnZ, 0.0, true, false)
        SetRandomOutfitVariation(bandit, true)
        GiveWeaponToPed(bandit, `WEAPON_REVOLVER_CATTLEMAN`, 100, true, true)
        TaskCombatPed(bandit, PlayerPedId(), 0, 16)
        spawned += 1
        Wait(200)
    end
end)


AddEventHandler("onResourceStop", function(resource)
    if GetCurrentResourceName() ~= resource then return end
    for _, point in pairs(spawnedPeds) do
        exports.ox_target:removeEntity(point.ped, 'npc_manage_animals')
        exports.ox_target:removeEntity(point.ped, 'npc_buy_animals')
        exports.ox_target:removeEntity(point.ped, 'npc_ranch_boss')
        exports.ox_target:removeEntity(point.ped, 'npc_ranch_storage')
        exports.ox_target:removeEntity(point.ped, 'npc_ranch_shop')
        exports.ox_target:removeEntity(point.ped, 'npc_butcher_mission')
        exports.ox_target:removeEntity(point.ped, 'npc_retrieve_animals')
        exports.ox_target:removeEntity(point.ped, 'npc_clean_ranch')
        exports.ox_target:removeEntity(point.ped, 'npc_hay_mission')
        exports.ox_target:removeEntity(point.ped, 'npc_force_store_animal')
        if point.ped then DeleteEntity(point.ped) end
    end
end)