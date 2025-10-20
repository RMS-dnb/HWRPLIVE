local RSGCore = exports['rsg-core']:GetCoreObject()

lib.locale()
------------------------------------
-- callback to get weapon info
-----------------------------------
RSGCore.Functions.CreateCallback('rsg-weapons:server:getweaponinfo', function(source, cb, weaponserial)
-- lib.callback.register('rsg-weapons:server:getweaponinfo', function(source, cb, weaponserial)
    local weaponinfo = MySQL.query.await('SELECT * FROM player_weapons WHERE serial=@weaponserial', { ['@weaponserial'] = weaponserial })
    if weaponinfo[1] == nil then return end
    cb(weaponinfo)
end)

-----------------------------------
-- Degrade Weapon
-----------------------------------
RegisterNetEvent('rsg-weapons:server:degradeWeapon', function(serie)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local svslot = nil
    for _, v in pairs(Player.PlayerData.items) do
        if v.type == 'weapon' then
            if v.info.serial == serie then
                svslot = v.slot

                -- weapon quality update
                local newquality = math.floor((Player.PlayerData.items[svslot].info.quality - Config.DegradeRate) * 10) / 10
                Player.PlayerData.items[svslot].info.quality = newquality

                if Player.PlayerData.items[svslot].info.quality <= 0 then
                    print(Player.PlayerData.items[svslot])
                    TriggerClientEvent('rsg-weapons:client:UseWeapon', src, Player.PlayerData.items[svslot])
                end
            end
        end
    end
    Player.Functions.SetInventory(Player.PlayerData.items)
end)

------------------------------------------
-- use weapon repair kit
------------------------------------------
RSGCore.Functions.CreateUseableItem('weapon_repair_kit', function(source, item)
    TriggerClientEvent('rsg-weapons:client:repairweapon', source)
end)

-----------------------------------
-- repair weapon
-----------------------------------
RegisterNetEvent('rsg-weapons:server:repairweapon', function(serie)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local svslot = nil
    for _, v in pairs(Player.PlayerData.items) do
        if v.type == 'weapon' then
            if v.info.serial == serie then
                svslot = v.slot
                Player.PlayerData.items[svslot].info.quality = 100
            end
        end
    end
    Player.Functions.SetInventory(Player.PlayerData.items)
    TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_weapon_repaired'), type = 'success', duration = 5000 })
end)

---------------------------------------------
-- remove item
---------------------------------------------
RegisterServerEvent('rsg-weapons:server:removeitem')
AddEventHandler('rsg-weapons:server:removeitem', function(item, amount)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem(item, amount)
    TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items[item], 'remove', amount)
end)





RegisterNetEvent('cleaver:pickup', function(netId, itemName)
    local src = source
    local xPlayer = RSGCore.Functions.GetPlayer(src)

    if not xPlayer then return end

    local entity = NetworkGetEntityFromNetworkId(netId)

    if entity and DoesEntityExist(entity) then
        DeleteEntity(entity)
        TriggerClientEvent('cleaver:clearTargetCache', src, netId)
    end

    -- Add the specific thrown weapon item to inventory
    xPlayer.Functions.AddItem(itemName, 1)
    TriggerClientEvent('ox_lib:notify', src, {
        type = 'success',
        description = 'You picked up a ' .. itemName:gsub('weapon_', ''):gsub('_', ' '):gsub('^%l', string.upper),
        duration = 3000
    })
end)



