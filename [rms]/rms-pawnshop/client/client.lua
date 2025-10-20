RSGCore = exports['rsg-core']:GetCoreObject()

function isEmpty(table)
    for _, _ in pairs(table) do
        return false
    end
    return true
end

-- trapper blips only
-----------------------------------------------------------------


CreateThread(function()

    if Config.Interaction == "prompt" then
        for i=1, #Config.Locations do
            exports[Config.InteractionName]:createPrompt(Config.Locations[i].Prompt.name, Config.Locations[i].Prompt.promptvec, Config.Locations[i].Prompt.keybind, Config.Locations[i].Prompt.msg, {
                type = 'client',
                event = 'rms-seller:client:openmenu',
                args = {Config.Locations[i].Prompt.name, i},
            })
        end

    elseif Config.Interaction == "target" then
        for i=1, #Config.Locations do
            exports.ox_target:addSphereZone({
                coords = Config.Locations[i].Prompt.promptvec,
                radius = 1.5,
                drawSprite = false,
                debug = false,
                options = {
                    {
                        name = Config.Locations[i].Prompt.name,
                        icon = 'fas fa-bank',
                        
                        label = Config.Locations[i].Prompt.msg,
                        onSelect = function()
                            local hasJob = lib.callback.await('rms-seller:server:GetJob', false, Config.Locations[i].job)
                            if hasJob then
                                TriggerEvent('rms-seller:client:openmenu', Config.Locations[i].Prompt.name, i)
                            end
                        end,
                    }
                }
            })
        end
    end

end)


RegisterNetEvent('rms-seller:client:openmenu', function(stashcreated, id)
    local cid = lib.callback.await('rms-seller:server:cid', false)
    local items, totalprice, def = lib.callback.await('rms-seller:server:callback:getstashinformation', false, stashcreated..'_seller_' .. cid, id)
    local menus = {}
    if isEmpty(items) then
        menus[#menus + 1] = {
            title = Config.locales[Config.locale].open_inv,
            onSelect = function()
                TriggerEvent('rms-seller:client:openinv', stashcreated..'_seller_' .. cid)
            end,
        }
    else
        menus[#menus + 1] = {
            title = Config.locales[Config.locale].open_inv,
            onSelect = function()
                TriggerEvent('rms-seller:client:openinv', stashcreated..'_seller_' .. cid)
            end,
        }
        menus[#menus + 1] = {
            title = Config.locales[Config.locale].sell_stuff,
            onSelect = function()
                if def then
                    lib.notify({
                        title = Config.locales[Config.locale].seller_name,
                        description = Config.locales[Config.locale].seller_error,
                        type = 'error'
                    })
                    return
                end
                local alert = lib.alertDialog({
                    header = 'Seller',
                    content = 'I will buy all the items for '..totalprice..'$',
                    centered = true,
                    cancel = true
                })
                
                if alert == 'confirm' then
                    TriggerServerEvent('rms-seller:server:sellitems', stashcreated..'_seller_' ..cid,totalprice)
                
                
                end
            end,
        }
    end

    lib.registerContext({
        id = 'rms_seller_menu',
        title = 'Menu',
        menu = 'rms_seller_menu__',
        options = menus
    })
    lib.showContext('rms_seller_menu')
end)

RegisterNetEvent('rms-seller:client:openinv', function(id)
    if Config.Inv == 'v1' then
        TriggerServerEvent('inventory:server:OpenInventory', 'stash', id, {
            maxweight = Config.InvSettings.maxweight,
            slots = Config.InvSettings.slots,
        })
        TriggerEvent('inventory:client:SetCurrentStash', id)
    elseif Config.Inv == 'v2' then
        TriggerServerEvent('rms-seller:server:creatstash:inventory:v2', id)
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource ~= GetCurrentResourceName() then return end
    for i=1, #Config.Locations do
        if Config.Interaction == "prompt" then
            exports[Config.InteractionName]:deletePrompt(Config.Locations[i].Prompt.name)
        elseif Config.Interaction == "target" then
            exports[Config.InteractionName]:RemoveZone(Config.Locations[i].Prompt.name)
        end
    end
end)