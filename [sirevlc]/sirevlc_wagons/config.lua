Config = {}

-- Version 2.93 - 16.08.25

-- EXPORTS 

-- exports.sirevlc_wagons.getWagonID()     -- returns wagon id 
-- exports.sirevlc_wagons.getWagonEntity() -- returns wagon entity
 

-- EVENTS 
-- THIS WILL REMOVE THE PLAYER WAGON :
-- TriggerEvent("sirevlc_wagons_remove_wagon")

--
Config.Debug 					  = false 

Config.HuntingWagonExpansion 	  = true  -- TURN THIS TO TRUE ONLY IF YOU ARE USING SIREVLC_HUNTING_WAGON EXPANSION 
--
 
-- Enable your framework here. This will be used for opening stash events
Config.REDEMRP2          		  = false 
Config.REDEMRP2023REBOOT 		  = false 
Config.VORP              		  = false 
Config.RSG               		  = true 

Config.CallMyWagonEverwyhere      = false       -- Not recommended unless you know what you are doing, this will allow your wagon to spawn everywhere (even in buildings so use it at your own risks :)) / If set to false it will spawn your wagon only on the nearest road (RDO LIKE)
Config.OpenSpawnWagonMenu         = 0xAB62E997  -- [5] key by default. / put Config.OpenSpawnWagonMenu = 0 to make the menu not accessible
Config.EnableNotifications        = true 	    -- This will enable or disable general notifications (recommended to keep these)

-- When selling to stable, divide the price of the wagon by :

Config.SellDivider                = 10000
Config.RepairPrice                = 20.0
Config.InvincibleWagons           = false       -- HORSES CAN STILL DETACH
Config.InvincibleHuntingWagons    = false       -- HORSES CAN STILL DETACH


Config.SharedStash                = true 	--if you want wagons lockers to be accessible by everyone. It will automatically activate when the owner of the wagon opens it's stash. Keep in mind the wagon must be stopped and the driver seat unoccupied.						  
Config.StashRoleRestrictions      = false 
Config.StashRoles = {						-- Roles that are authorized to search other player's wagons 
"horsetrainer",
"averagerider",   
"trapper",
}

--------------------------------- 
--  VORP STASH OPTIONS --
--------------------------------- 
Config.acceptWeapons        = true
Config.shared               = true
Config.ignoreItemStackLimit = true
Config.whitelistItems       = false
Config.UsePermissions       = false
Config.UseBlackList         = true
Config.whitelistWeapons     = false
-- see https://vorpcore.github.io/VORP_Documentation/api/inventory#inventory-custominventory for official documentation 
----------------------------------- 
--------------------------------------------------
		     -- DISCORD WEBHOOKS --
-------------------------------------------------- 

Config.WebhookUrl                        	= ""
Config.WebhookMainTitle                  	= "Stables"
	
-- PURCHASE FROM STABLE EVENT --         	   
Config.UseWebhookPurchaseFromStables     	= false  -- Turn to true if you want to use the Discord Webhook for this event
Config.WebhookPurchaseTitle              	= "Wagon Purchase"
Config.WebhookPurchase                   	= "purchased the "
Config.WebhookPurchaseFor                	= "for"
Config.WebhookPurchase2                  	= "and"
Config.WebhookPurchase3                  	= "gold"
	
-- PURCHASE FROM PLAYER EVENT --         	    
Config.UseWebhookPurchaseFromPlayer      	= false -- Turn to true if you want to use the Discord Webhook for this event
Config.WebhookPurchaseFromPlayer         	= "Purchased a wagon from "
	
-- SOLD WAGON TO STABLE --               	               
Config.UseWebhookSold                    	= false -- Turn to true if you want to use the Discord Webhook for this event
Config.WebhookSoldTitle                  	= "Wagon Sell"
Config.WebhookSoldWagonNamed             	= "sold a wagon named"
Config.WebhookSoldWagonFor               	= "for"	
Config.WebhookSoldWagon2                 	= "and"	
Config.WebhookSoldWagon3                 	= "gold"	

-------------------------------
		 --PROMPTS--
-------------------------------
Config.CameraChangeKey              		= 0xD8CF0C95 -- C
											
Config.wagonStable                  		= "Wagons"
											
Config.PromptSellTitle              		= "Sell Wagon"
Config.PromptSell                   		= 0x43DBF61F--ENTER
											
Config.PromptLockerTitle            		= "Open Stash"
Config.PromptLocker                 		= 0xD8F73058 --U
											
Config.PromptStopSellTitle          		= "Stop Selling"
Config.PromptStopSell               		= 0xD8F73058 --U
											
Config.PromptStoreTitle             		= "Park In Stables"
Config.PromptStore                  		= 0xD8CF0C95 -- C
		
Config.PromptStoreAnimalTitle       		= "Store"                    -- USABLE WITH SIREVLC_HUNTING_WAGON EXPANSION ONLY 
Config.PromptGetStoredTitle         		= "Get Carcasses"  			 -- USABLE WITH SIREVLC_HUNTING_WAGON EXPANSION ONLY 
Config.HuntingWagonPrompt           		= "Hunting Wagon"            -- USABLE WITH SIREVLC_HUNTING_WAGON EXPANSION ONLY 
Config.PromptStoreAnimal       	    		= 0x43DBF61F  -- ENTER       -- USABLE WITH SIREVLC_HUNTING_WAGON EXPANSION ONLY 
Config.PromptGetStored         	    		= 0x8AAA0AD4  -- LALT        -- USABLE WITH SIREVLC_HUNTING_WAGON EXPANSION ONLY 
		
Config.PromptBuywagonTitle 					= "Buy"
Config.PromptBuywagon      					= 0x43DBF61F  -- ENTER

--------------------------------------------------
    --AUTOMATICALLY SEND BACK WAGON OPTION--
-------------------------------------------------- 

Config.AutomaticWagonDelete         		= false --If distance is superior to below it will automatically delete your wagon (check that you don't have an entity distance limit on your server)
Config.AutomaticWagonDeleteDistance 		= 90   
 
-----------------------------------------------
	-- SIREVLC_HUNTING_WAGON EXPANSION -- 
-----------------------------------------------

Config.HuntingWagon				  		   = "Hunting Wagon"   	    			 	      -- SIREVLC_HUNTING_WAGON EXPANSION	
Config.HuntingWagonCarcass				   = "Carcass"   	    			 		      -- SIREVLC_HUNTING_WAGON EXPANSION	
Config.HuntingWagonPelt				       = "Pelt"   	    			 		          -- SIREVLC_HUNTING_WAGON EXPANSION	
Config.HuntingWagonCarcassSpawned		   = "Carcass spawned"   	    			      -- SIREVLC_HUNTING_WAGON EXPANSION	
Config.HuntingWagonCarcassRemoved		   = "Carcass removed"   	    			      -- SIREVLC_HUNTING_WAGON EXPANSION	
Config.HuntingWagonPeltSpawned		       = "Pelt spawned"   	    			          -- SIREVLC_HUNTING_WAGON EXPANSION	
Config.HuntingWagonPeltRemoved		       = "Pelt removed"   	    			          -- SIREVLC_HUNTING_WAGON EXPANSION	
Config.HuntingWagonAnimalPartRemoved	   = "Animal Part removed"   	    			  -- SIREVLC_HUNTING_WAGON EXPANSION	
Config.HuntingWagonNoCarcassMenu		   = "You don't have any carcasses in your cart"  -- SIREVLC_HUNTING_WAGON EXPANSION	
Config.HuntingWagonNoPeltMenu		       = "You don't have any pelts in your cart"      -- SIREVLC_HUNTING_WAGON EXPANSION	
Config.HuntingWagonNoRole		           = "You don't have the right role to do this"   -- SIREVLC_HUNTING_WAGON EXPANSION
Config.HuntingWagonCarcassStored  		   = "Stored:"    		    			 	      -- SIREVLC_HUNTING_WAGON EXPANSION
Config.HuntingWagonSkinned   		       = "Skinned"                 			 	      -- SIREVLC_HUNTING_WAGON EXPANSION
Config.HuntingWagonQualityPoor    		   = "Poor"                 			 	      -- SIREVLC_HUNTING_WAGON EXPANSION
Config.HuntingWagonQualityGood    		   = "Good"                 			 	      -- SIREVLC_HUNTING_WAGON EXPANSION
Config.HuntingWagonQualityPerfect 		   = "Perfect"              			 	      -- SIREVLC_HUNTING_WAGON EXPANSION
Config.HuntingWagonMaxCarcasses  		   = "You have reached the carcasses limit"  	  -- SIREVLC_HUNTING_WAGON EXPANSION
Config.HuntingWagonMaxPelts  		       = "You have reached the pelts limit"  	      -- SIREVLC_HUNTING_WAGON EXPANSION
Config.HuntingWagonMenuDesc  		       = "Display the options"  				      -- SIREVLC_HUNTING_WAGON EXPANSION
 
Config.HuntingWagonMenu = {
  {label = "Carcasses",      value = "action01",  desc = "Display all carcasses stored in your wagon",  image = 'items/animal_deer.png'},              -- SIREVLC_HUNTING_WAGON EXPANSION
  {label = "Pelts",          value = "action02",  desc = "Display all pelts stored in your wagon",      image = 'items/provision_ram_hide.png'},       -- SIREVLC_HUNTING_WAGON EXPANSION
} 
 
Config.HuntingWagonManage = {
	{label = "Spawn",         value = "action01",  desc = "Spawn it from your cart",   			 image = 'items/emote_glad_to_see_you.png'},           -- SIREVLC_HUNTING_WAGON EXPANSION
	{label = "Remove",        value = "action02",  desc = "This will remove it from your cart",  image = 'items/upgrade_fsh_bait_lure_none.png'},	   -- SIREVLC_HUNTING_WAGON EXPANSION
}  
 
 
-------------------------------
		   -- TEXTS --
-------------------------------

Config.TextNotifWagonGetCloserToRoad       = "Get Closer to the road !"
Config.TextNotifStableLightsOn             = "Lights On"
Config.TextNotifStableLightsOnDesc         = "Lights On"
Config.TextNotifStableLightsOff            = "Lights Off"
Config.TextNotifStableLightsOffDesc        = "Lights Off"

Config.CameraChangeKeyNotif                = "Press C to change camera"
Config.TextNotifwagon                      = "Wagons"
Config.TextNotifJobRequired                = "Job Required:"
Config.TextNotifNoequipment                = "No Equipment"
Config.TextNotifLockerTooFarAway           = "Get closer to your wagon"
Config.TextNotifNotDestroyed               = "Your wagon is not damaged"
Config.TextNotifWagonState                 = "<p><span style='font-weight:bold;font-size:25px;'>Wagon State</span>"  
Config.TextNotifGoodCondition              = "<p><span style='color:gold;font-weight:bold;font-size:20px;'>Perfect Condition</span>"  
Config.TextNotifDestroyed                  = "<p><span style='color:red;font-weight:bold;font-size:20px;'>Destroyed</span>"  
Config.textNotifStartedSellingToPlayer     = "Sell Started"
Config.TextNotifSell                       = "Price"
Config.TextNotifAddPrice                   = "Price"
Config.TextNotifAddName                    = "Add Name"
Config.TextNotifWeightLimit                = "Weight Limit: "

Config.TextNotifConfirmDelete              = "To delete and sell wagon type:"
Config.TextNotifConfirmText                = "    | Sell Price $"
Config.TextNotifDamagedwagon               = "Your wagon is damaged"
Config.TextNotifDamagedwagonGoToStable     = "Go to the nearest stables to repair your wagon"
Config.TextNotifRepairFirst                = "You need to repair your wagon first"
Config.TextNotifRepair                     = "Wagon Repair"
Config.TextNotifRepaired                   = "Wagon Repaired"
Config.TextNotifRepairNoMoney              = "You dont have enough money"
Config.TextNotifNoJob                      = "You dont have the required job"
Config.TextNotifRepaired                   = "Wagon Repaired"
Config.TextNotifwagonShop                  = "<p><span style='color:gold;'>Wagons</span>"
Config.TextNotifBuywagonNoJob              = "You dont have the required job"
Config.TextNotifBuywagonNoMoney            = "Not enough money to purchase"
Config.TextNotifCustomizationBought        = "You bought a customization element"
Config.TextNotifCustomizeNoMoney           = "Not enough money to customize"
Config.TextNotifwagonBought                = "You bought a wagon for"
Config.TextNotifwagonBought2               = "and"
Config.TextNotifwagonBought3               = "Gold"
Config.TextNotifwagonCustomize             = "Wagon Customize"
Config.TextNotifCustomizeNoMoney           = "No money for the equipment"
Config.TextNotifequipmentBought            = "You have purchased equipment"
Config.TextNotifNoEquipment                = "No equipment here !"
Config.TextNotifSellwagon                  = "Sell wagon"
Config.TextNotifSoldwagon                  = "You sold your wagon for $"
Config.TextNotifSoldwagon2                 = "and"
Config.TextNotifDollarSign                 = "$"
Config.TextNotifGoldSign                   = "Gold"
Config.TextNotifBuywagon                   = "Buy wagon"
Config.TextNotifBuyPlayerwagonNoMoneyBuyer = "The buyer has not enough money"
Config.TextNotifStableOccupied             = "Something is on the Stables parking spot"
Config.TextNotifwagonFarAway               = "Your wagon is too far away from the stables"
Config.TextNotifWaitLoad                   = "Loading Wagons..."
 
Config.TextNotifSentBack                   = "Your wagon was parked in the stables"
Config.TextNotifOwnedWagonSpawned          = "Wagon spawned"
Config.TextNotifOwnedwagons                = "Owned Wagons"
Config.TextNotifSelectwagon                = "Select your wagon"
Config.TextNotifBuywagon                   = "Buy wagon"
Config.TextNotifBuywagonDesc               = "Buy new wagon"
Config.TextNotifOptions                    = "Options"
Config.TextNotifManageDesc                 = "Manage wagon"
Config.TextNotifwagonManage                = "Manage"
Config.TextNotifManageSpawn                = "Spawn wagon"
Config.TextNotifManageSpawnDesc            = "Spawn your wagon"
Config.TextNotifManageRepair               = "Repair wagon"
Config.TextNotifManageRepairDesc           = "Repair for $"
Config.TextNotifManageDelete               = "Sell Wagon"
Config.TextNotifManageDeleteDesc           = "Sell for $"
Config.TextNotifManageCustomization        = "Customize wagon"
Config.TextNotifManageCustomizationDesc    = "Customize your wagon"
Config.TextNotifCustomize                  = "Customize:"
Config.TextNotifCustomizeDesc              = "Customize category"
Config.TextNotifNoequipment                = "No equipments"
Config.TextNotifNoTint                     = "This wagon has no Tints"
Config.TextNotifTintDesc                   = "Buy Tint"
Config.TextNotifNodecorations              = "This wagon has no decorations"
Config.TextNotifLiveryDesc                 =  "Buy Livery"
Config.TextNotifNoSet                      = "This wagon has no Prop Sets"
Config.TextNotifPropSetDesc                = "Buy Prop Sets"
Config.TextNotifNoLantern                  = "This wagon has no Lanterns"
Config.TextNotifLanternDesc                = "Buy Lantern"
Config.TextNotifNoExtras                   = "This wagon has no Extras"
Config.TextNotifExtrasDesc                 = "Buy Extras"
Config.TextNotifSelectCat                  = "Select category"

Config.TextNotifwagonCategory              = "Categories"
Config.TextNotifBuyDesc                    = "Buy wagon<br>Job Requirement:"
Config.TextNotifBUY                        = "Buy"
Config.TextNotifTints                      = "Tints"
Config.TextNotifdecorations                = "decorations"
Config.TextNotifExtras                     = "Extras"
Config.TextNotifLanterns                   = "Lanterns"
Config.TextNotifPropSets                   = "PropSets"
 
----------------------------------
	--STABLES CONFIGURATION--
----------------------------------

-- For camera pos see: https://vespura.com/doc/natives/?_0x40C23491CE83708E
-- camera1example = {a= float posX, b= float posY, c= float posZ, d= float rotX, e= float rotY, f= float rotZ, g= float fov},
-- If you create a new stable it must be listed in both horses / wagons script ! 
-- cameras from 1 to 7 can be different between both horses /wagons and horsepos/wagonpos but you have to put the same pos, introcamerapos, menucamera, exitcamerapos and playergotocoords
 
Config.wagonStables = {

    [1] = {
        name = "Valentine",
        pos = {x=-366.69, y=787.06, z=116.16},
        wagonpos = {x=-373.64, y=775.70, z=116.14, h=-87.04},
		wagonspawnpos = {x=-366.30, y=805.59, z=115.94, h=-87.23},
		introcamerapos   = {a= -350.23, b= 777.28, c= 120.35, d= -6.37,  e= 0.00, f= 46.36,   g= 50.00}, -- Camera view when you're entering the stable
		menucamera       = {a= -367.49, b= 788.41, c= 116.36, d= 1.69,   e= 0.00, f= -26.87,  g= 50.00}, -- Camera view when you're in the main stable menu
		wagoncamera1     = {a= -377.49, b= 770.72, c= 118.40, d= -14.29, e= 0.00, f= -51.15,  g= 50.00}, -- Stable Wagon Camera 
		wagoncamera2     = {a= -370.66, b= 773.91, c= 117.66, d= -12.01, e= 0.00, f= 54.44,   g= 50.00}, -- Stable Wagon Camera 
		wagoncamera3     = {a= -368.43, b= 778.43, c= 117.75, d= -9.02,  e= 0.00, f= 108.79,  g= 50.00}, -- Stable Wagon Camera 
		wagoncamera4     = {a= -369.18, b= 772.87, c= 117.30, d= -5.64,  e= 0.00, f= 49.11,   g= 50.00}, -- Stable Wagon Camera 
		wagoncamera5     = {a= -370.03, b= 767.77, c= 117.67, d= -4.05,  e= 0.00, f= 4.92,    g= 50.00}, -- Stable Wagon Camera 
		wagoncamera6     = {a= -378.02, b= 772.77, c= 119.91, d= -30.32, e= 0.00, f= -58.26,  g= 50.00}, -- Stable Wagon Camera 
		wagoncamera7     = {a= -379.64, b= 775.40, c= 118.37, d= -17.11, e= 0.00, f= -87.36,  g= 50.00}, -- Stable Wagon Camera 
		exitcamerapos    = {a= -353.20, b= 795.49, c= 116.13, d= 10.01,  e= 0.00, f= 131.23,  g= 50.00}, -- Camera view when you exit the stable
		playergotocoords = {x= -358.2167663574219, y= 787.9071044921875, z= 116.16217041015625},         -- Coords where the player is heading when exiting the stable		
    },
	
    [2] = {
        name = "Blackwater",
        pos = {x=-866.92, y=-1382.97, z= 43.50},
        wagonpos = {x=-866.92, y=-1382.97, z= 43.50, h=-90.0},
		wagonspawnpos = {x=-873.82, y=-1389.68, z=43.53, h=-169.0},
		introcamerapos   = {a= -843.67, b= -1380.75, c= 48.19, d= -3.98,  e= 0.00, f= 41.33,   g= 50.00}, -- Camera view when you're entering the stable
		menucamera       = {a= -873.34, b= -1362.55, c= 43.41, d= 1.20,   e= 0.00, f= -84.10,  g= 50.00}, -- Camera view when you're in the main stable menu
		wagoncamera1     = {a= -871.30, b= -1388.19, c= 45.26, d= -5.02,  e= 0.00, f= -54.81,  g= 50.00}, -- Stable Wagon Camera 
		wagoncamera2     = {a= -863.84, b= -1384.91, c= 44.87, d= -8.04,  e= 0.00, f= 55.87,   g= 50.00}, -- Stable Wagon Camera 
		wagoncamera3     = {a= -871.17, b= -1378.14, c= 44.75, d= -2.38,  e= 0.00, f= -145.55, g= 50.00}, -- Stable Wagon Camera 
		wagoncamera4     = {a= -861.95, b= -1380.10, c= 44.75, d= -4.32,  e= 0.00, f= 121.31,  g= 50.00}, -- Stable Wagon Camera 
		wagoncamera5     = {a= -862.43, b= -1386.50, c= 44.75, d= -4.31,  e= 0.00, f= 45.55,   g= 50.00}, -- Stable Wagon Camera 
		wagoncamera6     = {a= -866.45, b= -1389.31, c= 44.75, d= -2.83,  e= 0.00, f= 1.51,    g= 50.00}, -- Stable Wagon Camera 
		wagoncamera7     = {a= -872.43, b= -1382.90, c= 46.11, d= -14.99, e= 0.00, f= -90.91,  g= 50.00}, -- Stable Wagon Camera 
		exitcamerapos    = {a= -848.68, b= -1357.88, c= 43.03, d= 12.00,  e= 0.00, f= 135.56,  g= 50.00}, -- Camera view when you exit the stable
		playergotocoords = {x=-852.9266357421875, y=-1365.8509521484375, z=43.54537200927734},            -- coords where the player is heading when exiting the stable		
    },
	
    [3] = {
        name = "Saint Denis",
        pos = {x=2500.21, y=-1418.25, z=45.92},
        wagonpos = {x=2500.21, y=-1418.25, z=45.92, h=-178.0},
		wagonspawnpos = {x=2507.09, y=-1404.01, z=46.08, h=89.04},
		introcamerapos   = {a= 2491.38, b= -1424.04, c= 49.86, d= -5.16,  e= 0.00, f= -142.98, g= 50.00}, -- Camera view when you're entering the stable
		menucamera       = {a= 2504.75, b= -1445.39, c= 46.66, d= 1.21,   e= 0.00, f= 89.81,   g= 50.00}, -- Camera view when you're in the main stable menu
		wagoncamera1     = {a= 2495.64, b= -1414.22, c= 48.55, d= -14.75, e= 0.00, f= -144.95, g= 50.00}, -- Stable Wagon Camera 
		wagoncamera2     = {a= 2498.14, b= -1421.08, c= 47.53, d= -7.35,  e= 0.00, f= -39.52,  g= 50.00}, -- Stable Wagon Camera 
		wagoncamera3     = {a= 2505.84, b= -1415.46, c= 47.74, d= -8.56,  e= 0.00, f= 115.06,  g= 50.00}, -- Stable Wagon Camera 
		wagoncamera4     = {a= 2504.00, b= -1422.74, c= 47.68, d= -7.73,  e= 0.00, f= 35.83,   g= 50.00}, -- Stable Wagon Camera 
		wagoncamera5     = {a= 2496.03, b= -1422.08, c= 47.68, d= -8.00,  e= 0.00, f= -54.40,  g= 50.00}, -- Stable Wagon Camera 
		wagoncamera6     = {a= 2494.08, b= -1419.68, c= 48.36, d= -11.38, e= 0.00, f= -86.83,  g= 50.00}, -- Stable Wagon Camera 
		wagoncamera7     = {a= 2499.97, b= -1413.50, c= 48.36, d= -16.26, e= 0.00, f= -178.54, g= 50.00}, -- Stable Wagon Camera 
		exitcamerapos    = {a= 2502.13, b= -1425.34, c= 45.43, d= 12.92,  e= 0.00, f= -178.81, g= 50.00}, -- Camera view when you exit the stable
		playergotocoords = {x= 2502.0205078125, y= -1431.8392333984375, z= 46.23255920410156}, 			  -- Coords where the player is heading when exiting the stable		
    },
	
    [4] = {
        name = "Rhodes",
        pos = {x=1212.49, y=-181.71, z=101.04 },
        wagonpos = {x=1212.49, y=-181.71, z=101.04, h=14.73},
		wagonspawnpos = {x=1224.59, y=-199.74, z=101.22, h=-73.06},
		introcamerapos   = {a= 1213.88, b= -174.17, c= 104.71, d=-5.21,   e= 0.00, f= 155.84,  g= 50.00}, -- Camera view when you're entering the stable
		menucamera       = {a= 1213.82, b= -186.68, c= 100.93, d=1.22,    e= 0.00, f= -144.06, g= 50.00}, -- Camera view when you're in the main stable menu
		wagoncamera1     = {a= 1218.86, b= -183.59, c= 103.68, d= -14.42, e= 0.00, f= 61.93,   g= 50.00}, -- Stable Wagon Camera 
		wagoncamera2     = {a= 1213.42, b= -178.82, c= 102.58, d= -5.07,  e= 0.00, f= 161.64,  g= 50.00}, -- Stable Wagon Camera 
		wagoncamera3     = {a= 1208.23, b= -178.82, c= 102.96, d= -13.76, e= 0.00, f= -131.23, g= 50.00}, -- Stable Wagon Camera 
		wagoncamera4     = {a= 1214.23, b= -176.26, c= 102.96, d= -12.26, e= 0.00, f= 152.62,  g= 50.00}, -- Stable Wagon Camera 
		wagoncamera5     = {a= 1207.55, b= -178.66, c= 105.58, d= -36.40, e= 0.00, f= -119.34, g= 50.00}, -- Stable Wagon Camera 
		wagoncamera6     = {a= 1218.31, b= -178.40, c= 102.78, d= -5.37,  e= 0.00, f= 105.72,  g= 50.00}, -- Stable Wagon Camera 
		wagoncamera7     = {a= 1213.99, b= -186.45, c= 102.78, d= -7.89,  e= 0.00, f= 16.58,   g= 50.00}, -- Stable Wagon Camera 
		exitcamerapos    = {a= 1204.46, b= -178.86, c= 100.38, d=13.41,   e= 0.00, f= -160.53, g= 50.00}, -- Camera view when you exit the stable
		playergotocoords = {x= 1205.957275390625, y= -182.55801391601562, z= 101.15511322021484}, 		  -- Coords where the player is heading when exiting the stable		
    },
	
    [5] = {
        name = "Annesburg",
        pos = {x=2954.51, y=805.21, z=51.36},
        wagonpos = {x=2954.51, y=805.21, z=51.36, h=153.68},
		wagonspawnpos = {x=2943.91, y=784.54, z=51.31, h=-137.0},
		introcamerapos   = {a= 2949.83, b= 805.00, c= 53.14, d= -2.48,  e= 0.00, f= -126.83, g= 50.00}, -- Camera view when you're entering the stable
		menucamera       = {a= 2969.31, b= 795.09, c= 51.62, d= -1.83,  e= 0.00, f= -179.09, g= 50.00}, -- Camera view when you're in the main stable menu
		wagoncamera1     = {a= 2951.35, b= 811.13, c= 53.24, d= -8.65,  e= 0.00, f= -168.06, g= 50.00}, -- Stable Wagon Camera 
		wagoncamera2     = {a= 2951.46, b= 803.22, c= 52.52, d= -1.23,  e= 0.00, f= -60.18,  g= 50.00}, -- Stable Wagon Camera 
		wagoncamera3     = {a= 2960.40, b= 807.63, c= 52.88, d= -10.10, e= 0.00, f= 110.16,  g= 50.00}, -- Stable Wagon Camera 
		wagoncamera4     = {a= 2955.09, b= 799.23, c= 52.70, d= -5.33,  e= 0.00, f= 0.41,    g= 50.00}, -- Stable Wagon Camera 
		wagoncamera5     = {a= 2948.97, b= 802.65, c= 52.70, d= -7.02,  e= 0.00, f= -73.57,  g= 50.00}, -- Stable Wagon Camera 
		wagoncamera6     = {a= 2948.99, b= 807.45, c= 53.96, d= -16.05, e= 0.00, f= -116.92, g= 50.00}, -- Stable Wagon Camera 
		wagoncamera7     = {a= 2956.84, b= 809.74, c= 53.06, d= -5.07,  e= 0.00, f= 151.75,  g= 50.00}, -- Stable Wagon Camera 
		exitcamerapos    = {a= 2951.12, b= 795.92, c= 50.86, d= 11.12,  e= 0.00, f= -89.80,  g= 50.00}, -- Camera view when you exit the stable
		playergotocoords = {x= 2955.276123046875, y= 795.8743896484375, z= 51.39943313598633}, 		    -- Coords where the player is heading when exiting the stable		
    },
	
    [6] = {
        name = "Colter",
        pos = {x=-1349.50, y=2417.86, z=307.01},
        wagonpos = {x=-1349.50, y=2417.86, z=307.01, h=154.23},
		wagonspawnpos = {x=-1333.01, y=2382.69, z=305.94, h=118.09},
		introcamerapos   = {a= -1321.58, b= 2407.67, c= 310.90, d= -4.78,  e= 0.00, f= 111.65,  g= 50.00}, -- Camera view when you're entering the stable
		menucamera       = {a= -1333.95, b= 2397.01, c= 307.90, d= -5.58,  e= 0.00, f= 66.20,   g= 50.00}, -- Camera view when you're in the main stable menu
		wagoncamera1     = {a= -1351.89, b= 2423.90, c= 309.16, d= -8.27,  e= 0.00, f= -170.22, g= 50.00}, -- Stable Wagon Camera 
		wagoncamera2     = {a= -1352.35, b= 2416.18, c= 308.45, d= -7.35,  e= 0.00, f= -66.25,  g= 50.00}, -- Stable Wagon Camera 
		wagoncamera3     = {a= -1342.96, b= 2415.55, c= 308.61, d= -5.16,  e= 0.00, f= 63.99,   g= 50.00}, -- Stable Wagon Camera 
		wagoncamera4     = {a= -1348.20, b= 2412.06, c= 308.61, d= -6.34,  e= 0.00, f= 6.70,    g= 50.00}, -- Stable Wagon Camera 
		wagoncamera5     = {a= -1355.30, b= 2415.79, c= 308.61, d= -6.64,  e= 0.00, f= -79.40,  g= 50.00}, -- Stable Wagon Camera 
		wagoncamera6     = {a= -1355.43, b= 2419.96, c= 308.61, d= -4.77,  e= 0.00, f= -112.80, g= 50.00}, -- Stable Wagon Camera 
		wagoncamera7     = {a= -1346.91, b= 2422.60, c= 309.38, d= -16.43, e= 0.00, f= 153.29,  g= 50.00}, -- Stable Wagon Camera 
		exitcamerapos    = {a= -1330.13, b= 2410.20, c= 307.13, d= 6.50,   e= 0.00, f= 156.50,  g= 50.00}, -- Camera view when you exit the stable
		playergotocoords = {x=-1332.063232421875, y=2406.27587890625, z=307.37548828125}, -- Coords where the player is heading when exiting the stable			
    },

    [7] = { 
        name = "Tumbleweed",
        pos = {x=-5544.81, y=-3045.82, z=-1.19},
        wagonpos = {x=-5544.81, y=-3045.82, z=-1.19, h=6.02},
		wagonspawnpos = {x=-5528.43, y=-3074.17, z=-1.77, h=-81.0},	
		introcamerapos   = {a= -5499.48, b= -3054.33, c= 3.89,  d= -6.32,  e= 0.00, f=46.46,   g= 50.00}, -- Camera view when you're entering the stable
		menucamera       = {a= -5514.21, b= -3042.11, c= -2.25, d= 0.02,   e= 0.00, f=30.36,   g= 50.00}, -- Camera view when you're in the main stable menu
		wagoncamera1     = {a= -5540.15, b= -3050.30, c= 0.72,  d= -10.47, e= 0.00, f= 35.19,  g= 50.00}, -- Stable Wagon Camera 
		wagoncamera2     = {a= -5543.11, b= -3042.44, c= -0.09, d= -2.66,  e= 0.00, f= 151.56, g= 50.00}, -- Stable Wagon Camera 
		wagoncamera3     = {a= -5551.35, b= -3047.37, c= 0.72,  d= -10.54, e= 0.00, f= -82.85, g= 50.00}, -- Stable Wagon Camera 
		wagoncamera4     = {a= -5548.64, b= -3041.29, c= 0.04,  d= -6.12,  e= 0.00, f= -142.35,g= 50.00}, -- Stable Wagon Camera 
		wagoncamera5     = {a= -5542.29, b= -3040.40, c= 0.13,  d= -5.53,  e= 0.00, f= 149.97, g= 50.00}, -- Stable Wagon Camera 
		wagoncamera6     = {a= -5538.22, b= -3044.87, c= 0.04,  d= -2.22,  e= 0.00, f= 95.53,  g= 50.00}, -- Stable Wagon Camera 
		wagoncamera7     = {a= -5544.19, b= -3051.23, c= 1.23,  d= -15.95, e= 0.00, f= 5.70,   g= 50.00}, -- Stable Wagon Camera 
		exitcamerapos    = {a= -5503.02, b= -3035.50, c= -3.53, d= 17.43,  e= 0.00, f= 137.44, g= 50.00}, -- Camera view when you exit the stable
		playergotocoords = {x=-5507.75, y=-3044.43, z=-2.60}, -- Coords where the player is heading when exiting the stable				
    },
	
    [8] = { 
        name = "Strawberry",
        pos = {x=-1833.2900390625, y=-575.06, z=155.90},
        wagonpos = {x=-1833.29, y=-575.06, z=155.90, h=-106.0},
		wagonspawnpos = {x=-1798.63, y=-547.17, z=156.03, h=-46.24},
		introcamerapos   = {a= -1806.73, b= -576.16, c= 159.52, d= -4.69,  e= 0.00, f= 34.20,   g= 50.00}, -- Camera view when you're entering the stable
		menucamera       = {a= -1817.18, b= -570.00, c= 157.53, d= -10.80, e= 0.00, f= 42.62,   g= 50.00}, -- Camera view when you're in the main stable menu
		wagoncamera1     = {a= -1839.19, b= -577.60, c= 157.56, d= -6.20,  e= 0.00, f= -75.15,  g= 50.00}, -- Stable Wagon Camera 
		wagoncamera2     = {a= -1831.24, b= -577.74, c= 157.43, d= -11.78, e= 0.00, f= 33.86,   g= 50.00}, -- Stable Wagon Camera 
		wagoncamera3     = {a= -1832.06, b= -568.82, c= 157.06, d= -1.27,  e= 0.00, f= 163.33,  g= 50.00}, -- Stable Wagon Camera 
		wagoncamera4     = {a= -1828.93, b= -576.24, c= 158.40, d= -21.78, e= 0.00, f= 73.81,   g= 50.00}, -- Stable Wagon Camera 
		wagoncamera5     = {a= -1827.91, b= -573.33, c= 157.06, d= -3.18,  e= 0.00, f= 102.28,  g= 50.00}, -- Stable Wagon Camera 
		wagoncamera6     = {a= -1829.87, b= -579.53, c= 157.06, d= -3.44,  e= 0.00, f= 29.16,   g= 50.00}, -- Stable Wagon Camera 
		wagoncamera7     = {a= -1838.16, b= -573.73, c= 158.06, d= -9.29,  e= 0.00, f= -105.31, g= 50.00}, -- Stable Wagon Camera 
		exitcamerapos    = {a= -1808.29, b= -558.87, c= 155.08, d= 20.84,  e= 0.00, f= 121.90,  g= 50.00}, -- Camera view when you exit the stable
		playergotocoords = {x= -1811.2159423828125, y= -564.01708984375, z= 155.9663848876953}, --coords where the player is heading when exiting the stable			
    },
	
	[9] = {  
        name = "Mcfarlane Ranch",
        pos = {x=-2403.89, y=-2389.91, z=61.09},
        wagonpos = {x=-2403.89, y=-2389.91, z=61.09, h=-111.0}, 
		wagonspawnpos = {x=-2395.46, y=-2370.60, z=61.09, h=-111.44},
		introcamerapos   = {a= -2372.44, b= -2385.69, c= 65.96, d= -3.72,  e= 0.00, f= 91.90,   g= 50.00}, -- Camera view when you're entering the stable
		menucamera       = {a= -2394.83, b= -2380.83, c= 60.97, d= 10.53,  e= 0.00, f= -59.63,  g= 50.00}, -- Camera view when you're in the main stable menu
		wagoncamera1     = {a= -2409.38, b= -2392.05, c= 62.55, d= -5.59,  e= 0.00, f= -77.07,  g= 50.00}, -- Stable Wagon Camera 
		wagoncamera2     = {a= -2409.19, b= -2389.57, c= 61.87, d= -3.26,  e= 0.00, f= -107.54, g= 50.00}, -- Stable Wagon Camera 
		wagoncamera3     = {a= -2403.00, b= -2383.98, c= 62.04, d= -1.62,  e= 0.00, f= 160.18,  g= 50.00}, -- Stable Wagon Camera 
		wagoncamera4     = {a= -2398.31, b= -2388.83, c= 62.04, d= -1.30,  e= 0.00, f= 99.34,   g= 50.00}, -- Stable Wagon Camera 
		wagoncamera5     = {a= -2400.51, b= -2394.27, c= 62.04, d= -0.30,  e= 0.00, f= 29.39,   g= 50.00}, -- Stable Wagon Camera 
		wagoncamera6     = {a= -2404.47, b= -2395.86, c= 62.04, d= -0.97,  e= 0.00, f= -18.86,  g= 50.00}, -- Stable Wagon Camera 
		wagoncamera7     = {a= -2409.07, b= -2387.89, c= 63.74, d= -19.15, e= 0.00, f= -111.63, g= 50.00}, -- Stable Wagon Camera 
		exitcamerapos    = {a= -2387.50, b= -2390.88, c= 61.31, d= 6.35,   e= 0.00, f= 28.48,   g= 50.00}, -- Camera view when you exit the stable
		playergotocoords = {x= -2389.239990234375, y= -2383.450439453125, z= 61.11332321166992}, --coords where the player is heading when exiting the stable			
    },
 
	[10] = { 
        name = "Guarma",
        pos = {x=1485.19, y=-7095.90, z=75.17},  
        wagonpos = {x=1485.19, y=-7095.90, z=75.17, h=23.31},
		wagonspawnpos = {x=1505.12, y=-7116.18, z=75.22, h=35.0},
		introcamerapos   = {a= 1515.93, b= -7066.14, c= 80.46, d= -4.00,  e= 0.00, f= 112.33,  g= 50.00}, -- Camera view when you're entering the stable
		menucamera       = {a= 1494.35, b= -7070.46, c= 77.13, d= 11.08,  e= 0.00, f= -93.35,  g= 50.00}, -- Camera view when you're in the main stable menu
		wagoncamera1     = {a= 1490.76, b= -7098.75, c= 76.91, d= -8.61,  e= 0.00, f= 50.59,   g= 50.00}, -- Stable Wagon Camera 
		wagoncamera2     = {a= 1486.08, b= -7092.71, c= 76.73, d= -9.92,  e= 0.00, f= 162.61,  g= 50.00}, -- Stable Wagon Camera 
		wagoncamera3     = {a= 1479.46, b= -7098.94, c= 76.80, d= -6.76,  e= 0.00, f= -69.13,  g= 50.00}, -- Stable Wagon Camera 
		wagoncamera4     = {a= 1480.37, b= -7092.67, c= 76.36, d= -4.60,  e= 0.00, f= -129.94, g= 50.00}, -- Stable Wagon Camera 
		wagoncamera5     = {a= 1486.34, b= -7090.45, c= 76.36, d= -3.18,  e= 0.00, f= 158.28,  g= 50.00}, -- Stable Wagon Camera 
		wagoncamera6     = {a= 1490.47, b= -7092.73, c= 76.36, d= -2.36,  e= 0.00, f= 112.16,  g= 50.00}, -- Stable Wagon Camera 
		wagoncamera7     = {a= 1487.26, b= -7100.96, c= 77.35, d= -11.70, e= 0.00, f= 22.51,   g= 50.00}, -- Stable Wagon Camera 
		exitcamerapos    = {a= 1503.75, b= -7069.19, c= 77.81, d= -5.33,  e= 0.00, f= 119.15,  g= 50.00}, -- Camera view when you exit the stable
		playergotocoords = {x= 1501.2330322265625, y= -7080.3525390625, z= 77.2717056274414},             -- coords where the player is heading when exiting the stable			
    },
	
	[11] = { 
        name = "Wapiti",
        pos = {x= 487.31, y= 2222.31, z= 247.10},  
        wagonpos = {x=484.32, y=2228.08, z=247.13, h=-87.09},
		wagonspawnpos = {x=493.04, y=2245.29, z=248.10, h=-141.32},
		introcamerapos   = {a= 481.04, b= 2239.04, c= 253.00, d= -10.79, e= 0.00, f= 160.35,  g= 50.00}, -- Camera view when you're entering the stable
		menucamera       = {a= 483.34, b= 2219.07, c= 247.40, d= -4.05,  e= 0.00, f= 108.12,  g= 50.00}, -- Camera view when you're in the main stable menu
		wagoncamera1     = {a= 480.30, b= 2223.22, c= 248.18, d= -5.20,  e= 0.00, f= -56.50,  g= 50.00}, -- Stable Wagon Camera 
		wagoncamera2     = {a= 487.95, b= 2228.22, c= 249.06, d= -19.64, e= 0.00, f= 91.30,   g= 50.00}, -- Stable Wagon Camera 
		wagoncamera3     = {a= 485.04, b= 2222.29, c= 248.01, d= 1.13,   e= 0.00, f= 0.93,    g= 50.00}, -- Stable Wagon Camera 
		wagoncamera4     = {a= 483.75, b= 2234.32, c= 248.51, d= -4.53,  e= 0.00, f= 179.68,  g= 50.00}, -- Stable Wagon Camera 
		wagoncamera5     = {a= 489.25, b= 2231.87, c= 248.51, d= -6.32,  e= 0.00, f= 127.80,  g= 50.00}, -- Stable Wagon Camera 
		wagoncamera6     = {a= 488.52, b= 2224.91, c= 248.51, d= -9.43,  e= 0.00, f= 45.17,   g= 50.00}, -- Stable Wagon Camera 
		wagoncamera7     = {a= 478.64, b= 2227.69, c= 249.11, d= -11.29, e= 0.00, f= -86.60,  g= 50.00}, -- Stable Wagon Camera 
		exitcamerapos    = {a= 473.47, b= 2230.61, c= 248.13, d= -6.87,  e= 0.00, f= -112.79, g= 50.00}, -- Camera view when you exit the stable
		playergotocoords = {x=481.4652099609375, y=2230.334228515625, z=247.32595825195312},             -- coords where the player is heading when exiting the stable	
    },
	
	[12] = { 
        name = "Little Creek Farm",
        pos = {x=-2215.39, y=728.84, z=123.00},  
        wagonpos = {x=-2232.93, y=724.81, z=122.77, h=-153.21},
		wagonspawnpos = {x=-2160.19, y=673.04, z=120.11, h=130.0},
		introcamerapos   = {a= -2188.68, b= 719.41, c= 127.78, d= -3.58,  e= 0.00, f= 75.99,   g= 50.00}, -- Camera view when you're entering the stable
		menucamera       = {a= -2214.54, b= 709.75, c= 121.79, d= 13.23,  e= 0.00, f= 22.43,   g= 50.00}, -- Camera view when you're in the main stable menu
		wagoncamera1     = {a= -2239.26, b= 727.10, c= 124.35, d= -7.42,  e= 0.00, f= -120.33, g= 50.00}, -- Stable Wagon Camera 
		wagoncamera2     = {a= -2238.39, b= 721.57, c= 124.35, d= -6.18,  e= 0.00, f= -61.94,  g= 50.00}, -- Stable Wagon Camera 
		wagoncamera3     = {a= -2231.23, b= 721.60, c= 125.07, d= -27.96, e= 0.00, f= 26.21,   g= 50.00}, -- Stable Wagon Camera 
		wagoncamera4     = {a= -2227.47, b= 727.71, c= 123.87, d= -1.54,  e= 0.00, f= 114.50,  g= 50.00}, -- Stable Wagon Camera 
		wagoncamera5     = {a= -2228.13, b= 722.25, c= 123.87, d= -5.17,  e= 0.00, f= 65.44,   g= 50.00}, -- Stable Wagon Camera 
		wagoncamera6     = {a= -2233.23, b= 718.80, c= 123.87, d= -4.31,  e= 0.00, f= -9.07,   g= 50.00}, -- Stable Wagon Camera 
		wagoncamera7     = {a= -2235.89, b= 730.34, c= 125.07, d= -14.34, e= 0.00, f= -153.67, g= 50.00}, -- Stable Wagon Camera 
		exitcamerapos    = {a= -2205.61, b= 713.19, c= 122.10, d= 15.77,  e= 0.00, f= 31.50,   g= 50.00}, -- Camera view when you exit the stable
		playergotocoords = {x=-2209.53759765625, y= 720.6048583984375, z= 122.58377838134766},            -- coords where the player is heading when exiting the stable			
    },
    [13] = { 
        name = "Armadillo Wagons",
        pos               = {x= -3693.74,  y= -2535.84,  z=-13.84},  
        wagonpos = {x=-3703.982666015625, y=-2524.95263671875, z=-14.29587841033935, h=-153.21},
		wagonspawnpos = {x=-3703.982666015625, y=-2524.95263671875, z=-14.29587841033935, h=130.0},
		introcamerapos   = {a= -3699.68, b= -2531.45, c= -11.93, d= -3.58,  e= 0.00, f= 75.99,   g= 50.00}, -- Camera view when you're entering the stable
		menucamera       = {a= -3690.52, b= -2535.52, c= -12.40, d= -3.58,  e= 0.00, f= 75.99,   g= 50.00}, -- Camera view when you're in the main stable menu
		wagoncamera1     = {a= -3690.52, b= -2538.52, c= -11.40, d= -10.00, e= -5.00,  f= 45.00, g= 35.00}, -- Stable Wagon Camera 
		wagoncamera2     = {a= -3691.00, b= -2538.00, c= -11.10, d= -10.00, e= -5.00,  f= 45.00, g= 30.00}, -- Stable Wagon Camera 
		wagoncamera3     = {a= -3689.50, b= -2539.00, c= -11.40, d= -10.00, e= -15.00,  f= 45.00, g= 15.00}, -- Stable Wagon Camera 
		wagoncamera4     = {a= -3690.52, b= -2538.52, c= -11.40, d= -5.00,  e= -5.00, f= 45.00, g= 45.00}, -- Stable Wagon Camera 
		wagoncamera5     = {a= -3690.52, b= -2538.52, c= -10.80, d= -10.00, e= -5.00, f= 45.00, g= 35.00}, -- Stable Wagon Camera 
		wagoncamera6     = {a= -3690.52, b= -2538.52, c= -11.40, d= -10.00, e= 0.00,  f= 45.00, g= -10.00}, -- Stable Wagon Camera 
		wagoncamera7     = {a= -3690.52, b= -2538.52, c= -10.50, d= -10.00, e= 5.00, f= 45.00, g= 40.00}, -- Stable Wagon Camera 
		exitcamerapos    = {a= -2205.61, b= 713.19, c= 122.10, d= 15.77,  e= 0.00, f= 31.50,   g= 50.00}, -- Camera view when you exit the stable
		playergotocoords = {x=-2209.53759765625, y= 720.6048583984375, z= 122.58377838134766},            -- coords where the player is heading when exiting the stable			
    },
    [14] = { 
        name = "Rhodes Wagons",
        pos               = {x= 1431.31,  y= -1295.31,  z=77.83},  
        wagonpos = {x=1444.5869140625, y=-1287.7158203125, z=77.794357, h=10.21}, ---move
		wagonspawnpos = {x=1448.62780, y=-1289.8878, z=79.7, h=120.0},
		introcamerapos   = {a= 1448.26, b= -1288.2, c= 77.74, d= -3.58,  e= 0.00, f= 75.99,   g= 70.00}, -- Camera view when you're entering the stable
		menucamera       = {a= 1451.62780, b= -1288.2, c= 79.74, d= -3.58,  e= 0.00, f= 75.99,   g= 70.00}, -- Camera view when you're in the main stable menu
		wagoncamera1    = {a= 1451.62780, b= -1286.2, c= 79.74, d= -13.58,  e= 0.00, f= 75.99,   g= 70.00}, -- Stable Wagon Camera 
		wagoncamera2     = {a= 1451.62780, b= -1286.2, c= 79.74, d= -13.58,  e= 0.00, f= 75.99,   g= 70.00}, -- Stable Wagon Camera 
		wagoncamera3     = {a= 1451.62780, b= -1286.2, c= 79.74, d= -13.58,  e= 0.00, f= 75.99,   g= 70.00}, -- Stable Wagon Camera 
		wagoncamera4     = {a= 1451.62780, b= -1286.2, c= 79.74, d= -13.58,  e= 0.00, f= 75.99,   g= 70.00}, -- Stable Wagon Camera 
		wagoncamera5     = {a= 1451.62780, b= -1286.2, c= 79.74, d= -13.58,  e= 0.00, f= 75.99,   g= 70.00}, -- Stable Wagon Camera 
		wagoncamera6     = {a= 1451.62780, b= -1286.2, c= 79.74, d= -13.58,  e= 0.00, f= 75.99,   g= 70.00}, -- Stable Wagon Camera 
		wagoncamera7     = {a= 1451.62780, b= -1286.2, c= 79.74, d= -13.58,  e= 0.00, f= 75.99,   g= 70.00}, -- Stable Wagon Camera 
		exitcamerapos    = {a= 1451.62780, b= -1286.2, c= 79.74, d= -13.58,  e= 0.00, f= 75.99,   g= 70.00}, -- Camera view when you exit the stable
		playergotocoords = {x=-2209.53759765625, y= 720.6048583984375, z= 122.58377838134766},            -- coords where the player is heading when exiting the stable			
    },
}
 
-------------------------------------------------
			--REGISTERED JOBS--
-------------------------------------------------
--Dont forget to register the used jobs here before applying them in the config.wagons jobs section.
--Leave the first reference ["none"] as it is. Only modify the right part for it

Config.JobLabels = {
    ["none"]         =   "None",
	["logger"]       =   "Logger",	
	["doctor"]       =   "Doctor",	
    ["police"]       =   "Police",
    ["army"]         =   "Army",
    ["wagondriver"]  =   "Wagon Driver",
    ["rancher"]      =   "Rancher",
    ["horsetrainer"] =   "Horse Trainer",	
    ["trapper"]      =   "Trapper",	
}
 
-------------------------------------------------
			--WAGONS CONFIGURATION--
-------------------------------------------------
--Here you can configure the stash limit for the wagons (FOR VORP AND RSG ONLY)
--Slots are for RSG only you can leave them as it is if using VORP

Config.WagonStashLimit = {
    [1]  = { model = "CART01"                , StashLimit = 100000, Slots = 20},
    [2]  = { model = "CART02"                , StashLimit = 100000, Slots = 20},
    [3]  = { model = "CART03"                , StashLimit = 100000, Slots = 20},
    [4]  = { model = "CART04"                , StashLimit = 100000, Slots = 20},
    [5]  = { model = "CART05"                , StashLimit = 100000, Slots = 20},
    [6]  = { model = "CART06"                , StashLimit = 100000, Slots = 20},
    [7]  = { model = "CART07"                , StashLimit = 100000, Slots = 20},
    [8]  = { model = "CART08"                , StashLimit = 100000, Slots = 20},
    [9]  = { model = "buggy01"               , StashLimit = 100000, Slots = 20},
    [10] = { model = "buggy02"               , StashLimit = 100000, Slots = 20},
    [11] = { model = "buggy03"               , StashLimit = 100000, Slots = 20},
    [12] = { model = "CHUCKWAGON000X"        , StashLimit = 100000, Slots = 30},
    [13] = { model = "CHUCKWAGON002X"        , StashLimit = 100000, Slots = 30},
    [14] = { model = "coal_wagon"            , StashLimit = 100000, Slots = 30},
    [15] = { model = "gatchuck"              , StashLimit = 100000, Slots = 30},
    [16] = { model = "LOGWAGON"              , StashLimit = 100000, Slots = 30},
    [17] = { model = "OILWAGON01X"           , StashLimit = 100000, Slots = 30},
    [18] = { model = "oilWagon02x"           , StashLimit = 100000, Slots = 30},
    [19] = { model = "supplywagon"           , StashLimit = 100000, Slots = 40},
    [20] = { model = "utilliwag"             , StashLimit = 100000, Slots = 40},
    [21] = { model = "WAGON02X"              , StashLimit = 100000, Slots = 40},
    [22] = { model = "WAGON03X"              , StashLimit = 100000, Slots = 40},
    [23] = { model = "WAGON04X"              , StashLimit = 100000, Slots = 40},
    [24] = { model = "WAGON05X"              , StashLimit = 100000, Slots = 40},
    [25] = { model = "WAGON06X"              , StashLimit = 100000, Slots = 40},
    [26] = { model = "COACH2"                , StashLimit = 100000, Slots = 40},
    [27] = { model = "COACH3"                , StashLimit = 100000, Slots = 40},
    [28] = { model = "coach3_cutscene"       , StashLimit = 100000, Slots = 40},
    [29] = { model = "COACH4"                , StashLimit = 100000, Slots = 40},
    [30] = { model = "COACH5"                , StashLimit = 100000, Slots = 40},
    [31] = { model = "COACH6"                , StashLimit = 100000, Slots = 40},
    [32] = { model = "STAGECOACH001X"        , StashLimit = 100000, Slots = 40},
    [33] = { model = "STAGECOACH002X"        , StashLimit = 100000, Slots = 40},
    [34] = { model = "STAGECOACH003X"        , StashLimit = 100000, Slots = 40},
    [35] = { model = "STAGECOACH004X"        , StashLimit = 100000, Slots = 40},
    [36] = { model = "STAGECOACH004_2x"      , StashLimit = 100000, Slots = 40},
    [37] = { model = "STAGECOACH005X"        , StashLimit = 100000, Slots = 40},
    [38] = { model = "STAGECOACH006X"        , StashLimit = 100000, Slots = 40},
    [39] = { model = "armysupplywagon"       , StashLimit = 100000, Slots = 40},
    [40] = { model = "gatchuck_2"            , StashLimit = 100000, Slots = 40},
    [41] = { model = "POLICEWAGON01X"        , StashLimit = 100000, Slots = 40},
    [42] = { model = "policeWagongatling01x" , StashLimit = 100000, Slots = 40},
    [43] = { model = "bountywagon01x"        , StashLimit = 100000, Slots = 40},
    [44] = { model = "huntercart01"          , StashLimit = 100000, Slots = 40},
    [45] = { model = "wagonarmoured01x"      , StashLimit = 100000, Slots = 40},
    [46] = { model = "warwagon2"             , StashLimit = 100000, Slots = 40},
    [47] = { model = "wagonPrison01x"        , StashLimit = 100000, Slots = 40},
    [48] = { model = "wagonCircus01x"        , StashLimit = 100000, Slots = 40},
    [49] = { model = "wagonCircus02x"        , StashLimit = 100000, Slots = 40},
    [50] = { model = "wagondairy01x"         , StashLimit = 100000, Slots = 40},
    [51] = { model = "wagonDoc01x"           , StashLimit = 100000, Slots = 40},
    [52] = { model = "wagontraveller01x"     , StashLimit = 100000, Slots = 40},
    [53] = { model = "wagonWork01x"          , StashLimit = 100000, Slots = 40},
} 



--You can change the name, price, if a job is required or not and what jobs can buy the wagon. Example provided for Cart#1 below
-- Gold param is only for VORP framework.
Config.wagons = {
    [1] = {
        Name = "Carts",
		Image = "items/sirevlc_wagon_small_wagon.png",
        Variants = {
            [1] = {
                name  = "Cart#1",
                model = `CART01`,
                price = 550,
				gold  = 10.0,
                jobreq = false,
                jobs = {"none"},
            },
            [2] = {
                name = "Cart#2",
                model = `CART02`,
                price = 450,
				gold  = 0.0,
                jobreq = false,
                jobs = {"none"},
            },
            [3] = {
                name = "Cart#3",
                model = `CART03`,
                price = 600,
				gold  = 0.0,
                jobreq = false,
                jobs = {"none"},
            },
            [4] = {
                name = "Cart#4",
                model = `CART04`,
                price = 450,
				gold  = 0.0,
                jobreq = false,
                jobs = {"none"},
            },
            [5] = {
                name = "Cart#5",
                model = `CART05`,
                price = 650,
				gold  = 0.0,
                jobreq = false,
                jobs = {"none"},
            },
            [6] = {
                name = "Cart#6",
                model = `CART06`,
                price = 700,
				gold  = 0.0,
                jobreq = false,
                jobs = {"none"},
            },
            [7] = {
                name = "Cart#7",
                model = `CART07`,
                price = 650,
				gold  = 0.0,
                jobreq = false,
                jobs = {"none"},
            },
            [8] = {
                name = "Cart#8",
                model = `CART08`,
                price = 450,
				gold  = 0.0,
                jobreq = false,
                jobs = {"none"},
            },
            [9] = {
                name = "Buggy#1",
                model = `buggy01`,
                price = 580,
				gold  = 0.0,
                jobreq = false,
                jobs = {"none"},
            },
            [10] = {
                name = "Buggy#2",
                model = `buggy02`,
                price = 430,
				gold  = 0.0,
                jobreq = false,
                jobs = {"none"},
            },
            [11] = {
                name = "Buggy#3",
                model = `buggy03`,
                price = 460,
				gold  = 0.0,
                jobreq = false,
                jobs = {"none"},
            },
        },
    },
	
    [2] = {
        Name = "Work Wagons",
		Image = "items/sirevlc_wagon_work_wagon.png",
        Variants = {
            [1] = {
                name = "Transport Coach#1",
                model = `CHUCKWAGON000X`,
                price = 850,
				gold  = 0.0,
                jobreq = false,
                jobs = {"none"},
            },
            [2] = {
                name = "Transport Coach#2",
                model = `CHUCKWAGON002X`,
                price = 900,
				gold  = 0.0,
                jobreq = false,
                jobs = {"none"},
            },
            [3] = {
                name = "Coal Wagon",
                model = `coal_wagon`,
                price = 1300,
				gold  = 0.0,
                jobreq = false,
                jobs = {"none"},
            },
            [4] = {
                name = "Transport Coach#3",
                model = `gatchuck`,
                price = 1100,
				gold  = 0.0,
                jobreq = false,
                jobs = {"none"},
            },
            [5] = {
                name = "Log Wagon",
                model = `LOGWAGON`,
                price = 1150,
				gold  = 0.0,
                jobreq = false,
                jobs = {"none"},
            },
            [6] = {
                name = "Oil Wagon#1",
                model = `OILWAGON01X`,
                price = 1250,
				gold  = 0.0,
                jobreq = false,
                jobs = {"none"},
            },
            [7] = {
                name = "Oil Wagon#2",
                model = `oilWagon02x`,
                price = 1350,
				gold  = 0.0,
                jobreq = false,
                jobs = {"none"},
            },
            [8] = {
                name = "Supply Wagon",
                model = `supplywagon`,
                price = 1400,
				gold  = 0.0,
                jobreq = false,
                jobs = {"none"},
            },
            [9] = {
                name = "Utility Wagon",
                model = `utilliwag`,
                price = 1100,
				gold  = 0.0,
                jobreq = false,
                jobs = {"none"},
            },
        },
    },
	
    [3] = {
        Name = "Travelling Wagons",
		Image = "items/sirevlc_wagon_camp_wagon.png",		
        Variants = {
            [1] = {
                name = "Travel Wagon#1",
                model = `WAGON02X`,
                price = 1500,
				gold  = 0.0,
                jobreq = false,
                jobs = {"none"},
            },
            [2] = {
                name = "Travel Wagon#2",
                model = `WAGON03X`,
                price = 1250,
				gold  = 0.0,
                jobreq = false,
                jobs = {"none"},
            },
            [3] = {
                name = "Travel Wagon#3",
                model = `WAGON04X`,
                price = 1300,
				gold  = 0.0,
                jobreq = false,
                jobs = {"none"},
            },
            [4] = {
                name = "Travel Wagon#4",
                model = `WAGON05X`,
                price = 1400,
				gold  = 0.0,
                jobreq = false,
                jobs = {"none"},
            },
            [5] = {
                name = "Travel Wagon#5",
                model = `WAGON06X`,
                price = 1350,
				gold  = 0.0,
                jobreq = false,
                jobs = {"none"},
            },
 
        },
    },
	
    [4] = {
        Name = "Stagecoaches",
		Image = "items/sirevlc_wagon_stagecoach.png",			
        Variants = {
            [1] = {
                name = "Stagecoach#1",
                model = `COACH2`,
                price = 3500,
				gold  = 0.0,
                jobreq = false,
                jobs = {"none"},
            },
            [2] = {
                name = "Stagecoach#2",
                model = `COACH3`,
                price = 4500,
				gold  = 0.0,
                jobreq = false,
                jobs = {"none"},
            },
            [3] = {
                name = "Stagecoach#3",
                model = `coach3_cutscene`,
                price = 3500,
				gold  = 0.0,
                jobreq = false,
                jobs = {"none"},
            },
            [4] = {
                name = "Stagecoach#4",
                model = `COACH4`,
                price = 4000,
				gold  = 0.0,
                jobreq = false,
                jobs = {"none"},
            },
            [5] = {
                name = "Stagecoach#5",
                model = `COACH5`,
                price = 3500,
				gold  = 0.0,
                jobreq = false,
                jobs = {"none"},
            },
            [6] = {
                name = "Stagecoach#6",
                model = `COACH6`,
                price = 3200,
				gold  = 0.0,
                jobreq = false,
                jobs = {"none"},
            },
            [7] = {
                name = "Stagecoach#7",
                model = `STAGECOACH001X`,
                price = 3300,
				gold  = 0.0,
                jobreq = false,
                jobs = {"none"},
            },
            [8] = {
                name = "Stagecoach#8",
                model = `STAGECOACH002X`,
                price = 3450,
				gold  = 0.0,
                jobreq = false,
                jobs = {"none"},
            },
            [9] = {
                name = "Stagecoach#9",
                model = `STAGECOACH003X`,
                price = 3500,
				gold  = 0.0,
                jobreq = false,
                jobs = {"none"},
            },
            [10] = {
                name = "Armored Stagecoach#01",
                model = `STAGECOACH004X`,
                price = 5000,
				gold  = 0.0,
                jobreq = false,
                jobs = {"none"},
            },
            [11] = {
                name = "Armored Stagecoach#02",
                model = `STAGECOACH004_2x`,
                price = 4000,
				gold  = 0.0,
                jobreq = false,
                jobs = {"none"},
            },
            [12] = {
                name = "Stagecoach#12",
                model = `STAGECOACH005X`,
                price = 4500,
				gold  = 0.0,
                jobreq = false,
                jobs = {"none"},
            },
            [13] = {
                name = "Stagecoach#13",
                model = `STAGECOACH006X`,
                price = 3000,
				gold  = 0.0,
                jobreq = false,
                jobs = {"none"},
            },
        },
    },
	
    [5] = {
        Name = "Roles Wagons",
		Image = "items/sirevlc_wagon_army.png",			
        Variants = {
            [1] = {
                name = "Army Supply Wagon",
                model = `armysupplywagon`,
                price = 15000,
				gold  = 0.0,
                jobreq = false,
                jobs = {"usms"},
            },
            [2] = {
                name = "Maxim Wagon#01",
                model = `gatchuck_2`,
                price = 30000,
				gold  = 0.0,
                jobreq = false,
                jobs = {"usms"},
            },
            [3] = {
                name = "Police Wagon",
                model = `POLICEWAGON01X`,
                price = 15000,
				gold  = 0.0,
                jobreq = false,
                jobs = {"none"},
            },
            [4] = {
                name = "Maxim Wagon#02",
                model = `policeWagongatling01x`,
                price = 50000,
				gold  = 0.0,
                jobreq = false,
                jobs = {"usms"},
            },
            [5] = {
                name = "Bounty Hunter Wagon",
                model = `bountywagon01x`,
                price = 15000,
				gold  = 0.0,
                jobreq = false,
                jobs = {"none"},
            },
            [6] = {
                name = "Hunting Cart",
                model = `huntercart01`,
                price = 1200,
				gold  = 0.0,
                jobreq = false,
                jobs = {"none"},
            },
            [7] = {
                name = "Armored Army Wagon",
                model = `wagonarmoured01x`,
                price = 20000,
				gold  = 0.0,
                jobreq = false,
                jobs = {"usms"},
            },
            [8] = {
                name = "War Wagon",
                model = `warwagon2`,
                price = 50000,
				gold  = 0.0,
                jobreq = false,
                jobs = {"usms"},
            },
            [9] = {
                name = "Prisoner Wagon",
                model = `wagonPrison01x`,
                price = 20000,
				gold  = 0.0,
                jobreq = false,
                jobs = {"usms"},
            },
        },
    },
    [6] = {
        Name = "Special Wagons",
		Image = "items/sirevlc_wagon_specials.png",				
        Variants = {
            [1] = {
                name = "Circus Wagon#1",
                model = `wagonCircus01x`,
                price = 5000,
				gold  = 0.0,
                jobreq = false,
                jobs = {"none"},
            },
            [2] = {
                name = "Circus Wagon#2",
                model = `wagonCircus02x`,
                price = 5000,
				gold  = 0.0,
                jobreq = false,
                jobs = {"none"},
            },
            [3] = {
                name = "Dairy Wagon",
                model = `wagondairy01x`,
                price = 5000,
				gold  = 0.0,
                jobreq = false,
                jobs = {"none"},
            },
            [4] = {
                name = "Doctor Wagon",
                model = `wagonDoc01x`,
                price = 5000,
				gold  = 0.0,
                jobreq = false,
                jobs = {"none"},
            },
            [5] = {
                name = "Traveller Wagon#1",
                model = `wagontraveller01x`,
                price = 2000,
				gold  = 0.0,
                jobreq = false,
                jobs = {"none"},
            },
            [6] = {
                name = "Traveller Wagon#2",
                model = `wagonWork01x`,
                price = 5000,
				gold  = 0.0,
                jobreq = false,
                jobs = {"none"},
            },
        },
    }
}



------------------------------------
	   --WAGONS CUSTOMIZATION--
------------------------------------
--------------------------------------------------------------------
-- You can change two last values except if it's "NOEQUIPMENT"
-- Model,name,price
--------------------------------------------------------------------

Config.Customization = {
    [1] = {
        Name = "Prop Sets",
        [`cart01`] = {
            [1] = {`pg_re_checkpoint02x_food`,                  "PropSet#1",    50},
            [2] = {`pg_re_moonshineCampgroupCart01x`,           "PropSet#2",   100},
            [3] = {`pg_teamster_cart01_breakables`,             "PropSet#3",   100},
            [4] = {`pg_teamster_cart01_gen`,                    "PropSet#4",   100},
            [5] = {`pg_teamster_cart01_tnt`,                    "PropSet#5",   100},
            [6] = {`pg_veh_cart01_1`,                           "PropSet#6",    50},
            [7] = {`pg_veh_cart01_2`,                           "PropSet#7",    50},
            [8] = {`pg_veh_cart01_3`,                           "PropSet#8",    50},
        },                                                                       
																			     
        [`cart07`] = {                                                           
            [1] = {`pg_teamster_cart07_breakables`,             "PropSet#1",    48},
            [2] = {`pg_teamster_cart07_gen`,                    "PropSet#2",    48},
            [3] = {`pg_teamster_cart07_tnt`,                    "PropSet#3",    48},
            [4] = {`pg_veh_cart07_1`,                           "PropSet#4",    48},
            [5] = {`pg_veh_cart07_2`,                           "PropSet#5",    48},
        },                                                                       
        [`cart08`] = {                                                           
            [1] = {`pg_teamster_cart08_breakables`,             "PropSet#1",    35},
            [2] = {`pg_teamster_cart08_gen`,                    "PropSet#2",    35},
            [3] = {`pg_teamster_cart08_tnt`,                    "PropSet#3",    35},
            [4] = {`pg_veh_cart08_1`,                           "PropSet#4",    35},
            [5] = {`pg_veh_cart08_2`,                           "PropSet#5",    35},
        },
		
        [`chuckwagon000x`] = {
            [1 ] =  {`pg_teamster_chuckwagon000x_breakables`,   "PropSet#01",    60},
            [2 ] =  {`pg_teamster_chuckwagon000x_gen`,          "PropSet#02",    45},
            [3 ] =  {`pg_teamster_chuckwagon000x_tnt`,          "PropSet#03",    150},
            [4 ] =  {`pg_veh_chuckwagon000x_1`,                 "PropSet#04",    35},
            [5 ] =  {`pg_veh_chuckwagon000x_2`,                 "PropSet#05",    35},
            [6 ] =  {`pg_veh_chuckwagon000x_3`,                 "PropSet#06",    35},
            [7 ] =  {`pg_veh_chuckwagon000x_2a`,                "PropSet#07",    35},
            [8 ] =  {`pg_veh_chuckwagon000x_3a`,                "PropSet#08",    35},
            [9 ] =  {`pg_veh_chuckwagon000x_4`,                 "PropSet#09",    35},
            [10] =  {`pg_veh_chuckwagon000x_orange_1`,          "PropSet#10",    45},
            [11] =  {`pg_vehload_cotton01`,                     "PropSet#11",    55},
            [12] =  {`pg_vehload_crates01`,                     "PropSet#12",    55},
            [13] =  {`pg_vehload_haybale01`,                    "PropSet#13",    55},
            [14] =  {`pg_vehload_livestock01`,                  "PropSet#14",    55},
            [15] =  {`pg_vehload_lumber01`,                     "PropSet#15",    55},
            [16] =  {`pg_vehload_sacks01`,                      "PropSet#16",    55},
            [17] =  {`pg_vl_blacksmith01`,                      "PropSet#17",    43},
            [18] =  {`pg_vl_butcher01`,                         "PropSet#18",    50},
            [19] =  {`pg_vl_craftsman01`,                       "PropSet#19",    50},
            [20] =  {`pg_vl_delivery01`,                        "PropSet#20",    50},
            [21] =  {`pg_vl_farmer01`,                          "PropSet#21",    50},
            [22] =  {`pg_vl_farmer02`,                          "PropSet#22",    50},
            [23] =  {`pg_vl_ferrier01`,                         "PropSet#23",    50},
            [24] =  {`pg_vl_fisherman01`,                       "PropSet#24",    50},
            [25] =  {`pg_vl_hunter01`,                          "PropSet#25",    50},
            [26] =  {`pg_vl_rancher01`,                         "PropSet#26",    64},
            [27] =  {`pg_vl_rancher02`,                         "PropSet#27",    64},
            [28] =  {`pg_vl_rancher03`,                         "PropSet#28",    64},
            [29] =  {`pg_vl_rancher04`,                         "PropSet#29",    64},
            [30] =  {`pg_vl_rancher05`,                         "PropSet#30",    64},
            [31] =  {`pg_vl_tradesman01`,                       "PropSet#31",    45},
            [32] =  {`pg_vl_tradesman02`,                       "PropSet#32",    45},
            [33] =  {`pg_vl_tradesman03`,                       "PropSet#33",    45},
            [34] =  {`pg_vl_tradesman04`,                       "PropSet#34",    45},
            [35] =  {`pg_vl_movingFamily01`,                    "PropSet#35",    45},			
            [36] =  {`pg_re_fleeingfamily01x`,                  "PropSet#36",    45},			
            [37] =  {`pg_vl_travellingFamily01`,                "PropSet#37",    45},
            [38] =  {`pg_vl_travellingLabour01`,                "PropSet#38",    45},
        },
        [`stagecoach005x`] = {
            [1] = {`pg_veh_stagecoach005x_1`,                  "PropSet#1",     100},
            [2] = {`pg_veh_stagecoach005x_2`,                  "PropSet#2",     200},
        },
        [`supplywagon`] = {
            [1] = {`pg_mission_cornwall1_01x`,                 "PropSet#1",     46},
            [2] = {`pg_mp_moonshinebiz_supplies02x_supwag`,    "PropSet#2",     46},
            [3] = {`pg_teamster_supplywagon_breakables`,       "PropSet#3",     46},
            [4] = {`pg_teamster_supplywagon_gen`,              "PropSet#4",     46},
            [5] = {`pg_teamster_supplywagon_tnt`,              "PropSet#5",     46},
            [6] = {`pg_delivery_Cotton01x`,                    "PropSet#6",     46},       
        },                                                                     
        [`utilliwag`] = {                                      
            [1] = {`pg_cs_marston101x`,                        "PropSet#01",     35},
            [2] = {`pg_mission_marston1_supplies01x`,          "PropSet#02",     35},
            [3] = {`pg_mission_marston1_supplies02x`,          "PropSet#03",     35},
            [4] = {`pg_mission_marston2_postoffice01x`,        "PropSet#04",     35},
            [5] = {`pg_mission_native2_01x`,                   "PropSet#05",     35},
            [6] = {`pg_rc_dinoLady01x`,                        "PropSet#06",     35},
            [7] = {`pg_teamster_utilitywag_breakables`,        "PropSet#07",     35},
            [8] = {`pg_teamster_utilitywag_gen`,               "PropSet#08",     35},
            [9] = {`pg_teamster_utilitywag_tnt`,               "PropSet#09",     35},
            [10] = {`pg_veh_utilliwag_1`,                      "PropSet#10",     35},
            [11] = {`pg_veh_utilliwag_2`,                      "PropSet#11",     35},
            [12] = {`pg_veh_utilliwag_3`,                      "PropSet#12",     35},
            [13] = {`pg_veh_utilliwag_orange_1`,               "PropSet#13",     35},   
        },
        [`wagon02x`] = {
           [1] =  {`pg_vehload_cotton01`,                      "PropSet#01", 45},		
           [2] =  {`pg_gunforhire01x`,                         "PropSet#02", 45},
           [3] =  {`pg_gunforhire02x`,                         "PropSet#03", 45},
           [4] =  {`pg_gunforhire03x`,                         "PropSet#04", 45},
           [5] =  {`Pg_Mis_Mud1_Wagon02x`,                     "PropSet#05", 45},
           [6] =  {`Pg_Mis_Mud1_Wagon02x_NoLooseProps`,        "PropSet#06", 45},
           [7] =  {`pg_mission_caravanWagon02x`,               "PropSet#07", 45},	
           [8] =  {`pg_mission_mud1_wagon03x`,                 "PropSet#08", 45},
           [9] =  {`pg_re_supplyDelivery01x`,                  "PropSet#09", 45},
           [10] = {`pg_sp_MarstonsWagon02x`,                   "PropSet#10", 45},		   
           [11] = {`pg_mission_ammoDeal`,                      "PropSet#11", 45},
           [12] = {`pg_mission_marston7_lumber01x`,            "PropSet#12", 45},
           [13] = {`pg_mission_marston7_lumber02x`,            "PropSet#13", 45},
           [14] = {`pg_mission_marston7_lumber03x_doneloading`,"PropSet#14", 45},
           [15] = {`pg_mission_tntwagon01x`,                   "PropSet#15", 45},
           [16] = {`pg_teamster_wagon02x_tnt`,                 "PropSet#16", 45},		   
           [17] = {`pg_mission_trainRob4_Wagon02x_dynamite`,   "PropSet#17", 150},		   
           [18] = {`pg_mission_trainrob3_start01x`,            "PropSet#18", 45},
           [19] = {`pg_mission_weaponsDeal`,                   "PropSet#19", 45},
           [20] = {`pg_mission_winter1_4thwagon01x`,           "PropSet#20", 45},
           [21] = {`pg_rc_BeauAndPene101x`,                    "PropSet#21", 45},
           [22] = {`pg_rc_beauandpene201x`,                    "PropSet#22", 45},
           [23] = {`pg_rc_forgiven601x`,                       "PropSet#23", 45},
           [24] = {`pg_rc_saddiesupplies00x`,                  "PropSet#24", 45},
           [25] = {`pg_rc_saddiesupplies01x`,                  "PropSet#25", 45},		   
           [26] = {`pg_rc_nativewagoncornwall01x`,             "PropSet#26", 45},
           [27] = {`pg_re_armsdeal01x`,                        "PropSet#27", 45},
           [28] = {`pg_re_odriscollwagon01x`,                  "PropSet#28", 45},
           [29] = {`pg_re_supplydelivery_gsmith01x`,           "PropSet#29", 45},
           [30] = {`pg_re_trainholdup01x`,                     "PropSet#30", 45},
           [31] = {`pg_teamster_wagon02x_breakables`,          "PropSet#31", 45},
           [32] = {`pg_teamster_wagon02x_gen`,                 "PropSet#32", 45},
           [33] = {`pg_teamster_wagon02x_gen02`,               "PropSet#33", 45},
           [34] = {`pg_wagon02xClimbtest01x`,                  "PropSet#34", 45},
           [35] = {`pg_veh_wagon02x_1`,                        "PropSet#35", 45},
           [36] = {`pg_veh_wagon02x_2`,                        "PropSet#36", 45},
           [37] = {`pg_veh_wagon02x_3`,                        "PropSet#37", 45},
           [38] = {`pg_vl_blacksmith01`,                       "PropSet#38", 45},                        
           [39] = {`pg_vl_butcher01`,                          "PropSet#39", 45},
           [40] = {`pg_vl_craftsman01`,                        "PropSet#40", 45},
           [41] = {`pg_vl_delivery01`,                         "PropSet#41", 45},
           [42] = {`pg_vl_farmer01`,                           "PropSet#42", 45},
           [43] = {`pg_vl_farmer02`,                           "PropSet#43", 45},
           [44] = {`pg_vl_ferrier01`,                          "PropSet#44", 45},
           [45] = {`pg_vl_fisherman01`,                        "PropSet#45", 45},
           [46] = {`pg_vl_hunter01`,                           "PropSet#46", 45},
           [47] = {`pg_vl_movingFamily01`,                     "PropSet#47", 45},
           [48] = {`pg_vl_rancher01`,                          "PropSet#48", 45},
           [49] = {`pg_vl_rancher02`,                          "PropSet#49", 45},
           [50] = {`pg_vl_rancher03`,                          "PropSet#50", 45},
           [51] = {`pg_vl_rancher04`,                          "PropSet#51", 45},
           [52] = {`pg_vl_rancher05`,                          "PropSet#52", 45},
           [53] = {`pg_vl_tradesman01`,                        "PropSet#53", 45},
           [54] = {`pg_vl_tradesman02`,                        "PropSet#54", 45},
           [55] = {`pg_vl_tradesman03`,                        "PropSet#55", 45},
           [56] = {`pg_vl_tradesman04`,                        "PropSet#56", 45},
           [57] = {`pg_vl_travellingFamily01`,                 "PropSet#57", 45},
           [58] = {`pg_vl_travellingLabour01`,                 "PropSet#58", 45},
        },
        [`wagon04x`] = {
             [1] = {`pg_gunforhire01x`,                        "PropSet#01",   45},
             [2] = {`pg_gunforhire02x`,                        "PropSet#02",   45},
             [3] = {`pg_gunforhire03x`,                        "PropSet#03",   45},
             [4] = {`pg_mission_caravanWagon04x`,              "PropSet#04",   45},
             [5] = {`pg_mission_mud1_jackwagon01x`,            "PropSet#05",   45},
             [6] = {`pg_mission_mud1_wagon01x`,                "PropSet#06",   45},
             [7] = {`pg_mission_mud1_wagon02x`,                "PropSet#07",   45},
             [8] = {`pg_mission_winter1_keiranWag01x`,         "PropSet#08",   45},
             [9] = {`pg_mission_winter1_wag04_01x`,            "PropSet#09",   45},
             [10] = {`pg_teamster_wagon04x_breakables`,        "PropSet#10",   45},
             [11] = {`pg_teamster_wagon04x_gen`,               "PropSet#11",   45},
             [12] = {`pg_teamster_wagon04x_gen02`,             "PropSet#12",   45},
             [13] = {`pg_teamster_wagon04x_tnt`,               "PropSet#13",   150},
             [14] = {`pg_veh_wagon04x_1`,                      "PropSet#14",   45},
             [15] = {`pg_veh_wagon04x_2`,                      "PropSet#15",   45},
             [16] = {`pg_veh_wagon04x_3`,                      "PropSet#16",   45},
             [17] = {`pg_vl_blacksmith01`,                     "PropSet#17",   45},
             [18] = {`pg_vl_butcher01`,                        "PropSet#18",   45},
             [19] = {`pg_vl_craftsman01`,                      "PropSet#19",   45},
             [20] = {`pg_vl_delivery01`,                       "PropSet#20",   45},
             [21] = {`pg_vl_farmer01`,                         "PropSet#21",   45},
             [22] = {`pg_vl_farmer02`,                         "PropSet#22",   45},
             [23] = {`pg_vl_ferrier01`,                        "PropSet#23",   45},
             [24] = {`pg_vl_fisherman01`,                      "PropSet#24",   45},
             [25] = {`pg_vl_hunter01`,                         "PropSet#25",   45},
             [26] = {`pg_vl_movingFamily01`,                   "PropSet#26",   45},
             [27] = {`pg_vl_rancher01`,                        "PropSet#27",   45},
             [28] = {`pg_vl_rancher02`,                        "PropSet#28",   45},
             [29] = {`pg_vl_rancher03`,                        "PropSet#29",   45},
             [30] = {`pg_vl_rancher04`,                        "PropSet#30",   45},
             [31] = {`pg_vl_rancher05`,                        "PropSet#31",   45},
             [32] = {`pg_vl_tradesman01`,                      "PropSet#32",   45},
             [33] = {`pg_vl_tradesman02`,                      "PropSet#33",   45},
             [34] = {`pg_vl_tradesman03`,                      "PropSet#34",   45},
             [35] = {`pg_vl_tradesman04`,                      "PropSet#35",   45},
             [36] = {`pg_vl_travellingFamily01`,               "PropSet#36",   45},
             [37] = {`pg_vl_travellingLabour01`,               "PropSet#37",   45},
             [38] = {`pg_veh_germFam_wagon04x_01`,             "PropSet#38",   45},     
        },
        [`wagon05x`] = {
            [1] =  {`pg_delivery_CKToil01x`,                   "PropSet#01",    45},  
            [2] =  {`pg_delivery_Orange01x`,                   "PropSet#02",    45},  
            [3] =  {`pg_gunforhire01x`,                        "PropSet#03",    45},  
            [4] =  {`pg_gunforhire02x`,                        "PropSet#04",    45},  
            [5] =  {`pg_gunforhire03x`,                        "PropSet#05",    45},  
            [6] =  {`pg_ls_soldier2_01x`,                      "PropSet#06",    45},  
            [7] =  {`pg_mission_bra1_wagon`,                   "PropSet#07",    45},  
            [8] =  {`pg_mission_brt1_jump01x`,                 "PropSet#08",    45},  
            [9] =  {`pg_mission_brt1_tomansion01x`,            "PropSet#09",    45},  
            [10] = {`pg_mission_brt2`,                         "PropSet#10",    45},  
            [11] = {`pg_mission_BRT2_escape01x`,               "PropSet#11",    45},  
            [12] = {`pg_mission_brt3`,                         "PropSet#12",    45},  
            [13] = {`pg_mission_caravanWagon05x`,              "PropSet#13",    45},  
            [14] = {`pg_mission_moonshineSupplies`,            "PropSet#14",    45},  
            [15] = {`pg_rc_ridethelightning01x`,               "PropSet#15",    45},  
            [16] = {`pg_re_checkpoint01x`,                     "PropSet#16",    45},  
            [17] = {`pg_re_savagewagon01x`,                    "PropSet#17",    45},  
            [18] = {`pg_teamster_wagon05x_breakables`,         "PropSet#18",    45},  
            [19] = {`pg_teamster_wagon05x_gen`,                "PropSet#19",    45},  
            [20] = {`pg_teamster_wagon05x_tnt`,                "PropSet#20",    150},  
            [21] = {`pg_veh_wagon05x_1`,                       "PropSet#21",    45},  
            [22] = {`pg_veh_wagon05x_2`,                       "PropSet#22",    45},  
            [23] = {`pg_veh_wagon05x_3`,                       "PropSet#23",    45},  
            [24] = {`pg_veh_wagon05x_4`,                       "PropSet#24",    45},  
            [25] = {`pg_veh_wagon05x_5`,                       "PropSet#25",    45},  
            [26] = {`pg_veh_wagon05x_cotton`,                  "PropSet#26",    45},  
        },
        [`wagon06x`] = {
            [1] = {`pg_teamster_wagon06x_breakables`,          "PropSet#1",     50},
            [2] = {`pg_teamster_wagon06x_gen`,                 "PropSet#2",     50},
            [3] = {`pg_teamster_wagon06x_tnt`,                 "PropSet#3",    100},
            [4] = {`pg_veh_wagon06x_1`,                        "PropSet#4",     50},
            [5] = {`pg_veh_wagon06x_2`,                        "PropSet#5",     50},
            [6] = {`pg_veh_wagon06x_3`,                        "PropSet#6",     50},

        },

        [`CART02`] = {
            [1] = {`pg_mission_caravanCart02x`,                "PropSet#1",   100},
            [2] = {`pg_teamster_cart02_breakables`,            "PropSet#2",    50},
            [3] = {`pg_teamster_cart02_gen`,                   "PropSet#3",    50},
            [4] = {`pg_teamster_cart02_tnt`,                   "PropSet#4",    150},    
        },

        [`cart03`] = {
            [1] = {`pg_delivery_Coal02x`,                      "PropSet#1",    50},
            [2] = {`pg_mp_moonshinebiz_supplies01x_cart03`,    "PropSet#2",    50},
            [3] = {`pg_teamster_cart03_breakables`,            "PropSet#3",    50},
            [4] = {`pg_teamster_cart03_gen`,                   "PropSet#4",    50},
            [5] = {`pg_teamster_cart03_tnt`,                   "PropSet#5",    150},
            [6] = {`pg_veh_cart03_1`,                          "PropSet#6",    50},
            [7] = {`pg_veh_cart03_2`,                          "PropSet#7",    50},
            [8] = {`pg_veh_cart03_barrels01x`,                 "PropSet#8",    50},  
        },                                                    
        [`cart04`] = {                                        
            [1] = {`pg_mission_caravanCart04x`,               "PropSet#1",     50},  
            [2] = {`pg_teamster_cart04_breakables`,           "PropSet#2",     50},  
            [3] = {`pg_teamster_cart04_gen`,                  "PropSet#3",     50},
            [4] = {`pg_teamster_cart04_tnt`,                  "PropSet#4",     150},
            [5] = {`pg_veh_cart04_1`,                         "PropSet#5",     50},
            [6] = {`pg_veh_cart04_2`,                         "PropSet#6",     50},     
        },                                                    
        [`cart06`] = {                                        
            [1] = {`pg_teamster_cart06_breakables`,           "PropSet#1",     50},
            [2] = {`pg_teamster_cart06_gen`,                  "PropSet#2",     50},
            [3] = {`pg_teamster_cart06_tnt`,                  "PropSet#3",     150},
            [4] = {`pg_veh_cart06_1`,                         "PropSet#4",     50},
            [5] = {`pg_veh_cart06_2`,                         "PropSet#5",     50},  
        },
		

        [`coal_wagon`] = {
            [1] = {`pg_delivery_Coal01x`,                   "PropSet#01",      100},
        },                                                                     
        [`huntercart01`] = {                                                   
            [1] = {`pg_mp005_huntingWagonTarp01`,           "PropSet#01",      100},
        },                                                                     
        [`logwagon`] = {                                                       
            [1] = {`pg_veh_logwagon_1`,                     "PropSet#01",      100},
        },                                                                     
        [`logwagon2`] = {                                                      
            [1] = {`pg_veh_logwagon2_1`,                    "PropSet#01",      100},
        },                                                                     
        [`stagecoach003x`] = {                                                 
            [1] = {`pg_veh_stagecoach003x_bootA`,            "PropSet#01",     100},
        },                                                   
        [`stagecoach004x`] = {                               
            [1] = {`pg_mission_utp2_coachLockbox`,           "PropSet#1",     100},
            [2] = {`pg_teamster_armourwag_breakables`,       "PropSet#2",     100},
            [3] = {`pg_teamster_armourwag_gen`,              "PropSet#3",     100},
            [3] = {`pg_teamster_armourwag_tnt`,              "PropSet#4",     100},
        },                                                                 
        [`stagecoach006x`] = {                                             
            [1] = {`pg_veh_stagecoach006x_1`,                "PropSet#1",     100},
            [2] = {`pg_veh_stagecoach006x_2`,                "PropSet#2",     100},
        },
        [`CHUCKWAGON002X`] = {
            [1] = {`pg_rc_exconfederates1_01x`,              "PropSet#01",   100},
            [2] = {`pg_teamster_chuckwagon002x_breakables`,  "PropSet#02",   100},
            [3] = {`pg_teamster_chuckwagon002x_gen`,         "PropSet#03",   100},
            [4] = {`pg_teamster_chuckwagon002x_tnt`,         "PropSet#04",   100},
            [5] = {`pg_veh_chuckwagon002x_1`,                "PropSet#05",   100},
            [6] = {`pg_veh_chuckwagon002x_2`,                "PropSet#06",   100},
            [7] = {`pg_veh_chuckwagon002x_3`,                "PropSet#07",   100},
            [8] = {`pg_vl_blacksmith01`,                     "PropSet#08",   100},
            [9] = {`pg_vl_butcher01`,                        "PropSet#09",   100},
            [10] = {`pg_vl_travellingLabour01`,              "PropSet#10",   100},    
            [11] = {`pg_vl_craftsman01`,                     "PropSet#11",   100},
            [12] = {`pg_vl_delivery01`,                      "PropSet#12",   100},
            [13] = {`pg_vl_farmer01`,                        "PropSet#13",   100},
            [14] = {`pg_vl_farmer02`,                        "PropSet#14",   100},
            [15] = {`pg_vl_ferrier01`,                       "PropSet#15",   100},
            [16] = {`pg_vl_fisherman01`,                     "PropSet#16",   100},
            [17] = {`pg_vl_hunter01`,                        "PropSet#17",   100},
            [18] = {`pg_vl_movingFamily01`,                  "PropSet#18",   100},
            [19] = {`pg_vl_rancher01`,                       "PropSet#19",   100},
            [20] = {`pg_vl_rancher02`,                       "PropSet#20",   100},
            [21] = {`pg_vl_rancher03`,                       "PropSet#21",   100},
            [22] = {`pg_vl_rancher04`,                       "PropSet#22",   100},
            [23] = {`pg_vl_rancher05`,                       "PropSet#23",   100},
            [24] = {`pg_vl_tradesman01`,                     "PropSet#24",   100},
            [25] = {`pg_vl_tradesman02`,                     "PropSet#25",   100},
            [26] = {`pg_vl_tradesman03`,                     "PropSet#26",   100},
            [27] = {`pg_vl_tradesman04`,                     "PropSet#27",   100},
            [28] = {`pg_vl_travellingFamily01`,              "PropSet#28",   100},
        },
        [`supplywagon2`] = {
             [1] = {`pg_mission_mud4_strauswag01x`,          "PropSet#1",    100},  
             [2] = {`pg_mission_mud4_strauswag02x`,          "PropSet#2",    100},  
        },                                                                 
 														   
        [`wagondairy01x`] = {                                              
             [1] = {`pg_delivery_dairy01x`,                  "PropSet#01",    100},  
        },

        [`STAGECOACH002X`] = {
             [1] = {`pg_veh_stagecoach002x_1`,               "PropSet#1",     100},  
             [2] = {`pg_veh_stagecoach002x_2`,               "PropSet#2",     100},  
             [3] = {`pg_veh_stagecoach002x_bootA`,           "PropSet#3",     100},  
        },                                                                 
        [`STAGECOACH001X`] = {                                             
             [1] = {`pg_veh_stagecoach001x_1`,               "PropSet#1",     100},  
             [2] = {`pg_veh_stagecoach001x_2`,               "PropSet#2",     100},  
        },                                                                    
        [`COACH2`] = {                                                        
             [1] = {`pg_mission_mary3_01x`,                  "PropSet#1",     100},  
             [2] = {`pg_re_coachrobbery01x`,                 "PropSet#2",     100},  
             [3] = {`pg_veh_coach2_1`,                       "PropSet#3",     100},  
             [4] = {`pg_veh_coach2_bootA`,                   "PropSet#4",     100},  
        },                                                                    
        [`gatchuck`] = {                                                      
             [1] = {`pg_mission_native2_01x`,                "PropSet#1",     100},  
             [2] = {`pg_teamster_payroll01x_gat`,            "PropSet#2",     100},   
        },                                                                    
        [`armysupplywagon`] = {                                               
             [1] = {`pg_rc_monroe1_01x`,                     "PropSet#01",     100},  
        },
        [`bountywagon01x`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
        [`cart05`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },		
        [`wagonCircus01x`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
        [`wagonCircus02x`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
        [`wagondoc01x`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
        [`buggy01`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
        [`buggy02`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
        [`buggy03`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },		
        [`coach3`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
        [`coach3_cutscene`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
        [`coach4`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
        [`coach5`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
        [`coach6`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
        [`oilWagon01x`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
        [`oilWagon02x`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
        [`policeWagongatling01x`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
        [`wagonPrison01x`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
        [`wagontraveller01x`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
        [`wagonwork01x`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
        [`warwagon2`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
        [`POLICEWAGON01X`] = {
            [1] = {0,"NOEQUIPMENT",0},
        }, 
        [`gatchuck_2`] = {
            [1] = {0,"NOEQUIPMENT",0},
        }, 
        [`STAGECOACH004_2x`] = {
            [1] = {0,"NOEQUIPMENT",0},
        }, 
        [`wagonarmoured01x`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
        [`wagon03x`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
    },
	
	
    [2] = {
        Name = "Extras",
        [`POLICEWAGON01X`] = {
            [1] = {5,"Extra#1", 100},
        }, 
        [`gatchuck_2`] = {
            [1] = {5,"Extra#1", 100},
        }, 
        [`STAGECOACH004_2x`] = {
            [1] = {5,"Extra#1", 100},
            [2] = {6,"Extra#2", 100},
            [3] = {7,"Extra#3", 100},
        },                      
        [`STAGECOACH002X`] = {  
            [1] = {1,"Extra#1", 100},
            [2] = {2,"Extra#2", 100},
        },                      
        [`STAGECOACH001X`] = {  
            [1] = {1,"Extra#1", 100},
            [2] = {2,"Extra#2", 100},
        },                      
        [`COACH2`] = {          
            [1] = {1,"Extra#1", 100},
            [2] = {2,"Extra#2", 100},
            [3] = {3,"Extra#3", 100},
            [4] = {5,"Extra#4", 100},
        },                      
        [`gatchuck`] = {        
            [1] = {1,"Extra#1", 100},
            [2] = {2,"Extra#2", 100},
            [3] = {3,"Extra#3", 100},
            [4] = {4,"Extra#4", 100},
        }, 		
 
        [`cart01`] = {
            [1] = {1, "Extra#1",100},
            [2] = {4, "Extra#2",100},
        },
        [`bountywagon01x`] = {
            [1] = {5,"Extra#1", 100},
        },                      
        [`cart05`] = {          
            [1] = {1,"Extra#1", 100},
            [2] = {2,"Extra#2", 100},
            [3] = {3,"Extra#3", 100},
        },
        [`cart07`] = {
            [1] = {1,"Extra#1", 100},
        },                      
        [`cart08`] = {          
            [1] = {4,"Extra#1", 100},
        },                      
        [`chuckwagon000x`] = {  
            [1] = {1,"Extra#1", 100},
            [2] = {2,"Extra#2", 100},
            [3] = {3,"Extra#3", 100},
            [4] = {5,"Extra#4", 100},			
        },                      
        [`CHUCKWAGON002X`] = {  
            [1] = {1,"Extra#1", 100},
            [2] = {2,"Extra#2", 100},
            [3] = {3,"Extra#3", 100},
			[4] = {5,"Extra#4", 100},
        },
        [`stagecoach005x`] = {
            [1] = {1,"Extra#1", 100},
        },                      
        [`supplywagon`] = {     
            [1] = {1,"Extra#1", 100},
            [2] = {2,"Extra#2", 100},
            [3] = {4,"Extra#3", 100},
        },                      
        [`utilliwag`] = {       
            [1] = {2,"Extra 1", 100},
        },                      
        [`wagon02x`] = {        
            [1] = {1,"Extra#1", 100},
            [2] = {2,"Extra#2", 100},
            [3] = {3,"Extra#3", 100},
            [4] = {5,"Extra#4", 100},
        },                      
        [`wagon04x`] = {        
            [1] = {1,"Extra#1", 100},
            [2] = {2,"Extra#2", 100},
            [3] = {3,"Extra#3", 100},
            [4] = {5,"Extra#4", 100},				
        },                      
							    
        [`wagon06x`] = {        
            [1] = {0,"Extra#1", 100},
            [2] = {1,"Extra#2", 100},
            [3] = {2,"Extra#3", 100},
            [4] = {5,"Extra#4", 100},			
			
        },
         [`wagonCircus01x`] = {
            [1] = {1,"Extra#1", 100},
        },                      
         [`wagonCircus02x`] = { 
            [1] = {1,"Extra#1", 100},
        },                      
         [`wagondoc01x`] = {    
            [1] = {1,"Extra#1", 100},
        },
         [`CART02`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
         [`buggy01`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
         [`buggy02`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
         [`buggy03`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
         [`cart03`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
         [`cart04`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
         [`cart06`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
         [`coach3`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
         [`coach3_cutscene`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
         [`coach4`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
         [`coach5`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
         [`coach6`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
         [`coal_wagon`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
         [`huntercart01`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
         [`logwagon`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
         [`logwagon2`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
         [`oilWagon01x`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
         [`oilWagon02x`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
         [`policeWagongatling01x`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
         [`stagecoach003x`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
         [`stagecoach004x`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
         [`stagecoach006x`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
         [`supplywagon2`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
         [`wagon03x`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
         [`wagonarmoured01x`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
         [`wagondairy01x`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
        [`wagonPrison01x`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
        [`wagontraveller01x`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
        [`wagonwork01x`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
        [`warwagon2`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },

        [`armysupplywagon`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
    },
    [3] = {
        Name = "Lanterns",
        [`cart01`] = {
            [1] = {`pg_teamster_cart01_lightupgrade1`,"Upgrade#1",25},
            [2] = {`pg_teamster_cart01_lightupgrade2`,"Upgrade#2",50},
            [3] = {`pg_teamster_cart01_lightupgrade3`,"Upgrade#3",100},
            [4] = {`pg_veh_cart01_lanterns01`,        "Upgrade#4",40},
        },
        [`bountywagon01x`] = {
            [1] = {`pg_teamster_chuckwagon002x_lightupgrade1`,"Upgrade#1",50},
            [2] = {`pg_teamster_chuckwagon002x_lightupgrade2`,"Upgrade#2",100},
            [3] = {`pg_teamster_chuckwagon002x_lightupgrade3`,"Upgrade#3",150},
            [4] = {`pg_veh_chuckwagon002x_lanterns01`,        "Upgrade#4",100},
        },

        [`chuckwagon000x`] = {
            [1] = {`pg_teamster_chuckwagon000x_lightupgrade1`,"Upgrade#1",50},
            [2] = {`pg_teamster_chuckwagon000x_lightupgrade2`,"Upgrade#2",100},
            [3] = {`pg_teamster_chuckwagon000x_lightupgrade3`,"Upgrade#3",150},
            [4] = {`pg_veh_chuckwagon000x_lanterns`,          "Upgrade#4",100},
        },
        [`CHUCKWAGON002X`] = {
            [1] = {`pg_teamster_chuckwagon002x_lightupgrade1`,"Upgrade#1",50},
            [2] = {`pg_teamster_chuckwagon002x_lightupgrade2`,"Upgrade#2",100},
            [3] = {`pg_teamster_chuckwagon002x_lightupgrade3`,"Upgrade#3",150},
            [4] = {`pg_veh_chuckwagon002x_lanterns01`,        "Upgrade#4",50},
        },
        [`utilliwag`] = {
            [1] = {`pg_veh_utilliwag_lightupgrade_1`,"Upgrade#1",50},
            [2] = {`pg_veh_utilliwag_lightupgrade_2`,"Upgrade#2",100},
            [3] = {`pg_veh_utilliwag_lightupgrade_3`,"Upgrade#3",150},
            [4] = {`pg_veh_utilliwag_lanterns01`,    "Upgrade#4",100},
        },
        [`wagon02x`] = {
            [1] = {`pg_teamster_wagon02x_lightupgrade1`,"Upgrade#1",50},
            [2] = {`pg_teamster_wagon02x_lightupgrade2`,"Upgrade#2",100},
            [3] = {`pg_teamster_wagon02x_lightupgrade3`,"Upgrade#3",150},
            [4] = {`pg_veh_wagon02x_lanterns01`,        "Upgrade#4",100},
            [5] = {`pg_veh_wagonsuffrage_lanterns01`,   "Upgrade#5",100},
        },
        [`wagon04x`] = {
            [1] = {`pg_teamster_wagon04x_lightupgrade1`,"Upgrade#1",50},
            [2] = {`pg_teamster_wagon04x_lightupgrade2`,"Upgrade#2",100},
            [3] = {`pg_teamster_wagon04x_lightupgrade3`,"Upgrade#3",150},
            [4] = {`pg_veh_wagon04x_lanterns01`,        "Upgrade#4",100},
        },
        [`wagon05x`] = {
            [1] = {`pg_teamster_wagon05x_lightupgrade1`,"Upgrade#1",50},
            [2] = {`pg_teamster_wagon05x_lightupgrade2`,"Upgrade#2",100},
            [3] = {`pg_teamster_wagon05x_lightupgrade3`,"Upgrade#3",150},
            [4] = {`pg_veh_wagon05x_2_lanterns01`,      "Upgrade#4",50},
            [5] = {`pg_veh_wagon05x_lanterns01`,        "Upgrade#5",50},
            [6] = {`pg_veh_wagon05x_lanterns02`,        "Upgrade#6",50},
        },
        [`wagon06x`] = {
            [1] = {`pg_teamster_wagon06x_lightupgrade1`,"Upgrade#1",50},
            [2] = {`pg_teamster_wagon06x_lightupgrade2`,"Upgrade#2",100},
            [3] = {`pg_teamster_wagon06x_lightupgrade3`,"Upgrade#3",150},
        },
        [`cart06`] = {
             [1] = {`pg_re_deadbodies01x_lights`,      "Upgrade#1",100},  
             [2] = {`pg_teamster_cart06_lightupgrade1`,"Upgrade#2",50},
             [3] = {`pg_teamster_cart06_lightupgrade2`,"Upgrade#3",100},
             [4] = {`pg_teamster_cart06_lightupgrade3`,"Upgrade#4",150},
             [5] = {`pg_veh_cart06_lanterns01`,        "Upgrade#5",100},
        },
        [`coal_wagon`] = {
             [1] = {`pg_teamster_coalwagon_lightupgrade1`,"Upgrade#1",50},  
             [2] = {`pg_teamster_coalwagon_lightupgrade2`,"Upgrade#2",100},  
             [3] = {`pg_teamster_coalwagon_lightupgrade3`,"Upgrade#3",100},  
             [4] = {`pg_veh_coal_wagon_lanterns01`,       "Upgrade#4",100},  
        },
        [`huntercart01`] = {
             [1] = {`pg_re_deadbodies01x_lights`,      "Upgrade#1",50},  
             [2] = {`pg_teamster_cart06_lightupgrade1`,"Upgrade#2",50},  
             [3] = {`pg_teamster_cart06_lightupgrade2`,"Upgrade#3",100},  
             [4] = {`pg_teamster_cart06_lightupgrade3`,"Upgrade#4",150},  
             [5] = {`pg_veh_cart06_lanterns01`,        "Upgrade#5",100},  
        },
         [`policeWagongatling01x`] = {
             [1] = {`pg_veh_policeWagonGatling01x_lanterns01`,"Lantern",100}, 
        },
         [`stagecoach003x`] = {
             [1] = {`pg_veh_stagecoach003x_lanterns01`,"Lantern",100}, 
        },	
         [`wagonarmoured01x`] = {
             [1] = {`pg_veh_wagonarmoured01x_lanterns01`,"Lantern",100}, 
        },
        [`wagonPrison01x`] = {
             [1] = {`pg_veh_wagonPrison01x_lanterns01`,"Lantern",100}, 
        },
        [`POLICEWAGON01X`] = {
             [1] = {`pg_veh_policeWagon01x_lanterns01`,"Lantern",100}, 
        }, 
        [`gatchuck`] = {
             [1] = {`pg_teamster_gatchuck_lightupgrade1`,"Upgrade#1",50}, 
             [2] = {`pg_teamster_gatchuck_lightupgrade2`,"Upgrade#2",100}, 
             [3] = {`pg_teamster_gatchuck_lightupgrade3`,"Upgrade#3",150}, 
             [4] = {`pg_veh_gatchuck_lanterns01`,        "Upgrade#4",100}, 
        }, 
        [`armysupplywagon`] = {
             [1] = {`pg_veh_ArmySupplyWagon_lanterns01`,"Lantern",100},
        },
		
        [`cart05`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
        [`cart07`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
        [`cart08`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },		
        [`stagecoach005x`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
        [`supplywagon`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },		
        [`wagonCircus01x`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
        [`wagonCircus02x`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
        [`wagondoc01x`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
        [`CART02`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
        [`buggy01`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
        [`buggy02`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
        [`buggy03`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
        [`cart03`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
        [`cart04`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
        [`coach3`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
        [`coach3_cutscene`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
        [`coach4`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
        [`coach5`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
        [`coach6`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
         [`logwagon`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
         [`logwagon2`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
         [`oilWagon01x`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
         [`oilWagon02x`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
         [`stagecoach004x`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
         [`stagecoach006x`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
         [`supplywagon2`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
         [`wagon03x`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
         [`wagondairy01x`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
        [`wagontraveller01x`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
        [`wagonwork01x`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
        [`warwagon2`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
        [`gatchuck_2`] = {
            [1] = {0,"NOEQUIPMENT",0},
        }, 
        [`STAGECOACH004_2x`] = {
            [1] = {0,"NOEQUIPMENT",0},
        }, 
        [`STAGECOACH002X`] = {
            [1] = {0,"NOEQUIPMENT",0},
        }, 
        [`STAGECOACH001X`] = {
            [1] = {0,"NOEQUIPMENT",0},
        }, 
        [`COACH2`] = {
            [1] = {0,"NOEQUIPMENT",0},
        }, 
    },
    [4] = {
        Name = "Decorations",
        [`cart01`] = {
            [1] =  {0, "Decoration#1" ,100},
            [2] =  {1, "Decoration#2" ,100},
            [3] =  {2, "Decoration#3" ,100},
            [4] =  {3, "Decoration#4" ,100},
            [5] =  {4, "Decoration#5" ,100},
            [6] =  {5, "Decoration#6" ,100},
            [7] =  {6, "Decoration#7" ,100},
            [8] =  {7, "Decoration#8" ,100},
            [9] =  {8, "Decoration#9" ,100},
            [10] = {9, "Decoration#10",100},
            [11] = {10,"Decoration#11",100},
            [12] = {11,"Decoration#12",100}, 
        },
        [`bountywagon01x`] = {
            [1] = {0, "Decoration#1",100},
            [2] = {1, "Decoration#2",100},
            [3] = {2, "Decoration#3",100},
        },
        [`cart05`] = {
            [1] =  {0, "Decoration#1" , 100},
            [2] =  {1, "Decoration#2" , 100},
            [3] =  {2, "Decoration#3" , 100},
            [4] =  {3, "Decoration#4" , 100},
            [5] =  {4, "Decoration#5" , 100},
            [6] =  {5, "Decoration#6" , 100},
            [7] =  {6, "Decoration#7" , 100},
            [8] =  {7, "Decoration#8" , 100},
            [9] =  {8, "Decoration#9" , 100},
            [10] = {9, "Decoration#10", 100},
        },
        [`cart07`] = {
            [1] =  {0, "Decoration#1",  100},
            [2] =  {1, "Decoration#2",  100},
            [3] =  {2, "Decoration#3",  100},
            [4] =  {3, "Decoration#4",  100},
            [5] =  {4, "Decoration#5",  100},
            [6] =  {5, "Decoration#6",  100},
            [7] =  {6, "Decoration#7",  100},
            [8] =  {7, "Decoration#8",  100},
            [9] =  {8, "Decoration#9",  100},
            [10] = {9, "Decoration#10", 100},
            [11] = {10,"Decoration#11", 100},
            [12] = {11,"Decoration#12", 100},
        },
        [`cart08`] = {
            [1] =  {0, "Decoration#1",  100},
            [2] =  {1, "Decoration#2",  100},
            [3] =  {2, "Decoration#3",  100},
            [4] =  {3, "Decoration#4",  100},
            [5] =  {4, "Decoration#5",  100},
            [6] =  {5, "Decoration#6",  100},
            [7] =  {6, "Decoration#7",  100},
            [8] =  {7, "Decoration#8",  100},
            [9] =  {8, "Decoration#9",  100},
            [10] = {9, "Decoration#10", 100},
            [11] = {10,"Decoration#11", 100},
            [12] = {11,"Decoration#12", 100},
            [13] = {12,"Decoration#13", 100},
            [14] = {13,"Decoration#14", 100},
            [15] = {14,"Decoration#15", 100},
            [16] = {15,"Decoration#16", 100},


        },
        [`chuckwagon000x`] = {
            [1] = {0, "Decoration#1", 100},
            [2] = {1, "Decoration#2", 100},
            [3] = {2, "Decoration#3", 100},
            [4] = {3, "Decoration#4", 100},
            [5] = {4, "Decoration#5", 100},
            [6] = {5, "Decoration#6", 100},
            [7] = {6, "Decoration#7", 100},
            [8] = {7, "Decoration#8", 100},
            [9] = {8, "Decoration#9", 100},
            [10]= {9, "Decoration#10",100},
            [11]= {10,"Decoration#11",100},
        },
        [`stagecoach005x`] = {
            [1] = {0, "Decoration#1", 100},
            [2] = {1, "Decoration#2", 100},
            [3] = {2, "Decoration#3", 100},
            [4] = {3, "Decoration#4", 100},
        },
        [`CHUCKWAGON002X`] = {
            [1] =  {0, "Decoration#1", 100},
            [2] =  {1, "Decoration#2", 100},
            [3] =  {2, "Decoration#3", 100},
            [4] =  {3, "Decoration#4", 100},
            [5] =  {4, "Decoration#5", 100},
            [6] =  {5, "Decoration#6", 100},
            [7] =  {6, "Decoration#7", 100},
            [8] =  {7, "Decoration#8", 100},
            [9] =  {8, "Decoration#9", 100},
            [10] = {9, "Decoration#10",100},
            [11] = {10,"Decoration#11",100},
        },
        [`supplywagon`] = {
            [1] =   {0, "Decoration#1",  100},
            [2] =   {1, "Decoration#2",  100},
            [3] =   {2, "Decoration#3",  100},
            [4] =   {3, "Decoration#4",  100},
            [5] =   {4, "Decoration#5",  100},
            [6] =   {5, "Decoration#6",  100},
            [7] =   {6, "Decoration#7",  100},
            [8] =   {7, "Decoration#8",  100},
            [9] =   {8, "Decoration#9",  100},
            [10] =  {9, "Decoration#10", 100},
            [11] = {10, "Decoration#11", 100},
            [12] = {11, "Decoration#12", 100},
            [13] = {12, "Decoration#13", 100},
            [14] = {13, "Decoration#14", 100},
            [15] = {14, "Decoration#15", 100},
            [16] = {15, "Decoration#16", 100},
        },
        [`utilliwag`] = {
            [1] =  {0, "Decoration#1",  100},
            [2] =  {1, "Decoration#2",  100},
            [3] =  {2, "Decoration#3",  100},
            [4] =  {3, "Decoration#4",  100},
            [5] =  {4, "Decoration#5",  100},
            [6] =  {5, "Decoration#6",  100},
            [7] =  {6, "Decoration#7",  100},
            [8] =  {7, "Decoration#8",  100},
            [9] =  {8, "Decoration#9",  100},
            [10] = {9, "Decoration#10", 100},
            [11] = {10,"Decoration#11", 100},
            [12] = {11,"Decoration#12", 100},
            [13] = {12,"Decoration#13", 100},
            [14] = {13,"Decoration#14", 100},
            [15] = {14,"Decoration#15", 100},
            [16] = {15,"Decoration#16", 100},
        },
        [`wagon02x`] = {
            [1] =  {0, "Decoration#01", 100},
            [2] =  {1, "Decoration#02", 100},
            [3] =  {2, "Decoration#03", 100},
            [4] =  {3, "Decoration#04", 100},
            [5] =  {4, "Decoration#05", 100},
            [6] =  {5, "Decoration#06", 100},
            [7] =  {6, "Decoration#07", 100},
            [8] =  {7, "Decoration#08", 100},
            [9] =  {8, "Decoration#09", 100},
            [10] = {9, "Decoration#10", 100},
            [11] = {10,"Decoration#11", 100},
            [12] = {11,"Decoration#12", 100},
            [13] = {12,"Decoration#13", 100},
            [14] = {13,"Decoration#14", 100},
            [15] = {14,"Decoration#15", 100},
            [16] = {15,"Decoration#16", 100},
            [17] = {16,"Decoration#17", 100},
        },
        [`wagon04x`] = {
            [1] =  {0, "Decoration#01",100},
            [2] =  {1, "Decoration#02",100},
            [3] =  {2, "Decoration#03",100},
            [4] =  {3, "Decoration#04",100},
            [5] =  {4, "Decoration#05",100},
            [6] =  {5, "Decoration#06",100},
            [7] =  {6, "Decoration#07",100},
            [8] =  {7, "Decoration#08",100},
            [9] =  {8, "Decoration#09",100},
            [10] = {9, "Decoration#10",100},
            [11] = {10,"Decoration#11",100},
            [12] = {11,"Decoration#12",100},
            [13] = {12,"Decoration#13",100},
            [14] = {13,"Decoration#14",100},
            [15] = {14,"Decoration#15",100},
            [16] = {15,"Decoration#16",100},
        },
        [`wagon05x`] = {
            [1] =  {0, "Decoration#01",100},
            [2] =  {1, "Decoration#02",100},
            [3] =  {2, "Decoration#03",100},
            [4] =  {3, "Decoration#04",100},
            [5] =  {4, "Decoration#05",100},
            [6] =  {5, "Decoration#06",100},
            [7] =  {6, "Decoration#07",100},
            [8] =  {7, "Decoration#08",100},
            [9] =  {8, "Decoration#09",100},
            [10] = {9, "Decoration#10",100},
            [11] = {10,"Decoration#11",100},
            [12] = {11,"Decoration#12",100},
            [13] = {12,"Decoration#13",100},
            [14] = {13,"Decoration#14",100},
            [15] = {14,"Decoration#15",100},
            [16] = {15,"Decoration#16",100},
            [17] = {16,"Decoration#17",100},
            [18] = {17,"Decoration#18",100},
            [19] = {18,"Decoration#19",100},
            [20] = {19,"Decoration#20",100},
        },
        [`wagon06x`] = {
            [1] =  {0, "Decoration#01",100},
            [2] =  {1, "Decoration#02",100},
            [3] =  {2, "Decoration#03",100},
            [4] =  {3, "Decoration#04",100},
            [5] =  {4, "Decoration#05",100},
            [6] =  {5, "Decoration#06",100},
            [7] =  {6, "Decoration#07",100},
            [8] =  {7, "Decoration#08",100},
            [9] =  {8, "Decoration#09",100},
            [10] = {9, "Decoration#10",100},
            [11] = {10,"Decoration#11",100},
            [12] = {11,"Decoration#12",100},
            [13] = {12,"Decoration#13",100},
            [14] = {13,"Decoration#14",100},
            [15] = {14,"Decoration#15",100},
            [16] = {15,"Decoration#16",100},
        },
         [`wagondoc01x`] = {
            [1] = {0, "Decoration#01", 100},
        },
         [`CART02`] = {
            [1] =  {0, "Decoration#01",100},
            [2] =  {1, "Decoration#02",100},
            [3] =  {2, "Decoration#03",100},
            [4] =  {3, "Decoration#04",100},
            [5] =  {4, "Decoration#05",100},
            [6] =  {5, "Decoration#06",100},
            [7] =  {6, "Decoration#07",100},
            [8] =  {7, "Decoration#08",100},
            [9] =  {8, "Decoration#09",100},
            [10] = {9, "Decoration#10",100},
            [11] = {10,"Decoration#11",100},
            [12] = {11,"Decoration#12",100},
            [13] = {12,"Decoration#13",100},
            [14] = {13,"Decoration#14",100},
            [15] = {14,"Decoration#15",100},
            [16] = {15,"Decoration#16",100},
        },
         [`buggy01`] = {
            [1] =  {0, "Decoration#01",100},
            [2] =  {1, "Decoration#02",100},
            [3] =  {2, "Decoration#03",100},
            [4] =  {3, "Decoration#04",100},
            [5] =  {4, "Decoration#05",100},
            [6] =  {5, "Decoration#06",100},
            [7] =  {6, "Decoration#07",100},
            [8] =  {7, "Decoration#08",100},
            [9] =  {8, "Decoration#09",100},
            [10] = {9, "Decoration#10",100},
            [11] = {10,"Decoration#11",100},
            [12] = {11,"Decoration#12",100},
            [13] = {12,"Decoration#13",100},
            [14] = {13,"Decoration#14",100},
            [15] = {14,"Decoration#15",100},
        },
         [`buggy02`] = {
            [1] =  {0, "Decoration#01",100},
            [2] =  {1, "Decoration#02",100},
            [3] =  {2, "Decoration#03",100},
            [4] =  {3, "Decoration#04",100},
            [5] =  {4, "Decoration#05",100},
            [6] =  {5, "Decoration#06",100},
            [7] =  {6, "Decoration#07",100},
            [8] =  {7, "Decoration#08",100},
            [9] =  {8, "Decoration#09",100},
            [10] = {9, "Decoration#10",100},
            [11] = {10,"Decoration#11",100},
            [12] = {11,"Decoration#12",100},
            [13] = {12,"Decoration#13",100},
            [14] = {13,"Decoration#14",100},
            [15] = {14,"Decoration#15",100},
        },
         [`buggy03`] = {
            [1] =  {0, "Decoration#01",100},
            [2] =  {1, "Decoration#02",100},
            [3] =  {2, "Decoration#03",100},
            [4] =  {3, "Decoration#04",100},
            [5] =  {4, "Decoration#05",100},
            [6] =  {5, "Decoration#06",100},
            [7] =  {6, "Decoration#07",100},
            [8] =  {7, "Decoration#08",100},
            [9] =  {8, "Decoration#09",100},
            [10] = {9, "Decoration#10",100},
            [11] = {10,"Decoration#11",100},
            [12] = {11,"Decoration#12",100},
            [13] = {12,"Decoration#13",100},
            [14] = {13,"Decoration#14",100},
            [15] = {14,"Decoration#15",100},
        },
         [`cart03`] = {
            [1] = {0, "Decoration#01",100},
            [2] = {1, "Decoration#02",100},
            [3] = {2, "Decoration#03",100},
            [4] = {3, "Decoration#04",100},
            [5] = {4, "Decoration#05",100},
            [6] = {5, "Decoration#06",100},
            [7] = {6, "Decoration#07",100},
            [8] = {7, "Decoration#08",100},
            [9] = {8, "Decoration#09",100},
            [10] = {9,"Decoration#10",100},
        },
         [`cart04`] = {
            [1] = {0, "Decoration#01",100},
            [2] = {1, "Decoration#02",100},
            [3] = {2, "Decoration#03",100},
            [4] = {3, "Decoration#04",100},
            [5] = {4, "Decoration#05",100},
            [6] = {5, "Decoration#06",100},
            [7] = {6, "Decoration#07",100},
        },
         [`cart06`] = {
            [1] =  {0, "Decoration#01",100},
            [2] =  {1, "Decoration#02",100},
            [3] =  {2, "Decoration#03",100},
            [4] =  {3, "Decoration#04",100},
            [5] =  {4, "Decoration#05",100},
            [6] =  {5, "Decoration#06",100},
            [7] =  {6, "Decoration#07",100},
            [8] =  {7, "Decoration#08",100},
            [9] =  {8, "Decoration#09",100},
            [10] = {9, "Decoration#10",100},
            [11] = {10,"Decoration#11",100},
            [12] = {11,"Decoration#12",100},
            [13] = {12,"Decoration#13",100},
        },              
         [`coach3`] = {
            [1] =   {0,"Decoration#01",100},
            [2] =   {1,"Decoration#02",100},
            [3] =   {2,"Decoration#03",100},
            [4] =   {3,"Decoration#04",100},
            [5] =   {4,"Decoration#05",100},
            [6] =   {5,"Decoration#06",100},
            [7] =   {6,"Decoration#07",100},
            [8] =   {7,"Decoration#08",100},
            [9] =   {8,"Decoration#09",100},
            [10] = {9, "Decoration#10",100},
            [11] = {10,"Decoration#11",100},
            [12] = {11,"Decoration#12",100},
            [13] = {12,"Decoration#13",100},
        },
         [`coach3_cutscene`] = {
            [1] = {0, "Decoration#01",100},
            [2] = {1, "Decoration#02",100},
            [3] = {2, "Decoration#03",100},
            [4] = {3, "Decoration#04",100},
        },
         [`coach4`] = {
            [1] =  {0, "Decoration#01",100},
            [2] =  {1, "Decoration#02",100},
            [3] =  {2, "Decoration#03",100},
            [4] =  {3, "Decoration#04",100},
            [5] =  {4, "Decoration#05",100},
            [6] =  {5, "Decoration#06",100},
            [7] =  {6, "Decoration#07",100},
            [8] =  {7, "Decoration#08",100},
            [9] =  {8, "Decoration#09",100},
            [10] = {9, "Decoration#10",100},
            [11] = {10,"Decoration#11",100},
            [12] = {11,"Decoration#12",100},
            [13] = {12,"Decoration#13",100},
            [14] = {13,"Decoration#14",100},
        },
         [`coach5`] = {
            [1] =  {0, "Decoration#01",100},
            [2] =  {1, "Decoration#02",100},
            [3] =  {2, "Decoration#03",100},
            [4] =  {3, "Decoration#04",100},
            [5] =  {4, "Decoration#05",100},
            [6] =  {5, "Decoration#06",100},
            [7] =  {6, "Decoration#07",100},
            [8] =  {7, "Decoration#08",100},
            [9] =  {8, "Decoration#09",100},
            [10] = {9, "Decoration#10",100},
            [11] = {10,"Decoration#11",100},
            [12] = {11,"Decoration#12",100},
        },
         [`coach6`] = {
            [1] =  {0, "Decoration#01",100},
            [2] =  {1, "Decoration#02",100},
            [3] =  {2, "Decoration#03",100},
            [4] =  {3, "Decoration#04",100},
            [5] =  {4, "Decoration#05",100},
            [6] =  {5, "Decoration#06",100},
            [7] =  {6, "Decoration#07",100},
            [8] =  {7, "Decoration#08",100},
            [9] =  {8, "Decoration#09",100},
            [10] = {9, "Decoration#10",100},
            [11] = {10,"Decoration#11",100},
            [12] = {11,"Decoration#12",100},
            [13] = {12,"Decoration#13",100},
            [14] = {13,"Decoration#14",100},
            [15] = {14,"Decoration#15",100},
            [16] = {15,"Decoration#16",100},
        },
         [`coal_wagon`] = {
            [1] = {0, "Decoration#01",100},
            [2] = {1, "Decoration#02",100},
            [3] = {2, "Decoration#03",100},
            [4] = {3, "Decoration#04",100},
        },
         [`huntercart01`] = {
            [1] = {0, "Decoration#01",100},
            [2] = {1, "Decoration#02",100},
            [3] = {2, "Decoration#03",100},
            [4] = {3, "Decoration#04",100},
            [5] = {4, "Decoration#05",100},
            [6] = {5, "Decoration#06",100},
        },

         [`oilWagon01x`] = {
            [1] = {0, "Decoration#01",100},
            [2] = {1, "Decoration#02",100},
            [3] = {2, "Decoration#03",100},
            [4] = {3, "Decoration#04",100},
            [5] = {4, "Decoration#05",100},
            [6] = {5, "Decoration#06",100},
        },
         [`oilWagon02x`] = {
            [1] = {0, "Decoration#01",100},
            [2] = {1, "Decoration#02",100},
            [3] = {2, "Decoration#03",100},
            [4] = {3, "Decoration#04",100},
            [5] = {4, "Decoration#05",100},
            [6] = {5, "Decoration#06",100},
        },
         [`policeWagongatling01x`] = {
            [1] = {0, "Decoration#01",100},
        },
         [`stagecoach003x`] = {
            [1] = {0, "Decoration#01",100},
            [2] = {1, "Decoration#02",100},
            [3] = {2, "Decoration#03",100},
            [4] = {3, "Decoration#04",100},
        },
         [`stagecoach004x`] = {
            [1] = {0, "Decoration#01",100},
        },
         [`stagecoach006x`] = {
            [1] = {0, "Decoration#01",100},
            [2] = {1, "Decoration#02",100},
            [3] = {2, "Decoration#03",100},
            [4] = {3, "Decoration#04",100},
        },
         [`supplywagon2`] = {
            [1] =  {0, "Decoration#01",100},
            [2] =  {1, "Decoration#02",100},
            [3] =  {2, "Decoration#03",100},
            [4] =  {3, "Decoration#04",100},
            [5] =  {4, "Decoration#05",100},
            [6] =  {5, "Decoration#06",100},
            [7] =  {6, "Decoration#07",100},
            [8] =  {7, "Decoration#08",100},
            [9] =  {8, "Decoration#09",100},
            [10] = {9, "Decoration#10",100},
            [11] = {10,"Decoration#11",100},
            [12] = {11,"Decoration#12",100},
            [13] = {12,"Decoration#13",100},
            [14] = {13,"Decoration#14",100},
            [15] = {14,"Decoration#15",100},
            [16] = {15,"Decoration#16",100},
        },
         [`wagon03x`] = {
            [1] =  {0, "Decoration#01",100},
            [2] =  {1, "Decoration#02",100},
            [3] =  {2, "Decoration#03",100},
            [4] =  {3, "Decoration#04",100},
            [5] =  {4, "Decoration#05",100},
            [6] =  {5, "Decoration#06",100},
            [7] =  {6, "Decoration#07",100},
            [8] =  {7, "Decoration#08",100},
            [9] =  {8, "Decoration#09",100},
            [10] = {9, "Decoration#10",100},
            [11] = {10,"Decoration#11",100},
            [12] = {11,"Decoration#12",100},
            [13] = {12,"Decoration#13",100},
            [14] = {13,"Decoration#14",100},
            [15] = {14,"Decoration#15",100},
            [16] = {15,"Decoration#16",100},
        },
         [`wagon05x`] = {
            [1] =  {0, "Decoration#01",100},
            [2] =  {1, "Decoration#02",100},
            [3] =  {2, "Decoration#03",100},
            [4] =  {3, "Decoration#04",100},
            [5] =  {4, "Decoration#05",100},
            [6] =  {5, "Decoration#06",100},
            [7] =  {6, "Decoration#07",100},
            [8] =  {7, "Decoration#08",100},
            [9] =  {8, "Decoration#09",100},
            [10] = {9, "Decoration#10",100},
            [11] = {10,"Decoration#11",100},
            [12] = {11,"Decoration#12",100},
            [13] = {12,"Decoration#13",100},
            [14] = {13,"Decoration#14",100},
            [15] = {14,"Decoration#15",100},
            [16] = {15,"Decoration#16",100},
            [17] = {16,"Decoration#17",100},
            [18] = {17,"Decoration#18",100},
            [19] = {18,"Decoration#19",100},
            [20] = {19,"Decoration#20",100},
        },
         [`wagonarmoured01x`] = {
            [1] =  {0,  "Decoration#01",100},
            [2] =  {1,  "Decoration#02",100},
            [3] =  {2,  "Decoration#03",100},
            [4] =  {3,  "Decoration#04",100},
            [5] =  {4,  "Decoration#05",100},
            [6] =  {5,  "Decoration#06",100},
            [7] =  {6,  "Decoration#07",100},
            [8] =  {7,  "Decoration#08",100},
            [9] =  {8,  "Decoration#09",100},
            [10] = {9,  "Decoration#10",100},
            [11] = {10, "Decoration#11",100},
            [12] = {11, "Decoration#12",100},
            [13] = {12, "Decoration#13",100},
            [14] = {13, "Decoration#14",100},
            [15] = {14, "Decoration#15",100},
            [16] = {15, "Decoration#16",100},
            [17] = {16, "Decoration#17",100},
            [18] = {17, "Decoration#18",100},
            [19] = {18, "Decoration#19",100},
            [20] = {19, "Decoration#20",100},
            [21] = {20, "Decoration#21",100},
            [22] = {21, "Decoration#22",100},
            [23] = {22, "Decoration#23",100},
            [24] = {23, "Decoration#24",100},
            [25] = {24, "Decoration#25",100},
            [26] = {25, "Decoration#26",100},
            [27] = {26, "Decoration#27",100},
            [28] = {27, "Decoration#28",100},
            [29] = {28, "Decoration#29",100},
            [30] = {29, "Decoration#30",100},
            [31] = {30, "Decoration#31",100},
        },
         [`wagondairy01x`] = {
            [1] = {0, "Decoration#1",100},
	        [2] = {1, "Decoration#2",100},
        },
        [`wagontraveller01x`] = {
            [1] = {0, "Decoration#01",100},
        },
        [`wagonwork01x`] = {
            [1] = {0, "Decoration#01",100},
        },
        [`warwagon2`] = {
            [1] = {0, "Decoration#1",100},
            [2] = {1, "Decoration#2",100},
            [3] = {2, "Decoration#3",100},
            [4] = {3, "Decoration#4",100},
        },
        [`POLICEWAGON01X`] = {
            [1] = {0, "Decoration#01",100},
        }, 
        [`gatchuck_2`] = {
            [1] =  {0, "Decoration#01",100},
            [2] =  {1, "Decoration#02",100},
            [3] =  {2, "Decoration#03",100},
            [4] =  {3, "Decoration#04",100},
            [5] =  {4, "Decoration#05",100},
            [6] =  {5, "Decoration#06",100},
            [7] =  {6, "Decoration#07",100},
            [8] =  {7, "Decoration#08",100},
            [9] =  {8, "Decoration#09",100},
            [10] = {9, "Decoration#10",100},
            [11] = {10,"Decoration#11",100},
            [12] = {11,"Decoration#12",100},
            [13] = {12,"Decoration#13",100},
            [14] = {13,"Decoration#14",100},
            [15] = {14,"Decoration#15",100},
            [16] = {15,"Decoration#16",100},
        }, 
        [`STAGECOACH004_2x`] = {
            [1] = {0, "Decoration#1",100},
            [2] = {1, "Decoration#2",100},
            [3] = {2, "Decoration#3",100},
            [4] = {3, "Decoration#4",100},
            [5] = {4, "Decoration#5",100},
        }, 
        [`STAGECOACH002X`] = {
            [1] = {0, "Decoration#1",100},
            [2] = {1, "Decoration#2",100},
            [3] = {2, "Decoration#3",100},
            [4] = {3, "Decoration#4",100},
        }, 
        [`STAGECOACH001X`] = {
            [1] = {0, "Decoration#1",100},
            [2] = {1, "Decoration#2",100},
            [3] = {2, "Decoration#3",100},
            [4] = {3, "Decoration#4",100},
        }, 
        [`COACH2`] = {
            [1] = {0, "Decoration#1",100},
            [2] = {1, "Decoration#2",100},
            [3] = {2, "Decoration#3",100},
            [4] = {3, "Decoration#4",100},
        }, 
        [`gatchuck`] = {
            [1] =  {0, "Decoration#01",100},
            [2] =  {1, "Decoration#02",100},
            [3] =  {2, "Decoration#03",100},
            [4] =  {3, "Decoration#04",100},
            [5] =  {4, "Decoration#05",100},
            [6] =  {5, "Decoration#06",100},
            [7] =  {6, "Decoration#07",100},
            [8] =  {7, "Decoration#08",100},
            [9] =  {8, "Decoration#09",100},
            [10] = {9, "Decoration#10",100},
            [11] = {10,"Decoration#11",100},
            [12] = {11,"Decoration#12",100},
            [13] = {12,"Decoration#13",100},
            [14] = {13,"Decoration#14",100},
            [15] = {14,"Decoration#15",100},
            [16] = {15,"Decoration#16",100},
        }, 
        [`armysupplywagon`] = {
            [1] = {0, "Decoration#01",100},
        },
         [`logwagon`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
         [`logwagon2`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },		
        [`wagonPrison01x`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },		
         [`wagonCircus01x`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },
         [`wagonCircus02x`] = {
            [1] = {0,"NOEQUIPMENT",0},
        },		
    },
	
    [5] =  {
        Name = "Tints",
        [`cart01`] = {
            [1] =   {0,"Tint#1",100},
            [2] =   {1,"Tint#2",100},
            [3] =   {2,"Tint#3",100},
            [4] =   {3,"Tint#4",100},
            [5] =   {4,"Tint#5",100},
            [6] =   {5,"Tint#6",100},
            [7] =   {6,"Tint#7",100},
            [8] =   {7,"Tint#8",100},
            [9] =   {8,"Tint#9",100},
            [10] =  {9,"Tint#10",100},
            [11] = {10,"Tint#11",100},
            [12] = {11,"Tint#12",100},
            [13] = {12,"Tint#13",100},
            [14] = {13,"Tint#14",100},
            [15] = {14,"Tint#15",100},
            [16] = {15,"Tint#16",100},
            [17] = {16,"Tint#17",100},
            [18] = {17,"Tint#18",100},
            [19] = {18,"Tint#19",100},
            [20] = {19,"Tint#20",100},
            [21] = {20,"Tint#21",100},
            [22] = {21,"Tint#22",100},
            [23] = {22,"Tint#23",100},
            [24] = {23,"Tint#24",100},
            [25] = {24,"Tint#25",100},
            [26] = {25,"Tint#26",100},
            [27] = {26,"Tint#27",100},
        },
        [`bountywagon01x`] = {
            [1] = {0,"Tint#1",100},
            [2] = {1,"Tint#2",100},
            [3] = {2,"Tint#3",100},
            [4] = {3,"Tint#4",100},
            [5] = {4,"Tint#5",100},
        },
        [`cart05`] = {
            [1] =   {0,"Tint#1",100},
            [2] =   {1,"Tint#2",100},
            [3] =   {2,"Tint#3",100},
            [4] =   {3,"Tint#4",100},
            [5] =   {4,"Tint#5",100},
            [6] =   {5,"Tint#6",100},
            [7] =   {6,"Tint#7",100},
            [8] =   {7,"Tint#8",100},
            [9] =   {8,"Tint#9",100},
            [10] =  {9,"Tint#10",100},
            [11] = {10,"Tint#11",100},
            [12] = {11,"Tint#12",100},
            [13] = {12,"Tint#13",100},
            [14] = {13,"Tint#14",100},
            [15] = {14,"Tint#15",100},
            [16] = {15,"Tint#16",100},
            [17] = {16,"Tint#17",100},
            [18] = {17,"Tint#18",100},
            [19] = {18,"Tint#19",100},
            [20] = {19,"Tint#20",100},
            [21] = {20,"Tint#21",100},
            [22] = {21,"Tint#22",100},
            [23] = {22,"Tint#23",100},
            [24] = {23,"Tint#24",100},
        },
        [`cart07`] = {
            [1] =   {0,"Tint#1",100},
            [2] =   {1,"Tint#2",100},
            [3] =   {2,"Tint#3",100},
            [4] =   {3,"Tint#4",100},
            [5] =   {4,"Tint#5",100},
            [6] =   {5,"Tint#6",100},
            [7] =   {6,"Tint#7",100},
            [8] =   {7,"Tint#8",100},
            [9] =   {8,"Tint#9",100},
            [10] =  {9,"Tint#10",100},
            [11] = {10,"Tint#11",100},
            [12] = {11,"Tint#12",100},
            [13] = {12,"Tint#13",100},
            [14] = {13,"Tint#14",100},
            [15] = {14,"Tint#15",100},
            [16] = {15,"Tint#16",100},
            [17] = {16,"Tint#17",100},
            [18] = {17,"Tint#18",100},
            [19] = {18,"Tint#19",100},
            [20] = {19,"Tint#20",100},
            [21] = {20,"Tint#21",100},
            [22] = {21,"Tint#22",100},
            [23] = {22,"Tint#23",100},
            [24] = {23,"Tint#24",100},
        },
        [`cart08`] = {
            [1] = {0,"Tint#1",100},
            [2] = {1,"Tint#2",100},
            [3] = {2,"Tint#3",100},
            [4] = {3,"Tint#4",100},
            [5] = {4,"Tint#5",100},
            [6] = {5,"Tint#6",100},
            [7] = {6,"Tint#7",100},
            [8] = {7,"Tint#8",100},
            [9] = {8,"Tint#9",100},
            [10] = {9,"Tint#10",100},
            [11] = {10,"Tint#11",100},
            [12] = {11,"Tint#12",100},
            [13] = {12,"Tint#13",100},
            [14] = {13,"Tint#14",100},
            [15] = {14,"Tint#15",100},
            [16] = {15,"Tint#16",100},
            [17] = {16,"Tint#17",100},
            [18] = {17,"Tint#18",100},
            [19] = {18,"Tint#19",100},
            [20] = {19,"Tint#20",100},
        },
        [`chuckwagon000x`] = {
            [1] = {0,"Tint#1",100},
            [2] = {1,"Tint#2",100},
            [3] = {2,"Tint#3",100},
            [4] = {3,"Tint#4",100},
            [5] = {4,"Tint#5",100},
            [6] = {5,"Tint#6",100},
            [7] = {6,"Tint#7",100},
            [8] = {7,"Tint#8",100},
            [9] = {8,"Tint#9",100},
            [10] = {9,"Tint#10",100},
            [11] = {10,"Tint#11",100},
            [12] = {11,"Tint#12",100},
            [13] = {12,"Tint#13",100},
            [14] = {13,"Tint#14",100},
            [15] = {14,"Tint#15",100},
        },
        [`CHUCKWAGON002X`] = {
            [1] = {0,"Tint#1",100},
            [2] = {1,"Tint#2",100},
            [3] = {2,"Tint#3",100},
            [4] = {3,"Tint#4",100},
            [5] = {4,"Tint#5",100},
            [6] = {5,"Tint#6",100},
            [7] = {6,"Tint#7",100},
            [8] = {7,"Tint#8",100},
            [9] = {8,"Tint#9",100},
            [10] = {9,"Tint#10",100},
            [11] = {10,"Tint#11",100},
            [12] = {11,"Tint#12",100},
            [13] = {12,"Tint#13",100},
            [14] = {13,"Tint#14",100},
            [15] = {14,"Tint#15",100},
        },
        [`stagecoach005x`] = {
            [1] = {0,"Tint#1",100},
            [2] = {1,"Tint#2",100},
            [3] = {2,"Tint#3",100},
            [4] = {3,"Tint#4",100},
        },
        [`supplywagon`] = {
            [1] = {0,"Tint#1",100},
            [2] = {1,"Tint#2",100},
            [3] = {2,"Tint#3",100},
            [4] = {3,"Tint#4",100},
            [5] = {4,"Tint#5",100},
            [6] = {5,"Tint#6",100},
            [7] = {6,"Tint#7",100},
            [8] = {7,"Tint#8",100},
            [9] = {8,"Tint#9",100},
            [10] = {9,"Tint#10",100},
            [11] = {10,"Tint#11",100},
            [12] = {11,"Tint#12",100},
            [13] = {12,"Tint#13",100},
            [14] = {13,"Tint#14",100},
            [15] = {14,"Tint#15",100},
            [16] = {15,"Tint#16",100},
        },
        [`utilliwag`] = {
            [1] = {0,"Tint#1",100},
            [2] = {1,"Tint#2",100},
            [3] = {2,"Tint#3",100},
            [4] = {3,"Tint#4",100},
            [5] = {4,"Tint#5",100},
            [6] = {5,"Tint#6",100},
            [7] = {6,"Tint#7",100},
            [8] = {7,"Tint#8",100},
            [9] = {8,"Tint#9",100},
            [10] = {9,"Tint#10",100},
            [11] = {10,"Tint#11",100},
            [12] = {11,"Tint#12",100},
            [13] = {12,"Tint#13",100},
            [14] = {13,"Tint#14",100},
            [15] = {14,"Tint#15",100},
            [16] = {15,"Tint#16",100},
            [17] = {16,"Tint#17",100},
        },
        [`wagon02x`] = {
            [1] = {0,"Tint#1",100},
            [2] = {1,"Tint#2",100},
            [3] = {2,"Tint#3",100},
            [4] = {3,"Tint#4",100},
            [5] = {4,"Tint#5",100},
            [6] = {5,"Tint#6",100},
            [7] = {6,"Tint#7",100},
            [8] = {7,"Tint#8",100},
            [9] = {8,"Tint#9",100},
            [10] = {9,"Tint#10",100},
            [11] = {10,"Tint#11",100},
            [12] = {11,"Tint#12",100},
            [13] = {12,"Tint#13",100},
            [14] = {13,"Tint#14",100},
            [15] = {14,"Tint#15",100},
            [16] = {15,"Tint#16",100},
            [17] = {16,"Tint#17",100},
            [18] = {17,"Tint#18",100},
            [19] = {18,"Tint#19",100},
            [20] = {19,"Tint#20",100},
            [21] = {20,"Tint#21",100},
            [22] = {21,"Tint#22",100},
        },
        [`wagon04x`] = {
            [1] = {0,"Tint#1",100},
            [2] = {1,"Tint#2",100},
            [3] = {2,"Tint#3",100},
            [4] = {3,"Tint#4",100},
            [5] = {4,"Tint#5",100},
            [6] = {5,"Tint#6",100},
            [7] = {6,"Tint#7",100},
            [8] = {7,"Tint#8",100},
            [9] = {8,"Tint#9",100},
            [10] = {9,"Tint#10",100},
            [11] = {10,"Tint#11",100},
            [12] = {11,"Tint#12",100},
            [13] = {12,"Tint#13",100},
            [14] = {13,"Tint#14",100},
            [15] = {14,"Tint#15",100},
            [16] = {15,"Tint#16",100},
            [17] = {16,"Tint#17",100},
            [18] = {17,"Tint#18",100},
            [19] = {18,"Tint#19",100},
            [20] = {19,"Tint#20",100},
            [21] = {20,"Tint#21",100},
        },
        [`wagon05x`] = {
            [1] = {0,"Tint#1",100},
            [2] = {1,"Tint#2",100},
            [3] = {2,"Tint#3",100},
            [4] = {3,"Tint#4",100},
            [5] = {4,"Tint#5",100},
            [6] = {5,"Tint#6",100},
            [7] = {6,"Tint#7",100},
            [8] = {7,"Tint#8",100},
            [9] = {8,"Tint#9",100},
            [10] = {9,"Tint#10",100},
            [11] = {10,"Tint#11",100},
            [12] = {11,"Tint#12",100},
            [13] = {12,"Tint#13",100},
            [14] = {13,"Tint#14",100},
            [15] = {14,"Tint#15",100},
            [16] = {15,"Tint#16",100},
            [17] = {16,"Tint#17",100},
            [18] = {17,"Tint#18",100},
            [19] = {18,"Tint#19",100},
            [20] = {19,"Tint#20",100},
        },
        [`wagon06x`] = {
            [1] = {0,"Tint#1",100},
            [2] = {1,"Tint#2",100},
            [3] = {2,"Tint#3",100},
            [4] = {3,"Tint#4",100},
            [5] = {4,"Tint#5",100},
            [6] = {5,"Tint#6",100},
            [7] = {6,"Tint#7",100},
            [8] = {7,"Tint#8",100},
            [9] = {8,"Tint#9",100},
            [10] = {9,"Tint#10",100},
            [11] = {10,"Tint#11",100},
            [12] = {11,"Tint#12",100},
            [13] = {12,"Tint#13",100},
            [14] = {13,"Tint#14",100},
            [15] = {14,"Tint#15",100},
            [16] = {15,"Tint#16",100},
        },
        [`wagonCircus01x`] = {
            [1] = {0,"Tint#1",100},
        },
        [`wagonCircus02x`] = {
            [1] = {0,"Tint#1",100},
        },
         [`wagondoc01x`] = {
            [1] = {0,"Tint#1",100},
        },
         [`CART02`] = {
            [1] = {0,"Tint#1",100},
            [2] = {1,"Tint#2",100},
            [3] = {2,"Tint#3",100},
            [4] = {3,"Tint#4",100},
            [5] = {4,"Tint#5",100},
            [6] = {5,"Tint#6",100},
            [7] = {6,"Tint#7",100},
            [8] = {7,"Tint#8",100},
            [9] = {8,"Tint#9",100},
            [10] = {9,"Tint#10",100},
            [11] = {10,"Tint#11",100},
            [12] = {11,"Tint#12",100},
            [13] = {12,"Tint#13",100},
            [14] = {13,"Tint#14",100},
            [15] = {14,"Tint#15",100},
            [16] = {15,"Tint#16",100},
            [17] = {16,"Tint#17",100},
            [18] = {17,"Tint#18",100},
            [19] = {18,"Tint#19",100},
            [20] = {19,"Tint#20",100},
            [21] = {20,"Tint#21",100},
            [22] = {21,"Tint#22",100},
            [23] = {22,"Tint#23",100},
            [24] = {23,"Tint#24",100},
        },
         [`buggy01`] = {
            [1] = {0,"Tint#1",100},
            [2] = {1,"Tint#2",100},
            [3] = {2,"Tint#3",100},
            [4] = {3,"Tint#4",100},
            [5] = {4,"Tint#5",100},
            [6] = {5,"Tint#6",100},
            [7] = {6,"Tint#7",100},
            [8] = {7,"Tint#8",100},
            [9] = {8,"Tint#9",100},
            [10] = {9,"Tint#10",100},
            [11] = {10,"Tint#11",100},
            [12] = {11,"Tint#12",100},
            [13] = {12,"Tint#13",100},
            [14] = {13,"Tint#14",100},
        },
         [`buggy02`] = {
            [1] = {0,"Tint#1",100},
            [2] = {1,"Tint#2",100},
            [3] = {2,"Tint#3",100},
            [4] = {3,"Tint#4",100},
            [5] = {4,"Tint#5",100},
            [6] = {5,"Tint#6",100},
            [7] = {6,"Tint#7",100},
            [8] = {7,"Tint#8",100},
            [9] = {8,"Tint#9",100},
            [10] = {9,"Tint#10",100},
            [11] = {10,"Tint#11",100},
            [12] = {11,"Tint#12",100},
            [13] = {12,"Tint#13",100},
            [14] = {13,"Tint#14",100},
            [15] = {14,"Tint#15",100},
            [16] = {15,"Tint#16",100},
        },
         [`buggy03`] = {
            [1] = {0,"Tint#1",100},
            [2] = {1,"Tint#2",100},
            [3] = {2,"Tint#3",100},
            [4] = {3,"Tint#4",100},
            [5] = {4,"Tint#5",100},
            [6] = {5,"Tint#6",100},
            [7] = {6,"Tint#7",100},
            [8] = {7,"Tint#8",100},
            [9] = {8,"Tint#9",100},
            [10] = {9,"Tint#10",100},
            [11] = {10,"Tint#11",100},
            [12] = {11,"Tint#12",100},
            [13] = {12,"Tint#13",100},
            [14] = {13,"Tint#14",100},
            [15] = {14,"Tint#15",100},
            [16] = {15,"Tint#16",100},
        },
         [`cart03`] = {
            [1] = {0,"Tint#1",100},
            [2] = {1,"Tint#2",100},
            [3] = {2,"Tint#3",100},
            [4] = {3,"Tint#4",100},
            [5] = {4,"Tint#5",100},
            [6] = {5,"Tint#6",100},
            [7] = {6,"Tint#7",100},
            [8] = {7,"Tint#8",100},
            [9] = {8,"Tint#9",100},
            [10] = {9,"Tint#10",100},
            [11] = {10,"Tint#11",100},
            [12] = {11,"Tint#12",100},
            [13] = {12,"Tint#13",100},
            [14] = {13,"Tint#14",100},
            [15] = {14,"Tint#15",100},
            [16] = {15,"Tint#16",100},
            [17] = {16,"Tint#17",100},
            [18] = {17,"Tint#18",100},
            [19] = {18,"Tint#19",100},
            [20] = {19,"Tint#20",100},
            [21] = {20,"Tint#21",100},
            [22] = {21,"Tint#22",100},
            [23] = {22,"Tint#23",100},
            [24] = {23,"Tint#24",100},
            [25] = {24,"Tint#25",100},
        },
         [`cart04`] = {
            [1] = {0,"Tint#1",100},
            [2] = {1,"Tint#2",100},
            [3] = {2,"Tint#3",100},
            [4] = {3,"Tint#4",100},
            [5] = {4,"Tint#5",100},
            [6] = {5,"Tint#6",100},
            [7] = {6,"Tint#7",100},
            [8] = {7,"Tint#8",100},
            [9] = {8,"Tint#9",100},
            [10] = {9,"Tint#10",100},
            [11] = {10,"Tint#11",100},
            [12] = {11,"Tint#12",100},
            [13] = {12,"Tint#13",100},
            [14] = {13,"Tint#14",100},
            [15] = {14,"Tint#15",100},
            [16] = {15,"Tint#16",100},
            [17] = {16,"Tint#17",100},
            [18] = {17,"Tint#18",100},
            [19] = {18,"Tint#19",100},
        },
         [`cart06`] = {
            [1] = {0,"Tint#1",100},
            [2] = {1,"Tint#2",100},
            [3] = {2,"Tint#3",100},
            [4] = {3,"Tint#4",100},
            [5] = {4,"Tint#5",100},
            [6] = {5,"Tint#6",100},
            [7] = {6,"Tint#7",100},
            [8] = {7,"Tint#8",100},
            [9] = {8,"Tint#9",100},
            [10] = {9,"Tint#10",100},
            [11] = {10,"Tint#11",100},
            [12] = {11,"Tint#12",100},
            [13] = {12,"Tint#13",100},
            [14] = {13,"Tint#14",100},
            [15] = {14,"Tint#15",100},
            [16] = {15,"Tint#16",100},
            [17] = {16,"Tint#17",100},
            [18] = {17,"Tint#18",100},
            [19] = {18,"Tint#19",100},
            [20] = {19,"Tint#20",100},
            [21] = {20,"Tint#21",100},
            [22] = {21,"Tint#22",100},
            [23] = {22,"Tint#23",100},
            [24] = {23,"Tint#24",100},
            [25] = {24,"Tint#25",100},
        },
         [`coach3`] = {
            [1] =   {0,"Tint#1",100},
            [2] =   {1,"Tint#2",100},
            [3] =   {2,"Tint#3",100},
            [4] =   {3,"Tint#4",100},
            [5] =   {4,"Tint#5",100},
            [6] =   {5,"Tint#6",100},
            [7] =   {6,"Tint#7",100},
            [8] =   {7,"Tint#8",100},
            [9] =   {8,"Tint#9",100},
            [10] =  {9,"Tint#10",100},
            [11] = {10,"Tint#11",100},
            [12] = {11,"Tint#12",100},
            [13] = {12,"Tint#13",100},
            [14] = {13,"Tint#14",100},
            [15] = {14,"Tint#15",100},
            [16] = {15,"Tint#16",100},
            [17] = {16,"Tint#17",100},
            [18] = {17,"Tint#18",100},
            [19] = {18,"Tint#19",100},
            [20] = {19,"Tint#20",100},
        },
         [`coach3_cutscene`] = {
            [1] =  {0,"Tint#1",100},
            [2] =  {1,"Tint#2",100},
            [3] =  {2,"Tint#3",100},
            [4] =  {3,"Tint#4",100},
            [5] =  {4,"Tint#5",100},
            [6] =  {5,"Tint#6",100},
            [7] =  {6,"Tint#7",100},
            [8] =  {7,"Tint#8",100},
            [9] =  {8,"Tint#9",100},
            [10] = {9,"Tint#10",100},
        },
         [`coach4`] = {
            [1] =   {0,"Tint#1",100},
            [2] =   {1,"Tint#2",100},
            [3] =   {2,"Tint#3",100},
            [4] =   {3,"Tint#4",100},
            [5] =   {4,"Tint#5",100},
            [6] =   {5,"Tint#6",100},
            [7] =   {6,"Tint#7",100},
            [8] =   {7,"Tint#8",100},
            [9] =   {8,"Tint#9",100},
            [10] =  {9,"Tint#10",100},
            [11] = {10,"Tint#11",100},
            [12] = {11,"Tint#12",100},
            [13] = {12,"Tint#13",100},
            [14] = {13,"Tint#14",100},
            [15] = {14,"Tint#15",100},
            [16] = {15,"Tint#16",100},
            [17] = {16,"Tint#17",100},
            [18] = {17,"Tint#18",100},
            [19] = {18,"Tint#19",100},
            [20] = {19,"Tint#20",100},
        },
         [`coach5`] = {
            [1] =   {0,"Tint#1",100},
            [2] =   {1,"Tint#2",100},
            [3] =   {2,"Tint#3",100},
            [4] =   {3,"Tint#4",100},
            [5] =   {4,"Tint#5",100},
            [6] =   {5,"Tint#6",100},
            [7] =   {6,"Tint#7",100},
            [8] =   {7,"Tint#8",100},
            [9] =   {8,"Tint#9",100},
            [10] =  {9,"Tint#10",100},
            [11] = {10,"Tint#11",100},
            [12] = {11,"Tint#12",100},
            [13] = {12,"Tint#13",100},
            [14] = {13,"Tint#14",100},
            [15] = {14,"Tint#15",100},
            [16] = {15,"Tint#16",100},
            [17] = {16,"Tint#17",100},
            [18] = {17,"Tint#18",100},
            [19] = {18,"Tint#19",100},
            [20] = {19,"Tint#20",100},
        },
         [`coach6`] = {
            [1] =   {0,"Tint#1",100},
            [2] =   {1,"Tint#2",100},
            [3] =   {2,"Tint#3",100},
            [4] =   {3,"Tint#4",100},
            [5] =   {4,"Tint#5",100},
            [6] =   {5,"Tint#6",100},
            [7] =   {6,"Tint#7",100},
            [8] =   {7,"Tint#8",100},
            [9] =   {8,"Tint#9",100},
            [10] =  {9,"Tint#10",100},
            [11] = {10,"Tint#11",100},
            [12] = {11,"Tint#12",100},
            [13] = {12,"Tint#13",100},
            [14] = {13,"Tint#14",100},
            [15] = {14,"Tint#15",100},
            [16] = {15,"Tint#16",100},
            [17] = {16,"Tint#17",100},
            [18] = {17,"Tint#18",100},
            [19] = {18,"Tint#19",100},
            [20] = {19,"Tint#20",100},
        },
         [`coal_wagon`] = {
            [1] =  {0,"Tint#1",100},
            [2] =  {1,"Tint#2",100},
            [3] =  {2,"Tint#3",100},
            [4] =  {3,"Tint#4",100},
            [5] =  {4,"Tint#5",100},
            [6] =  {5,"Tint#6",100},
            [7] =  {6,"Tint#7",100},
            [8] =  {7,"Tint#8",100},
            [9] =  {8,"Tint#9",100},
            [10] = {9,"Tint#10",100},
            [11] = {10,"Tint#11",100},
            [12] = {11,"Tint#12",100},
            [13] = {12,"Tint#13",100},
            [14] = {13,"Tint#14",100},
            [15] = {14,"Tint#15",100},
            [16] = {15,"Tint#16",100},
            [17] = {16,"Tint#17",100},
            [18] = {17,"Tint#18",100},
            [19] = {18,"Tint#19",100},
            [20] = {19,"Tint#20",100},
            [21] = {20,"Tint#21",100},
            [22] = {21,"Tint#22",100},
            [23] = {22,"Tint#23",100},
            [24] = {23,"Tint#24",100},
        },
         [`huntercart01`] = {
            [1] = {0,"Tint#1",100},
            [2] = {1,"Tint#2",100},
            [3] = {2,"Tint#3",100},
            [4] = {3,"Tint#4",100},
            [5] = {4,"Tint#5",100},
            [6] = {5,"Tint#6",100},
        },
         [`logwagon`] = {
            [1] = {0,"Tint#1",100},
            [2] = {1,"Tint#2",100},
            [3] = {2,"Tint#3",100},
            [4] = {3,"Tint#4",100},
            [5] = {4,"Tint#5",100},
        },
         [`logwagon2`] = {
            [1] = {0,"Tint#1",100},
            [2] = {1,"Tint#2",100},
            [3] = {2,"Tint#3",100},
            [4] = {3,"Tint#4",100},
            [5] = {4,"Tint#5",100},
        },
         [`oilWagon01x`] = {
            [1] =   {0,"Tint#1",100},
            [2] =   {1,"Tint#2",100},
            [3] =   {2,"Tint#3",100},
            [4] =   {3,"Tint#4",100},
            [5] =   {4,"Tint#5",100},
            [6] =   {5,"Tint#6",100},
            [7] =   {6,"Tint#7",100},
            [8] =   {7,"Tint#8",100},
            [9] =   {8,"Tint#9",100},
            [10] =  {9,"Tint#10",100},
            [11] = {10,"Tint#11",100},
            [12] = {11,"Tint#12",100},
            [13] = {12,"Tint#13",100},
            [14] = {13,"Tint#14",100},
        },
         [`oilWagon02x`] = {
            [1] =   {0,"Tint#1",100},
            [2] =   {1,"Tint#2",100},
            [3] =   {2,"Tint#3",100},
            [4] =   {3,"Tint#4",100},
            [5] =   {4,"Tint#5",100},
            [6] =   {5,"Tint#6",100},
            [7] =   {6,"Tint#7",100},
            [8] =   {7,"Tint#8",100},
            [9] =   {8,"Tint#9",100},
            [10] =  {9,"Tint#10",100},
            [11] = {10,"Tint#11",100},
            [12] = {11,"Tint#12",100},
        },
         [`policeWagongatling01x`] = {
            [1] = {0,"Tint#1",100},
            [2] = {1,"Tint#2",100},
            [3] = {2,"Tint#3",100},
        },
         [`stagecoach003x`] = {
            [1] = {0,"Tint#1",100},
            [2] = {1,"Tint#2",100},
            [3] = {2,"Tint#3",100},
            [4] = {3,"Tint#4",100},
        },
         [`stagecoach004x`] = {
            [1] = {0,"Tint#1",100},
            [2] = {1,"Tint#2",100},
            [3] = {2,"Tint#3",100},
        },
         [`stagecoach006x`] = {
            [1] = {0,"Tint#1",100},
            [2] = {1,"Tint#2",100},
            [3] = {2,"Tint#3",100},
            [4] = {3,"Tint#4",100},
            [5] = {4,"Tint#5",100},
            [6] = {5,"Tint#6",100},
            [7] = {6,"Tint#7",100},
        },
         [`supplywagon2`] = {
            [1] = {0,"Tint#1",100},
            [2] = {1,"Tint#2",100},
            [3] = {2,"Tint#3",100},
            [4] = {3,"Tint#4",100},
            [5] = {4,"Tint#5",100},
            [6] = {5,"Tint#6",100},
            [7] = {6,"Tint#7",100},
            [8] = {7,"Tint#8",100},
            [9] = {8,"Tint#9",100},
            [10] = {9,"Tint#10",100},
            [11] = {10,"Tint#11",100},
            [12] = {11,"Tint#12",100},
            [13] = {12,"Tint#13",100},
            [14] = {13,"Tint#14",100},
            [15] = {14,"Tint#15",100},
            [16] = {15,"Tint#16",100},
        },
         [`wagon03x`] = {
            [1] =  {0,"Tint#1",100},
            [2] =  {1,"Tint#2",100},
            [3] =  {2,"Tint#3",100},
            [4] =  {3,"Tint#4",100},
            [5] =  {4,"Tint#5",100},
            [6] =  {5,"Tint#6",100},
            [7] =  {6,"Tint#7",100},
            [8] =  {7,"Tint#8",100},
            [9] =  {8,"Tint#9",100},
            [10] = {9,"Tint#10",100},
            [11] = {10,"Tint#11",100},
            [12] = {11,"Tint#12",100},
            [13] = {12,"Tint#13",100},
            [14] = {13,"Tint#14",100},
            [15] = {14,"Tint#15",100},
        },
         [`wagon05x`] = {
            [1] =  {0,"Tint#1",100},
            [2] =  {1,"Tint#2",100},
            [3] =  {2,"Tint#3",100},
            [4] =  {3,"Tint#4",100},
            [5] =  {4,"Tint#5",100},
            [6] =  {5,"Tint#6",100},
            [7] =  {6,"Tint#7",100},
            [8] =  {7,"Tint#8",100},
            [9] =  {8,"Tint#9",100},
            [10] = {9,"Tint#10",100},
            [11] = {10,"Tint#11",100},
            [12] = {11,"Tint#12",100},
            [13] = {12,"Tint#13",100},
            [14] = {13,"Tint#14",100},
            [15] = {14,"Tint#15",100},
            [16] = {15,"Tint#16",100},
            [17] = {16,"Tint#17",100},
            [18] = {17,"Tint#18",100},
            [19] = {18,"Tint#19",100},
            [20] = {19,"Tint#20",100},
        },
         [`wagonarmoured01x`] = {
            [1] =  {0,"Tint#1",100},
            [2] =  {1,"Tint#2",100},
            [3] =  {2,"Tint#3",100},
            [4] =  {3,"Tint#4",100},
            [5] =  {4,"Tint#5",100},
            [6] =  {5,"Tint#6",100},
            [7] =  {6,"Tint#7",100},
            [8] =  {7,"Tint#8",100},
            [9] =  {8,"Tint#9",100},
            [10] = {9,"Tint#10",100},
            [11] = {10,"Tint#11",100},
            [12] = {11,"Tint#12",100},
            [13] = {12,"Tint#13",100},
            [14] = {13,"Tint#14",100},
            [15] = {14,"Tint#15",100},
            [16] = {15,"Tint#16",100},
            [17] = {16,"Tint#17",100},
            [18] = {17,"Tint#18",100},
            [19] = {18,"Tint#19",100},
            [20] = {19,"Tint#20",100},
            [21] = {20,"Tint#21",100},
            [22] = {21,"Tint#22",100},
            [23] = {22,"Tint#23",100},
            [24] = {23,"Tint#24",100},
            [25] = {24,"Tint#25",100},
            [26] = {25,"Tint#26",100},
            [27] = {26,"Tint#27",100},
            [28] = {27,"Tint#28",100},
            [29] = {28,"Tint#29",100},
            [30] = {29,"Tint#30",100},
            [31] = {30,"Tint#31",100},
        },
         [`wagondairy01x`] = {
            [1] = {0,"Tint#1",100},
            [2] = {1,"Tint#2",100},
        },
        [`wagonPrison01x`] = {
            [1] = {0,"Tint#1",100},
            [2] = {1,"Tint#2",100},
            [3] = {2,"Tint#3",100},
            [4] = {3,"Tint#4",100},
            [5] = {4,"Tint#5",100},
            [6] = {5,"Tint#6",100},
            [7] = {6,"Tint#7",100},
        },
        [`wagontraveller01x`] = {
            [1] = {0,"Tint#1",100},
        },
        [`wagonwork01x`] = {
            [1] = {0,"Tint#1",100},
            [2] = {1,"Tint#2",100},
        },
        [`warwagon2`] = {
            [1] = {0,"Tint#1",100},
            [2] = {1,"Tint#2",100},
            [3] = {2,"Tint#3",100},
            [4] = {3,"Tint#4",100},
            [5] = {4,"Tint#5",100},
            [6] = {5,"Tint#6",100},
        },
        [`POLICEWAGON01X`] = {
            [1] = {0,"Tint#1",100},
            [2] = {1,"Tint#2",100},
            [3] = {2,"Tint#3",100},
        }, 
        [`gatchuck_2`] = {
            [1] =   {0,"Tint#1",100},
            [2] =   {1,"Tint#2",100},
            [3] =   {2,"Tint#3",100},
            [4] =   {3,"Tint#4",100},
            [5] =   {4,"Tint#5",100},
            [6] =   {5,"Tint#6",100},
            [7] =   {6,"Tint#7",100},
            [8] =   {7,"Tint#8",100},
            [9] =   {8,"Tint#9",100},
            [10] =  {9,"Tint#10",100},
            [11] = {10,"Tint#11",100},
            [12] = {11,"Tint#12",100},
            [13] = {12,"Tint#13",100},
            [14] = {13,"Tint#14",100},
            [15] = {14,"Tint#15",100},
            [16] = {15,"Tint#16",100},
        }, 
        [`STAGECOACH004_2x`] = {
            [1] = {0,"Tint#1",100},
            [2] = {1,"Tint#2",100},
            [3] = {2,"Tint#3",100},
            [4] = {3,"Tint#4",100},
            [5] = {4,"Tint#5",100},
        }, 
        [`STAGECOACH002X`] = {
            [1] = {0,"Tint#1",100},
            [2] = {1,"Tint#2",100},
            [3] = {2,"Tint#3",100},
            [4] = {3,"Tint#4",100},
        }, 
        [`STAGECOACH001X`] = {
            [1] = {0,"Tint#1",100},
            [2] = {1,"Tint#2",100},
            [3] = {2,"Tint#3",100},
            [4] = {3,"Tint#4",100},
        }, 
        [`COACH2`] = {
            [1] = {0,"Tint#1",100},
            [2] = {1,"Tint#2",100},
            [3] = {2,"Tint#3",100},
            [4] = {3,"Tint#4",100},
            [5] = {4,"Tint#5",100},
        }, 
        [`gatchuck`] = {
            [1] =   {0,"Tint#1",100},
            [2] =   {1,"Tint#2",100},
            [3] =   {2,"Tint#3",100},
            [4] =   {3,"Tint#4",100},
            [5] =   {4,"Tint#5",100},
            [6] =   {5,"Tint#6",100},
            [7] =   {6,"Tint#7",100},
            [8] =   {7,"Tint#8",100},
            [9] =   {8,"Tint#9",100},
            [10] =  {9,"Tint#10",100},
            [11] = {10,"Tint#11",100},
            [12] = {11,"Tint#12",100},
            [13] = {12,"Tint#13",100},
            [14] = {13,"Tint#14",100},
            [15] = {14,"Tint#15",100},
            [16] = {15,"Tint#16",100},
        }, 
        [`armysupplywagon`] = {
            [1] = {0,"Tint#1",100},
        },
    },
}

------------------------------------
	--WAGON MODELS REFERENCED--
------------------------------------
--DONT TOUCH THIS
Config.wagonmodels = {
    `CART01`,
    `CART02`,
    `CART03`,
    `CART04`,
    `CART05`,
    `CART06`,
    `CART07`,
    `CART08`,
    `buggy01`,
    `buggy02`,
    `buggy03`,
    `CHUCKWAGON000X`,
    `CHUCKWAGON002X`,
    `coal_wagon`,
    `gatchuck`,
    `LOGWAGON`,
    `OILWAGON01X`,
    `oilWagon02x`,
    `supplywagon`,
    `utilliwag`,
    `WAGON02X`,
    `WAGON03X`,
    `WAGON04X`,
    `WAGON05X`,
    `WAGON06X`,
    `COACH2`,
    `COACH3`,
    `coach3_cutscene`,
    `COACH4`,
    `COACH5`,
    `COACH6`,
    `STAGECOACH001X`,
    `STAGECOACH002X`,
    `STAGECOACH003X`,
    `STAGECOACH004X`,
    `STAGECOACH004_2x`,
    `STAGECOACH005X`,
    `STAGECOACH006X`,
    `armysupplywagon`,
    `gatchuck_2`,
    `POLICEWAGON01X`,
    `policeWagongatling01x`,
    `bountywagon01x`,
    `huntercart01`,
    `wagonarmoured01x`,
    `warwagon2`,
    `wagonPrison01x`,
    `wagonCircus01x`,
    `wagonCircus02x`,
    `wagondairy01x`,
    `wagonDoc01x`,
    `wagontraveller01x`,
    `wagonWork01x`,
}

--DONT TOUCH THIS
Config.WagonMaximumAttachments = {
    [`CART01`] = 1,
    [`CART02`] = 1,
    [`CART03`] = 1,
    [`CART04`] = 1,
    [`CART05`] = 1,
    [`CART06`] = 1,
    [`CART07`] = 1,
    [`CART08`] = 1,
    [`buggy01`] = 1,
    [`buggy02`] = 1,
    [`buggy03`] = 1,
    [`CHUCKWAGON000X`] = 2,
    [`CHUCKWAGON002X`] = 2,
    [`coal_wagon`] = 1,
    [`gatchuck`] = 1,
    [`LOGWAGON`] = 2,
    [`OILWAGON01X`] = 2,
    [`oilWagon02x`] = 2,
    [`supplywagon`] = 2,
    [`utilliwag`] = 1,
    [`WAGON02X`] = 2,
    [`WAGON03X`] = 2,
    [`WAGON04X`] = 2,
    [`WAGON05X`] = 2,
    [`WAGON06X`] = 1,
    [`COACH2`] = 4,
    [`COACH3`] = 2,
    [`coach3_cutscene`] = 2,
    [`COACH4`] = 1,
    [`COACH5`] = 1,
    [`COACH6`] = 1,
    [`STAGECOACH001X`] = 2,
    [`STAGECOACH002X`] = 2,
    [`STAGECOACH003X`] = 2,
    [`STAGECOACH004X`] = 4,
    [`STAGECOACH004_2x`] = 2,
    [`STAGECOACH005X`] = 2,
    [`STAGECOACH006X`] = 2,
    [`armysupplywagon`] = 2,
    [`gatchuck_2`] = 1,
    [`POLICEWAGON01X`] = 2,
    [`policeWagongatling01x`] = 2,
    [`bountywagon01x`] = 1,
    [`huntercart01`] = 1,
    [`wagonarmoured01x`] = 1,
    [`warwagon2`] = 2,
    [`wagonPrison01x`] = 2,
    [`wagonCircus01x`] = 2,
    [`wagonCircus02x`] = 2,
    [`wagondairy01x`] = 1,
    [`wagonDoc01x`] = 2,
    [`wagontraveller01x`] = 1,
    [`wagonWork01x`] = 1,
} 

 

Config.Animals = { 
    [1]     = {["name"]  = "Armadillo" 				              , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_armadillo"                  						  ,["peltimage"] = "provision_armadillo_skin"                                	  ,["outfit"] = false          ,["model"] = `a_c_armadillo_01`        			,["poorpelt"] = 1760886130  ,["goodpelt"] = 143941906   , ["perfectpelt"] = -662726703       },
    [2]     = {["name"]  = "Badger" 				              , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_badger"                     						  ,["peltimage"] = "provision_badger_pelt"                                   	  ,["outfit"] = false          ,["model"] = `a_c_badger_01`           			,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil  		     },
    [3]     = {["name"]  = "Badger" 				              , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_badger"                     						  ,["peltimage"] = "provision_badger_pelt"                                   	  ,["outfit"] = 1648068942     ,["model"] = `a_c_badger_01`           			,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil  		     },
    [4]     = {["name"]  = "Badger" 				              , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_badger"                     						  ,["peltimage"] = "provision_badger_pelt"                                   	  ,["outfit"] = -1803981367    ,["model"] = `a_c_badger_01`           			,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil  		     },																																						  
	[5]     = {["name"]  = "Grizzly Bear" 				          , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_bear"                       						  ,["peltimage"] = "provision_bear_fur"                                      	  ,["outfit"] = false          ,["model"] = 1386005610   	       				,["poorpelt"] = 957520252   ,["goodpelt"] = 143941906   , ["perfectpelt"] = 1292673537       },
	[6]     = {["name"]  = "Grizzly Bear" 				          , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_bear"                       						  ,["peltimage"] = "provision_bear_fur"                                      	  ,["outfit"] = false          ,["model"] = -1631768462   	   					,["poorpelt"] = 957520252   ,["goodpelt"] = 143941906   , ["perfectpelt"] = 1292673537       },																																								  
	[7]     = {["name"]  = "American Black Bear"                  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_bear"                       						  ,["peltimage"] = "provision_bear_fur"                                      	  ,["outfit"] = false          ,["model"] = 1780825678       					,["poorpelt"] = 1083865179  ,["goodpelt"] = 1490032862  , ["perfectpelt"] = 663376218        },
    [8]     = {["name"]  = "Beaver"             			      , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_beaver"                     						  ,["peltimage"] = "provision_beaver_fur"                                    	  ,["outfit"] = false          ,["model"] = `a_c_beaver_01`          			,["poorpelt"] = -1569450319 ,["goodpelt"] = -2059726619 , ["perfectpelt"] = 854596618        },																																							  
	[9]     = {["name"]  = "Beaver"                               , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_beaver"                             				  ,["peltimage"] = "provision_beaver_fur"                                    	  ,["outfit"] = false          ,["model"] = `a_c_beaver_01`                     ,["poorpelt"] = -1569450319 ,["goodpelt"] = -2059726619 , ["perfectpelt"] = 854596618        },
 	[10]    = {["name"]  = "Beaver"                               , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_beaver"                             				  ,["peltimage"] = "provision_beaver_fur"                                    	  ,["outfit"] = -2046877254    ,["model"] = `a_c_beaver_01`                     ,["poorpelt"] = -1569450319 ,["goodpelt"] = -2059726619 , ["perfectpelt"] = 854596618        },
	[11]    = {["name"]  = "Beaver"                               , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_beaver"                             				  ,["peltimage"] = "provision_beaver_fur"                                    	  ,["outfit"] = -150174729     ,["model"] = `a_c_beaver_01`                     ,["poorpelt"] = -1569450319 ,["goodpelt"] = -2059726619 , ["perfectpelt"] = 854596618        }, 
	[12]    = {["name"]  = "Ram" 	     						  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_ram"                        						  ,["peltimage"] = "provision_ram_hide"                                      	  ,["outfit"] = false          ,["model"] = `a_c_bighornram_01`      			,["poorpelt"] = 1796037447  ,["goodpelt"] = -476045512  , ["perfectpelt"] = 1795984405       },
    [13]    = {["name"]  = "Ram" 	     						  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_ram"                        						  ,["peltimage"] = "provision_ram_hide"                                      	  ,["outfit"] = 1572075467     ,["model"] = `a_c_bighornram_01`      			,["poorpelt"] = 1796037447  ,["goodpelt"] = -476045512  , ["perfectpelt"] = 1795984405       },
    [14]    = {["name"]  = "Ram"  	     						  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_ram"                        						  ,["peltimage"] = "provision_ram_hide"                                      	  ,["outfit"] = 707006636      ,["model"] = `a_c_bighornram_01`      			,["poorpelt"] = 1796037447  ,["goodpelt"] = -476045512  , ["perfectpelt"] = 1795984405       },
    [15]    = {["name"]  = "Ram"  	     						  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_ram"                        						  ,["peltimage"] = "provision_ram_hide"                                      	  ,["outfit"] = -1834180478    ,["model"] = `a_c_bighornram_01`      			,["poorpelt"] = 1796037447  ,["goodpelt"] = -476045512  , ["perfectpelt"] = 1795984405       },
    [16]    = {["name"]  = "Ram"  	     						  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_ram"                        						  ,["peltimage"] = "provision_ram_hide"                                      	  ,["outfit"] = 834383524      ,["model"] = `a_c_bighornram_01`      			,["poorpelt"] = 1796037447  ,["goodpelt"] = -476045512  , ["perfectpelt"] = 1795984405       },
    [17]    = {["name"]  = "Ram"           						  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_ram"                        						  ,["peltimage"] = "provision_ram_hide"                                      	  ,["outfit"] = 2144062151     ,["model"] = `a_c_bighornram_01`      			,["poorpelt"] = 1796037447  ,["goodpelt"] = -476045512  , ["perfectpelt"] = 1795984405       },
    [18]    = {["name"]  = "Ram"           						  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_ram"                        						  ,["peltimage"] = "provision_ram_hide"                                      	  ,["outfit"] = -156048846     ,["model"] = `a_c_bighornram_01`      			,["poorpelt"] = 1796037447  ,["goodpelt"] = -476045512  , ["perfectpelt"] = 1795984405       },
    [19]    = {["name"]  = "Ram"           						  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_ram"                        						  ,["peltimage"] = "provision_ram_hide"                                      	  ,["outfit"] = -1667731605    ,["model"] = `a_c_bighornram_01`      			,["poorpelt"] = 1796037447  ,["goodpelt"] = -476045512  , ["perfectpelt"] = 1795984405       },
    [20]    = {["name"]  = "Ram" 	       						  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_ram"                        						  ,["peltimage"] = "provision_ram_hide"                                      	  ,["outfit"] = -1899670587    ,["model"] = `a_c_bighornram_01`      			,["poorpelt"] = 1796037447  ,["goodpelt"] = -476045512  , ["perfectpelt"] = 1795984405       },
    [21]    = {["name"]  = "Ram" 	       						  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_ram"                        						  ,["peltimage"] = "provision_ram_hide"                                      	  ,["outfit"] = 696231378      ,["model"] = `a_c_bighornram_01`      			,["poorpelt"] = 1796037447  ,["goodpelt"] = -476045512  , ["perfectpelt"] = 1795984405       },
    [22]    = {["name"]  = "Ram" 	       						  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_ram"                        						  ,["peltimage"] = "provision_ram_hide"                                      	  ,["outfit"] = -163914005     ,["model"] = `a_c_bighornram_01`      			,["poorpelt"] = 1796037447  ,["goodpelt"] = -476045512  , ["perfectpelt"] = 1795984405       },
    [23]    = {["name"]  = "Ram"  	       						  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_ram"                        						  ,["peltimage"] = "provision_ram_hide"                                      	  ,["outfit"] = 1389459977     ,["model"] = `a_c_bighornram_01`      			,["poorpelt"] = 1796037447  ,["goodpelt"] = -476045512  , ["perfectpelt"] = 1795984405       },
    [24]    = {["name"]  = "Ram"  	       						  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_ram"                        						  ,["peltimage"] = "provision_ram_hide"                                      	  ,["outfit"] = -886836096     ,["model"] = `a_c_bighornram_01`      			,["poorpelt"] = 1796037447  ,["goodpelt"] = -476045512  , ["perfectpelt"] = 1795984405       },
    [25]    = {["name"]  = "Ram"  	       						  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_ram"                        						  ,["peltimage"] = "provision_ram_hide"                                      	  ,["outfit"] = -376191772     ,["model"] = `a_c_bighornram_01`      			,["poorpelt"] = 1796037447  ,["goodpelt"] = -476045512  , ["perfectpelt"] = 1795984405       },
    [26]    = {["name"]  = "Ram"           						  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_ram"                        						  ,["peltimage"] = "provision_ram_hide"                                      	  ,["outfit"] = -1151440774    ,["model"] = `a_c_bighornram_01`      			,["poorpelt"] = 1796037447  ,["goodpelt"] = -476045512  , ["perfectpelt"] = 1795984405       },
    [27]    = {["name"]  = "Ram"           						  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_ram"                        						  ,["peltimage"] = "provision_ram_hide"                                      	  ,["outfit"] = -682671307     ,["model"] = `a_c_bighornram_01`      			,["poorpelt"] = 1796037447  ,["goodpelt"] = -476045512  , ["perfectpelt"] = 1795984405       },
    [28]    = {["name"]  = "Ram"           						  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_ram"                        						  ,["peltimage"] = "provision_ram_hide"                                      	  ,["outfit"] = -1372086773    ,["model"] = `a_c_bighornram_01`      			,["poorpelt"] = 1796037447  ,["goodpelt"] = -476045512  , ["perfectpelt"] = 1795984405       },
    [29]    = {["name"]  = "Ram"           						  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_ram"                        						  ,["peltimage"] = "provision_ram_hide"                                      	  ,["outfit"] = -2116663991    ,["model"] = `a_c_bighornram_01`      			,["poorpelt"] = 1796037447  ,["goodpelt"] = -476045512  , ["perfectpelt"] = 1795984405       },																																									  																											
    [30]    = {["name"]  = "Whitetail Buck" 					  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_buck"                       						  ,["peltimage"] = "provision_buck_fur"                                      	  ,["outfit"] = false          ,["model"] = `a_c_buck_01`  		   				,["poorpelt"] = 1603936352  ,["goodpelt"] = -868657362  , ["perfectpelt"] = -702790226       },
    [31]    = {["name"]  = "Whitetail Buck" 					  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_buck"                       						  ,["peltimage"] = "provision_buck_fur"                                      	  ,["outfit"] = 667304357      ,["model"] = `a_c_buck_01`  		   				,["poorpelt"] = 1603936352  ,["goodpelt"] = -868657362  , ["perfectpelt"] = -702790226       },
    [32]    = {["name"]  = "Whitetail Buck" 					  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_buck"                       						  ,["peltimage"] = "provision_buck_fur"                                      	  ,["outfit"] = 1503798624     ,["model"] = `a_c_buck_01`  		   				,["poorpelt"] = 1603936352  ,["goodpelt"] = -868657362  , ["perfectpelt"] = -702790226       },
    [33]    = {["name"]  = "Whitetail Buck" 					  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_buck"                       						  ,["peltimage"] = "provision_buck_fur"                                      	  ,["outfit"] = 1997427892     ,["model"] = `a_c_buck_01`  		   				,["poorpelt"] = 1603936352  ,["goodpelt"] = -868657362  , ["perfectpelt"] = -702790226       },
    [34]    = {["name"]  = "Whitetail Buck" 					  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_buck"                       						  ,["peltimage"] = "provision_buck_fur"                                      	  ,["outfit"] = 1553811810     ,["model"] = `a_c_buck_01`  		   				,["poorpelt"] = 1603936352  ,["goodpelt"] = -868657362  , ["perfectpelt"] = -702790226       },
    [35]    = {["name"]  = "Whitetail Buck" 					  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_buck"                       						  ,["peltimage"] = "provision_buck_fur"                                      	  ,["outfit"] = -2137753947    ,["model"] = `a_c_buck_01`  		   				,["poorpelt"] = 1603936352  ,["goodpelt"] = -868657362  , ["perfectpelt"] = -702790226       },																																				  																											
	[36]    = {["name"]  = "Bison"        		                  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_buffalo"                      					  ,["peltimage"] = "provision_buffalo_fur"                                   	  ,["outfit"] = false          ,["model"] = -1258513246  	   					,["poorpelt"] = -1730060063 ,["goodpelt"] = -591117838  , ["perfectpelt"] = -237756948       },
    [37]    = {["name"]  = "Angus Bull"         			      , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_bull_angus"                 						  ,["peltimage"] = "provision_bull_hide"                                     	  ,["outfit"] = false          ,["model"] = 85379810    		   			    ,["poorpelt"] = 9293261     ,["goodpelt"] = -336086818  , ["perfectpelt"] = -53270317        },																																		  																										
	[38]    = {["name"]  = "Californian Condor"                   , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_condor"                     						  ,["peltimage"] = "animal_condor"                                           	  ,["outfit"] = false          ,["model"] = `a_c_californiacondor_01`			,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },																																						  																										
	[39]    = {["name"]  = "Dominique Chicken"                    , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_chicken_dominique"          						  ,["peltimage"] = "animal_chicken_dominique"                                	  ,["outfit"] = false          ,["model"] = `a_c_chicken_01`        			,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
	[40]    = {["name"]  = "Leghorn Chicken"                      , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_chicken_dominique"          						  ,["peltimage"] = "animal_chicken_dominique"                                	  ,["outfit"] = 1165342204     ,["model"] = `a_c_chicken_01`        			,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },																																				  																										
	[41]    = {["name"]  = "Whitetail Deer"         			  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_deer"                       						  ,["peltimage"] = "provision_deer_hide"                                     	  ,["outfit"] = false          ,["model"] = `a_c_deer_01`   		   			,["poorpelt"] = -662178186  ,["goodpelt"] = -1827027577 , ["perfectpelt"] = -1035515486      },
    [42]    = {["name"]  = "Whitetail Deer"         			  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_deer"                       						  ,["peltimage"] = "provision_deer_hide"                                     	  ,["outfit"] = -2125383737    ,["model"] = `a_c_deer_01`   		   			,["poorpelt"] = -662178186  ,["goodpelt"] = -1827027577 , ["perfectpelt"] = -1035515486      },
    [43]    = {["name"]  = "Whitetail Deer"         			  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_deer"                       						  ,["peltimage"] = "provision_deer_hide"                                     	  ,["outfit"] = 1875804851     ,["model"] = `a_c_deer_01`   		   			,["poorpelt"] = -662178186  ,["goodpelt"] = -1827027577 , ["perfectpelt"] = -1035515486      },
    [44]    = {["name"]  = "Whitetail Deer"         			  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_deer"                       						  ,["peltimage"] = "provision_deer_hide"                                     	  ,["outfit"] = -315064955     ,["model"] = `a_c_deer_01`   		   			,["poorpelt"] = -662178186  ,["goodpelt"] = -1827027577 , ["perfectpelt"] = -1035515486      },
    [45]    = {["name"]  = "Whitetail Deer"         			  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_deer"                       						  ,["peltimage"] = "provision_deer_hide"                                     	  ,["outfit"] = -1939155122    ,["model"] = `a_c_deer_01`   		   			,["poorpelt"] = -662178186  ,["goodpelt"] = -1827027577 , ["perfectpelt"] = -1035515486      },
    [46]    = {["name"]  = "Whitetail Deer"         			  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_deer"                       						  ,["peltimage"] = "provision_deer_hide"                                     	  ,["outfit"] = -868965679     ,["model"] = `a_c_deer_01`   		   			,["poorpelt"] = -662178186  ,["goodpelt"] = -1827027577 , ["perfectpelt"] = -1035515486      },																																								  																											
	[47]    = {["name"]  = "Duck"          		                  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_duck_mallard"               						  ,["peltimage"] = "animal_duck_mallard"                                     	  ,["outfit"] = false          ,["model"] = `a_c_duck_01`  		   				,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
	[48]    = {["name"]  = "Duck"          		                  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_duck_mallard"               						  ,["peltimage"] = "animal_duck_mallard"                                     	  ,["outfit"] = -1909918104    ,["model"] = `a_c_duck_01`  		   				,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },																																									  																			
	[49]    = {["name"]  = "Eagle"         		                  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_eagle"                      						  ,["peltimage"] = "animal_eagle"                                            	  ,["outfit"] = false          ,["model"] = `a_c_eagle_01`   		   			,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
	[50]    = {["name"]  = "Eagle"         		                  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_eagle"                      						  ,["peltimage"] = "animal_eagle"                                            	  ,["outfit"] = -539469050     ,["model"] = `a_c_eagle_01`   		   			,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
	[51]    = {["name"]  = "Eagle"         		                  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_eagle"                      						  ,["peltimage"] = "animal_eagle"                                            	  ,["outfit"] = 1682396012     ,["model"] = `a_c_eagle_01`   		   			,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },																																																									  																											
    [52]    = {["name"]  = "Little Egret"         		          , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_egret"                      						  ,["peltimage"] = "animal_egret"                                            	  ,["outfit"] = false          ,["model"] = `a_c_egret_01`    	   				,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
    [53]    = {["name"]  = "Snowy  Egret"         		          , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_egret"                      						  ,["peltimage"] = "animal_egret"                                            	  ,["outfit"] = 1437006206     ,["model"] = `a_c_egret_01`    	   				,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
    [54]    = {["name"]  = "Reddish Egret"         		          , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_egret"                      						  ,["peltimage"] = "animal_egret"                                            	  ,["outfit"] = -770027479     ,["model"] = `a_c_egret_01`    	   				,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
 	[55]    = {["name"]  = "Rocky Mountain Elk"           	   	  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_elk"                        						  ,["peltimage"] = "provision_elk_fur"                                      	  ,["outfit"] = false          ,["model"] = 85379810  							,["poorpelt"] = 2053771712  ,["goodpelt"] = 1181652728  , ["perfectpelt"] = -1332163079      },
    [56]    = {["name"]  = "American Grey Fox" 		              , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_fox_red"                    						  ,["peltimage"] = "provision_fox_fur"                                      	  ,["outfit"] = false          ,["model"] = `a_c_fox_01`   						,["poorpelt"] = 1647012424  ,["goodpelt"] = 238733925   , ["perfectpelt"] = 500722008        },
    [57]    = {["name"]  = "Silver Fox" 		                  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_fox_red"                    						  ,["peltimage"] = "provision_fox_fur"                                   	   	  ,["outfit"] = 413989195      ,["model"] = `a_c_fox_01`    					,["poorpelt"] = 1647012424  ,["goodpelt"] = 238733925   , ["perfectpelt"] = 500722008        },
    [58]    = {["name"]  = "American Red Fox" 		              , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_fox_red"                    						  ,["peltimage"] = "provision_fox_fur"                                      	  ,["outfit"] = 725155934      ,["model"] = `a_c_fox_01`   						,["poorpelt"] = 1647012424  ,["goodpelt"] = 238733925   , ["perfectpelt"] = 500722008        },
    [59]    = {["name"]  = "American Red Fox" 		              , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_fox_red"                    						  ,["peltimage"] = "provision_fox_fur"                                      	  ,["outfit"] = -1383176768    ,["model"] = `a_c_fox_01`   						,["poorpelt"] = 1647012424  ,["goodpelt"] = 238733925   , ["perfectpelt"] = 500722008        },
    [60]    = {["name"]  = "Mangy American Red Fox" 		      , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_fox_red"                    						  ,["peltimage"] = "provision_fox_fur"                                      	  ,["outfit"] = -558577652     ,["model"] = `a_c_fox_01`   						,["poorpelt"] = 1647012424  ,["goodpelt"] = 238733925   , ["perfectpelt"] = 500722008        },
    [61]    = {["name"]  = "American Red Fox" 		              , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_fox_red"                    						  ,["peltimage"] = "provision_fox_fur"                                      	  ,["outfit"] = -374015026     ,["model"] = `a_c_fox_01`   						,["poorpelt"] = 1647012424  ,["goodpelt"] = 238733925   , ["perfectpelt"] = 500722008        },
    [62]    = {["name"]  = "Silver Fox" 		           		  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_fox_red"                    						  ,["peltimage"] = "provision_fox_fur"                                      	  ,["outfit"] = 784342540      ,["model"] = `a_c_fox_01`   						,["poorpelt"] = 1647012424  ,["goodpelt"] = 238733925   , ["perfectpelt"] = 500722008        },
    [63]    = {["name"]  = "Gray Wolf"                       	  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_wolf_gray"                  						  ,["peltimage"] = "provision_wolf_fur"                                     	  ,["outfit"] = false          ,["model"] = `a_c_wolf`  						,["poorpelt"] = 85441452    ,["goodpelt"] = 1145777975  , ["perfectpelt"] = 653400939        },
    [64]    = {["name"]  = "Gray Wolf"                       	  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_wolf_gray"                  						  ,["peltimage"] = "provision_wolf_fur"                                     	  ,["outfit"] = 922027494      ,["model"] = `a_c_wolf`  						,["poorpelt"] = 85441452    ,["goodpelt"] = 1145777975  , ["perfectpelt"] = 653400939        },
    [65]    = {["name"]  = "Gray Wolf"                       	  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_wolf_gray"                  						  ,["peltimage"] = "provision_wolf_fur"                                     	  ,["outfit"] = -352089994     ,["model"] = `a_c_wolf`  						,["poorpelt"] = 85441452    ,["goodpelt"] = 1145777975  , ["perfectpelt"] = 653400939        },
    [66]    = {["name"]  = "Gray Wolf"                       	  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_wolf_gray"                  						  ,["peltimage"] = "provision_wolf_fur"                                     	  ,["outfit"] = -1039768986    ,["model"] = `a_c_wolf`  						,["poorpelt"] = 85441452    ,["goodpelt"] = 1145777975  , ["perfectpelt"] = 653400939        },
    [67]    = {["name"]  = "Gray Wolf"                       	  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_wolf_gray"                  						  ,["peltimage"] = "provision_wolf_fur"                                     	  ,["outfit"] = -1837792443    ,["model"] = `a_c_wolf`  						,["poorpelt"] = 85441452    ,["goodpelt"] = 1145777975  , ["perfectpelt"] = 653400939        },
    [68]    = {["name"]  = "Gray Wolf"                       	  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_wolf_gray"                  						  ,["peltimage"] = "provision_wolf_fur"                                     	  ,["outfit"] = -1990288526    ,["model"] = `a_c_wolf`  						,["poorpelt"] = 85441452    ,["goodpelt"] = 1145777975  , ["perfectpelt"] = 653400939        },
    [69]    = {["name"]  = "Gray Wolf"                       	  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_wolf_gray"                  						  ,["peltimage"] = "provision_wolf_fur"                                     	  ,["outfit"] = 1904899014     ,["model"] = `a_c_wolf`  						,["poorpelt"] = 85441452    ,["goodpelt"] = 1145777975  , ["perfectpelt"] = 653400939        },																																																															 
	[70]    = {["name"]  = "Gray Wolf"                   		  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_wolf_gray"                  						  ,["peltimage"] = "provision_wolf_fur"                                     	  ,["outfit"] = false          ,["model"] = `a_c_wolf_medium`      				,["poorpelt"] = 85441452    ,["goodpelt"] = 1145777975  , ["perfectpelt"] = 653400939        },
	[71]    = {["name"]  = "Gray Wolf"                   		  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_wolf_gray"                  						  ,["peltimage"] = "provision_wolf_fur"                                     	  ,["outfit"] = -108158466     ,["model"] = `a_c_wolf_medium`      				,["poorpelt"] = 85441452    ,["goodpelt"] = 1145777975  , ["perfectpelt"] = 653400939        },
	[72]    = {["name"]  = "Gray Wolf"                   		  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_wolf_gray"                  						  ,["peltimage"] = "provision_wolf_fur"                                     	  ,["outfit"] = 1497369321     ,["model"] = `a_c_wolf_medium`      				,["poorpelt"] = 85441452    ,["goodpelt"] = 1145777975  , ["perfectpelt"] = 653400939        },
	[73]    = {["name"]  = "Gray Wolf"                   		  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_wolf_gray"                  						  ,["peltimage"] = "provision_wolf_fur"                                     	  ,["outfit"] = -352089994     ,["model"] = `a_c_wolf_medium`      				,["poorpelt"] = 85441452    ,["goodpelt"] = 1145777975  , ["perfectpelt"] = 653400939        },
	[74]    = {["name"]  = "Gray Wolf"                   		  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_wolf_gray"                  						  ,["peltimage"] = "provision_wolf_fur"                                     	  ,["outfit"] = 1596049292     ,["model"] = `a_c_wolf_medium`      				,["poorpelt"] = 85441452    ,["goodpelt"] = 1145777975  , ["perfectpelt"] = 653400939        },
	[75]    = {["name"]  = "Gray Wolf"                   		  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_wolf_gray"                  						  ,["peltimage"] = "provision_wolf_fur"                                     	  ,["outfit"] = 1827496739     ,["model"] = `a_c_wolf_medium`      				,["poorpelt"] = 85441452    ,["goodpelt"] = 1145777975  , ["perfectpelt"] = 653400939        },																																															 												
    [76]    = {["name"]  = "Small Gray Wolf"                      , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_wolf_gray"                  						  ,["peltimage"] = "provision_wolf_fur"                                     	  ,["outfit"] = false          ,["model"] = `a_c_wolf_small`       				,["poorpelt"] = 85441452    ,["goodpelt"] = 1145777975  , ["perfectpelt"] = 653400939        },
    [77]    = {["name"]  = "Small Gray Wolf"                      , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_wolf_gray"                  						  ,["peltimage"] = "provision_wolf_fur"                                     	  ,["outfit"] = -588162907     ,["model"] = `a_c_wolf_small`       				,["poorpelt"] = 85441452    ,["goodpelt"] = 1145777975  , ["perfectpelt"] = 653400939        },
    [78]    = {["name"]  = "Small Gray Wolf"                      , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_wolf_gray"                  						  ,["peltimage"] = "provision_wolf_fur"                                     	  ,["outfit"] = -290259928     ,["model"] = `a_c_wolf_small`       				,["poorpelt"] = 85441452    ,["goodpelt"] = 1145777975  , ["perfectpelt"] = 653400939        },																																																										 												
	[79]    = {["name"]  = "Western Vulture"                      , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_vulture_western"            						  ,["peltimage"] = "animal_vulture_western"                                 	  ,["outfit"] = false          ,["model"] = 1104697660   			 			,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
	[80]    = {["name"]  = "Eastern Vulture"                      , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_vulture_eastern"            						  ,["peltimage"] = "animal_vulture_eastern"                                 	  ,["outfit"] = -2141465661    ,["model"] = 1104697660   			 			,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },																																																	 
    [81]    = {["name"]  = "Sea Turtle"                           , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_turtle_sea"                 						  ,["peltimage"] = "animal_turtle_sea"                                      	  ,["outfit"] = false          ,["model"] = `a_c_turtlesea_01`     				,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },																																																	 
	[82]    = {["name"]  = "Snapping Turtle"                      , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_snapping_turtle"            						  ,["peltimage"] = "animal_snapping_turtle"                                 	  ,["outfit"] = false          ,["model"] = `a_c_turtlesnapping_01`				,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },																																																		 
	[83]    = {["name"]  = "Eastern Wild Turkey"                  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_turkey_eastern"             						  ,["peltimage"] = "animal_turkey_eastern"                                  	  ,["outfit"] = false          ,["model"] = `a_c_turkey_01`   	 				,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
    [84]    = {["name"]  = "Eastern Wild Turkey"                  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_turkey_eastern"             						  ,["peltimage"] = "animal_turkey_eastern"                                  	  ,["outfit"] = false          ,["model"] = `a_c_turkey_01`  		 			,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
    [85]    = {["name"]  = "Rio Grande Turkey"                    , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_turkey_riogrande"           						  ,["peltimage"] = "animal_turkey_riogrande"                                	  ,["outfit"] = false          ,["model"] = `a_c_turkeywild_01`    				,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
    [86]    = {["name"]  = "Rio Grande Turkey"                    , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_turkey_riogrande"           						  ,["peltimage"] = "animal_turkey_riogrande"                                	  ,["outfit"] = 1577016527     ,["model"] = `a_c_turkeywild_01`    				,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },																																																																			 
    [87]    = {["name"]  = "Diamondback Rattlesnake"              , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_snakewater"                 						  ,["peltimage"] = "animal_snakewater"                                      	  ,["outfit"] = false          ,["model"] = `a_c_snake_01`   					,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },																																																									        
    [88]    = {["name"]  = "Timber Rattlesnake"                   , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_snakewater"                 						  ,["peltimage"] = "animal_snakewater"                                      	  ,["outfit"] = 1844089285     ,["model"] = `a_c_snake_01`   					,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },																																																									        
    [89]    = {["name"]  = "Diamondback Rattlesnake"              , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_snakewater"                 						  ,["peltimage"] = "animal_snakewater"                                      	  ,["outfit"] = 644441945      ,["model"] = `a_c_snake_01`   					,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },																																																									        																																																																				 
    [90]    = {["name"]  = "Water Snake"                          , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_snakewater"                 						  ,["peltimage"] = "animal_snakewater"                                      	  ,["outfit"] = false          ,["model"] = `a_c_snake_pelt_01`   				,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },																																																									        
    [91]    = {["name"]  = "Water Snake"                          , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_snakewater"                 						  ,["peltimage"] = "animal_snakewater"                                      	  ,["outfit"] = -1711192206    ,["model"] = `a_c_snake_pelt_01`   				,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },																																																									        																																																																				 
	[92]    = {["name"]  = "Black-Tailed Rattlesnake"             , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_snakeblacktailrattle"       						  ,["peltimage"] = "animal_snakeblacktailrattle"                            	  ,["outfit"] = false          ,["model"] = `a_c_snakeblacktailrattle_01`   	,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },																																																									         
    [93]    = {["name"]  = "Southern Copperhead Snake"            , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_snakeferdelance"            						  ,["peltimage"] = "animal_snakeferdelance"                                 	  ,["outfit"] = false   	   ,["model"] = `a_c_snakeferdelance_01`   			,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },																																																									        
    [94]    = {["name"]  = "Northern Copperhead Snake"            , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_snakeferdelance"            						  ,["peltimage"] = "animal_snakeferdelance"                                 	  ,["outfit"] = -1154821073    ,["model"] = `a_c_snakeferdelance_01`   			,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },																																																									        
    [95]    = {["name"]  = "Fer De Lance Snake"                   , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_snakeferdelance"            						  ,["peltimage"] = "animal_snakeferdelance"                                 	  ,["outfit"] = -1688984856    ,["model"] = `a_c_snakeferdelance_01`   			,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },																																																									        
    [96]    = {["name"]  = "Sunglow Boa Snake"                    , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_snakeredboa"       		  						  ,["peltimage"] = "animal_snakeredboa"       						              ,["outfit"] = false    	   ,["model"] = `a_c_snakeredboa_01`   				,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },																																																									        
    [97]    = {["name"]  = "Rainbow Boa Snake"                    , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_snakeredboa"       		  						  ,["peltimage"] = "animal_snakeredboa"       						              ,["outfit"] = -2078090703    ,["model"] = `a_c_snakeredboa_01`   				,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },																																																									        
    [98]    = {["name"]  = "Red-Tailed Boa"                       , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_snakeredboa"       		  						  ,["peltimage"] = "animal_snakeredboa"       						              ,["outfit"] = -60896296      ,["model"] = `a_c_snakeredboa_01`   				,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },																																																									        
    [99]    = {["name"]  = "Cottonmounth Water Snake"             , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_snakewater"        		  						  ,["peltimage"] = "animal_snakewater"        						              ,["outfit"] = false    	   ,["model"] = `a_c_snakewater_01`   				,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },																																																									        
    [100]   = {["name"]  = "Northern Water Snake"                 , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_snakewater"        		  						  ,["peltimage"] = "animal_snakewater"        						              ,["outfit"] = -1122285933    ,["model"] = `a_c_snakewater_01`   				,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },																																																									        
    [101]   = {["name"]  = "Midland Water Snake"                  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_snakewater"        		  						  ,["peltimage"] = "animal_snakewater"        						              ,["outfit"] = 463389154      ,["model"] = `a_c_snakewater_01`   				,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },																																																									        																																																								
   	[102]   = {["name"]  = "Striped Skunk"                        , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_skunk"                      						  ,["peltimage"] = "provision_skunk_fur"                                          ,["outfit"] = false          ,["model"] = `a_c_skunk_01`  					,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
	[103]   = {["name"]  = "Striped Skunk"                        , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_skunk"                      						  ,["peltimage"] = "provision_skunk_fur"                                          ,["outfit"] = -1471195588    ,["model"] = `a_c_skunk_01`  					,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
	[104]   = {["name"]  = "Striped Skunk"                        , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_skunk"                      						  ,["peltimage"] = "provision_skunk_fur"                                          ,["outfit"] = 1451635371     ,["model"] = `a_c_skunk_01`  					,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
	[105]   = {["name"]  = "Striped Skunk"                        , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_skunk"                      						  ,["peltimage"] = "provision_skunk_fur"                                          ,["outfit"] = -256370740     ,["model"] = `a_c_skunk_01`  					,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },																																																													 
	[106]   = {["name"]  = "Merino Sheep"                         , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_sheep"                      						  ,["peltimage"] = "provision_sheep_wool"                                         ,["outfit"] = false          ,["model"] = `a_c_sheep_01`     					,["poorpelt"] = 1729948479  ,["goodpelt"] = -1317365569 , ["perfectpelt"] = 1466150167       },
	[107]   = {["name"]  = "Merino Sheep"                         , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_sheep"                      						  ,["peltimage"] = "provision_sheep_wool"                                         ,["outfit"] = -314862125     ,["model"] = `a_c_sheep_01`     					,["poorpelt"] = 1729948479  ,["goodpelt"] = -1317365569 , ["perfectpelt"] = 1466150167       },
	[108]   = {["name"]  = "Merino Sheep"                         , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_sheep"                      						  ,["peltimage"] = "provision_sheep_wool"                                         ,["outfit"] = -2036030698    ,["model"] = `a_c_sheep_01`     					,["poorpelt"] = 1729948479  ,["goodpelt"] = -1317365569 , ["perfectpelt"] = 1466150167       },																																						 
    [109]   = {["name"]  = "Herring Seagull"                      , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_seagull_ring_billed"        						  ,["peltimage"] = "animal_seagull_ring_billed"                                   ,["outfit"] = false          ,["model"] = `a_c_seagull_01`   					,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
    [110]   = {["name"]  = "Herring Seagull"                      , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_seagull_ring_billed"        						  ,["peltimage"] = "animal_seagull_ring_billed"                                   ,["outfit"] = -595873616     ,["model"] = `a_c_seagull_01`   					,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
    [111]   = {["name"]  = "Herring Seagull"                      , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_seagull_ring_billed"        						  ,["peltimage"] = "animal_seagull_ring_billed"                                   ,["outfit"] = -1313615167    ,["model"] = `a_c_seagull_01`   					,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },																																						 
    [112]   = {["name"]  = "Roseate Spoonbill"                    , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_roseate_spoonbill"          						  ,["peltimage"] = "animal_roseate_spoonbill"                                     ,["outfit"] = false          ,["model"] = `a_c_roseatespoonbill_01`  			,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
    [113]   = {["name"]  = "Java Rooster"               	      , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_rooster_java"               						  ,["peltimage"] = "animal_rooster_java"                           	              ,["outfit"] = false          ,["model"] = `a_c_rooster_01`   					,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
    [114]   = {["name"]  = "White Leghorn Rooster"                , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_rooster_leghorn"            						  ,["peltimage"] = "animal_rooster_leghorn"                                       ,["outfit"] = 1234539032     ,["model"] = `a_c_rooster_01`   					,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
    [115]   = {["name"]  = "Dominique Rooster"                    , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_rooster_dominique"          						  ,["peltimage"] = "animal_rooster_dominique"                                     ,["outfit"] = 1703895940     ,["model"] = `a_c_rooster_01`   					,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
    [116]   = {["name"]  = "Red-Footed Booby"                     , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_red_footed_booby"           						  ,["peltimage"] = "animal_red_footed_booby"                                      ,["outfit"] = false          ,["model"] = `a_c_redfootedbooby_01`   			,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
    [117]   = {["name"]  = "Western Raven"                        , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_raven"                      						  ,["peltimage"] = "animal_raven"                                                 ,["outfit"] = false          ,["model"] = `a_c_raven_01`   					,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
	[118]   = {["name"]  = "North American Raccoon"               , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_raccoon"                    						  ,["peltimage"] = "provision_raccoon_fur"                                        ,["outfit"] = false          ,["model"] = `a_c_raccoon_01`   					,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
	[119]   = {["name"]  = "North American Raccoon"               , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_raccoon"                    						  ,["peltimage"] = "provision_raccoon_fur"                                        ,["outfit"] = -969479795     ,["model"] = `a_c_raccoon_01`   					,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
	[120]   = {["name"]  = "North American Raccoon"               , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_raccoon"                    						  ,["peltimage"] = "provision_raccoon_fur"                                        ,["outfit"] = 158140748      ,["model"] = `a_c_raccoon_01`   					,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
	[121]   = {["name"]  = "North American Raccoon"               , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_raccoon"                    						  ,["peltimage"] = "provision_raccoon_fur"                                        ,["outfit"] = 2099062422     ,["model"] = `a_c_raccoon_01`   					,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
	[122]   = {["name"]  = "North American Raccoon"               , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_raccoon"                    						  ,["peltimage"] = "provision_raccoon_fur"                                        ,["outfit"] = 1939496279     ,["model"] = `a_c_raccoon_01`   					,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
	[123]   = {["name"]  = "North American Raccoon"               , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_raccoon"                    						  ,["peltimage"] = "provision_raccoon_fur"                                        ,["outfit"] = 1164706043     ,["model"] = `a_c_raccoon_01`   					,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
	[124]   = {["name"]  = "North American Raccoon"               , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_raccoon"                    						  ,["peltimage"] = "provision_raccoon_fur"                                        ,["outfit"] = 1257983596     ,["model"] = `a_c_raccoon_01`   					,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
	[125]   = {["name"]  = "Black-Tailed Jackrabbit"              , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_rabbit"                     						  ,["peltimage"] = "provision_rabbit_pelt"                                        ,["outfit"] = false          ,["model"] = `a_c_rabbit_01`   					,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
	[126]   = {["name"]  = "Black-Tailed Jackrabbit"              , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_rabbit"                     						  ,["peltimage"] = "provision_rabbit_pelt"                                        ,["outfit"] = 1383633612     ,["model"] = `a_c_rabbit_01`   					,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
	[127]   = {["name"]  = "Black-Tailed Jackrabbit"              , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_rabbit"                     						  ,["peltimage"] = "provision_rabbit_pelt"                                        ,["outfit"] = 1621798704     ,["model"] = `a_c_rabbit_01`   					,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
	[128]   = {["name"]  = "Black-Tailed Jackrabbit"              , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_rabbit"                     						  ,["peltimage"] = "provision_rabbit_pelt"                                        ,["outfit"] = -1299761151    ,["model"] = `a_c_rabbit_01`   					,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
	[129]   = {["name"]  = "Black-Tailed Jackrabbit"              , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_rabbit"                     						  ,["peltimage"] = "provision_rabbit_pelt"                                        ,["outfit"] = -1153495004    ,["model"] = `a_c_rabbit_01`   					,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
	[130]   = {["name"]  = "American Pronghorn Doe"               , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_pronghorn"                  						  ,["peltimage"] = "provision_pronghorn_fur"                                      ,["outfit"] = false          ,["model"] = `a_c_pronghorn_01`    				,["poorpelt"] = -983605026  ,["goodpelt"] = 554578289   , ["perfectpelt"] = -1544126829      },
 	[131]   = {["name"]  = "American Pronghorn Doe"               , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_pronghorn"                  						  ,["peltimage"] = "provision_pronghorn_fur"                                      ,["outfit"] = 1999086413     ,["model"] = `a_c_pronghorn_01`    				,["poorpelt"] = -983605026  ,["goodpelt"] = 554578289   , ["perfectpelt"] = -1544126829      },
	[132]   = {["name"]  = "Sonoran Pronghorn Doe"                , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_pronghorn"                  						  ,["peltimage"] = "provision_pronghorn_fur"                                      ,["outfit"] = -730833443     ,["model"] = `a_c_pronghorn_01`    				,["poorpelt"] = -983605026  ,["goodpelt"] = 554578289   , ["perfectpelt"] = -1544126829      },
	[133]   = {["name"]  = "American Pronghorn Doe"               , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_pronghorn"                  						  ,["peltimage"] = "provision_pronghorn_fur"                                      ,["outfit"] = 389666332      ,["model"] = `a_c_pronghorn_01`    				,["poorpelt"] = -983605026  ,["goodpelt"] = 554578289   , ["perfectpelt"] = -1544126829      },
	[134]   = {["name"]  = "American Pronghorn Doe"               , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_pronghorn"                  						  ,["peltimage"] = "provision_pronghorn_fur"                                      ,["outfit"] = -87794079      ,["model"] = `a_c_pronghorn_01`    				,["poorpelt"] = -983605026  ,["goodpelt"] = 554578289   , ["perfectpelt"] = -1544126829      },
	[135]   = {["name"]  = "American Pronghorn Doe"               , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_pronghorn"                  						  ,["peltimage"] = "provision_pronghorn_fur"                                      ,["outfit"] = 2042092622     ,["model"] = `a_c_pronghorn_01`    				,["poorpelt"] = -983605026  ,["goodpelt"] = 554578289   , ["perfectpelt"] = -1544126829      },
	[136]   = {["name"]  = "American Pronghorn Doe"               , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_pronghorn"                  						  ,["peltimage"] = "provision_pronghorn_fur"                                      ,["outfit"] = -2108783749    ,["model"] = `a_c_pronghorn_01`    				,["poorpelt"] = -983605026  ,["goodpelt"] = 554578289   , ["perfectpelt"] = -1544126829      },
	[137]   = {["name"]  = "American Pronghorn Doe"               , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_pronghorn"                  						  ,["peltimage"] = "provision_pronghorn_fur"                                      ,["outfit"] = 1900330120     ,["model"] = `a_c_pronghorn_01`    				,["poorpelt"] = -983605026  ,["goodpelt"] = 554578289   , ["perfectpelt"] = -1544126829      },
	[138]   = {["name"]  = "American Pronghorn Doe"               , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_pronghorn"                  						  ,["peltimage"] = "provision_pronghorn_fur"                                      ,["outfit"] = 2109101419     ,["model"] = `a_c_pronghorn_01`    				,["poorpelt"] = -983605026  ,["goodpelt"] = 554578289   , ["perfectpelt"] = -1544126829      },
	[139]   = {["name"]  = "American Pronghorn Doe"               , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_pronghorn"                  						  ,["peltimage"] = "provision_pronghorn_fur"                                      ,["outfit"] = 432909265      ,["model"] = `a_c_pronghorn_01`    				,["poorpelt"] = -983605026  ,["goodpelt"] = 554578289   , ["perfectpelt"] = -1544126829      },
	[140]   = {["name"]  = "American Pronghorn Doe"               , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_pronghorn"                  						  ,["peltimage"] = "provision_pronghorn_fur"                                      ,["outfit"] = 1950818712     ,["model"] = `a_c_pronghorn_01`    				,["poorpelt"] = -983605026  ,["goodpelt"] = 554578289   , ["perfectpelt"] = -1544126829      },
	[141]   = {["name"]  = "American Pronghorn Doe"               , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_pronghorn"                  						  ,["peltimage"] = "provision_pronghorn_fur"                                      ,["outfit"] = 697666614      ,["model"] = `a_c_pronghorn_01`    				,["poorpelt"] = -983605026  ,["goodpelt"] = 554578289   , ["perfectpelt"] = -1544126829      },
	[142]   = {["name"]  = "American Pronghorn Doe"               , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_pronghorn"                  						  ,["peltimage"] = "provision_pronghorn_fur"                                      ,["outfit"] = 1126570175     ,["model"] = `a_c_pronghorn_01`    				,["poorpelt"] = -983605026  ,["goodpelt"] = 554578289   , ["perfectpelt"] = -1544126829      },
	[143]   = {["name"]  = "American Pronghorn Doe"               , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_pronghorn"                  						  ,["peltimage"] = "provision_pronghorn_fur"                                      ,["outfit"] = -1057615530    ,["model"] = `a_c_pronghorn_01`    				,["poorpelt"] = -983605026  ,["goodpelt"] = 554578289   , ["perfectpelt"] = -1544126829      },
	[144]   = {["name"]  = "American Pronghorn Doe"               , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_pronghorn"                  						  ,["peltimage"] = "provision_pronghorn_fur"                                      ,["outfit"] = -1235944432    ,["model"] = `a_c_pronghorn_01`    				,["poorpelt"] = -983605026  ,["goodpelt"] = 554578289   , ["perfectpelt"] = -1544126829      },
	[145]   = {["name"]  = "American Pronghorn Doe"               , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_pronghorn"                  						  ,["peltimage"] = "provision_pronghorn_fur"                                      ,["outfit"] = 1011154058     ,["model"] = `a_c_pronghorn_01`    				,["poorpelt"] = -983605026  ,["goodpelt"] = 554578289   , ["perfectpelt"] = -1544126829      },
	[146]   = {["name"]  = "American Pronghorn Doe"               , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_pronghorn"                  						  ,["peltimage"] = "provision_pronghorn_fur"                                      ,["outfit"] = -967163299     ,["model"] = `a_c_pronghorn_01`    				,["poorpelt"] = -983605026  ,["goodpelt"] = 554578289   , ["perfectpelt"] = -1544126829      },
	[147]   = {["name"]  = "American Pronghorn Doe"               , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_pronghorn"                  						  ,["peltimage"] = "provision_pronghorn_fur"                                      ,["outfit"] = 2098180041     ,["model"] = `a_c_pronghorn_01`    				,["poorpelt"] = -983605026  ,["goodpelt"] = 554578289   , ["perfectpelt"] = -1544126829      },
	[148]   = {["name"]  = "American Pronghorn Doe"               , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_pronghorn"                  						  ,["peltimage"] = "provision_pronghorn_fur"                                      ,["outfit"] = 1011154058     ,["model"] = `a_c_pronghorn_01`    				,["poorpelt"] = -983605026  ,["goodpelt"] = 554578289   , ["perfectpelt"] = -1544126829      },
	[149]   = {["name"]  = "Greater Prairie Chicken"              , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_prairie_chicken"                                    ,["peltimage"] = "animal_prairie_chicken"                                       ,["outfit"] = false          ,["model"] = `a_c_prairiechicken_01`         	,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
	[150]   = {["name"]  = "Virginia Opossum"                     , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_opossum"                                            ,["peltimage"] = "animal_opossum"                                               ,["outfit"] = false          ,["model"] = `a_c_possum_01`        				,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
	[151]   = {["name"]  = "Virginia Opossum"                     , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_opossum"                                            ,["peltimage"] = "animal_opossum"                                               ,["outfit"] = -1655190100    ,["model"] = `a_c_possum_01`        				,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
	[152]   = {["name"]  = "Virginia Opossum"                     , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_opossum"                                            ,["peltimage"] = "animal_opossum"                                               ,["outfit"] = 2124910668     ,["model"] = `a_c_possum_01`        				,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },																							 
	[153]   = {["name"]  = "Berkshire Pig"                        , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_pig_berkshire"                                      ,["peltimage"] = "provision_pig_skin"                                           ,["outfit"] = false          ,["model"] = `a_c_pig_01`         				,["poorpelt"] = -308965548  ,["goodpelt"] = -57190831   , ["perfectpelt"] = -1102272634      },
	[154]   = {["name"]  = "Old Spot Pig"                         , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_pig_bigchina"                                       ,["peltimage"] = "provision_pig_skin"                                           ,["outfit"] = -1388818080    ,["model"] = `a_c_pig_01`         				,["poorpelt"] = -308965548  ,["goodpelt"] = -57190831   , ["perfectpelt"] = -1102272634      },
    [155]   = {["name"]  = "Wild Boar"                        	  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_boar"                                               ,["peltimage"] = "provision_boar_skin"                                          ,["outfit"] = false          ,["model"] = -1038420333         				,["poorpelt"] = 1248540072  ,["goodpelt"] = 2116849039  , ["perfectpelt"] = -1858513856      },
    [156]   = {["name"]  = "Collared Peccary Pig"                 , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_javelina"                                           ,["peltimage"] = "provision_javelina_skin"                                      ,["outfit"] = false          ,["model"] = `a_c_javelina_01`         			,["poorpelt"] = -99092070  , ["goodpelt"] = -1379330323 , ["perfectpelt"] =  1963510418      },
	[157]   = {["name"]  = "Ring-Necked Pheasant"                 , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_pheasant_ringneck"                                  ,["peltimage"] = "animal_pheasant_ringneck"                                     ,["outfit"] = false          ,["model"] = `a_c_pheasant_01`         			,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
	[158]   = {["name"]  = "Ring-Necked Pheasant"                 , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_pheasant_ringneck"                                  ,["peltimage"] = "animal_pheasant_ringneck"                                     ,["outfit"] = -535101650     ,["model"] = `a_c_pheasant_01`         			,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
    [159]   = {["name"]  = "American White Pelican"               , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_pelican_white"                                      ,["peltimage"] = "animal_pelican_white"                                         ,["outfit"] = false          ,["model"] = `a_c_pelican_01`         			,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
    [160]   = {["name"]  = "American White Pelican"               , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_pelican_white"                                      ,["peltimage"] = "animal_pelican_white"                                         ,["outfit"] = 1994046600     ,["model"] = `a_c_pelican_01`         			,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
    [161]   = {["name"]  = "American White Pelican"               , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_pelican_white"                                      ,["peltimage"] = "animal_pelican_white"                                         ,["outfit"] = -20928664      ,["model"] = `a_c_pelican_01`         			,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
    [162]   = {["name"]  = "Great Green Macaw"            	      , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_parrot_greatgreen"                                  ,["peltimage"] = "animal_parrot_greatgreen"                                     ,["outfit"] = false          ,["model"] = `a_c_parrot_01`        				,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
    [163]   = {["name"]  = "Scarlet Macaw"             		      , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_parrot_scarlet"                                     ,["peltimage"] = "animal_parrot_scarlet"                                        ,["outfit"] = -1566130370    ,["model"] = `a_c_parrot_01`        				,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
    [164]   = {["name"]  = "Blue And Yellow Macaw"                , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_parrot_blueyellow"                                  ,["peltimage"] = "animal_parrot_blueyellow"                                     ,["outfit"] = -1148662080    ,["model"] = `a_c_parrot_01`        				,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
	[165]   = {["name"]  = "Panther"                              , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_panther_florida"                                    ,["peltimage"] = "provision_panther_fur"                                        ,["outfit"] = false          ,["model"] = `a_c_panther_01`         			,["poorpelt"] = 1584468323  ,["goodpelt"] = -395646254  , ["perfectpelt"] = 1969175294       },
	[166]   = {["name"]  = "Panther"                              , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_panther_florida"                                    ,["peltimage"] = "provision_panther_fur"                                        ,["outfit"] = -219463491     ,["model"] = `a_c_panther_01`         			,["poorpelt"] = 1584468323  ,["goodpelt"] = -395646254  , ["perfectpelt"] = 1969175294       },
	[167]   = {["name"]  = "Florida Panther"                      , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_panther_florida"                                    ,["peltimage"] = "provision_panther_fur"                                        ,["outfit"] = 95938134       ,["model"] = `a_c_panther_01`         			,["poorpelt"] = 1584468323  ,["goodpelt"] = -395646254  , ["perfectpelt"] = 1969175294       },
	[168]   = {["name"]  = "Panther"                              , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_panther_florida"                                    ,["peltimage"] = "provision_panther_fur"                                        ,["outfit"] = 1058681367     ,["model"] = `a_c_panther_01`         			,["poorpelt"] = 1584468323  ,["goodpelt"] = -395646254  , ["perfectpelt"] = 1969175294       },
    [169]   = {["name"]  = "Double-Crested Cormorant"             , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_cormorant"                                          ,["peltimage"] = "animal_cormorant"                                             ,["outfit"] = false          ,["model"] = `a_c_cormorant_01`        			,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
    [170]   = {["name"]  = "Cougar"                               , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_cougar"                                             ,["peltimage"] = "provision_cougar_fur"                                         ,["outfit"] = false          ,["model"] = `a_c_cougar_01`           			,["poorpelt"] = 1914602340  ,["goodpelt"] = 459744337   , ["perfectpelt"] = -1791452194      },
    [171]   = {["name"]  = "Cougar"                               , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_cougar"                                             ,["peltimage"] = "provision_cougar_fur"                                         ,["outfit"] = 263759244      ,["model"] = `a_c_cougar_01`           			,["poorpelt"] = 1914602340  ,["goodpelt"] = 459744337   , ["perfectpelt"] = -1791452194      },
    [172]   = {["name"]  = "Cougar"                               , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_cougar"                                             ,["peltimage"] = "provision_cougar_fur"                                         ,["outfit"] = 1095382564     ,["model"] = `a_c_cougar_01`           			,["poorpelt"] = 1914602340  ,["goodpelt"] = 459744337   , ["perfectpelt"] = -1791452194      },
    [173]   = {["name"]  = "Cougar"                               , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_cougar"                                             ,["peltimage"] = "provision_cougar_fur"                                         ,["outfit"] = -287190129     ,["model"] = `a_c_cougar_01`           			,["poorpelt"] = 1914602340  ,["goodpelt"] = 459744337   , ["perfectpelt"] = -1791452194      },
    [174]   = {["name"]  = "Cougar"                               , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_cougar"                                             ,["peltimage"] = "provision_cougar_fur"                                         ,["outfit"] = -48533502      ,["model"] = `a_c_cougar_01`           			,["poorpelt"] = 1914602340  ,["goodpelt"] = 459744337   , ["perfectpelt"] = -1791452194      },
    [175]   = {["name"]  = "Cougar"                               , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_cougar"                                             ,["peltimage"] = "provision_cougar_fur"                                         ,["outfit"] = -841151793     ,["model"] = `a_c_cougar_01`           			,["poorpelt"] = 1914602340  ,["goodpelt"] = 459744337   , ["perfectpelt"] = -1791452194      },
    [176]   = {["name"]  = "Florida Cracker Cow"                  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_cow"                                                ,["peltimage"] = "provision_cow_hide"                                           ,["outfit"] = false          ,["model"] = 963025744          				    ,["poorpelt"] = 334093551   ,["goodpelt"] = 1150594075  , ["perfectpelt"] = -845037222       },
    [177]   = {["name"]  = "Cow "               				  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_cow"                                                ,["peltimage"] = "provision_cow_hide"                                           ,["outfit"] = -1763600211    ,["model"] = 963025744          					,["poorpelt"] = 334093551   ,["goodpelt"] = 1150594075  , ["perfectpelt"] = -845037222       },
    [178]   = {["name"]  = "Coyote"                               , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_coyote"                                             ,["peltimage"] = "provision_coyote_fur"                                         ,["outfit"] = false          ,["model"] = `a_c_coyote_01`          			,["poorpelt"] = -1558096473 ,["goodpelt"] = 1150939141  , ["perfectpelt"] = -794277189       },
    [179]   = {["name"]  = "Coyote"                               , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_coyote"                                             ,["peltimage"] = "provision_coyote_fur"                                         ,["outfit"] = 375593826      ,["model"] = `a_c_coyote_01`          			,["poorpelt"] = -1558096473 ,["goodpelt"] = 1150939141  , ["perfectpelt"] = -794277189       },
    [180]   = {["name"]  = "Coyote"                               , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_coyote"                                             ,["peltimage"] = "provision_coyote_fur"                                         ,["outfit"] = -1680715241    ,["model"] = `a_c_coyote_01`          			,["poorpelt"] = -1558096473 ,["goodpelt"] = 1150939141  , ["perfectpelt"] = -794277189       },
    [181]   = {["name"]  = "Coyote"                               , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_coyote"                                             ,["peltimage"] = "provision_coyote_fur"                                         ,["outfit"] = 218671895      ,["model"] = `a_c_coyote_01`          			,["poorpelt"] = -1558096473 ,["goodpelt"] = 1150939141  , ["perfectpelt"] = -794277189       },
    [182]   = {["name"]  = "Coyote"                               , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_coyote"                                             ,["peltimage"] = "provision_coyote_fur"                                         ,["outfit"] = -101240835     ,["model"] = `a_c_coyote_01`          			,["poorpelt"] = -1558096473 ,["goodpelt"] = 1150939141  , ["perfectpelt"] = -794277189       },
    [183]   = {["name"]  = "Coyote"                               , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_coyote"                                             ,["peltimage"] = "provision_coyote_fur"                                         ,["outfit"] = 1469569555     ,["model"] = `a_c_coyote_01`          			,["poorpelt"] = -1558096473 ,["goodpelt"] = 1150939141  , ["perfectpelt"] = -794277189       },
    [184]   = {["name"]  = "Coyote"                               , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_coyote"                                             ,["peltimage"] = "provision_coyote_fur"                                         ,["outfit"] = -1394281412    ,["model"] = `a_c_coyote_01`          			,["poorpelt"] = -1558096473 ,["goodpelt"] = 1150939141  , ["perfectpelt"] = -794277189       },
    [185]   = {["name"]  = "Sandhill Crane"                       , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_cranewhooping_sandhill"                             ,["peltimage"] = "animal_cranewhooping_sandhill"                                ,["outfit"] = false          ,["model"] = `a_c_cranewhooping_01`         		,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
    [186]   = {["name"]  = "Whooping Crane"                       , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_cranewhooping_whooping"                             ,["peltimage"] = "animal_cranewhooping_whooping"                                ,["outfit"] = -1048557937    ,["model"] = `a_c_cranewhooping_01`         		,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
	[187]   = {["name"]  = "Gila Monster"                         , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_gila_monster"                                       ,["peltimage"] = "animal_gila_monster"                                          ,["outfit"] = false          ,["model"] = `a_c_gilamonster_01`               	,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
    [188]   = {["name"]  = "Alpine Goat"                          , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_goat"                                               ,["peltimage"] = "provision_goat_hair"                                          ,["outfit"] = false          ,["model"] = `a_c_goat_01`         				,["poorpelt"] = 699990316   ,["goodpelt"] = 1710714415  , ["perfectpelt"] = -1648383828      },
	[189]   = {["name"]  = "Canada Goose"                         , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_goosecanada"                                        ,["peltimage"] = "animal_goosecanada"                                           ,["outfit"] = false          ,["model"] = `a_c_goosecanada_01`          		,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
	[190]   = {["name"]  = "Rough Legged Hawk"                    , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_hawk_roughlegged"                                   ,["peltimage"] = "animal_hawk_roughlegged"                                      ,["outfit"] = false          ,["model"] = `a_c_hawk_01`        				,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
	[191]   = {["name"]  = "Red Tailed Hawk"                      , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_hawk_redtailed"                                     ,["peltimage"] = "animal_hawk_redtailed"                                        ,["outfit"] = -735264359     ,["model"] = `a_c_hawk_01`        				,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
	[192]   = {["name"]  = "Ferruginous Hawk"                     , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_hawk_ferruginous"                                   ,["peltimage"] = "animal_hawk_ferruginous"                                      ,["outfit"] = 1402464644     ,["model"] = `a_c_hawk_01`        				,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
    [193]   = {["name"]  = "Great Blue Heron"                     , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_heron_greatblue"                                    ,["peltimage"] = "animal_heron_greatblue"                                       ,["outfit"] = false          ,["model"] = `a_c_heron_01`         				,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
    [194]   = {["name"]  = "Tricolored Heron"                     , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_heron_greatblue"                                    ,["peltimage"] = "animal_heron_greatblue"                                       ,["outfit"] = -1120159737    ,["model"] = `a_c_heron_01`         				,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
    [195]   = {["name"]  = "Green Iguana"                         , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_iguana"                                             ,["peltimage"] = "animal_iguana"                                                ,["outfit"] = false          ,["model"] = `a_c_iguana_01`        				,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
    [196]   = {["name"]  = "Desert Iguana"                        , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_iguanadesert"                                       ,["peltimage"] = "animal_iguanadesert"                                          ,["outfit"] = false          ,["model"] = `a_c_iguanadesert_01`         		,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
	[197]   = {["name"]  = "Yellow Billed Loon"                   , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_loon_common"                                        ,["peltimage"] = "animal_loon_common"                                           ,["outfit"] = false          ,["model"] = `a_c_loon_01`          				,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
	[198]   = {["name"]  = "Pacific Loon"                         , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_loon_common"                                        ,["peltimage"] = "animal_loon_common"                                           ,["outfit"] = -658571380     ,["model"] = `a_c_loon_01`          				,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
	[199]   = {["name"]  = "Common Loon"                          , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_loon_common"                                        ,["peltimage"] = "animal_loon_common"                                           ,["outfit"] = -1232542282    ,["model"] = `a_c_loon_01`          				,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
	[200]   = {["name"]  = "Moose"                                , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_moose"                                              ,["peltimage"] = "provision_moose_fur"                                          ,["outfit"] = false          ,["model"] = 85379810        					,["poorpelt"] = 1868576868  ,["goodpelt"] = 1636891382  , ["perfectpelt"] = -217731719       },
	[201]   = {["name"]  = "Moose"                                , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_moose"                                              ,["peltimage"] = "provision_moose_fur"                                          ,["outfit"] = -1021877830    ,["model"] = 85379810        					,["poorpelt"] = 1868576868  ,["goodpelt"] = 1636891382  , ["perfectpelt"] = -217731719       },
	[202]   = {["name"]  = "Moose"                                , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_moose"                                              ,["peltimage"] = "provision_moose_fur"                                          ,["outfit"] = -1739715544    ,["model"] = 85379810        					,["poorpelt"] = 1868576868  ,["goodpelt"] = 1636891382  , ["perfectpelt"] = -217731719       },
	[203]   = {["name"]  = "Moose"                                , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_moose"                                              ,["peltimage"] = "provision_moose_fur"                                          ,["outfit"] = -1538725798    ,["model"] = 85379810        					,["poorpelt"] = 1868576868  ,["goodpelt"] = 1636891382  , ["perfectpelt"] = -217731719       },
	[204]   = {["name"]  = "Moose"                                , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_moose"                                              ,["peltimage"] = "provision_moose_fur"                                          ,["outfit"] = 2146685523     ,["model"] = 85379810        					,["poorpelt"] = 1868576868  ,["goodpelt"] = 1636891382  , ["perfectpelt"] = -217731719       },
	[205]   = {["name"]  = "Moose"                                , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_moose"                                              ,["peltimage"] = "provision_moose_fur"                                          ,["outfit"] = -1861127026    ,["model"] = 85379810        					,["poorpelt"] = 1868576868  ,["goodpelt"] = 1636891382  , ["perfectpelt"] = -217731719       },
	[206]   = {["name"]  = "Moose"                                , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_moose"                                              ,["peltimage"] = "provision_moose_fur"                                          ,["outfit"] = 1415163930     ,["model"] = 85379810        					,["poorpelt"] = 1868576868  ,["goodpelt"] = 1636891382  , ["perfectpelt"] = -217731719       },
    [207]   = {["name"]  = "American Muskrat"                     , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_muskrat"                                            ,["peltimage"] = "animal_muskrat"                                               ,["outfit"] = false          ,["model"] = `a_c_muskrat_01`        			,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
	[208]   = {["name"]  = "Californian Horned Owl"               , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_owl_coastal"                                        ,["peltimage"] = "animal_owl_coastal"                                           ,["outfit"] = false          ,["model"] = `a_c_owl_01`         				,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
	[209]   = {["name"]  = "Coastal Horned Owl"                   , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_owl_coastal"                                        ,["peltimage"] = "animal_owl_coastal"                                           ,["outfit"] = -1160541758    ,["model"] = `a_c_owl_01`         				,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
	[210]   = {["name"]  = "Great Horned Owl"                     , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_owl_coastal"                                        ,["peltimage"] = "animal_owl_coastal"                                           ,["outfit"] = 889331851      ,["model"] = `a_c_owl_01`         				,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
	[211]   = {["name"]  = "Angus Ox"                             , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_bull_angus"                                         ,["peltimage"] = "provision_bull_hide"                                          ,["outfit"] = false          ,["model"] = 85379810          					,["poorpelt"] = 4623248928  ,["goodpelt"] = 1208128650  , ["perfectpelt"] = 659601266        },
	[212]   = {["name"]  = "Alligator"  			              , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_alligator"                                          ,["peltimage"] = "provision_alligator_skin"                                     ,["outfit"] = false          ,["model"] =  1137812134        					,["poorpelt"] = -1243878166 ,["goodpelt"] = -2102079544 , ["perfectpelt"] = -1475338121      },
	[213]   = {["name"]  = "Alligator"  			              , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_alligator"                                          ,["peltimage"] = "provision_alligator_skin"                                     ,["outfit"] = false          ,["model"] =  `a_c_alligator_01`        			,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil 		     },
	[214]   = {["name"]  = "Alligator"  			              , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_alligator"                                          ,["peltimage"] = "provision_alligator_skin"                                     ,["outfit"] = -561697001     ,["model"] =  `a_c_alligator_01`        			,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil 		     },
	[215]   = {["name"]  = "Alligator"  			              , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_alligator"                                          ,["peltimage"] = "provision_alligator_skin"                                     ,["outfit"] = false          ,["model"] =  -2004866590         			    ,["poorpelt"] = -1243878166 ,["goodpelt"] = -2102079544 , ["perfectpelt"] = -1475338121      },
	[216]   = {["name"]  = "Alligator"  			              , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_alligator"                                          ,["peltimage"] = "provision_alligator_skin"                                     ,["outfit"] = -775023191     ,["model"] =  `a_c_alligator_01`        			,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil 		     },
	[217]   = {["name"]  = "Alligator"  			              , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_alligator"                                          ,["peltimage"] = "provision_alligator_skin"                                     ,["outfit"] = -775023191     ,["model"] =  `a_c_alligator_01`        			,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil 		     },
	[218]   = {["name"]  = "Alligator"  			              , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_alligator"                                          ,["peltimage"] = "provision_alligator_skin"                                     ,["outfit"] = -281403321     ,["model"] =  `a_c_alligator_01`        			,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil 		     },
	[219]   = {["name"]  = "Alligator"  			              , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_alligator"                                          ,["peltimage"] = "provision_alligator_skin"                                     ,["outfit"] = false          ,["model"] =  `a_c_alligator_03`        			,["poorpelt"] = 1806153689  ,["goodpelt"] = -802026654  , ["perfectpelt"] = -1625078531      },
	[220]   = {["name"]  = "Alligator"  			              , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_alligator"                                          ,["peltimage"] = "provision_alligator_skin"                                     ,["outfit"] = 929703644      ,["model"] =  `a_c_alligator_03`        			,["poorpelt"] = 1806153689  ,["goodpelt"] = -802026654  , ["perfectpelt"] = -1625078531      },
	[221]   = {["name"]  = "Alligator"  			              , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_alligator"                                          ,["peltimage"] = "provision_alligator_skin"                                     ,["outfit"] = 621642275      ,["model"] =  `a_c_alligator_03`        			,["poorpelt"] = 1806153689  ,["goodpelt"] = -802026654  , ["perfectpelt"] = -1625078531      },
	[222]   = {["name"]  = "Crayfish"  			             	  , ["texturedict"] = "satchel_textures" ,    ["image"] = "upgrade_fsh_bait_crayfish"                                 ,["peltimage"] = "upgrade_fsh_bait_crayfish"                                    ,["outfit"] = false      	   ,["model"] =  `a_c_crawfish_01`        	 		,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil 		     },
	[223]   = {["name"]  = "Northern Pike"  			          , ["texturedict"] = "satchel_textures" ,    ["image"] = "provision_fish_northern_pike"                              ,["peltimage"] = "provision_fish_northern_pike"                      		      ,["outfit"] = false      	   ,["model"] =  `a_c_fishnorthernpike_01_lg`  		,["poorpelt"] = 588902637   ,["goodpelt"] = 193037129   , ["perfectpelt"] = nil 		     },
	[224]   = {["name"]  = "Northern Pike"  			          , ["texturedict"] = "satchel_textures" ,    ["image"] = "provision_fish_northern_pike"                              ,["peltimage"] = "provision_fish_northern_pike"                   			  ,["outfit"] = -4595908       ,["model"] =  `a_c_fishnorthernpike_01_lg`  		,["poorpelt"] = 588902637   ,["goodpelt"] = 193037129   , ["perfectpelt"] = nil 		     },
	[225]   = {["name"]  = "Bullhead Catfish"  			          , ["texturedict"] = "satchel_textures" ,    ["image"] = "provision_fish_bullhead_catfish"                           ,["peltimage"] = "provision_fish_bullhead_catfish"                   		      ,["outfit"] = -1910028162    ,["model"] =  `a_c_fishbullheadcat_01_ms`  		,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil 		     },
	[226]   = {["name"]  = "Bullhead Catfish"  			          , ["texturedict"] = "satchel_textures" ,    ["image"] = "provision_fish_bullhead_catfish"                           ,["peltimage"] = "provision_fish_bullhead_catfish"                   		      ,["outfit"] = false      	   ,["model"] =  `a_c_fishbullheadcat_01_sm`  		,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil 		     },
 	[227]   = {["name"]  = "Channel Catfish"  			          , ["texturedict"] = "satchel_textures" ,    ["image"] = "provision_fish_channel_catfish"                            ,["peltimage"] = "provision_fish_channel_catfish"                   		      ,["outfit"] = false      	   ,["model"] =  `a_c_fishchannelcatfish_01_lg`    	,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil 		     },
 	[228]   = {["name"]  = "Lake Sturgeon"  			          , ["texturedict"] = "satchel_textures" ,    ["image"] = "provision_fish_lake_sturgeon"                              ,["peltimage"] = "provision_fish_lake_sturgeon"                   			  ,["outfit"] = 2142400903     ,["model"] =  `a_c_fishlakesturgeon_01_lg`    	,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil 		     },
 	[229]   = {["name"]  = "Lake Sturgeon"  			          , ["texturedict"] = "satchel_textures" ,    ["image"] = "provision_fish_lake_sturgeon"                              ,["peltimage"] = "provision_fish_lake_sturgeon"                   			  ,["outfit"] = 1492558869     ,["model"] =  `a_c_fishlakesturgeon_01_lg`    	,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil 		     },
 	[230]   = {["name"]  = "Largemouth Bass"  			          , ["texturedict"] = "satchel_textures" ,    ["image"] = "provision_fish_largemouth_bass"                            ,["peltimage"] = "provision_fish_largemouth_bass"                   		      ,["outfit"] = -1950203877    ,["model"] =  `a_c_fishlargemouthbass_01_lg`    	,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil 		     },																																									
  	[231]   = {["name"]  = "Largemouth Bass"  			          , ["texturedict"] = "satchel_textures" ,    ["image"] = "provision_fish_largemouth_bass"                            ,["peltimage"] = "provision_fish_largemouth_bass"                   		      ,["outfit"] = false  		   ,["model"] =  `a_c_fishlargemouthbass_01_ms`    	,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil 		     },
  	[232]   = {["name"]  = "Longnose Gar"  			          	  , ["texturedict"] = "satchel_textures" ,    ["image"] = "provision_fish_longnose_gar"                           	  ,["peltimage"] = "provision_fish_longnose_gar"                   			      ,["outfit"] = false     	   ,["model"] =  `a_c_fishlongnosegar_01_lg`    	,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil 		     },
 	[233]   = {["name"]  = "Longnose Gar"  			          	  , ["texturedict"] = "satchel_textures" ,    ["image"] = "provision_fish_longnose_gar"                           	  ,["peltimage"] = "provision_fish_longnose_gar"                   			      ,["outfit"] = -1618780616    ,["model"] =  `a_c_fishlongnosegar_01_lg`    	,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil 		     },
 	[234]   = {["name"]  = "Muskie"  			          		  , ["texturedict"] = "satchel_textures" ,    ["image"] = "provision_fish_muskie"                           	 	  ,["peltimage"] = "provision_fish_muskie"                   				      ,["outfit"] = false     	   ,["model"] =  `a_c_fishmuskie_01_lg`    		    ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil 		     },
    [235]   = {["name"]  = "Legendary Bullhead Catfish"  		  , ["texturedict"] = "satchel_textures"  ,   ["image"] = "provision_fish_bullhead_catfish"                           ,["peltimage"] = "provision_fish_bullhead_catfish"                   		      ,["outfit"] = false      	   ,["model"] =  `a_c_fishbullheadcat_01_ms`  	    ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil 		     },
    [236]   = {["name"]  = "Legendary argemouth Bass"  		      , ["texturedict"] = "satchel_textures"  ,   ["image"] = "provision_fish_largemouth_bass"                            ,["peltimage"] = "provision_fish_largemouth_bass"                   		      ,["outfit"] = false    	   ,["model"] =  `a_c_fishlargemouthbass_01_lg`     ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil 		     },
    [237]   = {["name"]  = "Legendary Lake Sturgeon"  			  , ["texturedict"] = "satchel_textures"  ,   ["image"] = "provision_fish_lake_sturgeon"                           	  ,["peltimage"] = "provision_fish_lake_sturgeon"                   			  ,["outfit"] = false     	   ,["model"] =  `a_c_fishlakesturgeon_01_lg`       ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil 		     },
    [238]   = {["name"]  = "Legendary Muskie"  			          , ["texturedict"] = "satchel_textures"  ,   ["image"] = "provision_fish_muskie"                           	 	  ,["peltimage"] = "provision_fish_muskie"                   				      ,["outfit"] = -364709180     ,["model"] =  `a_c_fishmuskie_01_lg`             ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil 		     },
    [239]   = {["name"]  = "Legendary Gabbro Horn Ram"    		  , ["texturedict"] = "inventory_items_mp",   ["image"] = "mp_animal_ram_legendary_01"                                ,["peltimage"] = "mp_animal_ram_legendary_01"                                   ,["outfit"] = 797910655	   ,["model"] = -511163808         	                ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] =  -675142890      },
    [240]   = {["name"]  = "Legendary Chalk Horn Ram"     		  , ["texturedict"] = "inventory_items_mp",   ["image"] = "mp_animal_ram_legendary_02"                                ,["peltimage"] = "mp_animal_ram_legendary_02"                                   ,["outfit"] = -1369857002    ,["model"] = -511163808         	                ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] =  -906131571      },
    [241]   = {["name"]  = "Legendary Rutile Horn Ram"	          , ["texturedict"] = "inventory_items_mp",   ["image"] = "provision_role_naturalist_carcass_ram_legendary_03"        ,["peltimage"] = "provision_role_naturalist_carcass_ram_legendary_03"           ,["outfit"] = -1667956595    ,["model"] = -511163808         	                ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = -591844128       },
    [242]   = {["name"]  = "Legendary Teca Gator"		          , ["texturedict"] = "inventory_items_mp",   ["image"] = "mp_animal_alligator_legendary_01"                          ,["peltimage"] = "mp_animal_alligator_legendary_01"                             ,["outfit"] = false 	       ,["model"] = -1804478060  		                ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = -1924159110      },
    [243]   = {["name"]  = "Legendary Banded Gator"      		  , ["texturedict"] = "inventory_items_mp",   ["image"] = "provision_role_naturalist_carcass_alligator_legendary_02"  ,["peltimage"] = "provision_role_naturalist_carcass_alligator_legendary_02"     ,["outfit"] = false          ,["model"] = -1828919758  		                ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] =  -1061253029     },
    [244]   = {["name"]  = "Legendary Sun Gator"         		  , ["texturedict"] = "inventory_items_mp",   ["image"] = "provision_role_naturalist_carcass_alligator_legendary_03"  ,["peltimage"] = "provision_role_naturalist_carcass_alligator_legendary_03"     ,["outfit"] = false          ,["model"] = -829337926   		                ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] =  -1621144167     },
    [245]   = {["name"]  = "Legendary Bullgator"	              , ["texturedict"] = "inventory_items_mp",   ["image"] = "provision_role_naturalist_carcass_alligator_legendary_03"  ,["peltimage"] = "provision_role_naturalist_carcass_alligator_legendary_03"     ,["outfit"] = false          ,["model"] = -368368059   		                ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] =  -1625078531     },
    [246]   = {["name"]  = "Legendary Midnight Paw Coyote"        , ["texturedict"] = "inventory_items_mp",   ["image"] = "mp_animal_coyote_legendary_02"                             ,["peltimage"] = "mp_animal_coyote_legendary_02"                                ,["outfit"] = 1662119255     ,["model"] = -1307757043  		                ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = 1728819413       },
    [247]   = {["name"]  = "Legendary Milk Coyote"        		  , ["texturedict"] = "inventory_items_mp",   ["image"] = "provision_role_naturalist_carcass_coyote_legendary_03"     ,["peltimage"] = "provision_role_naturalist_carcass_coyote_legendary_03"        ,["outfit"] = 1155641591     ,["model"] = -1307757043  		                ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] =  1009802015      },
    [248]   = {["name"]  = "Legendary Red Streak Coyote"          , ["texturedict"] = "inventory_items_mp",   ["image"] = "provision_role_naturalist_carcass_coyote_legendary_01"     ,["peltimage"] = "provision_role_naturalist_carcass_coyote_legendary_01"        ,["outfit"] = 807110531      ,["model"] = -1307757043  		                ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] =  -1061362634     },
    [249]   = {["name"]  = "Legendary Katata Elk"		          , ["texturedict"] = "inventory_items_mp",   ["image"] = "mp_animal_elk_legendary_01"                                ,["peltimage"] = "mp_animal_elk_legendary_01"                                   ,["outfit"] = false		   ,["model"] =  1791822742   		                ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = -420237085       },
    [250]   = {["name"]  = "Legendary Inahme Elk"    		      , ["texturedict"] = "inventory_items_mp",   ["image"] = "mp_animal_elk_legendary_03"                                ,["peltimage"] = "mp_animal_elk_legendary_03"                                   ,["outfit"] = false	       ,["model"] =  404998417    		                ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] =  -159428614      },                                                                                                                                                                                         
    [251]   = {["name"]  = "Legendary Ozula Elk"      			  , ["texturedict"] = "inventory_items_mp",   ["image"] = "mp_animal_elk_legendary_02"                                ,["peltimage"] = "mp_animal_elk_legendary_02"                                   ,["outfit"] = false          ,["model"] = -955059723   		                ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] =  -1195518864     },
    [252]   = {["name"]  = "Legendary Snow Elk"       			  , ["texturedict"] = "inventory_items_mp",   ["image"] = "mp_animal_elk_legendary_02"                                ,["peltimage"] = "mp_animal_elk_legendary_02"                                   ,["outfit"] = false          ,["model"] = -649179483   		                ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] =  -1332163079     },
    [253]   = {["name"]  = "Legendary Onyx Wolf"			      , ["texturedict"] = "inventory_items_mp",   ["image"] = "mp_animal_wolf_legendary_02"                               ,["peltimage"] = "mp_animal_wolf_legendary_02"                                  ,["outfit"] = -1657259210    ,["model"] = -1392359921  		                ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = -1548204069      },
    [254]   = {["name"]  = "Legendary Moonstone Wolf"     		  , ["texturedict"] = "inventory_items_mp",   ["image"] = "mp_animal_wolf_legendary_03"                               ,["peltimage"] = "mp_animal_wolf_legendary_03"                                  ,["outfit"] = -1428269438    ,["model"] = -1392359921  		                ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] =  -907373381      },
    [255]   = {["name"]  = "Legendary Emerald Wolf"               , ["texturedict"] = "inventory_items_mp",   ["image"] = "mp_animal_wolf_legendary_01"                               ,["peltimage"] = "mp_animal_wolf_legendary_01"                                  ,["outfit"] = 263659570      ,["model"] = -1392359921  		                ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] =  -1946740647     },
    [256]   = {["name"]  = "Legendary Ota Fox"       		      , ["texturedict"] = "inventory_items_mp",   ["image"] = "provision_role_naturalist_carcass_fox_legendary_01"        ,["peltimage"] = "provision_role_naturalist_carcass_fox_legendary_01"           ,["outfit"] = -1558958207    ,["model"] = -557149691   		                ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] =  1276143905      },
    [257]   = {["name"]  = "Legendary Marble Fox"    		      , ["texturedict"] = "inventory_items_mp",   ["image"] = "provision_role_naturalist_carcass_fox_legendary_02"        ,["peltimage"] = "provision_role_naturalist_carcass_fox_legendary_02"           ,["outfit"] = -1936391549    ,["model"] = -557149691   		                ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] =  -1262044528     },
    [258]   = {["name"]  = "Legendary Cross Fox"     		      , ["texturedict"] = "inventory_items_mp",   ["image"] = "provision_role_naturalist_carcass_fox_legendary_03"        ,["peltimage"] = "provision_role_naturalist_carcass_fox_legendary_03"           ,["outfit"] = 131922197	   ,["model"] = -557149691   		                ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] =   -963027403     },
    [259]   = {["name"]  = "Legendary Owiza Bear"         	 	  , ["texturedict"] = "inventory_items_mp",   ["image"] = "mp_animal_bear_legendary_01"                               ,["peltimage"] = "mp_animal_bear_legendary_01"                                  ,["outfit"] = false	       ,["model"] = 55897452     		                ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] =  1181154860      },
    [260]   = {["name"]  = "Legendary Ridgeback Spirit Bear"      , ["texturedict"] = "inventory_items_mp",   ["image"] = "mp_animal_bear_legendary_01"                               ,["peltimage"] = "mp_animal_bear_legendary_01"                                  ,["outfit"] = false          ,["model"] = 499820607    		                ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] =  1418435161      },
    [261]   = {["name"]  = "Legendary Golden Spirit Bear "        , ["texturedict"] = "inventory_items_mp",   ["image"] = "mp_animal_bear_legendary_03"                               ,["peltimage"] = "mp_animal_bear_legendary_03"                                  ,["outfit"] = false          ,["model"] = 98597207     		                ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] =  1511236969      },
    [262]   = {["name"]  = "Legendary Ghost Panther"      	 	  , ["texturedict"] = "inventory_items_mp",   ["image"] = "provision_role_naturalist_carcass_panther_legendary_02"    ,["peltimage"] = "provision_role_naturalist_carcass_panther_legendary_02"       ,["outfit"] = -606676212     ,["model"] = -1189368951  		                ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] =  836208559       },
    [263]   = {["name"]  = "Legendary Nightwalker Panther"        , ["texturedict"] = "inventory_items_mp",   ["image"] = "mp_animal_panther_legendary_01"                            ,["peltimage"] = "mp_animal_panther_legendary_01"                               ,["outfit"] = 968333004	   ,["model"] = -1189368951  		                ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] =  2088901891      },
    [264]   = {["name"]  = "Legendary Iwakta Panther"     	 	  , ["texturedict"] = "inventory_items_mp",   ["image"] = "provision_role_naturalist_carcass_panther_legendary_03"    ,["peltimage"] = "provision_role_naturalist_carcass_panther_legendary_03"       ,["outfit"] = -360941481     ,["model"] = -1189368951  		                ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] =  1600479946      },
    [265]   = {["name"]  = "Legendary Giaguaro Panther"           , ["texturedict"] = "inventory_items_mp",   ["image"] = "provision_role_naturalist_carcass_panther_legendary_02"    ,["peltimage"] = "provision_role_naturalist_carcass_panther_legendary_02"       ,["outfit"] = -1541074772    ,["model"] = 1654513481   		                ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] =  1969175294      },
    [266]   = {["name"]  = "Legendary Snow Buck"          	 	  , ["texturedict"] = "inventory_items_mp",   ["image"] = "provision_role_naturalist_carcass_buck_legendary_02"       ,["peltimage"] = "provision_role_naturalist_carcass_buck_legendary_02"          ,["outfit"] = -1381586791    ,["model"] = -1754211037  		                ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] =  -1218522879     },
    [267]   = {["name"]  = "Legendary Mud Runner Buck"    	 	  , ["texturedict"] = "inventory_items_mp",   ["image"] = "provision_role_naturalist_carcass_buck_legendary_01"       ,["peltimage"] = "provision_role_naturalist_carcass_buck_legendary_01"          ,["outfit"] = -1617752974    ,["model"] = -1754211037  		                ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] =  -308200059      },
    [268]   = {["name"]  = "Legendary Shadow Buck"	              , ["texturedict"] = "inventory_items_mp",   ["image"] = "mp_animal_buck_legendary_03"                               ,["peltimage"] = "mp_animal_buck_legendary_03"                                  ,["outfit"] = -1141848787    ,["model"] = -1754211037  		                ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = 923422806        },
    [269]   = {["name"]  = "Legendary Moon Beaver"        	 	  , ["texturedict"] = "inventory_items_mp",   ["image"] = "mp_animal_beaver_legendary_02"                             ,["peltimage"] = "mp_animal_beaver_legendary_02"                                ,["outfit"] = 334014283	   ,["model"] = -1149999295  		                ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] =  -251416414      },
    [270]   = {["name"]  = "Legendary Zizi Beaver"                , ["texturedict"] = "inventory_items_mp",   ["image"] = "mp_animal_beaver_legendary_01"                             ,["peltimage"] = "mp_animal_beaver_legendary_01"                                ,["outfit"] = 1321671943     ,["model"] = -1149999295  		                ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] =  121494806       },
    [271]   = {["name"]  = "Legendary Night Beaver"		          , ["texturedict"] = "inventory_items_mp",   ["image"] = "mp_animal_beaver_legendary_03"                             ,["peltimage"] = "mp_animal_beaver_legendary_03"                                ,["outfit"] = 766106317	   ,["model"] = -1149999295  		                ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = -1787430524      },		
    [272]   = {["name"]  = "Legendary Winyan Bison"       	 	  , ["texturedict"] = "inventory_items_mp",   ["image"] = "mp_animal_bison_legendary_02"                              ,["peltimage"] = "mp_animal_bison_legendary_02"                                 ,["outfit"] = false	       ,["model"] = -1778714095  		                ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] =  -1087205695     },
    [273]   = {["name"]  = "Legendary Payta Bison"                , ["texturedict"] = "inventory_items_mp",   ["image"] = "mp_animal_bison_legendary_01"                              ,["peltimage"] = "mp_animal_bison_legendary_01"                                 ,["outfit"] = false          ,["model"] = -1564281334  		                ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] =  -857265622      },
    [274]   = {["name"]  = "Legendary Tatanka Bison"		      , ["texturedict"] = "inventory_items_mp",   ["image"] = "mp_animal_bison_legendary_01"                              ,["peltimage"] = "mp_animal_bison_legendary_01"                                 ,["outfit"] = false		   ,["model"] = -1962493114  		                ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = -260181673       },		
    [275]   = {["name"]  = "Legendary Iguga Cougar"       	 	  , ["texturedict"] = "inventory_items_mp",   ["image"] = "mp_animal_cougar_legendary_01"                             ,["peltimage"] = "mp_animal_cougar_legendary_01"                                ,["outfit"] = 2096045552     ,["model"] = -1433814131  		                ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] =  832214437       },
    [276]   = {["name"]  = "Legendary Maza Cougar"        	 	  , ["texturedict"] = "inventory_items_mp",   ["image"] = "mp_animal_cougar_legendary_02"                             ,["peltimage"] = "mp_animal_cougar_legendary_02"                                ,["outfit"] = -835665806     ,["model"] = -1433814131  		                ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] =  397926876       },
    [277]   = {["name"]  = "Legendary Sapa Cougar"		          , ["texturedict"] = "inventory_items_mp",   ["image"] = "mp_animal_cougar_legendary_03"                             ,["peltimage"] = "mp_animal_cougar_legendary_03"                                ,["outfit"] = 693761739	   ,["model"] = -1433814131  		                ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = 219794592        },
    [278]   = {["name"]  = "Legendary Knight Moose"		          , ["texturedict"] = "inventory_items_mp",   ["image"] = "mp_animal_moose_legendary_02"                              ,["peltimage"] = "mp_animal_moose_legendary_02"                                 ,["outfit"] = false		   ,["model"] = -1329369992  		                ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = 1043121665       }, 		   
    [279]   = {["name"]  = "Legendary Snowflake Moose"    	 	  , ["texturedict"] = "inventory_items_mp",   ["image"] = "provision_role_naturalist_carcass_moose_legendary_03"      ,["peltimage"] = "provision_role_naturalist_carcass_moose_legendary_03"         ,["outfit"] = false	       ,["model"] = -1664740206  		                ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] =  739090883       },
    [280]   = {["name"]  = "Legendary Ruddy Moose"                , ["texturedict"] = "inventory_items_mp",   ["image"] = "provision_role_naturalist_carcass_moose_legendary_01"      ,["peltimage"] = "provision_role_naturalist_carcass_moose_legendary_01"         ,["outfit"] = false          ,["model"] = -629259491   		                ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] =  -634716689      },	
    [281]   = {["name"]  = "Legendary Icahi Boar"         	 	  , ["texturedict"] = "inventory_items_mp",   ["image"] = "provision_role_naturalist_carcass_boar_legendary_01"       ,["peltimage"] = "provision_role_naturalist_carcass_boar_legendary_01"          ,["outfit"] = false	       ,["model"] = -1038420333  		                ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] =  -940052481      },
    [282]   = {["name"]  = "Legendary Wakpa Boar"                 , ["texturedict"] = "inventory_items_mp",   ["image"] = "provision_role_naturalist_carcass_boar_legendary_02"       ,["peltimage"] = "provision_role_naturalist_carcass_boar_legendary_02"          ,["outfit"] = false          ,["model"] = -1038420333  		                ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] =  -1249752300     },
    [283]   = {["name"]  = "Legendary Cogi Boar"                  , ["texturedict"] = "inventory_items_mp",   ["image"] = "provision_role_naturalist_carcass_boar_legendary_02"       ,["peltimage"] = "provision_role_naturalist_carcass_boar_legendary_02"          ,["outfit"] = false          ,["model"] = -1038420333  		                ,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] =  -1572330336     },
-- ADDED MISSING REFERENCES 
    [284]   = {["name"]  = "Neotropic Cormorant"                  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_cormorant"                                          ,["peltimage"] = "animal_cormorant"                                             ,["outfit"] = 13145675       ,["model"] = `a_c_cormorant_01`        			,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
	[285]   = {["name"]  = "Big China Pig"                        , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_pig_bigchina"                                       ,["peltimage"] = "provision_pig_skin"                                           ,["outfit"] = 538936875      ,["model"] = `a_c_pig_01`         				,["poorpelt"] = -308965548  ,["goodpelt"] = -57190831   , ["perfectpelt"] = -1102272634      },
    [286]   = {["name"]  = "Ram"           						  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_ram"                        						  ,["peltimage"] = "provision_ram_hide"                                      	  ,["outfit"] =  689325217     ,["model"] = `a_c_bighornram_01`      			,["poorpelt"] = 1796037447  ,["goodpelt"] = -476045512  , ["perfectpelt"] = 1795984405       },																																									  																											
	[287]   = {["name"]  = "Gray Wolf"                   		  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_wolf_gray"                  						  ,["peltimage"] = "provision_wolf_fur"                                     	  ,["outfit"] = 184083808      ,["model"] = `a_c_wolf_medium`      				,["poorpelt"] = 85441452    ,["goodpelt"] = 1145777975  , ["perfectpelt"] = 653400939        },																																															 												
	[288]   = {["name"]  = "Vulture"                      		  , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_vulture_eastern"            						  ,["peltimage"] = "animal_vulture_eastern"                                 	  ,["outfit"] = -872382606     ,["model"] = 1104697660   			 			,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },																																																	 
	[289]   = {["name"]  = "American Pronghorn Doe"               , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_pronghorn"                  						  ,["peltimage"] = "provision_pronghorn_fur"                                      ,["outfit"] = -386220147     ,["model"] = `a_c_pronghorn_01`    				,["poorpelt"] = -983605026  ,["goodpelt"] = 554578289   , ["perfectpelt"] = -1544126829      },
    [290]   = {["name"]  = "Collared Peccary Pig"                 , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_javelina"                                           ,["peltimage"] = "provision_javelina_skin"                                     ,["outfit"] = -1364061621     ,["model"] = `a_c_javelina_01`         			,["poorpelt"] = -99092070  , ["goodpelt"] = -1379330323 , ["perfectpelt"] =  1963510418      },
    [291]   = {["name"]  = "Collared Peccary Pig"                 , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_javelina"                                           ,["peltimage"] = "provision_javelina_skin"                                      ,["outfit"] = -520358178     ,["model"] = `a_c_javelina_01`         			,["poorpelt"] = -99092070  , ["goodpelt"] = -1379330323 , ["perfectpelt"] =  1963510418      },
	[292]   = {["name"]  = "Dominique Chicken"                    , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_chicken_dominique"          						  ,["peltimage"] = "animal_chicken_dominique"                                	  ,["outfit"] = 1165342204     ,["model"] = `a_c_chicken_01`        			,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
	[293]   = {["name"]  = "Dominique Chicken"                    , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_chicken_dominique"          						  ,["peltimage"] = "animal_chicken_dominique"                                	  ,["outfit"] = -626808707     ,["model"] = `a_c_chicken_01`        			,["poorpelt"] = nil         ,["goodpelt"] = nil         , ["perfectpelt"] = nil              },
	[294]   = {["name"]  = "Beaver"                               , ["texturedict"] = "satchel_textures" ,    ["image"] = "animal_beaver"                             				  ,["peltimage"] = "provision_beaver_fur"                                    	  ,["outfit"] = -1212478257    ,["model"] = `a_c_beaver_01`                     ,["poorpelt"] = -1569450319 ,["goodpelt"] = -2059726619 , ["perfectpelt"] = 854596618        }, 

 

 } 
 
   