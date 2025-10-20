
Config = {}

Config.MinSwing = 3 -- Min Swings on a node
Config.MaxSwing = 3 -- Max Swings on a node

Config.Pickaxe = "pickaxe" -- Item from your database that you want to use for a pickaxe
Config.MinePromptKey = 0xD9D0E1C0 -- Key used to start Mining (Spacebar)
Config.StopMiningKey = 0x3B24C470 -- Key to stop Mining (F)
Config.MineKey = 0x07B8BEAF -- Key to Mine node (Left Click)

Config.PickaxeDamage = 0.1    -- Amount of damage done to pickaxe durability per mining node

Config.UseMinigame = false -- Use the minigame or not

----- lower number is harder
Config.minDifficulty = 4000
Config.maxDifficulty = 2700
---------------------------

Config.Language = {
    PromptLabel = "Mining",
    MinePrompt = "Mine",
    SwingPrompt = "Swing",
    StopPrompt = "Put Away"
}

-- mining locations
Config.MiningLocations = {


    -- Annesburg Mine           vector3(2788.6408, 1340.133, 71.31845)


    {coords = vector3(2760.2556, 1308.0678, 69.958702), showmarker = false, timeout = 180000, items = {
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(2760.04, 1303.9843, 69.959213), showmarker = false, timeout = 180000, items = {
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(2756.2487, 1302.239, 69.95539), showmarker = false, timeout = 180000, items = {
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(2716.789, 1308.4604, 69.705329), showmarker = false, timeout = 180000, items = {
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(2712.9318, 1308.3801, 69.720695), showmarker = false, timeout = 180000, items = {
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(2712.8244, 1313.6879, 69.756202), showmarker = false, timeout = 180000, items = {
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(2717.0085, 1313.8459, 69.732376), showmarker = false, timeout = 180000, items = {
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(2723.2775, 1315.5925, 69.763465), showmarker = false, timeout = 180000, items = {
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(2736.6198, 1322.7044, 69.680381), showmarker = false, timeout = 180000, items = {
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(2734.2119, 1328.9633, 69.618461), showmarker = false, timeout = 180000, items = {
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(2728.6452, 1329.8825, 69.616508), showmarker = false, timeout = 180000, items = {
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(2725.1374, 1331.5764, 69.655883), showmarker = false, timeout = 180000, items = {
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(2731.6384, 1332.1464, 69.641975), showmarker = false, timeout = 180000, items = {
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(2740.3544, 1354.9512, 68.152824), showmarker = false, timeout = 180000, items = {
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(2731.2851, 1365.8988, 68.418693), showmarker = false, timeout = 180000, items = {
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(2721.833, 1376.8964, 68.877418), showmarker = false, timeout = 180000, items = {
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(2726.9633, 1384.8919, 68.930679), showmarker = false, timeout = 180000, items = {
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(2723.8442, 1389.0341, 68.851646), showmarker = false, timeout = 180000, items = {
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(2724.1755, 1409.8322, 68.763519), showmarker = false, timeout = 180000, items = {
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(2747.6999, 1392.0004, 68.788314), showmarker = false, timeout = 180000, items = {
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(2747.1706, 1387.7832, 68.907615), showmarker = false, timeout = 180000, items = {
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(2743.9865, 1384.602, 68.653572), showmarker = false, timeout = 180000, items = {
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(2744.7912, 1388.9331, 68.714279), showmarker = false, timeout = 180000, items = {
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(2746.8764, 1379.2667, 68.544967), showmarker = false, timeout = 180000, items = {
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(2744.956, 1414.2065, 68.815528), showmarker = false, timeout = 180000, items = {
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(2763.0437, 1406.2001, 68.415489), showmarker = false, timeout = 180000, items = {
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(2761.1774, 1395.7636, 68.698646), showmarker = false, timeout = 180000, items = {
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(2764.5646, 1387.5789, 68.193572), showmarker = false, timeout = 180000, items = {
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(2757.3166, 1382.2427, 68.194992), showmarker = false, timeout = 180000, items = {
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(2759.2128, 1379.5051, 68.207481), showmarker = false, timeout = 180000, items = {
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(2748.1347, 1382.2858, 68.567077), showmarker = false, timeout = 180000, items = {
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    -- {coords = vector3(2747.1525, 1379.3406, 68.540069), showmarker = false, timeout = 180000, items = {
    --     -- {name = "clay", label = "Clay", chance = 8, amount = 2},
    --     -- {name = "coal", label = "Coal", chance = 10, amount = 2},
    --     -- {name = "copper", label = "Copper", chance = 6, amount = 8},
    --     -- {name = "iron", label = "Iron", chance = 6, amount = 22},
    --     -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
    --     {name = "rock", label = "Rocks", chance = 10, amount = 2},
    --     {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
    --     -- {name = "salt", label = "Salt", chance = 10, amount = 2},
    --     -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    -- }
    -- },
    {coords = vector3(2771.8647, 1382.4571, 67.971786), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(2778.7072, 1377.3936, 68.067909), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(2778.8168, 1370.9458, 68.066818), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(2772.7314, 1368.5919, 67.896163), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(2761.6857, 1364.8001, 67.896003), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(2753.6911, 1367.9943, 67.826065), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(2755.3562, 1359.2879, 67.91851), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(2778.8178, 1365.852, 70.650314), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(2779.6347, 1388.9283, 70.098587), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },


    -- Mount Hagen Mine      vector3(-1404.201, 1156.633, 226.04663)



    {coords = vector3(-1433.68, 1176.3835, 226.45274), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(-1442.735, 1189.02, 226.39938), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(-1447.677, 1196.8815, 226.38232), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(-1442.297, 1195.0159, 226.45666), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(-1446.975, 1204.8531, 226.38523), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(-1441.976, 1205.3953, 226.40464), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(-1443.313, 1209.1175, 226.45176), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(-1434.273, 1210.3663, 225.86642), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(-1436.64, 1206.9882, 226.04823), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(-1432.598, 1203.8712, 225.56597), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(-1424.341, 1200.3522, 225.51058), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(-1414.387, 1196.3609, 225.13299), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(-1410.509, 1188.7391, 225.50112), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(-1408.322, 1187.1079, 225.5453), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(-1418.879, 1188.0721, 225.50848), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(-1419.186, 1184.8236, 225.48698), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(-1403.479, 1177.0964, 222.13809), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(-1399.642, 1170.6401, 222.0876), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(-1392.265, 1170.6419, 222.2382), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(-1391.308, 1172.71, 222.13316), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(-1389.218, 1178.1232, 221.90266), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(-1386.817, 1183.7597, 222.08747), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(-1385.182, 1188.6998, 222.22363), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(-1386.294, 1191.6312, 222.09051), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(-1393.461, 1184.9765, 221.98437), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(-1404.149, 1194.1599, 225.54414), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(-1406.99, 1196.049, 225.1976), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(-1409.5, 1204.0606, 223.44107), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(-1413.844, 1214.7351, 222.43778), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(-1418.993, 1214.1489, 222.45339), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(-1421.967, 1218.5416, 222.48565), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(-1426.532, 1215.4669, 223.52551), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },


    -- Gaptooth mine            vector3(-5964.177, -3205.698, -21.40609)


    {coords = vector3(-5960.643, -3191.636, -21.61873), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(-5960.475, -3180.234, -22.57527), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(-5962.607, -3173.667, -23.16457), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(-5968.875, -3171.142, -24.45737), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(-5970.574, -3167.501, -25.24579), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(-5975.052, -3167.801, -25.54738), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
         {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(-5973.866, -3165.868, -25.66332), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
         {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(-5977.813, -3165.953, -26.05585), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
         {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(-5984.579, -3165.546, -26.6006), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
         {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(-5980.554, -3161.373, -26.60435), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
         {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },

    --rathskeller mines

    {coords = vector3(-5468.36, -2316.86, -4.25), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
         {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },

     {coords = vector3(-5475.61, -2332.17, -7.09), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
         {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },

    {coords = vector3(-5493.78, -2322.85, -9.91), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
         {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },

    {coords = vector3(-5494.03, -2320.23, -9.93), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
         {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
    {coords = vector3(-5503.98, -2319.19, -10.95), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
         {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },

    {coords = vector3(-5512.53, -2325.64, -10.82), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
         {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },

    {coords = vector3(-5515.59, -2332.02, -11.97), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
         {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },

    {coords = vector3(-5525.57, -2324.44, -11.12), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
         {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },

    {coords = vector3(-5522.59, -2316.88, -10.88), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
         {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },

    {coords = vector3(-5526.18, -2314.62, -10.84), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
         {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },

    {coords = vector3(-5523.16, -2307.28, -9.83), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
         {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },

    {coords = vector3(-5522.73, -2304.87, -9.82), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
         {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },

    {coords = vector3(-5528.59, -2297.62, -8.86), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
         {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },

    {coords = vector3(-5529.73, -2300.09, -8.81), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
         {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },

    {coords = vector3(-5534.99, -2292.61, -9.49), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
         {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },

    {coords = vector3(-5541.14, -2307.52, -7.89), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
         {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },

    {coords = vector3(-5539.83, -2314.61, -7.76), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
         {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },

    {coords = vector3(-5541.65, -2317.16, -7.74), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
         {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },

    {coords = vector3(-5539.44, -2345, -5.84), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
         {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },

    {coords = vector3(-5536.79, -2345.2, -5.84), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
         {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },

    {coords = vector3(-5539.88, -2354.67, -4.78), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
         {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },

    {coords = vector3(-5541.76, -2356, -4.86), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
         {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },

    {coords = vector3(-5537.48, -2358.29, -5.69), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
         {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },

    {coords = vector3(-5540.09, -2359.12, -5.55), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
         {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },

    {coords = vector3(-5539.1, -2361.73, -5.85), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
         {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },

    {coords = vector3(-5526.86, -2354.95, -6.83), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
         {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },

    {coords = vector3(-5497.06, -2358.87, -9.83), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
         {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },

    {coords = vector3(-5499.02, -2354.17, -8.96), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
        -- {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
         {name = "rock", label = "Rocks", chance = 10, amount = 2},
        {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },



    -- Coal mines
    
        {coords = vector3(-2685.97, 688.13, 179.19), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
         {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        -- {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
        {coords = vector3(-2687.48, 685.93, 179.02), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
         {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        -- {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
        {coords = vector3(-2720.41, 684.32, 175.82), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
         {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        -- {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
        {coords = vector3(-2717.24, 684.36, 175.8), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
         {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        -- {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
        {coords = vector3(-2705.72, 707.68, 175.55), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
         {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        -- {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
        {coords = vector3(-2714.77, 723.56, 176.86), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
         {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        -- {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
        {coords = vector3(-2716.43, 730.41, 176.22), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
         {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        -- {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
        {coords = vector3(-2717.91, 726.05, 176.32), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
         {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        -- {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
        {coords = vector3(-2723.03, 732.62, 171.99), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
         {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        -- {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
        {coords = vector3(-2720.59, 731.49, 172.26), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
         {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        -- {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
        {coords = vector3(-2727.16, 729.12, 171.13), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
         {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        -- {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
        {coords = vector3(-2721.04, 726.71, 171.8), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
         {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        -- {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
        {coords = vector3(-2720.62, 722.42, 171.1), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
         {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        -- {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
        {coords = vector3(-2719.17, 720.02, 170.98), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
         {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        -- {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
        {coords = vector3(-2719.7, 715.47, 170.91), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
         {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        -- {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
        {coords = vector3(-2724.23, 713.93, 169.47), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
         {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        -- {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
        {coords = vector3(-2725.72, 713.94, 169.48), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
         {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        -- {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
        {coords = vector3(2332.44,1030.01,77.21), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
         {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        -- {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
        {coords = vector3(2314.87,1030.79,79.49), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
         {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        -- {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
        {coords = vector3(2296.42,1030.36,80.53), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
         {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        -- {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
        {coords = vector3(2293.55,1043.2,79.58), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
         {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        -- {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
        {coords = vector3(2273.41,1062.42,78.68), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
         {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        -- {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
        {coords = vector3(2277.51,1060.25,78.78), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
         {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        -- {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
        {coords = vector3(2282.86,1062.67,79.04), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
         {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        -- {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
        {coords = vector3(2292.7,1074.27,80.49), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
         {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        -- {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
        {coords = vector3(2299.06,1056.27,81.74), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
         {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        -- {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
        {coords = vector3(2303.41,1062.02,83.82), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
         {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        -- {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
        {coords = vector3(2311.54,1070.89,87.19), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
         {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        -- {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
        {coords = vector3(2309.82,1076.95,87.67), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
         {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        -- {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
        {coords = vector3(2302.87,1078.27,85.92), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
         {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        -- {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
        {coords = vector3(2298.7,1083.51,84.97), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
         {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        -- {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
        {coords = vector3(2292.7,1083.9,86.06), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
         {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        -- {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
        {coords = vector3(2283.93,1083.26,83.58), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
         {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        -- {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
        {coords = vector3(2311.48,1081.75,90.86), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
         {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        -- {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
        {coords = vector3(2325.76,1072.58,93.58), showmarker = false, timeout = 180000, items = { 
        -- {name = "clay", label = "Clay", chance = 8, amount = 2},
         {name = "coal", label = "Coal", chance = 10, amount = 2},
        -- {name = "copper", label = "Copper", chance = 6, amount = 8},
        -- {name = "iron", label = "Iron", chance = 6, amount = 22},
        -- {name = "nitrite", label = "Nitrite", chance = 8, amount = 2},
        -- {name = "rock", label = "Rocks", chance = 10, amount = 2},
        -- {name = "saltrock", label = "Salt Rock", chance = 10, amount = 2},
        -- {name = "salt", label = "Salt", chance = 10, amount = 2},
        -- {name = "goldnugget", label = "Gold Nuggets", chance = 3, amount = 2},
    }
    },
}