Config = {}
 
-- VERSION 1.08  - 28.02.25
 
--------------------------------------------------
			-- FRAMEWORK SELECTION --
-------------------------------------------------- 

--Turn your framework to true and all the others to false

Config.REDEMRP2          				 = false
Config.REDEMRP2023REBOOT 				 = false
Config.VORP              				 = false
Config.RSG               				 = true
 
Config.EnableNotifications               = true     -- Enable / Disable notifications  
Config.CallMyboatEverwyhere              = false     -- If enabled you will be able to spawn your boat everywhere by using the menu command "boatmenu"
Config.StoreBoatAnywhere                 = false     -- Players can store their boat anywhere if true. If set to false, players can store their boat only when they're close to the boat shop
 
Config.SpawnBoatByCommand                = false 	-- If enabled the boatmenu command will be enabled 
Config.AutomaticboatDelete               = false
Config.AutomaticboatDeleteDistance       = 200
Config.SellPriceDivider 				 = 2  		-- Selling price divider when selling to the boat shop (Purchase boat price / Config.SellPriceDivider)
Config.VORPGoldEnabled				     = false     -- If set to true it will enable the vorp gold currency to be used when purchasing and selling boats at the boat shop 	 
Config.SellGoldDivider				     = 2  		-- Selling gold price divider when selling to the boat shop (Purchase boat gold price / Config.SellGoldDivider)
Config.RepairPrice      				 = 30 		-- Repair price in dollars at the boat shop 
 
Config.SharedStash                		 = true 	-- Turn this to true if you want boat stashes to be accessible by other players. It will automatically activate when the owner of the boat opens it's stash. Keep in mind the boat must be stopped and the "driver" seat unoccupied.						  
Config.StashRoleRestrictions      		 = false 
Config.StashRoles = {								-- Roles that are authorized to search other player's boats
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

Config.WebhookUrl                        	= "https://discord.com/api/webhooks/1362878084176548134/xWC0_dpIepDlTCF6ZBAr0Mw6owrRc0jHbfzUVvpGYu9GmMAlxgwmJ2TDUEbnImsXdMhJ"
Config.WebhookMainTitle                  	= "Boat Shop"
	
-- PURCHASE FROM BOAT SHOP EVENT --         	   
Config.UseWebhookPurchaseFromShop     	    = true  -- Turn to true if you want to use the Discord Webhook for this event
Config.WebhookPurchaseTitle                 = "Boat Purchase"
Config.WebhookPurchase                      = "Purchased a"
Config.WebhookPurchaseFor                   = "for"
Config.WebhookPurchase2                  	= "and"
Config.WebhookPurchase3                  	= "Gold"
	
-- PURCHASE FROM PLAYER EVENT --         	    
Config.UseWebhookPurchaseFromPlayer      	= true -- Turn to true if you want to use the Discord Webhook for this event
Config.WebhookPurchaseFromPlayer         	= "Purchased a boat from "
	
-- SOLD BOAT TO THE BOAT SHOP --               	               
Config.UseWebhookSold                    	= true -- Turn to true if you want to use the Discord Webhook for this event
Config.WebhookSoldTitle                  	= "Boat Sell"
Config.WebhookSoldBoatNamed             	= "sold a boat named"
Config.WebhookSoldBoatFor               	= "for"	
Config.WebhookSoldBoat2                 	= "and"	
Config.WebhookSoldBoat3                 	= "gold"

 
------------------- 
  --  PROMPTS  --
------------------- 
    Config.PromptBoatShop    				=  "Boat Shop"       
    Config.PromptOpen        				=  "Open Shop"           
    Config.PromptSell        				=  "Sell Boat"           
    Config.PromptStash       				=  "Open Stash"              
    Config.PromptStashTitle  				=  "Stash"  
	Config.PromptSharedStash 				=  "Shared Stash" 
    Config.PromptStopSell    				=  "Stop Selling"                
    Config.PromptStore       				=  "Store"     
    Config.PromptStored      				=  "Boat sent back to the nearest boat shop"     
    Config.PromptCarry       				=  "Carry"               
    Config.PromptDrop        				=  "Drop"                
    Config.PromptBuyBoat     				=  "Buy"                 
    Config.PromptCamera      				=  "Change Camera"       
    Config.PromptCameraTitle 				=  "Camera"       
	
 
	Config.KeyPromptOpen        		    =  0x43DBF61F -- ENTER
	Config.KeyPromptSell        		    =  0x43DBF61F -- ENTER	
	Config.KeyPromptStash       		    =  0xD8F73058 -- U	
	Config.KeyPromptSharedtash  		    =  0xD8F73058 -- U	
	Config.KeyPromptStopSell  			    =  0xD8F73058 -- U	
	Config.KeyPromptStore     			    =  0xD8CF0C95 -- C	
	Config.KeyPromptCarry     			    =  0x8AAA0AD4 -- LEFT ALT 
	Config.KeyPromptDrop      			    =  0x8AAA0AD4 -- LEFT ALT 	
	Config.KeyPromptBuyBoat   			    =  0x43DBF61F -- ENTER	
	Config.KeyPromptCamera    			    =  0xD8CF0C95 -- C	
 
------------------------
  --  GENERAL TEXT  --
------------------------ 

    Config.Boat                            = "Boats"
    Config.BoatMenu                        = "Boats Menu"
    Config.CancelMission                   = "Cancel Mission"             -- For Sirevlc_boats_missions 
	Config.CancelMissionDesc               = "Cancel the ongoing Mission" -- For Sirevlc_boats_missions 
	Config.TextNotifAutomaticDelete        = "Your boat was too far away and has been sent back to the nearest boat shop"     
	Config.SpawnOccupied                   = "The spawn is occupied"			           
 	Config.BoatDestroyed                   = "Your boat has been destroyed"
	Config.BoatDestroyed2                  = "Go to the nearest boat shop to repair it"
	Config.PurchaseBoats                   = "Buy a boat"  
    Config.BoatShop                        = "Boat Shop"
    Config.SpawnSpotBusy                   = "The Spawn spot is busy"
    Config.StoreBoatFirst                  = "You must store your boat first"
    Config.SellToPlayer                    = "Sell Price:"
	Config.SoldBoat                        = "You sold the boat for $"	
	Config.SoldBoat2                       = "and"	
    Config.BuyBoatNoJob                    = "You dont have the required job to do this"
    Config.BuyBoatNoMoney                  = "You dont have enough money"
    Config.BoatPurchased                   = "You have purchased a boat"
    Config.CustomizationNoMoney            = "You dont have enough money"
    Config.ComponentPurchased              = "You bought a new component"
    Config.SellBoat                        = "Sell Boat"
    Config.BoatFarAway                     = "Your boat is too far away bring it closer"
    Config.AddName                         = "Add Name"
    Config.AddPrice                        = "Price:"
    Config.OpenShopNoJob                   = "You don't have the required job"
	
	Config.TextNotifGoldSign			   = "Gold" 
	Config.textNotifStartedSellingToPlayer = "You are now waiting for someone to purchase your boat"
	Config.TextNotifGoodCondition  		   = "Good Condition"
	Config.TextNotifDestroyed      		   = "Destroyed"
	Config.TextNotifNotDestroyed   		   = "Your boat is not destroyed"
	Config.TextNotifManageSpawn    		   = "Spawn Boat"
	Config.TextNotifManageSpawnDesc		   = "Spawn this boat"
	Config.TextNotifRepairFirst    		   = "Repair it first"
	Config.TextNotifBeInWater    		   = "You must be in water to make your boat spawn"
	Config.TextNotifRepaired       		   = "Your boat has been repaired"
	Config.TextNotifBoatSpawned    		   = "Boat Spawned"
	Config.TextNotifOwnedboats     		   = "Owned Boats"
	Config.TextNotifWeightLimit    		   = "Weight Limit: "
 
    Config.PurchaseMenu                    = "Buy Boats"
    Config.Tints                           = "Tints"
    Config.Liveries                        = "Liveries"
    Config.Extras                          = "Extras"
    Config.Lanterns                        = "Lanterns"
    Config.PropSets                        = "Propsets"
    Config.OwnedBoats                      = "Owned Boats"
    Config.SelectBoat                      = "Select Boat"
    Config.BuyBoatDesc                     = "Select and buy"
    Config.BuyBoatJobDesc                  = "Buy Boat<br>Job Requirement:"
    Config.BoatManage                      = "Manage Boat"
    Config.ManageDesc                      = "Manage your Boat"
    Config.ManageSpawn                     = "Spawn Boat"
	Config.ManageSpawnDesc                 = "Spawn your boat"
    Config.ManageRepair                    = "Repair Boat"
    Config.ManageRepairDesc                = "Repair for $"
    Config.ManageDelete                    = "Sell Boat"
    Config.ManageDeleteDesc                = "Sell for $"
    Config.ManageCustomize                 = "Customize Boat"
    Config.ManageCustomizeDesc             = "Tints Liveries etc"
    Config.Customize                       = "Customize"
    Config.NoComponent                     = "No customization available for this boat"
	Config.ConfirmDeleteBoat               = "Confirm Delete"
	Config.No                              = "No"
	Config.Yes                             = "Yes"
	
 
-- LIST OF BOAT MODELS THAT CAN BE CARRIED 
Config.CarriableBoatModels = {
    `canoe`,
    `canoeTreeTrunk`,
    `pirogue2`,
    `pirogue`,
    `rowboat`,
    `rowboatSwamp02`,
    `rowboatSwamp`,
}

-- BOAT MODELS 
Config.BoatModels = {
    `boatsteam02x`,
    `canoe`,
    `canoeTreeTrunk`,
    `keelboat`,
    `pirogue2`,
    `pirogue`,
    `rowboat`,
    `rowboatSwamp02`,
    `rowboatSwamp`,
}

 
-- REGISTERED JOB LABELS TO BE USED IN THE CONFIG.BOATSHOPS TABLE BELOW:  
Config.RegisteredJobLabels = {
    ["none"]         = "none",
    ["horsetrainer"] = "horsetrainer",
}
 
 
Config.BoatShops = {
    [1] = {
        name              = "Blackwater",
        blipenabled       = true,
		blipname          = "Boat Shop",
        blipspritehash    = 2033397166,
        pos               = vector3(-687.7609252929688, -1244.353759765625, 43.11135864257812),
        boatpos           = vector4(-690.1068115234375, -1248.4569091796875, 40.28900146484375, -90.0),
        cameracoords  = {
            [1] = {a= -682.76, b= -1253.14, c= 42.80, d= -13.19, e= 0.00, f= 52.36,   g= 50.0},
            [2] = {a= -696.98, b= -1247.41, c= 41.84, d= -7.35,  e= 0.00, f= -96.55,  g= 50.0},
 
        },
        rolerestriction = false,
        rolesallowed = {"none"},
    },
	
	
    [2] = {
        name              = "Fishing Cabin",
		blipenabled       = true,
		blipname          = "Boat Shop",
		blipspritehash    = 2033397166,
        pos               = vector3(340.72314453125, -679.4505615234375, 42.78786849975586),
        boatpos           = vector4(334.0619812011719, -680.0728149414062, 40.27785873413086, 149.0),
        cameracoords  = {
            [1] = {a= 326.72, b= -683.73, c= 42.95, d= -14.04, e= 0.00, f= -67.02,   g= 50.0},
            [2] = {a= 333.46, b= -672.33, c= 41.81, d= -7.24,  e= 0.00, f= -168.82,  g= 50.0},
        },
        rolerestriction = false,
        rolesallowed = {"none"},
    },	
	
	
    [3] = {
        name              = "Rhodes",
		blipenabled       = true,
		blipname          = "Boat Shop",
		blipspritehash    = 2033397166,
        pos               = vector3(618.6934204101562, -1258.929931640625, 41.70939636230469),
        boatpos           = vector4(611.7246704101562, -1261.4630126953125, 40.28900146484375, -150.0),
        cameracoords  = {
            [1] = {a= 611.53, b= -1269.88, c= 42.18, d= -8.11, e= 0.00, f= -0.64,    g= 50.0},
            [2] = {a=604.95,  b= -1257.78, c= 42.18, d= -7.54, e= 0.00, f= -116.54,  g= 50.0},
 
        },
        rolerestriction = false,
        rolesallowed = {"none"},
    },	
	
    [4] = {
        name              = "Braithwaite Manor",
		blipenabled       = true,
		blipname          = "Boat Shop",
		blipspritehash    = 2033397166,
        pos               = vector3(889.109130859375, -1776.858154296875, 42.13712310791015),
        boatpos           = vector4(883.7703857421875, -1773.311767578125, 40.28900146484375, 134.0),
        cameracoords  = {
            [1] = {a= 876.31, b= -1775.11, c= 42.04, d= -8.37, e= 0.00, f= -79.59, g= 50.0},
            [2] = {a= 891.12, b= -1772.55, c= 42.04, d= -8.49, e= 0.00, f= 95.72,  g= 50.0},
 
        },
        rolerestriction = false,
        rolesallowed = {"none"},
    },	
	
    [5] = {
        name              = "Saint Denis",
		blipenabled       = true,
		blipname          = "Boat Shop",
		blipspritehash    = 2033397166,
        pos               = vector3(2099.39599609375, -1813.479248046875, 42.83724594116211),
        boatpos           = vector4(2106.7236328125, -1808.6268310546875, 40.28900146484375, 29.64),
        cameracoords  = {
            [1] = {a= 2100.65, b= -1804.75, c= 42.17, d= -10.81, e= 0.00, f= -118.92, g= 50.0},
            [2] = {a= 2109.62, b= -1802.67, c= 42.17, d= -10.68, e= 0.00, f= 152.58,  g= 50.0},
 
        },
        rolerestriction = false,
        rolesallowed = {"none"},
    },		
	
    [6] = {
        name              = "Saint Denis",
		blipenabled       = true,
		blipname          = "Boat Shop",
		blipspritehash    = 2033397166,
        pos               = vector3(2705.311279296875, -1531.4652099609375, 44.15935134887695),
        boatpos           = vector4(2705.40380859375, -1540.546875, 40.28900146484375, -88.0),
        cameracoords  = {
            [1] = {a= 2712.35, b= -1545.69, c= 43.15, d= -14.25, e= 0.00, f= 49.77,    g= 50.0},
            [2] = {a= 2699.72, b= -1535.71, c= 41.63, d= -6.57,  e= 0.00, f= -131.20,  g= 50.0},
 
        },
        rolerestriction = false,
        rolesallowed = {"none"},
    },	


    [7] = {
        name              = "Bayou",
		blipenabled       = true,
		blipname          = "Boat Shop",
		blipspritehash    = 2033397166,
        pos               = vector3(2006.1168212890625, -763.5479736328125, 41.89657211303711),
        boatpos           = vector4(1999.0391845703125, -768.0284423828125, 40.22723388671875, 38.62),
        cameracoords  = {
            [1] = {a= 1990.96, b= -766.50, c= 42.16, d= -8.79, e= 0.00, f= -98.68, g= 50.0},
            [2] = {a= 1999.26, b= -777.15, c= 42.16, d= -7.85, e= 0.00, f= -0.22,  g= 50.0},
 
        },
        rolerestriction = false,
        rolesallowed = {"none"},
    },	


    [8] = {
        name              = "Caliga Hall",
		blipenabled       = true,
		blipname          = "Boat Shop",
		blipspritehash    = 2033397166,
        pos               = vector3(1822.51953125, -1201.97802734375, 42.17754745483398),
        boatpos           = vector4(1818.4486083984375, -1200.5496826171875, 40.28900146484375, 145.0),
        cameracoords  = {
            [1] = {a= 1817.90, b= -1210.14, c= 42.14, d= -5.79, e= 0.00, f= -2.64,   g= 50.0},
            [2] = {a= 1810.85, b= -1203.52, c= 42.14, d= -5.98, e= 0.00, f= -70.86,  g= 50.0},
 
        },
        rolerestriction = false,
        rolesallowed = {"none"},
    },	


    [9] = {
        name              = "Inbred Village",
		blipenabled       = true,
		blipname          = "Boat Shop",
		blipspritehash    = 2033397166,
        pos               = vector3(2492.201171875, 796.4385375976562, 67.29804229736328),
        boatpos           = vector4(2487.470703125, 800.0858764648438, 65.98895263671875, 140.0),
        cameracoords  = {
            [1] = {a= 2478.92, b= 797.69, c= 67.59, d= -9.87, e= 0.00, f= -78.41, g= 50.0},
            [2] = {a= 2487.25, b= 791.67, c= 67.59, d= -7.41, e= 0.00, f= 1.59,   g= 50.0},
 
        },
        rolerestriction = false,
        rolesallowed = {"none"},
    },		
	
	
        [10] = {
        name              = "Wapiti Reservation",
		blipenabled       = true,
		blipname          = "Boat Shop",
		blipspritehash    = 2033397166,
        pos               = vector3(630.3692626953125, 2198.90869140625, 221.8800811767578),
        boatpos           = vector4(640.92431640625, 2195.98779296875, 220.40476989746094, 77.09),
        cameracoords  = {
            [1] = {a= 633.67, b= 2193.05, c= 221.77, d= -2.45, e= 0.00, f= -67.18,  g= 50.0},
            [2] = {a= 641.93, b= 2203.94, c= 221.77, d= -2.01, e= 0.00, f= 166.33,  g= 50.0},
    
        },
        rolerestriction = false,
        rolesallowed = {"none"},
    },
	
	
	    [11] = {
        name              = "San Luis River",
		blipenabled       = true,
		blipname          = "Boat Shop",
		blipspritehash    = 2033397166,
        pos               = vector3(-2018.6434326171875, -3047.133056640625, -11.20542335510253),
        boatpos           = vector4(-2015.641845703125, -3052.765625, -12.96368598937988, -70.0),
        cameracoords  = {
            [1] = {a= -2010.18, b= -3044.99, c= -11.14, d= -7.89,  e= 0.00, f= 145.08,  g= 50.0},
            [2] = {a= -2019.83, b= -3060.98, c= -11.14, d= -8.08,  e= 0.00, f= -27.77,  g= 50.0},		
            [3] = {a= -2007.36, b= -3040.06, c= -9.54,  d= -7.77,  e= 0.00, f= 144.89,  g= 50.0},
            [4] = {a= -2023.73, b= -3065.01, c= -9.54,  d= -10.91, e= 0.00, f= -30.73,  g= 50.0},
        },
        rolerestriction = false,
        rolesallowed = {"none"},
    },
	
	    [12] = {
        name              = "Van Horn",
		blipenabled       = true,
		blipname          = "Boat Shop",
		blipspritehash    = 2033397166,
        pos               = vector3(3023.89, 532.15, 42.02),
        boatpos           = vector4(-1359.33, -2324.18, 40.89, 283.39),
        cameracoords  = {
            [1] = {a= 3023.94, b= 527.57, c= 44.13, d= -6.14, e= 0.00, f=   47.18,  g= 70.0},
            [2] = {a= 3023.94, b= 527.57, c= 44.13, d= -6.14, e= 0.00, f=   47.18,  g= 70.0},		
            [3] = {a= 3023.94, b= 527.57, c= 44.13, d= -6.14, e= 0.00, f=   47.18,  g= 70.0},
            [4] = {a= 3023.94, b= 527.57, c= 44.13, d= -6.14, e= 0.00, f=   47.18,  g= 70.0},
        },
        rolerestriction = false,
        rolesallowed = {"none"},
    },
    
    [13] = {
        name              = "Thieves Landing Boats",
		blipenabled       = true,
		blipname          = "Boat Shop",
		blipspritehash    = 2033397166,
        pos               = vector3(-1361.32, -2327.63, 42.85),
        boatpos           = vector4(-1362.67, -2325.34, 40.26, 83.87),
        cameracoords = {
    -- Baseline (unchanged for comparison)
    [1] = {a= -1373.69, b= -2327.18, c= 69.48, d= 278.74, e= 0.00, f= 17.18, g= 70.0},

    -- Zoomed in + right
    [2] = {a= -1368.80, b= -2326.20, c= 69.20, d= 280.50, e= 0.00, f= 18.00, g= 60.0},

    -- Even closer, shoulder-level angle
    [3] = {a= -1367.30, b= -2325.50, c= 68.50, d= 281.00, e= 0.00, f= 16.00, g= 55.0},

    -- Low-angle close-up from right side
    [4] = {a= -1369.10, b= -2324.80, c= 67.50, d= 282.00, e= 0.00, f= 22.00, g= 58.0},
}
,

        rolerestriction = false,
        rolesallowed = {"none"},
    },
 
}
 
-- DONT FORGET TO ALSO ADD THE JOBS IN THE REGISTEREDJOBLABELS TABLE ABOVE AND SET THE STASHLIMIT FOR RSG TO MORE THAN A HOUSAND 

Config.ShopBoats = { 
    [1] = {
        name       = "Steam Boat",
        model      = `boatsteam02x`,
        price      = 1200,
        goldprice  = 0.0, -- THIS IS FOR VORP ONLY 
        jobreq     = false,
        jobs       = {"none"},
		stashlimit = 20, -- THIS IS FOR VORP AND RSG ONLY
		slots      = 20, -- THIS IS FOR RSG ONLY		
    },
	
    [2] = {
        name       = "Canoe",
        model      = `canoe`,
        price      = 120,
		goldprice  = 0.0, -- THIS IS FOR VORP ONLY
        jobreq     = false,
        jobs       = {"none"},
		stashlimit = 20000, -- THIS IS FOR VORP AND RSG ONLY
		slots      = 20, -- THIS IS FOR RSG ONLY		
    },
	
    [3] = {
        name       = "Treetunk Canoe",
        model      = `canoeTreeTrunk`,
        price      = 100,
		goldprice  = 0.0, -- THIS IS FOR VORP ONLY
        jobreq     = false,
        jobs       = {"none"},
		stashlimit = 20, -- THIS IS FOR VORP AND RSG ONLY
		slots      = 20, -- THIS IS FOR RSG ONLY		
    },
	
    [4] = {
        name       = "Keelboat",
        model      = `keelboat`,
        price      = 1300,
		goldprice  = 0.0, -- THIS IS FOR VORP ONLY
        jobreq     = false,
        jobs       = {"none"},
		stashlimit = 20, -- THIS IS FOR VORP AND RSG ONLY
		slots      = 20, -- THIS IS FOR RSG ONLY		
    },
	
    [5] = {
        name       = "Pirogue",
        model      = `pirogue`,
        price      = 320,
		goldprice  = 0.0, -- THIS IS FOR VORP ONLY
        jobreq     = false,
        jobs       = {"none"},
		stashlimit = 20, -- THIS IS FOR VORP AND RSG ONLY
		slots      = 20, -- THIS IS FOR RSG ONLY		
    },
	
    [6] = {
        name       = "Pirogue 2",
        model      = `pirogue2`,
        price      = 300,
		goldprice  = 0.0, -- THIS IS FOR VORP ONLY
        jobreq     = false,
        jobs       = {"none"},
		stashlimit = 20, -- THIS IS FOR VORP AND RSG ONLY
		slots      = 20, -- THIS IS FOR RSG ONLY		
    },
	
    [7] = {
        name       = "Rowboat",
        model      = `rowboat`,
        price      = 670,
		goldprice  = 0.0, -- THIS IS FOR VORP ONLY
        jobreq     = false,
        jobs       = {"none"},
		stashlimit = 20, -- THIS IS FOR VORP AND RSG ONLY
		slots      = 20, -- THIS IS FOR RSG ONLY		
    },
	
    [8] = {
        name       = "Rowboat Swamp",
        model      = `rowboatSwamp`,
        price      = 690,
		goldprice  = 0.0, -- THIS IS FOR VORP ONLY
        jobreq     = false,
        jobs       = {"none"},
		stashlimit = 20, -- THIS IS FOR VORP AND RSG ONLY
		slots      = 20, -- THIS IS FOR RSG ONLY
    },
	
    [9] = {
        name       = "Rowboat Swamp 2",
        model      = `rowboatSwamp02`,
        price      = 690,
		goldprice  = 0.0, -- THIS IS FOR VORP ONLY
        jobreq     = false,
        jobs       = {"none"},
		stashlimit = 20, -- THIS IS FOR VORP AND RSG ONLY
		slots      = 20, -- THIS IS FOR RSG ONLY		
		
    },
}
   
 
Config.Customization = {

    [1] = {
        Name = "Propsets",
 
        [`canoe`] = {
            [1] = {`pg_veh_canoe_01`,"Propset#1", 50},
            [2] = {`pg_veh_canoe_02`,"Propset#2", 50},
            [3] = {"none","Delete Propset", 0},
        },
        [`canoeTreeTrunk`] = {
            [1] = {0,"NOT_AVAILABLE",0},
            [2] = {"none","Delete Propset", 0},
        },
        [`keelboat`] = {
            [1] = {`pg_veh_keelboat_01`,"Propset#1", 50},
            [2] = {`pg_veh_keelboat_02`,"Propset#2", 50},
            [3] = {`pg_veh_keelboat_03`,"Propset#3", 50},
            [4] = {"none","Delete Propset", 0},
        },
	        [`boatsteam02x`] = {
            [1] = {`pg_veh_boatsteam02x_1`,"Propset#1", 50},
            [2] = {"none","Delete Propset", 0},
        },	
		
        [`pirogue2`] = {
            [1] = {`pg_veh_pirogue_01`,"Propset#1", 50},
            [2] = {"none","Delete Propset", 0},
        },
        [`pirogue`] = {
            [1] = {`pg_veh_pirogue_01`,"Propset#1", 50},
            [2] = {"none","Delete Propset", 0},
        },
        [`rowboat`] = {
            [1] = {`pg_veh_rowboat_01`,"Propset#1", 50},
            [2] = {`pg_veh_rowboat_02`,"Propset#2", 50},
            [3] = {`pg_mp_veh_rowboat_supplies01`,"Supplies#1", 50},
            [4] = {`pg_mp_veh_rowboat_supplies02`,"Supplies#2", 50},
            [5] = {`pg_mp_veh_rowboat_supplies03`,"Supplies#3", 50},
            [6] = {`pg_mp_veh_rowboat_supplies04`,"Supplies#4", 50},
            [7] = {"none","Delete Propset", 0},
        },
        [`rowboatSwamp02`] = {
            [1] = {`pg_veh_rowboatswamp_01`,"Propset#1", 50},
            [2] = {`pg_veh_rowboatswamp_02`,"Propset#2", 50},
            [3] = {"none","Delete Propset", 0},
        },
        [`rowboatSwamp`] = {
            [1] = {`pg_veh_rowboatswamp_01`,			"Propset#1", 50},
            [2] = {`pg_veh_rowboatswamp_02`,			"Propset#2", 50},
            [3] = {`pg_mp_veh_rowboatSwamp_supplies01`, "Supplies#1", 50},
            [4] = {`pg_mp_veh_rowboatSwamp_supplies02`, "Supplies#2", 50},
            [5] = {`pg_mp_veh_rowboatSwamp_supplies03`, "Supplies#3", 50},
            [6] = {`pg_mp_veh_rowboatSwamp_supplies04`, "Supplies#4", 50},
            [7] = {"none","Delete Propset", 0},
        },
    },
	
    [2] = {
        Name = "Extras",
        [`canoe`] = {
            [1] = {0,"NOT_AVAILABLE",0},
        },
		
        [`canoeTreeTrunk`] = {
            [1] = {0,"NOT_AVAILABLE",0},
        },
		
        [`boatsteam02x`] = {
            [1] = {0,"NOT_AVAILABLE",0},
        },	
		
        [`keelboat`] = {
            [1] = {5, "Extra#1", 50},
            [2] = {"none", "Remove Extras", 0},
        },
		
        [`pirogue2`] = {
            [1] = {0,"NOT_AVAILABLE",0},
        },
		
        [`pirogue`] = {
            [1] = {0,"NOT_AVAILABLE",0},
        },
		
        [`rowboat`] = {
            [1] = {1, "Extra#1", 50},
            [2] = {"none","Remove Extras", 0},
        },
		
        [`rowboatSwamp02`] = {
            [1] = {5, "Extra#1", 50},
            [2] = {"none","Remove Extras", 0},
        },
		
        [`rowboatSwamp`] = {
            [1] = {5, "Extra#1", 50},
            [2] = {"none","Remove Extras", 0},
        },
    },
	
    [3] = {
        Name = "Lanterns",
        [`canoe`] = {
            [1] = {0,"NOT_AVAILABLE",0},
        },
		
        [`canoeTreeTrunk`] = {
            [1] = {0,"NOT_AVAILABLE",0},
        },
		
        [`boatsteam02x`] = {
            [1] = {0,"NOT_AVAILABLE",0},
        },	
		
        [`keelboat`] = {
            [1] = {`pg_veh_keelboat_lanterns_1`,"Lantern#1", 30},
            [2] = {"none","Remove Lantern", 0},
        },
		
        [`pirogue2`] = {
            [1] = {0,"NOT_AVAILABLE",0},
        },
		
        [`pirogue`] = {
            [1] = {0,"NOT_AVAILABLE",0},
        },
		
        [`rowboat`] = {
            [1] = {`pg_veh_rowboat_lightupgrade_1`,"Lantern#1", 30},
            [2] = {`pg_veh_rowboat_lightupgrade_2`,"Lantern#2", 30},
            [3] = {`pg_veh_rowboat_lightupgrade_3`,"Lantern#3", 30},
            [4] = {"none","Remove Lantern", 0},
        },
		
        [`rowboatSwamp02`] = {
            [1] = {0,"NOT_AVAILABLE",0},
        },
		
        [`rowboatSwamp`] = {
            [1] = {0,"NOT_AVAILABLE",0},
        },
    },
	
    [4] = {
        Name = "Liveries",
        [`canoe`] = {
            [1] = {0,"NOT_AVAILABLE",0},
        },
		
        [`canoeTreeTrunk`] = {
            [1] = {0,"NOT_AVAILABLE",0},
        },
		
        [`boatsteam02x`] = {
            [1] = {0, "Annie May",          30},
            [2] = {1, "Calliope",           30},
            [3] = {2, "La Chuparrosa",      30},
            [4] = {3, "Magicienne",         30},
            [5] = {"none","Remove Liveries", 0},
        },	
		
        [`keelboat`] = {
            [1] = {0,"NOT_AVAILABLE",0},
        },
		
        [`pirogue2`] = {
            [1] = {0,"NOT_AVAILABLE",0},
        },
		
        [`pirogue`] = {
            [1] = {0,"NOT_AVAILABLE",0},
        },
		
        [`rowboat`] = {
            [1] = {0,"NOT_AVAILABLE",0},
        },
		
        [`rowboatSwamp02`] = {
            [1] = {0,"NOT_AVAILABLE",0},
        },
		
        [`rowboatSwamp`] = {
            [1] = {0,"NOT_AVAILABLE",0},
        },
    },
	
    [5] =  {
        Name = "Tints",
        [`boatsteam02x`] = {
            [1] = {0,"Tint#1", 50},
            [2] = {1,"Tint#2", 50},
            [3] = {2,"Tint#3", 50},
            [4] = {3,"Tint#4", 50},
            [5] = {4,"Tint#5", 50},
            [6] = {5,"Tint#6", 50},
            [7] = {"none","Remove Tint", 0},
        },
        [`canoe`] = {
            [1] = {0,"Tint#1", 50},
            [2] = {1,"Tint#2", 50},
            [3] = {2,"Tint#3", 50},
            [4] = {3,"Tint#4", 50},
            [5] = {4,"Tint#5", 50},
            [6] = {"none","Remove Tint", 0},
        },
        [`canoeTreeTrunk`] = {
            [1] = {0,"Tint#1", 50},
            [2] = {"none","Remove Tint", 0},
        },
        [`keelboat`] = {
            [1] = {0,"Tint#1", 50},
            [2] = {1,"Tint#2", 50},
            [3] = {2,"Tint#3", 50},
            [4] = {3,"Tint#4", 50},
            [5] = {4,"Tint#5", 50},
            [6] = {"none","Remove Tint", 0},
        },
        [`pirogue2`] = {
            [1] = {0,"Tint#1", 50},
            [2] = {1,"Tint#2", 50},
            [3] = {2,"Tint#3", 50},
            [4] = {3,"Tint#4", 50},
            [5] = {4,"Tint#5", 50},
            [6] = {5,"Tint#6", 50},
            [7] = {6,"Tint#7", 50},
            [8] = {"none","Remove Tint", 0},
        },
        [`pirogue`] = {
            [1] = {0,"Tint#1", 50},
            [2] = {1,"Tint#2", 50},
            [3] = {2,"Tint#3", 50},
            [4] = {3,"Tint#4", 50},
            [5] = {4,"Tint#5", 50},
            [6] = {5,"Tint#6", 50},
            [7] = {"none","Remove Tint", 0},
        },
        [`rowboat`] = {
            [1] = {0,"Tint#1", 50},
            [2] = {1,"Tint#2", 50},
            [3] = {2,"Tint#3", 50},
            [4] = {3,"Tint#4", 50},
            [5] = {4,"Tint#5", 50},
            [6] = {5,"Tint#6", 50},
            [7] = {6,"Tint#7", 50},
            [8] = {"none","Remove Tint", 0},
        },
        [`rowboatSwamp02`] = {
            [1] = {0,"Tint#1", 50},
            [2] = {1,"Tint#2", 50},
            [3] = {2,"Tint#3", 50},
            [4] = {3,"Tint#4", 50},
            [5] = {4,"Tint#5", 50},
            [6] = {5,"Tint#6", 50},
            [7] = {"none","Remove Tint", 0},
        },
        [`rowboatSwamp`] = {
            [1] = {0,"Tint#1", 50},
            [2] = {1,"Tint#2", 50},
            [3] = {2,"Tint#3", 50},
            [4] = {3,"Tint#4", 50},
            [5] = {4,"Tint#5", 50},
            [6] = {5,"Tint#6", 50},
            [7] = {"none","Remove Tint", 0},
        },
    },
}

 