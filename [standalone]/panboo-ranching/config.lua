Config = {}
lib.locale()

Config.EnableTarget             = true      -- Don't Touch
Config.FadeIn                   = true      -- Don't Touch
Config.DistanceSpawn            = 20.0      -- Distance the NPC will appear/disappear
Config.FeedTimer                = 20        -- How long in minutes until you can feed again!
Config.StorageMaxWeight         = 4000000   -- Ranch Storage Max Weight
Config.StorageMaxSlots          = 100        -- Ranch Storage Slots
Config.CollectionTimer          = 20        -- How often you can collect from animals (minutes)
Config.GrowthAgeForCollection   = 50        -- Percentage of growth before you can start collecting from Animals
Config.GrowthGainedFromFeeding  = 5         -- Percentile of growth gained from Feeding
Config.GrowthWhenHerding        = 1         -- Amount of Growth gained when herding/animal following per minute

--Refund for Butchering
Config.CowButcherRefund         = 7
Config.PigButcherRefund         = 5
Config.SheepButcherRefund       = 5
Config.ChickenButcherRefund     = 3

Config.MushroomMin              = 3
Config.MushroomMax              = 6 
Config.MilkMin                  = 3
Config.MilkMax                  = 6
Config.EggMin                   = 3
Config.EggMax                   = 6
Config.WoolMin                  = 3
Config.WoolMax                  = 6
Config.BeefMin                  = 12
Config.BeefMax                  = 18
Config.LeatherMin               = 5
Config.LeatherMax               = 10
Config.AnimalFatMin             = 8
Config.AnimalFatMax             = 12
Config.PorkMin                  = 8
Config.PorkMax                  = 12
Config.MuttonMin                = 8
Config.MuttonMax                = 12
Config.ChickenMeatMin           = 8
Config.ChickenMeatMax           = 12

Config.MilkingItemRequired      = 'farmerbucket'
Config.EggCollectionItem        = 'eggbasket'
Config.SheerSheepItem           = 'shears'
Config.StableCleanupItem        = 'pitchfork'

Config.BeefItem                 = 'beef_meat'
Config.LeatherItem              = 'leather'
Config.AnimalFatItem            = 'animalfat'
Config.MilkItem                 = 'milk'
Config.MushroomItem             = 'consumable_herb_parasol_mushroom'
Config.WoolItem                 = 'sheepwool'
Config.EggItem                  = 'eggs'
Config.SheepItem                = 'sheep_meat'
Config.PorkItem                 = 'pork_meat'
Config.ChickenItem              = 'chicken_meat'

Config.CleanupItemRecieved      = 'animalpoop'

Config.GrainItem                = 'barrel_grain'
Config.GrainItemAmount          = 5
Config.GrainCashReward          = 15

Config.BanditChanceForGrainMission = 20
Config.BanditModels = { `mp_g_m_m_unibanditos_01` }
Config.GrainMissionCooldown = 30

Config.Blip = {
    blipName   = locale('pet_menu_blip'),
    blipSprite = 'blip_shop_horse',
    blipScale  = 0.1
}

Config.ranchShopItems ={
    { name = 'farmerbucket',   amount = 50, price = 5 },
    { name = 'pitchfork', amount = 50, price = 10 },
    { name = 'shears',     amount = 50, price = 2 },
    { name = 'eggbasket',     amount = 50, price = 2 },
}
Config.PersistStock = false

Config.RanchSettings = {
    {
        ranchid = 'ranch1',
        coords     = vec3(-2401.10, -2458.15, 60.17),
        npcmodel   = `u_m_m_bwmstablehand_01`,
        npccoords  = vec4(-2401.10, -2458.15, 60.17, 16.61),
        showblip   = true,
        job        = 'ranch1',
        hayPileLocation = vec3(-2395.88, -2456.68, 60.17),
        butcherLocation = vec4(-3674.49, -2559.08, -13.56, 269.86),
        hayPickupLocation = vec3(-3671.55, -2565.51, -13.66),
        hayDeliveryLocation = vec3(-2408.12, -2434.81, 60.26),
        hayWagonSpawn = vec3(-2388.03, -2440.27, 60.21),
        wagonModel = 'supplywagon',
        hayPerPickup = 1,
        maxHay = 10,
        grainStartCoords = vec3(-2388.03, -2440.27, 60.21),
        grainPickupLocation = vec3(-3561.31, -3036.03, 11.82),
        grainDropOffCoords = vec3(-2388.03, -2440.27, 60.21),
        barrelModel = 'p_barrel04b',
        barrelCount = 5
    },
    {
        ranchid = 'ranch2',
        coords     = vec3(-1594.39, -1411.78, 81.93),
        npcmodel   = `u_m_m_bwmstablehand_01`,
        npccoords  = vec4(-1594.39, -1411.78, 81.93, 240.16),
        showblip   = true,
        job        = 'ranch2',
        hayPileLocation = vec3(-1605.94, -1374.47, 82.97),
        butcherLocation = vec4(-955.74, -1325.16, 52.33, 91.30),
        hayPickupLocation = vec3(-949.35, -1338.55, 50.68),
        hayDeliveryLocation = vec3(-1605.94, -1374.47, 82.97),
        hayWagonSpawn = vec3(-1607.25, -1396.27, 81.95),
        wagonModel = 'supplywagon',
        hayPerPickup = 1,
        maxHay = 10,
        grainStartCoords = vec3(-1607.25, -1396.27, 81.95),
        grainPickupLocation = vec3(-2367.10, -1587.20, 153.66),
        grainDropOffCoords = vec3(-1607.25, -1396.27, 81.95),
        barrelModel = 'p_barrel04b',
        barrelCount = 5
    },
    {
        ranchid = 'ranch4',
        coords     = vec3(1373.23, -840.33, 70.88),
        npcmodel   = `u_m_m_bwmstablehand_01`,
        npccoords  = vec4(1373.23, -840.33, 70.88, 205.24),
        showblip   = true,
        job        = 'ranch4',
        hayPileLocation = vec3(1374.31, -848.58, 70.78),
        butcherLocation = vec4(1401.52, -1291.97, 78.21, 190.30),
        hayPickupLocation = vec3(1218.47, -1278.64, 76.60),
        hayDeliveryLocation = vec3(1374.31, -848.58, 70.78),
        hayWagonSpawn = vec3(1359.67, -860.93, 70.91),
        wagonModel = 'supplywagon',
        hayPerPickup = 1,
        maxHay = 10,
        grainStartCoords = vec3(1359.67, -860.93, 70.91),
        grainPickupLocation = vec3(2247.89, -128.39, 46.33),
        grainDropOffCoords = vec3(1359.67, -860.93, 70.91),
        barrelModel = 'p_barrel04b',
        barrelCount = 5
    },
    {
        ranchid = 'ranch5',
        coords     = vec3(1400.50, 351.42, 87.61),
        npcmodel   = `u_m_m_bwmstablehand_01`,
        npccoords  = vec4(1400.50, 351.42, 87.61, 198.60),
        showblip   = true,
        job        = 'ranch5',
        hayPileLocation = vec3(1389.70, 346.60, 87.57),
        butcherLocation = vec4(481.98, 594.05, 109.50, 172.68),
        hayPickupLocation = vec3(1223.77, -192.52, 101.33),
        hayDeliveryLocation = vec3(1389.70, 346.60, 87.57),
        hayWagonSpawn = vec3(1348.63, 342.08, 87.74),
        wagonModel = 'supplywagon',
        hayPerPickup = 1,
        maxHay = 10,
        grainStartCoords = vec3(1348.63, 342.08, 87.74),
        grainPickupLocation = vec3(1597.13, -255.51, 79.96),
        grainDropOffCoords = vec3(1348.63, 342.08, 87.74),
        barrelModel = 'p_barrel04b',
        barrelCount = 5
    },
    {
        ranchid = 'ranch6',
        coords     = vec3(-2211.30, 708.27, 122.30),
        npcmodel   = `u_m_m_bwmstablehand_01`,
        npccoords  = vec4(-2211.30, 708.27, 122.30, 22.74),
        showblip   = true,
        job        = 'ranch6',
        hayPileLocation = vec3(-2216.48, 719.06, 122.63),
        butcherLocation = vec4(-1297.69, 390.74, 95.63, 243.78),
        hayPickupLocation = vec3(-1292.00, 378.84, 95.23),
        hayDeliveryLocation = vec3(-2216.48, 719.06, 122.63),
        hayWagonSpawn = vec3(-2194.40, 707.57, 122.16),
        wagonModel = 'supplywagon',
        hayPerPickup = 1,
        maxHay = 10,
        grainStartCoords = vec3(-2194.40, 707.57, 122.16),
        grainPickupLocation = vec3(-1316.10, 374.67, 96.29),
        grainDropOffCoords = vec3(-2194.40, 707.57, 122.16),
        barrelModel = 'p_barrel04b',
        barrelCount = 5
    },
    {
        ranchid = 'ranch7',
        coords     = vec3(-5187.35, -2130.22, 12.10),
        npcmodel   = `u_m_m_bwmstablehand_01`,
        npccoords  = vec4(-5187.35, -2130.22, 12.10, 309.47),
        showblip   = true,
        job        = 'ranch7',
        hayPileLocation = vec3(-5202.02, -2147.75, 12.03),
        butcherLocation = vec4(-5522.96, -2908.41, -2.40, 112.77),
        hayPickupLocation = vec3(-5498.61, -2917.29, -2.07),
        hayDeliveryLocation = vec3(-5202.02, -2147.75, 12.03),
        hayWagonSpawn = vec3(-5205.13, -2130.05, 12.33),
        wagonModel = 'supplywagon',
        hayPerPickup = 1,
        maxHay = 10,
        grainStartCoords = vec3(-5205.13, -2130.05, 12.33),
        grainPickupLocation = vec3(-4793.11, -2752.74, -14.84),
        grainDropOffCoords = vec3(-5205.13, -2130.05, 12.33),
        barrelModel = 'p_barrel04b',
        barrelCount = 5
    },
}


Config.AnimalsForSale = {
    cow = {
        label     = "Cow",
        model     = "A_C_Cow",
        price     = 12
    },
    chicken = {
        label     = "Chicken",
        model     = "A_C_Chicken_01",
        price     = 5
    },
    sheep = {
        label     = "Sheep",
        model     = "A_C_Sheep_01",
        price     = 8
    },
    pig = {
        label     = "Pig",
        model     = "A_C_Pig_01",
        price     = 8
    }
}

-- Coords for Poo Piles spawning for cleanup
Config.PooSpawnPoints = {
    ['ranch1'] = {
        vec3(-2404.64, -2451.26, 60.17 + 1),
        vec3(-2414.74, -2447.69, 60.17 + 1),
        vec3(-2416.29, -2459.43, 60.17 + 1),
        vec3(-2413.93, -2470.08, 60.17 + 1),
        vec3(-2408.16, -2462.62, 60.17 + 1)
    },
    ['ranch2'] = {
        vec3(-1590.90, -1421.33, 81.37 + 1),
        vec3(-1585.79, -1427.36, 81.32 + 1),
        vec3(-1581.44, -1416.42, 81.46 + 1),
        vec3(-1573.19, -1418.38, 81.78 + 1),
        vec3(-1573.26, -1429.21, 81.83 + 1)
    },
    ['ranch4'] = { 
        vec3(1366.66, -845.33, 70.92 + 1),
        vec3(1368.72, -849.07, 70.80 + 1),
        vec3(1372.86, -847.11, 70.51 + 1),
        vec3(1379.88, -839.50, 69.59 + 1),
        vec3(1382.59, -844.43, 68.99 + 1)
    },
    ['ranch5'] = { 
        vec3(1390.69, 342.38, 87.56 + 1),
        vec3(1391.46, 334.27, 87.69 + 1),
        vec3(1401.25, 331.89, 88.05 + 1),
        vec3(1407.13, 340.06, 87.97 + 1),
        vec3(1396.34, 338.72, 87.67 + 1)
    },
    ['ranch6'] = { 
        vec3(-2224.86, 715.81, 122.50 + 1),
        vec3(-2226.99, 709.97, 122.25 + 1),
        vec3(-2220.83, 707.13, 122.19 + 1),
        vec3(-2210.81, 716.81, 122.55 + 1),
        vec3(-2199.43, 704.23, 122.05 + 1)
    },
    ['ranch7'] = { 
        vec3(-5181.35, -2145.96, 12.10 + 1),
        vec3(-5187.38, -2142.55, 12.04 + 1),
        vec3(-5198.81, -2133.29, 12.10 + 1),
        vec3(-5218.11, -2132.67, 12.13 + 1),
        vec3(-5200.40, -2119.63, 12.28 + 1)
    },
}

