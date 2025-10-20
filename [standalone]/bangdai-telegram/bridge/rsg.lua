if GetResourceState('rsg-core') ~= 'started' then return end

local Core = exports['rsg-core']:GetCoreObject()

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
    local removed = Player.Functions.RemoveItem(item, 1)
    if removed then
        TriggerClientEvent('rsg-inventory:client:ItemBox', source, Core.Shared.Items[item], 'remove', 1)
        return true
    end
    return false
end

function AddItem(source, item, data)
    local Player = GetPlayer(source)
    if not Player then return false end
    local added = Player.Functions.AddItem(item, 1, false, data)
    if added then
        TriggerClientEvent('rsg-inventory:client:ItemBox', source, Core.Shared.Items[item], 'add', 1)
        return true
    end
    return false
end

function CreateItem(k, type)
    if not Core.Shared.Items[k] then 
        print('^1Error: Item ' .. k .. ' not found in Core.Shared.Items^0')
        return false 
    end

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

RegisterNetEvent('RSGCore:Server:OnPlayerLoaded', function()
    local src = source
    if Config.debug then
        print("^2[Telegram Debug] RSGCore Player loaded: " .. src .. "^0")
    end
    
    local Player = GetPlayer(src)
    if not Player then
        if Config.debug then
            print("^1[Telegram Debug] Player not found in RSGCore: " .. src .. "^0")
        end
        return
    end
    
    SetTimeout(5000, function()
        if Config.debug then
            print("^2[Telegram Debug] Checking unread telegrams for RSGCore player: " .. src .. "^0")
        end
        
        local PlayerCheck = GetPlayer(src)
        if PlayerCheck then
            CheckUnreadTelegrams(src)
        else
            if Config.debug then
                print("^1[Telegram Debug] Player no longer exists when checking telegrams: " .. src .. "^0")
            end
        end
    end)
end)