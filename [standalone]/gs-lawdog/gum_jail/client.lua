local RSGCore = exports['rsg-core']:GetCoreObject()

local entityEnumerator = {__gc = function(enum) if enum.destructor and enum.handle then enum.destructor(enum.handle) end enum.destructor = nil enum.handle = nil end}
local promptData1 = GetRandomIntInRange(0, 0xffffff)
local promptData2 = GetRandomIntInRange(0, 0xffffff)
local promptData3 = GetRandomIntInRange(0, 0xffffff)
local promptData4 = GetRandomIntInRange(0, 0xffffff)
local promptData5 = GetRandomIntInRange(0, 0xffffff)
local promptData6 = GetRandomIntInRange(0, 0xffffff)
local promptData7 = GetRandomIntInRange(0, 0xffffff)
local promptData8 = GetRandomIntInRange(0, 0xffffff)
local promptData9 = GetRandomIntInRange(0, 0xffffff)
local promptData10 = GetRandomIntInRange(0, 0xffffff)
local promptData11 = GetRandomIntInRange(0, 0xffffff)
local youHold = false
local holded = false 
local cartTable = {}
local leverTable = {}
local workRepeatTable = {}
local npcsMan = {}
local workCount = 0
local workJob = nil
local workEntity = nil
local jailJob = false
local jailTime = 0
local prisonerNpc = {}
local timeForEscape = 0
local escapePoints = 1
local questData = {}
local questionData = {}
local missionStarted = false
local escapeBoat = nil
local canEscapeMission = false
local inEscapeState = false
local inEscapeStateTime = 0
local escapeTimer = 0
local canLockpick = false
local robberyNpc = {}

local api
TriggerEvent("getApi",function(gumApi)
    api = gumApi
end)

TriggerEvent('chat:addSuggestion', '/'..Config.wearClotheCommand..'', ''..Config.Suggestions[1]..'', {
    { name=""..Config.Suggestions[2].."", help=""..Config.Suggestions[3].."" },
})

TriggerEvent('chat:addSuggestion', '/'..Config.CommandForAdmin..'', ''..Config.Suggestions[4]..'', {
    { name=""..Config.Suggestions[2].."", help=""..Config.Suggestions[3].."" },
    { name=""..Config.Suggestions[5].."", help=""..Config.Suggestions[6].."" },
})
TriggerEvent('chat:addSuggestion', '/'..Config.unjailCommand..'', ''..Config.Suggestions[7]..'', {
    { name=""..Config.Suggestions[2].."", help=""..Config.Suggestions[3].."" },
})

Citizen.CreateThread(function()
	api.createPrompt(""..Config.Language[1].."", 0x27D1C284, promptData1, "SHORT_TIMED_EVENT_MP")
	api.createPrompt(""..Config.Language[2].."", 0xA1ABB953, promptData1, "SHORT_TIMED_EVENT_MP")
	api.createPrompt(""..Config.Language[3].."", 0x27D1C284, promptData2, "SHORT_TIMED_EVENT_MP")
	api.createPrompt(""..Config.Language[4].."", 0xA1ABB953, promptData2, "SHORT_TIMED_EVENT_MP")
	api.createPrompt(""..Config.Language[5].."", 0x27D1C284, promptData3, "SHORT_TIMED_EVENT_MP")
	api.createPrompt(""..Config.Language[6].."", 0x27D1C284, promptData4, "SHORT_TIMED_EVENT_MP")
	api.createPrompt(""..Config.Language[7].."", 0x27D1C284, promptData5, "SHORT_TIMED_EVENT_MP")
	api.createPrompt(""..Config.Language[8].."", 0x27D1C284, promptData6, "SHORT_TIMED_EVENT_MP")
	api.createPrompt(""..Config.Language[9].."", 0x27D1C284, promptData7, "SHORT_TIMED_EVENT_MP")
	api.createPrompt(""..Config.Language[10].."", 0x27D1C284, promptData8, "SHORT_TIMED_EVENT_MP")
    api.createPrompt(""..Config.Language[11].."", 0x27D1C284, promptData9, "SHORT_TIMED_EVENT_MP")
    api.createPrompt(""..Config.Language[12].."", 0xA1ABB953, promptData9, "SHORT_TIMED_EVENT_MP")
    api.createPrompt(""..Config.Language[13].."", 0x27D1C284, promptData10, "SHORT_TIMED_EVENT_MP")
    api.createPrompt(""..Config.Language[14].."", 0x27D1C284, promptData11, "SHORT_TIMED_EVENT_MP")
end)

RegisterNetEvent("gum_jail:endJailCommand")
AddEventHandler("gum_jail:endJailCommand", function()
    releaseMeFunction()
    TriggerServerEvent('rsg-prison:server:GiveJailItems')
end)

RegisterNetEvent("gum_jail:lockpick")
AddEventHandler("gum_jail:lockpick", function()
    if canLockpick then
        playCustomAnim("mech_doors@locked@door_knob@generic@handle_l@hand_r@try_door","lockpick", -1, 1)
        Citizen.Wait(1000)
        TriggerEvent('gum_lockpick:client:openLockpick', lockpick)
    end
end)

function lockpick(success)
    pedc = GetEntityCoords(PlayerPedId())
    if success then
        local closestPlayer, closestDistance, playerid, tgt1 = GetClosestPlayer()
        if closestPlayer ~= -1 and closestDistance <= 1.0 then
            TriggerServerEvent("gum_jail:setCuffed", playerid, false)
        end
        ClearPedTasks(PlayerPedId())
	else
        TriggerServerEvent("gum_jail:lockpickFail")
        ClearPedTasks(PlayerPedId())
    end
end

Citizen.CreateThread(function()
    local cuffPrompt
    local holdPrompt
    while true do
        local optimalization = 700
        local isTargetting, targetEntity = GetPlayerTargetEntity(PlayerId())
        local closestPlayer, closestDistance, playerid, tgt1 = GetClosestPlayer()
        local coords = GetEntityCoords(tgt1, true)
        local holding = Citizen.InvokeNative(0xD806CD2A4F2C2996, PlayerPedId())
        local _, wepHash = GetCurrentPedWeapon(PlayerPedId(), true, 0, true)
        canLockpick = false
        if closestPlayer ~= -1 and closestDistance <= 1.0 then
            if Citizen.InvokeNative(0x74E559B3BC910685, tgt1) == 1 then
                canLockpick = true
            end
        end
        if Config.AimRobbery then
            local entity = getEntity(PlayerId())
            local pCoords = GetEntityCoords(PlayerPedId())
            local townHash = Citizen.InvokeNative(0x43AD8FC02B429D33, pCoords, 1)
            if not isTownBanned(townHash) then
                if Citizen.InvokeNative(0x705BE297EEBDB95D, wepHash) ~= false and wepHash ~= -1569615261 and GetEntityType(entity) == 1 and Citizen.InvokeNative(0x772A1969F649E902, GetEntityModel(entity)) == false and Citizen.InvokeNative(0x9A100F1CF4546629, entity) ~= 1 then
                    optimalization = api.fpsTimer()
                    local _1, rightHand = GetCurrentPedWeapon(entity, true, 0, true)
                    local _3, rightHolster = GetCurrentPedWeapon(entity, true, 2, true)
                    local plCoords = GetEntityCoords(PlayerPedId())
                    local npcCoords = GetEntityCoords(entity)
                    if 10 < GetEntityHealth(entity) and GetDistanceBetweenCoords(plCoords.x, plCoords.y, plCoords.z, npcCoords.x, npcCoords.y, npcCoords.z, true) < 10.0 then
                        local isPlayer = false
                        for a,b in pairs(GetActivePlayers()) do
                            if GetPlayerPed(b) == entity then
                                isPlayer = true
                            end
                        end
                        if not isPlayer then
                            if ((rightHolster == -1569615261 or rightHolster == 0) or (rightHand == -1569615261 or rightHand == 0)) then
                                playCustomAnimPed(entity, "ai_temp@base","handsup", -1, 25);
                                Citizen.InvokeNative(0x6BCF5F3D8FFE988D, entity, true)
                                TaskStandStill(entity, 2500)
                                TaskTurnPedToFaceEntity(entity, PlayerPedId(), 2500)
                                Citizen.Wait(1000)
                                if GetDistanceBetweenCoords(plCoords.x, plCoords.y, plCoords.z, npcCoords.x, npcCoords.y, npcCoords.z, true) < 2.5 then
                                    playCustomAnimPed(entity, "mech_butcher", "small_rat_give_player", 2500, 25)
                                    Citizen.Wait(3000)
                                    local randomMoney = math.random(0, Config.AimRobberyReward[1])
                                    local centValue = math.random(0,Config.AimRobberyReward[2])
                                    local rewardPrice = tonumber(randomMoney.."."..centValue)
                                    Citizen.InvokeNative(0xFD45175A6DFD7CE9, entity, PlayerPedId(), 0, -1.0, -1, 0)
                                    TriggerServerEvent("gum_jail:giveMoney", tonumber(rewardPrice))
                                    notify(true, ""..Config.Language[50]..""..rewardPrice.."$", 2500)
                                    Citizen.Wait(5000)
                                    delete_obj(entity)
                                end
                            else
                                TaskCombatPed(entity, PlayerPedId(), 0, 16)
                                Citizen.Wait(5000)
                            end
                        end
                    end
                end
            end
        end
        if not isTargetting and oldTarget then
            api.promptDelete(""..Config.Language[15].."", oldTarget)
            api.promptDelete(""..Config.Language[155].."", oldTarget)
            oldTarget = nil
        end
        if isTargetting and tgt1 == targetEntity and jailJob then
            optimalization = api.fpsTimer()
            local canCuff = false
            local promptGroup = PromptGetGroupIdForTargetEntity(tgt1)
            if not oldTarget then
                oldTarget = promptGroup
            end
            local _, wepHash = GetCurrentPedWeapon(PlayerPedId(), true, 0, true)
            if -1569615261 == wepHash and GetEntityHealth(tgt1) > 5 and not hogtied then
                canCuff = true
            end
            if canCuff then
                local mycoords = GetEntityCoords(PlayerPedId())
                local targetCoords = GetEntityCoords(tgt1)
                local distance = GetDistanceBetweenCoords(mycoords.x, mycoords.y, mycoords.z, targetCoords.x, targetCoords.y, targetCoords.z, true)
                if not Config.HandcuffsUsable then
                    api.createPrompt(""..Config.Language[15].."", Config.KeysButton[1], promptGroup, false)
                end
                api.createPrompt(""..Config.Language[155].."", Config.KeysButton[2], promptGroup, false)
                if not Config.HandcuffsUsable then
                    api.setPromptVisible(""..Config.Language[15].."", promptGroup, false)
                end
                api.setPromptVisible(""..Config.Language[155].."", promptGroup, false)
                local hogtied =  Citizen.InvokeNative(0x3AA24CCC0D451379, tgt1)
                if distance < 2.5 and not hogtied and GetEntityHealth(PlayerPedId()) > 0 then
                    if GetMount(tgt1) == 0 and GetMount(PlayerPedId()) == 0 and GetVehiclePedIsUsing(tgt1) == 0 then
                        if not Config.HandcuffsUsable then
                            api.setPromptVisible(""..Config.Language[15].."", promptGroup, true)
                        end
                        api.setPromptVisible(""..Config.Language[155].."", promptGroup, true)
                        if Citizen.InvokeNative(0x74E559B3BC910685, tgt1) == 1 then
                            if Citizen.InvokeNative(0x91AEF906BCA88877, 0, Config.KeysButton[2]) then
                                Citizen.InvokeNative(0xFCCC886EDE3C63EC, PlayerPedId(), 1, true)
                                TriggerServerEvent("gum_jail:setHolded", playerid)
                                Citizen.Wait(1000)
                            end
                        end
                        if not Config.HandcuffsUsable then
                            if Citizen.InvokeNative(0x91AEF906BCA88877, 0, Config.KeysButton[1]) then
                                Citizen.InvokeNative(0xFCCC886EDE3C63EC, PlayerPedId(), 1, true)
                                if Citizen.InvokeNative(0x74E559B3BC910685, tgt1) == 1 then
                                    TriggerServerEvent("gum_jail:setCuffed", playerid, false)
                                    if IsEntityPlayingAnim(PlayerPedId(), "veh_lo_res_idle", "train_troley_passenger_b_idle", 3) == 1 then
                                        TriggerServerEvent("gum_jail:setHolded", playerid)
                                    end
                                else
                                    TriggerServerEvent("gum_jail:setCuffed", playerid, true)
                                end
                                Citizen.Wait(1000)
                            end
                        end
                    end
                end
            end
        end
        local mycoords = GetEntityCoords(PlayerPedId())
        for a,b in pairs(cartTable) do
            local offset = GetOffsetFromEntityInWorldCoords(b, 0.0, -2.5, 0.0)
            local distance = GetDistanceBetweenCoords(mycoords.x, mycoords.y, mycoords.z, offset.x, offset.y, offset.z, true)
            if distance < 2.0 and jailJob then
                optimalization = api.fpsTimer()
                Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, offset.x, offset.y, offset.z-1.0, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 4.0, 255, 255, 100, 10, 0, 0, 2, 0, 0, 0, 0)
                api.getPrompt(promptData1, ""..Config.Language[1555].."")
                if api.getPromptButton(""..Config.Language[1].."", promptData1) and closestPlayer ~= -1 and closestDistance <= 1.0 then
                    TriggerServerEvent("gum_jail:addToCart", playerid, NetworkGetNetworkIdFromEntity(b))
                    Citizen.Wait(1000)
                end
                if api.getPromptButton(""..Config.Language[2].."", promptData1) then
                    takeFromCart(b)
                    Citizen.Wait(500)
                end
            end
        end
        for a,b in pairs(leverTable) do
            local leverCoord = GetEntityCoords(b)
            local distance = GetDistanceBetweenCoords(mycoords.x, mycoords.y, mycoords.z, leverCoord.x, leverCoord.y, leverCoord.z, true)
            if distance < 1.5 and jailJob then
                optimalization = api.fpsTimer()
                local x,y,z,r = 0,0,0,1.0
                for c,d in pairs(Config.hangPosition) do
                    local distance = GetDistanceBetweenCoords(mycoords.x, mycoords.y, mycoords.z, d[1], d[2], d[3], true)
                    if distance < 10 then
                        x,y,z = d[1], d[2], d[3]
                    end
                end
                if getIdHang(x,y,z,r) == 0 then
                    api.getPrompt(promptData2, ""..Config.Language[16].."")
                else
                    api.getPrompt(promptData2, ""..Config.Language[166]..""..getIdHang(x,y,z,r))
                end
                if api.getPromptButton(""..Config.Language[4].."", promptData2) then
                    local inRange = false
                    for c,d in pairs(Config.hangPosition) do
                        local distance = GetDistanceBetweenCoords(mycoords.x, mycoords.y, mycoords.z, d[1], d[2], d[3], true)
                        if distance < 10 then
                            inRange = d
                        end
                    end
                    if inRange == false then
                        notify(true, ""..Config.Language[17].."", 2000)
                    else
                        pushLever(inRange)
                    end
                    Citizen.Wait(1000)
                end
                if api.getPromptButton(""..Config.Language[3].."", promptData2) then
                    local inRange = false
                    for c,d in pairs(Config.hangPosition) do
                        local distance = GetDistanceBetweenCoords(mycoords.x, mycoords.y, mycoords.z, d[1], d[2], d[3], true)
                        if distance < 10 then
                            inRange = d
                        end
                    end
                    if inRange == false then
                        notify(true, ""..Config.Language[17].."", 2000)
                    else
                        prepareHang(inRange)
                    end
                    Citizen.Wait(1000)
                end
                for c,d in pairs(Config.hangPosition) do
                    if distance < 10 then
                        Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, d[1], d[2], d[3]-1.0, 0, 0, 0, 0, 0, 0, 1.5, 1.5, 3.0, 255, 255, 100, 10, 0, 0, 2, 0, 0, 0, 0)
                    end
                end
            end
        end
        Citizen.Wait(optimalization)
    end
end)

RegisterNetEvent('gum_jail:handcuff')
AddEventHandler('gum_jail:handcuff', function()
    local playerId, targetPed = getPlayerIdFromServer(1.5)
    if playerId ~= 0 then
        if Citizen.InvokeNative(0x74E559B3BC910685, targetPed) == 1 then
            TriggerServerEvent("gum_jail:setCuffed", playerId, false)
            if IsEntityPlayingAnim(PlayerPedId(), "veh_lo_res_idle", "train_troley_passenger_b_idle", 3) == 1 then
                TriggerServerEvent("gum_jail:setHolded", playerId)
            end
        else
            TriggerServerEvent("gum_jail:setCuffed", playerId, true)
        end
    end
end)

function getPlayerIdFromServer(distance)
    local playerId = 0
    local targetPed = 0
    local pCoords = GetEntityCoords(PlayerPedId())
    for a,b in pairs(GetActivePlayers()) do
        if GetPlayerPed(b) ~= PlayerPedId() then 
            local tCoords = GetEntityCoords(GetPlayerPed(b))
            local dist = GetDistanceBetweenCoords(pCoords.x, pCoords.y, pCoords.z, tCoords.x, tCoords.y, tCoords.z, false)
            if dist < distance then
                playerId = GetPlayerServerId(b)
                targetPed = GetPlayerPed(b)
            end
        end
    end
    return playerId, targetPed
end

local npcExist = false
local playerTable = {}
local makeRobbery = false
local completeMoney = 0
Citizen.CreateThread(function()
    Citizen.Wait(5000)
    if Config.Debug then
        TriggerServerEvent('gum_jail:checkInformationServer', GetPlayerServerId(PlayerId()))
    end
    while true do
        local mycoords = GetEntityCoords(PlayerPedId())
        workJob = nil
        for a,b in pairs(Config.cityWorkPosition) do
            for c,d in pairs(b) do
                if c == "cityCenter" then
                    local distance = GetDistanceBetweenCoords(mycoords.x, mycoords.y, mycoords.z, d[1], d[2], d[3], true)
                    if distance < d[4] then
                        workJob = a
                    end
                end
            end
        end
        if workCount > 0 or jailed then
            wearClothes()
        end
        for c,d in pairs(Config.shopRobbery) do
            local coords = GetEntityCoords(PlayerPedId())
            local distance = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, d.coord[1], d.coord[2], d.coord[3], true)
            if distance < 10 then
                createRobberyNpc(c, d.model, d.coord[1], d.coord[2], d.coord[3], d.coord[4])
            else
                if robberyNpc[c] ~= nil then
                    delete_obj(robberyNpc[c])
                    robberyNpc[c] = nil
                end
            end
        end
        Citizen.Wait(3000)
    end
end)

if Config.shopRobberies then
    local startedRobbery = nil
    Citizen.CreateThread(function()
        while true do
            local entity = getEntity(PlayerId())
            local pCoords = GetEntityCoords(PlayerPedId())
            local townHash = Citizen.InvokeNative(0x43AD8FC02B429D33, pCoords, 1)
            local _, wepHash = GetCurrentPedWeapon(PlayerPedId(), true, 0, true)
            if GetEntityHealth(entity) > 20 and Citizen.InvokeNative(0x705BE297EEBDB95D, wepHash) ~= false and wepHash ~= -1569615261 and GetEntityType(entity) == 1 and Citizen.InvokeNative(0x772A1969F649E902, GetEntityModel(entity)) == false and Citizen.InvokeNative(0x9A100F1CF4546629, entity) ~= 1 then
                for c,d in pairs(Config.shopRobbery) do
                    local nCoords = GetEntityCoords(getEntity(PlayerId()))
                    local distance = GetDistanceBetweenCoords(nCoords.x, nCoords.y, nCoords.z, d.coord[1], d.coord[2], d.coord[3], true)
                    if distance < 1 then
                        while not NetworkHasControlOfEntity(entity) do
                            NetworkRequestControlOfEntity(entity)
                            Wait(0)
                        end
                        local randomMinimalDolar = math.random(0, d.money.min[1])
                        local randomMinimalCent = math.random(0, d.money.min[2])

                        local randomMaxDolar = math.random(0, d.money.max[1])
                        local randomMaxCent = math.random(0, d.money.max[2])
                        local randomValues = randomReal(tonumber(randomMinimalDolar.."."..randomMinimalCent), tonumber(randomMaxDolar.."."..randomMaxCent))
                        if IsEntityPlayingAnim(entity, "mech_loco_f@generic@reaction@handsup@unarmed@normal","loop", 3) == false then
                            playCustomAnimPed(entity, "mech_loco_f@generic@reaction@handsup@unarmed@normal", "loop", -1, 1);
                        end
                        if completeMoney < d.maxMoney then
                            startedRobbery = entity
                            completeMoney = completeMoney + tonumber(string.format("%.2f", tonumber(randomValues)))
                            TriggerServerEvent("gum_jail:robberyGiveMoney", c, tonumber(string.format("%.2f", tonumber(randomValues))))
                            local random = math.random(1, 100)
                            if d.fireChance >= random and completeMoney ~= 0 then
                                FreezeEntityPosition(entity, false)
                                SetBlockingOfNonTemporaryEvents(entity,false)
                                ClearPedTasks(entity)
                                Citizen.Wait(500)
                                Citizen.InvokeNative(0x5E3BDDBCB83F3D84, entity, GetHashKey("WEAPON_SHOTGUN_REPEATING"), 0, false, true, true, 1.0)
                                for i=1, 10 do
                                    SetCurrentPedWeapon(entity, GetHashKey("WEAPON_SHOTGUN_REPEATING"), true)
                                    TaskShootAtEntity(entity, PlayerPedId(), 2000, GetHashKey("FIRING_PATTERN_FROM_GROUND"))
                                    Citizen.Wait(300)
                                end
                                TriggerServerEvent("gum_jail:robberyBlock", true)
                                completeMoney = 0
                                startedRobbery = nil
                            end
                        else
                            TriggerServerEvent("gum_jail:robberyBlock", true)
                            completeMoney = 0
                        end
                    end
                end
            end
            if entity == 0 and startedRobbery ~= nil then
                TriggerServerEvent("gum_jail:robberyBlock", false)
                completeMoney = 0
                startedRobbery = nil
            end
            Citizen.Wait(Config.shopRobberyTime)
        end
    end)
end



function randomReal(a, b)
    return a + (b - a) * math.random()
end

function createRobberyNpc(count, model, x,y,z,h)
    if robberyNpc[count] == nil then
        Citizen.CreateThread(function()
            local npcSpawn = model
            while not HasModelLoaded(GetHashKey(npcSpawn)) do
                Wait(0)
                modelrequest( GetHashKey(npcSpawn) )
            end
            if Citizen.InvokeNative(0x083961498679DC9F, x,y,z, 1.0) == false then
                local npcSpawnCode = CreatePed(GetHashKey(npcSpawn), x, y, z, h, true, true, 0, 0)
                while not DoesEntityExist(npcSpawnCode) do
                    Wait(0)
                end
                Citizen.InvokeNative(0x283978A15512B2FE, npcSpawnCode, true)
                FreezeEntityPosition(npcSpawnCode, true)
                SetEntityAsMissionEntity(npcSpawnCode, true, true)
                SetModelAsNoLongerNeeded(GetHashKey(npcSpawnCode))
                ClearPedEnvDirt(npcSpawnCode)
                SetBlockingOfNonTemporaryEvents(npcSpawnCode,true)
                ClearPedDamageDecalByZone(npcSpawnCode ,10 ,"ALL")
                ClearPedBloodDamage(npcSpawnCode)
                robberyNpc[count] = npcSpawnCode
            end
        end)
    end
end

Citizen.CreateThread(function()
    while true do
        local optimize = 2000
        if jailed and missionStarted then
            optimize = 1000
            escapeTimer = escapeTimer+1
            if Config.OnlyCrounchEscape then
                if escapeTimer > Config.TimeForEscape or not Citizen.InvokeNative(0xD5FE956C70FF370B, PlayerPedId()) then
                    SetEntityCoords(PlayerPedId(), 2948.009765625,-1234.6861572265625,41.45576095581055,-1.0)
                    TriggerServerEvent("gum_jail:updateJail", jailTime*2)
                    missionStarted = false
                    escapePoints = 1
                    timeForEscape = 0
                    if Config.OnlyOneTime then
                        TriggerServerEvent("gum_jail:oneTime")
                        canEscapeMission = false
                    end
                end
            else
                if escapeTimer > Config.TimeForEscape then
                    SetEntityCoords(PlayerPedId(), 2948.009765625,-1234.6861572265625,41.45576095581055,-1.0)
                    TriggerServerEvent("gum_jail:updateJail", jailTime*2)
                    missionStarted = false
                    escapePoints = 1
                    timeForEscape = 0
                    if Config.OnlyOneTime then
                        TriggerServerEvent("gum_jail:oneTime")
                        canEscapeMission = false
                    end
                end
            end
        end
        Citizen.Wait(optimize)
    end
end)

Citizen.CreateThread(function()
    while true do
        local timer = 5000
        if jailed then
            timer = 1000
            if jailTime > 0 then
                jailTime = jailTime-1
            else
                timer = 10000
                notify(true, ""..Config.Language[18].."", 2000)
            end
        end
        if inEscapeState and Config.EscapeProtectClothe then
            timer = 1000
            inEscapeStateTime = inEscapeStateTime+1
            wearClothes(true)
            if inEscapeStateTime > Config.TimeAfterEscape*60 then
                TriggerServerEvent("gum_jail:endJail")
                inEscapeState = false
                notify(true, ""..Config.Language[19].."", 5000)
            end
        end
        Citizen.Wait(timer)
    end
end)

RegisterNetEvent("gum_jail:jailWork")
AddEventHandler("gum_jail:jailWork", function(id)
    if workJob ~= nil then
        local workCountNow = 0
        local timeForWork = 0
        for a,b in pairs(Config.cityWorkPosition) do
            if a == workJob then
                for c,d in pairs(b) do
                    if c == "workTime" then
                        timeForWork = d
                    end
                    if c ~= "cityCenter" and c ~= "wearClothe" and c ~= "spotForSpawn" and c ~= "workTime" then
                        workCountNow = workCountNow + 1
                    end
                end
            end
        end
        api.getInput( ""..Config.Language[20].."", ""..Config.Language[21]..""..workCountNow.." | 1 = "..timeForWork.."s", function(cb)
            local workCallCount = tonumber(cb)
            if workCallCount ~= nil and workCallCount > 0 and workCallCount <= workCountNow then
                TriggerServerEvent("gum_jail:jailWork", id, workCallCount, workJob, timeForWork)
            end
        end)
    end
end)
local blipCarts = {}
local blipBoats = {}
RegisterNetEvent("gum_jail:sendJob")
AddEventHandler("gum_jail:sendJob", function(job)
    if type(job) == "table" then
        for c,d in pairs(job) do
            for a,b in pairs(Config.jailJobs) do
                if b == d.job then
                    jailJob = true
                end
            end
        end
    else
        for a,b in pairs(Config.jailJobs) do
            if b == job then
                jailJob = true
            end
        end
    end
    if jailJob then
        loadBlips()
    end
end)
function loadBlips()
    for a,b in pairs(Config.CartSpawn) do
        if b.blipSprite ~= 0 and Config.TakeCart then
            if blipCarts[a] ~= nil then
                RemoveBlip(blipCarts[a])
            end
            blipCarts[a] = N_0x554d9d53f696d002(1664425300, b.coords[1], b.coords[2], b.coords[3])
            SetBlipSprite(blipCarts[a], b.blipSprite, 1)
            SetBlipScale(blipCarts[a], 1.5)
            Citizen.InvokeNative(0x9CB1A1623062F402, blipCarts[a], b.blipName)
        end
    end
    for a,b in pairs(Config.BoatSpawn) do
        if b.blipSprite ~= 0 and Config.TakeBoat then
            if blipBoats[a] ~= nil then
                RemoveBlip(blipBoats[a])
            end
            blipBoats[a] = N_0x554d9d53f696d002(1664425300, b.coords[1], b.coords[2], b.coords[3])
            SetBlipSprite(blipBoats[a], b.blipSprite, 1)
            SetBlipScale(blipBoats[a], 1.5)
            Citizen.InvokeNative(0x9CB1A1623062F402, blipBoats[a], b.blipName)
        end
    end
end
RegisterNetEvent("gum_jail:setWork")
AddEventHandler("gum_jail:setWork", function(count, city, time)
    for a,b in pairs(Config.cityWorkPosition) do
        if a == city then
            for c,d in pairs(b) do
                if c == "spotForSpawn" then
                    workCount = tonumber(count)
                    workCity = city
                    workTime = time
                    SetEntityCoords(PlayerPedId(), d[1], d[2], d[3])
                    SetEntityHeading(PlayerPedId(), d[4])
               end
                if c == "wearClothe" then
                    wearClothes()
                end
            end
        end
    end
end)

RegisterNetEvent("gum_jail:sendToJail")
AddEventHandler("gum_jail:sendToJail", function(time)
    jailTime = tonumber(time)
    if workCount > 0 then
        return false
    end
    jailed = true
    FreezeEntityPosition(PlayerPedId(), true)
	DoScreenFadeOut(1000)
    local npcSpawn = "s_m_m_dispatchpolice_01"
    while not HasModelLoaded(GetHashKey(npcSpawn)) do
        Wait(0)
        modelrequest( GetHashKey(npcSpawn) )
    end
    local npcSpawnCode1 = CreatePed(GetHashKey(npcSpawn), 3328.726318359375,-703.2338256835938,43.16811752319336,219.82424926757812, false, false, 0, 0)
    while not DoesEntityExist(npcSpawnCode1) do
        Wait(0)
    end
    Citizen.InvokeNative(0x283978A15512B2FE, npcSpawnCode1, true)
    SetPedAsGroupMember(npcSpawnCode1, GetPedGroupIndex(PlayerPedId()))
    SetBlockingOfNonTemporaryEvents(npcSpawnCode1,true)
    FreezeEntityPosition(npcSpawnCode1, true)
    SetEntityInvincible(npcSpawnCode1, true)
    TaskStandStill(npcSpawnCode1, -1)
    SetEntityAsMissionEntity(npcSpawnCode1, true, true)
    SetModelAsNoLongerNeeded(GetHashKey(npcSpawnCode1))
    ClearPedEnvDirt(npcSpawnCode1)
    ClearPedDamageDecalByZone(npcSpawnCode1 ,10 ,"ALL")
    ClearPedBloodDamage(npcSpawnCode1)


    local npcSpawn = "s_m_m_dispatchpolice_01"
    while not HasModelLoaded(GetHashKey(npcSpawn)) do
        Wait(0)
        modelrequest( GetHashKey(npcSpawn) )
    end
    local npcSpawnCode2 = CreatePed(GetHashKey(npcSpawn), 3330.108154296875,-704.841552734375,43.16811752319336,38.82979583740234, false, false, 0, 0)
    while not DoesEntityExist(npcSpawnCode2) do
        Wait(0)
    end

    Citizen.InvokeNative(0x283978A15512B2FE, npcSpawnCode2, true)
    SetPedAsGroupMember(npcSpawnCode2, GetPedGroupIndex(PlayerPedId()))
    SetBlockingOfNonTemporaryEvents(npcSpawnCode2,true)
    FreezeEntityPosition(npcSpawnCode2, true)
    SetEntityInvincible(npcSpawnCode2, true)
    TaskStandStill(npcSpawnCode2, -1)
    SetEntityAsMissionEntity(npcSpawnCode2, true, true)
    SetModelAsNoLongerNeeded(GetHashKey(npcSpawnCode2))
    ClearPedEnvDirt(npcSpawnCode2)
    ClearPedDamageDecalByZone(npcSpawnCode2 ,10 ,"ALL")
    ClearPedBloodDamage(npcSpawnCode2)
    Citizen.Wait(1800)
    SetEntityCoords(PlayerPedId(), 3329.345458984375,-704.2785034179688,44.16802215576172-1.0)
    SetEntityHeading(PlayerPedId(), 308.3046569824219)
    Wait(500)
    TriggerServerEvent('rsg-prison:server:SaveJailItems')

    DoScreenFadeIn(1000)
    Citizen.Wait(1000)
    ExecuteCommand(""..Config.Language[22].."")
    Citizen.Wait(5000)
    ExecuteCommand("do 1/5")
    Citizen.Wait(1000)
    ExecuteCommand("do 2/5")
    Citizen.Wait(1000)
    ExecuteCommand("do 3/5")
    Citizen.Wait(1000)
    ExecuteCommand("do 4/5")
    Citizen.Wait(1000)
    ExecuteCommand("do 5/5")
    Citizen.Wait(1000)
    RemoveAllWeapons()
    ExecuteCommand(""..Config.Language[222].."")
    Citizen.Wait(5000)
    ExecuteCommand("do 1/5")
    Citizen.Wait(1000)
    ExecuteCommand("do 2/5")
    Citizen.Wait(1000)
    ExecuteCommand("do 3/5")
    Citizen.Wait(1000)
    ExecuteCommand("do 4/5")
    Citizen.Wait(1000)
    ExecuteCommand("do 5/5")
    Citizen.Wait(1000)
    wearClothes()
    ExecuteCommand(""..Config.Language[2222].."")
    Citizen.Wait(1000)
    DoScreenFadeOut(1000)
    Citizen.Wait(1000)
    SetEntityCoords(PlayerPedId(), 3333.55712890625,-700.4973754882812,44.05637741088867-1.0)
    SetEntityHeading(PlayerPedId(), 313.31640625)
    Citizen.Wait(1000)
    DoScreenFadeIn(1000)
    DeleteEntity(npcSpawnCode1)
    DeleteEntity(npcSpawnCode2)
    FreezeEntityPosition(PlayerPedId(), false)
    if Config.EscapeMissionEnabled then
         canEscapeMission = true
    end
end)

RegisterNetEvent("gum_jail:sendToJailLogin")
AddEventHandler("gum_jail:sendToJailLogin", function(time, canEscapem)
    Citizen.Wait(10000)
    if Config.OnlyOneTime then
        if tonumber(canEscapem) == 0 then
            jailTime = tonumber(time)
            if workCount > 0 then
                return false
            end
            canEscapeMission = true
            jailed = true
            SetEntityCoords(PlayerPedId(), 3335.667236328125,-698.4041137695312,43.94405364990234-1.0)
        elseif tonumber(canEscapem) == 1 then
            jailTime = tonumber(time)
            if workCount > 0 then
                return false
            end
            canEscapeMission = false
            jailed = true
            SetEntityCoords(PlayerPedId(), 3335.667236328125,-698.4041137695312,43.94405364990234-1.0)
        elseif tonumber(canEscapem) == 2 and Config.EscapeProtectClothe then
            inEscapeState = true
        end
    else
        canEscapeMission = true
    end
end)

RegisterNetEvent('gum_jail:wearClothe')
AddEventHandler('gum_jail:wearClothe', function()
    wearClothes(true)    
end)

function wearClothes(state)
    if state == nil then
        RemoveAllWeapons()
    end
    local ped = PlayerPedId()
    Citizen.InvokeNative(0xD710A5007C2AC539, ped, 0x18729F39, 0)
    Citizen.InvokeNative(0xD710A5007C2AC539, ped, 0x777EC6EF, 0)
    Citizen.InvokeNative(0xD710A5007C2AC539, ped, 0x3107499B, 0)
    Citizen.InvokeNative(0xD710A5007C2AC539, ped, 0x1D4C528A, 0)
    Citizen.InvokeNative(0xD710A5007C2AC539, ped, 0x79D7DF96, 0)
    Citizen.InvokeNative(0xD710A5007C2AC539, ped, 0x94504D26, 0)
    Citizen.InvokeNative(0xD710A5007C2AC539, ped, 0xFAE9107F, 0)
    Citizen.InvokeNative(0xD710A5007C2AC539, ped, 0xA6D134C6, 0)
    Citizen.InvokeNative(0xD710A5007C2AC539, ped, 0xB6B6122D, 0)
    Citizen.InvokeNative(0xD710A5007C2AC539, ped, 0x9B2C8B89, 0)
    Citizen.InvokeNative(0xD710A5007C2AC539, ped, 0x91CE9B20, 0)
    Citizen.InvokeNative(0xD710A5007C2AC539, ped, 0x7BC10759, 0)
    Citizen.InvokeNative(0xD710A5007C2AC539, ped, 0xF16A1D23, 0)
    Citizen.InvokeNative(0xD710A5007C2AC539, ped, 0x7A6BBD0B, 0)
    Citizen.InvokeNative(0xD710A5007C2AC539, ped, 0xEABE0032, 0)
    Citizen.InvokeNative(0xD710A5007C2AC539, ped, 0x3C1A74CD, 0)
    Citizen.InvokeNative(0xD710A5007C2AC539, ped, 0x83887E88, 0)
    Citizen.InvokeNative(0xD710A5007C2AC539, ped, 0xAF14310B, 0)
    Citizen.InvokeNative(0xD710A5007C2AC539, ped, 0xE06D30CE, 0)
    Citizen.InvokeNative(0xD710A5007C2AC539, ped, 0x662AC34, 0)
    Citizen.InvokeNative(0xD710A5007C2AC539, ped, 0x485EE834, 0)
    Citizen.InvokeNative(0xD710A5007C2AC539, ped, 0x877A2CF7, 0)
    Citizen.InvokeNative(0xD710A5007C2AC539, ped, 0xA0E3AB7F, 0)
    Citizen.InvokeNative(0xD710A5007C2AC539, ped, 0x2026C46D, 0)
    Citizen.InvokeNative(0xD710A5007C2AC539, ped, 0x7A96FACA, 0)
    Citizen.InvokeNative(0xD710A5007C2AC539, ped, 0x7505EF42, 0)
    Citizen.InvokeNative(0xD710A5007C2AC539, ped, 0x7505EF42, 0)
    Citizen.InvokeNative(0xD710A5007C2AC539, ped, 0x5FC29285, 0)
    Citizen.InvokeNative(0xD710A5007C2AC539, ped, 0x9925C067, 0)
    Citizen.InvokeNative(0xD710A5007C2AC539, ped, 0x5E47CA6, 0)
    if IsPedMale(ped) then
        Citizen.InvokeNative(0xD3A7B003ED343FD9, ped, 0x5BA76CCF, true, true, true)
        Citizen.InvokeNative(0xD3A7B003ED343FD9, ped, 0x216612F0, true, true, true)
        Citizen.InvokeNative(0xD3A7B003ED343FD9, ped, 0x1CCEE58D, true, true, true)
    else
        Citizen.InvokeNative(0xD3A7B003ED343FD9, ped, 0x6AB27695, true, true, true)
        Citizen.InvokeNative(0xD3A7B003ED343FD9, ped, 0x75BC0CF5, true, true, true)
        Citizen.InvokeNative(0xD3A7B003ED343FD9, ped, 0x14683CDF, true, true, true)
    end 
end

function RemoveAllWeapons()
    local allWeapons = {}
    table.insert(allWeapons, "weapon_melee_knife_trader")
    table.insert(allWeapons, "WEAPON_MELEE_KNIFE")
    table.insert(allWeapons, "WEAPON_MELEE_KNIFE_JAWBONE")
    table.insert(allWeapons, "WEAPON_MELEE_MACHETE")
    table.insert(allWeapons, "WEAPON_MELEE_CLEAVER")
    table.insert(allWeapons, "WEAPON_MELEE_HATCHET_HUNTER")
    table.insert(allWeapons, "weapon_melee_machete_collector")
    table.insert(allWeapons, "WEAPON_BOW_IMPROVED")
    table.insert(allWeapons, "WEAPON_BOW")
    table.insert(allWeapons, "weapon_rifle_elephant")
    table.insert(allWeapons, "WEAPON_RIFLE_VARMINT")
    table.insert(allWeapons, "WEAPON_SNIPERRIFLE_ROLLINGBLOCK")
    table.insert(allWeapons, "WEAPON_SNIPERRIFLE_CARCANO")
    table.insert(allWeapons, "WEAPON_RIFLE_SPRINGFIELD")
    table.insert(allWeapons, "WEAPON_RIFLE_BOLTACTION")
    table.insert(allWeapons, "WEAPON_REPEATER_WINCHESTER")
    table.insert(allWeapons, "WEAPON_REPEATER_HENRY")
    table.insert(allWeapons, "WEAPON_REPEATER_EVANS")
    table.insert(allWeapons, "WEAPON_REPEATER_CARBINE")
    table.insert(allWeapons, "WEAPON_PISTOL_SEMIAUTO")
    table.insert(allWeapons, "WEAPON_PISTOL_MAUSER")
    table.insert(allWeapons, "WEAPON_PISTOL_VOLCANIC")
    table.insert(allWeapons, "WEAPON_PISTOL_M1899")
    table.insert(allWeapons, "WEAPON_REVOLVER_SCHOFIELD")
    table.insert(allWeapons, "WEAPON_REVOLVER_LEMAT")
    table.insert(allWeapons, "WEAPON_REVOLVER_DOUBLEACTION")
    table.insert(allWeapons, "WEAPON_REVOLVER_CATTLEMAN")
    table.insert(allWeapons, "weapon_revolver_navy")
    table.insert(allWeapons, "WEAPON_THROWN_TOMAHAWK")
    table.insert(allWeapons, "WEAPON_THROWN_THROWING_KNIVES")
    table.insert(allWeapons, "weapon_thrown_poisonbottle")
    table.insert(allWeapons, "weapon_thrown_bolas")
    table.insert(allWeapons, "weapon_thrown_dynamite")
    table.insert(allWeapons, "weapon_thrown_molotov")
    table.insert(allWeapons, "WEAPON_SHOTGUN_SEMIAUTO")
    table.insert(allWeapons, "WEAPON_SHOTGUN_SAWEDOFF")
    table.insert(allWeapons, "WEAPON_SHOTGUN_REPEATING")
    table.insert(allWeapons, "WEAPON_SHOTGUN_PUMP")
    table.insert(allWeapons, "WEAPON_SHOTGUN_DOUBLEBARREL")
    table.insert(allWeapons, "WEAPON_LASSO")
    table.insert(allWeapons, "weapon_lasso_reinforced")
    table.insert(allWeapons, "weapon_kit_binoculars_improved")
    table.insert(allWeapons, "weapon_kit_binoculars")
    table.insert(allWeapons, "WEAPON_FISHINGROD")
    table.insert(allWeapons, "WEAPON_KIT_CAMERA")
    table.insert(allWeapons, "weapon_kit_camera_advanced")
    table.insert(allWeapons, "weapon_melee_lantern")
    table.insert(allWeapons, "weapon_melee_davy_lantern")
    table.insert(allWeapons, "WEAPON_MELEE_LANTERN_HALLOWEEN")
    table.insert(allWeapons, "WEAPON_MELEE_MACHETE_HORROR")
    table.insert(allWeapons, "WEAPON_MELEE_KNIFE_HORROR")
    table.insert(allWeapons, "WEAPON_MELEE_HAMMER")
    table.insert(allWeapons, "WEAPON_SHOTGUN_DOUBLEBARREL_EXOTIC")
    table.insert(allWeapons, "WEAPON_REVOLVER_CATTLEMAN_MEXICAN")
    for k,v in pairs(allWeapons) do
		RemoveWeaponFromPed(PlayerPedId(), GetHashKey(v))
	end
end

Citizen.CreateThread(function()
    while true do
        local optimize = 1000
        local mycoords = GetEntityCoords(PlayerPedId())
        if workCount > 0 then
            optimize = 0
            for a,b in pairs(Config.cityWorkPosition) do
                for c,d in pairs(b) do
                    local inCenterWork = false
                    if c == "cityCenter" and c ~= "wearClothe" and c ~= "spotForSpawn" then
                        local distance = GetDistanceBetweenCoords(mycoords.x, mycoords.y, mycoords.z, d[1], d[2], d[3], true)
                        if distance < d[4] then
                            Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153,d[1], d[2], d[3]-4.0, 0, 0, 0, 0, 0, 0, 2*d[4], 2*d[4], 10.0, 255, 255, 100, 30, 0, 0, 2, 0, 0, 0, 0)
                        end
                    end
                    if c ~= "cityCenter" and c ~= "wearClothe" and c ~= "spotForSpawn" and c ~= "workTime" then
                        Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153,d[1], d[2], d[3]-1.0, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 0.2, 255, 255, 100, 30, 0, 0, 2, 0, 0, 0, 0)
                        local distance = GetDistanceBetweenCoords(mycoords.x, mycoords.y, mycoords.z, d[1], d[2], d[3], true)
                        if distance < 1.0 then
                            local canWork = true
                            for a,b in pairs(workRepeatTable) do
                                if c == b then
                                    canWork = false
                                end
                            end
                            if canWork ~= false then
                                api.getPrompt(promptData3, ""..Config.Language[23]..""..workCount)
                                if api.getPromptButton(""..Config.Language[5].."", promptData3) then
                                    workDown(c)
                                    Citizen.Wait(1000)
                                end
                            end
                        end
                    end
                end
            end
        end
        if Config.TakeCart and jailJob then
            for a,b in pairs(Config.CartSpawn) do
                if GetVehiclePedIsIn(PlayerPedId(), true) == 0 then
                    local distance = GetDistanceBetweenCoords(mycoords.x, mycoords.y, mycoords.z, b.coords[1], b.coords[2], b.coords[3], false)
                    if distance < 2.0 then
                        optimize = 0
                        api.getPrompt(promptData4, ""..Config.Language[54].."")
                        if api.getPromptButton(""..Config.Language[6].."", promptData4) then
                            createCart(b.spawnPosition[1], b.spawnPosition[2], b.spawnPosition[3], b.spawnPosition[4])
                            Citizen.Wait(1000)
                        end
                    end
                else
                    local distance = GetDistanceBetweenCoords(mycoords.x, mycoords.y, mycoords.z, b.spawnPosition[1], b.spawnPosition[2], b.spawnPosition[3], false)
                    if distance < 4.0 and GetEntityModel(GetVehiclePedIsIn(PlayerPedId(), true)) == GetHashKey(Config.CartModel) then
                        optimize = 0
                        api.getPrompt(promptData5, ""..Config.Language[55].."")
                        if api.getPromptButton(""..Config.Language[7].."", promptData5) then
                            DeleteEntity(GetVehiclePedIsIn(PlayerPedId(), true))
                            Citizen.Wait(1000)
                        end
                    end
                end
            end
        end
        if Config.TakeBoat and jailJob then
            for a,b in pairs(Config.BoatSpawn) do
                if GetVehiclePedIsIn(PlayerPedId(), true) == 0 then
                    local distance = GetDistanceBetweenCoords(mycoords.x, mycoords.y, mycoords.z, b.coords[1], b.coords[2], b.coords[3], false)
                    if distance < 2.0 then
                        optimize = 0
                        api.getPrompt(promptData4, ""..Config.Language[24].."")
                        if api.getPromptButton(""..Config.Language[6].."", promptData4) then
                            createBoat(b.spawnPosition[1], b.spawnPosition[2], b.spawnPosition[3], b.spawnPosition[4])
                            Citizen.Wait(1000)
                        end
                    end
                else
                    local distance = GetDistanceBetweenCoords(mycoords.x, mycoords.y, mycoords.z,b.spawnPosition[1], b.spawnPosition[2], b.spawnPosition[3], false)
                    if distance < 4.0 and GetEntityModel(GetVehiclePedIsIn(PlayerPedId(), true)) == GetHashKey(Config.BoatModel) then
                        optimize = 0
                        api.getPrompt(promptData5, ""..Config.Language[25].."")
                        if api.getPromptButton(""..Config.Language[7].."", promptData5) then
                            DeleteEntity(GetVehiclePedIsIn(PlayerPedId(), true))
                            SetEntityCoords(PlayerPedId(), b.coords[1], b.coords[2], b.coords[3])
                            Citizen.Wait(1000)
                        end
                    end
                end
            end
        end

        if canEscapeMission and Config.EscapeMissionEnabled then
            for a,b in pairs(prisonerNpc) do
                local coords = GetEntityCoords(b)
                local distance = GetDistanceBetweenCoords(mycoords.x, mycoords.y, mycoords.z, coords.x, coords.y, coords.z, true)
                if distance < 1.2 and jailed then
                    optimize = 0
                    for c,d in pairs(Config.EscapeMission) do
                        if a == c then
                            if questionData[a] == nil then
                                questionData[a] = 1
                            end
                            api.getPrompt(promptData9, d.interactions[questionData[a]][1])
                            if api.getPromptButton(""..Config.Language[11].."", promptData9) then
                                if questionData[a] >= #d.interactions then
                                    questionData[a] = 0
                                else
                                    questionData[a] = questionData[a]+1
                                end
                                Citizen.Wait(500)
                            end
                            if api.getPromptButton(""..Config.Language[12].."", promptData9) then
                                if questionData[a] == 0 and questData[a] == nil then
                                    questData[a] = false
                                    notify(true, d.interactions[questionData[a]][2], 2000)
                                    notify(true, ""..Config.Language[26]..""..d.interactions[questionData[a]][3], 2000)
                                elseif questionData[a] == 0 and questData[a] == true then
                                    notify(true, d.idea, 2000)
                                elseif questionData[a] >= 1 and questData[a] == nil then
                                    notify(true, d.interactions[questionData[a]][2], 2000)
                                elseif questionData[a] == 0 and questData[a] == false then
                                    notify(true, ""..Config.Language[26]..""..d.interactions[questionData[a]][3], 2000)
                                end
                                Citizen.Wait(500)
                            end
                        end
                    end
                end
            end
            for a,b in pairs(Config.EscapeMission) do
                for c,d in pairs(questData) do
                    if c == a and questData[a] == false then
                        local distance = GetDistanceBetweenCoords(mycoords.x, mycoords.y, mycoords.z, b.interactions[0][4],b.interactions[0][5],b.interactions[0][6], true)
                        if distance < 1.2 then
                            api.getPrompt(promptData10, ""..Config.Language[27]..""..b.interactions[0][3])
                            if api.getPromptButton(""..Config.Language[13].."", promptData10) then
                                local random = math.random(1, 100)
                                if Config.SearchChange < random then
                                    questData[a] = true
                                    notify(true, ""..Config.Language[28]..""..b.interactions[0][3]..".", 2000)
                                else
                                    notify(true, ""..Config.Language[29].."", 2000)
                                end
                                Citizen.Wait(1000)
                            end
                            
                        end
                    end
                end
            end
        end
        for a,b in pairs(npcsMan) do
            local coords = GetEntityCoords(b)
            local distance = GetDistanceBetweenCoords(mycoords.x, mycoords.y, mycoords.z, coords.x, coords.y, coords.z, true)
            if distance < 1.2 and jailJob then
                optimize = 0
                if getId() == 0 then
                    api.getPrompt(promptData6, ""..Config.Language[299].."")
                else
                    api.getPrompt(promptData6, ""..Config.Language[2999]..""..getId())
                end
                Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, Config.positionForJail[1], Config.positionForJail[2], Config.positionForJail[3]-1.0, 0, 0, 0, 0, 0, 0, 2*Config.positionForJail[4], 2*Config.positionForJail[4], 1.0, 255, 255, 100, 10, 0, 0, 2, 0, 0, 0, 0)
                if getId() ~= 0 then
                    if api.getPromptButton(""..Config.Language[8].."", promptData6) then
                        api.getInput( ""..Config.Language[20].."", ""..Config.Language[30].."", function(cb)
                            local time = tonumber(cb)
                            if time ~= nil and time > 0 then
                                sendToJail(time)
                            end
                        end)
                        Citizen.Wait(1000)
                    end
                else
                    if api.getPromptButton(""..Config.Language[8].."", promptData6) then
                        Citizen.Wait(1000)
                    end
                end
            elseif distance < 1.2 and jailed then
                optimize = 0
                if math.floor(jailTime/60) > 1 then
                    api.getPrompt(promptData7, ""..Config.Language[31]..""..math.floor(jailTime/60).."m")
                elseif math.floor(jailTime) == 0 then
                    api.getPrompt(promptData7, ""..Config.Language[32].."")
                else
                    api.getPrompt(promptData7, ""..Config.Language[33].."")
                end
                if api.getPromptButton(""..Config.Language[9].."", promptData7) then
                    if jailTime <= 0 then
                        releaseMeFunction()
                        Citizen.Wait(1000)
                    else
                        notify(true, ""..Config.Language[34].."", 2000)
                    end
                    Citizen.Wait(1000)
                end
            end
        end
        if jailed == true then
            local inCenter = false
            for a,b in pairs(Config.jailCenter) do
                local distance = GetDistanceBetweenCoords(mycoords.x, mycoords.y, mycoords.z,b[1], b[2],b[3], false)
                if distance < b[4] then
                    inCenter = true
                    optimize = 0
                    Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153,b[1],b[2],b[3]-5.0, 0, 0, 0, 0, 0, 0, 2*b[4], 2*b[4], 7.0, 255, 100, 100, 20, 0, 0, 2, 0, 0, 0, 0)
                end
            end
            if inCenter == false and not missionStarted then
                SetEntityCoords(PlayerPedId(), Config.jailCenter[1][1], Config.jailCenter[1][2], Config.jailCenter[1][3])
                if GetEntityHealth(PlayerPedId()) < 5 then
                    jailTime = 2*jailTime
                    TriggerServerEvent("gum_jail:updateJail", jailTime)
                end
            end
    
            for a,b in pairs(Config.jobWork) do
                local distance = GetDistanceBetweenCoords(mycoords.x, mycoords.y, mycoords.z, b.coords[1], b.coords[2], b.coords[3], false)
                if distance < 30.0 then
                    optimize = 0
                    Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153, b.coords[1], b.coords[2], b.coords[3]-1.0, 0, 0, 0, 0, 0, 0, 2*1.0, 2*1.0, 0.7, 255, 100, 100, 10, 0, 0, 2, 0, 0, 0, 0)
                    if distance < 1.0 then
                        api.getPrompt(promptData8, ""..b.name)
                        if api.getPromptButton(""..Config.Language[10].."", promptData8) then
                            startWork(b.timedown, b.animation, b.workTime, b.propBone, b.coordProps)
                            Citizen.Wait(1000)
                        end
                    end
                end
            end
        end
        if workCount > 0 then
            local inCenterWork = false
            for a,b in pairs(Config.cityWorkPosition) do
                if workCity == a then
                    for c,d in pairs(b) do
                        if c == "cityCenter" then
                            local distance = GetDistanceBetweenCoords(mycoords.x, mycoords.y, mycoords.z, d[1], d[2], d[3], false)
                            if distance < d[4] then
                                inCenterWork = true
                                Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153,d[1], d[2], d[3]-4.0, 0, 0, 0, 0, 0, 0, 2*d[4], 2*d[4], 10.0, 255, 255, 100, 30, 0, 0, 2, 0, 0, 0, 0)
                            end
                        end
                    end
                end
            end
            for a,b in pairs(Config.cityWorkPosition) do
                if workCity == a then
                    for c,d in pairs(b) do
                        if inCenterWork == false and c == "spotForSpawn" then
                            SetEntityCoords(PlayerPedId(), d[1], d[2], d[3])
                            workCount = 2*workCount
                            if workCount >= #b then
                                workCount = #b
                            end
                            TriggerServerEvent("gum_jail:updateWorkCount", workCount)
                            Citizen.Wait(100)
                        end
                    end
                end
            end
        end
        Citizen.Wait(optimize)
    end
end)

function notify(bool, subtext_text, duration)
    SendNUIMessage({type = "notify",status = bool,text = subtext_text})
    Citizen.Wait(tonumber(duration))
    deleteNotify(false)
end

function deleteNotify(bool)
    SendNUIMessage({type = "notify",status = bool})
end

function releaseMeFunction()
    TriggerServerEvent("gum_jail:endJail")
    jailed = false
    jailTime = 0
    FreezeEntityPosition(PlayerPedId(), true)
	DoScreenFadeOut(1000)
    local npcSpawn = "s_m_m_dispatchpolice_01"
    while not HasModelLoaded(GetHashKey(npcSpawn)) do
        Wait(0)
        modelrequest( GetHashKey(npcSpawn) )
    end
    local npcSpawnCode1 = CreatePed(GetHashKey(npcSpawn), 3328.726318359375,-703.2338256835938,43.16811752319336,219.82424926757812, false, false, 0, 0)
    while not DoesEntityExist(npcSpawnCode1) do
        Wait(0)
    end
    Citizen.InvokeNative(0x283978A15512B2FE, npcSpawnCode1, true)
    SetPedAsGroupMember(npcSpawnCode1, GetPedGroupIndex(PlayerPedId()))
    SetBlockingOfNonTemporaryEvents(npcSpawnCode1,true)
    FreezeEntityPosition(npcSpawnCode1, true)
    SetEntityInvincible(npcSpawnCode1, true)
    TaskStandStill(npcSpawnCode1, -1)
    SetEntityAsMissionEntity(npcSpawnCode1, true, true)
    SetModelAsNoLongerNeeded(GetHashKey(npcSpawnCode1))
    ClearPedEnvDirt(npcSpawnCode1)
    ClearPedDamageDecalByZone(npcSpawnCode1 ,10 ,"ALL")
    ClearPedBloodDamage(npcSpawnCode1)


    local npcSpawn = "s_m_m_dispatchpolice_01"
    while not HasModelLoaded(GetHashKey(npcSpawn)) do
        Wait(0)
        modelrequest( GetHashKey(npcSpawn) )
    end
    local npcSpawnCode2 = CreatePed(GetHashKey(npcSpawn), 3330.108154296875,-704.841552734375,43.16811752319336,38.82979583740234, false, false, 0, 0)
    while not DoesEntityExist(npcSpawnCode2) do
        Wait(0)
    end
    Citizen.InvokeNative(0x283978A15512B2FE, npcSpawnCode2, true)
    SetPedAsGroupMember(npcSpawnCode2, GetPedGroupIndex(PlayerPedId()))
    SetBlockingOfNonTemporaryEvents(npcSpawnCode2,true)
    FreezeEntityPosition(npcSpawnCode2, true)
    SetEntityInvincible(npcSpawnCode2, true)
    TaskStandStill(npcSpawnCode2, -1)
    SetEntityAsMissionEntity(npcSpawnCode2, true, true)
    SetModelAsNoLongerNeeded(GetHashKey(npcSpawnCode2))
    ClearPedEnvDirt(npcSpawnCode2)
    ClearPedDamageDecalByZone(npcSpawnCode2 ,10 ,"ALL")
    ClearPedBloodDamage(npcSpawnCode2)
    Citizen.Wait(1800)
    SetEntityCoords(PlayerPedId(), 3329.345458984375,-704.2785034179688,44.16802215576172-1.0)
    SetEntityHeading(PlayerPedId(), 131.7089080810547)
    DoScreenFadeIn(1000)
    Citizen.Wait(1000)
    ExecuteCommand("do Police have given you back your items")
    -- Citizen.Wait(1000)
    -- ExecuteCommand("do 1/5")
    -- Citizen.Wait(1000)
    -- ExecuteCommand("do 2/5")
    -- Citizen.Wait(1000)
    -- ExecuteCommand("do 3/5")
    -- Citizen.Wait(1000)
    -- ExecuteCommand("do 4/5")
    -- Citizen.Wait(1000)
    -- ExecuteCommand("do 5/5")
    Citizen.Wait(1000)
    RemoveAllWeapons()
   
    -- Citizen.Wait(1000)
    -- ExecuteCommand("do 1/5")
    -- Citizen.Wait(1000)
    -- ExecuteCommand("do 2/5")
    -- Citizen.Wait(1000)
    -- ExecuteCommand("do 3/5")
    -- Citizen.Wait(1000)
    -- ExecuteCommand("do 4/5")
    -- Citizen.Wait(1000)
    -- ExecuteCommand("do 5/5")
    Citizen.Wait(1000)
    DoScreenFadeOut(1000)
    Citizen.Wait(1000)
    SetEntityCoords(PlayerPedId(), 2948.009765625,-1234.6861572265625,41.45576095581055,-1.0)
    SetEntityHeading(PlayerPedId(), 88.79011535644531)
    Citizen.Wait(1000)
    DeleteEntity(npcSpawnCode1)
    DeleteEntity(npcSpawnCode2)
    Citizen.Wait(1000)
    DoScreenFadeIn(1000)
    FreezeEntityPosition(PlayerPedId(), false)
    Wait (300)
    TriggerServerEvent('rsg-prison:server:GiveJailItems')
    ExecuteCommand("loadskin")
end

function startWork(timedown, animation, workTime, propBone, coordProps)
    FreezeEntityPosition(PlayerPedId(), true)
    local pos = GetEntityCoords(PlayerPedId())
    local handProp = CreateObject(""..propBone[1].."", pos.x, pos.y, pos.z, true, true, false)
    AttachEntityToEntity(handProp, PlayerPedId(), GetEntityBoneIndexByName(PlayerPedId(), propBone[2]), coordProps[1], coordProps[2], coordProps[3], coordProps[4], coordProps[5], coordProps[6], false, false, true, false, 0, true, false, false)
    playCustomAnim(animation[1], animation[2], -1, 1)
    Citizen.Wait(workTime*1000)
    ClearPedTasks(PlayerPedId())
    DeleteEntity(handProp)
    FreezeEntityPosition(PlayerPedId(), false)
    Citizen.Wait(1000)
    jailTime = jailTime - timedown
    TriggerServerEvent("gum_jail:workDown", timedown)
end

function getId()
    local idBack = 0
    for a,b in pairs(GetActivePlayers()) do
        local coords = GetEntityCoords(GetPlayerPed(b))
        local distance = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, Config.positionForJail[1], Config.positionForJail[2], Config.positionForJail[3], false)
        if distance < Config.positionForJail[4] then
            idBack = GetPlayerServerId(b)
        end
    end
    return idBack
end

function getIdHang(x,y,z,r)
    local idBack = 0
    for a,b in pairs(GetActivePlayers()) do
        local coords = GetEntityCoords(GetPlayerPed(b))
        local distance = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, x,y,z, false)
        if distance < r then
            idBack = GetPlayerServerId(b)
        end
    end
    return idBack
end

function sendToJail(time)
    local playerId = 0
    local canJailPlayer = false
    for a,b in pairs(GetActivePlayers()) do
        local coords = GetEntityCoords(GetPlayerPed(b))
        local distance = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, Config.positionForJail[1], Config.positionForJail[2], Config.positionForJail[3], false)
        if distance < Config.positionForJail[4] then
            playerId = b
            canJailPlayer = true
        end
    end
    if canJailPlayer then
        TriggerServerEvent("gum_jail:sendToJail", GetPlayerServerId(playerId), time)
    end
end

AddEventHandler('onResourceStop', function(resourceName)
	if (GetCurrentResourceName() == resourceName) then
        for a,b in pairs(npcsMan) do
            DeleteEntity(b)
          end
          for a,b in pairs(prisonerNpc) do
            DeleteEntity(b)
          end
          for k,v in pairs(robberyNpc) do
            if v ~= false then
                delete_obj(v)
            end
          end
          for k,v in pairs(blipBoats) do
            RemoveBlip(v)
          end
          for k,v in pairs(blipCarts) do
            RemoveBlip(v)
          end
    end
end)

function despawnNpc(count)
    if npcsMan[count] ~= nil and npcsMan[count] ~= false then
        delete_obj(npcsMan[count])
        npcsMan[count] = nil
    end
end

function prisonerDespawnNpc(count)
    if prisonerNpc[count] ~= nil and prisonerNpc[count] ~= false then
        delete_obj(prisonerNpc[count])
        prisonerNpc[count] = nil
    end
end

function createCart(x, y, z, h)
    local PlayerData = RSGCore.Functions.GetPlayerData()
    if PlayerData.job and PlayerData.job.type == "leo" then
        local modelHash = GetHashKey(Config.CartModel)
        if not HasModelLoaded(modelHash) then
            RequestModel(modelHash)
            while not HasModelLoaded(modelHash) do
                Citizen.Wait(0)
            end
        end

        local cartModelId = CreateVehicle(modelHash, x, y, z, h, true, true)
        SetEntityAsMissionEntity(cartModelId, true, true)

        RSGCore.Functions.Notify("Cart spawned successfully!", "success")
        return cartModelId
    else
        RSGCore.Functions.Notify("You are not allowed to spawn this cart!", "error")
        return nil
    end
end

-- boat (per player, only LEOs allowed)
local spawnedBoat = nil 

function createBoat(x, y, z, h)
    local PlayerData = RSGCore.Functions.GetPlayerData()
    if PlayerData.job and PlayerData.job.type == "leo" then
        if spawnedBoat and DoesEntityExist(spawnedBoat) then
            RSGCore.Functions.Notify("You already have a boat!", "error")
            return
        end

        local modelHash = GetHashKey(Config.BoatModel)
        if not HasModelLoaded(modelHash) then
            RequestModel(modelHash)
            while not HasModelLoaded(modelHash) do
                Citizen.Wait(0)
            end
        end

        spawnedBoat = CreateVehicle(modelHash, x, y, z, h, true, true)
        TriggerEvent("gum_boat:blockBoat", spawnedBoat)
        RSGCore.Functions.Notify("Boat spawned!", "success")
    else
        RSGCore.Functions.Notify("You are not allowed to spawn this boat!", "error")
    end
end


function deleteBoat()
    if spawnedBoat and DoesEntityExist(spawnedBoat) then
        DeleteEntity(spawnedBoat)
        spawnedBoat = nil
        RSGCore.Functions.Notify("Boat deleted!", "success")
    else
        RSGCore.Functions.Notify("You don't have a boat out!", "error")
    end
end

RegisterNetEvent('deleteBoat', function()
    deleteBoat()
end)



function delete_obj(obj)
    local timeout = 0
    if obj ~= nil then
        SetEntityAsMissionEntity(obj, false, true)
        NetworkRequestControlOfEntity(obj)
        while not NetworkHasControlOfEntity(obj) do
            timeout = timeout+1
            if timeout > 10 then
                break
            end
            if not DoesEntityExist(obj) then
                break
            end
            Wait(100)
        end
        if NetworkHasControlOfEntity(obj) then
        end
        DeleteEntity(obj)
    end
end


function createNpc(count, model, x,y,z,h, name)
    if npcsMan[count] == nil then
        Citizen.CreateThread(function()
            npcsMan[count] = false
            local npcSpawn = model
            while not HasModelLoaded(GetHashKey(npcSpawn)) do
                Wait(0)
                modelrequest( GetHashKey(npcSpawn) )
            end
            local npcSpawnCode = CreatePed(GetHashKey(npcSpawn), x, y, z, h, false, false, 0, 0)
            while not DoesEntityExist(npcSpawnCode) do
                Wait(0)
            end
            Citizen.InvokeNative(0x283978A15512B2FE, npcSpawnCode, true)
            SetPedAsGroupMember(npcSpawnCode, GetPedGroupIndex(PlayerPedId()))
            SetBlockingOfNonTemporaryEvents(npcSpawnCode,true)
            FreezeEntityPosition(npcSpawnCode, true)
            SetEntityInvincible(npcSpawnCode, true)
            TaskStandStill(npcSpawnCode, -1)
            SetEntityAsMissionEntity(npcSpawnCode, true, true)
            SetModelAsNoLongerNeeded(GetHashKey(npcSpawnCode))
            ClearPedEnvDirt(npcSpawnCode)
            ClearPedDamageDecalByZone(npcSpawnCode ,10 ,"ALL")
            ClearPedBloodDamage(npcSpawnCode)
            SetPedPromptName(npcsMan[count], name)
            npcsMan[count] = npcSpawnCode
        end)
    end
end


function prisonerCreateNpc(count, model, x,y,z,h, name, style, scenario)
    if prisonerNpc[count] == nil then
        Citizen.CreateThread(function()
            prisonerNpc[count] = false
            local npcSpawn = model
            while not HasModelLoaded(GetHashKey(npcSpawn)) do
                Wait(0)
                modelrequest( GetHashKey(npcSpawn) )
            end
            local npcSpawnCode = CreatePed(GetHashKey(npcSpawn), x, y, z, h, false, false, 0, 0)
            while not DoesEntityExist(npcSpawnCode) do
                Wait(0)
            end
            Citizen.InvokeNative(0x283978A15512B2FE, npcSpawnCode, true)
            SetPedAsGroupMember(npcSpawnCode, GetPedGroupIndex(PlayerPedId()))
            SetBlockingOfNonTemporaryEvents(npcSpawnCode,true)
            FreezeEntityPosition(npcSpawnCode, true)
            SetEntityInvincible(npcSpawnCode, true)
            TaskStandStill(npcSpawnCode, -1)
            SetEntityAsMissionEntity(npcSpawnCode, true, true)
            SetModelAsNoLongerNeeded(GetHashKey(npcSpawnCode))
            ClearPedEnvDirt(npcSpawnCode)
            ClearPedDamageDecalByZone(npcSpawnCode ,10 ,"ALL")
            ClearPedBloodDamage(npcSpawnCode)
            SetPedOutfitPreset(npcSpawnCode, tonumber(style))
            SetPedPromptName(prisonerNpc[count], name)
            prisonerNpc[count] = npcSpawnCode
            TaskStartScenarioInPlace(prisonerNpc[count], GetHashKey(scenario), -1, true, false, false, false)
        end)
    end
end


function modelrequest(model)
    Citizen.CreateThread(function()
        RequestModel(model)
    end)
end


function workDown(counter)
    FreezeEntityPosition(PlayerPedId(), true)
    workCount = workCount - 1
    table.insert(workRepeatTable, counter)
    playCustomAnim("amb_work@world_human_broom@working@female_b@idle_a", "idle_b", -1, 1);
    Citizen.Wait(100)
    local coords = GetEntityCoords(PlayerPedId())
    local workEntity = CreateObject(GetHashKey("p_broom02x"), coords.x, coords.y, coords.z,  true,  true, true)
    AttachEntityToEntity(workEntity, PlayerPedId(), GetEntityBoneIndexByName(PlayerPedId(), "PH_R_Hand"), 0.0, -0.03, 0.0, -3.0, 0.0, 0.0, true, true, false, true, 1, true)
    Citizen.Wait(workTime*1000)
    DeleteEntity(workEntity)
    ClearPedTasks(PlayerPedId())
    TriggerServerEvent("gum_jail:sendWork", workCount)
    FreezeEntityPosition(PlayerPedId(), false)
    if workCount <= 0 then
        TriggerServerEvent("gum_jail:finishWork")
        workRepeatTable = {}
        workCount = 0
        if jailTime > 0 then
            SetEntityCoords(PlayerPedId(), 3329.68505859375,-703.710205078125,44.13797760009765)
            Citizen.Wait(2000)
            jailTime = jailTime/2
            TriggerEvent("gum_jail:sendToJail", jailTime)
        end
        return false
    end
    local workDeleter = 0
    for a,b in pairs(workRepeatTable) do
        workDeleter = workDeleter + 1
    end
    if workDeleter == Config.cityWorkSpamProtect then
        for a,b in pairs(workRepeatTable) do
            workRepeatTable[a] = nil
            return false
        end
    end
end

Citizen.CreateThread(function()
    while true do
        cartTable = {}
        for cartEntity in EnumerateVehicles() do
            if GetEntityModel(cartEntity) == GetHashKey(Config.JailVehicle) then
                cartTable[cartEntity] = cartEntity
            end
        end
        leverTable = {}
        local coordsP = GetEntityCoords(PlayerPedId())
        for leverProp in EnumerateObjects() do
            if GetEntityModel(leverProp) == GetHashKey("s_gallowlevernbx01x") then
                leverTable[leverProp] = leverProp
            end
            if GetEntityModel(leverProp) == GetHashKey("p_doorlocked48a") then
                local coords = GetEntityCoords(leverProp)
                if GetDistanceBetweenCoords(coordsP.x, coordsP.y, coordsP.z, coords.x, coords.y, coords.z, false) < 30.0 then
                    if GetDistanceBetweenCoords(3350.624755859375,-645.9821166992188,45.32176208496094, coords.x, coords.y, coords.z, false) < 5.0 then
                        DeleteEntity(leverProp)
                    end
                end
            end
        end
        Citizen.Wait(5000)
    end
end)

Citizen.CreateThread(function()
    while true do
        local mycoords = GetEntityCoords(PlayerPedId())
        for a,b in pairs(Config.jailNpc) do
            local distance = GetDistanceBetweenCoords(mycoords.x, mycoords.y, mycoords.z, b.coords[1], b.coords[2], b.coords[3], false)
            if distance < 30.0 then
                createNpc(a, b.model, b.coords[1], b.coords[2], b.coords[3], b.coords[4], b.name)
            else
                despawnNpc(a)
            end
        end
        for a,b in pairs(Config.EscapeMission) do
            local distance = GetDistanceBetweenCoords(mycoords.x, mycoords.y, mycoords.z, b.coords[1], b.coords[2], b.coords[3], false)
            if distance < 30.0 then
                prisonerCreateNpc(a, b.model, b.coords[1], b.coords[2], b.coords[3], b.coords[4], b.name, b.style, b.scenario)
            else
                prisonerDespawnNpc(a)
            end
        end
        Citizen.Wait(100)
    end
end)

function prepareHang(hangCoords)
    local playerId = 0
    local canHangPlayer = false
    for a,b in pairs(GetActivePlayers()) do
        local coords = GetEntityCoords(GetPlayerPed(b))
        local distance = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, hangCoords[1], hangCoords[2], hangCoords[3], false)
        if distance < 1.0 then
            playerId = b
            canHangPlayer = true
        end
    end
    if canHangPlayer and playerId ~= 0 then
        TriggerServerEvent("gum_jail:prepareHang", GetPlayerServerId(playerId), hangCoords)
    end
end

function pushLever(hangCoords)
    local playerId = 0
    local canHangPlayer = false
    for a,b in pairs(GetActivePlayers()) do
        local coords = GetEntityCoords(GetPlayerPed(b))
        local distance = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, hangCoords[1], hangCoords[2], hangCoords[3], false)
        if distance < 1.0 then
            playerId = b
            canHangPlayer = true
        end
    end
    if canHangPlayer and playerId ~= 0 then
        playCustomAnim("script_story@trn3@ig@ig_1_pulllever","leverpush_arthur", 2000, 1);
        Citizen.Wait(2000)
        TriggerServerEvent("gum_jail:pushLever", GetPlayerServerId(playerId), hangCoords)
    end
end

RegisterNetEvent('gum_jail:prepareHang')
AddEventHandler('gum_jail:prepareHang', function(hangCoords)
    FreezeEntityPosition(PlayerPedId(), true)
    SetEntityCoords(PlayerPedId(), hangCoords[1], hangCoords[2], hangCoords[3])
    SetEntityHeading(PlayerPedId(), hangCoords[4])
    playCustomAnim("script_mpstory@mpgun4@ig@mpgun4_ig6_ig7_tomdavieshanging","idle_wait_marshalldavies", -1, 1)
end)

RegisterNetEvent('gum_jail:pushLever')
AddEventHandler('gum_jail:pushLever', function(hangCoords)
    SetEntityCoords(PlayerPedId(), hangCoords[1], hangCoords[2], hangCoords[3]+0.4)
    SetEntityHeading(PlayerPedId(), hangCoords[4])
    playCustomAnim("script_mpstory@mpgun4@ig@mpgun4_ig6_ig7_tomdavieshanging","action_hanging_quick_marshalldavies", -1, 1)
    Citizen.Wait(700)
    playCustomAnim("script_mpstory@mpgun4@ig@mpgun4_ig6_ig7_tomdavieshanging","idle_hanging_marshalldavies", -1, 1)
    Citizen.Wait(10000)
    playCustomAnim("script_mpstory@mpgun4@ig@mpgun4_ig6_ig7_tomdavieshanging","idle_death_marshalldavies", -1, 1)
    Citizen.Wait(30000)
    FreezeEntityPosition(PlayerPedId(), false)
    ClearPedTasks(PlayerPedId())
    SetEntityHealth(PlayerPedId(), 0)
end)

function takeFromCart(entity)
    local offset1 = GetOffsetFromEntityInWorldCoords(entity, 0.7, 0.5, 0.9)
    local offset2 = GetOffsetFromEntityInWorldCoords(entity, 0.7, -0.2, 0.9)
    local offset3 = GetOffsetFromEntityInWorldCoords(entity, 0.7, -0.9, 0.9)
    local offset4 = GetOffsetFromEntityInWorldCoords(entity, 0.7, -1.6, 0.9)
    local offsetLeave = GetOffsetFromEntityInWorldCoords(entity, 0.0, -2.5, 0.0)
    for a,b in pairs(GetActivePlayers()) do
        local coords = GetEntityCoords(GetPlayerPed(b))
        local distance1 = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, offset1.x, offset1.y, offset1.z, false)
        local distance2 = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, offset2.x, offset2.y, offset2.z, false)
        local distance3 = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, offset3.x, offset3.y, offset3.z, false)
        local distance4 = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, offset4.x, offset4.y, offset4.z, false)
        if distance1 <= 0.5 then
            TriggerServerEvent("gum_jail:takeFromCart", GetPlayerServerId(b), offsetLeave)
        end
        if distance2 <= 0.5 then
            TriggerServerEvent("gum_jail:takeFromCart", GetPlayerServerId(b), offsetLeave)
        end
        if distance3 <= 0.5 then
            TriggerServerEvent("gum_jail:takeFromCart", GetPlayerServerId(b), offsetLeave)
        end
        if distance4 <= 0.5 then
            TriggerServerEvent("gum_jail:takeFromCart", GetPlayerServerId(b), offsetLeave)
        end
    end
end

RegisterNetEvent('gum_jail:takeFromCart')
AddEventHandler('gum_jail:takeFromCart', function(coords)
    FreezeEntityPosition(PlayerPedId(), false)
    DetachEntity(PlayerPedId(), true, false)
    ClearPedTasks(PlayerPedId())
    SetEntityCoords(PlayerPedId(), coords.x, coords.y, coords.z-1.0)
end)

RegisterNetEvent('gum_jail:addToCart')
AddEventHandler('gum_jail:addToCart', function(entity)
    local sit1 = false
    local sit2 = false
    local sit3 = false
    local sit4 = false
    local offset1 = GetOffsetFromEntityInWorldCoords(NetworkGetEntityFromNetworkId(entity), 0.7, 0.5, 0.9)
    local offset2 = GetOffsetFromEntityInWorldCoords(NetworkGetEntityFromNetworkId(entity), 0.7, -0.2, 0.9)
    local offset3 = GetOffsetFromEntityInWorldCoords(NetworkGetEntityFromNetworkId(entity), 0.7, -0.9, 0.9)
    local offset4 = GetOffsetFromEntityInWorldCoords(NetworkGetEntityFromNetworkId(entity), 0.7, -1.6, 0.9)
    for a,b in pairs(GetActivePlayers()) do
        local coords = GetEntityCoords(GetPlayerPed(b))
        local distance1 = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, offset1.x, offset1.y, offset1.z, false)
        local distance2 = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, offset2.x, offset2.y, offset2.z, false)
        local distance3 = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, offset3.x, offset3.y, offset3.z, false)
        local distance4 = GetDistanceBetweenCoords(coords.x, coords.y, coords.z, offset4.x, offset4.y, offset4.z, false)
        if distance1 <= 0.6 then
            sit1 = true
        end
        if distance2 <= 0.6 then
            sit2 = true
        end
        if distance3 <= 0.6 then
            sit3 = true
        end
        if distance4 <= 0.6 then
            sit4 = true
        end
    end
    if sit1 == false then
        AttachEntityToEntity(PlayerPedId(), NetworkGetEntityFromNetworkId(entity), 0, 0.7, 0.5, 0.9, 0.0, 0.0, 90.0, true, true, false, true, 1, true)
        playCustomAnim("amb_camp@prop_camp_seat_chair_stew@resting@male_b@base", "base", -1, 2);
        FreezeEntityPosition(PlayerPedId(), true)
    elseif sit2 == false then
        AttachEntityToEntity(PlayerPedId(), NetworkGetEntityFromNetworkId(entity), 0, 0.7, -0.2, 0.9, 0.0, 0.0, 90.0, true, true, false, true, 1, true)
        playCustomAnim("amb_camp@prop_camp_seat_chair_stew@resting@male_b@base", "base", -1, 2);
        FreezeEntityPosition(PlayerPedId(), true)
    elseif sit3 == false then
        AttachEntityToEntity(PlayerPedId(), NetworkGetEntityFromNetworkId(entity), 0, 0.7, -0.9, 0.9, 0.0, 0.0, 90.0, true, true, false, true, 1, true)
        playCustomAnim("amb_camp@prop_camp_seat_chair_stew@resting@male_b@base", "base", -1, 2);
        FreezeEntityPosition(PlayerPedId(), true)
    elseif sit4 == false then
        AttachEntityToEntity(PlayerPedId(), NetworkGetEntityFromNetworkId(entity), 0, 0.7, -1.6, 0.9, 0.0, 0.0, 90.0, true, true, false, true, 1, true)
        playCustomAnim("amb_camp@prop_camp_seat_chair_stew@resting@male_b@base", "base", -1, 2);
        FreezeEntityPosition(PlayerPedId(), true)
    else
        notify(true, ""..Config.Language[38].."", 2000)
    end
end)

RegisterNetEvent('gum_jail:setCuffPlayer')
AddEventHandler('gum_jail:setCuffPlayer', function()
    playCustomAnim("script_re@sharp_shooter@alt_intros_non_spec", "money_won_give_shooter", 4000, 25)
end)

RegisterNetEvent('gum_jail:setCuffed')
AddEventHandler('gum_jail:setCuffed', function(state)
    if state == false then
        cuffed = false
        Citizen.InvokeNative(0x67406F2C8F87FC4F, PlayerPedId(), false)  
        ClearPedTasks(PlayerPedId())
    else
        cuffed = true
        Citizen.InvokeNative(0x7981037A96E7D174, PlayerPedId(), true)  
    end
end)

RegisterNetEvent('gum_jail:setHoldPlayer')
AddEventHandler('gum_jail:setHoldPlayer', function()
    if youHold == false then
        youHold = true
        playCustomAnim("veh_lo_res_idle", "train_troley_passenger_b_idle", -1, 25);
    else
        youHold = false
        ClearPedTasks(PlayerPedId())
    end
end)

RegisterNetEvent('gum_jail:setHolded')
AddEventHandler('gum_jail:setHolded', function(who)
    if holded == false then
        holded = true
        AttachEntityToEntity(PlayerPedId(), GetPlayerPed(GetPlayerFromServerId(who)), 0, -0.05, 0.68, 0.05, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
        timerForCuff()
    else
        holded = false
        DetachEntity(PlayerPedId(), true, false)
        ClearPedTasks(PlayerPedId())
    end
end)

function timerForCuff()
    CreateThread(function()
        while holded do
            local coords_pl = GetEntityCoords(PlayerPedId())
            if GetDistanceBetweenCoords(coords_pl.x, coords_pl.y, coords_pl.z, coords_walk_x, coords_walk_y, coords_pl.z, true) > 0.5 then
                coords_walk_x = coords_pl.x
                coords_walk_y = coords_pl.y
                if not make_anim_1 then
                    make_anim_2 = false
                    make_anim_1 = true
                    playCustomAnim("amb_camp@code_camp_bowl_wander@female_a@walk", "walk", -1, 1);
                end
            else
                coords_walk_x = coords_pl.x
                coords_walk_y = coords_pl.y
                if not make_anim_2 then
                    make_anim_1 = false
                    make_anim_2 = true
                    ClearPedTasks(PlayerPedId())
                end
            end
            Citizen.Wait(500)
        end
    end)
end

Citizen.CreateThread(function()
    Citizen.Wait(1000)
    while true do
        local timer = 300
        if cuffed == true then
            timer = 0
            DisableControlAction(0, 0x3076E97C, true)
            DisableControlAction(0, 0xCC1075A7, true)
            DisableControlAction(0, 0x4CC0E2FE, true)
            DisableControlAction(0, 0x7DA48D2A, true)
            DisableControlAction(0, 0x07CE1E61, true)
            DisableControlAction(0, 0x8FFC75D6, true)
            DisableControlAction(0, 0xD9D0E1C0, true)
            DisableControlAction(0, 0x0522B243, true)
            DisableControlAction(0, 0x27D1C284, true)
            DisableControlAction(0, 0x580C4473, true)
            DisableControlAction(0, 0x8AAA0AD4, true)
            DisableControlAction(0, 0xCF8A4ECA, true)
            DisableControlAction(0, 0x0F39B3D4, true)
            DisableControlAction(0, 0xE8342FF2, true)
            DisableControlAction(0, 0xB2F377E8, true)
            DisableControlAction(0, 0xD9C50532, true)
            DisableControlAction(0, 0xA1EB1353, true)
            DisableControlAction(0, 0x390948DC, true)
            DisableControlAction(0, 0x14DB6C5E, true)
            DisableControlAction(0, 0x018C47CF, true)
            DisableControlAction(0, 0x399C6619, true)
            DisableControlAction(0, 0x41AC83D1, true)
            DisableControlAction(0, 0x91C9A817, true)
            DisableControlAction(0, 0xA4F1006B, true)
            DisableControlAction(0, 0xADEAF48C, true)
            DisableControlAction(0, 0x53296B75, true)
            DisableControlAction(0, 0x6328239B, true)
            DisableControlAction(0, 0xBE1F4699, true)
            DisableControlAction(0, 0xC13A6564, true)
            DisableControlAction(0, 0xF84FA74F, true)
            DisableControlAction(0, 0xF8982F00, true)
            DisableControlAction(0, 0x04FB8191, true)
            DisableControlAction(0, 0x1E7D7275, true)
            DisableControlAction(0, 0x2277FAE9, true)
            DisableControlAction(0, 0x91C9A817, true)
        end
        if IsEntityPlayingAnim(PlayerPedId(), "veh_lo_res_idle", "train_troley_passenger_b_idle", 3) == false and youHold == true then
            timer = 5
            playCustomAnim("veh_lo_res_idle", "train_troley_passenger_b_idle", -1, 25)
        end
        local canEscape = false
        if #questData == #Config.EscapeMission then
            timer = 5
            for a,b in pairs(questData) do
                if b == false then
                    canEscape = true
                end
            end
            if canEscape == false then
                local coords_pl = GetEntityCoords(PlayerPedId())
                for a,b in pairs(Config.EscapePoints) do
                    if Config.OnlyAtNightCanEscape then
                        if a == escapePoints and a == 1 and GetDistanceBetweenCoords(coords_pl.x, coords_pl.y, coords_pl.z, b[1], b[2], b[3], true) < 2.0 and (GetClockHours() >= Config.NightSetup[1] or GetClockHours() <= Config.NightSetup[2]) then
                            api.getPrompt(promptData11, ""..Config.Language[39].."")
                            if api.getPromptButton(""..Config.Language[14].."", promptData11) then
                                missionStarted = true
                                escapePoints = escapePoints + 1
                                notify(true, ""..Config.Language[40].."", 1000)
                            end
                        end
                    else
                        if a == escapePoints and a == 1 and GetDistanceBetweenCoords(coords_pl.x, coords_pl.y, coords_pl.z, b[1], b[2], b[3], true) < 2.0 then
                            api.getPrompt(promptData11, ""..Config.Language[39].."")
                            if api.getPromptButton(""..Config.Language[14].."", promptData11) then
                                missionStarted = true
                                escapePoints = escapePoints + 1
                                notify(true, ""..Config.Language[40].."", 1000)
                            end
                        end
                    end
                end
                for a,b in pairs(Config.EscapePoints) do
                    if escapePoints == a then
                        if Config.OnlyAtNightCanEscape then
                            if (GetClockHours() >= Config.NightSetup[1] or GetClockHours() <= Config.NightSetup[2]) then
                                Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153,b[1], b[2], b[3]-1.0, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 1.5, 255, 100, 100, 20, 0, 0, 2, 0, 0, 0, 0)
                            end
                        else
                            Citizen.InvokeNative(0x2A32FAA57B937173, -1795314153,b[1], b[2], b[3]-1.0, 0, 0, 0, 0, 0, 0, 2.0, 2.0, 1.5, 255, 100, 100, 20, 0, 0, 2, 0, 0, 0, 0)
                        end
                    end
                    if GetDistanceBetweenCoords(coords_pl.x, coords_pl.y, coords_pl.z, b[1], b[2], b[3], true) < 4.0 and a ~= 1 and escapePoints == a and #Config.EscapePoints ~= escapePoints then
                        notify(true, ""..Config.Language[41]..""..escapePoints, 1000)
                        escapePoints = escapePoints+1
                    end
                    if GetDistanceBetweenCoords(coords_pl.x, coords_pl.y, coords_pl.z, b[1], b[2], b[3], true) < 4.0 and a ~= 1 and escapePoints == a and #Config.EscapePoints == escapePoints then
                        notify(true, ""..Config.Language[42].."", 1000)
                        missionEnded()
                        Citizen.Wait(500)
                    end
                end
            end
        end
        if escapeBoat ~= nil then
            local coords_pl = GetEntityCoords(PlayerPedId())
            local coords_boat = GetEntityCoords(escapeBoat)
            if GetDistanceBetweenCoords(coords_pl.x, coords_pl.y, coords_pl.z, coords_boat.x, coords_boat.y, coords_boat.z, true) > 50.0 then
                delete_obj(escapeBoat)
                escapeBoat = nil
            end
        end
        Citizen.Wait(timer)
    end
end)

function missionEnded()
    local random = math.random(1, 100)
    if random < Config.EscapeChance then
        if Config.EscapeProtectClothe then
            inEscapeState = true
            TriggerServerEvent("gum_jail:endJailEscape")
        else
            TriggerServerEvent("gum_jail:endJail")
        end
        jailed = false
        missionStarted = false
        escapePoints = 1
        timeForEscape = 0
        createCanoe()
    else
        missionStarted = false
        escapePoints = 1
        timeForEscape = 0
        if Config.OnlyOneTime then
            TriggerServerEvent("gum_jail:oneTime")
            canEscapeMission = false
        end
    end
end

function createCanoe()
    local modelHash = GetHashKey(Config.BoatModelEscape)
    if not HasModelLoaded(modelHash) then
        RequestModel(modelHash)
        while not HasModelLoaded(modelHash) do
            Citizen.Wait(0)
        end
    end
    escapeBoat = CreateVehicle(modelHash, Config.CanoeCoords[1],Config.CanoeCoords[2],Config.CanoeCoords[3],Config.CanoeCoords[4], true, true)
end


function playCustomAnim(dict,name, time, flag)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(0)
    end
	TaskPlayAnim(PlayerPedId(), dict, name, 1.0, 1.0, time, flag, 0, true, 0, false, 0, false)  
end

function playCustomAnimPed(entity, dict,name, time, flag)
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        Citizen.Wait(0)
    end
	TaskPlayAnim(entity, dict, name, 1.0, 1.0, time, flag, 0, true, 0, false, 0, false)  
end

function GetClosestPlayer()
    local players, closestDistance, closestPlayer = GetActivePlayers(), -1, -1
    local playerPed, playerId = PlayerPedId(), PlayerId()
    local coords, usePlayerPed = coords, false
    
    if coords then
        coords = vector3(coords.x, coords.y, coords.z)
    else
        usePlayerPed = true
        coords = GetEntityCoords(playerPed)
    end
    
    for i=1, #players, 1 do
        local tgt = GetPlayerPed(players[i])
        if not usePlayerPed or (usePlayerPed and players[i] ~= playerId) then

            local targetCoords = GetEntityCoords(tgt)
            local distance = #(coords - targetCoords)

            if closestDistance == -1 or closestDistance > distance then
                closestPlayer = players[i]
                closestDistance = distance
                playerid = GetPlayerServerId(players[i])
                tgt1 = GetPlayerPed(players[i])
            end
        end
    end
    return closestPlayer, closestDistance,  playerid, tgt1
end

function EnumerateEntities(initFunc, moveFunc, disposeFunc)
    return coroutine.wrap(function()
      local iter, id = initFunc()
      if not id or id == 0 then
        disposeFunc(iter)
        return
      end
      
      local enum = {handle = iter, destructor = disposeFunc}
      setmetatable(enum, entityEnumerator)
      
      local next = true
      repeat
        coroutine.yield(id)
        next, id = moveFunc(iter)
      until not next
      
      enum.destructor, enum.handle = nil, nil
      disposeFunc(iter)
    end)
end

function EnumerateObjects()
    return EnumerateEntities(FindFirstObject, FindNextObject, EndFindObject)
end
  
function EnumeratePeds()
    return EnumerateEntities(FindFirstPed, FindNextPed, EndFindPed)
end
  
function EnumerateVehicles()
    return EnumerateEntities(FindFirstVehicle, FindNextVehicle, EndFindVehicle)
end
function getEntity(player)   
    local result, entity = GetEntityPlayerIsFreeAimingAt(player)    
    return entity
end


isTownBanned = function (town)
	for k,v in pairs(Config.AimRobberyBannedTown) do
		if town == GetHashKey(v) then
			return true
		end
	end
	return false
end
