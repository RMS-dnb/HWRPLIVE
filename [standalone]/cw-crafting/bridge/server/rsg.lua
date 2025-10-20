if GetResourceState('rsg-core') ~= 'started' or GetResourceState('qbx_core') == 'started' then return end

RSGCore = exports['rsg-core']:GetCoreObject()

-- Adds money to user
function addMoney(src, moneyType, amount)
    local Player = RSGCore.Functions.GetPlayer(src)
    Player.Functions.AddMoney(moneyType, math.floor(amount))
end

-- Removes money from user
function removeMoney(src, moneyType, amount, reason)
    local Player = RSGCore.Functions.GetPlayer(src)
    return Player.Functions.RemoveMoney(moneyType, math.floor(amount))
end

-- Checks that user can pay
function canPay(src, moneyType, cost)
    local Player = RSGCore.Functions.GetPlayer(src)
    return Player.PlayerData.money[moneyType] >= cost
end

-- Fetches the CitizenId by Source
function getCitizenId(src)
    local Player = RSGCore.Functions.GetPlayer(src)
    return Player.PlayerData.citizenid
end

-- Fetches the Source of an online player by citizenid
function getSrcOfPlayerByCitizenId(citizenId)
    return RSGCore.Functions.GetPlayerByCitizenId(citizenId).PlayerData.source
end

function addItem(src, itemName, amount, metadata)
    if Config.oxInv then
        local pped = GetPlayerPed(src)
        local coords = GetEntityCoords(pped)

        if exports.ox_inventory:CanCarryItem(src, itemName, amount) then
            exports.ox_inventory:AddItem(src, itemName, amount, metadata)
            TriggerClientEvent('ox_lib:notify', src, {
                title = 'Crafting',
                description = ('You received %sx %s'):format(amount, itemName),
                type = 'success'
            })


            
        else
            local item = { name = itemName, amount = amount, metadata = metadata }
            exports.ox_inventory:CustomDrop("cw-craft", { item }, coords)
            TriggerClientEvent('ox_lib:notify', src, {
                title = 'Inventory Full',
                description = ('%sx %s was dropped at your location'):format(amount, itemName),
                type = 'warning'
            })
        end
    else
        exports['rsg-inventory']:AddItem(src, itemName, amount, false, metadata)
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Crafting',
            description = ('You received %sx %s'):format(amount, itemName),
            type = 'success'
        })

        local Player = RSGCore.Functions.GetPlayer(src)
        local Playercid = Player.PlayerData.citizenid
        local discord = RSGCore.Functions.GetIdentifier(src, 'discord') 
        local dsc = "<@" .. discord:gsub("discord:", "") .. ">" 
        local license = RSGCore.Functions.GetIdentifier(src, "license")
        
        local pped = GetPlayerPed(src)
        local coords = GetEntityCoords(pped)
        
        TriggerEvent(
            'rsg-log:server:CreateLog',
            'crafting',
            'Crafting',
            'green',
            '**Player: ** ' .. Player.PlayerData.name .. '\n' ..
            '**Source ID: ** ' .. src .. '\n' ..
            '**Item: ** ' .. itemName .. '\n' ..
            '**Amount: ** ' .. amount .. '\n' ..
            -- '**Preço: ** $' .. price.money .. '\n' ..
            -- '**Ouro: ** ' .. price.gold .. '\n' ..
            '**Coords: ** ' .. coords .. '\n' ..
            '**Discord: ** ' .. dsc ..'\n'..
            '**License: ** ' .. license ..'\n'..
            '**CitizenID: ** ' .. Playercid )
    end
end

function removeItem(src, itemName, amount)
    if Config.oxInv then
        return exports.ox_inventory:RemoveItem(src, itemName, amount)
    else
        local Player = RSGCore.Functions.GetPlayer(src)
        if not Player then return false end
        return exports['rsg-inventory']:RemoveItem(src, itemName, amount)
    end
end

function removeItemBySlot(src, itemName, amount, slot)
    if Config.oxInv then
        return exports.ox_inventory:RemoveItem(src, itemName, amount, nil, slot)
    else
        local Player = RSGCore.Functions.GetPlayer(src)
        if not Player then return false end
        return exports['rsg-inventory']:RemoveItem(src, itemName, amount, slot)
    end
end

function hasAllMaterials(src, materials, craftingAmount, keepMaterials)
    if Config.oxInv then
        keepMaterials = keepMaterials or {} 

        for material, amount in pairs(materials) do
            local totalAmount = amount
            if not keepMaterials[material] then 
                totalAmount = totalAmount * craftingAmount
            end
            if not exports.ox_inventory:GetItemCount(src, material, totalAmount) then return false end
        end
        return true
    else
        local Player = RSGCore.Functions.GetPlayer(src)
        if not Player then return false end
        
        keepMaterials = keepMaterials or {}  -- Initialize to empty table if nil
        
        for material, amount in pairs(materials) do
            local totalAmount = amount
            if not keepMaterials[material] then
                totalAmount = totalAmount * craftingAmount
            end
            
            local item = Player.Functions.GetItemByName(material)
            if not item or item.amount < totalAmount then 
                return false 
            end
        end
        return true
    end
end

