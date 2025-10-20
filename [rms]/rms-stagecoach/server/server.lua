RSGCore = exports['rsg-core']:GetCoreObject()

local MISSION_COOLDOWN_SECONDS = 3600 -- 1 hour
local activeMissions = {}
local currentLootId = 0

RSGCore.Functions.CreateUseableItem(Config.ItemName, function(source, item)
    TriggerClientEvent('stagecoachrobberies:client:startMission', source)
end)

local function GetOnlineLawmenCount()
    local count = 0
    for _, player in pairs(RSGCore.Functions.GetPlayers()) do
        local Player = RSGCore.Functions.GetPlayer(player)
        if Player and Player.PlayerData.job and Player.PlayerData.job.type == "leo" then
            count = count + 1
        end
    end
    return count
end


local ClearExpiredMissions = function()
    local currentTime = os.time()
    for missionIndex, startTime in pairs(activeMissions) do
        if currentTime - startTime >= MISSION_COOLDOWN_SECONDS then
            local mission = Config.Routes[missionIndex]
            mission.isInUse = false
            mission.lastUsed = nil
            activeMissions[missionIndex] = nil
        end
    end
end

local GetMission = function()
    ClearExpiredMissions()

    local availableMissions = {}

    if Config.Routes then
        for index, mission in ipairs(Config.Routes) do
            if not mission.hasBeenRobbed then
                table.insert(availableMissions, index)
            end
        end
    end

    if #availableMissions > 0 then
        local randomIndex = math.random(1, #availableMissions)
        local selectedMissionIndex = availableMissions[randomIndex]
        return selectedMissionIndex
    else
        return nil
    end
end

RegisterServerEvent('stagecoachrobberies:server:CheckMission', function()
    local src = source
    local Char = RSGCore.Functions.GetPlayer(src)
    if not Char then return end

    local minLawmenRequired = 0 -- Change this to your desired minimum
    local onlineLawmen = GetOnlineLawmenCount()

    if onlineLawmen < minLawmenRequired then
        TriggerClientEvent('ox_lib:notify', src, {
            type = 'error',
            description = ('Not enough lawmen around. (%s/%s)'):format(onlineLawmen, minLawmenRequired)
        })
        return
    end

    local missionIndex = GetMission()
    if missionIndex then
        local selectedMission = Config.Routes[missionIndex]
        selectedMission.hasBeenRobbed = true
        activeMissions[missionIndex] = os.time() -- Fix: Track mission time
        TriggerClientEvent('stagecoachrobberies:client:startBankTransportMission', src, selectedMission)
        Char.Functions.RemoveItem(Config.ItemName, 1) 
    else
        TriggerClientEvent('ox_lib:notify', src, {
            type = 'inform',
            description = "All stagecoach contracts have been claimed. Come back later."
        })
    end
end)


RegisterServerEvent('stagecoachrobberies:server:PlayerJobCheck', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)

    if not Player then return end

    local jobType = Player.PlayerData.job.type

    if jobType == "leo" then
        TriggerClientEvent('stagecoachrobberies:client:PlayPedResponse', src, "LAWMEN", "ESCORT")
    else
        TriggerClientEvent('stagecoachrobberies:client:PlayPedResponse', src, "ALERT", "GOAWAY")
    end
end)

RegisterServerEvent('stagecoachrobberies:server:PlantDynamite', function(data)
    local src = source
    local Char = RSGCore.Functions.GetPlayer(src)
    if not Char then return end
    TriggerClientEvent("stagecoachrobberies:client:SpawnObjects", src, data)
    Char.Functions.RemoveItem(Config.DynamiteItem, 1)
    print(("Player %s planted dynamite at %s"):format(src, json.encode(data.coords)))
end)

RegisterServerEvent('stagecoachrobberies:server:SpawnItemsOnGroundBatch', function(lootData)
    print("Spawning loot items on the ground...")
    local src = source
    local Char = RSGCore.Functions.GetPlayer(src)
    if not Char then return end

    local spawnList = {}

    for itemType, coords in pairs(lootData) do
        for _, coord in ipairs(coords) do
            currentLootId = currentLootId + 1
            table.insert(spawnList, {
                id = currentLootId,
                itemType = itemType,
                coords = coord
            })
            print(("Spawned loot item %s at %s"):format(itemType, json.encode(coord)))
        end
    end

    TriggerClientEvent('stagecoachrobberies:client:spawnLootObjects', -1, spawnList)
end)

RegisterServerEvent('stagecoachrobberies:server:pickupLootItem', function(lootId, itemType)
    local src = source
    local Char = RSGCore.Functions.GetPlayer(src)
    if not Char then return end

    local rewardConfig = Config.RewardsItem[itemType]
    if not rewardConfig then
        print(("Invalid item type received: %s from player %s"):format(itemType, src))
        return
    end

    local actualItem = rewardConfig.Item or itemType
    Char.Functions.AddItem(actualItem, 1)

    TriggerClientEvent('stagecoachrobberies:client:removeLootItem', -1, lootId)

    print(("Player %s picked up %s (ID: %s)"):format(src, actualItem, lootId))
end)
