local RSGCore = exports['rsg-core']:GetCoreObject()
lib.locale()

CreateThread(function()
    for _, v in pairs(Config.StoreLocations) do
        
       
        exports.ox_target:addBoxZone({
            coords = v.shopcoords,
            size = vec3(1.0, 1.0, 0.5),
            rotation = 0.0,
            drawSprite = false,
            debug = false,
            options = {
                {
                    name = v.name,
                    icon = "fa-solid fa-store",
                    label = locale('lang_1') .. v.label,
                    onSelect = function()
                        TriggerServerEvent('rsg-shops:server:openstore', v.products, v.name, v.label)
                    end
                }
            }                     
        })
        --]]

        -- Murphy Interact
        -- exports.murphy_interact:AddInteraction({
        --     coords = v.shopcoords,
        --     distance = 8.0,         -- radius around the shop
        --     interactDst = 1.5,      -- how close player must be to trigger
        --     id = v.name,            -- unique ID for removal if needed
        --     name = v.label,         -- optional, just for reference
        --     options = {
        --         {
        --             label = locale('lang_1') .. v.label,
        --             action = function(entity, coords, args)
        --                 TriggerServerEvent('rsg-shops:server:openstore', v.products, v.name, v.label)
        --             end,
        --         },
        --     }
        -- })

        -- -- Add blip if enabled
        -- if v.showblip then
        --     local StoreBlip = BlipAddForCoords(1664425300, v.shopcoords)
        --     SetBlipSprite(StoreBlip, joaat(v.blipsprite), true)
        --     SetBlipScale(StoreBlip, v.blipscale)
        --     SetBlipName(StoreBlip, v.label)
        -- end
    end
end)
