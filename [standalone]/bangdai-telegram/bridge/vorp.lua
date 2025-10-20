if GetResourceState('vorp_core') ~= 'started' then return end

local Core = exports.vorp_core:GetCore()

lib.locale()

function GetPlayer(src)
    local Player = Core.getUser(src)
    return Player or false
end

function GetPlayerData(src)
    local Player = GetPlayer(src)
    if not Player then return false end

    local character = Player.getUsedCharacter

    return {
        name = character.firstname,
        money = character.money,
        job = character.job,
        grade = character.jobGrade
    }
end

function GetIdentifier(src)
    local Player = GetPlayer(src)
    if not Player then return false end

    local character = Player.getUsedCharacter
    
    local identifier = character.identifier
    local charid = character.charIdentifier

    return {
        identifier = identifier,
        charid = charid
    }
end

function HasRequiredItem(source, item)
    local Player = GetPlayer(source)
    if not Player then return false end

    local hasitem = exports.vorp_inventory:getItemByName(source, item, nil)
    if not hasitem then
        return false
    end

    return true
end

function RemoveMoney(source, amount, desc)
    local Player = GetPlayer(source)
    if not Player then return false end
    local character = Player.getUsedCharacter
    return character.removeCurrency(0, amount)
end

function RemoveItem(source, item)
    local Player = GetPlayer(source)
    if not Player then return false end
    local removed = exports.vorp_inventory:subItem(source, item, 1)
    return removed and true or false
end

function AddItem(source, item, data)
    local Player = GetPlayer(source)
    if not Player then return false end
    local added = exports.vorp_inventory:addItem(source, item, 1, data, nil)
    return added and true or false
end

function CreateItem(k, type)
    return exports.vorp_inventory:registerUsableItem(k, function(data)
        if type == 'read' then
            TriggerClientEvent("bangdai-telegram:client:view", data.source, data.item.metadata)
            exports.vorp_inventory:closeInventory(data.source)
            return true
        elseif type == 'bird' then
            TriggerClientEvent("bangdai-telegram:UseBird", data.source, locale('Name_Birdpost'))
            exports.vorp_inventory:closeInventory(data.source)
            return true
        end
        return false
    end)
end

AddEventHandler("vorp:SelectedCharacter", function(source, character)
    local src = source
    if Config.debug then
        print("^2[Telegram Debug] VORP Character selected: " .. src .. "^0")
    end

    local Player = GetPlayer(src)
    if not Player then
        if Config.debug then
            print("^1[Telegram Debug] Player not found in VORP: " .. src .. "^0")
        end
        return
    end

    SetTimeout(5000, function()
        if Config.debug then
            print("^2[Telegram Debug] Checking unread telegrams for VORP player: " .. src .. "^0")
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