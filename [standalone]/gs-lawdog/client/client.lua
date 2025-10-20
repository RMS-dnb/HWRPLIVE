local RSGCore = exports['rsg-core']:GetCoreObject()

local holdingPeds = {}
local dog = nil
local IsUsingDog, PedPrompt = false, nil
local attackPrompt, sniffPrompt = nil, nil
local DogPrompts = {}
local IsCarryingDog = false
local HasAttacked = false
local Sniffing = false


local function PlayAnim(dict, clip, duration)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do Wait(0) end
    TaskPlayAnim(PlayerPedId(), dict, clip, 8.0, 8.0, duration or -1, 24, 0, false, false, false)
end

WhistleAnim = function()
    PlayAnim('mech_loco@player@zero@generic@base', 'whistle_lh', 1800)
end

SetupPrompts = function()
    local group = 0
    local function createPrompt(control, label)
        local prompt = PromptRegisterBegin()
        PromptSetControlAction(prompt, control)
        PromptSetText(prompt, CreateVarString(10, "LITERAL_STRING", label))
        PromptSetEnabled(prompt, true)
        PromptSetVisible(prompt, true)
        PromptSetStandardMode(prompt, 1)
        PromptSetGroup(prompt, group)
        PromptRegisterEnd(prompt)
        return prompt
    end

    DogPrompts = {
        stay     = createPrompt(Config.ControlKeys.Sit.key, Config.ControlKeys.Sit.label),
        sniff    = createPrompt(Config.ControlKeys.FindScent.key, Config.ControlKeys.FindScent.label),
        callback = createPrompt(Config.ControlKeys.CallBack.key, Config.ControlKeys.CallBack.label),
        carry    = createPrompt(Config.ControlKeys.Carry.key, Config.ControlKeys.Carry.label),
        follow   = createPrompt(Config.ControlKeys.Follow.key, Config.ControlKeys.Follow.label),
        returnDog   = createPrompt(Config.ControlKeys.ReturnDog.key, Config.ControlKeys.ReturnDog.label)
    }
end

CreateDynamicPrompt = function(group)
    local function createPrompt(control, label)
        local prompt = PromptRegisterBegin()
        PromptSetControlAction(prompt, control)
        PromptSetText(prompt, CreateVarString(10, "LITERAL_STRING", label))
        PromptSetEnabled(prompt, true)
        PromptSetVisible(prompt, true)
        PromptSetStandardMode(prompt, 1)
        PromptSetGroup(prompt, group)
        PromptRegisterEnd(prompt)
        return prompt
    end

    return
        createPrompt(Config.ControlKeys.Attack.key, Config.ControlKeys.Attack.label),
        createPrompt(Config.ControlKeys.Sniff.key, Config.ControlKeys.Sniff.label)
end

ClearDynamicPrompts = function()
    if DogPrompts then
        for _, prompt in pairs(DogPrompts) do
            if prompt then PromptDelete(prompt) end
        end
        DogPrompts = {}
    end
end

ClearAgressivePrompts = function()
    if sniffPrompt then PromptDelete(sniffPrompt) end
    if attackPrompt then PromptDelete(attackPrompt) end
end

GetPlayerServerIdFromPed = function(ped)
    for _, player in ipairs(GetActivePlayers()) do
        if GetPlayerPed(player) == ped then
            return GetPlayerServerId(player)
        end
    end
end

FindAllPlayersWithinRange = function(coords, range, cb)
    local players = GetActivePlayers()
    local playersInRange = {}

    for _, playerIndex in ipairs(players) do
        local targetPed = GetPlayerPed(playerIndex)
        if playerIndex ~= PlayerId() then
            local targetCoords = GetEntityCoords(targetPed)
            local distance = #(coords - targetCoords)
            if distance <= range then
                table.insert(playersInRange, {
                    playerId = GetPlayerServerId(playerIndex),
                    playerPed = targetPed,
                    playerCoords = targetCoords,
                    distance = distance
                })
            end
        end
    end

    -- Generate a unique event name for the callback
    local eventName = "attackdog:client:receivePlayers:" .. math.random(100000, 999999)

    -- Send to server
    TriggerServerEvent("attackdog:server:checkPlayers", playersInRange, eventName)

    -- One-time response listener
    local handler
    handler = AddEventHandler(eventName, function(filteredPlayers)
        RemoveEventHandler(handler) -- 🟢 now passing the actual handler ref
        cb(filteredPlayers)
    end)

    RegisterNetEvent(eventName)
end

HandleAttack = function(entity)
    if HasAttacked or not DoesEntityExist(entity) then return end
    HasAttacked = true

    WhistleAnim()

    NetworkRequestControlOfEntity(dog)
    while not NetworkHasControlOfEntity(dog) do Wait(0) end

    -- Optional: delay and bark for flair
    TaskStartScenarioInPlaceHash(dog, `WORLD_ANIMAL_DOG_BARKING_VICIOUS`, 0, true)
    Wait(1000)
    ClearPedTasksImmediately(dog)

    -- Check if it's a player (networked) or a ped
    if IsPedAPlayer(entity) and NetworkGetEntityIsNetworked(entity) then
        local targetServerId = GetPlayerServerId(NetworkGetPlayerIndexFromPed(entity))
        if targetServerId then
            TriggerServerEvent('attackdog:server:attackPlayer', PedToNet(dog), targetServerId)
        end
    else
        -- It's a local NPC (ped)
        TaskGoToEntity(dog, entity, -1, 2.0, 3.0, 0, 0)
        CreateThread(function()
            while true do
                Wait(250)
                if #(GetEntityCoords(dog) - GetEntityCoords(entity)) <= 2.0 then
                    ClearPedTasksImmediately(dog)
                    SetPedCombatAttributes(dog, 46, true) -- Attack without fear
                    SetPedCombatMovement(dog, 3)         -- Chase aggressively
                    TaskCombatPed(dog, entity, 0, 16)
                    break
                end
            end
        end)
    end

    Wait(1000)
    HasAttacked = false
end

HandleSniff = function(aimedEntity)
    local ped = PlayerPedId()

    if Config.DevMode or not DoesEntityExist(aimedEntity) then
        aimedEntity = ped
    end

    if Sniffing or not DoesEntityExist(aimedEntity) then return end

    NetworkRequestControlOfEntity(dog)
    while not NetworkHasControlOfEntity(dog) do Wait(0) end

    WhistleAnim()
    Sniffing = true

    TaskGoToEntity(dog, aimedEntity, -1, 0.5, 1.0, 0, 0)

    local arrived = false
    local startTime = GetGameTimer()

    while not arrived do
        Wait(0)
        if #(GetEntityCoords(dog) - GetEntityCoords(aimedEntity)) < 2 then
            arrived = true
        elseif GetGameTimer() - startTime > Config.SniffLoop then -- 30-second timeout
            Sniffing = false
            lib.notify({
                title = Config.AlertText.DogTitle,
                description = Config.AlertText.DogLostInterest,
                type = "info"
            })
            return
        end
    end

    ClearPedTasksImmediately(dog)
    Wait(500)

    TaskStartScenarioInPlaceHash(dog, `WORLD_ANIMAL_DOG_SNIFFING_GROUND`, 0, true)

    if lib.progressCircle({
        duration = 10000,
        label = Config.AlertText.Progressbar,
        canCancel = true,
    }) then
        Wait(250)
        Sniffing = false

        local targetPlayerId = (Config.DevMode or aimedEntity == ped) and GetPlayerServerId(PlayerId()) or GetPlayerServerIdFromPed(aimedEntity)

        RSGCore.Functions.TriggerCallback('attackdog:server:getItems', function(hasItems)
        local scenario = hasItems and `WORLD_ANIMAL_DOG_BARKING_UP` or `WORLD_ANIMAL_DOG_SITTING`
        lib.notify({
        title = Config.AlertText.DogTitle,
        description = hasItems and Config.AlertText.DogFound or Config.AlertText.DogNotFound,
        type = hasItems and "success" or "info"
    })
    TaskStartScenarioInPlaceHash(dog, scenario, 0, true)
end, targetPlayerId)

    else
        Sniffing = false
    end
end

HandleCarryDog = function()
    local playerPed = PlayerPedId()

    if IsCarryingDog then
        -- Drop logic
        DetachEntity(dog, true, true)
        ClearPedTasksImmediately(playerPed)
        ClearPedTasksImmediately(dog)
        IsCarryingDog = false

        TaskFollowToOffsetOfEntity(dog, playerPed, 0.0, 2.0, 0.0, 2.0, -1, 0.5, true)
        PromptSetText(DogPrompts.carry, CreateVarString(10, "LITERAL_STRING", Config.AlertText.CarryDog))
        return
    end

    -- Begin carry
    if not DoesEntityExist(dog) then return end
    local playerCoords = GetEntityCoords(playerPed)
    if #(playerCoords - GetEntityCoords(dog)) > 2.0 then
        lib.notify({
            title = Config.AlertText.DogTitle,
            description = Config.AlertText.ToFarAway,
            type = "info"
        })
        return
    end

    NetworkRequestControlOfEntity(dog)
    while not NetworkHasControlOfEntity(dog) do Wait(0) end
    ClearPedTasksImmediately(dog)

    
    -- Carry animation (player)
    local dict = "mech_loco_m@generic@carry@animals@large@idle"
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do Wait(0) end
    TaskPlayAnim(playerPed, dict, "idle", 8.0, 8.0, -1, 24, 0, false, false, false)

    -- Dog idle animation (randomized)
    local dogDict = "amb_creature_mammal@world_dog_sitting@idle"
    local idleAnims = { "idle_a", "idle_b", "idle_c" }
    local randomAnim = idleAnims[math.random(1, #idleAnims)]
    RequestAnimDict(dogDict)
    while not HasAnimDictLoaded(dogDict) do Wait(0) end
    TaskPlayAnim(dog, dogDict, randomAnim, 8.0, 8.0, -1, 24, 0, false, false, false)

    Wait(1000)

    -- Attach dog to player
    AttachEntityToEntity(dog, playerPed, 11816, 0.0, -0.05, 0.60, 0.0, 0.0, 0.0, false, false, false, false, 2, true)

    -- Safety reattach after delay
    CreateThread(function()
        Wait(500)
        if not IsEntityAttachedToEntity(dog, playerPed) then
            AttachEntityToEntity(dog, playerPed, 11816, 0.0, -0.05, 0.60, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
        end
    end)

    -- Update state
    IsCarryingDog = true
    PromptSetText(DogPrompts.carry, CreateVarString(10, "LITERAL_STRING", Config.AlertText.DropDog))
end

RegisterNetEvent("attackdog:client:receivePlayers", function(players)
    retval = players
end)

RegisterNetEvent('attackdog:client:useCollar', function()
    TriggerServerEvent('attackdog:server:checkJob')
end)

RegisterNetEvent('attackdog:client:openMenu', function()
    if IsUsingDog then return end

    local input = lib.inputDialog(Config.AlertText.DialogTittle, {{
        type = 'select',
        label = Config.AlertText.DialogLabel,
        value = 'dog',
        options = (function()
            local options = {}
            for _, dog in ipairs(Config.DogTypes) do
                table.insert(options, { label = dog.label, value = dog.model })
            end
            return options
        end)(),
        required = true
    }})

    if not input then return end

    local model = GetHashKey(input[1])
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(0) end

    local coords = GetEntityCoords(PlayerPedId())
    local heading = GetEntityHeading(PlayerPedId())

    dog = CreatePed(model, coords.x, coords.y, coords.z, heading, true, true)
    SetEntityAsMissionEntity(dog, true, true)
    SetPedMaxHealth(dog, 500)
    SetEntityHealth(dog, 500)
    Citizen.InvokeNative(0x77FF8D35EEC6BBC4, dog, 1)
    table.insert(holdingPeds, dog)

    IsUsingDog = true
    SetupPrompts()
    TriggerEvent('attackdog:client:start')
end)

RegisterNetEvent('attackdog:client:attackPlayer', function(dogPed)
    dogPed = NetToPed(dogPed)
    NetworkRequestControlOfEntity(dogPed)
    TaskFollowToOffsetOfEntity(dogPed, PlayerPedId(), 0.0, 2.0, 0.0, 2.0, -1, 0.5, true)

    CreateThread(function()
        while true do
            if #(GetEntityCoords(dogPed) - GetEntityCoords(PlayerPedId())) <= 2 then
                SetPedCombatMovement(dogPed, 3)
                TaskCombatPed(dogPed, PlayerPedId(), 0, 16)
                break
            end
            Wait(500)
        end
    end)
end)

RegisterNetEvent('attackdog:client:start', function()
    local sitPressed = false
    local findPressed = false
    local callPressed = false
    local carryPressed = false
    local followPressed = false

    while IsUsingDog do
        Wait(0)

        local ped = PlayerPedId()
        local pid = PlayerId()
        local retval, entity = GetPlayerTargetEntity(pid)

        if retval and dog and IsEntityAPed(entity) and not IsPedInMeleeCombat(entity) and not IsPedDeadOrDying(entity) then
            if not attackPrompt and not sniffPrompt then
                local promptGroup = PromptGetGroupIdForTargetEntity(entity)
                attackPrompt, sniffPrompt = CreateDynamicPrompt(promptGroup)
                ClearDynamicPrompts()
            end

            if IsControlJustPressed(0, Config.ControlKeys.Attack.key) then
                HandleAttack(entity)
            elseif IsControlJustPressed(0, Config.ControlKeys.Sniff.key) then
                HandleSniff(entity)
            end

            if #(GetEntityCoords(ped) - GetEntityCoords(entity)) > 15 then
                ClearAgressivePrompts()
                attackPrompt, sniffPrompt = nil, nil
            end
        else
            if attackPrompt or sniffPrompt then
                ClearAgressivePrompts()
                attackPrompt, sniffPrompt = nil, nil
                SetupPrompts()
            end
        end

        -- Sit command
        if IsControlPressed(0, Config.ControlKeys.Sit.key) and not sitPressed then
            sitPressed = true
            NetworkRequestControlOfEntity(dog)
            ClearPedTasks(dog)
            TaskStartScenarioInPlaceHash(dog, `WORLD_ANIMAL_DOG_SITTING`, 0, true)

            local dict = "script_story@mob1@leadin@mcs_1"
            local anim = "player_wave_player"
            RequestAnimDict(dict)
            while not HasAnimDictLoaded(dict) do Wait(0) end
            TaskPlayAnim(PlayerPedId(), dict, anim, 8.0, 8.0, 1500, 48, 0, false, false, false)
        elseif not IsControlPressed(0, Config.ControlKeys.Sit.key) then
            sitPressed = false
        end

        -- Find scent
        if IsControlPressed(0, Config.ControlKeys.FindScent.key) and not findPressed then
            findPressed = true
            WhistleAnim()
            FindAllPlayersWithinRange(GetEntityCoords(dog), Config.SearchRangeDog, function(players)
                if players and #players > 0 then
                    table.sort(players, function(a, b) return a.distance < b.distance end)
                    local closest = players[1]
                    TaskGoToCoordAnyMeans(dog, closest.playerCoords.x, closest.playerCoords.y, closest.playerCoords.z, 3.0, 0, 0, 786603, 0xbf800000)
                    CreateThread(function()
                        while true do
                            Wait(500)
                            if #(GetEntityCoords(dog) - closest.playerCoords) < 2.0 then
                                TaskTurnPedToFaceCoord(dog, closest.playerCoords.x, closest.playerCoords.y, closest.playerCoords.z, 1100)
                                Wait(500)
                                TaskStartScenarioInPlaceHash(dog, `WORLD_ANIMAL_DOG_BARKING_VICIOUS`, 0, true)
                                break
                            end
                        end
                    end)
                else
                    TaskStartScenarioInPlaceHash(dog, `WORLD_ANIMAL_DOG_SITTING`, 0, true)
                    lib.notify({
                        title = Config.AlertText.DogTitle,
                        description = Config.AlertText.DogSents,
                        type = 'success'
                    })
                    Wait(5000)
                end
            end)
        elseif not IsControlPressed(0, Config.ControlKeys.FindScent.key) then
            findPressed = false
        end

        -- Callback
        if IsControlPressed(0, Config.ControlKeys.CallBack.key) and not callPressed then
            callPressed = true
            WhistleAnim()
            ClearPedTasks(dog)
            local pedCoords = GetEntityCoords(ped)
            TaskGoToCoordAnyMeans(dog, pedCoords.x, pedCoords.y, pedCoords.z, 2.0, 0, 0, 786603, 0xbf800000)
            CreateThread(function()
                while true do
                    Wait(0)
                    if #(GetEntityCoords(dog) - pedCoords) < 3.0 then
                        TaskStartScenarioInPlaceHash(dog, `WORLD_ANIMAL_DOG_SITTING`, 0, true)
                        lib.notify({
                            title = Config.AlertText.DogTitle,
                            description = Config.AlertText.DogReturn,
                            type = 'success'
                        })
                        break
                    end
                end
            end)
        elseif not IsControlPressed(0, Config.ControlKeys.CallBack.key) then
            callPressed = false
        end

        -- Carry
        if IsControlPressed(0, Config.ControlKeys.Carry.key) and not carryPressed then
            carryPressed = true
            HandleCarryDog()
        elseif not IsControlPressed(0, Config.ControlKeys.Carry.key) then
            carryPressed = false
        end

        -- Follow
        if IsControlPressed(0, Config.ControlKeys.Follow.key) and not followPressed then
            followPressed = true
            WhistleAnim()
            TaskFollowToOffsetOfEntity(dog, ped, 0.0, 2.0, 0.0, 2.0, -1, 0.5, true)
        elseif not IsControlPressed(0, Config.ControlKeys.Follow.key) then
            followPressed = false
        end

        -- Return Dog
        if IsControlPressed(0, Config.ControlKeys.ReturnDog.key) then
            IsUsingDog = false
            if dog and DoesEntityExist(dog) then
                DeleteEntity(dog)
                dog = nil
            end
            ClearDynamicPrompts()
            ClearAgressivePrompts()
        
            lib.notify({
                title = Config.AlertText.DogTitle,
                description = Config.AlertText.ReturnDog,
                type = "info"
            })
            break
        end
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    for _, ped in ipairs(holdingPeds) do
        if DoesEntityExist(ped) then DeleteEntity(ped) end
    end
    if dog and DoesEntityExist(dog) then DeleteEntity(dog) end
    ClearDynamicPrompts()
    ClearAgressivePrompts()
end)