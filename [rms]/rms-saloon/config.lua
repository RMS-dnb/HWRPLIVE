Config = {}

---------------------------------
-- settings
---------------------------------
Config.Keybind         = 'J'
Config.Img             = "rsg-inventory/html/images/"
Config.Money           = 'cash' -- 'cash', 'bank' or 'bloodmoney'
Config.ServerNotify    = true
Config.LicenseRequired = false

---------------------------------
-- rent settings
---------------------------------
Config.MaxSaloons    = 1
Config.RentStartup   = 10000
Config.RentPerHour   = 1
Config.SaloonCronJob = '0 * * * *' -- cronjob runs every hour (0 * * * *)
Config.MaxRent       = 750

---------------------------------
-- storage settings
---------------------------------
Config.BarTrayMaxWeight  = 4000000
Config.BarTrayMaxSlots   = 5
Config.BrewingMaxWeight = 4000000
Config.BrewingMaxSlots  = 48
Config.StockMaxWeight    = 4000000
Config.StockMaxSlots     = 100

---------------------------------
-- npc settings
---------------------------------
Config.DistanceSpawn = 20.0
Config.FadeIn = true

---------------------------------
-- player shop locations
---------------------------------
Config.PlayerSaloonLocations = {
    { 
        name = 'Scarlet Lounge',
        saloonid = 'bassaloon',
        coords = vector3(2639.91, -1224.44, 53.38),
        npcmodel = `u_m_m_valbartender_01`,
        npccoords = vector4(2639.91, -1224.44, 53.38, 90.32),
        jobaccess = 'bassaloon',
        blipname = 'Scarlet Lounge',
        blipsprite = 'blip_saloon',
        blipscale = 0.2,
        showblip = true
    },
    { 
        name = 'The Landing Pub',
        saloonid = 'tlsaloon',
        coords = vec3(-1394.61, -2319.07, 43.65),
        npcmodel = `u_m_m_valbartender_01`,
        npccoords = vec4(-1394.61, -2319.07, 43.65, 12.97),
        jobaccess = 'tlsaloon',
        blipname = 'The Landing Pub',
        blipsprite = 'blip_saloon',
        blipscale = 0.2,
        showblip = true
    },
    { 
        name = 'Valentine Saloon',
        saloonid = 'valsaloon',
        coords = vector3(-313.24, 804.99, 118.98),
        npcmodel = `u_m_m_valbartender_01`,
        npccoords = vector4(-313.24, 804.99, 118.98, 288.54),
        jobaccess = 'valsaloon',
        blipname = 'Valentine Saloon',
        blipsprite = 'blip_saloon',
        blipscale = 0.2,
        showblip = true
    },
    { 
        name = 'Emerald Saloon',
        saloonid = 'emeraldsaloon',
        coords = vector3(1450.97, 369.91, 89.89),
        npcmodel = `u_m_m_valbartender_01`,
        npccoords = vector4(1450.97, 369.91, 89.89, 88.2),
        jobaccess = 'emeraldsaloon',
        blipname = 'Emerald Saloon',
        blipsprite = 'blip_saloon',
        blipscale = 0.2,
        showblip = true
    },
    { 
        name = 'Guarma Saloon',
        saloonid = 'guarmasaloon',
        coords = vector3(1287.55, -6909.17, 44.69),
        npcmodel = `u_m_m_valbartender_01`,
        npccoords = vector4(1287.55, -6909.17, 44.69, 40.69),
        jobaccess = 'guarmasaloon',
        blipname = 'Guarma Saloon',
        blipsprite = 'blip_saloon',
        blipscale = 0.2,
        showblip = true
    },
    { 
        name = 'Saint Denis Ice Cream Shop',
        saloonid = 'sdicecream',
        coords = vector3(2678.24, -1154.42, 50.94),
        npcmodel = `u_m_m_valbartender_01`,
        npccoords = vector4(2678.24, -1154.42, 50.94, 358.5),
        jobaccess = 'sdicecream',
        blipname = 'Saint Denis Ice Cream Shop',
        blipsprite = 'blip_saloon',
        blipscale = 0.2,
        showblip = true
    },
    { 
        name = 'Rhodes Candy Shop',
        saloonid = 'valcandy',
        coords = vector3(1330.49, -1292.92, 77.07),
        npcmodel = `u_m_m_valbartender_01`,
        npccoords = vector4(1330.49, -1292.92, 77.07, 63.06),
        jobaccess = 'valcandy',
        blipname = 'Rhodes Candy Shop',
        blipsprite = 'blip_saloon',
        blipscale = 0.2,
        showblip = true
    },
    { 
        name = 'Annesburg Saloon',
        saloonid = 'annessaloon',
        coords = vector3(2966.1, 1353.62, 44.85),
        npcmodel = `u_m_m_valbartender_01`,
        npccoords = vector4(2966.1, 1353.62, 44.85, 71.96),
        jobaccess = 'annessaloon',
        blipname = 'Annesburg Saloon',
        blipsprite = 'blip_saloon',
        blipscale = 0.2,
        showblip = true
    },
    { 
        name = 'Blackwater Saloon',
        saloonid = 'blasaloon',
        coords = vector3(-817.7, -1320.68, 43.67),
        npcmodel = `u_m_o_blwbartender_01`,
        npccoords = vector4(-817.7, -1320.68, 43.67, 269.46),
        jobaccess = 'blasaloon',
        blipname = 'Blackwater Saloon',
        blipsprite = 'blip_saloon',
        blipscale = 0.2,
        showblip = true
    },
    { 
        name = 'Rhodes Saloon',
        saloonid = 'rhosaloon',
        coords = vector3(1340.2, -1374.68, 80.48),
        npcmodel = `u_m_m_rhdbartender_01`,
        npccoords = vector4(1340.2, -1374.68, 80.48, 261.05),
        jobaccess = 'rhosaloon',
        blipname = 'Rhodes Saloon',
        blipsprite = 'blip_saloon',
        blipscale = 0.2,
        showblip = true
    },
    { 
        name = 'Doyles Saloon',
        saloonid = 'doysaloon',
        coords = vector3(2803.61, -1168.65, 49.03),
        npcmodel = `u_m_m_nbxbartender_02`,
        npccoords = vector4(2803.61, -1168.65, 49.03, 240.66),
        jobaccess = 'doysaloon',
        blipname = 'Doyles Saloon',
        blipsprite = 'blip_saloon',
        blipscale = 0.2,
        showblip = true
    },
    { 
        name = 'Strawberry Saloon',
        saloonid = 'strawsaloon',
        coords = vector3(-1772.5, -374.29, 160.05),
        npcmodel = `u_m_m_nbxbartender_02`,
        npccoords = vector4(-1772.5, -374.29, 160.05, 48.39),
        jobaccess = 'strawsaloon',
        blipname = 'Strawberry Saloon',
        blipsprite = 'blip_saloon',
        blipscale = 0.2,
        showblip = true
    },
    { 
        name = 'Old Light Saloon',
        saloonid = 'oldsaloon',
        coords = vector3(2947.86, 528.11, 45.33),
        npcmodel = `u_f_m_tljbartender_01`,
        npccoords = vector4(2947.86, 528.11, 45.33, 188.35),
        jobaccess = 'oldsaloon',
        blipname = 'Old Light Saloon',
        blipsprite = 'blip_saloon',
        blipscale = 0.2,
        showblip = true
    },
    { 
        name = 'Armadillo Saloon',
        saloonid = 'armsaloon',
        coords = vector3(-3699.75, -2593.42, -13.32),
        npcmodel = `u_m_o_armbartender_01`,
        npccoords = vector4(-3699.75, -2593.42, -13.32, 89.71),
        jobaccess = 'armsaloon',
        blipname = 'Armadillo Saloon',
        blipsprite = 'blip_saloon',
        blipscale = 0.2,
        showblip = true
    },
    { 
        name = 'Tumbleweed Saloon',
        saloonid = 'tumsaloon',
        coords = vector3(-5517.66, -2906.01, -1.71),
        npcmodel = `u_m_m_tumbartender_01`,
        npccoords = vector4(-5517.66, -2906.01, -1.71, 208.52),
        jobaccess = 'tumsaloon',
        blipname = 'Tumbleweed Saloon',
        blipsprite = 'blip_saloon',
        blipscale = 0.2,
        showblip = true
    },
    { 
        name = 'Graverose Saloon',
        saloonid = 'gravesaloon',
        coords = vector3(2713.68, -1288.37, 60.34),
        npcmodel = `u_m_m_tumbartender_01`,
        npccoords = vector4(2713.68, -1288.37, 60.34, 304.45),
        jobaccess = 'graverose',
        blipname = 'The Grave Rose',
        blipsprite = 'blip_bank_debt',
        blipscale = 0.2,
        showblip = true
    },
    { 
        name = 'Elysian Hotel',
        saloonid = 'elysian',
        coords = vector3(2925.07, 527.39, 38.08),
        npcmodel = `u_m_m_tumbartender_01`,
        npccoords = vector4(2925.07, 527.39, 38.08, 351.91),
        jobaccess = 'elysian',
        blipname = 'Elysian Hotel',
        blipsprite = 'blip_bank_debt',
        blipscale = 0.2,
        showblip = false
    },

    { 
        name = 'Casino Boat',
        saloonid = 'casinosaloon',
        coords = vector3(2865.39, -1398.99, 43.58),
        npcmodel = `u_m_m_valbartender_01`,
        npccoords = vector4(2865.39, -1398.99, 43.58, 231.94),
        jobaccess = 'casino',
        blipname = 'Casino Boat',
        blipsprite = 'blip_saloon',
        blipscale = 0.2,
        showblip = true
    },

    --bakery
    { 
        name = 'Armadillo Bakery',
        saloonid = 'armbakery',
        coords = vector3(-3735.17, -2548.93, -12.99),
        npcmodel = `u_m_m_tumbartender_01`,
        npccoords = vector4(-3735.17, -2548.93, -12.99, 274.07),
        jobaccess = 'armbakery',
        blipname = 'Armadillo Bakery',
        blipsprite = 'blip_bank_debt',
        blipscale = 0.2,
        showblip = false
    },

    -- Tobacco Businesses
    { 
        name = 'Blackwater Tobacco',
        saloonid = 'bwtobacco',
        coords = vector3(-780.71, -1314.89, 43.72),
        npcmodel = `u_m_m_tumbartender_01`,
        npccoords = vector4(-780.71, -1314.89, 43.72, 3.52),
        jobaccess = 'bwtobacco',
        blipname = 'Blackwater Tobacco',
        blipsprite = 'blip_bank_debt',
        blipscale = 0.2,
        showblip = false
    },
    { 
        name = 'Rhodes Tobacco',
        saloonid = 'rhotobacco',
        coords = vector3(1345.64, -1326.41, 77.78),
        npcmodel = `u_m_m_tumbartender_01`,
        npccoords = vector4(1345.64, -1326.41, 77.78, 317.04),
        jobaccess = 'rhotobacco',
        blipname = 'Rhodes Tobacco',
        blipsprite = 'blip_bank_debt',
        blipscale = 0.2,
        showblip = false
    },
    -- Undertakers
    { 
        name = 'Saint Denis Undertaker',
        saloonid = 'stdundertaker',
        coords = vector3(2764.84, -1121.13, 56.74),
        npcmodel = `u_m_m_tumbartender_01`,
        npccoords = vector4(2764.84, -1121.13, 56.74, 273.25),
        jobaccess = 'stdundertaker',
        blipname = 'Saint Denis Undertaker',
        blipsprite = 'blip_bank_debt',
        blipscale = 0.2,
        showblip = false
    },

    { 
        name = 'Guarma Saloon',
        saloonid = 'guarmasaloon',
        coords = vector3(1287.55, -6909.17, 44.69),
        npcmodel = `u_m_m_valbartender_01`,
        npccoords = vector4(1287.55, -6909.17, 44.69, 40.69),
        jobaccess = 'guarmasaloon',
        blipname = 'Guarma Saloon',
        blipsprite = 'blip_saloon',
        blipscale = 0.2,
        showblip = true
    },
}

---------------------------------
----------------------------------
Config.SaloonCrafting = {
    -- drinks
     {
         category = 'Drinks',
         crafttime = 30000,
         ingredients = { 
             [1] = { item = 'malt',   amount = 1 },
             [2] = { item = 'hops',   amount = 1 },
             [3] = { item = 'yeast',  amount = 1 },
             [4] = { item = 'water',  amount = 1 },
             [5] = { item = 'bottle', amount = 1 },
         },
         receive = 'beer',
         giveamount = 1
     },
     {
         category = 'Drinks',
         crafttime = 30000,
         ingredients = { 
             [1] = { item = 'refinedsugar',   amount = 3 },
             [2] = { item = 'water',   amount = 3 },
             [3] = { item = 'consumable_herb_evergreen_huckleberry',  amount = 3 },
             [4] = { item = 'rasberry',  amount = 3 },
             [5] = { item = 'blueberry', amount = 3 },
         },
         receive = 'wildberryjuice',
         giveamount = 2
     },
     {
         category = 'Drinks',
         crafttime = 30000,
         ingredients = { 
             [1] = { item = 'consumable_herb_wild_mint',   amount = 1 },
             [2] = { item = 'tealeaves',   amount = 1 },
             [3] = { item = 'refinedsugar',  amount = 1 },
             [4] = { item = 'water',  amount = 1 },
             [5] = { item = 'blueberry', amount = 3 },
         },
         receive = 'minttea',
         giveamount = 1
     },
     {
         category = 'Drinks',
         crafttime = 30000,
         ingredients = { 
             [1] = { item = 'wheat',   amount = 1 },
             [2] = { item = 'water',   amount = 1 },
             [3] = { item = 'yeast',  amount = 1 },
             [4] = { item = 'refinedsugar',  amount = 1 },
         },
         receive = 'whisky',
         giveamount = 1
     },
     
 
     -- food
     {
         category = 'Food',
         crafttime = 30000,
         ingredients = { 
             [1] = { item = 'biggamemeat', amount = 2 },
             [2] = { item = 'carrot',   amount = 1 },
             [3] = { item = 'broccoli', amount = 1 },
             [4] = { item = 'potato',   amount = 1 },
             [5] = { item = 'water',    amount = 1 },
         },
         receive = 'stew',
         giveamount = 2
     },
     {
         category = 'Food',
         crafttime = 30000,
         ingredients = { 
             [1] = { item = 'bird_meat', amount = 1 },
             [2] = { item = 'pork_meat',   amount = 1 },
             [3] = { item = 'onion', amount = 1 },
             [4] = { item = 'flour',   amount = 1 },
             [5] = { item = 'water',    amount = 1 },
         },
         receive = 'gumbo',
         giveamount = 2
     },
     {
         category = 'Food',
         crafttime = 30000,
         ingredients = { 
             [1] = { item = 'potato', amount = 2 },
             [2] = { item = 'cookingoil',   amount = 1 },
             [3] = { item = 'salt', amount = 1 },
         },
         receive = 'fries',
         giveamount = 2
     },

    }