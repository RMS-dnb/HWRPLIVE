local RSGCore = exports['rsg-core']:GetCoreObject()
lib.locale()

InCooldown = {}

local function GetLawmen(locationId)
    local lawcount = 0
    local locationData = Config.StoreRobberies[locationId]
    local allowedJobs = locationData.allowedLawJobs or {}

    local players = RSGCore.Functions.GetRSGPlayers()

    for k, v in pairs(players) do
        if v.PlayerData.job.type == 'leo' and v.PlayerData.job.onduty then
            -- If allowedJobs is specified, check if the job name is in the allowed list
            if #allowedJobs > 0 then
                for _, allowedJob in pairs(allowedJobs) do
                    if v.PlayerData.job.name == allowedJob then
                        lawcount = lawcount + 1
                        break
                    end
                end
            else
                -- If no specific jobs are defined, count all leo types (backwards compatibility)
                lawcount = lawcount + 1
            end
        end
    end

    return lawcount
end

local function AlertPolice(text, source)
    local src = source
    local ped = GetPlayerPed(src)
    local pedcoords = GetEntityCoords(ped)
    local players = RSGCore.Functions.GetRSGPlayers()
    local Player = RSGCore.Functions.GetPlayer(src)
    
    if not Player then return end
    
    local Players = RSGCore.Functions.GetPlayers()
    
    for i = 1, #Players do
        local LawPlayer = RSGCore.Functions.GetPlayer(Players[i])
        if LawPlayer then
            local jobType = LawPlayer.PlayerData.job.type
            if jobType == 'leo' and LawPlayer.PlayerData.job.onduty then
                TriggerClientEvent('rsg-lawman:client:lawmanAlert', Players[i], pedcoords, text)
            end
        end
    end
end

RegisterNetEvent('y0-storeRobbery:alertPolice', function(text)
    local src = source
    AlertPolice(text, src)
end)

lib.callback.register('y0-storeRobbery:addCooldown', function(source, id)
    for k, v in pairs(InCooldown) do
        if v.id == id then
            return false 
        end
    end

    table.insert(InCooldown, { id = id, cooldown = GetGameTimer() + Config.StoreRobberies[id].cooldown })
    return true
end)

lib.callback.register('y0-storeRobbery:checkCooldown', function(source, id)
    local Player = RSGCore.Functions.GetPlayer(source)
    if not Player then return false end

    -- Check if player is law enforcement
    if Player.PlayerData.job.type == 'leo' then 
        TriggerClientEvent('ox_lib:notify', source, {
            title = 'You are law',
            type = 'error',
        }) 
        return false 
    end

    -- Get location-specific law requirements
    local locationData = Config.StoreRobberies[id]
    local requiredLawmen = locationData.lawmenNeeded or Config.LawmenNeeded -- Use location-specific or global fallback
    local lawmen = GetLawmen(id) -- Pass the location ID to get specific law count

    if lawmen < requiredLawmen then 
        local allowedJobsText = ""
        if locationData.allowedLawJobs and #locationData.allowedLawJobs > 0 then
            allowedJobsText = " (" .. table.concat(locationData.allowedLawJobs, ", ") .. ")"
        end
        
        TriggerClientEvent('ox_lib:notify', source, {
            title = 'Not enough lawmen',
            description = 'Need ' .. requiredLawmen .. ' lawmen' .. allowedJobsText .. '. Currently online: ' .. lawmen,
            type = 'error',
        }) 
        return false 
    end

    local itemNeeded = Config.StoreRobberies[id].itemNeeded

    local hasItem = Player.Functions.HasItem(itemNeeded.item, itemNeeded.amount)
    if not hasItem then
        TriggerClientEvent('ox_lib:notify', source, {
            title = 'Store Robbery',
            description = 'You need a ' .. itemNeeded.item .. ' to rob this store.',
            type = 'error',
        })
        return false
    end

    for k, v in pairs(InCooldown) do
        if v.id == id then
            if GetGameTimer() < v.cooldown then
                TriggerClientEvent('ox_lib:notify', source, {
                    title = 'Store Robbery',
                    description = 'This store is still on cooldown. Please wait ' .. math.ceil((v.cooldown - GetGameTimer()) / 1000) .. ' seconds.',
                    type = 'error',
                })
                return false
            else
                table.remove(InCooldown, k)
                return true
            end
        end
    end
    return true
end)

RegisterServerEvent('y0-storeRobbery:robStore')
AddEventHandler('y0-storeRobbery:robStore', function(id)
    local Player = RSGCore.Functions.GetPlayer(source)
    if not Player then return end
    
    if Player.Functions.RemoveItem(Config.StoreRobberies[id].itemNeeded.item, Config.StoreRobberies[id].itemNeeded.amount) then
        local reward = math.random(Config.StoreRobberies[id].rewardAmount.min, Config.StoreRobberies[id].rewardAmount.max)
        
        if Player.Functions.AddMoney('bloodmoney', reward) then
            TriggerClientEvent('ox_lib:notify', source, {
                title = 'Store Robbery',
                description = 'You successfully robbed the store and received $' .. reward,
                type = 'success',
            })

            local chance = math.random(0, 99)
            
            if chance < Config.StoreRobberies[id].rewardItems[1].chance then
                Player.Functions.AddItem(Config.StoreRobberies[id].rewardItems[1].item, Config.StoreRobberies[id].rewardItems[1].count)
                TriggerClientEvent('ox_lib:notify', source, {
                    title = 'Store Robbery',
                    description = 'You found a ' .. Config.StoreRobberies[id].rewardItems[1].itemLabel,
                    type = 'success',
                })
            end
        end
    end
end)

lib.callback.register('y0-storeRobbery:checkItem', function(source, item)
    local Player = RSGCore.Functions.GetPlayer(source)
    if not Player then return false end

    local itemData = Player.Functions.GetItemByName(item)
    return (itemData and itemData.amount > 0)
end)
