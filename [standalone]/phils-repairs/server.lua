local RSGCore = exports['rsg-core']:GetCoreObject()

RegisterNetEvent('rsg-weapons:server:repairweapon', function(serial, cost)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)

    if not Player then return end

    -- Find the weapon in inventory
    local repairedWeapon = nil
    for _, item in pairs(Player.items) do
        if item.type == "weapon" and item.info and item.info.serial == serial then
            repairedWeapon = item
            break
        end
    end

    if not repairedWeapon then
        TriggerClientEvent('ox_lib:notify', src, {
            title = "Weapon Not Found",
            description = "This weapon was not found in your inventory.",
            type = 'error',
            duration = 5000
        })
        return
    end

    -- Check if player has enough money
    if Player.Functions.RemoveMoney('cash', cost) then
        -- Update weapon durability
        repairedWeapon.info.quality = 100 

        -- Trigger client-side event to update UI
        TriggerClientEvent('rsg-weapons:client:receiveRepairedWeapon', src, repairedWeapon)

        -- Notify success
        TriggerClientEvent('ox_lib:notify', src, {
            title = "Weapon Repaired",
            description = "Your weapon has been fully repaired for $" .. cost .. ".",
            type = 'success',
            duration = 5000
        })

        -- Refresh inventory
        TriggerClientEvent('rsg-weapons:client:refreshInventory', src)
    else
        -- Notify insufficient funds
        TriggerClientEvent('ox_lib:notify', src, {
            title = "Insufficient Funds",
            description = "You don't have enough money to repair this weapon.",
            type = 'error',
            duration = 5000
        })
    end
end)
