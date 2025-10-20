RSGCore = exports['rsg-core']:GetCoreObject()
local missionVehicle = nil
local hasPlacedDynamite = false
local isMissionStarted = false
local WarningDisplayed
local showTextUIFoot
local stage1 = false
local spawned = false
local Blips = {}
local Peds = {}
local SpawnedLoot = {}
local riderNPC = {}
local horses = {}

function ToggleControls(toggle, keepCamera)
    if keepCamera == nil then keepCamera = true end
    local playerId = PlayerId()
    if toggle then
        if keepCamera then
            Citizen.InvokeNative(0x4D51E59243281D80, playerId, true, 256, false) -- SetPlayerControl
        else
            Citizen.InvokeNative(0x4D51E59243281D80, playerId, true, 0, false) -- SetPlayerControl
        end
    else
        if keepCamera then
            Citizen.InvokeNative(0x4D51E59243281D80, playerId, false, 256, false) -- SetPlayerControl
        else
            Citizen.InvokeNative(0x4D51E59243281D80, playerId, false, 0, false) -- SetPlayerControl
        end
    end
end

RegisterNetEvent('stagecoachrobberies:client:startMission', function()
    if isMissionStarted then 
        lib.notify({
            title = 'Stagecoach Transport',
            description = 'The stagecoach is already on its way!',
            type = 'info'
        })
        return
    end

    RSGCore.Functions.GetPlayerData(function(PlayerData)
        local ped = PlayerPedId()
        local letter = nil -- Reference for the note

        ToggleControls(false, true)

        if PlayerData.job and PlayerData.job.type == "leo" then
            TriggerEvent('InteractSound_CL:PlayOnOne', 'mama-workorder-lawmen', 0.1)

            if lib.progressBar({
                duration = 40000,
                label = 'Reading Letter',
                useWhileDead = false,
                canCancel = true,
                anim = {
                    dict = 'mech_inspection@letter@base',
                    clip = 'hold'
                },
                prop = {
                    bone = GetEntityBoneIndexByName(ped, 'skel_r_hand'),
                    model = `s_mollyloveletter`,
                    pos = vec3(0.16, 0.1, -0.11),
                    rot = vec3(0.0, -116.0, -35.0)
                },
            }) then
                TriggerServerEvent('stagecoachrobberies:server:RemoveItem')
            else
                -- Handle cancellation
                if DoesEntityExist(letter) then
                    DeleteEntity(letter)
                end
            end

            ToggleControls(true, true)
            ClearPedTasks(ped)
            return
        end

        -- Civilian path
        SetCurrentPedWeapon(ped, GetHashKey('WEAPON_UNARMED'), true)
        TriggerEvent('InteractSound_CL:PlayOnOne', 'mama-workorder-stagecoach', 0.1)

        local model = `s_mollyloveletter`
        local boneIndex = GetEntityBoneIndexByName(ped, 'skel_r_hand')
        RequestModel(model)
        while not HasModelLoaded(model) do
            Wait(0)
        end

        letter = CreateObject(model, 0, 0, 0, true, true, false)
        AttachEntityToEntity(letter, ped, boneIndex, 0.13, 0.07, -0.11, -57.0, -99.0, 0.0, true, true, false, true, 1, true)

        if lib.progressBar({
            duration = 26000,
            label = 'Reading Letter',
            useWhileDead = false,
            canCancel = true,
            anim = {
                dict = 'mech_inspection@letter@base',
                clip = 'hold'
            },
        }) then 
            local alert = lib.alertDialog({
                header = 'Mission',
                content = 'Are you sure you want to continue?',
                centered = true,
                cancel = true
            })

            if alert == 'confirm' then
                TriggerServerEvent("stagecoachrobberies:server:CheckMission")
                PlaySoundFrontend("Witness_Wanted", "HUD_Wanted_Sounds", true, 0)
            else
                print("You have declined the mission!")
            end
        else 
            print('Do stuff when cancelled')
        end

        ToggleControls(true, true)
        ClearPedTasks(ped)

        -- Delete the letter object if it exists
        if DoesEntityExist(letter) then
            DeleteEntity(letter)
        end
    end)
end)

local CleanupBankTransportMission = function()
    if missionVehicle then DeleteVehicle(missionVehicle) missionVehicle = nil end
    if CoachDriver1 then DeleteEntity(CoachDriver1) CoachDriver1 = nil end
    if CoachDriver2 then DeleteEntity(CoachDriver2) CoachDriver2 = nil end
    if CoachPassenger1 then DeleteEntity(CoachPassenger1) CoachPassenger1 = nil end
    if CoachPassenger2 then DeleteEntity(CoachPassenger2) CoachPassenger2 = nil end
    if CoachPassenger3 then DeleteEntity(CoachPassenger3) CoachPassenger3 = nil end
    isMissionStarted = false
    hasPlacedDynamite = false
    WarningDisplayed = false
    reachedEndPoint = false
    showTextUIFoot = false
    stage1 = false
    spawned = false
    planting = false
    for k, v in pairs(Blips) do
        RemoveBlip(v)
    end
    for k, v in pairs(Peds) do
        DeleteEntity(v)
    end
end

local SpawnPedsAndWagon = function(selectedRoute)
    -- Load models
    local deputyModel = "s_m_m_valdeputy_01"
    RequestModel(deputyModel)
    while not HasModelLoaded(GetHashKey(deputyModel)) do
        Citizen.Wait(0)
    end

    RequestModel(selectedRoute.wagonModel)
    while not HasModelLoaded(GetHashKey(selectedRoute.wagonModel)) do
        Citizen.Wait(0)
    end

    -- Create the wagon
    local wagonCoords = vector3(selectedRoute.locations.startpoint.x, selectedRoute.locations.startpoint.y, selectedRoute.locations.startpoint.z)
    local wagonHeading = selectedRoute.locations.startpointHeading
    missionVehicle = CreateVehicle(GetHashKey(selectedRoute.wagonModel), wagonCoords.x, wagonCoords.y, wagonCoords.z, wagonHeading, true, false)
    SetEntityAsMissionEntity(missionVehicle, true, true)

    Wait(1000)

    local function createPed(model, coords, heading)
        local ped = CreatePed(GetHashKey(model), coords.x, coords.y, coords.z, heading, true, true)
        Citizen.InvokeNative(0x283978A15512B2FE, ped, true) -- Set ped outfit
        TaskCombatPed(ped, PlayerPedId(), 0, 16) -- Ped combat
        SetPedAccuracy(ped, Config.MissionSettings.WagonGuards.SetPedAccuracy) -- Set accuracy
        SetPedCombatMovement(ped, Config.MissionSettings.WagonGuards.SetPedCombatMovement) -- Set combat movement
        SetEntityHealth(ped, Config.MissionSettings.WagonGuards.SetEntityHealth) -- Set health
        Citizen.InvokeNative(0x7146CF430965927C, 25, ped, 0) -- Disable headshots
        GiveWeaponToPed_2(ped, 0x31B7B9FE, 500, true, 1, false, 0.0) -- Give weapon
        SetPedCombatAttributes(ped, 46, true)
        SetPedCombatAbility(ped, 2)
        SetPedCombatRange(ped, 2)
        SetPedKeepTask(ped, true)
        return ped
    end

    -- Create peds
    local peds = {}
    for i = 1, 6 do
        local ped = createPed(deputyModel, wagonCoords, selectedRoute.locations.startpointHeading)
        table.insert(peds, ped)
    end

    -- Set the first ped into the driver's seat (-1) and others in the subsequent seats
    SetPedIntoVehicle(peds[1], missionVehicle, -1)
    for i = 2, #peds do
        SetPedIntoVehicle(peds[i], missionVehicle, i - 2)
    end

    -- Set relationship groups
    AddRelationshipGroup('NPC')
    AddRelationshipGroup('PlayerPed')
    for _, ped in ipairs(peds) do
        SetPedRelationshipGroupHash(ped, 'NPC')
    end

    -- Task vehicle to drive to the end point
    local endPointCoords = vector3(selectedRoute.locations.endpoint.x, selectedRoute.locations.endpoint.y, selectedRoute.locations.endpoint.z)
    TaskVehicleDriveToCoord(peds[1], missionVehicle, endPointCoords.x, endPointCoords.y, endPointCoords.z, 6.0, 0, GetEntityModel(missionVehicle), 16777216, 1.0, true)
    local reachedEndPoint = false

    -- Monitor vehicle's journey and handle mission completion
    Citizen.CreateThread(function()
        local startTime = GetGameTimer()
        local endTime = startTime + (60 * 60 * 1000) -- 60 minutes in milliseconds

        while not reachedEndPoint and GetGameTimer() < endTime do
            local vehicleCoords = GetEntityCoords(missionVehicle)
            local distanceToEndpoint = #(vehicleCoords - endPointCoords)

            if distanceToEndpoint < 10.0 then
                DeleteEntity(missionVehicle)
                for _, ped in ipairs(peds) do
                    DeleteEntity(ped)
                end
                reachedEndPoint = true
                isMissionStarted = false
                break
            end

            Wait(1)
        end
    end)
end

local GetPlayers = function()
    local players = {}
    for _, player in ipairs(GetActivePlayers()) do
        table.insert(players, player)
    end
    return players
end

local SpawnAttackRiders = function()
    local randomTime = math.random(60000, 120000)
    Wait(randomTime)

    local randomAmount = math.random(Config.MissionSettings.AttackRiders.RiderAmount.min, Config.MissionSettings.AttackRiders.RiderAmount.max)
    local playerPed = PlayerPedId()
    local horseModel = "p_c_horse_01"
    local pedModel = "s_m_m_valdeputy_01"
    
    RequestModel(horseModel)
    RequestModel(pedModel)
    while not HasModelLoaded(horseModel) or not HasModelLoaded(pedModel) do
        Citizen.Wait(500)
    end
    
    local coords = GetEntityCoords(playerPed)
    local heading = GetEntityHeading(playerPed)
      
    for i = 1, randomAmount do
        local r1 = math.random(35, 65)
        local r = -heading * (math.pi / 180)
        local spawnPos = vector3(coords.x - (r1 * math.sin(r)), coords.y - (r1 * math.cos(r)), coords.z)
        
        local horse = CreatePed(horseModel, spawnPos.x, spawnPos.y, spawnPos.z, heading, true, true, false, false)
        SetModelAsNoLongerNeeded(horseModel)
        Citizen.InvokeNative(0x283978A15512B2FE, horse, true)
        SetPedConfigFlag(horse, 297, true) -- Leading
        SetPedConfigFlag(horse, 312, true) -- No flee when shooting
        
        local rider = CreatePedOnMount(horse, pedModel, -1, true, true, false, false)
        Citizen.InvokeNative(0x283978A15512B2FE, rider, true)
        Citizen.InvokeNative(0x7146CF430965927C, 25, true)
        SetModelAsNoLongerNeeded(pedModel)
        
        SetPedAccuracy(rider, Config.MissionSettings.AttackRiders.SetPedAccuracy)
        SetEntityHealth(rider, Config.MissionSettings.AttackRiders.SetEntityHealth)

        local weapons = {
            'weapon_revolver_schofield',
            'weapon_repeater_winchester',
            'weapon_sniperrifle_rollingblock',
        }
        local selectedWeapon = weapons[math.random(#weapons)]
        GiveWeaponToPed_2(rider, selectedWeapon, 500, true, 1, false, 0.0)
        
        SetPedCombatMovement(rider, 3)
        TaskCombatPed(rider, playerPed, 0, 16)

        table.insert(riderNPC, rider)
        table.insert(horses, horse)
    end
end


--- BANK TRANSPORT MISSION REWARDS
local StartBankTransportMission = function(selectedRoute)
    isMissionStarted = true
    local Blip = N_0x554d9d53f696d002(1664425300, selectedRoute.locationForBlip.x, selectedRoute.locationForBlip.y, selectedRoute.locationForBlip.z) -- Creates a blip at the specified location
    SetBlipSprite(Blip, 778811758)
    SetBlipScale(Blip, 1)
    table.insert(Blips, Blip)

    Citizen.InvokeNative(0x9CB1A1623062F402, Blip, "Location of Wagon Transport", true) -- Sets the name of the blip
    Citizen.InvokeNative(0x662D364ABF16DE2F, Blip, `BLIP_MODIFIER_PULSE_FOREVER`) -- Causes blip to pulse
    stage1 = true

    lib.notify({
        title = 'Stagecoach Transport',
        description = 'The stagecoach is en route consult the map for its current location!',
        type = 'success',
        timeout = 5000
    })

    while stage1 do
        Wait(1)
        local playerPed = PlayerPedId()
        local coords = GetEntityCoords(playerPed)
        local dist = #(coords - vector3(selectedRoute.locationForBlip.x, selectedRoute.locationForBlip.y, selectedRoute.locationForBlip.z))

        if dist < 125 and not spawned then
        spawned = true
        RemoveBlip(Blip)
        SpawnPedsAndWagon(selectedRoute)
    
        lib.notify({
            title = 'Stagecoach Transport',
            description = 'The stagecoach is near! Get ready to intercept it!',
            type = 'inform',
            position = 'top' -- Change to 'center' or 'bottom' if you prefer
        })

    break
end

    end

    Citizen.CreateThread(function()
        while true do
            Wait(0)
    
            if isMissionStarted and missionVehicle then
                local missionVehiclePosition = GetEntityCoords(missionVehicle)
                local missionVehicleSpeed = GetEntitySpeed(missionVehicle)
                local players = GetPlayers()
    
                for _, player in ipairs(players) do
                    local playerPed = GetPlayerPed(player)
                    local playerCoords = GetEntityCoords(playerPed)
                    local distance = #(missionVehiclePosition - playerCoords)
    
                    if distance < 5.0 and not hasPlacedDynamite and not WarningDisplayed and not AlertShown then
                        if IsPedOnMount(playerPed) then
                            WarningDisplayed = true
                            AlertShown = true -- Mark the alert as shown
                            TriggerServerEvent('stagecoachrobberies:server:PlayerJobCheck')
                        end
                    end
    
                    if distance < 3.0 and not hasPlacedDynamite and missionVehicleSpeed == 0 then
                        if IsPedOnFoot(playerPed) then

                            showTextUIFoot = true -- Ensure it's set to true
                            lib.showTextUI('[G] - Place Dynamite', {
                                position = "top-center",
                                icon = 'hand',
                            })

                            if IsControlJustReleased(0, 0x760A9C6F) then
                                if exports['rsg-inventory']:HasItem(Config.DynamiteItem, 1) == false then
                                    lib.notify({
                                        title = 'Stagecoach Transport',
                                        description = 'You don\'t have any dynamite!',
                                        type = 'error'
                                    })
                                else
                                    ToggleControls(false, true)
                                    lib.hideTextUI()
                                    hasPlacedDynamite = true
                                    isMissionStarted = false
                                    local playerPed = PlayerPedId()
    
                                    local targetcoords = GetEntityCoords(playerPed)
                                    local data = { targetcoords = targetcoords }
    
    
                                    local DynamiteCoords = GetEntityCoords(playerPed)
                                    local forwardVector = GetEntityForwardVector(playerPed)
                                    local adjustedDynamiteCoords = vector3(DynamiteCoords.x + forwardVector.x * 0.3, DynamiteCoords.y + forwardVector.y * 0.3, DynamiteCoords.z + -0.3)
    
                                    RequestModel('p_dynamite01x')
                                    while not HasModelLoaded('p_dynamite01x') do
                                        Wait(0)
                                    end
    
                                    DynamiteObj = CreateObject('p_dynamite01x', adjustedDynamiteCoords.x, adjustedDynamiteCoords.y, adjustedDynamiteCoords.z, true, true, true)
                                    Citizen.InvokeNative(0xA10DB07FC234DD12, "des_mob3")
                                    FreezeEntityPosition(DynamiteObj, true)
                                    
                                    if lib.progressBar({
                                        duration = 50000,
                                        label = 'Lighting Dynamite',
                                        useWhileDead = false,
                                        canCancel = false,
                                        anim = {
                                            dict = "script_story@mud5@ig@ig_5_plant_dynamite",
                                            clip = 'ig5_plant_light_front_arthur'
                                        }
                                        }) then
                                        ToggleControls(true, true)
                                        particleFx = StartParticleFxLoopedAtCoord("ent_ray_mob3_trolley_sparks", adjustedDynamiteCoords.x, adjustedDynamiteCoords.y, adjustedDynamiteCoords.z, 0.0, 0.0, 0.0, 0.2, false, false, false, true)
                                        Wait(10000)
                                        StopParticleFxLooped(particleFx, true)
                                        TriggerServerEvent('stagecoachrobberies:server:PlantDynamite', data)

                                        -- 🔥 ALERT LAW & CRIMINAL SYSTEM
                                        local coords = GetEntityCoords(PlayerPedId())
                                        TriggerServerEvent('rsg-lawman:server:lawmanAlert', "A bank delivery stagecoach is being robbed!", coords)
                                        TriggerServerEvent('rsg-tips:server:addCriminalActivity', "Bank Delivery Stagecoach being robbed", nil, coords)

                                        Citizen.InvokeNative(0x7D6F58F69DA92530, adjustedDynamiteCoords, 0, 1000.0, true, false, true)
                                        break
                                    end

                                end
                            end
                        end
                    else
                        if showTextUIFoot then
                            lib.hideTextUI()
                            showTextUIFoot = false
                        end
                    end
                end
            end
        end
    end)    
end

RegisterNetEvent('stagecoachrobberies:client:removeLootItem', function(lootId)
    local obj = SpawnedLoot[lootId]
    if obj and DoesEntityExist(obj) then
        DeleteEntity(obj)
        SpawnedLoot[lootId] = nil
    end
end)

--- EVENT HANDLERS
RegisterNetEvent('stagecoachrobberies:client:startBankTransportMission', function(selectedRoute)
    StartBankTransportMission(selectedRoute)
end)

RegisterNetEvent('stagecoachrobberies:client:spawnLootObjects', function(spawnList)
    for _, loot in ipairs(spawnList) do
        local rewardConfig = Config.RewardsItem[loot.itemType]
        if not rewardConfig then
            goto continue
        end

        local modelName = rewardConfig.ObjectModel
        local modelHash = GetHashKey(modelName)

        if not IsModelValid(modelHash) then
            goto continue
        end


        RequestModel(modelHash)
        while not HasModelLoaded(modelHash) do
            Wait(10)
        end

        local obj = CreateObject(modelHash, loot.coords.x, loot.coords.y, loot.coords.z, true, true, false)
        PlaceObjectOnGroundProperly(obj)
        FreezeEntityPosition(obj, true)

        SpawnedLoot[loot.id] = obj

        exports['ox_target']:addLocalEntity(obj, {
            label = 'Pick Up ' .. loot.itemType,
            icon = 'fas fa-box',
            onSelect = function()
                ToggleControls(false, true)
                local playerPed = PlayerPedId()
                local animDict = "amb_misc@world_human_concertina_pickup@male_a@base"
                local animName = "base"
        
                RequestAnimDict(animDict)
                while not HasAnimDictLoaded(animDict) do
                    Wait(0)
                end
        
                -- Play the animation
                TaskPlayAnim(playerPed, animDict, animName, 8.0, -8.0, -1, 1, 0, false, false, false)
                Wait(1000)
                ClearPedTasks(playerPed)
                TriggerServerEvent('stagecoachrobberies:server:pickupLootItem', loot.id, loot.itemType)
                ToggleControls(true, true)
            end
        })
        
        ::continue::
    end
end)

RegisterNetEvent('stagecoachrobberies:client:SpawnObjects', function(data)
    local vehicleCoords = data.targetcoords
    Wait(1000)
    local lootData = {}

    for _, itemType in ipairs({"dirtymoneybag", "goldbar"}) do
        local minItems = Config.RewardsItem[itemType].min
        local maxItems = Config.RewardsItem[itemType].max
        local numItems = math.random(minItems, maxItems)
        lootData[itemType] = {}

        for i = 1, numItems do
            local lootRadius = math.random(5, 10)
            local randomX = math.random(-lootRadius, lootRadius)
            local randomY = math.random(-lootRadius, lootRadius)
            local lootPos = vector3(vehicleCoords.x + randomX, vehicleCoords.y + randomY, vehicleCoords.z)
            table.insert(lootData[itemType], lootPos)
        end
    end

    TriggerServerEvent('stagecoachrobberies:server:SpawnItemsOnGroundBatch', lootData)
    SpawnAttackRiders()
    Citizen.Wait(120000)
    CleanupBankTransportMission()
end)

RegisterNetEvent('stagecoachrobberies:client:PlayPedResponse', function(responseCategory, responseType)
    local pedReplies = Config.PedReplies[responseCategory]
    if pedReplies then
        if responseCategory == "LAWMEN" then
            TriggerEvent('InteractSound_CL:PlayOnOne', 'stagecoachrobbery-escsort', 0.4)
            
        elseif responseCategory == "ALERT" then
            TriggerEvent('InteractSound_CL:PlayOnOne', 'stagecoachrobbery-stayback', 0.4)
        end
    end
end)

AddEventHandler("onResourceStop", function(resourceName)
    if GetCurrentResourceName() == resourceName then
        CleanupBankTransportMission()
    end
    for k, v in pairs(riderNPC) do
        DeleteEntity(v)
    end
    for k, v in pairs(horses) do
        DeleteEntity(v)
    end
    for _, obj in pairs(SpawnedLoot) do
        if DoesEntityExist(obj) then DeleteEntity(obj) end
    end
    SpawnedLoot = {}
end)

local pedModel = `a_m_m_farmer_01` -- Change this ped model to whichever you want
local pedCoords = vector3(-5205.64, -3488.08, -21.7) -- Change to your desired spawn coords
local pedHeading = 180.0

local missionStarted = false

local function spawnPed()
    RequestModel(pedModel)
    while not HasModelLoaded(pedModel) do
        Wait(100)
    end

    local ped = CreatePed(pedModel, pedCoords.x, pedCoords.y, pedCoords.z, pedHeading, false, false, false, false)
    SetEntityInvincible(ped, true)
    FreezeEntityPosition(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)

    exports.ox_target:addLocalEntity(ped, {
        {
            name = 'start_mission',
            icon = 'fa-solid fa-flag-checkered',
            label = 'Start Mission',
            onSelect = function(entity)
                if not missionStarted then
                    missionStarted = true
                    -- Trigger your client event here
                    TriggerEvent('stagecoachrobberies:client:startMission')
                else
                    TriggerEvent('chat:addMessage', {
                        color = {255, 0, 0},
                        multiline = true,
                        args = {"Mission", "You already started the mission!"}
                    })
                end
            end,
            canInteract = function(entity)
                return true
            end,
        }
    })
end

CreateThread(function()
    spawnPed()
end)
