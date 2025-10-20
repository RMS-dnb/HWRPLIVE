if GetResourceState('rsg-core') ~= 'started' or GetResourceState('qbx_core') == 'started' then return end
if Config.Debug then print('Using QB bridge') end


local RSGCore = exports['rsg-core']:GetCoreObject()

RegisterNetEvent("RSGCore:Client:OnPlayerLoaded", function()
    defineItems()
end)

lib.callback.register('cw-crafting:getPlayerJobName', function(source)
    local Player = RSGCore.Functions.GetPlayer(source)
    if Player and Player.PlayerData.job then
        return Player.PlayerData.job.name
    end
    return nil
end)

lib.callback.register('cw-crafting:getPlayerJobType', function(source)
    local Player = RSGCore.Functions.GetPlayer(source)
    if Player and Player.PlayerData.job then
        return Player.PlayerData.job.type
    end
    return nil
end)

lib.callback.register('cw-crafting:getPlayerJobLevel', function(source)
    local Player = RSGCore.Functions.GetPlayer(source)
    if Player and Player.PlayerData.job and Player.PlayerData.job.grade then
        return Player.PlayerData.job.grade.level
    end
    return nil
end)

function hasGps()
    if Config.Inventory == 'qb' then
        if RSGCore.Functions.HasItem(Config.ItemName.gps) then
            return true
        end
    elseif Config.Inventory == 'ox' then
        if exports.ox_inventory:Search('count', Config.ItemName.gps) >= 1 then
            return true
        end
    end
    return false
end

function getCitizenId()
    return RSGCore.Functions.GetPlayerData().citizenid
end

function getVehicleModel(vehicle)
    local model = GetEntityModel(vehicle)
    for vmodel, vdata in pairs(RSGCore.Shared.Vehicles) do
        if model == joaat(vmodel) then
            return vdata.name, vdata.brand
        end
    end
    return GetDisplayNameFromVehicleModel(model)
end

function getClosestPlayer()
    return RSGCore.Functions.GetClosestPlayer()
end

function notify(text, type)
    -- Remove this block if you dont want in-app notifications
    

    lib.notify({
        title = text,
        type = type,
    })

end

function defineItems()
    if Config.oxInv then
        for items, datas in pairs(exports.ox_inventory:Items()) do
            ItemNames[items] = datas
        end
    else
        ItemNames = RSGCore.Shared.Items
    end
end

function hasItem(material, amount)
    if Config.oxInv then
        local count = 0
        local recipe = exports.ox_inventory:Search('slots', material)
        for k, ingredients in pairs(recipe) do
            if ingredients.metadata.degrade ~= nil then
                if ingredients.metadata.degrade >= 1 then
                    count = count + ingredients.count
                else
                    notify("Items are Bad Quality", 'error')
                end
            else
                count = count + ingredients.count
            end
        end
        if count < amount then
            return false
        end
        return true
    else
        return RSGCore.Functions.HasItem(material, amount) 
    end
end

function triggerProgressBar(name, label, time, cbSuc, cbCancel)
    if Config.oxLib then
        local canCancel = cbCancel ~= nil
    
        if lib.progressBar({
            duration = time,
            label = label,
            canCancel = true,
            disable = {
                move = true,
                
            }
        }) then
            cbSuc()
        else
            cbCancel()
        end
    else
        local canCancel = cbCancel ~= nil

        RSGCore.Functions.Progressbar(name, label, time , false, true, {
            disableMovement = true,
            disableCarMovement = true,
            disableMouse = false,
            disableCombat = true,
        }, {}, {}, {}, cbSuc(), cbCancel() or {})
    end
end


