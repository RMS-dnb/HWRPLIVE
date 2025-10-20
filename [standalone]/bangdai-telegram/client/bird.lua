if not Config.EnableBirdPost then return end

local cuteBird = nil
local birdPrompt = nil
local letterPromptGroup = GetRandomIntInRange(0, 0xffffff)
local OpenLetter = GetRandomIntInRange(0, 0xffffff)
local playerCoords = nil
local notified = false
local destination = nil
local telegramData = nil
local isReceiving = false
local buildingNotified = false
local isBirdAlreadySpawned = false
local birdTime = Config.Bird.BirdTimeout
local birdBlip = nil
UdahManggil = false
PrompUdahDipake = false
local OpenPrompt, CancelPrompt
lib.locale()

local isPlayerMounted = false
lib.onCache('mount', function(value)
    isPlayerMounted = value ~= nil
    if cuteBird and DoesEntityExist(cuteBird) and isPlayerMounted then
        if IsEntityAttached(cuteBird) then
            DetachEntity(cuteBird, true, true)
            local ped = PlayerPedId()
            local offset = GetOffsetFromEntityInWorldCoords(ped, 0.0, -3.0, 2.0)
            TaskFlyToCoord(cuteBird, 1.0, offset.x, offset.y, offset.z, 1, 0)
        end
    end
end)

lib.onCache('vehicle', function(value)
    if cuteBird and DoesEntityExist(cuteBird) and value ~= nil then
        if IsEntityAttached(cuteBird) then
            DetachEntity(cuteBird, true, true)
            local ped = PlayerPedId()
            local offset = GetOffsetFromEntityInWorldCoords(ped, 0.0, -3.0, 2.0)
            TaskFlyToCoord(cuteBird, 1.0, offset.x, offset.y, offset.z, 1, 0)
        end
    end
end)

local function MakeBirdFlyAway()
    if not cuteBird or not DoesEntityExist(cuteBird) then return end

    if IsEntityAttached(cuteBird) then
        DetachEntity(cuteBird, true, true)
    end

    local coords = GetEntityCoords(PlayerPedId())

    local flyAwayCoords = vector3(
        coords.x + math.random(100, 150),
        coords.y + math.random(100, 150),
        coords.z + math.random(30, 50)
    )

    ClearPedTasks(cuteBird)
    TaskFlyToCoord(cuteBird, 2.0, flyAwayCoords.x, flyAwayCoords.y, flyAwayCoords.z, 1, 1)

    cuteBird = nil
    UdahManggil = false
    isReceiving = false
    isBirdAlreadySpawned = false
    notified = false
    telegramData = nil
    buildingNotified = false
    PrompUdahDipake = false

    CreateThread(function()
        Wait(Config.Bird.BirdArrivalDelay)
        if cuteBird and DoesEntityExist(cuteBird) then
            SetEntityInvincible(cuteBird, false)
            SetEntityCanBeDamaged(cuteBird, true)
            SetEntityAsMissionEntity(cuteBird, false, false)
            SetEntityAsNoLongerNeeded(cuteBird)
            DeleteEntity(cuteBird)
        end
    end)

    if birdBlip then
        RemoveBlip(birdBlip)
        birdBlip = nil
    end
end

local BirdPrompt = function()
    CreateThread(function()
        birdPrompt = Citizen.InvokeNative(0x04F97DE45A519419)
        PromptSetControlAction(birdPrompt, Config.keys.RetrieveAndWrite)
        local str = CreateVarString(10, 'LITERAL_STRING', locale('Retrieve_Letter'))
        PromptSetText(birdPrompt, str)
        PromptSetEnabled(birdPrompt, true)
        PromptSetVisible(birdPrompt, true)
        PromptSetHoldMode(birdPrompt, true)
        PromptSetGroup(birdPrompt, letterPromptGroup)
        PromptRegisterEnd(birdPrompt)
    end)
end

CreateThread(function()
    local str = locale('Write_Letter')
    OpenPrompt = PromptRegisterBegin()
    PromptSetControlAction(OpenPrompt, Config.keys.RetrieveAndWrite)
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(OpenPrompt, str)
    PromptSetEnabled(OpenPrompt, true)
    PromptSetVisible(OpenPrompt, true)
    PromptSetStandardMode(OpenPrompt, 1)
    PromptSetGroup(OpenPrompt, OpenLetter)
    PromptRegisterEnd(OpenPrompt)

    str = locale('Cancel_Bird')
    CancelPrompt = PromptRegisterBegin()
    PromptSetControlAction(CancelPrompt, Config.keys.CancelBird)
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(CancelPrompt, str)
    PromptSetEnabled(CancelPrompt, true)
    PromptSetVisible(CancelPrompt, true)
    PromptSetStandardMode(CancelPrompt, 1)
    PromptSetGroup(CancelPrompt, OpenLetter)
    PromptRegisterEnd(CancelPrompt)
end)

local function AttachBirdToPlayer()
    if not cuteBird or not DoesEntityExist(cuteBird) then return end
    
    local ped = PlayerPedId()
    if isPlayerMounted or IsPedOnVehicle(ped) then return end
    
    local shoulderBone = GetEntityBoneIndexByName(cache.ped, "CP_L_Shoulder")
    AttachEntityToEntity(cuteBird, cache.ped, shoulderBone, 0.0, 0.0, 0.05, 0.0, 0.0, 160.0, false, false, false, false, 0, true, false, false)
    ClearPedTasks(cuteBird)
    PlayAnim(cuteBird, "amb_creatures_bird@world_parrot_on_ground@base", "base")
    Wait(1000)
    
    if not IsEntityAttached(cuteBird) then
        AttachEntityToEntity(cuteBird, cache.ped, shoulderBone, 0.0, 0.0, 0.05, 0.0, 0.0, 160.0, false, false, false, false, 0, true, false, false)
    end
end

local function Prompts()
    if not PromptHasHoldModeCompleted(birdPrompt) then return end
    if not cuteBird or not DoesEntityExist(cuteBird) then return end

    local ped = PlayerPedId()
    if destination < 3.0 and (isPlayerMounted or IsPedOnVehicle(ped)) then
        Notify(locale('Notify_Title_Bird'), locale('Dismount_Horse'), 5000)
        return
    end

    local success = lib.callback.await('bangdai-telegram:server:RetrieveTelegram', false, telegramData)
    if success then
        MakeBirdFlyAway()
    end
end

local SetPetAttributes = function(entity)
    -- SET_ATTRIBUTE_POINTS
    Citizen.InvokeNative(0x09A59688C26D88DF, entity, 0, 1100)
    Citizen.InvokeNative(0x09A59688C26D88DF, entity, 1, 1100)
    Citizen.InvokeNative(0x09A59688C26D88DF, entity, 2, 1100)

    -- ADD_ATTRIBUTE_POINTS
    Citizen.InvokeNative(0x75415EE0CB583760, entity, 0, 1100)
    Citizen.InvokeNative(0x75415EE0CB583760, entity, 1, 1100)
    Citizen.InvokeNative(0x75415EE0CB583760, entity, 2, 1100)

    -- SET_ATTRIBUTE_BASE_RANK
    Citizen.InvokeNative(0x5DA12E025D47D4E5, entity, 0, 10)
    Citizen.InvokeNative(0x5DA12E025D47D4E5, entity, 1, 10)
    Citizen.InvokeNative(0x5DA12E025D47D4E5, entity, 2, 10)

    -- SET_ATTRIBUTE_BONUS_RANK
    Citizen.InvokeNative(0x920F9488BD115EFB, entity, 0, 10)
    Citizen.InvokeNative(0x920F9488BD115EFB, entity, 1, 10)
    Citizen.InvokeNative(0x920F9488BD115EFB, entity, 2, 10)

    -- SET_ATTRIBUTE_OVERPOWER_AMOUNT
    Citizen.InvokeNative(0xF6A7C08DF2E28B28, entity, 0, 5000.0, false)
    Citizen.InvokeNative(0xF6A7C08DF2E28B28, entity, 1, 5000.0, false)
    Citizen.InvokeNative(0xF6A7C08DF2E28B28, entity, 2, 5000.0, false)
end

local SpawnBirdPost = function(posX, posY, posZ, heading, rfar, x)
    if cuteBird and DoesEntityExist(cuteBird) then
        DeleteEntity(cuteBird)
    end
    
    cuteBird = CreatePed(Config.Bird.BirdModel, posX, posY, posZ + 20.0, heading, 1, 1)
    
    if not cuteBird or not DoesEntityExist(cuteBird) then
        if Config.debug then
            print("^1[Bird Debug] Failed to spawn bird!^0")
        end
        return false
    end
    
    SetPedScale(cuteBird, Config.Bird.Scale or 2.0)
    SetPetAttributes(cuteBird)

    Citizen.InvokeNative(0x013A7BA5015C1372, cuteBird, true)
    Citizen.InvokeNative(0xAEB97D84CDF3C00B, cuteBird, false)
    Citizen.InvokeNative(0x1913FE4CBF41C463, cuteBird, 263, true)
    Citizen.InvokeNative(0x1913FE4CBF41C463, cuteBird, 170, true)
    Citizen.InvokeNative(0x1913FE4CBF41C463, cuteBird, 208, true)
    
    Citizen.InvokeNative(0x283978A15512B2FE, cuteBird, true)
    SetPedFleeAttributes(cuteBird, 0, 0)
    SetBlockingOfNonTemporaryEvents(cuteBird, true)
    SetEntityAsMissionEntity(cuteBird, true, true)
    
    SetEntityProofs(cuteBird, true, true, true, true, true, true, true, true)
    SetRelationshipBetweenGroups(1, GetPedRelationshipGroupHash(cuteBird), joaat('PLAYER'))
    SetEntityInvincible(cuteBird, true)
    SetEntityCanBeDamaged(cuteBird, false)
    SetEntityOnlyDamagedByPlayer(cuteBird, false)
    SetEntityCanBeDamagedByRelationshipGroup(cuteBird, false, joaat('PLAYER'))
    SetPedCanBeTargetted(cuteBird, false)
    SetPedCanBeTargettedByPlayer(cuteBird, PlayerId(), false)
    SetPedCanBeTargettedByTeam(cuteBird, PlayerId(), false)
    SetEntityCollision(cuteBird, false, false)

    local playerPed = PlayerPedId()
    local targetCoords = GetEntityCoords(playerPed)
    
    Citizen.InvokeNative(0x923583741DC87BCE, cuteBird, 'default')
    Citizen.InvokeNative(0x4FD80C3DD84B817B, cuteBird)
    Citizen.InvokeNative(0x89F5E7ADECCCB49C, cuteBird, "carry_attached")

    local flightTarget = vector3(
        targetCoords.x,
        targetCoords.y,
        targetCoords.z + 5.0
    )

    ClearPedTasks(cuteBird)
    TaskFlyToCoord(cuteBird, 1.0, flightTarget.x, flightTarget.y, flightTarget.z, 1, 0)

    if x == 0 then
        local blipname = locale("bird_blip")
        local bliphash = -1749618580

        birdBlip = Citizen.InvokeNative(0x23F74C2FDA6E7C61, bliphash, cuteBird)
        Citizen.InvokeNative(0x9CB1A1623062F402, birdBlip, blipname)
        Citizen.InvokeNative(0x0DF2B55F717DDB10, birdBlip)
        Citizen.InvokeNative(0x662D364ABF16DE2F, birdBlip, GetHashKey("BLIP_MODIFIER_DEBUG_BLUE"))
        SetBlipScale(birdBlip, 2.0)
    end
    
    return true
end

local function OpenLetterBaru(name)
    local hasitem = lib.callback.await('bangdai-telegram:CheckItem', false)
    local data = lib.callback.await('bangdai-telegram:server:LoadUserData', false)
    if not display then
        if hasitem and data then
            SetNuiFocus(true, true)
            if Config.EnableTalkWhileOpen.Enable then
                SetNuiFocusKeepInput(true)
                display = true
                CreateThread(Enablekey)
            end
            SendNUIMessage({
                action = 'birdPost',
                contacts = data.contacts,
                MyTelegram = data.telegramno,
                leftText = string.upper(name),
                rightText = locale('Right_Text_Bird'),
                year = data.year,
            })
        else
            Notify(locale('Notify_Title_Bird'), locale('Dont_Have_Paper'), 5000)
        end
    end
end

exports('OpenLetterBaru', OpenLetterBaru)

function ClearTaskPed()
    MakeBirdFlyAway()
end

function BukaBirdLetter(name)
    while PrompUdahDipake do
        Wait(1)

        local label = CreateVarString(10, 'LITERAL_STRING', "~pa~" .. locale('Notify_Title_Bird') .. "~q~")
        PromptSetActiveGroupThisFrame(OpenLetter, label)

        if Citizen.InvokeNative(0xC92AC953F0A982AE, OpenPrompt) then
            OpenLetterBaru(name)
        end
        if Citizen.InvokeNative(0xC92AC953F0A982AE, CancelPrompt) then
            ClearTaskPed()
        end
    end
end

CreateThread(function()
    BirdPrompt()
    while true do
        Wait(5)
        local sleep = true
        if notified and destination < 2.0 then
            sleep = false
            local Bird = CreateVarString(10, "LITERAL_STRING", "~pa~" .. locale('Notify_Title_Bird') .. "~q~")
            PromptSetActiveGroupThisFrame(letterPromptGroup, Bird)
            if PromptHasHoldModeCompleted(birdPrompt) then
                Prompts()
                break
            end
        end
        if sleep then
            Wait(1500)
        end
    end
end)

RegisterNetEvent('bangdai-telegram:client:HandleTelegramDelivery', function(data)
    telegramData = data
    isReceiving = true
    local ped = PlayerPedId()
    local rFar = math.random(50, 100)
    
    notified = false
    buildingNotified = false
    isBirdAlreadySpawned = false
    birdTime = Config.Bird.BirdTimeout

    CreateThread(function()
        local birdStuckCounter = 0
        local lastBirdPosition = nil
        local birdAttached = false
        
        while isReceiving do
            Wait(1000)

            playerCoords = GetEntityCoords(ped)
            local myCoords = vector3(playerCoords.x, playerCoords.y, playerCoords.z)
            
            local insideBuilding = GetInteriorFromEntity(ped)
            if insideBuilding ~= 0 then
                if not buildingNotified then
                    Notify(locale('Notify_Title_Bird'), locale('Out_From_Building'), 5000)
                    buildingNotified = true
                end
                goto continue
            else
                buildingNotified = false
            end

            if not isBirdAlreadySpawned then
                local spawnSuccess = SpawnBirdPost(playerCoords.x - 100, playerCoords.y - 100, playerCoords.z + 100, 92.0, rFar, 0)
                if spawnSuccess then
                    isBirdAlreadySpawned = true
                    TaskFlyToCoord(cuteBird, 1.0, playerCoords.x, playerCoords.y, playerCoords.z, 1, 0)
                else
                    Notify(locale('Notify_Title_Bird'), "Bird spawn failed, retrying...", 5000)
                    goto continue
                end
            end

            if cuteBird and DoesEntityExist(cuteBird) then
                local birdCoords = GetEntityCoords(cuteBird)
                destination = #(birdCoords - myCoords)
                
                if lastBirdPosition then
                    local birdMovement = #(lastBirdPosition - birdCoords)
                    if birdMovement < 1.0 and destination > 10.0 then
                        birdStuckCounter = birdStuckCounter + 1
                        if birdStuckCounter >= 3 then
                            if Config.debug then
                                print("^3[Bird Debug] Bird appears stuck, redirecting...^0")
                            end
                            ClearPedTasks(cuteBird)
                            TaskFlyToCoord(cuteBird, 1.0, myCoords.x, myCoords.y, myCoords.z + 2.0, 1, 0)
                            birdStuckCounter = 0
                        end
                    else
                        birdStuckCounter = 0
                    end
                end
                lastBirdPosition = birdCoords

                if destination < 100 and not notified then
                    notified = true
                    Notify(locale('Notify_Title_Bird'), locale('Bird_Approaching'), 5000)
                end

                local isBirdDead = Citizen.InvokeNative(0x7D5B1F88E7504BBA, cuteBird)

                if destination < Config.Bird.AttatchDistance and notified and not isPlayerMounted and not IsPedOnVehicle(ped) and not birdAttached then
                    CreateThread(function()
                        local attachDistance = Config.Bird.AttatchDistance
                        local lastPlayerPos = GetEntityCoords(ped)
                        local stationaryTime = 0
                        local stationaryThreshold = Config.Bird.Threshold
                        local checkInterval = 100
                        
                        while not birdAttached and cuteBird and DoesEntityExist(cuteBird) and isReceiving do
                            local currentPlayerPos = GetEntityCoords(ped)
                            local currentBirdPos = GetEntityCoords(cuteBird)
                            local distance = #(currentBirdPos - currentPlayerPos)
                            local playerMoved = #(lastPlayerPos - currentPlayerPos) > 0.01

                            if isPlayerMounted or IsPedOnVehicle(ped) then
                                stationaryTime = 0
                                local targetPos = GetOffsetFromEntityInWorldCoords(ped, 0.0, -3.0, 2.0)
                                ClearPedTasks(cuteBird)
                                TaskFlyToCoord(cuteBird, 1.0, targetPos.x, targetPos.y, targetPos.z, 1, 0)
                            else
                                if playerMoved then
                                    stationaryTime = 0
                                    if distance > attachDistance then
                                        local targetPos = vector3(
                                            currentPlayerPos.x,
                                            currentPlayerPos.y,
                                            currentPlayerPos.z + 1.0
                                        )
                                        ClearPedTasks(cuteBird)
                                        TaskFlyToCoord(cuteBird, 1.0, targetPos.x, targetPos.y, targetPos.z, 1, 0)
                                    end
                                else
                                    stationaryTime = stationaryTime + checkInterval
                                    if stationaryTime >= stationaryThreshold and distance <= attachDistance then
                                        birdAttached = true
                                        AttachBirdToPlayer()
                                        PrompUdahDipake = true
                                        CreateThread(function()
                                            BukaBirdLetter(locale('Name_Birdpost'))
                                        end)
                                        break
                                    end
                                end
                            end

                            lastPlayerPos = currentPlayerPos
                            Wait(checkInterval)
                        end
                    end)
                elseif (notified and destination > 10.0) or isPlayerMounted or IsPedOnVehicle(ped) then
                    if Config.Bird.AutoResurrect and isBirdDead then
                        ClearPedTasksImmediately(cuteBird)
                        Wait(1000)
                        Citizen.InvokeNative(0x71BC8E838B9C6035, cuteBird)
                        Wait(1000)
                    end

                    if isPlayerMounted or IsPedOnVehicle(ped) then
                        local targetPos = GetOffsetFromEntityInWorldCoords(ped, 0.0, -3.0, 2.0)
                        TaskFlyToCoord(cuteBird, 1.0, targetPos.x, targetPos.y, targetPos.z, 1, 0)
                    else
                        TaskFlyToCoord(cuteBird, 1.0, myCoords.x, myCoords.y, myCoords.z + 2.0, 1, 0)
                    end
                end

                if birdTime > 0 then
                    birdTime = birdTime - 1 -- Adjust for 1 second intervals
                else
                    Notify(locale('Notify_Title_Bird'), locale('Decided_NotPick'), 5000)
                    Wait(8000)
                    Notify(locale('Notify_Title_Bird'), locale('Bird_Tired'), 5000)
                    Wait(8000)
                    Notify(locale('Notify_Title_Bird'), locale('Go_To_Postal_Office'), 5000)
                    MakeBirdFlyAway()
                    break
                end
            else
                if Config.debug then
                    print("^3[Bird Debug] Bird entity lost, attempting respawn...^0")
                end
                isBirdAlreadySpawned = false
            end

            ::continue::
        end
    end)
end)

RegisterNetEvent('bangdai-telegram:UseBird', function(name)
    if isReceiving then
        Notify(locale('Notify_Title_Bird'), locale('Incoming_Bird'), 5000)
        return
    end

    local pcoords = GetEntityCoords(cache.ped)
    local town_name = Citizen.InvokeNative(0x43AD8FC02B429D33, pcoords.x, pcoords.y, pcoords.z, 1)

    if isPlayerMounted or IsPedOnVehicle(cache.ped) then
        Notify(locale('Notify_Title_Bird'), locale('Dismount_Horse'), 5000)
        return
    end

    if town_name == 7359335 or
        town_name == -744494798 or
        town_name == 1053078005 or
        town_name == 2046780049 or
        town_name == 3529426767 or
        town_name == 427683330 or
        town_name == 2770008149 or
        town_name == 459833523 or
        town_name == -765540529 or
        town_name == 2126321341 then
        Notify(locale('Notify_Title_Bird'), locale('Cant_Call_Bird'), 5000)
        return
    end

    if not UdahManggil and not PrompUdahDipake then
        ClearPedTasks(cache.ped)
        ClearPedSecondaryTask(cache.ped)
        playerCoords = GetEntityCoords(cache.ped)
        UdahManggil = true

        local heading = GetEntityHeading(cache.ped)
        local rFar = Config.Bird.SpawnFar

        TaskWhistleAnim(cache.ped, GetHashKey('WHISTLEHORSELONG'))

        local spawnSuccess = SpawnBirdPost(playerCoords.x - (rFar * 1.5), playerCoords.y - (rFar * 1.5), playerCoords.z + 30.0, heading, rFar)

        if not spawnSuccess then
            Notify(locale('Notify_Title_Bird'), locale('Bird_Go'), 5000)
            UdahManggil = false
            return
        end

        CreateThread(function()
            local isAttached = false
            local attachDistance = Config.Bird.AttatchDistance
            local lastPlayerPos = GetEntityCoords(cache.ped)
            local stationaryTime = 0
            local stationaryThreshold = Config.Bird.Threshold
            local checkInterval = 100 -- Optimized check interval

            while not isAttached and cuteBird and DoesEntityExist(cuteBird) do
                local currentPlayerPos = GetEntityCoords(cache.ped)
                local currentBirdPos = GetEntityCoords(cuteBird)
                local distance = #(currentBirdPos - currentPlayerPos)
                local playerMoved = #(lastPlayerPos - currentPlayerPos) > 0.01

                if isPlayerMounted or IsPedOnVehicle(cache.ped) then
                    stationaryTime = 0
                    local targetPos = GetOffsetFromEntityInWorldCoords(cache.ped, 0.0, -3.0, 2.0)
                    ClearPedTasks(cuteBird)
                    TaskFlyToCoord(cuteBird, 1.0, targetPos.x, targetPos.y, targetPos.z, 1, 0)
                else
                    if playerMoved then
                        stationaryTime = 0
                        if distance > attachDistance then
                            local targetPos = vector3(
                                currentPlayerPos.x,
                                currentPlayerPos.y,
                                currentPlayerPos.z + 1.0
                            )
                            ClearPedTasks(cuteBird)
                            TaskFlyToCoord(cuteBird, 1.0, targetPos.x, targetPos.y, targetPos.z, 1, 0)
                        end
                    else
                        stationaryTime = stationaryTime + checkInterval
                        if stationaryTime >= stationaryThreshold and distance <= attachDistance then
                            isAttached = true
                            AttachBirdToPlayer()
                            PrompUdahDipake = true
                            BukaBirdLetter(name)
                            break
                        end
                    end
                end

                lastPlayerPos = currentPlayerPos
                Wait(checkInterval)
            end
        end)
    end
end)

AddEventHandler('onResourceStop', function(resName)
    if(resName == GetCurrentResourceName()) then
        if cuteBird then
            MakeBirdFlyAway()
        end
    end
end)