local RSGCore = exports['rsg-core']:GetCoreObject()
lib.locale()

----------------------------------------------
-- sell fish
----------------------------------------------
RegisterServerEvent('rex-fishmonger:server:sellfish')
AddEventHandler('rex-fishmonger:server:sellfish', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    local price = 0
    local hasfish = false
    local soldFish = {} -- Table to track sold fish

    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] ~= nil then 
                local fishName = Player.PlayerData.items[k].name
                local amount = Player.PlayerData.items[k].amount
                local fishPrice = 0
                local displayName = ""
                
                -- Small Fish
                if fishName == 'a_c_fishbluegil_01_sm' then 
                    fishPrice = Config.FishPrice.Small
                    displayName = "Small Bluegill"
                elseif fishName == 'a_c_fishbullheadcat_01_sm' then 
                    fishPrice = Config.FishPrice.Small
                    displayName = "Small Bullhead Catfish"
                elseif fishName == 'a_c_fishchainpickerel_01_sm' then 
                    fishPrice = Config.FishPrice.Small
                    displayName = "Small Chain Pickerel"
                elseif fishName == 'a_c_fishperch_01_sm' then 
                    fishPrice = Config.FishPrice.Small
                    displayName = "Small Perch"
                elseif fishName == 'a_c_fishredfinpickerel_01_sm' then 
                    fishPrice = Config.FishPrice.Small
                    displayName = "Small Redfin Pickerel"
                elseif fishName == 'a_c_fishrockbass_01_sm' then 
                    fishPrice = Config.FishPrice.Small
                    displayName = "Small Rock Bass"
                
                -- Medium Fish
                elseif fishName == 'a_c_fishbluegil_01_ms' then 
                    fishPrice = Config.FishPrice.Medium
                    displayName = "Medium Bluegill"
                elseif fishName == 'a_c_fishbullheadcat_01_ms' then 
                    fishPrice = Config.FishPrice.Medium
                    displayName = "Medium Bullhead Catfish"
                elseif fishName == 'a_c_fishchainpickerel_01_ms' then 
                    fishPrice = Config.FishPrice.Medium
                    displayName = "Medium Chain Pickerel"
                elseif fishName == 'a_c_fishlargemouthbass_01_ms' then 
                    fishPrice = Config.FishPrice.Medium
                    displayName = "Medium Largemouth Bass"
                elseif fishName == 'a_c_fishperch_01_ms' then 
                    fishPrice = Config.FishPrice.Medium
                    displayName = "Medium Perch"
                elseif fishName == 'a_c_fishrainbowtrout_01_ms' then 
                    fishPrice = Config.FishPrice.Medium
                    displayName = "Medium Rainbow Trout"
                elseif fishName == 'a_c_fishredfinpickerel_01_ms' then 
                    fishPrice = Config.FishPrice.Medium
                    displayName = "Medium Redfin Pickerel"
                elseif fishName == 'a_c_fishrockbass_01_ms' then 
                    fishPrice = Config.FishPrice.Medium
                    displayName = "Medium Rock Bass"
                elseif fishName == 'a_c_fishsalmonsockeye_01_ml' then 
                    fishPrice = Config.FishPrice.Medium
                    displayName = "Medium Sockeye Salmon"
                elseif fishName == 'a_c_fishsalmonsockeye_01_ms' then 
                    fishPrice = Config.FishPrice.Medium
                    displayName = "Medium Sockeye Salmon"
                elseif fishName == 'a_c_fishsmallmouthbass_01_ms' then 
                    fishPrice = Config.FishPrice.Medium
                    displayName = "Medium Smallmouth Bass"
                
                -- Large Fish
                elseif fishName == 'a_c_fishchannelcatfish_01_lg' then 
                    fishPrice = Config.FishPrice.Large
                    displayName = "Large Channel Catfish"
                elseif fishName == 'a_c_fishchannelcatfish_01_xl' then 
                    fishPrice = Config.FishPrice.Large
                    displayName = "XL Channel Catfish"
                elseif fishName == 'a_c_fishlakesturgeon_01_lg' then 
                    fishPrice = Config.FishPrice.Large
                    displayName = "Large Lake Sturgeon"
                elseif fishName == 'a_c_fishlargemouthbass_01_lg' then 
                    fishPrice = Config.FishPrice.Large
                    displayName = "Large Largemouth Bass"
                elseif fishName == 'a_c_fishlongnosegar_01_lg' then 
                    fishPrice = Config.FishPrice.Large
                    displayName = "Large Longnose Gar"
                elseif fishName == 'a_c_fishmuskie_01_lg' then 
                    fishPrice = Config.FishPrice.Large
                    displayName = "Large Muskie"
                elseif fishName == 'a_c_fishnorthernpike_01_lg' then 
                    fishPrice = Config.FishPrice.Large
                    displayName = "Large Northern Pike"
                elseif fishName == 'a_c_fishrainbowtrout_01_lg' then 
                    fishPrice = Config.FishPrice.Large
                    displayName = "Large Rainbow Trout"
                elseif fishName == 'a_c_fishsalmonsockeye_01_lg' then 
                    fishPrice = Config.FishPrice.Large
                    displayName = "Large Sockeye Salmon"
                elseif fishName == 'a_c_fishsmallmouthbass_01_lg' then 
                    fishPrice = Config.FishPrice.Large
                    displayName = "Large Smallmouth Bass"
                
                -- Crustaceans
                elseif fishName == 'crayfish' then 
                    fishPrice = Config.FishPrice.Crayfish
                    displayName = "Crayfish"
                elseif fishName == 'lobster' then 
                    fishPrice = Config.FishPrice.Lobster
                    displayName = "Lobster"
                elseif fishName == 'crab' then 
                    fishPrice = Config.FishPrice.Crab
                    displayName = "Crab"
                elseif fishName == 'bluecrab' then 
                    fishPrice = Config.FishPrice.BlueCrab
                    displayName = "Blue Crab"
                end
                
                -- If this is a sellable fish, add it to our tracking
                if fishPrice > 0 then
                    local totalValue = fishPrice * amount
                    price = price + totalValue
                    Player.Functions.RemoveItem(fishName, amount, k)
                    hasfish = true
                    
                    -- Add to sold fish tracking
                    table.insert(soldFish, {
                        name = displayName,
                        amount = amount,
                        unitPrice = fishPrice,
                        totalValue = totalValue
                    })
                end
            end
        end
        
        if hasfish then
            Player.Functions.AddMoney('cash', price, 'fish-sold')
            TriggerEvent('rsg-log:server:CreateLog', Config.WebhookName, Config.WebhookTitle, Config.WebhookColour, GetPlayerName(src) .. Config.Lang1 .. price, false)
            
            -- Create detailed notification message
            local notificationMessage = "Fish Sold:\n"
            for i, fish in ipairs(soldFish) do
                notificationMessage = notificationMessage .. fish.amount .. "x " .. fish.name .. " ($" .. fish.totalValue .. ")\n"
            end
            notificationMessage = notificationMessage .. "\nTotal Earned: $" .. price
            
            -- Send detailed notification to client
            TriggerClientEvent('ox_lib:notify', source, {
                title = 'Fish Sale Complete', 
                description = notificationMessage, 
                type = 'success',
                duration = 8000 -- Show for 8 seconds since there's more info
            })
            
            hasfish = false
        else
            TriggerClientEvent('ox_lib:notify', source, {title = locale('sv_lang_1'), description = locale('sv_lang_2'), type = 'error' })
        end
    end
end)

-- ----------------------------------------------
-- -- command process fish for raw_fish
-- ----------------------------------------------
-- RSGCore.Commands.Add('processfish', locale('sv_lang_4'), {}, false, function(source)
--     local src = source
--     local Player = RSGCore.Functions.GetPlayer(src)
--     if not Player then return end
--     TriggerClientEvent('rex-fishmonger:client:playerprocessfish', src)
-- end, 'user')

----------------------------------------------
-- process fish for raw_fish
----------------------------------------------
RegisterServerEvent('rex-fishmonger:server:processfish')
AddEventHandler('rex-fishmonger:server:processfish', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    local raw_fish = 0
    local hasfish  = false

    if Player.PlayerData.items ~= nil and next(Player.PlayerData.items) ~= nil then
        for k, v in pairs(Player.PlayerData.items) do 
            if Player.PlayerData.items[k] ~= nil then 
                if Player.PlayerData.items[k].name == 'a_c_fishbluegil_01_sm' then 
                    raw_fish = raw_fish + (Config.FishAmount.Small * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishbluegil_01_sm', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishbullheadcat_01_sm' then 
                    raw_fish = raw_fish + (Config.FishAmount.Small * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishbullheadcat_01_sm', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishchainpickerel_01_sm' then 
                    raw_fish = raw_fish + (Config.FishAmount.Small * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishchainpickerel_01_sm', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishperch_01_sm' then 
                    raw_fish = raw_fish + (Config.FishAmount.Small * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishperch_01_sm', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishredfinpickerel_01_sm' then 
                    raw_fish = raw_fish + (Config.FishAmount.Small * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishredfinpickerel_01_sm', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishrockbass_01_sm' then 
                    raw_fish = raw_fish + (Config.FishAmount.Small * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishrockbass_01_sm', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishbluegil_01_ms' then 
                    raw_fish = raw_fish + (Config.FishAmount.Medium * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishbluegil_01_ms', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishbullheadcat_01_ms' then 
                    raw_fish = raw_fish + (Config.FishAmount.Medium * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishbullheadcat_01_ms', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishchainpickerel_01_ms' then 
                    raw_fish = raw_fish + (Config.FishAmount.Medium * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishchainpickerel_01_ms', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishlargemouthbass_01_ms' then 
                    raw_fish = raw_fish + (Config.FishAmount.Medium * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishlargemouthbass_01_ms', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishperch_01_ms' then 
                    raw_fish = raw_fish + (Config.FishAmount.Medium * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishperch_01_ms', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishrainbowtrout_01_ms' then 
                    raw_fish = raw_fish + (Config.FishAmount.Medium * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishrainbowtrout_01_ms', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishredfinpickerel_01_ms' then 
                    raw_fish = raw_fish + (Config.FishAmount.Medium * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishredfinpickerel_01_ms', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishrockbass_01_ms' then 
                    raw_fish = raw_fish + (Config.FishAmount.Medium * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishrockbass_01_ms', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishsalmonsockeye_01_ml' then 
                    raw_fish = raw_fish + (Config.FishAmount.Medium * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishsalmonsockeye_01_ml', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishsalmonsockeye_01_ms' then 
                    raw_fish = raw_fish + (Config.FishAmount.Medium * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishsalmonsockeye_01_ms', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishsmallmouthbass_01_ms' then 
                    raw_fish = raw_fish + (Config.FishAmount.Medium * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishsmallmouthbass_01_ms', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishchannelcatfish_01_lg' then 
                    raw_fish = raw_fish + (Config.FishAmount.Large * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishchannelcatfish_01_lg', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishchannelcatfish_01_xl' then 
                    raw_fish = raw_fish + (Config.FishAmount.Large * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishchannelcatfish_01_xl', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishlakesturgeon_01_lg' then 
                    raw_fish = raw_fish + (Config.FishAmount.Large * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishlakesturgeon_01_lg', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishlargemouthbass_01_lg' then 
                    raw_fish = raw_fish + (Config.FishAmount.Large * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishlargemouthbass_01_lg', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishlongnosegar_01_lg' then 
                    raw_fish = raw_fish + (Config.FishAmount.Large * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishlongnosegar_01_lg', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishmuskie_01_lg' then 
                    raw_fish = raw_fish + (Config.FishAmount.Large * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishmuskie_01_lg', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishnorthernpike_01_lg' then 
                    raw_fish = raw_fish + (Config.FishAmount.Large * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishnorthernpike_01_lg', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishrainbowtrout_01_lg' then 
                    raw_fish = raw_fish + (Config.FishAmount.Large * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishrainbowtrout_01_lg', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishsalmonsockeye_01_lg' then 
                    raw_fish = raw_fish + (Config.FishAmount.Large * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishsalmonsockeye_01_lg', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                elseif Player.PlayerData.items[k].name == 'a_c_fishsmallmouthbass_01_lg' then 
                    raw_fish = raw_fish + (Config.FishAmount.Large * Player.PlayerData.items[k].amount)
                    Player.Functions.RemoveItem('a_c_fishsmallmouthbass_01_lg', Player.PlayerData.items[k].amount, k)
                    hasfish = true
                end
            end
        end
        if hasfish then
            Player.Functions.AddItem('raw_fish', raw_fish)
            TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items['raw_fish'], 'add', raw_fish)
            Player.Functions.AddItem('trapbait', raw_fish)
            TriggerClientEvent('rsg-inventory:client:ItemBox', src, RSGCore.Shared.Items['trapbait'], 'add', raw_fish)
            hasfish = false
        else
            TriggerClientEvent('ox_lib:notify', source, {title = locale('sv_lang_1'), description = locale('sv_lang_3'), type = 'error' })
        end
    end
end)

--------------------------------------
-- register shop
--------------------------------------
CreateThread(function() 
    exports['rsg-inventory']:CreateShop({
        name = 'fishmonger',
        label = 'Fishmonger Shop',
        slots = #Config.FishmongerShopItems,
        items = Config.FishmongerShopItems,
        persistentStock = Config.PersistStock,
    })
end)

--------------------------------------
-- open shop
--------------------------------------
RegisterNetEvent('rex-fishmonger:server:openShop', function() 
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    exports['rsg-inventory']:OpenShop(src, 'fishmonger')
end)
