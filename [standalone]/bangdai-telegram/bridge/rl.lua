if GetResourceState('nm_core') ~= 'started' then return end

local Core = exports.nm_core:GetCoreObject()

local inventory = exports['nm_inventory']

lib.locale()

function GetPlayer(src)
    local Player = Core.Functions.GetPlayer(src)
    return Player
end

function GetPlayerData(src)
    local Player = GetPlayer(src)
    if not Player then
        return false
    end

    local PlayerData = Player.PlayerData

    return {
        name = PlayerData.charinfo.firstname,
        money = PlayerData.money.cash,
        job = PlayerData.job.name,
        grade = PlayerData.job.grade.level
    }
end

function GetIdentifier(src)
    local Player = Core.Functions.GetPlayer(src)
    if not Player then
        return false
    end
    
    local citizenid = Player.PlayerData.citizenid
    local cid = Player.PlayerData.cid or 0

    return {
        identifier = citizenid,
        charid = cid
    }
end

function HasRequiredItem(source, item)
    local Player = GetPlayer(source)
    if not Player then return false end

    local hasitem = Player.Functions.GetItemByName(item)
    if not hasitem then
        return false
    end

    return true
end

function RemoveMoney(source, amount, desc)
    local Player = GetPlayer(source)
    if not Player then return false end
    return Player.Functions.RemoveMoney('cash', amount, desc)
end

function RemoveItem(source, item)
    local Player = GetPlayer(source)
    if not Player then return false end
    local removed = inventory:RemoveItem(source, item, 1)
    if removed then
        return true
    end
    return false
end

function AddItem(source, item, data)
    local Player = GetPlayer(source)
    if not Player then return false end
    local added = inventory:AddItem(source, item, 1, data)
    if added then
        return true
    end
    return false
end

function CreateItem(k, type)
    Core.Functions.CreateUseableItem(k, function(source, item)
        if type == 'read' then
            if item.info or item.metadata then
                TriggerClientEvent("bangdai-telegram:client:view", source, item.metadata or item.info)
            end
            return true
        elseif type == 'bird' then
            TriggerClientEvent("bangdai-telegram:UseBird", source, locale('Name_Birdpost'))
            return true
        end
        return false
   end)
   return true
end

RegisterNetEvent('NMCore:Server:OnPlayerLoaded', function()
    local src = source
    SetTimeout(2000, function()
        CheckUnreadTelegrams(src)
    end)
end)