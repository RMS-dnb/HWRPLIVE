Config = {}

Config.DevMode = false    -- activate the dev category
Config.GoreBodies = false -- activate the gore bodies category, false is recommended

Config.framework = "rsg-core" --- "vorp" or "REDEMRP2k23" or "rsg-core"

Config.MenuCommand = "openmenu" --- nil if you don't want a command to open the menu
Config.NativePrompt = true     -- if you want to use the native prompt instead of the interaction menu
Config.OutfitItem = "clothes"     ---- Outfit item

Config.LoadClothesCommand = "loadclothes"
Config.ClothesManagement = {
    Command = "ClothesManagement", --- nil or Command to open the clothes management menu
    Keybind = 0x70                 --(default F1) nil or keybind must be from https://learn.microsoft.com/en-us/windows/win32/inputdev/virtual-key-codes
}

Config.SingleItemCategory = { ---- Category that will not be in the outfit but in single items `[itemname] = {category1, category2}`
    -- ["hat"] = { "hats", "hat_accessories" },
    -- ["masque"] = { "masks", "masks_large" },
    -- ["glasses"] = { "eyewear" },

}

Config.JobLocked = { --- categories that will shows up only to specified jobs in shops `[category] = {{"job1", grade}, {"job2", grade}}`
    -- ["jewelry_rings_right"] = { { "jeweler", 2 }, { "jeweler2", 2 } },
    -- ["jewelry_rings_left"] = { { "jeweler", 2 }, { "jeweler2", 2 } },
    -- ["jewelry_bracelets"] = { { "jeweler", 2 }, { "jeweler2", 2 } },
}

Config.Shops = {
    ["Saint Denis Tailor"] = vector3(2554.636, -1170.411, 53.68349),
    ["Blackwater Tailor"] = vector3(-765.33, -1292.47, 43.88),
    ["Van Horn Tailor"] = vector3(2949.7, 472.71, 48.64),
    ["Annesburg Tailor"] = vector3(2921.6, 1371.82, 45.39),
    ["Rhodes Tailor"] = vector3(1326.07, -1289.79, 80.27),
    ["Valentine Tailor"] = vector3(-328.27, 774.8, 121.68),
    ["Strawberry Tailor"] = vector3(-1818.49, -368.66, 163.31),
    ["Armadillo Tailor"] = vector3(-3657.55, -2623.78, -10.37),
    ["Tumbleweed Tailor"] = vector3(-5484.42, -2933.58, -0.35),
    ["Guarma Tailor"] = vector3(1271.76, -6904.59, 45.2),
}

-- Config.Removecategories = { ---- Modify the F1 menu to remove categories
--     head = {
--         "hats", "masks", "eyewear", "headwear", "face_props",
--         "hat_accessories", "masks_large"
--     },
--     neck = {
--         "neckties", "neckwear", "neckerchiefs"
--     },
--     torso = {
--         "coats", "coats_heavy", "coats_closed", "cloaks", "ponchos",
--         "vests", "suspenders", "overalls_full", "shirts_full_overpants",
--         "unionsuits_full", "overalls_modular_uppers"
--     },
--     shirts = {
--         "shirts_full", "lduvmjua_0x2b388a05"
--     },
--     legs = {
--         "pants", "pants_accessories", "spats", "belts", "skirts"
--     },
--     feet = {
--         "boot_accessories", "chaps", "boots", "aprons"
--     },
--     hands = {
--         "gloves"
--     },
--     weapons = {
--         "gunbelts", "holsters_right", "holsters_knife", "loadouts",
--         "holsters_left", "holsters_crossdraw", "holsters_center",
--         "gunbelt_accs", "holsters_quivers", "ammo_pistols"
--     },
--     accessories = {
--         "jewelry_necklaces", "gloves", "belts", "neckwear",
--         "neckerchiefs", "neckties", "accessories", "jewelry_earrings",
--         "jewelry_bracelets", "aprons", "gauntlets", "chaps",
--         "satchels", "jewelry_rings_left", "wrist_bindings",
--         "belt_buckles", "badges", "jewelry_rings_right",
--         "ankle_bindings", "mbbwboia_0x42e8f927", "pants_accessories",
--         "coat_accessories", "armor"
--     }
-- }
Config.Removecategories = {
    hats = {
        items = { "hats" },
        label = "Hats"
    },
    masks = {
        items = { "masks" },
        label = "Masks"
    },
    eyewear = {
        items = { "eyewear" },
        label = "Glasses"
    },
    headwear = {
        items = { "headwear" },
        label = "Head Accessories"
    },
    face_props = {
        items = { "face_props" },
        label = "Face Props"
    },
    hat_accessories = {
        items = { "hat_accessories" },
        label = "Hat Accessories"
    },
    masks_large = {
        items = { "masks_large" },
        label = "Large Masks"
    },
    neckties = {
        items = { "neckties" },
        label = "Ties"
    },
    neckwear = {
        items = { "neckwear" },
        label = "Neck Accessories"
    },
    neckerchiefs = {
        items = { "neckerchiefs" },
        label = "Scarves"
    },
    coats = {
        items = { "coats" },
        label = "Coats"
    },
    coats_heavy = {
        items = { "coats_heavy" },
        label = "Heavy Coats"
    },
    coats_closed = {
        items = { "coats_closed" },
        label = "Closed Coats"
    },
    cloaks = {
        items = { "cloaks" },
        label = "Cloaks"
    },
    ponchos = {
        items = { "ponchos" },
        label = "Ponchos"
    },
    vests = {
        items = { "vests" },
        label = "Vests"
    },
    suspenders = {
        items = { "suspenders" },
        label = "Suspenders"
    },
    overalls_full = {
        items = { "overalls_full" },
        label = "Full Overalls"
    },
    shirts_full_overpants = {
        items = { "shirts_full_overpants" },
        label = "Shirts Over Pants"
    },
    unionsuits_full = {
        items = { "unionsuits_full" },
        label = "Full Union Suits"
    },
    overalls_modular_uppers = {
        items = { "overalls_modular_uppers" },
        label = "Modular Upper Overalls"
    },
    shirts_full = {
        items = { "shirts_full" },
        label = "Full Shirts"
    },
    lduvmjua_0x2b388a05 = {
        items = { "lduvmjua_0x2b388a05" },
        label = "Special Shirt (Hash)"
    },
    pants = {
        items = { "pants" },
        label = "Pants"
    },
    pants_accessories = {
        items = { "pants_accessories" },
        label = "Pants Accessories"
    },
    spats = {
        items = { "spats" },
        label = "Spats"
    },
    belts = {
        items = { "belts" },
        label = "Belts"
    },
    skirts = {
        items = { "skirts" },
        label = "Skirts"
    },
    boot_accessories = {
        items = { "boot_accessories" },
        label = "Boot Accessories"
    },
    chaps = {
        items = { "chaps" },
        label = "Chaps"
    },
    boots = {
        items = { "boots" },
        label = "Boots"
    },
    aprons = {
        items = { "aprons" },
        label = "Aprons"
    },
    gloves = {
        items = { "gloves" },
        label = "Gloves"
    },
    gunbelts = {
        items = { "gunbelts" },
        label = "Gun Belts"
    },
    holsters_right = {
        items = { "holsters_right" },
        label = "Holsters (Right)"
    },
    holsters_knife = {
        items = { "holsters_knife" },
        label = "Knife Holsters"
    },
    loadouts = {
        items = { "loadouts" },
        label = "Loadouts"
    },
    holsters_left = {
        items = { "holsters_left" },
        label = "Holsters (Left)"
    },
    holsters_crossdraw = {
        items = { "holsters_crossdraw" },
        label = "Crossdraw Holsters"
    },
    holsters_center = {
        items = { "holsters_center" },
        label = "Center Holsters"
    },
    gunbelt_accs = {
        items = { "gunbelt_accs" },
        label = "Gun Belt Accessories"
    },
    holsters_quivers = {
        items = { "holsters_quivers" },
        label = "Quivers"
    },
    ammo_pistols = {
        items = { "ammo_pistols" },
        label = "Pistol Ammo"
    },
    jewelry_necklaces = {
        items = { "jewelry_necklaces" },
        label = "Necklaces"
    },
    accessories = {
        items = { "accessories" },
        label = "General Accessories"
    },
    jewelry_earrings = {
        items = { "jewelry_earrings" },
        label = "Earrings"
    },
    jewelry_bracelets = {
        items = { "jewelry_bracelets" },
        label = "Bracelets"
    },
    gauntlets = {
        items = { "gauntlets" },
        label = "Gauntlets"
    },
    satchels = {
        items = { "satchels" },
        label = "Satchels"
    },
    jewelry_rings_left = {
        items = { "jewelry_rings_left" },
        label = "Rings (Left Hand)"
    },
    wrist_bindings = {
        items = { "wrist_bindings" },
        label = "Wrist Bindings"
    },
    belt_buckles = {
        items = { "belt_buckles" },
        label = "Belt Buckles"
    },
    badges = {
        items = { "badges" },
        label = "Badges"
    },
    jewelry_rings_right = {
        items = { "jewelry_rings_right" },
        label = "Rings (Right Hand)"
    },
    ankle_bindings = {
        items = { "ankle_bindings" },
        label = "Ankle Bindings"
    },
    mbbwboia_0x42e8f927 = {
        items = { "mbbwboia_0x42e8f927" },
        label = "Special Accessory (Hash)"
    },
    coat_accessories = {
        items = { "coat_accessories" },
        label = "Coat Accessories"
    },
    armor = {
        items = { "armor" },
        label = "Armor"
    }
}



Config.Price = {
    -- Male Head Categories
    ["hats"] = 2,
    ["masks"] = 2,
    ["eyewear"] = 1,
    ["headwear"] = 2,
    ["face_props"] = 2,
    ["hat_accessories"] = 1,
    ["masks_large"] = 3,

    -- Male Upper Categories
    ["coats"] = 3,
    ["shirts_full"] = 2,
    ["lduvmjua_0x2b388a05"] = 2,
    ["vests"] = 2,
    ["suspenders"] = 2,
    ["unionsuits_full"] = 3,
    ["overalls_full"] = 3,
    ["shirts_full_overpants"] = 3,
    ["cloaks"] = 3,
    ["overalls_modular_uppers"] = 3,
    ["coats_closed"] = 3,
    ["outfits"] = 6,
    ["coats_heavy"] = 5,
    ["ponchos"] = 3,

    -- Male Lower Categories
    ["pants"] = 3,
    ["overalls_modular_lowers"] = 2,
    ["dresses"] = 3,
    ["skirts"] = 3,
    ["unionsuit_legs"] = 2,

    -- Male Feet Categories
    ["boots"] = 3,
    ["boot_accessories"] = 2,
    ["spats"] = 2,

    -- Male Accessories Categories
    ["neckerchiefs"] = 2,
    ["neckties"] = 1,
    ["gloves"] = 1,
    ["belts"] = 2,
    ["accessories"] = 2,
    ["badges"] = 2,
    ["satchels"] = 2,
    ["neckwear"] = 2,
    ["jewelry_necklaces"] = 4,
    ["jewelry_rings"] = 3,
    ["vest_accessories"] = 2,
    ["hair_accessories"] = 2,
    ["aprons"] = 2,
    ["coat_accessories"] = 2,
    ["chaps"] = 2,
    ["pants_accessories"] = 2,
    ["armor"] = 6,
    ["jewelry_bracelets"] = 3,
    ["wrist_bindings"] = 2,
    ["gauntlets"] = 2,
    ["ankle_bindings"] = 2,
    ["belt_buckles"] = 2,
    ["jewelry_rings_right"] = 3,
    ["jewelry_rings_left"] = 3,
    ["satchel_straps"] = 2,
    ["jewelry_earrings"] = 3,

    -- Male Weapons Categories
    ["gunbelts"] = 4,
    ["holsters_right"] = 3,
    ["holsters_knife"] = 2,
    ["loadouts"] = 6,
    ["holsters_left"] = 3,
    ["holsters_crossdraw"] = 3,
    ["holsters_center"] = 3,
    ["gunbelt_accs"] = 2,
    ["holsters_quivers"] = 3,
    ["ammo_pistols"] = 2,

    -- Female Specific Categories (adding only those not already included above)
    ["capes"] = 3,
    ["shawls"] = 2,
    ["corsets"] = 3,
    ["chemises"] = 2,
    ["knickers"] = 2,
    ["stockings"] = 2,
    ["nbtudvja_0x53b67599"] = 2,
    ["cnvfyaba_0xd7ae0d03"] = 3,
    ["gjrbmoma_0xcb39a6f4"] = 3,
    ["pnyvpusa_0x44f4c713"] = 3,
    ["ogoolgaa_0xecd61654"] = 3,
    ["gnuusvra_0x7024af8b"] = 3,
    ["oacpqvda_0x41292b6f"] = 3,
    ["ywkywwvb_0xe93b9f1b"] = 3,
    ["mbbwboia_0x42e8f927"] = 3,

    -- Other categories from wearablecategories
    ["hairs"] = 2,

    -- Bodies categories
    ["bodies_upper"] = 0, -- These are typically free as they're part of character creation
    ["bodies_lower"] = 0

    -- dev categories are not priced since they're dev-only
}

--- !!!! Changing the table below could result in stability issues, proceed at your own risk !!!! -----
Config.EssentialsCategories = { -- Categories that will not be removed when changing clothes, and not be saved when creating an outfit
    "bodies_upper",
    "bodies_lower",
    "heads",
    "hair",
    "hair_bonnet",
    "beard",
    "teeth",
    "eyes",
    "beards_chin",
    "beards_chops",
    "beards_mustache",
    "beards_complete",
}
