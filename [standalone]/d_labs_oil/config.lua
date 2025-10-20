
Config = {}

Config.Debug = false			    -- Debug print 

-- !! Attention !! -- 
-- If debug is set to TRUE the /addoil [Number] command is functional for everyone and adds oil to your hand. 

Config.Server = { 
	NotifCustom = false,			-- if you want to use custom notifications in client_open.lua
	CustomFramework = false,    	-- if the framework doesn't load correctly it can be set here manually
	NewFramework = false,			-- http://www.d-labs.site/docs/advantages/framework
	AutoInsertSQL = true,			-- the database should be set automatically 
}

Config.MenuPos = 'top-right'

Config.job = {
    ['jobName'] = 'oilworker',    -- a job that will have access to the faction  (if set to " = false" any job can do the job)
    ['bossjob'] = 'oilworker',    -- If the boss job is also false so everyone can go into management independent of the job 
    ['bossGrade'] = 3,              -- Grade that will have access to refining and management reporting. (It is one rank higher, so if you set this number to 3 and the job also has rank 4, both will have access.)
    ['MaxOilHand'] = 30,            -- the maximum number of units a person can carry.  
    ['MaxOilWagon'] = 200,          -- the maximum number of units a person can put in a carriage.  
}

Config.oilAdd = {                   -- How many units of oil a person can get from one well in one mini-game  
    max = 15,
    min = 5,
}

Config.DeliveryMoneyToBankMultiplier = 0.5  
-- How much money is added to the company's bank (Managment) if for example a person has earned $100 and it's set to 2.0, $200 is added to the bank 
-- (can be turned off by setting false) 

Config.oilContainer = {  -- Oil reservoir settings 
    ['main'] = {         -- The name will be shown in the game and in the database 
        max = 1000,      -- How much data to put in it maximum oil
        coords = {
            [1] = vector4(517.0421, 676.1751, 117.4057, 78.8844), -- Where will the filling places be 
            [2] = vector4(510.3986, 684.6028, 117.4054, 258.7383),
        }
    },     
    ['two'] = {
        max = 800,
        coords = {
            [1] = vector4(508.9977, 669.5988, 117.4055, 246.1340),
            [2] = vector4(471.5928, 704.3591, 117.2859, 355.5984),
        }
    },   
    ['indoor'] = {
        max = 400,
        coords = {
            [1] = vector4(484.5452, 682.6818, 117.3122, 359.8188)
        }
    },   
} 

Config.oilWell = { -- Where oil can be extracted 
    [1] = vector4(596.4569, 568.8530, 111.2001, 46.7950),
    [2] = vector4(549.4611, 597.1443, 111.0589, 133.6905),
    [3] = vector4(598.5527, 650.2181, 115.4066, 19.0127),
}

Config.management = { -- Where are the factory management locations
    [1] = vector3(493.7981, 675.1129, 117.3849),
    [2] = vector3(499.4884, 678.1015, 121.0386)
} 

Config.craftingSpot = { -- Where to create objects  
    [1] = vector4(485.5705, 678.9724, 117.3086, 180.4396),
} 

Config.Crafting = true     -- set whether crafting is enabled to true

Config.craftingItem = {     -- Items for production  
    ['lubricant'] = {       -- Final item 
        craftingTime = 20,  -- How long will it take to make the item (in seconds)
        getAmount = 1,      -- How many does he get at one time
        oilCost = 5,        -- How much oil will be sucked by the production (must be refined) To switch off set to 0 
        ingredients = false, -- What other items will be needed to produce (If set to false it will be disabled)
    },
    ['gun_oil'] = {
        craftingTime = 10,
        getAmount = 1,
        oilCost = 10, 
        ingredients = { 
            [1] = { item = "iron",     amount = 5 },
        },
    },
} 

Config.wagon = { -- Place for removing the wagon into which the oil can then be put 
    [1] = {
        menuCoords = vector3(514.4082, 690.1801, 115.6936),
        wagon = vector4(521.2399, 694.0582, 116.0615, 280.9773)
    },
    [2] = {
        menuCoords = vector3(520.0684, 669.2855, 115.4132),
        wagon = vector4(526.6708, 672.3755, 115.2749, 274.6548)
    }

} 

Config.deliveryMenu = { -- Places where you can call up the menu to import 
    [1] = {
        model = 'casp_coachrobbery_lenny_males_01',
        pos = vector4(467.1895, 709.7669, 116.3544, 106.7737),
        wagon = vector4(463.4265, 713.7100, 116.4859, 346.4091),
    },
    [2] = {
        model = 'casp_coachrobbery_lenny_males_01',
        pos = vector4(449.2293, 705.3129, 116.8705, 278.9009),
        wagon = vector4(445.7423, 700.7540, 116.6361, 88.6763),
    }
}

Config.delivery = { -- Places where oil can be delivered  
    ['New Austin'] = {
        coords = vector3(-3673.5591, -2624.1914, -13.7600),
        distanceMultiplier = 1.9  -- Hight
    },
    ['BlackWater'] = {
        coords = vector3(-860.0507, -1383.3572, 43.5738),
        distanceMultiplier = 1.5 
        -- If set to 1.2, the price of longer distances will be higher.
        -- When set to 1.0, it will be turned off.
        -- If less than 1.0, the price will be lower based on distance.
    },
    ['Valentine'] = {
        coords = vector3(-259.8065, 750.0170, 117.2470),
        distanceMultiplier = 0.5 -- low
    },
    ['Saint Denis'] = {
        coords = vector3(2580.3005, -1405.1378, 46.2745),
        distanceMultiplier = 1.4
    },
}

Config.Prompts = {
    OpenMenu = 0x760A9C6F,
    ShowStatus = 0xE30CD707,

    Container = 0x760A9C6F,
    OilWell = 0x760A9C6F,
    wagon = 0x760A9C6F,

    wagonAdd = 0x6319DB71,
    WagonRemove = 0x05CA7C52,

    jobMenu = 0x760A9C6F,
    jobFinish = 0x760A9C6F,

    craft = 0x760A9C6F,
}

-- list of keys here: https://github.com/mja00/redm-shit/blob/master/nuiweaponspawner/config.lua

Config.FuelItem = {            -- How much fuel is added per item to convert oil to refined  
    ['coal'] = 0.5,            -- 1 fuel = 1 unit of oil 
    ['wood'] = 0.2,
}

Config.oilUnits = 'Gallon'      -- What will the oil unit be called  // bbl / gallon / litre

Config.PriceForGalon = 0.6      -- Oil price per unit  

Config.NpcClear = true          -- will delete hostile NPCs that could kill players

Config.boardingProtection = false   -- to turn off the possibility of boarding a carriage with oil in hand

Config.Texts = {
    wagon = 'Wagon',
    oil = 'Oil',
    add = 'Add ',
    fuel = 'Fuel',
    bank = 'Bank',
    withdraw = 'Withdraw',
    status = 'Status',

    promptBoss = 'Open',
    promptBossDesc = 'Management',
    promptJob = 'Start delivery',
    promptJobDesc = 'Job offers',
    promptJobFinish = 'Submit job',
    promptJobFinishDesc = 'Job location',
    promptCraft = 'Crafting options',
    promptCraftDesc = 'Crafting table',
    promptOilWell = 'Drill oil',
    promptOilWellDesc = 'Oil well',
    promptContainer = 'Fill',
    promptContainerDesc = 'Oil tank',
    promptStats = 'Oil status',

    menuTitleBank = 'Account status',
    menuTitleManagement = 'Management',
    menuTitleCraft = 'Crafting',

    menuRafin = 'Refine',

    menuRafinDesc = 'Start refining',

    menuLock = 'Unlock/Lock',
    menuLockDesc = 'Click to Lock/Unlock',

    menuNoContainer = 'No container available',
    menuClear = 'Clean the tanker',
    menuClearDesc = 'Click to empty tank',
    menuAddFuelDesc = 'Add fuel for refining',
    menuMoneyDesc = 'Withdraw all money from bank',

    menuDeliveryDesc = 'Select delivery size',
    menuDeliverySelectDesc = 'Select from which tank to deliver',
    menuDeliveryLocationDesc = 'Select where to deliver',

    menuCraftSelectDesc = 'Select from which tank to craft',

    notifMoney = 'You withdrew ',
    notifNoMoney = 'No money available',

    notifClear = 'Tank emptied',
    notifEmpty = 'It is empty',
    notifRefined = 'Already refined',
    notifSucRefined = 'Refining successful',
    notifDoneRefined = 'Refining successful',
    notifNoItem = 'You have no items to craft',
    notifFullIs = 'The tank is full, do you want it to explode?',

    notifNoJob = 'You do not have necessary permissions',
    notifMaxOil = 'You cannot add more',
    notifWagonAdd = 'There is ',
    notifWagonMax = 'Cannot fit anymore',
    notifWagonDamage = 'Wagon is damaged',

    notifAddMoney = 'Money withdrawn',
    
    notifAddFuel = 'You added fuel',
    notifNoAddFuel = 'You have no items',

    notifMenuUse = 'Now interacting with the item in front of you',
    notifFullEmpty = "Nothing there, it's empty as new",

    addToHand = 'You have oil ',
    max = 'You cannot add more',
    showOil = 'There is oil in the tank',
    noOil = 'You have no oil',
    lock = 'Locked',
    reffile = 'You filled ',
    refined = 'Refined',
    notRefined = 'Raw',
    typeOfOil = 'Type of oil:',

    noFuel = 'You do not have enough fuel for refining',

    craftDone = 'You finished crafting',

    wagonSpawned = 'Wagon spawned',
    wagonDeSpawned = 'Wagon hidden',

    wagon = 'Wagon ',
    wagonOut = 'Bring out wagon',
    wagonIn = 'Hide wagon',
    wagonDestroyed = 'Your wagon was destroyed, mission failed',
    wagonAway = 'Your wagon is far from delivery',

    jobActive = 'You have an active job',

    deliveryBlip = 'Delivery',

    HTMLSuces = 'Success',
    HTMLSpace = 'Press spacebar',

    oilIn = 'Add',
    oilOut =  'Withdraw',
    recipe = 'Recipe',
    free = 'Free',

    deliveryLow = 'Low',
    deliveryMedium = 'Medium',
    deliveryHigh = 'High',
}


Config.disableMinigame = false -- disables the mini-game and sets anim

Config.disableManagementSystem = {
    active = false,                  -- if you want to turn off all the logic behind the management of the oiler player.
    moneyForOil = 0.05,             -- how much he gets for the oil he puts in the tank
    moneyForDelivery = 50,          -- how much money he gets for delivery +/- distance (Config.delivery)
}



-- ╔════════════════════════════════╗
-- ║   Thank you for purchasing     ║
-- ║          at D-Labs!            ║
-- ║         Visit us at:           ║
-- ║  https://discord.gg/zKBgmBPmyd ║
-- ╚════════════════════════════════╝

