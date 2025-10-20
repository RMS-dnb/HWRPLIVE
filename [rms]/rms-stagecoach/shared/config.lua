
Config = Config or {}
Config.ItemName = "bankletter" -- Item name for the robbery
Config.DynamiteItem = "dynamite" -- Item name for the dynamite used in the robbery
Config.RewardsItem = {
    dirtymoneybag = {
        min = 5,
        max = 10,
        Item = "moneybag", -- Item player receives
        ObjectModel = "p_moneybag02x",
    },
    goldbar = {
        min = 2,
        max = 4,
        Item = "gold_bar", -- Item player receives
        ObjectModel = "s_pickup_goldbar01x",
    },
    detonatingcord = {
        min = 2,
        max = 4,
        Item = "detonatingcord", -- Item player receives
        ObjectModel = "p_bag01x",
    },
}





Config.MissionSettings = {
    WagonGuards = {
        SetPedAccuracy = 90, -- accuracy = 0-100, 100 being perfectly accurate
        SetEntityHealth = 100, -- health = 0-100, 100 being full health
        SetPedCombatMovement = 2, -- (0 - Stationary (Will just stand in place) (1 - Defensive (Will try to find cover and very likely to blind fire) (2 - Offensive (Will attempt to charge at enemy but take cover as well) (3 - Suicidal Offensive (Will try to flank enemy in a suicidal attack)
    },
    AttackRiders = {
        SetPedAccuracy = 90, -- accuracy = 0-100, 100 being perfectly accurate
        SetEntityHealth = 100, -- health = 0-100, 100 being full health
        RiderAmount = {
            min = 4, -- Minimum amount of riders that will spawn
            max = 6, -- Maximum amount of riders that will spawn
        },
    }
}
Config.Routes = { 
    [1] = {
        name = "Tumbleweed to Armadillo",
        wagonModel = "stagecoach004_2x",
        locationForBlip = vector3(-5673.20166015625, -2507.96875, -11.18878936767578),
        locations = {
            startpoint = vector3(-5673.20166015625, -2507.96875, -11.18878936767578),
            startpointHeading = -72.33027648925781,
            endpoint = vector3(-3718.445, -2610.510, -13.382),
        },
        hasBeenRobbed = false
    },
    [2] = {
        name = "Armadillo to Tumbleweed",
        wagonModel = "stagecoach004_2x",
        locationForBlip = vector3(-3486.392, -2637.285, -13.222),
        locations = {
            startpoint = vector3(-3486.392, -2637.285, -13.222),
            startpointHeading = 135.322,
            endpoint = vector3(-5569.555, -2957.346, -0.606),
        },
        hasBeenRobbed = false
    },
    [3] = {
        name = "Saint Denis to Valentine",
        wagonModel = "stagecoach004_2x",
        locationForBlip = vector3(2174.077, -951.164, 42.231),
        locations = {
            startpoint = vector3(2179.14453125, -950.03857421875, 41.67328643798828),
            startpointHeading = -76.42289733886719,
            endpoint = vector3(2966.502, 410.566, 49.474),
        },
        hasBeenRobbed = false
    },
    [4] = {
        name = "Valentine to Manzanita Post",
        wagonModel = "stagecoach004_2x",
        locationForBlip = vector3(-680.041, 336.988, 90.671),
        locations = {
            startpoint = vector3(-684.3294067382812, 334.8277893066406, 90.54928588867188),
            startpointHeading = 104.29256439208984,
            endpoint = vector3(-1953.646, -1629.177, 116.171),
        },
        hasBeenRobbed = false
    },
}

Config.PedReplies = {
    ["ALERT"] = {
        ["GOAWAY"] = 'stagecoachrobbery-stayback',
    },
    ["LAWMEN"] = {
        ["ESCORT"] = 'stagecoachrobbery-escsort',
    },

}