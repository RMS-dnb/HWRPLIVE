Config = {}

-- Zone definitions with coordinates and modifiers
Config.SellZones = {
    -- ALLOWED SELLING ZONES
    valentine = {
        name = "Valentine",
        coords = vector3(-281.0, 804.0, 119.0),
        radius = 150.0,
        enabled = true,
        modifiers = {
            acceptMod = 1.0,
            priceMod = 1.0,
            alertMod = 1.0
        },
        allowedItems = {"weedjoint", "moonshine"}, -- No weed in town
        riskLevel = "high",
        description = "Town center - High risk, lower prices"
    },
    
    strawberry = {
        name = "Strawberry",
        coords = vector3(-1759.0, -388.0, 157.0),
        radius = 120.0,
        enabled = true,
        modifiers = {
            acceptMod = 1.0,
            priceMod = 1.0,
            alertMod = 1.0
        },
        allowedItems = {"weedjoint", "moonshine"},
        riskLevel = "high",
        description = "Small town - Moderate risk"
    },
    
    rhodes = {
        name = "Rhodes",
        coords = vector3(1225.0, -1293.0, 76.0),
        radius = 130.0,
        enabled = true,
        modifiers = {
            acceptMod = 1.0,
            priceMod = 1.0,
            alertMod = 1.0
        },
        allowedItems = {"weedjoint", "moonshine"},
        riskLevel = "medium",
        description = "Trading town - Lower risk than Valentine"
    },
    van_horn = {
        name = "Van Horn Trading Post",
        coords = vector3(2930.0, 570.0, 44.0),
        radius = 100.0,
        enabled = true,
        modifiers = {
            acceptMod = 1.0,
            priceMod = 1.0,
            alertMod = 1.0
        },
        allowedItems = {"weedjoint", "moonshine"},
        riskLevel = "medium",
        description = "Lawless trading post - Good prices, some risk"
    },
    thieves_landing = {
        name = "Thieves' Landing",
        coords = vector3(-1400.0, -2300.0, 43.0),
        radius = 80.0,
        enabled = true,
        modifiers = {
            acceptMod = 1.0,
            priceMod = 1.0,
            alertMod = 1.0
        },
        allowedItems = {"weedjoint", "moonshine"},
        riskLevel = "low",
        description = "Outlaw haven - Best prices, very safe"
    },
    saint_denis = {
        name = "Saint Denis",
        coords = vector3(2635.0, -1224.0, 53.0),
        radius = 300.0,
        enabled = true,
        modifiers = {
            acceptMod = 1.0,
            priceMod = 1.3,
            alertMod = 1.3
        },
        allowedItems = {"weedjoint", "moonshine"},
        riskLevel = "low",
        description = "Outlaw haven - Best prices, very safe"
    },
    blackwater = {
        name = "Blackwater",
        coords = vector3(-786.0, -1268.0, 43.0),
        radius = 200.0,
        enabled = true,
        modifiers = {
            acceptMod = 1.0,
            priceMod = 1.3,
            alertMod = 1.3
        },
        allowedItems = {"weedjoint", "moonshine"},
        riskLevel = "low",
        description = "Outlaw haven - Best prices, very safe"
    },
    
    -- WILDERNESS ZONES (Safe areas)
    --bayou_nwa = {
    --    name = "Bayou NWA",
    --    coords = vector3(2217.0, -599.0, 42.0),
    --    radius = 200.0,
    --    enabled = true,
    --    modifiers = {
    --        acceptMod = 0.3,
    --        priceMod = 1.1,
    --        alertMod = 0.5
    --    },
    --    allowedItems = {"weedjoint", "cigarettes", "moonshine"},
    --    riskLevel = "low",
    --    description = "Remote bayou - Safe but fewer customers"
    --},
    --
    --big_valley = {
    --    name = "Big Valley",
    --    coords = vector3(-1200.0, 300.0, 95.0),
    --    radius = 250.0,
    --    enabled = true,
    --    modifiers = {
    --        acceptMod = 0.25,
    --        priceMod = 1.05,
    --        alertMod = 0.6
    --    },
    --    allowedItems = {"weedjoint", "cigarettes", "moonshine"},
    --    riskLevel = "low",
    --    description = "Isolated valley - Good for contraband"
    --},
    --
    --cumberland_forest = {
    --    name = "Cumberland Forest",
    --    coords = vector3(310.0, 1000.0, 180.0),
    --    radius = 180.0,
    --    enabled = true,
    --    modifiers = {
    --        acceptMod = 0.2,
    --        priceMod = 1.0,
    --        alertMod = 0.7
    --    },
    --    allowedItems = {"weedjoint", "cigarettes", "moonshine"},
    --    riskLevel = "low",
    --    description = "Forest hideout - Decent safety"
    --},
    
}

-- RESTRICTED ZONES (No selling allowed)
Config.RestrictedZones = {
    --saint_denis = {
    --    name = "Saint Denis",
    --    coords = vector3(2635.0, -1224.0, 53.0),
    --    radius = 300.0,
    --    reason = "Too much law enforcement presence"
    --},
    --
    --blackwater = {
    --    name = "Blackwater",
    --    coords = vector3(-786.0, -1268.0, 43.0),
    --    radius = 200.0,
    --    reason = "Heavy law enforcement patrols"
    --},
    
    armadillo = {
        name = "Armadillo",
        coords = vector3(-3700.0, -2600.0, -13.0),
        radius = 150.0,
        reason = "Quarantined area - too dangerous"
    },

    tumbleweed = {
        name = "Tumbleweed",
        coords = vector3(-5513.09, -2943.29, -1.98),
        radius = 150.0,
        reason = "Quarantined area - too dangerous"
    },

    wapiti = {
        name = "Wapiti",
        coords = vector3(445.2, 2221.36, 247.34),
        radius = 150.0,
        reason = "Quarantined area - too dangerous"
    },
    
    -- Government buildings and law offices
    --valentine_sheriff = {
    --    name = "Valentine Sheriff's Office",
    --    coords = vector3(-275.0, 809.0, 119.0),
    --    radius = 25.0,
    --    reason = "Too close to law enforcement"
    --},
    --
    --strawberry_sheriff = {
    --    name = "Strawberry Sheriff's Office", 
    --    coords = vector3(-1762.0, -386.0, 157.0),
    --    radius = 25.0,
    --    reason = "Too close to law enforcement"
    --},
    --
    --rhodes_sheriff = {
    --    name = "Rhodes Sheriff's Office",
    --    coords = vector3(1361.0, -1302.0, 77.0),
    --    radius = 25.0,
    --    reason = "Too close to law enforcement"
    --}
}

-- Zone check settings
Config.ZoneSettings = {
    checkInterval = 10000, -- Check every second
    showZoneNotifications = false,
    showZoneBlips = false, -- Set to true if you want zone blips on map
    debugMode = false -- Set to true for debug prints
}