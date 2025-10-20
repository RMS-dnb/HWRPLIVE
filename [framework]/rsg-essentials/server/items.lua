local RSGCore = exports['rsg-core']:GetCoreObject()

-- -- HORSE BRUSH (10 uses, no cooldown)
RSGCore.Functions.CreateUseableItem("horse_brush", function(source, item)
    local Player = RSGCore.Functions.GetPlayer(source)
    if not Player then return end

    -- Initialize uses if missing
    if not item or not item.info then
        item.info = { uses = 40 }
    elseif not item.info.uses then
        item.info.uses = 40
    end

    -- Trigger brush interaction
    TriggerClientEvent("SIREVLC_STABLES_ITEM_INTERACTION", source, "BRUSHING", item.name)

    -- Decrease uses
    item.info.uses = item.info.uses - 1

    -- Remove current brush from inventory
    Player.Functions.RemoveItem(item.name, 1, item.slot)

    if item.info.uses > 0 then
        -- Re-add brush with updated uses
        Player.Functions.AddItem(item.name, 1, false, item.info)
        RSGCore.Functions.Notify(source, "Horse brush uses left: " .. item.info.uses, "primary")
    else
        RSGCore.Functions.Notify(source, "Your horse brush has worn out!", "error")
    end
end)


RSGCore.Functions.CreateUseableItem("horse_stimulant", function(source, item)
    local Player = RSGCore.Functions.GetPlayer(source)
    if not Player then return end

    -- Trigger correct stimulant interaction
    TriggerClientEvent("SIREVLC_STABLES_ITEM_INTERACTION", source, "STIMULANT", item.name)

    -- Remove stimulant after use (the client also handles this if ITEMREMOVED = true)
    Player.Functions.RemoveItem(item.name, 1, item.slot)

    -- Notify player (ox_lib or RSGCore style)
    RSGCore.Functions.Notify(source, "Horse stimulant used!", "success")
end)




-- HAY (with cooldown, removes on use)
-- RSGCore.Functions.CreateUseableItem("hay", function(source, item)
--     print("hay used by player: " .. source) -- Debug
    
--     local remaining = isOnCooldown(source, "hay")
--     print("Cooldown remaining: " .. remaining) -- Debug
    
--     if remaining > 0 then
--         print("Player on cooldown, sending notification") -- Debug
--         TriggerClientEvent('RSGCore:Notify', source, "You must wait " .. remaining .. " seconds before using again!", "error", 3000)
--         return
--     end
    
--     print("No cooldown, proceeding with item use") -- Debug
--     local Player = RSGCore.Functions.GetPlayer(source)
    
--     setCooldown(source, "hay")
--     print("Cooldown set for player: " .. source) -- Debug
    
--     TriggerClientEvent("sirevlc_horses_feed_boost", source, 30.0, 30.0)
--     Player.Functions.RemoveItem("hay", 1)
    
--     TriggerClientEvent('RSGCore:Notify', source, "Hay used! Cooldown: " .. itemCooldown .. "s", "success", 3000)
-- end)

-- SUGAR CUBE (with cooldown, removes on use)
-- RSGCore.Functions.CreateUseableItem("consumable_sugarcube", function(source, item)
--     local remaining = isOnCooldown(source, "consumable_sugarcube")
--     if remaining > 0 then
--         TriggerClientEvent('RSGCore:Notify', source, "You must wait " .. remaining .. " seconds before using again!", "error", 3000)
--         return
--     end
    
--     local Player = RSGCore.Functions.GetPlayer(source)
    
--     setCooldown(source, "consumable_sugarcube")
    
--     TriggerClientEvent("sirevlc_horses_feed_boost", source, 30.0, 30.0)
--     Player.Functions.RemoveItem("consumable_sugarcube", 1)
    
--     TriggerClientEvent('RSGCore:Notify', source, "Sugar cube used! Cooldown: " .. itemCooldown .. "s", "success", 3000)
-- end)

-- -- CARROT (with cooldown, removes on use)
-- RSGCore.Functions.CreateUseableItem("carrot", function(source, item)
--     local remaining = isOnCooldown(source, "carrot")
--     if remaining > 0 then
--         TriggerClientEvent('RSGCore:Notify', source, "You must wait " .. remaining .. " seconds before using again!", "error", 3000)
--         return
--     end
    
--     local Player = RSGCore.Functions.GetPlayer(source)
    
--     setCooldown(source, "carrot")
    
--     TriggerClientEvent("sirevlc_horses_feed", source, 30, 30)
--     Player.Functions.RemoveItem("carrot", 1)
    
--     TriggerClientEvent('RSGCore:Notify', source, "Carrot used! Cooldown: " .. itemCooldown .. "s", "success", 3000)
-- end)

-- RSGCore.Functions.CreateUseableItem("consumable_herb_wild_carrots", function(source, item)
--     local remaining = isOnCooldown(source, "carrot")
--     if remaining > 0 then
--         TriggerClientEvent('RSGCore:Notify', source, "You must wait " .. remaining .. " seconds before using again!", "error", 3000)
--         return
--     end
    
--     local Player = RSGCore.Functions.GetPlayer(source)
    
  
    
--     TriggerClientEvent("sirevlc_horses_feed", source, 30, 30)
--     Player.Functions.RemoveItem("consumable_herb_wild_carrots", 1)
    
--     TriggerClientEvent('RSGCore:Notify', source, "Carrot used! Cooldown: " .. itemCooldown .. "s", "success", 3000)
-- end)

-- -- APPLE (with cooldown, removes on use)
-- RSGCore.Functions.CreateUseableItem("apple", function(source, item)
--     local remaining = isOnCooldown(source, "apple")
--     if remaining > 0 then
--         RSGCore.Functions.Notify(source, "You must wait " .. remaining .. " seconds before using again!", "error")
--         return
--     end
    
--     local Player = RSGCore.Functions.GetPlayer(source)
--     TriggerClientEvent("sirevlc_horses_feed", source, 30, 30)
--     Player.Functions.RemoveItem("apple", 1)
    
--     setCooldown(source, "apple")
--     RSGCore.Functions.Notify(source, "Apple used! Cooldown: " .. itemCooldown .. "s", "success")
-- end)


RSGCore.Functions.CreateUseableItem("binoculars", function(source, item)
    local Player = RSGCore.Functions.GetPlayer(source)
    TriggerClientEvent("binoculars:Toggle", source)
end)

RSGCore.Functions.CreateUseableItem("fan", function(source, item)
    local Player = RSGCore.Functions.GetPlayer(source)
    if Player.Functions.RemoveItem(item.name, 0, item.slot) then
        TriggerClientEvent("prop:fan", source, item.name)
    end
end)

 RSGCore.Functions.CreateUseableItem("apple", function(source, item)
 local _source = source 
 local iname = "apple"
 local User = RSGCore.Functions.GetPlayer(_source)
 TriggerClientEvent("sirevlc_horses_feed",_source, 30, 30)
 User.Functions.RemoveItem(iname, 1)
 end)

  RSGCore.Functions.CreateUseableItem("hay", function(source, item)
 local _source = source 
 local iname = "hay"
 local User = RSGCore.Functions.GetPlayer(_source)
 TriggerClientEvent("sirevlc_horses_feed_boost",_source, 20.0, 20.0)
 User.Functions.RemoveItem(iname, 1)
 end)
 
 RSGCore.Functions.CreateUseableItem("consumable_haycube", function(source, item)
 local _source = source 
 local iname = "consumable_haycube"
 local User = RSGCore.Functions.GetPlayer(_source)
 TriggerClientEvent("sirevlc_horses_feed_boost",_source, 25.0, 25.0)
 User.Functions.RemoveItem(iname, 1)
 end)
 
 RSGCore.Functions.CreateUseableItem("consumable_sugarcube", function(source, item)
 local _source = source 
 local iname = "consumable_sugarcube"
 local User = RSGCore.Functions.GetPlayer(_source)
 TriggerClientEvent("sirevlc_horses_feed_boost",_source, 25.0, 25.0)
 User.Functions.RemoveItem(iname, 1)
 end)
 
 RSGCore.Functions.CreateUseableItem("carrot", function(source, item)
 local _source = source 
 local iname = "carrot"
 local User = RSGCore.Functions.GetPlayer(_source)
 TriggerClientEvent("sirevlc_horses_feed",_source, 30, 30)
 User.Functions.RemoveItem(iname, 1)
 end)

RSGCore.Functions.CreateUseableItem("consumable_herb_wild_carrots", function(source, item)
 local _source = source 
 local iname = "consumable_herb_wild_carrots"
 local User = RSGCore.Functions.GetPlayer(_source)
 TriggerClientEvent("sirevlc_horses_feed",_source, 30, 30)
 User.Functions.RemoveItem(iname, 1)
 end)



RSGCore.Functions.CreateUseableItem("firstaid", function(source, item)
    local Player = RSGCore.Functions.GetPlayer(source)
    TriggerClientEvent('consumables:client:Usefirstaid', source)
    
    -- Remove the first aid item after use
    Player.Functions.RemoveItem("firstaid", 1)
    TriggerClientEvent('inventory:client:ItemBox', source, RSGCore.Shared.Items["firstaid"], "remove")
end)

--Horse items


RSGCore.Functions.CreateUseableItem("carrot" 	    , function(source, item) local _source = source local User = RSGCore.Functions.GetPlayer(_source)  TriggerClientEvent("SIREVLC_STABLES_ITEM_INTERACTION", _source, "FEEDING", "carrot")   	    end)
RSGCore.Functions.CreateUseableItem("consumable_herb_wild_carrots" 	    , function(source, item) local _source = source local User = RSGCore.Functions.GetPlayer(_source)  TriggerClientEvent("SIREVLC_STABLES_ITEM_INTERACTION", _source, "FEEDING", "consumable_herb_wild_carrots")   	    end)
RSGCore.Functions.CreateUseableItem("consumable_sugarcube" 	 	, function(source, item) local _source = source local User = RSGCore.Functions.GetPlayer(_source)  TriggerClientEvent("SIREVLC_STABLES_ITEM_INTERACTION", _source, "FEEDING", "consumable_sugarcube")       end)
RSGCore.Functions.CreateUseableItem("hay" 	    , function(source, item) local _source = source local User = RSGCore.Functions.GetPlayer(_source)  TriggerClientEvent("SIREVLC_STABLES_ITEM_INTERACTION", _source, "FEEDING", "hay")   	    end)
RSGCore.Functions.CreateUseableItem("apple" 	    	, function(source, item) local _source = source local User = RSGCore.Functions.GetPlayer(_source)  TriggerClientEvent("SIREVLC_STABLES_ITEM_INTERACTION", _source, "FEEDING", "apple")   		end)
RSGCore.Functions.CreateUseableItem("consumable_horse_ointment" , function(source, item) local _source = source local User = RSGCore.Functions.GetPlayer(_source)  TriggerClientEvent("SIREVLC_STABLES_ITEM_INTERACTION", _source, "OINTMENT", "consumable_horse_ointment") end)
RSGCore.Functions.CreateUseableItem("kit_hoof_knife", 			  function(source, item) local _source = source local User = RSGCore.Functions.GetPlayer(_source)  TriggerClientEvent("SIREVLC_STABLES_ITEM_INTERACTION", _source, "SHOE_CLEANING", "kit_hoof_knife") end)
RSGCore.Functions.CreateUseableItem("horse_stimulant" 	    , function(source, item) local _source = source local User = RSGCore.Functions.GetPlayer(_source)  TriggerClientEvent("SIREVLC_STABLES_ITEM_INTERACTION", _source, "STIMULANT", "horse_stimulant")   	    end)
