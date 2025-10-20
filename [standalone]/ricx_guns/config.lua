Config = {}
Config.RefreshRate = 5
Config.framework = "rsg" --"redemrp" or "redemrp-reboot" or "rsg"
Config.menubase = "redemrp_menu_base"

Config.menuposition = "top-right"

Config.Marker = {
    r = 250,
    g = 0, 
    b = 0, 
    a = 100,
    size = {0.0, 0.0, 0.0},
}

Config.Preview = false --if true then players can open the buy menu and preview the weapon

Config.Prompts = {
    Open = 0xD8F73058,
    Customize = 0x6D1319BE,
    Rotate = 0x6D1319BE,
}

Config.Texts = {
    Open = "Open",
    Customize = "Customize",
    Rotate = "Rotate",
    --TEXTS
    NoJob = "You dont have the required job!",
    NoWeapons = "You dont have any weapon!",
    NoMoney = "You dont have enough money!",
    Preview = "Preview",
    PriceD = "Price:",
    Products = "Products",
    CustomizeD = "Customize",
    RemoveCart = "Remove from Cart",
    ComponentsD = "Components:",
    Gun = "Gun",
    BuyProducts = "Buy Products",
    CartD = "Shopping Cart:",
    Items = "Items:",
    Cart = "Shopping Cart",
    RemoveProducts = "Remove Products",
    GetIt = "Get it",
    BuyWeapon = "Buy Weapon",
}

Config.Textures = {
    cross = {"scoretimer_textures", "scoretimer_generic_cross"},
    locked = {"menu_textures","stamp_locked_rank"},
    tick = {"scoretimer_textures","scoretimer_generic_tick"},
    money = {"inventory_items", "money_moneystack"},
    alert = {"menu_textures", "menu_icon_alert"},
}

Config.WeaponShops = {
    -- [1] = {
    --     name = "Blackwater Handguns",
    --     pos = {x = -771.8661, y = -1325.09, z = 42.64}, 
    --     weaponpos = {x = -771.0421, y = -1324.8796, z = 43.95},
    --     heading = 90.0,
    --     weaponIDs = {1, 2, 4, 5, 6, 7, 8, 9, 10, 27, 32, 33}, -- IDs from WeaponShopItems array | ID 1 is Cattleman Revolver by default
    --     jobs = {"gunsmith"},--for no job: "jobs = false,"
    --     tax = 25, -- +25%
    --     blip = {enable = true, sprite = -1052367340},
    -- },
    [1] = {
        name = "Blackwater Gun Customization",
        pos = vector3(-789.2608, -1298.528, 47.421169), 
        weaponpos = vector3(-790.12, -1298.28, 48.00),
        heading = 91.0,
        weaponIDs = {1, 2, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 34, 20, 21, 22, 23, 24, 25, 27, 32},
        jobs = {"blkgunsmith"},--for no job: "jobs = false,"
        tax = 25, -- +25%
        blip = {enable = false, sprite = -1052367340},
    },  

    -- [2] = {
    --     name = "Army Guns",
    --     pos = {x = -4184.839, y = -3432.803, z = 36.137},
    --     weaponpos = {x = -4184.094, y = -3432.708, z = 37.252},
    --     heading = 90.0,
    --     weaponIDs = {11, 12, 13, 14, 15, 16, 17, 18, 19, 34, 20, 21, 22, 23, 24, 25, 26},
    --     jobs = {"gunsmith"},--for no job: "jobs = false,"
    --     tax = 25, -- +25%
    --     blip = {enable = true, sprite = -995686252},
    -- },
    -- [3] = {
        
    --     name = "Knife Shop",
    --     pos = {x = -1992.637, y = -1606.564, z = 117.22},
    --     weaponpos = {x = -1993.124, y = -1605.808, z = 118.017},
    --     heading = 90.0,
    --     weaponIDs = {27, 28, 29, 30, 31},
    --     jobs = {"gunsmith"},--for no job: "jobs = false,"
    --     tax = 25,
    --     blip = {enable = false, sprite = 501323084},
    -- },
    [2] = {
        name = "Tumbleweed Gun Customization",
        pos = vector3(-5505.866, -2966.054, -0.639463),
        weaponpos = vector3(-5506.648, -2966.821, -0.428277),
        heading = 105.0,
        weaponIDs = {1, 2, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 34, 20, 21, 22, 23, 24, 25, 27, 32},
        jobs = {"tumgunsmith"},--for no job: "jobs = false,"
        tax = 25,
        blip = {enable = false, sprite = -995686252},
    },
    [3] = {
        name = "Valentine Gun Customization",
        pos = vector3(-277.1724, 779.14928, 119.50397), 
        weaponpos = vector3(-276.1592, 778.3988, 119.74199),
        heading = 90.0,
        weaponIDs =  {1, 2, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 34, 20, 21, 22, 23, 24, 25, 27, 32},
        jobs = {"valgunsmith"},--for no job: "jobs = false,"
        tax = 25, -- +25%
        blip = {enable = false, sprite = -1052367340},
    },
    [4] = {
        name = "Saint Denis Gun Customization",
        pos = vector3(2710.6459, -1287.623, 49.636459), 
        weaponpos = vector3(2710.1592, -1288.00, 50.004474),
        heading = 128.0,
        weaponIDs = {1, 2, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 34, 20, 21, 22, 23, 24, 25, 27, 32},
        jobs = {"stdgunsmith"},--for no job: "jobs = false,"
        tax = 25, -- +25%
        blip = {enable = false, sprite = -995686252},
    },
    [5] = {
        name = "Annesburg Gun Customization",
        pos = vector3(2950.5258, 1314.7327, 44.820285), 
        weaponpos = vector3(2950.3083, 1314.3168, 45.165924),
        heading = 160.0,
        weaponIDs = {1, 2, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 34, 20, 21, 22, 23, 24, 25, 27, 32},
        jobs = {"anngunsmith"},--for no job: "jobs = false,"
        tax = 25, -- +25%
        blip = {enable = false, sprite = -1052367340},
    },
    [6] = {
        name = "Rhodes Gun Customization",
        pos = vector3(1327.1313, -1322.056, 77.888931), 
        weaponpos = vector3(1326.60, -1321.94, 78.10),
        heading = 91.0,
        weaponIDs = {1, 2, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 34, 20, 21, 22, 23, 24, 25, 27, 32}, -- IDs from WeaponShopItems array | ID 1 is Cattleman Revolver by default
        jobs = {"rhogunsmith"},--for no job: "jobs = false,"
        tax = 25, -- +25%
        blip = {enable = false, sprite = -1052367340},
    },
    [7] = {
        name = "Van Horn Gun Customization",
        pos = vector3(2980.28, 496.25, 42.2), 
        weaponpos = vector3(2980.56, 495.58, 42.30),
        heading = 189.0,
        weaponIDs = {1, 2, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 34, 20, 21, 22, 23, 24, 25, 27, 32}, -- IDs from WeaponShopItems array | ID 1 is Cattleman Revolver by default
        jobs = {"vangunsmith"},--for no job: "jobs = false,"
        tax = 25, -- +25%
        blip = {enable = false, sprite = -1052367340},
    },
    [8] = {
        name = "Strawberry Gun Customization",
        pos = vector3(-1843.8, -415.9, 161.36), 
        weaponpos = vector3(-1843.80, -414.55, 161.40),
        heading = 63.0,
        weaponIDs = {1, 2, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 34, 20, 21, 22, 23, 24, 25, 27, 32}, -- IDs from WeaponShopItems array | ID 1 is Cattleman Revolver by default
        jobs = {"strawgunsmith"},--for no job: "jobs = false,"
        tax = 25, -- +25%
        blip = {enable = false, sprite = -1052367340},
    },
    [9] = {
        name = "Armadillo Gun Customization",
        pos = vector3(-3677.49, -2598.76, -13.29), 
        weaponpos = vector3(-3676.69, -2598.79, -12.80618980407714),
        heading = 273.0,
        weaponIDs = {1, 2, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 34, 20, 21, 22, 23, 24, 25, 27, 32}, -- IDs from WeaponShopItems array | ID 1 is Cattleman Revolver by default
        jobs = {"armagunsmith"},--for no job: "jobs = false,"
        tax = 25, -- +25%
        blip = {enable = false, sprite = -1052367340},
    },
    -- [7] = {
        
    --     name = "Knife Shop",
    --     pos = {x = -1992.637, y = -1606.564, z = 117.22},
    --     weaponpos = {x = -1993.124, y = -1605.808, z = 118.017},
    --     heading = 90.0,
    --     weaponIDs = {27, 28, 29, 30, 31},
    --     jobs = {"valgunsmith"},--for no job: "jobs = false,"
    --     tax = 25,
    --     blip = {enable = false, sprite = 501323084},
    -- },
     


    
}

Config.CustomizeComps = {
    [`WEAPON_REVOLVER_CATTLEMAN`] = {"Cattleman", "ShortArm"},
    [`WEAPON_REVOLVER_DOUBLEACTION`] = {"DoubleAction", "ShortArm"},
    [`WEAPON_REVOLVER_SCHOFIELD`] = {"Schofield", "ShortArm"},
    [`WEAPON_PISTOL_MAUSER`] = {"Mauser", "ShortArm"},
    [`WEAPON_PISTOL_SEMIAUTO`] = {"SemiPistol", "ShortArm"},
    [`WEAPON_PISTOL_VOLCANIC`] = {"Volcanic", "ShortArm"},
    [`WEAPON_PISTOL_M1899`] = {"M1899", "ShortArm"},
    [`WEAPON_REVOLVER_LEMAT`] = {"LeMat", "ShortArm"},
    [`WEAPON_REVOLVER_NAVY`] = {"Navy", "ShortArm"},
    [`WEAPON_REPEATER_CARBINE`] = {"Carbine", "LongArm"},
    [`WEAPON_REPEATER_HENRY`] = {"Henry", "LongArm"},
    [`WEAPON_REPEATER_EVANS`] = {"Evans", "LongArm"},
    [`WEAPON_REPEATER_WINCHESTER`] = {"Winchester", "LongArm"},
    [`WEAPON_BOW_IMPROVED`] = {"ImprovedBow"},
    [`WEAPON_RIFLE_BOLTACTION`] = {"BoltAction", "LongArm"},
    [`WEAPON_RIFLE_SPRINGFIELD`] = {"Springfield", "LongArm"},
    [`WEAPON_RIFLE_ELEPHANT`] = {"Elephant", "LongArm"},
    [`WEAPON_SNIPERRIFLE_CARCANO`] = {"Carcano", "LongArm"},
    [`WEAPON_SNIPERRIFLE_ROLLINGBLOCK`] = {"RollingBlock", "LongArm"},
    [`WEAPON_SHOTGUN_REPEATING`] = {"RepeatingS", "Shotgun", "LongArm"},
    [`WEAPON_SHOTGUN_PUMP`] = {"PumpS", "Shotgun", "LongArm"},
    [`WEAPON_SHOTGUN_DOUBLEBARREL`] = {"DoubleBarrelS", "Shotgun", "LongArm"},
    [`WEAPON_SHOTGUN_SAWEDOFF`] = {"SawedS", "Shotgun", "LongArm"},
    [`WEAPON_SHOTGUN_SEMIAUTO`] = {"SemiAutoS", "Shotgun", "LongArm"},
    [`WEAPON_RIFLE_VARMINT`] = {"Varmint", "LongArm"},
    [`WEAPON_BOW`] = {},
    [`WEAPON_MELEE_KNIFE`] = {"Blades"},
    [`WEAPON_MELEE_KNIFE_JAWBONE`] = {"Blades2"},
    [`WEAPON_MELEE_KNIFE_TRADER`] = {"Blades2"},
    [`WEAPON_MELEE_KNIFE_HORROR`] = {"Blades2"},
    [`WEAPON_MELEE_KNIFE_RUSTIC`] = {"Blades2"},
    [`WEAPON_REVOLVER_CATTLEMAN_MEXICAN`] = {},
    [`WEAPON_REVOLVER_DOUBLEACTION_GAMBLER`] = {},
    [`WEAPON_REVOLVER_NAVY_CROSSOVER`] = {},
    [`WEAPON_SHOTGUN_DOUBLEBARREL_EXOTIC`] = {"LongArm"},
}

Config.WeaponShopItems = { --ID of weapons:
    [1] = {
        name = "Bow",
        model = `WEAPON_BOW`,
        itemname = "WEAPON_BOW",
        price = 100,
        jobs = {"valgunsmith"},
        ComponentsLists = {},
        ComponentPriceModifier = 1.3,
    },
    -- [2] = {
    --     name = "Double-Action Revolver",
    --     model = `WEAPON_REVOLVER_DOUBLEACTION`,
    --     itemname = "WEAPON_REVOLVER_DOUBLEACTION",
    --     price = 40,
    --     jobs = {"gunsmith"},
    --     ComponentsLists = {"DoubleAction", "ShortArm"},
    --     ComponentPriceModifier = 1.07,
    -- },
    -- [3] = {
    --     name = "Navy Crossover",
    --     model = `WEAPON_REVOLVER_NAVY_CROSSOVER`,
    --     itemname = "WEAPON_REVOLVER_NAVY_CROSSOVER",
    --     price = 200,
    --     jobs = {"gunsmith"},
    --     ComponentsLists = {},
    --     ComponentPriceModifier = 1.5,
    -- },
    -- [4] = {
    --     name = "Schofield Revolver",
    --     model = `WEAPON_REVOLVER_SCHOFIELD`,
    --     itemname = "WEAPON_REVOLVER_SCHOFIELD",
    --     price = 70,
    --     jobs = {"gunsmith"},
    --     ComponentsLists = {"Schofield", "ShortArm"},
    --     ComponentPriceModifier = 1.1,
    -- },
    -- [5] = {
    --     name = "Mauser Pistol",
    --     model = `WEAPON_PISTOL_MAUSER`,
    --     itemname = "WEAPON_PISTOL_MAUSER",
    --     price = 70,
    --     jobs = {"gunsmith"},
    --     ComponentsLists = {"Mauser", "ShortArm"},
    --     ComponentPriceModifier = 1.15,
    -- },
    -- [6] = {
    --     name = "Semi-Auto Pistol",
    --     model = `WEAPON_PISTOL_SEMIAUTO`,
    --     itemname = "WEAPON_PISTOL_SEMIAUTO",
    --     price = 100,
    --     jobs = {"gunsmith"},
    --     ComponentsLists = {"SemiPistol", "ShortArm"},
    --     ComponentPriceModifier = 1.25,
    -- },
    -- [7] = {
    --     name = "Volcanic Pistol",
    --     model = `WEAPON_PISTOL_VOLCANIC`,
    --     itemname = "WEAPON_PISTOL_VOLCANIC",
    --     price = 100,
    --     jobs = {"gunsmith"},
    --     ComponentsLists = {"Volcanic", "ShortArm"},
    --     ComponentPriceModifier = 1.25,
    -- },
    -- [8] = {
    --     name = "M1899 Pistol",
    --     model = `WEAPON_PISTOL_M1899`,
    --     itemname = "WEAPON_PISTOL_M1899",
    --     price = 200,
    --     jobs = {"gunsmith"},
    --     ComponentsLists = {"M1899", "ShortArm"},
    --     ComponentPriceModifier = 1.5,
    -- },
    -- [9] = {
    --     name = "LeMat Revolver",
    --     model = `WEAPON_REVOLVER_LEMAT`,
    --     itemname = "WEAPON_REVOLVER_LEMAT",
    --     price = 150,
    --     jobs = {"gunsmith"},
    --     ComponentsLists = {"LeMat", "ShortArm"},
    --     ComponentPriceModifier = 1.5,
    -- },
    -- [10] = {
    --     name = "Navy Revolver",
    --     model = `WEAPON_REVOLVER_NAVY`,
    --     itemname = "WEAPON_REVOLVER_NAVY",
    --     price = 120,
    --     jobs = {"gunsmith"},
    --     ComponentsLists = {"Navy", "ShortArm"},
    --     ComponentPriceModifier = 1.5,
    -- },
    -- [11] = {
    --     name = "Carbine Repeater",
    --     model = `WEAPON_REPEATER_CARBINE`,
    --     itemname = "WEAPON_REPEATER_CARBINE",
    --     price = 65,
    --     jobs = {"gunsmith"},
    --     ComponentsLists = {"Carbine", "LongArm"},
    --     ComponentPriceModifier = 1.0,
    -- },
    -- [12] = {
    --     name = "Henry Repeater",
    --     model = `WEAPON_REPEATER_HENRY`,
    --     itemname = "WEAPON_REPEATER_HENRY",
    --     price = 90,
    --     jobs = {"gunsmith"},
    --     ComponentsLists = {"Henry", "LongArm"},
    --     ComponentPriceModifier = 1.0,
    -- },
    -- [13] = {
    --     name = "Evans Repeater",
    --     model = `WEAPON_REPEATER_EVANS`,
    --     itemname = "WEAPON_REPEATER_EVANS",
    --     price = 100,
    --     jobs = {"gunsmith"},
    --     ComponentsLists = {"Evans", "LongArm"},
    --     ComponentPriceModifier = 1.0,
    -- },
    -- [14] = {
    --     name = "Winchester Repeater",
    --     model = `WEAPON_REPEATER_WINCHESTER`,
    --     itemname = "WEAPON_REPEATER_WINCHESTER",
    --     price = 85,
    --     jobs = {"gunsmith"},
    --     ComponentsLists = {"Winchester", "LongArm"},
    --     ComponentPriceModifier = 1.0,
    -- },
    -- [15] = {
    --     name = "Improved Bow",
    --     model = `WEAPON_BOW_IMPROVED`,
    --     itemname = "WEAPON_BOW_IMPROVED",
    --     price = 100,
    --     jobs = {"gunsmith"},
    --     ComponentsLists = {"ImprovedBow"},
    --     ComponentPriceModifier = 1.3,
    -- },
    -- [16] = {
    --     name = "Bolt-Action Rifle",
    --     model = `WEAPON_RIFLE_BOLTACTION`,
    --     itemname = "WEAPON_RIFLE_BOLTACTION",
    --     price = 120,
    --     jobs = {"gunsmith"},
    --     ComponentsLists = {"BoltAction", "LongArm"},
    --     ComponentPriceModifier = 1.4,
    -- },
    -- [17] = {
    --     name = "Springfield Rifle",
    --     model = `WEAPON_RIFLE_SPRINGFIELD`,
    --     itemname = "WEAPON_RIFLE_SPRINGFIELD",
    --     price = 120,
    --     jobs = {"gunsmith"},
    --     ComponentsLists = {"Springfield", "LongArm"},
    --     ComponentPriceModifier = 1.35,
    -- },
    -- [18] = {
    --     name = "Elephant Rifle",
    --     model = `WEAPON_RIFLE_ELEPHANT`,
    --     itemname = "WEAPON_RIFLE_ELEPHANT",
    --     price = 200,
    --     jobs = {"gunsmith"},
    --     ComponentsLists = {"Elephant", "LongArm"},
    --     ComponentPriceModifier = 1.55,
    -- },
    -- [19] = {
    --     name = "Rolling-Block Rifle",
    --     model = `WEAPON_SNIPERRIFLE_ROLLINGBLOCK`,
    --     itemname = "WEAPON_SNIPERRIFLE_ROLLINGBLOCK",
    --     price = 220,
    --     jobs = {"gunsmith"},
    --     ComponentsLists = {"RollingBlock", "LongArm"},
    --     ComponentPriceModifier = 1.25,
    -- },
    -- [20] = {
    --     name = "Repating Shotgun",
    --     model = `WEAPON_SHOTGUN_REPEATING`,
    --     itemname = "WEAPON_SHOTGUN_REPEATING",
    --     price = 150,
    --     jobs = {"gunsmith"},
    --     ComponentsLists = {"RepeatingS", "Shotgun", "LongArm"},
    --     ComponentPriceModifier = 1.3,
    -- },
    -- [21] = {
    --     name = "Pump Shotgun",
    --     model = `WEAPON_SHOTGUN_PUMP`,
    --     itemname = "WEAPON_SHOTGUN_PUMP",
    --     price = 150,
    --     jobs = {"gunsmith"},
    --     ComponentsLists = {"PumpS", "Shotgun", "LongArm"},
    --     ComponentPriceModifier = 1.35,
    -- },
    -- [22] = {
    --     name = "Double-Barrel Shotgun",
    --     model = `WEAPON_SHOTGUN_DOUBLEBARREL`,
    --     itemname = "WEAPON_SHOTGUN_DOUBLEBARREL",
    --     price = 150,
    --     jobs = {"gunsmith"},
    --     ComponentsLists = {"DoubleBarrelS", "Shotgun", "LongArm"},
    --     ComponentPriceModifier = 1.22,
    -- },
    -- [23] = {
    --     name = "Sawed-off Shotgun",
    --     model = `WEAPON_SHOTGUN_SAWEDOFF`,
    --     itemname = "WEAPON_SHOTGUN_SAWEDOFF",
    --     price = 125,
    --     jobs = {"gunsmith"},
    --     ComponentsLists = {"SawedS", "Shotgun", "LongArm"},
    --     ComponentPriceModifier = 1.0,
    -- },
    -- [24] = {
    --     name = "Semi-Auto Shotgun",
    --     model = `WEAPON_SHOTGUN_SEMIAUTO`,
    --     itemname = "WEAPON_SHOTGUN_SEMIAUTO",
    --     price = 155,
    --     jobs = {"gunsmith"},
    --     ComponentsLists = {"SemiAutoS", "Shotgun", "LongArm"},
    --     ComponentPriceModifier = 1.4,
    -- },
    -- [25] = {
    --     name = "Varmint Rifle",
    --     model = `WEAPON_RIFLE_VARMINT`,
    --     itemname = "WEAPON_RIFLE_VARMINT",
    --     price = 100,
    --     jobs = {"gunsmith"},
    --     ComponentsLists = {"Varmint", "LongArm"},
    --     ComponentPriceModifier = 1.3,
    -- },
    -- [26] = {
    --     name = "Bow",
    --     model = `WEAPON_BOW`,
    --     itemname = "WEAPON_BOW",
    --     price = 100,
    --     jobs = {"gunsmith"},
    --     ComponentsLists = {},
    --     ComponentPriceModifier = 1.3,
    -- },
    -- [27] = {
    --     name = "Knife",
    --     model = `WEAPON_MELEE_KNIFE`,
    --     itemname = "WEAPON_MELEE_KNIFE",
    --     price = 100,
    --     jobs = {"gunsmith"},
    --     ComponentsLists = {"Blades"},
    --     ComponentPriceModifier = 1.5,
    -- },
    -- [28] = {
    --     name = "Jawbone Knife",
    --     model = `WEAPON_MELEE_KNIFE_JAWBONE`,
    --     itemname = "WEAPON_MELEE_KNIFE_JAWBONE",
    --     price = 100,
    --     jobs = {"gunsmith"},
    --     ComponentsLists = {"Blades2"},
    --     ComponentPriceModifier = 1.5,
    -- },
    -- [29] = {
    --     name = "Trader Knife",
    --     model = `WEAPON_MELEE_KNIFE_TRADER`,
    --     itemname = "WEAPON_MELEE_KNIFE_TRADER",
    --     price = 100,
    --     jobs = {"gunsmith"},
    --     ComponentsLists = {"Blades2"},
    --     ComponentPriceModifier = 1.5,
    -- },
    -- [30] = {
    --     name = "Horror Knife",
    --     model = `WEAPON_MELEE_KNIFE_HORROR`,
    --     itemname = "WEAPON_MELEE_KNIFE_HORROR",
    --     price = 100,
    --     jobs = {"gunsmith"},
    --     ComponentsLists = {"Blades2"},
    --     ComponentPriceModifier = 1.5,
    -- },
    -- [31] = {
    --     name = "Rustic Knife",
    --     model = `WEAPON_MELEE_KNIFE_RUSTIC`,
    --     itemname = "WEAPON_MELEE_KNIFE_RUSTIC",
    --     price = 100,
    --     jobs = {"gunsmith"},
    --     ComponentsLists = {"Blades2"},
    --     ComponentPriceModifier = 1.5,
    -- },
    -- [32] = {
    --     name = "Mexican Cattleman",
    --     model = `WEAPON_REVOLVER_CATTLEMAN_MEXICAN`,
    --     itemname = "WEAPON_REVOLVER_CATTLEMAN_MEXICAN",
    --     price = 100,
    --     jobs = {"gunsmith"},
    --     ComponentsLists = {},
    --     ComponentPriceModifier = 1.5,
    -- },
    -- [33] = {
    --     name = "Gambler Double-Action",
    --     model = `WEAPON_REVOLVER_DOUBLEACTION_GAMBLER`,
    --     itemname = "WEAPON_REVOLVER_DOUBLEACTION_GAMBLER",
    --     price = 100,
    --     jobs = {"gunsmith"},
    --     ComponentsLists = {},
    --     ComponentPriceModifier = 1.5,
    -- },
    -- [34] = {
    --     name = "Carcano Rifle",
    --     model = `WEAPON_SNIPERRIFLE_CARCANO`,
    --     itemname = "WEAPON_SNIPERRIFLE_CARCANO",
    --     price = 180,
    --     jobs = {"gunsmith"},
    --     ComponentsLists = {"Carcano", "LongArm"},
    --     ComponentPriceModifier = 1.45,
    -- },
}

Config.AllComps = {
    Cattleman = {
        [1] = {
            id = "barrel",
            label = "Barrels",
            items = {
                {GetHashKey("COMPONENT_REVOLVER_CATTLEMAN_BARREL_SHORT"), "Short Barrel", 10},
                {GetHashKey("COMPONENT_REVOLVER_CATTLEMAN_BARREL_LONG"), "Long Barrel", 15},
                {GetHashKey("COMPONENT_REVOLVER_CATTLEMAN_BARREL_LEGENDARY"), "Legendary Barrel", 15},
            }
          },
        [2] = {
            id = "grip",
            label = "Grips",
            items = {
                {GetHashKey("COMPONENT_REVOLVER_CATTLEMAN_GRIP"), "Base", 10},
                {GetHashKey("COMPONENT_REVOLVER_CATTLEMAN_GRIP_PEARL"), "Pearl", 10},
                {GetHashKey("COMPONENT_REVOLVER_CATTLEMAN_GRIP_EBONY"), "Ebony", 10},
                {GetHashKey("COMPONENT_REVOLVER_CATTLEMAN_GRIP_IRONWOOD"), "Ironwood", 10},
                {GetHashKey("COMPONENT_REVOLVER_CATTLEMAN_GRIP_GOOD_HONOR"), "Good Honor", 10},
                {GetHashKey("COMPONENT_REVOLVER_CATTLEMAN_GRIP_BURLED"), "Burled", 10},
                {GetHashKey("COMPONENT_REVOLVER_CATTLEMAN_GRIP_LEGENDARY"), "Legendary", 10},
            }
        },
        [3] = {
            id = "sight",
            label = "Sights",
            items = {
                {GetHashKey("COMPONENT_REVOLVER_CATTLEMAN_SIGHT_NARROW"), "Narrow Sight", 10},
                {GetHashKey("COMPONENT_REVOLVER_CATTLEMAN_SIGHT_WIDE"), "Wide Sight", 20},
            }
          },
        [4] = {
            id = "skin",
            label = "Skins",
            items = {
                {GetHashKey("COMPONENT_SHORTARM_ROLE_ENGRAVING_CATTLEMAN_LEGENDARY"), "Legendary Skin", 20},
            }
        },
    },
    DoubleAction = {
        [1] = {
            id = "barrel",
            label = "Barrels",
            items = {
                {GetHashKey("COMPONENT_REVOLVER_DOUBLEACTION_BARREL_SHORT"), "Short Barrel", 10},
                {GetHashKey("COMPONENT_REVOLVER_DOUBLEACTION_BARREL_LONG"), "Long Barrel", 10},
            }
        },
        [2] = {
            id = "grip",
            label = "Grips",
            items = {
                {GetHashKey("COMPONENT_REVOLVER_DOUBLEACTION_GRIP"), "Base", 10},
                {GetHashKey("COMPONENT_REVOLVER_DOUBLEACTION_GRIP_EBONY"), "Ebony", 10},
                {GetHashKey("COMPONENT_REVOLVER_DOUBLEACTION_GRIP_IRONWOOD"), "Ironwood", 10},
                {GetHashKey("COMPONENT_REVOLVER_DOUBLEACTION_GRIP_PEARL"), "Pearl", 10},
                {GetHashKey("COMPONENT_REVOLVER_DOUBLEACTION_GRIP_BAD_HONOR"), "Bad Honor", 10},
                {GetHashKey("COMPONENT_REVOLVER_DOUBLEACTION_GRIP_BURLED"), "Burled", 10},
            }
        },
        [3] = {
            id = "sight",
            label = "Sights",
            items = {
                {GetHashKey("COMPONENT_REVOLVER_DOUBLEACTION_SIGHT_WIDE"), "Wide", 10},
                {GetHashKey("COMPONENT_REVOLVER_DOUBLEACTION_SIGHT_NARROW"), "Narrow", 10},
            }
        },
    },
    Schofield = {
        [1] = {
            id = "barrel",
            label = "Barrels",
            items = {
                {GetHashKey("COMPONENT_REVOLVER_SCHOFIELD_BARREL_SHORT"), "Short Barrel", 10},
                {GetHashKey("COMPONENT_REVOLVER_SCHOFIELD_BARREL_LONG"), "Long Barrel", 10},
                {GetHashKey("COMPONENT_REVOLVER_SCHOFIELD_BARREL_BOUNTY"), "Bounty Barrel", 10},
            }
        },
        [2] = {
            id = "grip",
            label = "Grips",
            items = {
                {GetHashKey("COMPONENT_REVOLVER_SCHOFIELD_GRIP"), "Basic", 10},
                {GetHashKey("COMPONENT_REVOLVER_SCHOFIELD_GRIP_PEARL"), "Pearl", 10},
                {GetHashKey("COMPONENT_REVOLVER_SCHOFIELD_GRIP_IRONWOOD"), "Ironwood", 10},
                {GetHashKey("COMPONENT_REVOLVER_SCHOFIELD_GRIP_EBONY"), "Ebony", 10},
                {GetHashKey("COMPONENT_REVOLVER_SCHOFIELD_GRIP_BOUNTY"), "Bounty", 10},
                {GetHashKey("COMPONENT_REVOLVER_SCHOFIELD_GRIP_BURLED"), "Burled", 10},
            }
        },
        [3] = {
            id = "sight",
            label = "Sights",
            items = {
                {GetHashKey("COMPONENT_REVOLVER_SCHOFIELD_SIGHT_NARROW"), "Narrow", 10},
                {GetHashKey("COMPONENT_REVOLVER_SCHOFIELD_SIGHT_WIDE"), "Wide", 10},
                {GetHashKey("COMPONENT_REVOLVER_SCHOFIELD_SIGHT_BOUNTY"), "Bounty", 10},
            }
        },
    },
    Mauser = {
        [1] = {
            id = "barrel",
            label = "Barrels",
            items = {
                {GetHashKey("COMPONENT_PISTOL_MAUSER_BARREL_SHORT"), "Short", 10},
                {GetHashKey("COMPONENT_PISTOL_MAUSER_BARREL_LONG"), "Long", 10},
                {GetHashKey("COMPONENT_PISTOL_MAUSER_BARREL_AZTEC"), "Aztec", 10},
            }
        },
        [2] = {
            id = "grip",
            label = "Grips",
            items = {
                {GetHashKey("COMPONENT_PISTOL_MAUSER_GRIP"), "Grip", 10},
                {GetHashKey("COMPONENT_PISTOL_MAUSER_GRIP_PEARL"), "Pearl", 10},
                {GetHashKey("COMPONENT_PISTOL_MAUSER_GRIP_EBONY"), "Ebony", 10},
                {GetHashKey("COMPONENT_PISTOL_MAUSER_GRIP_IRONWOOD"), "Ironwood", 10},
                {GetHashKey("COMPONENT_PISTOL_MAUSER_GRIP_BURLED"), "Burled", 10},
                {GetHashKey("COMPONENT_PISTOL_MAUSER_GRIP_AZTEC"), "Aztec", 10},
            }
        },
        [3] = {
            id = "sight",
            label = "Sights",
            items = {
                {GetHashKey("COMPONENT_PISTOL_MAUSER_SIGHT_NARROW"), "Narrow", 10},
                {GetHashKey("COMPONENT_PISTOL_MAUSER_SIGHT_WIDE"), "Wide", 10},
            }
        },
        [4] = { 
            id = "clip",
            label = "Clips",
            items = {
                {GetHashKey("COMPONENT_PISTOL_MAUSER_CLIP"), "Clip", 10},
                {GetHashKey("COMPONENT_PISTOL_MAUSER_CLIP_EMPTY"), "Empty", 10},
            }
        },
        [5] = {
            id = "skin",
            label = "Skins",
            items = {
                {GetHashKey("COMPONENT_SHORTARM_ROLE_ENGRAVING_MAUSER_AZTEC"), "Aztec", 10},
            }
        }
    },
    SemiPistol = {
        [1] = {
            id = "barrel",
            label = "Barrels",
            items = {
                {GetHashKey("COMPONENT_PISTOL_SEMIAUTO_BARREL_SHORT"), "Short Barrel", 10},
                {GetHashKey("COMPONENT_PISTOL_SEMIAUTO_BARREL_LONG"), "LOng Barrel", 10},
            }
        },
        [2] = {
            id = "grip",
            label = "Grips",
            items = {
                {GetHashKey("COMPONENT_PISTOL_SEMIAUTO_GRIP"), "Basic", 10},
                {GetHashKey("COMPONENT_PISTOL_SEMIAUTO_GRIP_PEARL"), "Pearl", 10},
                {GetHashKey("COMPONENT_PISTOL_SEMIAUTO_GRIP_IRONWOOD"), "Ironwood", 10},
                {GetHashKey("COMPONENT_PISTOL_SEMIAUTO_GRIP_EBONY"), "Ebony", 10},
                {GetHashKey("COMPONENT_PISTOL_SEMIAUTO_GRIP_BURLED"), "Burled", 10},
            }
        },
        [3] = {
            id = "sight",
            label = "Sights",
            items = {
                {GetHashKey("COMPONENT_PISTOL_SEMIAUTO_SIGHT_NARROW"), "Narrow", 10},
                {GetHashKey("COMPONENT_PISTOL_SEMIAUTO_SIGHT_WIDE"), "Wide", 10},
            }
        },
        [4] = {
            id = "clip",
            label = "Clips",
            items = {
                {GetHashKey("COMPONENT_PISTOL_SEMIAUTO_CLIP"), "Clip", 10},
            }
        },
    },
    Volcanic = {
        [1] = {
            id = "barrel",
            label = "Barrels",
            items = {
            {GetHashKey("COMPONENT_PISTOL_VOLCANIC_BARREL_SHORT"), "Short Barrel", 10},
            {GetHashKey("COMPONENT_PISTOL_VOLCANIC_BARREL_LONG"), "Long Barrel", 10},
            {GetHashKey("COMPONENT_PISTOL_VOLCANIC_BARREL_COLLECTOR"), "Collector Barrel", 10},
        }
        },
        [2] = {
            id = "grip",
            label = "Grips",
            items = {
                {GetHashKey("COMPONENT_PISTOL_VOLCANIC_GRIP"), "Basic", 10},
                {GetHashKey("COMPONENT_PISTOL_VOLCANIC_GRIP_PEARL"), "Pearl", 10},
                {GetHashKey("COMPONENT_PISTOL_VOLCANIC_GRIP_EBONY"), "Ebony", 10},
                {GetHashKey("COMPONENT_PISTOL_VOLCANIC_GRIP_IRONWOOD"), "Ironwood", 10},
                {GetHashKey("COMPONENT_PISTOL_VOLCANIC_GRIP_COLLECTOR"), "Collector", 10},
                {GetHashKey("COMPONENT_PISTOL_VOLCANIC_GRIP_BURLED"), "Burled", 10},
            }
        },
        [3] = {
            id = "sight",
            label = "Sights",
            items = {
                {GetHashKey("COMPONENT_PISTOL_VOLCANIC_SIGHT_NARROW"), "Narrow", 10},
                {GetHashKey("COMPONENT_PISTOL_VOLCANIC_SIGHT_WIDE"), "Wide", 10},
                {GetHashKey("COMPONENT_PISTOL_VOLCANIC_SIGHT_COLLECTOR"), "Collector", 10},
            }
        },
        [4] = { 
            id = "skin",
            label = "Skins",
            items = {
                {GetHashKey("COMPONENT_SHORTARM_FRAME_ENGRAVING_VOLCANIC_COLLECTOR"), "Collector", 10},
            }
        },

    },
    M1899 = {
        [1] = {
            id = "barrel",
            label = "Barrels",
            items = {
                {GetHashKey("COMPONENT_PISTOL_M1899_BARREL_SHORT"), "Short Barrel", 10},
                {GetHashKey("COMPONENT_PISTOL_M1899_BARREL_LONG"), "Long Barrel", 10},
            }
        },
        [2] = {
            id = "clip",
            label = "Clips",
            items = {
                {GetHashKey("COMPONENT_PISTOL_M1899_CLIP"), "Clip", 10},
            }
        },
        [3] = {
            id = "grip",
            label = "Grips",
            items = {
                {GetHashKey("COMPONENT_PISTOL_M1899_GRIP"), "Basic", 10},
                {GetHashKey("COMPONENT_PISTOL_M1899_GRIP_IRONWOOD"), "Ironwood", 10},
                {GetHashKey("COMPONENT_PISTOL_M1899_GRIP_PEARL"), "Pearl", 10},
                {GetHashKey("COMPONENT_PISTOL_M1899_GRIP_EBONY"), "Ebony", 10},
            }
        },
        [4] = {
            id = "sight",
            label = "Sights",
            items = {
                {GetHashKey("COMPONENT_PISTOL_M1899_SIGHT_NARROW"), "Narrow", 10},
                {GetHashKey("COMPONENT_PISTOL_M1899_SIGHT_WIDE"), "Wide", 10},
            }
        },
    },
    LeMat = {
        [1] = {
            id = "barrel",
            label = "Barrels",
            items = {
                {GetHashKey("COMPONENT_REVOLVER_LEMAT_BARREL_SHORT"), "Short Barrel", 10},
                {GetHashKey("COMPONENT_REVOLVER_LEMAT_BARREL_LONG"), "Long Barrel", 10},
            }
        },
        [2] = {
            id = "grip",
            label = "Grips",
            items = {
                {GetHashKey("COMPONENT_REVOLVER_LEMAT_GRIP"), "Basic", 10},
                {GetHashKey("COMPONENT_REVOLVER_LEMAT_GRIP_PEARL"), "Pearl", 10},
                {GetHashKey("COMPONENT_REVOLVER_LEMAT_GRIP_EBONY"), "Ebony", 10},
                {GetHashKey("COMPONENT_REVOLVER_LEMAT_GRIP_IRONWOOD"), "Ironwood", 10},
            }
        },
        [3] = {
            id = "sight",
            label = "Sights",
            items = {
                {GetHashKey("COMPONENT_REVOLVER_LEMAT_SIGHT_NARROW"), "Narrow", 10},
                {GetHashKey("COMPONENT_REVOLVER_LEMAT_SIGHT_WIDE"), "Wide", 10},
            }
        },
    },
    Navy = {
        [1] = {
            id = "barrel",
            label = "Barrels",
            items = {
                {GetHashKey("COMPONENT_REVOLVER_NAVY_BARREL_SHORT"), "Short Barrel", 10},
                {GetHashKey("COMPONENT_REVOLVER_NAVY_BARREL_LONG"), "Long Barrel", 10},
                {GetHashKey("COMPONENT_REVOLVER_NAVY_BARREL_CROSSOVER"), "Crossover", 10},
            }
        },
        [2] = {
            id = "grip",
            label = "Grips",
            items = {
                {GetHashKey("COMPONENT_REVOLVER_NAVY_GRIP"), "Basic", 10},
                {GetHashKey("COMPONENT_REVOLVER_NAVY_GRIP_IRONWOOD"), "Ironwood", 10},
                {GetHashKey("COMPONENT_REVOLVER_NAVY_GRIP_PEARL"), "Pearl", 10},
                {GetHashKey("COMPONENT_REVOLVER_NAVY_GRIP_EBONY"), "Ebony", 10},
                {GetHashKey("COMPONENT_REVOLVER_NAVY_GRIP_CROSSOVER"), "Crossover", 10},
            }
        },
        [3] = {
            id = "sight",
            label = "Sights",
            items = {
                {GetHashKey("COMPONENT_REVOLVER_NAVY_SIGHT_NARROW"), "Narrow", 10},
                {GetHashKey("COMPONENT_REVOLVER_NAVY_SIGHT_WIDE"), "Wide", 10},
                {GetHashKey("COMPONENT_REVOLVER_NAVY_SIGHT_CROSSOVER"), "Crossover", 10},
            }
        },
    },
    Carbine = {
        [1] = {
            id = "grip",
            label = "Grips",
            items = {
                {GetHashKey("COMPONENT_REPEATER_CARBINE_GRIP"), "Basic", 10},
                {GetHashKey("COMPONENT_REPEATER_CARBINE_GRIP_IRONWOOD"), "Ironwood", 10},
                {GetHashKey("COMPONENT_REPEATER_CARBINE_GRIP_ENGRAVED"), "Engraved", 10},
                {GetHashKey("COMPONENT_REPEATER_CARBINE_GRIP_BURLED"), "Burled", 10},
            }
        },
        [2] = {
            id = "sight",
            label = "Sights",
            items = {
                {GetHashKey("COMPONENT_REPEATER_CARBINE_SIGHT_NARROW"), "Narrow", 10},
                {GetHashKey("COMPONENT_REPEATER_CARBINE_SIGHT_WIDE"), "Wide", 10},
            }
        },
        [3] = {
            id = "clip",
            label = "Clips",
            items = {
                {GetHashKey("COMPONENT_REPEATER_CARBINE_CLIP"), "Clip", 10},
            }
        },
        [4] = {
            id = "tube",
            label = "Tube",
            items = {
                {GetHashKey("COMPONENT_REPEATER_CARBINE_TUBE"), "Tube", 10},
            }
        },
        [5] = {
            id = "wrap",
            label = "Wraps",
            items = {
                {GetHashKey("COMPONENT_REPEATER_CARBINE_WRAP1"), "1", 10},
                {GetHashKey("COMPONENT_REPEATER_CARBINE_WRAP2"), "2", 10},
                {GetHashKey("COMPONENT_REPEATER_CARBINE_WRAP3"), "3", 10},
                {GetHashKey("COMPONENT_REPEATER_CARBINE_WRAP4"), "4", 10},
                {GetHashKey("COMPONENT_REPEATER_CARBINE_WRAP5"), "5", 10},
                {GetHashKey("COMPONENT_REPEATER_CARBINE_WRAP6"), "6", 10},
            }
        },
    },
    Henry = {
        [1] = {
            id = "grip",
            label = "Grips",
            items = {
            {GetHashKey("COMPONENT_REPEATER_HENRY_GRIP"), "Basic", 10},
            {GetHashKey("COMPONENT_REPEATER_HENRY_GRIP_IRONWOOD"), "Ironwood", 10},
            {GetHashKey("COMPONENT_REPEATER_HENRY_GRIP_ENGRAVED"), "Engraved", 10},
            {GetHashKey("COMPONENT_REPEATER_HENRY_GRIP_BURLED"), "Burled", 10},
            }
        },
        [2] = {
            id = "sight",
            label = "Sights",
            items = {
                {GetHashKey("COMPONENT_REPEATER_HENRY_SIGHT_NARROW"), "Narrow", 10},
                {GetHashKey("COMPONENT_REPEATER_HENRY_SIGHT_WIDE"), "Wide", 10},
            }
        },
        [3] = {
            id = "wrap",
            label = "Wraps",
            items = {
                {GetHashKey("COMPONENT_REPEATER_HENRY_WRAP1"), "1", 10},
                {GetHashKey("COMPONENT_REPEATER_HENRY_WRAP2"), "2", 10},
                {GetHashKey("COMPONENT_REPEATER_HENRY_WRAP3"), "3", 10},
                {GetHashKey("COMPONENT_REPEATER_HENRY_WRAP4"), "4", 10},
                {GetHashKey("COMPONENT_REPEATER_HENRY_WRAP5"), "5", 10},
                {GetHashKey("COMPONENT_REPEATER_HENRY_WRAP6"), "6", 10},
            }
        },
    },
    Evans = {
        [1] = {
            id = "grip",
            label = "Grips",
            items = {
                {GetHashKey("COMPONENT_REPEATER_EVANS_GRIP"), "Basic", 10},
                {GetHashKey("COMPONENT_REPEATER_EVANS_GRIP_IRONWOOD"), "Ironwood", 10},
                {GetHashKey("COMPONENT_REPEATER_EVANS_GRIP_ENGRAVED"), "Engraved", 10},
                {GetHashKey("COMPONENT_REPEATER_EVANS_GRIP_BURLED"), "Burled", 10},
                {GetHashKey("COMPONENT_REPEATER_EVANS_GRIP_WINTER"), "Winter", 10},
            }
        },
        [2] = {
            id = "sight",
            label = "Sights",
            items = {
                {GetHashKey("COMPONENT_REPEATER_EVANS_SIGHT_NARROW"), "Narrow", 10},
                {GetHashKey("COMPONENT_REPEATER_EVANS_SIGHT_WIDE"), "Wide", 10},
            }
        },
        [3] = {
            id = "wrap",
            label = "Wraps",
            items = {
                {GetHashKey("COMPONENT_REPEATER_EVANS_WRAP"), "1", 10},
                {GetHashKey("COMPONENT_REPEATER_EVANS_WRAP2"), "2", 10},
                {GetHashKey("COMPONENT_REPEATER_EVANS_WRAP3"), "3", 10},
                {GetHashKey("COMPONENT_REPEATER_EVANS_WRAP4"), "4", 10},
                {GetHashKey("COMPONENT_REPEATER_EVANS_WRAP5"), "5", 10},
                {GetHashKey("COMPONENT_REPEATER_EVANS_WRAP6"), "6", 10},
                {GetHashKey("COMPONENT_REPEATER_EVANS_WRAP_WINTER"), "7", 10},
            }
        },
        [4] = {
            id = "skin",
            label = "Skins",
            items = {
                {GetHashKey("COMPONENT_LONGARM_ROLE_ENGRAVING_EVANS_WINTER"), "Winter", 10},
            }
        },
    },
    Winchester = {
        [1] = {
            id = "grip",
            label = "Grips",
            items = {
                {GetHashKey("COMPONENT_REPEATER_WINCHESTER_GRIP"), "Basic", 10},
                {GetHashKey("COMPONENT_REPEATER_WINCHESTER_GRIP_IRONWOOD"), "Ironwood", 10},
                {GetHashKey("COMPONENT_REPEATER_WINCHESTER_GRIP_ENGRAVED"), "Engraved", 10},
                {GetHashKey("COMPONENT_REPEATER_WINCHESTER_GRIP_COLLECTOR"), "Collector", 10},
                {GetHashKey("COMPONENT_REPEATER_WINCHESTER_GRIP_BURLED"), "Burled", 10},
            }
        },
        [2] = {
            id = "sight",
            label = "Sights",
            items = {
                {GetHashKey("COMPONENT_REPEATER_WINCHESTER_SIGHT_NARROW"), "Narrow", 10},
                {GetHashKey("COMPONENT_REPEATER_WINCHESTER_SIGHT_WIDE"), "Wide", 10},
            }
        },
        [3] = {
            id = "wrap",
            label = "Wraps",
            items = {
                {GetHashKey("COMPONENT_REPEATER_WINCHESTER_WRAP1"), "1", 10},
                {GetHashKey("COMPONENT_REPEATER_WINCHESTER_WRAP2"), "2", 10},
                {GetHashKey("COMPONENT_REPEATER_WINCHESTER_WRAP3"), "3", 10},
                {GetHashKey("COMPONENT_REPEATER_WINCHESTER_WRAP4"), "4", 10},
                {GetHashKey("COMPONENT_REPEATER_WINCHESTER_WRAP5"), "5", 10},
                {GetHashKey("COMPONENT_REPEATER_WINCHESTER_WRAP6"), "6", 10},
                {GetHashKey("COMPONENT_REPEATER_WINCHESTER_WRAP_COLLECTOR"), "Collector", 10},
            }
        },
        [4] = { 
            id = "skin",
            label = "Skins",
            items = {
                {GetHashKey("COMPONENT_LONGARM_FRAME_ENGRAVING_WINCHESTER_COLLECTOR"), "Collector", 10},
            }
        },
    },
    BoltAction = {
        [1] = {
            id = "grip",
            label = "Grips",
            items = {
                {GetHashKey("COMPONENT_RIFLE_BOLTACTION_GRIP"), "Basic", 10},
                {GetHashKey("COMPONENT_RIFLE_BOLTACTION_GRIP_IRONWOOD"), "Ironwood", 10},
                {GetHashKey("COMPONENT_RIFLE_BOLTACTION_GRIP_ENGRAVED"), "Engraved", 10},
                {GetHashKey("COMPONENT_RIFLE_BOLTACTION_GRIP_BOUNTY"), "Bounty", 10},
                {GetHashKey("COMPONENT_RIFLE_BOLTACTION_GRIP_BURLED"), "Burled", 10},
            }
        },
        [2] = {
            id = "sight",
            label = "Sights",
            items = {
          {GetHashKey("COMPONENT_RIFLE_BOLTACTION_SIGHT_WIDE"), "Wide", 10},
          {GetHashKey("COMPONENT_RIFLE_BOLTACTION_SIGHT_NARROW"), "Narrow", 10},
        }
        },
        [3] = {
            id = "wrap",
            label = "Wraps",
            items = {
          {GetHashKey("COMPONENT_RIFLE_BOLTACTION_WRAP"), "1", 10},
          {GetHashKey("COMPONENT_RIFLE_BOLTACTION_WRAP2"), "2", 10},
          {GetHashKey("COMPONENT_RIFLE_BOLTACTION_WRAP3"), "3", 10},
          {GetHashKey("COMPONENT_RIFLE_BOLTACTION_WRAP4"), "4", 10},
          {GetHashKey("COMPONENT_RIFLE_BOLTACTION_WRAP5"), "5", 10},
          {GetHashKey("COMPONENT_RIFLE_BOLTACTION_WRAP6"), "6", 10},
        }
        },
        [4] = { 
            id = "skin",
            label = "Skins",
            items = {
                {GetHashKey("COMPONENT_LONGARM_FRAME_ENGRAVING_BOLTACTION_BOUNTY"), "Bounty", 10},
            }
        },
    },
    Elephant = {
    	[1] = {
            id = "barrel",
            label = "Barrels",
            items = {
    	  {GetHashKey("COMPONENT_RIFLE_ELEPHANT_BARREL_SHORT"), "Short Barrel", 10},
    	  {GetHashKey("COMPONENT_RIFLE_ELEPHANT_BARREL_LONG"), "Long Barrel", 10},
        }
    	},
        [2] = {
            id = "grip",
            label = "Grips",
            items = {
          {GetHashKey("COMPONENT_RIFLE_ELEPHANT_GRIP"), "Basic", 10},
          {GetHashKey("COMPONENT_RIFLE_ELEPHANT_GRIP_IRONWOOD"), "Ironwood", 10},
          {GetHashKey("COMPONENT_RIFLE_ELEPHANT_GRIP_ENGRAVED"), "Engraved", 10},
          {GetHashKey("COMPONENT_RIFLE_ELEPHANT_GRIP_BURLED"), "Burled", 10},
        }
        },
        [3] = {
            id = "mag",
            label = "Mags",
            items = {
          {GetHashKey("COMPONENT_RIFLE_ELEPHANT_MAG"), "Basic", 10},
          {GetHashKey("COMPONENT_RIFLE_ELEPHANT_MAG_IRONWOOD"), "Ironwood", 10},
          {GetHashKey("COMPONENT_RIFLE_ELEPHANT_MAG_ENGRAVED"), "Engraved", 10},
          {GetHashKey("COMPONENT_RIFLE_ELEPHANT_MAG_BURLED"), "Burled", 10},
        }
        },
        [4] = {
            id = "sight",
            label = "Sights",
            items = {
          {GetHashKey("COMPONENT_RIFLE_ELEPHANT_SIGHT_NARROW"), "Narrow", 10},
          {GetHashKey("COMPONENT_RIFLE_ELEPHANT_SIGHT_WIDE"), "Wide", 10},
        }
        },
        [5] = {
            id = "wrap",
            label = "Wraps",
            items = {
          {GetHashKey("COMPONENT_RIFLE_ELEPHANT_WRAP1"), "1", 10},
          {GetHashKey("COMPONENT_RIFLE_ELEPHANT_WRAP2"), "2", 10},
        }
        },
    },
    Springfield = {
        [1] = {
            id = "grip",
            label = "Grips",
            items = {
          {GetHashKey("COMPONENT_RIFLE_SPRINGFIELD_GRIP"), "Basic", 10},
          {GetHashKey("COMPONENT_RIFLE_SPRINGFIELD_GRIP_IRONWOOD"), "Ironwood", 10},
          {GetHashKey("COMPONENT_RIFLE_SPRINGFIELD_GRIP_ENGRAVED"), "Engraved", 10},
          {GetHashKey("COMPONENT_RIFLE_SPRINGFIELD_GRIP_BURLED"), "Burled", 10},
        }
        },
        [2] = {
            id = "sight",
            label = "Sights",
            items = {
          {GetHashKey("COMPONENT_RIFLE_SPRINGFIELD_SIGHT_NARROW"), "Narrow", 10},
          {GetHashKey("COMPONENT_RIFLE_SPRINGFIELD_SIGHT_WIDE"), "Wide", 10},
        }
        },
        [3] = {
            id = "wrap",
            label = "Wraps",
            items = {
          {GetHashKey("COMPONENT_RIFLE_SPRINGFIELD_WRAP1"), "1", 10},
          {GetHashKey("COMPONENT_RIFLE_SPRINGFIELD_WRAP2"), "2", 10},
          {GetHashKey("COMPONENT_RIFLE_SPRINGFIELD_WRAP3"), "3", 10},
          {GetHashKey("COMPONENT_RIFLE_SPRINGFIELD_WRAP4"), "4", 10},
          {GetHashKey("COMPONENT_RIFLE_SPRINGFIELD_WRAP5"), "5", 10},
          {GetHashKey("COMPONENT_RIFLE_SPRINGFIELD_WRAP6"), "6", 10},
        }
        },
    },  
    Carcano = {
        [1] = {
            id = "grip",
            label = "Grips",
            items = {
                {GetHashKey("COMPONENT_RIFLE_CARCANO_GRIP"), "Basic", 10},
                {GetHashKey("COMPONENT_RIFLE_CARCANO_GRIP_ENGRAVED"), "Engraved", 10},
                {GetHashKey("COMPONENT_RIFLE_CARCANO_GRIP_IRONWOOD"), "Ironwood", 10},
                {GetHashKey("COMPONENT_RIFLE_CARCANO_GRIP_BURLED"), "Burled", 10},
            }
        },
        [2] = {
            id = "sight",
            label = "Sights",
            items = {
                {GetHashKey("COMPONENT_RIFLE_CARCANO_SIGHT_NARROW"), "Narrow", 10},
                {GetHashKey("COMPONENT_RIFLE_CARCANO_SIGHT_WIDE"), "Wide", 10},
            }
        },
        [3] = {
            id = "clip",
            label = "Clips",
            items = {
          {GetHashKey("COMPONENT_RIFLE_CARCANO_CLIP"), "Clip", 10},
          {GetHashKey("COMPONENT_RIFLE_CARCANO_CLIP_EMPTY"), "Empty", 10},
        }
        },
        [4] = {
            id = "wrap",
            label = "Wraps",
            items = {
            {GetHashKey("COMPONENT_RIFLE_CARCANO_WRAP1"), "1", 10},
            {GetHashKey("COMPONENT_RIFLE_CARCANO_WRAP2"), "2", 10},
            {GetHashKey("COMPONENT_RIFLE_CARCANO_WRAP3"), "3", 10},
            {GetHashKey("COMPONENT_RIFLE_CARCANO_WRAP4"), "4", 10},
            {GetHashKey("COMPONENT_RIFLE_CARCANO_WRAP5"), "5", 10},
            {GetHashKey("COMPONENT_RIFLE_CARCANO_WRAP6"), "6", 10},
            }
        },
    },  
    RollingBlock = {
        [1] = {
            id = "grip",
            label = "Grips",
            items = {
          {GetHashKey("COMPONENT_SNIPERRIFLE_ROLLINGBLOCK_GRIP"), "Basic", 10},
          {GetHashKey("COMPONENT_SNIPERRIFLE_ROLLINGBLOCK_GRIP_EXOTIC"), "Exotic", 10},
          {GetHashKey("COMPONENT_SNIPERRIFLE_ROLLINGBLOCK_GRIP_IRONWOOD"), "Ironwood", 10},
          {GetHashKey("COMPONENT_SNIPERRIFLE_ROLLINGBLOCK_GRIP_ENGRAVED"), "Engraved", 10},
          {GetHashKey("COMPONENT_SNIPERRIFLE_ROLLINGBLOCK_GRIP_REAPER"), "Reaper", 10},
          {GetHashKey("COMPONENT_SNIPERRIFLE_ROLLINGBLOCK_GRIP_BURLED"), "Burled", 10},
        }
        },
        [2] = {
            id = "sight",
            label = "Sights",
            items = {
          {GetHashKey("COMPONENT_RIFLE_ROLLINGBLOCK_SIGHT_NARROW"), "Narrow", 10},
          {GetHashKey("COMPONENT_RIFLE_ROLLINGBLOCK_SIGHT_WIDE"), "Wide", 10},
        }
        },
        [3] = {
            id = "wrap",
            label = "Wraps",
            items = {
          {GetHashKey("COMPONENT_RIFLE_ROLLINGBLOCK_WRAP1"), "1", 10},
          {GetHashKey("COMPONENT_RIFLE_ROLLINGBLOCK_WRAP2"), "2", 10},
          {GetHashKey("COMPONENT_RIFLE_ROLLINGBLOCK_WRAP3"), "3", 10},
          {GetHashKey("COMPONENT_RIFLE_ROLLINGBLOCK_WRAP4"), "4", 10},
          {GetHashKey("COMPONENT_RIFLE_ROLLINGBLOCK_WRAP5"), "5", 10},
          {GetHashKey("COMPONENT_RIFLE_ROLLINGBLOCK_WRAP6"), "6", 10},
        }
        },
        [4] = { 
            id = "skin",
            label = "Skins",
            items = {
          {GetHashKey("COMPONENT_LONGARM_ROLE_ENGRAVING_ROLLINGBLOCK_REAPER"), "Reaper", 10},
        }
        },
    },
    RepeatingS = {
        [1] = {
            id = "barrel",
            label = "Barrels",
            items = {
          {GetHashKey("COMPONENT_SHOTGUN_REPEATING_BARREL_SHORT"), "Short Barrel", 10},
          {GetHashKey("COMPONENT_SHOTGUN_REPEATING_BARREL_LONG"), "Long Barrel", 10},
        }
        }, 
        [2] = {
            id = "grip",
            label = "Grips",
            items = {
          {GetHashKey("COMPONENT_SHOTGUN_REPEATING01_GRIP"), "Basic", 10},
          {GetHashKey("COMPONENT_SHOTGUN_REPEATING01_GRIP_IRONWOOD"), "Ironwood", 10},
          {GetHashKey("COMPONENT_SHOTGUN_REPEATING01_GRIP_ENGRAVED"), "Engraved", 10},
          {GetHashKey("COMPONENT_SHOTGUN_REPEATING_GRIP_BURLED"), "Burled", 10},
        }
        },
        [3] = {
            id = "sight",
            label = "Sights",
            items = {
          {GetHashKey("COMPONENT_SHOTGUN_REPEATING_SIGHT_NARROW"), "Narrow", 10},
          {GetHashKey("COMPONENT_SHOTGUN_REPEATING_SIGHT_WIDE"), "Wide", 10},
        }
        },
        [4] = {
            id = "wrap",
            label = "Wraps",
            items = {
                {GetHashKey("COMPONENT_SHOTGUN_REPEATING01_WRAP1"), "1", 10},
                {GetHashKey("COMPONENT_SHOTGUN_REPEATING01_WRAP2"), "2", 10},
                {GetHashKey("COMPONENT_SHOTGUN_REPEATING_WRAP3"), "3", 10},
                {GetHashKey("COMPONENT_SHOTGUN_REPEATING_WRAP4"), "4", 10},
                {GetHashKey("COMPONENT_SHOTGUN_REPEATING_WRAP5"), "5", 10},
                {GetHashKey("COMPONENT_SHOTGUN_REPEATING_WRAP6"), "6", 10},
            }
        },
    },  
    PumpS = {
        [1] = {
            id = "barrel",
            label = "Barrels",
            items = {
          {GetHashKey("COMPONENT_SHOTGUN_PUMP_BARREL_SHORT"), "Short Barrel", 10},
          {GetHashKey("COMPONENT_SHOTGUN_PUMP_BARREL_LONG"), "Long Barrel", 10},
          {GetHashKey("COMPONENT_SHOTGUN_PUMP_BARREL_HALLOWEEN"), "Halloween", 10},
        }
        }, 
        [2] = {
            id = "grip",
            label = "Grips",
            items = {
          {GetHashKey("COMPONENT_SHOTGUN_PUMP_GRIP"), "Basic", 10},
          {GetHashKey("COMPONENT_SHOTGUN_PUMP_GRIP_IRONWOOD"), "Ironwood", 10},
          {GetHashKey("COMPONENT_SHOTGUN_PUMP_GRIP_ENGRAVED"), "Engraved", 10},
          {GetHashKey("COMPONENT_SHOTGUN_PUMP_GRIP_TRADER"), "Trader", 10},
          {GetHashKey("COMPONENT_SHOTGUN_PUMP_GRIP_BURLED"), "Burled", 10},
          {GetHashKey("COMPONENT_SHOTGUN_PUMP_GRIP_HALLOWEEN"), "Halloween", 10},
        }
        },
        [3] = {
            id = "sight",
            label = "Sights",
            items = {
          {GetHashKey("COMPONENT_SHOTGUN_PUMP_SIGHT_NARROW"), "Narrow", 10},
          {GetHashKey("COMPONENT_SHOTGUN_PUMP_SIGHT_WIDE"), "Wide", 10},
        }
        },
        [4] = {
            id = "clip",
            label = "Clips",
            items = {
          {GetHashKey("COMPONENT_SHOTGUN_PUMP_CLIP"), "Basic", 10},
          {GetHashKey("COMPONENT_SHOTGUN_PUMP_CLIP_IRONWOOD"), "Ironwood", 10},
          {GetHashKey("COMPONENT_SHOTGUN_PUMP_CLIP_ENGRAVED"), "Engraved", 10},
          {GetHashKey("COMPONENT_SHOTGUN_PUMP_CLIP_TRADER"), "Trader", 10},
          {GetHashKey("COMPONENT_SHOTGUN_PUMP_CLIP_BURLED"), "Burled", 10},
          {GetHashKey("COMPONENT_SHOTGUN_PUMP_CLIP_HALLOWEEN"), "Halloween", 10},
        }
        },
        [5] = {
            id = "wrap",
            label = "Wraps",
            items = {
          {GetHashKey("COMPONENT_SHOTGUN_PUMP_WRAP1"), "1", 10},
          {GetHashKey("COMPONENT_SHOTGUN_PUMP_WRAP2"), "2", 10},
          {GetHashKey("COMPONENT_SHOTGUN_PUMP_WRAP3"), "3", 10},
          {GetHashKey("COMPONENT_SHOTGUN_PUMP_WRAP4"), "4", 10},
          {GetHashKey("COMPONENT_SHOTGUN_PUMP_WRAP5"), "5", 10},
          {GetHashKey("COMPONENT_SHOTGUN_PUMP_WRAP6"), "6", 10},
        }
        },
        [6] = { 
            id = "skin",
            label = "Skins",
            items = {
          {GetHashKey("COMPONENT_SHOTGUN_FRAME_ENGRAVING_PUMP_TRADER"), "Trader", 10},
          {GetHashKey("COMPONENT_LONGARM_ROLE_ENGRAVING_PUMP_HALLOWEEN"), "Halloween", 10},
        }
        },
    },      
    DoubleBarrelS = {
        [1] = {
            id = "barrel",
            label = "Barrels",
            items = {
          {GetHashKey("COMPONENT_SHOTGUN_DOUBLEBARREL_BARREL_SHORT"), "Short Barrel", 10},
          {GetHashKey("COMPONENT_SHOTGUN_DOUBLEBARREL_BARREL_LONG"), "Long Barrel", 10},
          {GetHashKey("COMPONENT_SHOTGUN_DOUBLEBARREL_BARREL_KRAMPUS"), "Krampus", 10},
        }
        }, 
        [2] = {
            id = "grip",
            label = "Grips",
            items = {
          {GetHashKey("COMPONENT_SHOTGUN_DOUBLEBARREL_GRIP"), "Basic", 10},
          {GetHashKey("COMPONENT_SHOTGUN_DOUBLEBARREL_GRIP_EXOTIC"), "Exotic", 10},
          {GetHashKey("COMPONENT_SHOTGUN_DOUBLEBARREL_GRIP_IRONWOOD"), "Ironwood", 10},
          {GetHashKey("COMPONENT_SHOTGUN_DOUBLEBARREL_GRIP_ENGRAVED"), "Engraved", 10},
          {GetHashKey("COMPONENT_SHOTGUN_DOUBLEBARREL_GRIP_KRAMPUS"), "Krampus", 10},
          {GetHashKey("COMPONENT_SHOTGUN_DOUBLEBARREL_GRIP_BURLED"), "Burled", 10},
        }
        },
        [3] = {
            id = "sight",
            label = "Sights",
            items = {
          {GetHashKey("COMPONENT_SHOTGUN_DOUBLEBARREL_SIGHT_NARROW"), "Narrow", 10},
          {GetHashKey("COMPONENT_SHOTGUN_DOUBLEBARREL_SIGHT_WIDE"), "Wide", 10},
        }
        },
        [4] = {
            id = "wrap",
            label = "Wraps",
            items = {
          {GetHashKey("COMPONENT_SHOTGUN_DOUBLEBARREL_WRAP1"), "1", 10},
          {GetHashKey("COMPONENT_SHOTGUN_DOUBLEBARREL_WRAP2"), "2", 10},
          {GetHashKey("COMPONENT_SHOTGUN_DOUBLEBARREL_WRAP3"), "3", 10},
          {GetHashKey("COMPONENT_SHOTGUN_DOUBLEBARREL_WRAP4"), "4", 10},
          {GetHashKey("COMPONENT_SHOTGUN_DOUBLEBARREL_WRAP5"), "5", 10},
          {GetHashKey("COMPONENT_SHOTGUN_DOUBLEBARREL_WRAP6"), "6", 10},
        }
        },
        [5] = {
            id = "mag",
            label = "Mags",
            items = {
          {GetHashKey("COMPONENT_SHOTGUN_DOUBLEBARREL_MAG"), "Basic", 10},
          {GetHashKey("COMPONENT_SHOTGUN_DOUBLEBARREL_MAG_IRONWOOD"), "Ironwood", 10},
          {GetHashKey("COMPONENT_SHOTGUN_DOUBLEBARREL_MAG_ENGRAVED"), "Engraved", 10},
          {GetHashKey("COMPONENT_SHOTGUN_DOUBLEBARREL_MAG_EXOTIC"), "Exotic", 10},
          {GetHashKey("COMPONENT_SHOTGUN_DOUBLEBARREL_MAG_KRAMPUS"), "Krampus", 10},
          {GetHashKey("COMPONENT_SHOTGUN_DOUBLEBARREL_MAG_BURLED"), "Burled", 10},
        }
        },
        [6] = { 
            id = "skin",
            label = "Skins",
            items = {
          {GetHashKey("COMPONENT_LONGARM_ROLE_ENGRAVING_DOUBLEBARREL_KRAMPUS"), "Krampus", 10},
        }
        },
    },
    SawedS = {
        [1] = {
            id = "grip",
            label = "Grips",
            items = {
          {GetHashKey("COMPONENT_SHOTGUN_SAWEDOFF_GRIP"), "Basic", 10},
          {GetHashKey("COMPONENT_SHOTGUN_SAWEDOFF_GRIP_IRONWOOD"), "Ironwood", 10},
          {GetHashKey("COMPONENT_SHOTGUN_SAWEDOFF_GRIP_EBONY"), "Ebony", 10},
          {GetHashKey("COMPONENT_SHOTGUN_SAWEDOFF_GRIP_MOONSHINER"), "Moonshiner", 10},
          {GetHashKey("COMPONENT_SHOTGUN_SAWEDOFF_GRIP_BURLED"), "Burled", 10},
        }
        },
        [2] = {
            id = "sight",
            label = "Sights",
            items = {
          {GetHashKey("COMPONENT_SHOTGUN_SAWED_SIGHT_NARROW"), "Narrow", 10},
          {GetHashKey("COMPONENT_SHOTGUN_SAWED_SIGHT_WIDE"), "Wide", 10},
          {GetHashKey("COMPONENT_SHOTGUN_SAWED_SIGHT_MOONSHINER"), "Moonshiner", 10},
        }
        }, 
        [3] = {
            id = "wrap",
            label = "Wraps",
            items = {
          {GetHashKey("COMPONENT_SHOTGUN_SAWEDOFF_WRAP1"), "1", 10},
          {GetHashKey("COMPONENT_SHOTGUN_SAWEDOFF_WRAP2"), "2", 10},
          {GetHashKey("COMPONENT_SHOTGUN_SAWEDOFF_WRAP3"), "3", 10},
          {GetHashKey("COMPONENT_SHOTGUN_SAWEDOFF_WRAP4"), "4", 10},
          {GetHashKey("COMPONENT_SHOTGUN_SAWEDOFF_WRAP5"), "5", 10},
        }
        },
        [4] = {
            id = "stock",
            label = "Stocks",
            items = {
          {GetHashKey("COMPONENT_SHOTGUN_SAWEDOFF_STOCK"), "Stock", 10},
          {GetHashKey("COMPONENT_SHOTGUN_SAWEDOFF_STOCK_IRONWOOD"), "Ironwood", 10},
          {GetHashKey("COMPONENT_SHOTGUN_SAWEDOFF_STOCK_EBONY"), "Ebony", 10},
          {GetHashKey("COMPONENT_SHOTGUN_SAWEDOFF_STOCK_MOONSHINER"), "Moonshiner", 10},
          {GetHashKey("COMPONENT_SHOTGUN_SAWEDOFF_STOCK_BURLED"), "Burled", 10},
        }
        },
        [5] = { 
            id = "skin",
            label = "Skins",
            items = {
          {GetHashKey("COMPONENT_LONGARM_ROLE_ENGRAVING_SAWEDOFF_MOONSHINER"), "Moonshiner", 10},
        }
        },
    },  
    SemiAutoS = {
        [1] = {
            id = "barrel",
            label = "Barrels",
            items = {
          {GetHashKey("COMPONENT_SHOTGUN_SEMIAUTO_BARREL_SHORT"), "Short Barrel", 10},
          {GetHashKey("COMPONENT_SHOTGUN_SEMIAUTO_BARREL_LONG"), "Long Barrel", 10},
        }
        },
        [2] = {
            id = "grip",
            label = "Grips",
            items = {
          {GetHashKey("COMPONENT_SHOTGUN_SEMIAUTO_GRIP"), "Basic", 10},
          {GetHashKey("COMPONENT_SHOTGUN_SEMIAUTO_GRIP_IRONWOOD"), "Ironwood", 10},
          {GetHashKey("COMPONENT_SHOTGUN_SEMIAUTO_GRIP_ENGRAVED"), "Engraved", 10},
          {GetHashKey("COMPONENT_SHOTGUN_SEMIAUTO_GRIP_BURLED"), "Burled", 10},
        }
        }, 
        [3] = {
            id = "sight",
            label = "Sights",
            items = {
          {GetHashKey("COMPONENT_SHOTGUN_SEMIAUTO_SIGHT_NARROW"), "Narrow", 10},
          {GetHashKey("COMPONENT_SHOTGUN_SEMIAUTO_SIGHT_WIDE"), "Wide", 10},
        }
        },
        [4] = {
            id = "wrap",
            label = "Wraps",
            items = {
          {GetHashKey("COMPONENT_SHOTGUN_SEMIAUTO_WRAP1"), "1", 10},
          {GetHashKey("COMPONENT_SHOTGUN_SEMIAUTO_WRAP2"), "2", 10},
          {GetHashKey("COMPONENT_SHOTGUN_SEMIAUTO_WRAP3"), "3", 10},
          {GetHashKey("COMPONENT_SHOTGUN_SEMIAUTO_WRAP4"), "4", 10},
          {GetHashKey("COMPONENT_SHOTGUN_SEMIAUTO_WRAP5"), "5", 10},
          {GetHashKey("COMPONENT_SHOTGUN_SEMIAUTO_WRAP6"), "6", 10},
        }
        },
    },
    ImprovedBow = {
        [1] = {
            id = "grip",
            label = "Grips",
            items = {
                {GetHashKey("COMPONENT_BOW_IMPROVED_GRIP"), "Basic", 10},
                {GetHashKey("COMPONENT_BOW_IMPROVED_GRIP_ALLIGATOR"), "Alligator", 10},
                {GetHashKey("COMPONENT_BOW_IMPROVED_GRIP_HORNED"), "Horned", 10},
                {GetHashKey("COMPONENT_BOW_IMPROVED_GRIP_JAGUAR"), "Jaguar", 10},
                {GetHashKey("COMPONENT_BOW_IMPROVED_GRIP_WOODEN_INLAY"), "Wooden Inlay", 10},
            }
        },
        [2] = {
            id = "frame_tint",
            disabled = false,
            label = "Frame Tint",
            items = {
                {GetHashKey("COMPONENT_BOW_FRAME_TINT_A_1"), "1", 10},
                {GetHashKey("COMPONENT_BOW_FRAME_TINT_A_2"), "2", 10},
                {GetHashKey("COMPONENT_BOW_FRAME_TINT_A_3"), "3", 10},
                {GetHashKey("COMPONENT_BOW_FRAME_TINT_A_4"), "4", 10},
                {GetHashKey("COMPONENT_BOW_FRAME_TINT_A_5"), "5", 10},
                {GetHashKey("COMPONENT_BOW_FRAME_TINT_A_6"), "6", 10},
                {GetHashKey("COMPONENT_BOW_FRAME_TINT_A_7"), "7", 10},
                {GetHashKey("COMPONENT_BOW_FRAME_TINT_A_8"), "8", 10},
            }
        },
        [3] = {
            id = "grip_tint",
            disabled = true,
            label = "Gripstock Tint",
            items = {
                {GetHashKey("COMPONENT_BOW_GRIPSTOCK_TINT_A_1"), "1", 10},
                {GetHashKey("COMPONENT_BOW_GRIPSTOCK_TINT_A_2"), "2", 10},
                {GetHashKey("COMPONENT_BOW_GRIPSTOCK_TINT_A_3"), "3", 10},
                {GetHashKey("COMPONENT_BOW_GRIPSTOCK_TINT_A_4"), "4", 10},
                {GetHashKey("COMPONENT_BOW_GRIPSTOCK_TINT_A_5"), "5", 10},
                {GetHashKey("COMPONENT_BOW_GRIPSTOCK_TINT_A_6"), "6", 10},
                {GetHashKey("COMPONENT_BOW_GRIPSTOCK_TINT_A_7"), "7", 10},
                {GetHashKey("COMPONENT_BOW_GRIPSTOCK_TINT_A_8"), "8", 10},
            }
        },
        [4] = { 
            id = "trigger_tint",
            disabled = false,
            label = "Trigger Tint",
            items = {
                {GetHashKey("COMPONENT_BOW_TRIGGER_TINT_A_1"), "1", 10},
                {GetHashKey("COMPONENT_BOW_TRIGGER_TINT_A_2"), "2", 10},
                {GetHashKey("COMPONENT_BOW_TRIGGER_TINT_A_3"), "3", 10},
                {GetHashKey("COMPONENT_BOW_TRIGGER_TINT_A_4"), "4", 10},
                {GetHashKey("COMPONENT_BOW_TRIGGER_TINT_A_5"), "5", 10},
                {GetHashKey("COMPONENT_BOW_TRIGGER_TINT_A_6"), "6", 10},
                {GetHashKey("COMPONENT_BOW_TRIGGER_TINT_A_7"), "7", 10},
                {GetHashKey("COMPONENT_BOW_TRIGGER_TINT_A_8"), "8", 10},
            }
        },
        [5] = { 
            id = "skin",
            disabled = false,
            label = "Skins",
            items = {
                {GetHashKey("COMPONENT_BOW_ROLE_ENGRAVING_IMPROVED_ALLIGATOR"), "Alligator", 10},
                {GetHashKey("COMPONENT_BOW_ROLE_ENGRAVING_IMPROVED_HORNED"), "Horned", 10},
                {GetHashKey("COMPONENT_BOW_ROLE_ENGRAVING_IMPROVED_JAGUAR"), "Jaguar", 10},
                {GetHashKey("COMPONENT_BOW_ROLE_ENGRAVING_IMPROVED_WOODEN_INLAY"), "Wooden Inlay", 10},
            }
        },
    },
    Varmint = {
        [1] = {
            id = "grip",
            label = "Grips",
            items = {
                {GetHashKey("COMPONENT_RIFLE_VARMINT_GRIP"), "Basic", 10},
                {GetHashKey("COMPONENT_RIFLE_VARMINT_GRIP_ENGRAVED"), "Engraved", 10},
                {GetHashKey("COMPONENT_RIFLE_VARMINT_GRIP_IRONWOOD"), "Ironwood", 10},
                {GetHashKey("COMPONENT_RIFLE_VARMINT_GRIP_NATURALIST"), "Naturalist", 10},
                {GetHashKey("COMPONENT_RIFLE_VARMINT_GRIP_BURLED"), "Burled", 10},
            }
        },
        [2] = {
            id = "sight",
            label = "Sights",
            items = {
                {GetHashKey("COMPONENT_REPEATER_PUMPACTION_SIGHT_NARROW"), "Narrow", 10},
                {GetHashKey("COMPONENT_REPEATER_PUMPACTION_SIGHT_WIDE"), "Wide", 10},
                {GetHashKey("COMPONENT_RIFLE_VARMINT_SIGHT_NATURALIST"), "Naturalist", 10},
            }
        },
        [3] = {
            id = "clip",
            label = "Clips",
            items = {
                {GetHashKey("COMPONENT_RIFLE_VARMINT_CLIP"), "Basic", 10},
                {GetHashKey("COMPONENT_RIFLE_VARMINT_CLIP_ENGRAVED"), "Engraved", 10},
                {GetHashKey("COMPONENT_RIFLE_VARMINT_CLIP_IRONWOOD"), "Ironwood", 10},
                {GetHashKey("COMPONENT_RIFLE_VARMINT_CLIP_NATURALIST"), "Naturalist", 10},
                {GetHashKey("COMPONENT_RIFLE_VARMINT_CLIP_BURLED"), "Burled", 10},
            }
        },
        [4] = {
            id = "wrap",
            label = "Wraps",
            items = {
                {GetHashKey("COMPONENT_RIFLE_VARMINT_WRAP1"), "1", 10},
                {GetHashKey("COMPONENT_RIFLE_VARMINT_WRAP2"), "2", 10},
                {GetHashKey("COMPONENT_RIFLE_VARMINT_WRAP3"), "3", 10},
                {GetHashKey("COMPONENT_RIFLE_VARMINT_WRAP4"), "4", 10},
                {GetHashKey("COMPONENT_RIFLE_VARMINT_WRAP5"), "5", 10},
                {GetHashKey("COMPONENT_RIFLE_VARMINT_WRAP6"), "6", 10},
            }
        },
        [5] = { 
            id = "skin",
            label = "Skins",
            items = {
                {GetHashKey("COMPONENT_LONGARM_ROLE_ENGRAVING_VARMINT_NATURALIST"), "Naturalist", 10},
            }
        },
    },
    ShortArm = {
        [1] = {
            id = "trigger_material",
            disabled = false,
            label = "Trigger Materials",
            items = {
                {GetHashKey("COMPONENT_SHORTARM_TRIGGER_MATERIAL_1"), "Trigger 1", 10},
                {GetHashKey("COMPONENT_SHORTARM_TRIGGER_MATERIAL_2"), "Trigger 2", 10},
                {GetHashKey("COMPONENT_SHORTARM_TRIGGER_MATERIAL_3"), "Trigger 3", 10},
                {GetHashKey("COMPONENT_SHORTARM_TRIGGER_MATERIAL_4"), "Trigger 4", 10},
                {GetHashKey("COMPONENT_SHORTARM_TRIGGER_MATERIAL_5"), "Trigger 5", 10},
                {GetHashKey("COMPONENT_SHORTARM_TRIGGER_MATERIAL_6"), "Trigger 6", 10},
                {GetHashKey("COMPONENT_SHORTARM_TRIGGER_MATERIAL_7"), "Trigger 7", 10},
                {GetHashKey("COMPONENT_SHORTARM_TRIGGER_MATERIAL_8"), "Trigger 8", 10},
                {GetHashKey("COMPONENT_SHORTARM_TRIGGER_MATERIAL_9"), "Trigger 9", 10},
                {GetHashKey("COMPONENT_SHORTARM_TRIGGER_MATERIAL_10"), "Trigger 10", 10},
            }
        },  
        [2] = {
            id = "sight_material",
            disabled = false,
            label = "Sight Material",
            items = {
                {GetHashKey("COMPONENT_SHORTARM_SIGHT_MATERIAL_1"), "Sight 1", 10},
                {GetHashKey("COMPONENT_SHORTARM_SIGHT_MATERIAL_2"), "Sight 2", 10},
                {GetHashKey("COMPONENT_SHORTARM_SIGHT_MATERIAL_3"), "Sight 3", 10},
                {GetHashKey("COMPONENT_SHORTARM_SIGHT_MATERIAL_4"), "Sight 4", 10},
                {GetHashKey("COMPONENT_SHORTARM_SIGHT_MATERIAL_5"), "Sight 5", 10},
                {GetHashKey("COMPONENT_SHORTARM_SIGHT_MATERIAL_6"), "Sight 6", 10},
                {GetHashKey("COMPONENT_SHORTARM_SIGHT_MATERIAL_7"), "Sight 7", 10},
                {GetHashKey("COMPONENT_SHORTARM_SIGHT_MATERIAL_8"), "Sight 8", 10},
                {GetHashKey("COMPONENT_SHORTARM_SIGHT_MATERIAL_9"), "Sight 9", 10},
                {GetHashKey("COMPONENT_SHORTARM_SIGHT_MATERIAL_10"), "Sight 10", 10},
            }
        },         
        [3] = {
            id = "hammer_material",
            disabled = false,
            label = "Hammer Material",
            items = {
                {GetHashKey("COMPONENT_SHORTARM_HAMMER_MATERIAL_1"), "Hammer 1", 10},
                {GetHashKey("COMPONENT_SHORTARM_HAMMER_MATERIAL_2"), "Hammer 2", 10},
                {GetHashKey("COMPONENT_SHORTARM_HAMMER_MATERIAL_3"), "Hammer 3", 10},
                {GetHashKey("COMPONENT_SHORTARM_HAMMER_MATERIAL_4"), "Hammer 4", 10},
                {GetHashKey("COMPONENT_SHORTARM_HAMMER_MATERIAL_5"), "Hammer 5", 10},
                {GetHashKey("COMPONENT_SHORTARM_HAMMER_MATERIAL_6"), "Hammer 6", 10},
                {GetHashKey("COMPONENT_SHORTARM_HAMMER_MATERIAL_7"), "Hammer 7", 10},
                {GetHashKey("COMPONENT_SHORTARM_HAMMER_MATERIAL_8"), "Hammer 8", 10},
                {GetHashKey("COMPONENT_SHORTARM_HAMMER_MATERIAL_9"), "Hammer 9", 10},
                {GetHashKey("COMPONENT_SHORTARM_HAMMER_MATERIAL_10"), "Hammer 10", 10},
            }
        },  
        [4] = {
            id = "frame_material",
            disabled = false,
            label = "Frame Material",
            items = {
                {GetHashKey("COMPONENT_SHORTARM_FRAME_MATERIAL_1"), "Frame 1", 10},
                {GetHashKey("COMPONENT_SHORTARM_FRAME_MATERIAL_2"), "Frame 2", 10},
                {GetHashKey("COMPONENT_SHORTARM_FRAME_MATERIAL_3"), "Frame 3", 10},
                {GetHashKey("COMPONENT_SHORTARM_FRAME_MATERIAL_4"), "Frame 4", 10},
                {GetHashKey("COMPONENT_SHORTARM_FRAME_MATERIAL_5"), "Frame 5", 10},
                {GetHashKey("COMPONENT_SHORTARM_FRAME_MATERIAL_6"), "Frame 6", 10},
                {GetHashKey("COMPONENT_SHORTARM_FRAME_MATERIAL_7"), "Frame 7", 10},
                {GetHashKey("COMPONENT_SHORTARM_FRAME_MATERIAL_8"), "Frame 8", 10},
                {GetHashKey("COMPONENT_SHORTARM_FRAME_MATERIAL_9"), "Frame 9", 10},
                {GetHashKey("COMPONENT_SHORTARM_FRAME_MATERIAL_10"), "Frame 10", 10},
            }
        },  
        [5] = {
            id = "frame_engraving",
            label = "Frame Engraving",
            items = {
                {GetHashKey("COMPONENT_SHORTARM_FRAME_ENGRAVING_1"), "Engraving 1", 10},
                {GetHashKey("COMPONENT_SHORTARM_FRAME_ENGRAVING_2"), "Engraving 2", 10},
                {GetHashKey("COMPONENT_SHORTARM_FRAME_ENGRAVING_3"), "Engraving 3", 10},
                {GetHashKey("COMPONENT_SHORTARM_FRAME_ENGRAVING_4"), "Engraving 4", 10},
            }
        }, 
        [6] = {
            id = "frame_engraving_material",
            disabled = false,
            label = "Frame Engraving Material",
            items = {
                {GetHashKey("COMPONENT_SHORTARM_FRAME_ENGRAVING_MATERIAL_1"), "Material 1", 10},
                {GetHashKey("COMPONENT_SHORTARM_FRAME_ENGRAVING_MATERIAL_2"), "Material 2", 10},
                {GetHashKey("COMPONENT_SHORTARM_FRAME_ENGRAVING_MATERIAL_3"), "Material 3", 10},
                {GetHashKey("COMPONENT_SHORTARM_FRAME_ENGRAVING_MATERIAL_4"), "Material 4", 10},
                {GetHashKey("COMPONENT_SHORTARM_FRAME_ENGRAVING_MATERIAL_5"), "Material 5", 10},
                {GetHashKey("COMPONENT_SHORTARM_FRAME_ENGRAVING_MATERIAL_6"), "Material 6", 10},
                {GetHashKey("COMPONENT_SHORTARM_FRAME_ENGRAVING_MATERIAL_7"), "Material 7", 10},
                {GetHashKey("COMPONENT_SHORTARM_FRAME_ENGRAVING_MATERIAL_8"), "Material 8", 10},
                {GetHashKey("COMPONENT_SHORTARM_FRAME_ENGRAVING_MATERIAL_9"), "Material 9", 10},
                {GetHashKey("COMPONENT_SHORTARM_FRAME_ENGRAVING_MATERIAL_10"), "Material 10", 10},
                {GetHashKey("COMPONENT_SHORTARM_FRAME_ENGRAVING_MATERIAL_11"), "Material 11", 10},
                {GetHashKey("COMPONENT_SHORTARM_FRAME_ENGRAVING_MATERIAL_12"), "Material 12", 10},
                {GetHashKey("COMPONENT_SHORTARM_FRAME_ENGRAVING_MATERIAL_13"), "Material 13", 10},
                {GetHashKey("COMPONENT_SHORTARM_FRAME_ENGRAVING_MATERIAL_14"), "Material 14", 10},
            }
        },
        [7] = {
            id = "barrel_material",
            disabled = false,
            label = "Barrel Material",
            items = {
                {GetHashKey("COMPONENT_SHORTARM_BARREL_MATERIAL_1"), "Material 1", 10},
                {GetHashKey("COMPONENT_SHORTARM_BARREL_MATERIAL_2"), "Material 2", 10},
                {GetHashKey("COMPONENT_SHORTARM_BARREL_MATERIAL_3"), "Material 3", 10},
                {GetHashKey("COMPONENT_SHORTARM_BARREL_MATERIAL_4"), "Material 4", 10},
                {GetHashKey("COMPONENT_SHORTARM_BARREL_MATERIAL_5"), "Material 5", 10},
                {GetHashKey("COMPONENT_SHORTARM_BARREL_MATERIAL_6"), "Material 6", 10},
                {GetHashKey("COMPONENT_SHORTARM_BARREL_MATERIAL_7"), "Material 7", 10},
                {GetHashKey("COMPONENT_SHORTARM_BARREL_MATERIAL_8"), "Material 8", 10},
                {GetHashKey("COMPONENT_SHORTARM_BARREL_MATERIAL_9"), "Material 9", 10},
                {GetHashKey("COMPONENT_SHORTARM_BARREL_MATERIAL_10"), "Material 10", 10},
            }
        }, 
        [8] = {
            id = "barrel_engraving",
            disabled = false,
            label = "Barrel Engraving",
            items = {
                {GetHashKey("COMPONENT_SHORTARM_BARREL_ENGRAVING_1"), "Engraving 1", 10},
                {GetHashKey("COMPONENT_SHORTARM_BARREL_ENGRAVING_2"), "Engraving 2", 10},
                {GetHashKey("COMPONENT_SHORTARM_BARREL_ENGRAVING_3"), "Engraving 3", 10},
                {GetHashKey("COMPONENT_SHORTARM_BARREL_ENGRAVING_4"), "Engraving 4", 10},
            }
        },
        [9] = {
            id = "barrel_engraving_material",
            disabled = false,
            label = "Barrel Engraving Material",
            items = {
                {GetHashKey("COMPONENT_SHORTARM_BARREL_ENGRAVING_MATERIAL_1"), "Material 1", 10},
                {GetHashKey("COMPONENT_SHORTARM_BARREL_ENGRAVING_MATERIAL_2"), "Material 2", 10},
                {GetHashKey("COMPONENT_SHORTARM_BARREL_ENGRAVING_MATERIAL_3"), "Material 3", 10},
                {GetHashKey("COMPONENT_SHORTARM_BARREL_ENGRAVING_MATERIAL_4"), "Material 4", 10},
                {GetHashKey("COMPONENT_SHORTARM_BARREL_ENGRAVING_MATERIAL_5"), "Material 5", 10},
                {GetHashKey("COMPONENT_SHORTARM_BARREL_ENGRAVING_MATERIAL_6"), "Material 6", 10},
                {GetHashKey("COMPONENT_SHORTARM_BARREL_ENGRAVING_MATERIAL_7"), "Material 7", 10},
                {GetHashKey("COMPONENT_SHORTARM_BARREL_ENGRAVING_MATERIAL_8"), "Material 8", 10},
                {GetHashKey("COMPONENT_SHORTARM_BARREL_ENGRAVING_MATERIAL_9"), "Material 9", 10},
                {GetHashKey("COMPONENT_SHORTARM_BARREL_ENGRAVING_MATERIAL_10"), "Material 10", 10},
                {GetHashKey("COMPONENT_SHORTARM_BARREL_ENGRAVING_MATERIAL_11"), "Material 11", 10},
                {GetHashKey("COMPONENT_SHORTARM_BARREL_ENGRAVING_MATERIAL_12"), "Material 12", 10},
                {GetHashKey("COMPONENT_SHORTARM_BARREL_ENGRAVING_MATERIAL_13"), "Material 13", 10},
                {GetHashKey("COMPONENT_SHORTARM_BARREL_ENGRAVING_MATERIAL_14"), "Material 14", 10},
            }
        },
        [10] = {
            id = "cylinder_material",
            disabled = false,
            label = "Cylinder Material",
            items = {
                {GetHashKey("COMPONENT_SHORTARM_CYLINDER_MATERIAL_1"), "Material 1", 10},
                {GetHashKey("COMPONENT_SHORTARM_CYLINDER_MATERIAL_2"), "Material 2", 10},
                {GetHashKey("COMPONENT_SHORTARM_CYLINDER_MATERIAL_3"), "Material 3", 10},
                {GetHashKey("COMPONENT_SHORTARM_CYLINDER_MATERIAL_4"), "Material 4", 10},
                {GetHashKey("COMPONENT_SHORTARM_CYLINDER_MATERIAL_5"), "Material 5", 10},
                {GetHashKey("COMPONENT_SHORTARM_CYLINDER_MATERIAL_6"), "Material 6", 10},
                {GetHashKey("COMPONENT_SHORTARM_CYLINDER_MATERIAL_7"), "Material 7", 10},
                {GetHashKey("COMPONENT_SHORTARM_CYLINDER_MATERIAL_8"), "Material 8", 10},
                {GetHashKey("COMPONENT_SHORTARM_CYLINDER_MATERIAL_9"), "Material 9", 10},
                {GetHashKey("COMPONENT_SHORTARM_CYLINDER_MATERIAL_10"), "Material 10", 10},
            }
        },  
        [11] = {
            id = "cylinder_engraving",
            label = "Cylinder Engraving",
            items = {
                {GetHashKey("COMPONENT_SHORTARM_CYLINDER_ENGRAVING_1"), "Engraving 1", 10},
                {GetHashKey("COMPONENT_SHORTARM_CYLINDER_ENGRAVING_2"), "Engraving 2", 10},
                {GetHashKey("COMPONENT_SHORTARM_CYLINDER_ENGRAVING_3"), "Engraving 3", 10},
                {GetHashKey("COMPONENT_SHORTARM_CYLINDER_ENGRAVING_4"), "Engraving 4", 10},
            }
        }, 
        [12] = {
            id = "cylinder_engraving_material",
            disabled = false,
            label = "Cylinder Engraving Material",
            items = {
                {GetHashKey("COMPONENT_SHORTARM_CYLINDER_ENGRAVING_MATERIAL_1"), "Material 1", 10},
                {GetHashKey("COMPONENT_SHORTARM_CYLINDER_ENGRAVING_MATERIAL_2"), "Material 2", 10},
                {GetHashKey("COMPONENT_SHORTARM_CYLINDER_ENGRAVING_MATERIAL_3"), "Material 3", 10},
                {GetHashKey("COMPONENT_SHORTARM_CYLINDER_ENGRAVING_MATERIAL_4"), "Material 4", 10},
                {GetHashKey("COMPONENT_SHORTARM_CYLINDER_ENGRAVING_MATERIAL_5"), "Material 5", 10},
                {GetHashKey("COMPONENT_SHORTARM_CYLINDER_ENGRAVING_MATERIAL_6"), "Material 6", 10},
                {GetHashKey("COMPONENT_SHORTARM_CYLINDER_ENGRAVING_MATERIAL_7"), "Material 7", 10},
                {GetHashKey("COMPONENT_SHORTARM_CYLINDER_ENGRAVING_MATERIAL_8"), "Material 8", 10},
                {GetHashKey("COMPONENT_SHORTARM_CYLINDER_ENGRAVING_MATERIAL_9"), "Material 9", 10},
                {GetHashKey("COMPONENT_SHORTARM_CYLINDER_ENGRAVING_MATERIAL_10"), "Material 10", 10},
                {GetHashKey("COMPONENT_SHORTARM_CYLINDER_ENGRAVING_MATERIAL_11"), "Material 11", 10},
                {GetHashKey("COMPONENT_SHORTARM_CYLINDER_ENGRAVING_MATERIAL_12"), "Material 12", 10},
                {GetHashKey("COMPONENT_SHORTARM_CYLINDER_ENGRAVING_MATERIAL_13"), "Material 13", 10},
                {GetHashKey("COMPONENT_SHORTARM_CYLINDER_ENGRAVING_MATERIAL_14"), "Material 14", 10},
            }
        },        
        [13] = {
            id = "grip_material",
            disabled = false,
            label = "Grip Material",
            items = {
                {GetHashKey("COMPONENT_SHORTARM_GRIP_MATERIAL_PEARL"), "Pearl", 40},
                {GetHashKey("COMPONENT_SHORTARM_GRIP_MATERIAL_BURLED"), "Burled", 50},
            }
        },
        [14] = {
            id = "gripstock_engraving",
            label = "Gripstock Engraving",
            items = {
                {GetHashKey("COMPONENT_SHORTARM_GRIPSTOCK_ENGRAVING_1"), "Engraving 1", 10},
                {GetHashKey("COMPONENT_SHORTARM_GRIPSTOCK_ENGRAVING_2"), "Engraving 2", 10},
                {GetHashKey("COMPONENT_SHORTARM_GRIPSTOCK_ENGRAVING_3"), "Engraving 3", 10},
                {GetHashKey("COMPONENT_SHORTARM_GRIPSTOCK_ENGRAVING_4"), "Engraving 4", 10},
                {GetHashKey("COMPONENT_SHORTARM_GRIPSTOCK_ENGRAVING_5"), "Engraving 5", 10},
                {GetHashKey("COMPONENT_SHORTARM_GRIPSTOCK_ENGRAVING_6"), "Engraving 6", 10},
            }
        }, 
        [15] = {
            id = "gripstock_tint",
            disabled = false,
            label = "Gripstock Tint",
            items = {
                {GetHashKey("COMPONENT_SHORTARM_GRIPSTOCK_TINT_A_1"), "Tint 1", 10},
                {GetHashKey("COMPONENT_SHORTARM_GRIPSTOCK_TINT_A_2"), "Tint 2", 10},
                {GetHashKey("COMPONENT_SHORTARM_GRIPSTOCK_TINT_A_3"), "Tint 3", 10},
                {GetHashKey("COMPONENT_SHORTARM_GRIPSTOCK_TINT_A_4"), "Tint 4", 10},
                {GetHashKey("COMPONENT_SHORTARM_GRIPSTOCK_TINT_A_5"), "Tint 5", 10},
                {GetHashKey("COMPONENT_SHORTARM_GRIPSTOCK_TINT_A_6"), "Tint 6", 10},
                {GetHashKey("COMPONENT_SHORTARM_GRIPSTOCK_TINT_A_7"), "Tint 7", 10},
                {GetHashKey("COMPONENT_SHORTARM_GRIPSTOCK_TINT_A_8"), "Tint 8", 10},
                {GetHashKey("COMPONENT_SHORTARM_GRIPSTOCK_TINT_B_1"), "Tint 9", 10},
                {GetHashKey("COMPONENT_SHORTARM_GRIPSTOCK_TINT_B_2"), "Tint 10", 10},
                {GetHashKey("COMPONENT_SHORTARM_GRIPSTOCK_TINT_B_3"), "Tint 11", 10},
                {GetHashKey("COMPONENT_SHORTARM_GRIPSTOCK_TINT_B_4"), "Tint 12", 10},
                {GetHashKey("COMPONENT_SHORTARM_GRIPSTOCK_TINT_B_5"), "Tint 13", 10},
                {GetHashKey("COMPONENT_SHORTARM_GRIPSTOCK_TINT_B_6"), "Tint 14", 10},
                {GetHashKey("COMPONENT_SHORTARM_GRIPSTOCK_TINT_B_7"), "Tint 15", 10},
                {GetHashKey("COMPONENT_SHORTARM_GRIPSTOCK_TINT_B_8"), "Tint 16", 10},
                {GetHashKey("COMPONENT_SHORTARM_GRIPSTOCK_TINT_GUTTAPERCHA"), "Tint Guttapercha", 10},
                {GetHashKey("COMPONENT_SHORTARM_GRIPSTOCK_TINT_PEARL"), "Tint Pearl", 10},
                {GetHashKey("COMPONENT_SHORTARM_GRIPSTOCK_TINT_GRAY_BIRCH"), "Tint Gray Birch", 10},
                {GetHashKey("COMPONENT_SHORTARM_GRIPSTOCK_TINT_BURLED"), "Tint Burled", 10},
            }
        },  
        [16] = {
            id = "barrel_rifling",
            label = "Barrel Rifling",
            items = {
                {GetHashKey("COMPONENT_SHORTARM_BARREL_RIFLING_1"), "Rifling Barrel", 10},
            }
        },  
    },
    LongArm = {
        [1] = {
            id = "trigger_material",
            disabled = false,
            label = "Trigger Materials",
            items = {
                {GetHashKey("COMPONENT_LONGARM_TRIGGER_MATERIAL_1"), "1", 10},
                {GetHashKey("COMPONENT_LONGARM_TRIGGER_MATERIAL_2"), "2", 10},
                {GetHashKey("COMPONENT_LONGARM_TRIGGER_MATERIAL_3"), "3", 10},
                {GetHashKey("COMPONENT_LONGARM_TRIGGER_MATERIAL_4"), "4", 10},
                {GetHashKey("COMPONENT_LONGARM_TRIGGER_MATERIAL_5"), "5", 10},
                {GetHashKey("COMPONENT_LONGARM_TRIGGER_MATERIAL_6"), "6", 10},
                {GetHashKey("COMPONENT_LONGARM_TRIGGER_MATERIAL_7"), "7", 10},
                {GetHashKey("COMPONENT_LONGARM_TRIGGER_MATERIAL_8"), "8", 10},
                {GetHashKey("COMPONENT_LONGARM_TRIGGER_MATERIAL_9"), "9", 10},
                {GetHashKey("COMPONENT_LONGARM_TRIGGER_MATERIAL_10"), "10", 10},
            }
        }, 
        [2] = {
            id = "sight_material",
            disabled = false,
            label = "Sight Material",
            items = {
                {GetHashKey("COMPONENT_LONGARM_SIGHT_MATERIAL_1"), "1", 10},
                {GetHashKey("COMPONENT_LONGARM_SIGHT_MATERIAL_2"), "2", 10},
                {GetHashKey("COMPONENT_LONGARM_SIGHT_MATERIAL_3"), "3", 10},
                {GetHashKey("COMPONENT_LONGARM_SIGHT_MATERIAL_4"), "4", 10},
                {GetHashKey("COMPONENT_LONGARM_SIGHT_MATERIAL_5"), "5", 10},
                {GetHashKey("COMPONENT_LONGARM_SIGHT_MATERIAL_6"), "6", 10},
                {GetHashKey("COMPONENT_LONGARM_SIGHT_MATERIAL_7"), "7", 10},
                {GetHashKey("COMPONENT_LONGARM_SIGHT_MATERIAL_8"), "8", 10},
                {GetHashKey("COMPONENT_LONGARM_SIGHT_MATERIAL_9"), "9", 10},
                {GetHashKey("COMPONENT_LONGARM_SIGHT_MATERIAL_10"), "10", 10},
            }
        },
        [3] = {
            id = "hammer_material",
            disabled = false,
            label = "Hammer Material",
            items = {
                {GetHashKey("COMPONENT_LONGARM_HAMMER_MATERIAL_1"), "1", 10},
                {GetHashKey("COMPONENT_LONGARM_HAMMER_MATERIAL_2"), "2", 10},
                {GetHashKey("COMPONENT_LONGARM_HAMMER_MATERIAL_3"), "3", 10},
                {GetHashKey("COMPONENT_LONGARM_HAMMER_MATERIAL_4"), "4", 10},
                {GetHashKey("COMPONENT_LONGARM_HAMMER_MATERIAL_5"), "5", 10},
                {GetHashKey("COMPONENT_LONGARM_HAMMER_MATERIAL_6"), "6", 10},
                {GetHashKey("COMPONENT_LONGARM_HAMMER_MATERIAL_7"), "7", 10},
                {GetHashKey("COMPONENT_LONGARM_HAMMER_MATERIAL_8"), "8", 10},
                {GetHashKey("COMPONENT_LONGARM_HAMMER_MATERIAL_9"), "9", 10},
                {GetHashKey("COMPONENT_LONGARM_HAMMER_MATERIAL_10"), "10", 10},
            }
        },
        [4] = {
            id = "barrel_material",
            disabled = false,
            label = "Barrel Material",
            items = {
                {GetHashKey("COMPONENT_LONGARM_BARREL_MATERIAL_1"), "1", 10},
                {GetHashKey("COMPONENT_LONGARM_BARREL_MATERIAL_2"), "2", 10},
                {GetHashKey("COMPONENT_LONGARM_BARREL_MATERIAL_3"), "3", 10},
                {GetHashKey("COMPONENT_LONGARM_BARREL_MATERIAL_4"), "4", 10},
                {GetHashKey("COMPONENT_LONGARM_BARREL_MATERIAL_5"), "5", 10},
                {GetHashKey("COMPONENT_LONGARM_BARREL_MATERIAL_6"), "6", 10},
                {GetHashKey("COMPONENT_LONGARM_BARREL_MATERIAL_7"), "7", 10},
                {GetHashKey("COMPONENT_LONGARM_BARREL_MATERIAL_8"), "8", 10},
                {GetHashKey("COMPONENT_LONGARM_BARREL_MATERIAL_9"), "9", 10},
                {GetHashKey("COMPONENT_LONGARM_BARREL_MATERIAL_10"), "10", 10},
            }
        },
        [5] = {
            id = "barrel_engraving",
            disabled = false,
            label = "Barrel Engraving",
            items = {
                {GetHashKey("COMPONENT_LONGARM_BARREL_ENGRAVING_1"), "1", 10},
                {GetHashKey("COMPONENT_LONGARM_BARREL_ENGRAVING_3"), "2", 10},
                {GetHashKey("COMPONENT_LONGARM_BARREL_ENGRAVING_2"), "3", 10},
                {GetHashKey("COMPONENT_LONGARM_BARREL_ENGRAVING_4"), "4", 10},
            }
        }, 
        [6] = {
            id = "barrel_engraving_material",
            disabled = false,
            label = "Barrel Engraving Material",
            items = {
                {GetHashKey("COMPONENT_LONGARM_BARREL_ENGRAVING_MATERIAL_1"), "1", 10},
                {GetHashKey("COMPONENT_LONGARM_BARREL_ENGRAVING_MATERIAL_2"), "2", 10},
                {GetHashKey("COMPONENT_LONGARM_BARREL_ENGRAVING_MATERIAL_3"), "3", 10},
                {GetHashKey("COMPONENT_LONGARM_BARREL_ENGRAVING_MATERIAL_4"), "4", 10},
                {GetHashKey("COMPONENT_LONGARM_BARREL_ENGRAVING_MATERIAL_5"), "5", 10},
                {GetHashKey("COMPONENT_LONGARM_BARREL_ENGRAVING_MATERIAL_6"), "6", 10},
                {GetHashKey("COMPONENT_LONGARM_BARREL_ENGRAVING_MATERIAL_7"), "7", 10},
                {GetHashKey("COMPONENT_LONGARM_BARREL_ENGRAVING_MATERIAL_8"), "8", 10},
                {GetHashKey("COMPONENT_LONGARM_BARREL_ENGRAVING_MATERIAL_9"), "9", 10},
                {GetHashKey("COMPONENT_LONGARM_BARREL_ENGRAVING_MATERIAL_10"), "10", 10},
                {GetHashKey("COMPONENT_LONGARM_BARREL_ENGRAVING_MATERIAL_11"), "11", 10},
                {GetHashKey("COMPONENT_LONGARM_BARREL_ENGRAVING_MATERIAL_12"), "12", 10},
                {GetHashKey("COMPONENT_LONGARM_BARREL_ENGRAVING_MATERIAL_13"), "13", 10},
                {GetHashKey("COMPONENT_LONGARM_BARREL_ENGRAVING_MATERIAL_14"), "14", 10},
            }
        },
        [7] = {
            id = "cylinder_material",
            disabled = false,
            label = "Cylinder Material",
            items = {
                {GetHashKey("COMPONENT_LONGARM_CYLINDER_MATERIAL_1"), "1", 10},
                {GetHashKey("COMPONENT_LONGARM_CYLINDER_MATERIAL_2"), "2", 10},
                {GetHashKey("COMPONENT_LONGARM_CYLINDER_MATERIAL_3"), "3", 10},
                {GetHashKey("COMPONENT_LONGARM_CYLINDER_MATERIAL_4"), "4", 10},
                {GetHashKey("COMPONENT_LONGARM_CYLINDER_MATERIAL_5"), "5", 10},
                {GetHashKey("COMPONENT_LONGARM_CYLINDER_MATERIAL_6"), "6", 10},
                {GetHashKey("COMPONENT_LONGARM_CYLINDER_MATERIAL_7"), "7", 10},
                {GetHashKey("COMPONENT_LONGARM_CYLINDER_MATERIAL_8"), "8", 10},
                {GetHashKey("COMPONENT_LONGARM_CYLINDER_MATERIAL_9"), "9", 10},
                {GetHashKey("COMPONENT_LONGARM_CYLINDER_MATERIAL_10"), "10", 10},
            }
        }, 
        [8] = {
            id = "cylinder_engraving",
            label = "Cylinder Engraving",
            items = {
                {GetHashKey("COMPONENT_LONGARM_CYLINDER_ENGRAVING_1"), "1", 10},
                {GetHashKey("COMPONENT_LONGARM_CYLINDER_ENGRAVING_2"), "2", 10},
                {GetHashKey("COMPONENT_LONGARM_CYLINDER_ENGRAVING_3"), "3", 10},
                {GetHashKey("COMPONENT_LONGARM_CYLINDER_ENGRAVING_4"), "4", 10},
            }
        },  
        [9] = {
            id = "cylinder_engraving_material",
            disabled = false,
            label = "Cylinder Engraving Material",
            items = {
                {GetHashKey("COMPONENT_LONGARM_CYLINDER_ENGRAVING_MATERIAL_1"), "1", 10},
                {GetHashKey("COMPONENT_LONGARM_CYLINDER_ENGRAVING_MATERIAL_2"), "2", 10},
                {GetHashKey("COMPONENT_LONGARM_CYLINDER_ENGRAVING_MATERIAL_3"), "3", 10},
                {GetHashKey("COMPONENT_LONGARM_CYLINDER_ENGRAVING_MATERIAL_4"), "4", 10},
                {GetHashKey("COMPONENT_LONGARM_CYLINDER_ENGRAVING_MATERIAL_5"), "5", 10},
                {GetHashKey("COMPONENT_LONGARM_CYLINDER_ENGRAVING_MATERIAL_6"), "6", 10},
                {GetHashKey("COMPONENT_LONGARM_CYLINDER_ENGRAVING_MATERIAL_7"), "7", 10},
                {GetHashKey("COMPONENT_LONGARM_CYLINDER_ENGRAVING_MATERIAL_8"), "8", 10},
                {GetHashKey("COMPONENT_LONGARM_CYLINDER_ENGRAVING_MATERIAL_9"), "9", 10},
                {GetHashKey("COMPONENT_LONGARM_CYLINDER_ENGRAVING_MATERIAL_10"), "10", 10},
                {GetHashKey("COMPONENT_LONGARM_CYLINDER_ENGRAVING_MATERIAL_11"), "11", 10},
                {GetHashKey("COMPONENT_LONGARM_CYLINDER_ENGRAVING_MATERIAL_12"), "12", 10},
                {GetHashKey("COMPONENT_LONGARM_CYLINDER_ENGRAVING_MATERIAL_13"), "13", 10},
                {GetHashKey("COMPONENT_LONGARM_CYLINDER_ENGRAVING_MATERIAL_14"), "14", 10},
            }
        }, 
        [10] = {
            id = "frame_material",
            disabled = false,
            label = "Frame Material",
            items = {
                {GetHashKey("COMPONENT_LONGARM_FRAME_MATERIAL_1"), "1", 10},
                {GetHashKey("COMPONENT_LONGARM_FRAME_MATERIAL_2"), "2", 10},
                {GetHashKey("COMPONENT_LONGARM_FRAME_MATERIAL_3"), "3", 10},
                {GetHashKey("COMPONENT_LONGARM_FRAME_MATERIAL_4"), "4", 10},
                {GetHashKey("COMPONENT_LONGARM_FRAME_MATERIAL_5"), "5", 10},
                {GetHashKey("COMPONENT_LONGARM_FRAME_MATERIAL_6"), "6", 10},
                {GetHashKey("COMPONENT_LONGARM_FRAME_MATERIAL_7"), "7", 10},
                {GetHashKey("COMPONENT_LONGARM_FRAME_MATERIAL_8"), "8", 10},
                {GetHashKey("COMPONENT_LONGARM_FRAME_MATERIAL_9"), "9", 10},
                {GetHashKey("COMPONENT_LONGARM_FRAME_MATERIAL_10"), "10", 10},
            }
        }, 
        [11] = {
            id = "frame_engraving",
            label = "Frame Engraving",
            items = {
                {GetHashKey("COMPONENT_LONGARM_FRAME_ENGRAVING_1"), "1", 10},
                {GetHashKey("COMPONENT_LONGARM_FRAME_ENGRAVING_2"), "2", 10},
                {GetHashKey("COMPONENT_LONGARM_FRAME_ENGRAVING_3"), "3", 10},
                {GetHashKey("COMPONENT_LONGARM_FRAME_ENGRAVING_4"), "4", 10},
            }
        }, 
        [12] = {
            id = "frame_engraving_material",
            disabled = false,
            label = "Frame Engraving Material",
            items = {
                {GetHashKey("COMPONENT_LONGARM_FRAME_ENGRAVING_MATERIAL_1"), "1", 10},
                {GetHashKey("COMPONENT_LONGARM_FRAME_ENGRAVING_MATERIAL_2"), "2", 10},
                {GetHashKey("COMPONENT_LONGARM_FRAME_ENGRAVING_MATERIAL_3"), "3", 10},
                {GetHashKey("COMPONENT_LONGARM_FRAME_ENGRAVING_MATERIAL_4"), "4", 10},
                {GetHashKey("COMPONENT_LONGARM_FRAME_ENGRAVING_MATERIAL_5"), "5", 10},
                {GetHashKey("COMPONENT_LONGARM_FRAME_ENGRAVING_MATERIAL_6"), "6", 10},
                {GetHashKey("COMPONENT_LONGARM_FRAME_ENGRAVING_MATERIAL_7"), "7", 10},
                {GetHashKey("COMPONENT_LONGARM_FRAME_ENGRAVING_MATERIAL_8"), "8", 10},
                {GetHashKey("COMPONENT_LONGARM_FRAME_ENGRAVING_MATERIAL_9"), "9", 10},
                {GetHashKey("COMPONENT_LONGARM_FRAME_ENGRAVING_MATERIAL_10"), "10", 10},
                {GetHashKey("COMPONENT_LONGARM_FRAME_ENGRAVING_MATERIAL_11"), "11", 10},
                {GetHashKey("COMPONENT_LONGARM_FRAME_ENGRAVING_MATERIAL_12"), "12", 10},
                {GetHashKey("COMPONENT_LONGARM_FRAME_ENGRAVING_MATERIAL_13"), "13", 10},
                {GetHashKey("COMPONENT_LONGARM_FRAME_ENGRAVING_MATERIAL_14"), "14", 10},
            }
        }, 
        [13] = {
            id = "grip_material",
            disabled = false,
            label = "Grip Material",
            items = {
                {GetHashKey("COMPONENT_LONGARM_GRIP_MATERIAL_BURLED"), "Burled", 10},
            }
        }, 
        [14] = {
            id = "gripstock_tint",
            disabled = false,
            label = "Gripstock Tint",
            items = {
                {GetHashKey("COMPONENT_LONGARM_GRIPSTOCK_TINT_A_1"), "1", 10},
                {GetHashKey("COMPONENT_LONGARM_GRIPSTOCK_TINT_A_2"), "2", 10},
                {GetHashKey("COMPONENT_LONGARM_GRIPSTOCK_TINT_A_3"), "3", 10},
                {GetHashKey("COMPONENT_LONGARM_GRIPSTOCK_TINT_A_4"), "4", 10},
                {GetHashKey("COMPONENT_LONGARM_GRIPSTOCK_TINT_A_5"), "5", 10},
                {GetHashKey("COMPONENT_LONGARM_GRIPSTOCK_TINT_A_6"), "6", 10},
                {GetHashKey("COMPONENT_LONGARM_GRIPSTOCK_TINT_A_7"), "7", 10},
                {GetHashKey("COMPONENT_LONGARM_GRIPSTOCK_TINT_A_8"), "8", 10},
                {GetHashKey("COMPONENT_LONGARM_GRIPSTOCK_TINT_B_1"), "9", 10},
                {GetHashKey("COMPONENT_LONGARM_GRIPSTOCK_TINT_B_2"), "10", 10},
                {GetHashKey("COMPONENT_LONGARM_GRIPSTOCK_TINT_B_3"), "11", 10},
                {GetHashKey("COMPONENT_LONGARM_GRIPSTOCK_TINT_B_4"), "12", 10},
                {GetHashKey("COMPONENT_LONGARM_GRIPSTOCK_TINT_B_5"), "13", 10},
                {GetHashKey("COMPONENT_LONGARM_GRIPSTOCK_TINT_B_6"), "14", 10},
                {GetHashKey("COMPONENT_LONGARM_GRIPSTOCK_TINT_B_7"), "15", 10},
                {GetHashKey("COMPONENT_LONGARM_GRIPSTOCK_TINT_B_8"), "16", 10},
                {GetHashKey("COMPONENT_LONGARM_GRIPSTOCK_TINT_GUTTAPERCHA"), "17", 10},
                {GetHashKey("COMPONENT_LONGARM_GRIPSTOCK_TINT_PEARL"), "18", 10},
                {GetHashKey("COMPONENT_LONGARM_GRIPSTOCK_TINT_GRAY_BIRCH"), "19", 10},
                {GetHashKey("COMPONENT_LONGARM_GRIPSTOCK_TINT_BURLED"), "20", 10},
            }
        }, 
        [15] = {
            id = "gripstock_engraving",
            label = "Gripstock Engraving",
            items = {
                {GetHashKey("COMPONENT_LONGARM_GRIPSTOCK_ENGRAVING_1"), "1", 10},
                {GetHashKey("COMPONENT_LONGARM_GRIPSTOCK_ENGRAVING_2"), "2", 10},
                {GetHashKey("COMPONENT_LONGARM_GRIPSTOCK_ENGRAVING_3"), "3", 10},
                {GetHashKey("COMPONENT_LONGARM_GRIPSTOCK_ENGRAVING_4"), "4", 10},
                {GetHashKey("COMPONENT_LONGARM_GRIPSTOCK_ENGRAVING_5"), "5", 10},
                {GetHashKey("COMPONENT_LONGARM_GRIPSTOCK_ENGRAVING_6"), "6", 10},
            }
        }, 
        [16] = {
            
            id = "wrap_material",
            disabled = false,
            label = "Wrap Material",
            items = {
                {GetHashKey("COMPONENT_LONGARM_WRAP_MATERIAL_LEATHER"), "Leather", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_MATERIAL_CLOTH"), "Cloth", 10},
            }
        },  
        [17] = {
            id = "wrap_tint",
            disabled = false,
            label = "Wrap Tint",
            items = {
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_WHITE"), "White", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_BLACK"), "Black", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_A_1"), "1", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_A_2"), "2", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_A_3"), "3", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_A_4"), "4", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_A_5"), "5", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_A_6"), "6", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_A_7"), "7", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_A_8"), "8", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_B_1"), "9", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_B_2"), "10", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_B_3"), "11", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_B_4"), "12", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_B_5"), "13", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_B_6"), "14", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_B_7"), "15", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_B_8"), "16", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_C_1"), "17", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_C_2"), "18", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_C_3"), "19", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_C_4"), "20", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_C_5"), "21", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_C_6"), "22", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_C_7"), "23", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_C_8"), "24", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_C_9"), "25", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_D_1"), "26", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_D_2"), "27", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_D_3"), "28", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_D_4"), "29", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_D_5"), "30", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_D_6"), "31", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_D_7"), "32", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_D_8"), "33", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_POLKADOT_DEFAULT"), "Polkadot", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_POLKADOT_1"), "Polkadot 1", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_POLKADOT_2"), "Polkadot 2", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_POLKADOT_3"), "Polkadot 3", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_POLKADOT_4"), "Polkadot 4", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_POLKADOT_5"), "Polkadot 5", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_NATIVE_DEFAULT"), "Native", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_NATIVE_1"), "Native 1", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_NATIVE_2"), "Native 2", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_NATIVE_3"), "Native 3", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_NATIVE_4"), "Native 4", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_NATIVE_5"), "Native 5", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_TARTAN_DEFAULT"), "Tartan", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_TARTAN_1"), "Tartan 1", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_TARTAN_2"), "Tartan 2", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_TARTAN_3"), "Tartan 3", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_TARTAN_4"), "Tartan 4", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_TARTAN_5"), "Tartan 5", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_E_1"), "34", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_E_2"), "35", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_E_3"), "36", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_E_4"), "37", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_E_5"), "38", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_E_6"), "39", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_E_7"), "40", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_E_8"), "41", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_E_9"), "42", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_E_10"), "43", 10},
            }
        },
        [18] = {
            id = "strap",
            label = "Strap",
            items = {
                {GetHashKey("COMPONENT_REPEATER_STRAP01"), "1", 10},
                {GetHashKey("COMPONENT_RIFLE_CS_STRAP01"), "2", 10},
                {GetHashKey("COMPONENT_REPEATER_CLOTH_STRAP01"), "3", 10},
                {GetHashKey("COMPONENT_LEFTSHOULDER_STRAP01"), "4", 10},
            }
        },          
        [19] = {
            id = "strap_tint",
            disabled = false,
            label = "Strap Tint",
            items = {
                {GetHashKey("COMPONENT_LONGARM_STRAP_TINT_A_1"), "1", 10},
                {GetHashKey("COMPONENT_LONGARM_STRAP_TINT_A_2"), "2", 10},
                {GetHashKey("COMPONENT_LONGARM_STRAP_TINT_A_3"), "3", 10},
                {GetHashKey("COMPONENT_LONGARM_STRAP_TINT_A_4"), "4", 10},
                {GetHashKey("COMPONENT_LONGARM_STRAP_TINT_A_5"), "5", 10},
                {GetHashKey("COMPONENT_LONGARM_STRAP_TINT_A_6"), "6", 10},
                {GetHashKey("COMPONENT_LONGARM_STRAP_TINT_A_7"), "7", 10},
                {GetHashKey("COMPONENT_LONGARM_STRAP_TINT_A_8"), "8", 10},
            }
        }, 
        [20] = {
            id = "barrel_rifling",
            label = "Barrel Rifling",
            items = {
                {GetHashKey("COMPONENT_LONGARM_BARREL_RIFLING_1"), "1", 10},
            }
        }, 
        [21] = {
            id = "scope",
            label = "Scopes",
            items = {
                {GetHashKey("COMPONENT_RIFLE_SCOPE02"), "Scope 02", 100000},
                {GetHashKey("COMPONENT_RIFLE_SCOPE03"), "Scope 03", 100000},
                {GetHashKey("COMPONENT_RIFLE_SCOPE04"), "Scope 04", 100000},
            }
        },
    },
    Shotgun = {
        [1] = {
            id = "cylinder_engraving",
            label = "Cylinder Engraving",
            items = {
                {GetHashKey("COMPONENT_SHOTGUN_CYLINDER_ENGRAVING_1"), "1", 10},
                {GetHashKey("COMPONENT_SHOTGUN_CYLINDER_ENGRAVING_2"), "2", 10},
                {GetHashKey("COMPONENT_SHOTGUN_CYLINDER_ENGRAVING_3"), "3", 10},
                {GetHashKey("COMPONENT_SHOTGUN_CYLINDER_ENGRAVING_4"), "4", 10},
            }
        },
        [2] = {
            id = "frame_engraving",
            label = "Frame Engraving",
            items = {
                {GetHashKey("COMPONENT_SHOTGUN_FRAME_ENGRAVING_1"), "1", 10},
                {GetHashKey("COMPONENT_SHOTGUN_FRAME_ENGRAVING_2"), "2", 10},
                {GetHashKey("COMPONENT_SHOTGUN_FRAME_ENGRAVING_3"), "3", 10},
                {GetHashKey("COMPONENT_SHOTGUN_FRAME_ENGRAVING_4"), "4", 10},
            }
        },
        [3] = {
            id = "barrel_engraving",
            label = "Barrel Engraving",
            items = {
                {GetHashKey("COMPONENT_SHOTGUN_BARREL_ENGRAVING_1"), "1", 10},
                {GetHashKey("COMPONENT_SHOTGUN_BARREL_ENGRAVING_2"), "2", 10},
                {GetHashKey("COMPONENT_SHOTGUN_BARREL_ENGRAVING_3"), "3", 10},
                {GetHashKey("COMPONENT_SHOTGUN_BARREL_ENGRAVING_4"), "4", 10},
            }
        },
        [4] = {
            id = "wrap_tint",
            disabled = false,
            label = "Wrap Tint",
            items = {
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_WHITE"), "White", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_BLACK"), "Black", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_A_1"), "1", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_A_2"), "2", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_A_3"), "3", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_A_4"), "4", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_A_5"), "5", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_A_6"), "6", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_A_7"), "7", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_A_8"), "8", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_B_1"), "9", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_B_2"), "10", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_B_3"), "11", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_B_4"), "12", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_B_5"), "13", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_B_6"), "14", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_B_7"), "15", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_B_8"), "16", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_C_1"), "17", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_C_2"), "18", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_C_3"), "19", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_C_4"), "20", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_C_5"), "21", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_C_6"), "22", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_C_7"), "23", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_C_8"), "24", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_C_9"), "25", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_D_1"), "26", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_D_2"), "27", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_D_3"), "28", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_D_4"), "29", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_D_5"), "30", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_D_6"), "31", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_D_7"), "32", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_D_8"), "33", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_POLKADOT_DEFAULT"), "Polkadot", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_POLKADOT_1"), "Polkadot 1", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_POLKADOT_2"), "Polkadot 2", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_POLKADOT_3"), "Polkadot 3", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_POLKADOT_4"), "Polkadot 4", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_POLKADOT_5"), "Polkadot 5", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_NATIVE_DEFAULT"), "Native", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_NATIVE_1"), "Native 1", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_NATIVE_2"), "Native 2", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_NATIVE_3"), "Native 3", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_NATIVE_4"), "Native 4", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_NATIVE_5"), "Native 5", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_TARTAN_DEFAULT"), "Tartan", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_TARTAN_1"), "Tartan 1", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_TARTAN_2"), "Tartan 2", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_TARTAN_3"), "Tartan 3", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_TARTAN_4"), "Tartan 4", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_TARTAN_5"), "Tartan 5", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_E_1"), "34", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_E_2"), "35", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_E_3"), "36", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_E_4"), "37", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_E_5"), "38", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_E_6"), "39", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_E_7"), "40", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_E_8"), "41", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_E_9"), "42", 10},
                {GetHashKey("COMPONENT_LONGARM_WRAP_TINT_E_10"), "43", 10},
            }
        },
        [5] = {
            id = "gripstock_tint",
            disabled = false,
            label = "Gripstock Tint",
            items = {
                {GetHashKey("COMPONENT_LONGARM_GRIPSTOCK_TINT_A_1"), "1", 10},
                {GetHashKey("COMPONENT_LONGARM_GRIPSTOCK_TINT_A_2"), "2", 10},
                {GetHashKey("COMPONENT_LONGARM_GRIPSTOCK_TINT_A_3"), "3", 10},
                {GetHashKey("COMPONENT_LONGARM_GRIPSTOCK_TINT_A_4"), "4", 10},
                {GetHashKey("COMPONENT_LONGARM_GRIPSTOCK_TINT_A_5"), "5", 10},
                {GetHashKey("COMPONENT_LONGARM_GRIPSTOCK_TINT_A_6"), "6", 10},
                {GetHashKey("COMPONENT_LONGARM_GRIPSTOCK_TINT_A_7"), "7", 10},
                {GetHashKey("COMPONENT_LONGARM_GRIPSTOCK_TINT_A_8"), "8", 10},
                {GetHashKey("COMPONENT_LONGARM_GRIPSTOCK_TINT_B_1"), "9", 10},
                {GetHashKey("COMPONENT_LONGARM_GRIPSTOCK_TINT_B_2"), "10", 10},
                {GetHashKey("COMPONENT_LONGARM_GRIPSTOCK_TINT_B_3"), "11", 10},
                {GetHashKey("COMPONENT_LONGARM_GRIPSTOCK_TINT_B_4"), "12", 10},
                {GetHashKey("COMPONENT_LONGARM_GRIPSTOCK_TINT_B_5"), "13", 10},
                {GetHashKey("COMPONENT_LONGARM_GRIPSTOCK_TINT_B_6"), "14", 10},
                {GetHashKey("COMPONENT_LONGARM_GRIPSTOCK_TINT_B_7"), "15", 10},
                {GetHashKey("COMPONENT_LONGARM_GRIPSTOCK_TINT_B_8"), "16", 10},
                {GetHashKey("COMPONENT_LONGARM_GRIPSTOCK_TINT_GUTTAPERCHA"), "17", 10},
                {GetHashKey("COMPONENT_LONGARM_GRIPSTOCK_TINT_PEARL"), "18", 10},
                {GetHashKey("COMPONENT_LONGARM_GRIPSTOCK_TINT_GRAY_BIRCH"), "19", 10},
                {GetHashKey("COMPONENT_LONGARM_GRIPSTOCK_TINT_BURLED"), "20", 10},
            }
        }, 
    },
    Blades = {
        [1] = {
            id = "blade_material",
            disabled = false,
            label = "Blade Material",
            items = {
                {GetHashKey("COMPONENT_MELEE_BLADE_MATERIAL_1"), "1", 10},
                {GetHashKey("COMPONENT_MELEE_BLADE_MATERIAL_2"), "2", 10},
                {GetHashKey("COMPONENT_MELEE_BLADE_MATERIAL_3"), "3", 10},
                {GetHashKey("COMPONENT_MELEE_BLADE_MATERIAL_4"), "4", 10},
                {GetHashKey("COMPONENT_MELEE_BLADE_MATERIAL_5"), "5", 10},
                {GetHashKey("COMPONENT_MELEE_BLADE_MATERIAL_6"), "6", 10},
                {GetHashKey("COMPONENT_MELEE_BLADE_MATERIAL_7"), "7", 10},
                {GetHashKey("COMPONENT_MELEE_BLADE_MATERIAL_8"), "8", 10},
                {GetHashKey("COMPONENT_MELEE_BLADE_MATERIAL_9"), "9", 10},
            }
        }, 
        [2] = {
            id = "blade_engraving",
            label = "Blade Engraving",
            items = {
                {GetHashKey("COMPONENT_MELEE_BLADE_ENGRAVING_1"), "1", 10},
                {GetHashKey("COMPONENT_MELEE_BLADE_ENGRAVING_2"), "2", 10},
                {GetHashKey("COMPONENT_MELEE_BLADE_ENGRAVING_3"), "3", 10},
            }
        }, 
        [3] = {
            id = "blade_engraving_material",
            disabled = false,
            label = "Blade Engraving Material",
            items = {
                {GetHashKey("COMPONENT_MELEE_BLADE_ENGRAVING_MATERIAL_1"), "1", 10},
                {GetHashKey("COMPONENT_MELEE_BLADE_ENGRAVING_MATERIAL_2"), "2", 10},
                {GetHashKey("COMPONENT_MELEE_BLADE_ENGRAVING_MATERIAL_3"), "3", 10},
                {GetHashKey("COMPONENT_MELEE_BLADE_ENGRAVING_MATERIAL_4"), "4", 10},
                {GetHashKey("COMPONENT_MELEE_BLADE_ENGRAVING_MATERIAL_5"), "5", 10},
                {GetHashKey("COMPONENT_MELEE_BLADE_ENGRAVING_MATERIAL_6"), "6", 10},
                {GetHashKey("COMPONENT_MELEE_BLADE_ENGRAVING_MATERIAL_7"), "7", 10},
                {GetHashKey("COMPONENT_MELEE_BLADE_ENGRAVING_MATERIAL_8"), "8", 10},
                {GetHashKey("COMPONENT_MELEE_BLADE_ENGRAVING_MATERIAL_9"), "9", 10},
                {GetHashKey("COMPONENT_MELEE_BLADE_ENGRAVING_MATERIAL_11"), "11", 10},
                {GetHashKey("COMPONENT_MELEE_BLADE_ENGRAVING_MATERIAL_12"), "12", 10},
                {GetHashKey("COMPONENT_MELEE_BLADE_ENGRAVING_MATERIAL_13"), "13", 10},
                {GetHashKey("COMPONENT_MELEE_BLADE_ENGRAVING_MATERIAL_14"), "14", 10},
            }
        },  
        [4] = {
            id = "grip",
            label = "Grips",
            items = {
                {GetHashKey("COMPONENT_MELEE_KNIFE02_GRIP"), "1", 10},
                {GetHashKey("COMPONENT_MELEE_KNIFE13_GRIP"), "2", 10},
            }
        },
        [5] = {
            id = "grip_tint",
            label = "Grip Tint",
            items = {
                {GetHashKey("COMPONENT_MELEE_GRIP_TINT_A_1"), "1", 10},
                {GetHashKey("COMPONENT_MELEE_GRIP_TINT_A_2"), "2", 10},
                {GetHashKey("COMPONENT_MELEE_GRIP_TINT_A_3"), "3", 10},
                {GetHashKey("COMPONENT_MELEE_GRIP_TINT_A_4"), "4", 10},
                {GetHashKey("COMPONENT_MELEE_GRIP_TINT_A_5"), "5", 10},
                {GetHashKey("COMPONENT_MELEE_GRIP_TINT_A_6"), "6", 10},
                {GetHashKey("COMPONENT_MELEE_GRIP_TINT_A_7"), "7", 10},
                {GetHashKey("COMPONENT_MELEE_GRIP_TINT_A_8"), "8", 10},
                {GetHashKey("COMPONENT_MELEE_GRIP_TINT_B_1"), "9", 10},
                {GetHashKey("COMPONENT_MELEE_GRIP_TINT_B_2"), "10", 10},
                {GetHashKey("COMPONENT_MELEE_GRIP_TINT_B_3"), "11", 10},
                {GetHashKey("COMPONENT_MELEE_GRIP_TINT_B_4"), "12", 10},
                {GetHashKey("COMPONENT_MELEE_GRIP_TINT_B_5"), "13", 10},
                {GetHashKey("COMPONENT_MELEE_GRIP_TINT_B_6"), "14", 10},
                {GetHashKey("COMPONENT_MELEE_GRIP_TINT_B_7"), "15", 10},
                {GetHashKey("COMPONENT_MELEE_GRIP_TINT_B_8"), "16", 10},
                {GetHashKey("COMPONENT_MELEE_GRIP_TINT_GRAY_BIRCH"), "17", 10},
            }
        },
    },    
    Blades2 = {
        [1] = {
            id = "grip",
            label = "Grips",
            items = {
                {GetHashKey("COMPONENT_MELEE_KNIFE02_GRIP"), "1", 10},
                {GetHashKey("COMPONENT_MELEE_KNIFE13_GRIP"), "2", 10},
            }
        },
        [2] = {
            id = "blade_material",
            disabled = false,
            label = "Blade Material",
            items = {
                {GetHashKey("COMPONENT_MELEE_BLADE_MATERIAL_1"), "1", 10},
                {GetHashKey("COMPONENT_MELEE_BLADE_MATERIAL_2"), "2", 10},
                {GetHashKey("COMPONENT_MELEE_BLADE_MATERIAL_3"), "3", 10},
                {GetHashKey("COMPONENT_MELEE_BLADE_MATERIAL_4"), "4", 10},
                {GetHashKey("COMPONENT_MELEE_BLADE_MATERIAL_5"), "5", 10},
                {GetHashKey("COMPONENT_MELEE_BLADE_MATERIAL_6"), "6", 10},
                {GetHashKey("COMPONENT_MELEE_BLADE_MATERIAL_7"), "7", 10},
                {GetHashKey("COMPONENT_MELEE_BLADE_MATERIAL_8"), "8", 10},
                {GetHashKey("COMPONENT_MELEE_BLADE_MATERIAL_9"), "9", 10},
            }
        }, 
    },
}
