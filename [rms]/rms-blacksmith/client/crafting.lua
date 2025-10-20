local RSGCore = exports['rsg-core']:GetCoreObject()
lib.locale()

---------------------------------------------
-- crafting menu
---------------------------------------------
local CategoryMenus = {}

CreateThread(function()
    for _, v in ipairs(Config.BlacksmithCrafting) do
        local IngredientsMetadata = {}
        local setheader = RSGCore.Shared.Items[tostring(v.receive)].label
        local itemimg = "nui://"..Config.Img..RSGCore.Shared.Items[tostring(v.receive)].image

        for i, ingredient in ipairs(v.ingredients) do
            table.insert(IngredientsMetadata, { label = RSGCore.Shared.Items[ingredient.item].label, value = ingredient.amount })
        end

        local option = {
            title = setheader,
            icon = itemimg,
            event = 'rex-blacksmith:client:checkingredients',
            metadata = IngredientsMetadata,
            args = {
                title = setheader,
                category = v.category,
                ingredients = v.ingredients,
                crafttime = v.crafttime,
                craftingxp = v.craftingxp,
                bpc = v.bpc,
                receive = v.receive,
                giveamount = v.giveamount
            }
        }

        if not CategoryMenus[v.category] then
            CategoryMenus[v.category] = {
                id = 'crafting_menu_' .. v.category,
                title = v.category,
                menu = 'crafting_menu',
                onBack = function() end,
                options = { option }
            }
        else
            table.insert(CategoryMenus[v.category].options, option)
        end
    end
end)

CreateThread(function()
    for category, MenuData in pairs(CategoryMenus) do
        RegisterNetEvent('rex-blacksmith:client:' .. category)
        AddEventHandler('rex-blacksmith:client:' .. category, function()
            lib.registerContext(MenuData)
            lib.showContext(MenuData.id)
        end)
    end
end)

RegisterNetEvent('rex-blacksmith:client:craftingmenu', function()
    local Menu = {
        id = 'crafting_menu',
        title = locale('cl_lang_44'),
        menu = 'blacksmith_job_menu',
        onBack = function() end,
        options = {}
    }

    for category, MenuData in pairs(CategoryMenus) do
        table.insert(Menu.options, {
            title = category,
            description = locale('cl_lang_45') .. category,
            event = 'rex-blacksmith:client:' .. category,
            arrow = true
        })
    end

    lib.registerContext(Menu)
    lib.showContext(Menu.id)
end)

-- ---------------------------------------------
-- -- craft item
-- ---------------------------------------------
-- RegisterNetEvent('rex-blacksmith:client:checkingredients', function(data)
-- 	print(data.bpc)
--     local hasItem = RSGCore.Functions.HasItem(data.bpc, 1)
--     if hasItem then
--         -- check crafting rep
--         RSGCore.Functions.TriggerCallback('rex-blacksmith:server:checkxp', function(currentXP)
--             if currentXP >= data.craftingxp then
--                 -- check crafting items
--                 RSGCore.Functions.TriggerCallback('rex-blacksmith:server:checkingredients', function(hasRequired)
--                     if hasRequired == true then
--                         LocalPlayer.state:set("inv_busy", true, true) -- lock inventory
--                         lib.progressBar({
--                             duration = tonumber(data.crafttime),
--                             position = 'bottom',
--                             useWhileDead = false,
--                             canCancel = false,
--                             disableControl = true,
--                             disable = {
--                                 move = true,
--                                 mouse = true,
--                             },
--                             label = locale('cl_lang_46').. RSGCore.Shared.Items[data.receive].label,
--                         })
--                         TriggerServerEvent('rex-blacksmith:server:finishcrafting', data)
--                         LocalPlayer.state:set("inv_busy", false, true) -- unlock inventory
--                     else
--                         lib.notify({ title = locale('cl_lang_51'), type = 'inform', duration = 7000 })
--                     end
--                 end, data.ingredients)
--             else
--                 lib.notify({ title = locale('cl_lang_52'), type = 'error', duration = 7000 })
--             end
--         end, 'crafting')
--     else
--         lib.notify({ title = RSGCore.Shared.Items[data.bpc].label..locale('cl_lang_53'), type = 'error', duration = 7000 })
--     end
-- end)
RegisterNetEvent('rex-blacksmith:client:checkingredients', function(data)
    -- Check if data exists first
    if not data then
        print("No crafting data provided!")
        return
    end
    
    -- Check if other required data exists
    if not data.receive or not data.ingredients then
        print("Missing crafting recipe data!")
        return
    end

    -- Check if blueprint is required and if player has it
    local hasBlueprint = true
    if data.bpc then
        hasBlueprint = RSGCore.Functions.HasItem(data.bpc, 1)
        if not hasBlueprint then
            local bpcLabel = RSGCore.Shared.Items[data.bpc] and RSGCore.Shared.Items[data.bpc].label or "Missing Blueprint"
            lib.notify({
                title = bpcLabel .. locale('cl_lang_53'),
                type = 'error',
                duration = 7000
            })
            return
        end
    end

    -- Continue with crafting process
    RSGCore.Functions.TriggerCallback('rex-blacksmith:server:checkxp', function(currentXP)
        -- Ensure currentXP is a number and craftingxp exists
        currentXP = currentXP or 0
        local requiredXP = data.craftingxp or 0
        
        if currentXP >= requiredXP then
            RSGCore.Functions.TriggerCallback('rex-blacksmith:server:checkingredients', function(hasRequired)
                if hasRequired then
                    LocalPlayer.state:set("inv_busy", true, true) -- lock inventory

                    local itemLabel = RSGCore.Shared.Items[data.receive] and RSGCore.Shared.Items[data.receive].label or "Unknown Item"

                    lib.progressBar({
                        duration = tonumber(data.crafttime),
                        position = 'bottom',
                        useWhileDead = false,
                        canCancel = false,
                        disableControl = true,
                        disable = {
                            move = true,
                            mouse = true,
                        },
                        anim = {
                            dict = 'mech_inventory@crafting@fallbacks',
                            clip = 'full_craft_and_stow',
                            flag = 27,
                        },
                        label = locale('cl_lang_46') .. itemLabel,
                    })

                    TriggerServerEvent('rex-blacksmith:server:finishcrafting', data)
                    LocalPlayer.state:set("inv_busy", false, true) -- unlock inventory
                else
                    lib.notify({
                        title = locale('cl_lang_51'),
                        type = 'inform',
                        duration = 7000
                    })
                end
            end, data.ingredients)
        else
            lib.notify({
                title = locale('cl_lang_52'),
                type = 'error',
                duration = 7000
            })
        end
    end, 'crafting')
end)