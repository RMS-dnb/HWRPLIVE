local RSGCore = exports['rsg-core']:GetCoreObject()
local Drops = {}
local LocationStates = {}

local function CreateDropId()
    local dropId = math.random(10000, 99999)
    while Drops[dropId] do
        dropId = math.random(10000, 99999)
    end
    return dropId
end

local function CreateNewDrop(itemName, quantity, coords)
    local dropId = CreateDropId()
    local itemData = RSGCore.Shared.Items[itemName]
    if not itemData then
       
        return nil
    end

    Drops[dropId] = {
        id = dropId,
        coords = coords,
        createdTime = os.time(),
        item = {
            name = itemName,
            amount = quantity,
            label = itemData.label,
            weight = itemData.weight,
            type = itemData.type,
            unique = itemData.unique,
            image = itemData.image
        },
        locationIndex = nil  -- Will be set by SpawnLootForLocation
    }

    local propModel = Config.PropMapping[itemName] or 'p_cs_lootsack03x'
    TriggerClientEvent('mack-moneystash:client:CreateDropProp', -1, dropId, coords, propModel)
   
    return dropId
end

local function SpawnLootForLocation(locIndex)
    local loc = Config.Locations[locIndex]
    if not loc then
       
        return
    end

    local tier = loc.tier or "Low"
    local tierConfig = Config.Tiers[tier]
    if not tierConfig then
       
        return
    end

    if #tierConfig.Weapons == 0 and #tierConfig.AmmoBoxes == 0 and #tierConfig.Items == 0 then
        
        return
    end

    local existingDrops = 0
    for _, drop in pairs(Drops) do
        local dist = #(vector3(drop.coords.x, drop.coords.y, drop.coords.z) - vector3(loc.coords.x, loc.coords.y, loc.coords.z))
        if dist < loc.radius then
            existingDrops = existingDrops + 1
        end
    end
    if existingDrops >= (loc.spawnAmount or 3) then
        
        return
    end

    local zOffset = Config.ZOffset or 0.5
    local spawnAmount = loc.spawnAmount or 3
    local spawnRadius = loc.radius * 0.5

    for i = 1, spawnAmount do
        local itemType = math.random(1, 3)
        local itemName
        if itemType == 1 and #tierConfig.Weapons > 0 then
            itemName = tierConfig.Weapons[math.random(#tierConfig.Weapons)]
        elseif itemType == 2 and #tierConfig.AmmoBoxes > 0 then
            itemName = tierConfig.AmmoBoxes[math.random(#tierConfig.AmmoBoxes)]
        elseif itemType == 3 and #tierConfig.Items > 0 then
            itemName = tierConfig.Items[math.random(#tierConfig.Items)]
        else
            if #tierConfig.Weapons > 0 then
                itemName = tierConfig.Weapons[math.random(#tierConfig.Weapons)]
            elseif #tierConfig.AmmoBoxes > 0 then
                itemName = tierConfig.AmmoBoxes[math.random(#tierConfig.AmmoBoxes)]
            elseif #tierConfig.Items > 0 then
                itemName = tierConfig.Items[math.random(#tierConfig.Items)]
            end
        end

        if not itemName then
            print("[mack-moneystash:server] No valid item found for spawn at location "..locIndex)
            goto next_spawn
        end

        local quantity
        if itemName == 'dollar' or itemName == 'dollar' then
            quantity = math.random(100, 300)
        elseif itemName == 'cent' or itemName == 'cent' then
            quantity = math.random(150, 190)
        else
            quantity = 1
        end

        local offsetX = math.random(-spawnRadius, spawnRadius)
        local offsetY = math.random(-spawnRadius, spawnRadius)
        local finalCoords = vector4(loc.coords.x + offsetX, loc.coords.y + offsetY, loc.coords.z + zOffset, loc.coords.w)

        local dropId = CreateNewDrop(itemName, quantity, finalCoords)
        if dropId then
            Drops[dropId].locationIndex = locIndex
        end
        Citizen.Wait(500)

        ::next_spawn::
    end
end

RegisterServerEvent('mack-moneystash:server:RequestSpawn')
AddEventHandler('mack-moneystash:server:RequestSpawn', function(locIndex)
    local src = source or "unknown"
    local currentTime = os.time()
    if not LocationStates[locIndex] or (currentTime - LocationStates[locIndex]) > 3600 then
        LocationStates[locIndex] = currentTime
       
        SpawnLootForLocation(locIndex)
    end
end)

Citizen.CreateThread(function()
    while true do
        local players = GetPlayers()
        local playerPositions = {}
        for _, playerId in ipairs(players) do
            local ped = GetPlayerPed(playerId)
            if ped and DoesEntityExist(ped) then
                playerPositions[playerId] = GetEntityCoords(ped)
            end
        end

        for dropId, drop in pairs(Drops) do
            local locIndex = drop.locationIndex
            local loc = Config.Locations[locIndex]
            if loc then
                local dropPos = vector3(drop.coords.x, drop.coords.y, drop.coords.z)
                local hasPlayerNearby = false
                for _, pos in pairs(playerPositions) do
                    if #(pos - dropPos) < (loc.radius or 20.0) then
                        hasPlayerNearby = true
                        break
                    end
                end
                if not hasPlayerNearby or (os.time() - drop.createdTime) > (Config.DropTimeout / 1000) then
                    TriggerClientEvent('mack-moneystash:client:RemoveDropProp', -1, dropId)
                    Drops[dropId] = nil
                   
                end
            end
        end
        Citizen.Wait(30000)
    end
end)

RegisterServerEvent('mack-moneystash:server:PickupDrop')
AddEventHandler('mack-moneystash:server:PickupDrop', function(dropId)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then
       
        return
    end

    if Drops[dropId] then
        local item = Drops[dropId].item
        local moneyType = nil
        local amount = item.amount

        if item.name == 'dollar' or item.name == 'cent' then
            moneyType = 'cash'
            amount = item.name == 'dollar' and amount or (amount / 10)
        elseif item.name == 'blood_dollar' or item.name == 'blood_cent' then
            moneyType = 'bloodmoney'
            amount = item.name == 'blood_dollar' and amount or (amount / 10)
        end

        if moneyType then
            TriggerEvent('RSGCore:Server:OnMoneyChange', src, moneyType, amount, 'add', 'loot_drop')
            TriggerClientEvent('bln_notify:send', src, {
                title = 'Money Picked Up!',
                description = 'You picked up ' .. string.format("%.2f", amount) .. ' ' .. moneyType .. '.',
                icon = 'star',
                placement = 'middle-right',
                duration = 5000
            }, 'SUCCESS')
        else
            Player.Functions.AddItem(item.name, item.amount, nil, item.info)
            TriggerClientEvent('bln_notify:send', src, {
                title = 'Item Picked Up!',
                description = 'You picked up ' .. item.label .. '.',
                icon = 'star',
                placement = 'middle-right',
                duration = 5000
            }, 'SUCCESS')
        end

        TriggerClientEvent('mack-moneystash:client:RemoveDropProp', -1, dropId)
        Drops[dropId] = nil
       
    else
        TriggerClientEvent('bln_notify:send', src, {
            title = 'Nice ',
            description = 'Cash haul!',
            icon = 'warning',
            placement = 'middle-right',
            duration = 5000
        }, 'ERROR')
       
    end
end)

AddEventHandler('onResourceStop', function(resourceName)
    if GetCurrentResourceName() == resourceName then
        for dropId, _ in pairs(Drops) do
            TriggerClientEvent('mack-moneystash:client:RemoveDropProp', -1, dropId)
           
        end
        Drops = {}
        LocationStates = {}
        TriggerClientEvent('mack-moneystash:client:RemoveAllDropProps', -1)
       
    end
end)