local RSGCore = exports['rsg-core']:GetCoreObject()

local SpawnedBilps = {}
local SpawnedPrompt = {}

---------
-- BLIP 
---------
CreateThread(function()
    for _, v in pairs(Config.nativeLocations) do
        if Config.UseTarget == false then
            exports['rsg-core']:createPrompt(v.id, v.coords, RSGCore.Shared.Keybinds[Config.Keyshop], v.name, {
                type = 'client',
                event = 'mm_native:client:openshop',
                args = {v.id},
            })
            table.insert(SpawnedPrompt, v.id)
        end
        if v.showblip == true then
            local blipshop = BlipAddForCoords(1664425300, v.coords)
            SetBlipSprite(blipshop, joaat(v.blipsprite), true)
            SetBlipScale(blipshop, v.blipscale)
            SetBlipName(blipshop, v.name)
            table.insert(SpawnedBilps, blipshop)
        end
    end
end)

----------------------------------------
-- open store with opening hours
----------------------------------------
local Openstorehours = function(id)
    if Config.StoreAlwaysOpen then
        TriggerEvent('mm_native:client:openMenu', id)
    else
        local hour = GetClockHours()
        if (hour < Config.OpenTime) or (hour >= Config.CloseTime) then
            lib.notify({ title = Lang:t('client.lang_2'), description = Lang:t('client.lang_3')..Config.OpenTime..Lang:t('client.lang_4'), type = 'error', icon = 'fa-solid fa-shop', iconAnimation = 'shake', duration = 7000 })
            return
        end
        TriggerEvent('mm_native:client:openMenu', id)
    end
end

local GetTarotHours = function() -- get store hours function
    local hour = GetClockHours()
    if Config.StoreAlwaysOpen then
        for k, v in pairs(SpawnedBilps) do
            BlipAddModifier(v, joaat('BLIP_MODIFIER_MP_COLOR_8'))
        end
    else
        if (hour < Config.OpenTime) or (hour >= Config.CloseTime) then
            for k, v in pairs(SpawnedBilps) do
                BlipAddModifier(v, joaat('BLIP_MODIFIER_MP_COLOR_2'))
            end
        else
            for k, v in pairs(SpawnedBilps) do
                BlipAddModifier(v, joaat('BLIP_MODIFIER_MP_COLOR_8'))
            end
        end
    end
end

RegisterNetEvent('RSGCore:Client:OnPlayerLoaded', function() -- get shop hours on player loading
    GetTarotHours()
end)

CreateThread(function() -- update shop hourse every min
    while true do
        if Config.StoreAlwaysOpen then
            GetTarotHours()
            Wait(60000) -- every min
        end
        Wait(1000)
    end
end)

---------
--  shop
---------
AddEventHandler('mm_native:client:openshop', function(id)
    Openstorehours(id) -- Open shop
end)

---------
-- MENU
---------
RegisterNetEvent('mm_native:client:openMenu')
AddEventHandler('mm_native:client:openMenu', function(menuId)
    local nativeMenu = { id = 'native_main_menu', title = Lang:t('client.lang_6'), options = {} }

    local menu_buttonB = {
        title = Lang:t('client.lang_7'),
        description = Lang:t('client.lang_8'),
        event = 'mm_native:client:opensellmenu',  -- Evento para abrir el submenú
        args = { menuId },
        icon = 'fa-solid fa-tag',  -- ícono para el menú
        arrow = true
    }
    table.insert(nativeMenu.options, menu_buttonB)

    local menu_buttonA = {
        title = Lang:t('client.lang_9'),
        description = Lang:t('client.lang_10'),
        onSelect = function()
            TriggerServerEvent('rsg-shops:server:openstore', 'nativeProducts', 'nativeProducts', Lang:t('client.lang_9'))
        end,
        icon = 'fa-solid fa-tag',  -- ícono para el menú
        iconColor = "yellow",
        arrow = true
    }
    table.insert(nativeMenu.options, menu_buttonA)

    lib.registerContext(nativeMenu)
    lib.showContext('native_main_menu')
end)

-- FOLLOW COMMENTS FOR -- need change name respource
---------------------------------------------
-- sell vendor menu
---------------------------------------------
RegisterNetEvent('mm_native:client:opensellmenu') -- change resource
AddEventHandler('mm_native:client:opensellmenu', function(menuId)
    local actualmenuid
    if type(menuId) == "table" then actualmenuid = tostring(menuId[1]) else actualmenuid = tostring(menuId) end
    if not actualmenuid then print("Error: menuId es nulo o vacío.", actualmenuid)  return end
    RSGCore.Functions.TriggerCallback('mm_native:server:getitems', function(result)
        if not result or not result.items or #result.items == 0 then lib.notify({ title = Lang:t('client.lang_13'), description = Lang:t('client.lang_14'), type = 'error', duration = 7000 })  return end
        for _, v in pairs(Config.nativeLocations) do --  change resource config
            if v.id == actualmenuid then
                TriggerEvent('mm_native:client:shopsell', result.items) -- change resource
                break
            end
        end
    end,actualmenuid)
end)

RegisterNetEvent('mm_native:client:shopsell') -- change resource
AddEventHandler('mm_native:client:shopsell', function(sellid)
    local itemsList = sellid
    if type(sellid) == "table" then itemsList = sellid end

    local sellsubmenu = {
        id = 'items_native_sell_menu',
        title = Lang:t('client.lang_15'),
        description = Lang:t('client.lang_16'),
        menu = 'native_main_menu', -- change resource menu 
        options = {},
        onBack = function()
        end,
    }

    local subOptionAll = {
        title = Lang:t('client.lang_17'),
        description = Lang:t('client.lang_18'),
        event = 'mm_native:client:sellall', -- change resource
        args = { itemsList },
        icon = 'fa-solid fa-handshake',
        arrow = true,
    }

    table.insert(sellsubmenu.options, subOptionAll)

    if Config.Debug then print('sellid:', json.encode(itemsList)) end
    for _, item in ipairs(itemsList) do

        if Config.Debug then print('Id:', json.encode(item)) end

        if item and item.name then
            local itemLabel = RSGCore.Shared.Items[tostring(item.name)].label
            local itemImage = "nui://" .. Config.img .. RSGCore.Shared.Items[tostring(item.name)].image
            --local itemprice = tonumber(item.price) / 100
            local optiontitle = string.format("$%d | %s | Ud.: %d", tonumber(item.price), itemLabel, tonumber(item.amount))

            local suboptions = {
                title = optiontitle,
                event = 'mm_native:client:sellcount', -- change resource
                args = { name = item.name, amount = tonumber(item.amount), price = tonumber(item.price) },
                icon = itemImage,
                image = itemImage,
                arrow = true,
            }
            table.insert(sellsubmenu.options, suboptions)

        else
            if Config.Debug then print("Elemento no tiene nombre:", json.encode(item)) end
        end
    end

    lib.registerContext(sellsubmenu)
    lib.showContext('items_native_sell_menu')
end)

---------------------------------------------
-- sell amount
---------------------------------------------
RegisterNetEvent('mm_native:client:sellcount') -- change resource
AddEventHandler('mm_native:client:sellcount', function(args)
    local maX = args.amount
    local labelX = RSGCore.Shared.Items[tostring(args.name)].label
    local input = lib.inputDialog(Lang:t('client.lang_19'), {
        {   label = Lang:t('client.lang_20').. labelX.. Lang:t('client.lang_21').. maX,
            type = 'number',
            min = 1,
            max = maX,
            required = true,
            icon = 'fa-solid fa-hashtag'
        },
    })

    if not input or not tonumber(input[1]) then lib.notify({ title = Lang:t('client.lang_20_0'), description = Lang:t('client.lang_22'), type = 'error', duration = 7000 })  return end

    local amount = tonumber(input[1])
    if amount < 1 then lib.notify({ title = Lang:t('client.lang_23'), description = Lang:t('client.lang_24'), type = 'error', duration = 7000 })  return end

    local hasItem = RSGCore.Functions.HasItem(args.name, amount)
    if not hasItem then lib.notify({ title = Lang:t('client.lang_25'), description = Lang:t('client.lang_26'), type = 'error', duration = 7000 })  return end

    TriggerServerEvent('mm_native:server:sellitem', args.name, amount, args.price) -- change resource

end)

RegisterNetEvent('mm_native:client:sellall', function(sellid) -- change resource
    local input = lib.inputDialog(Lang:t('client.lang_27'), {
        {   label = Lang:t('client.lang_28'),
            type = 'select',
            options = {
                { value = 'yes', label = Lang:t('client.lang_29') },
                { value = 'no', label = Lang:t('client.lang_30') }
            },
            required = true,
            icon = 'fa-solid fa-circle-question'
        },
    })
    LocalPlayer.state:set("inv_busy", true, true)
    if not input or input[1] == 'no' then lib.notify({ title = Lang:t('client.lang_31'), description = Lang:t('client.lang_26'), type = 'error', duration = 7000 }) LocalPlayer.state:set("inv_busy", false, true) return end

    if input[1] == 'yes' then
        local items = sellid
        if type(sellid) == "table" then
            items = sellid
        end

        if lib.progressBar({
            duration = Config.SellTime,
            position = 'bottom',
            useWhileDead = false,
            canCancel = false,
            disableControl = true,
            disable = {
                move = true,
                mouse = true,
            },
            label = Lang:t('client.lang_33'),
        }) then

            TriggerServerEvent('mm_native:server:sellall', items) -- change resource
            LocalPlayer.state:set("inv_busy", false, true)
        else
            lib.notify({ title = Lang:t('client.lang_34'), description = Lang:t('client.lang_35'), type = 'error', duration = 7000 })
            LocalPlayer.state:set("inv_busy", false, true)
        end
    end
end)