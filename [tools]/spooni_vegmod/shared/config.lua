Config = {}

--Veg Modifiers Flags
local Debris = 1
local Grass = 2
local Bush = 4
local Weed = 8
local Flower = 16
local Sapling = 32
local Tree = 64
local Rock = 128
local LongGrass = 256
local All = Debris + Grass + Bush + Weed + Flower + Sapling + Tree + Rock + LongGrass

-- Veg Modifier Types
local VMT_Cull = 1
local VMT_Flatten = 2
local VMT_FlattenDeepSurface = 4
local VMT_Explode = 8
local VMT_Push = 16
local VMT_Decal = 32

Config.VegMods = {
    { -- spooni_sd_farming Hall
        coords = vector3(2103.3706, -278.7037, 42.960678), -- Coords
        radius = 10.0, -- Raduis
        veg = { flag = All, type = VMT_Cull,} -- Veg Modifiers Flags/Types
    },

    { -- spooni_sd_farming Office
        coords = vector3(2102.3142, -305.468, 41.377777), -- Coords
        radius = 5.0, -- Raduis
        veg = { flag = All, type = VMT_Cull,} -- Veg Modifiers Flags/Types
    },
    { -- spooni_sd_farming Hall
        coords = vector3(-2840.884, -2930.401, 65.887184), -- Coords
        radius = 10.0, -- Raduis
        veg = { flag = All, type = VMT_Cull,} -- Veg Modifiers Flags/Types
    },
    { -- spooni_sd_farming Hall
        coords = vector3(-2847.767, -2958.013, 65.468635), -- Coords
        radius = 10.0, -- Raduis
        veg = { flag = All, type = VMT_Cull,} -- Veg Modifiers Flags/Types
    },
    { -- spooni_sd_farming Hall
        coords = vector3(-2728.372, -2901.411, 66.72718), -- Coords
        radius = 10.0, -- Raduis
        veg = { flag = All, type = VMT_Cull,} -- Veg Modifiers Flags/Types
    },
    { -- spooni_sd_farming Hall
        coords = vector3(-2747.918, -2906.276, 66.474685), -- Coords
        radius = 10.0, -- Raduis
        veg = { flag = All, type = VMT_Cull,} -- Veg Modifiers Flags/Types
    },
    { -- spooni_sd_farming Hall
        coords = vector3(-2781.404, -2914.417, 66.11544), -- Coords
        radius = 10.0, -- Raduis
        veg = { flag = All, type = VMT_Cull,} -- Veg Modifiers Flags/Types
    },
    { -- spooni_sd_farming Hall
        coords = vector3(-2809.525, -2923.433, 66.395507), -- Coords
        radius = 10.0, -- Raduis
        veg = { flag = All, type = VMT_Cull,} -- Veg Modifiers Flags/Types
    },
    { -- spooni_sd_farming Hall
        coords = vector3(-2820.603, -2927.463, 66.028778), -- Coords
        radius = 10.0, -- Raduis
        veg = { flag = All, type = VMT_Cull,} -- Veg Modifiers Flags/Types
    },
    { -- spooni_sd_farming Hall
        coords = vector3(-2817.534, -2951.179, 65.835624), -- Coords
        radius = 10.0, -- Raduis
        veg = { flag = All, type = VMT_Cull,} -- Veg Modifiers Flags/Types
    },
    { -- spooni_sd_farming Hall
        coords = vector3(-2830.737, -2924.195, 66.069747), -- Coords
        radius = 10.0, -- Raduis
        veg = { flag = All, type = VMT_Cull,} -- Veg Modifiers Flags/Types
    },
    { -- spooni_sd_farming Hall
        coords = vector3(-327.7918, 701.87115, 116.99416), -- Coords
        radius = 10.0, -- Raduis
        veg = { flag = All, type = VMT_Cull,} -- Veg Modifiers Flags/Types
    },
    { -- spooni_sd_farming Hall
        coords = vector3(-334.7729, 715.18371, 117.44359), -- Coords
        radius = 10.0, -- Raduis
        veg = { flag = All, type = VMT_Cull,} -- Veg Modifiers Flags/Types
    },
    { -- spooni_sd_farming Hall
        coords = vector3(-341.3916, 722.35046, 117.99719), -- Coords
        radius = 10.0, -- Raduis
        veg = { flag = All, type = VMT_Cull,} -- Veg Modifiers Flags/Types
    },
    { -- spooni_sd_farming Hall
        coords = vector3(-344.1058, 732.70629, 117.86285), -- Coords
        radius = 10.0, -- Raduis
        veg = { flag = All, type = VMT_Cull,} -- Veg Modifiers Flags/Types
    },
    { -- spooni_sd_farming Hall
        coords = vector3(-348.5531, 742.35839, 117.53878), -- Coords
        radius = 10.0, -- Raduis
        veg = { flag = All, type = VMT_Cull,} -- Veg Modifiers Flags/Types
    },
    { -- spooni_sd_farming Hall
        coords = vector3(-352.4938, 814.36352, 116.87084), -- Coords
        radius = 10.0, -- Raduis
        veg = { flag = All, type = VMT_Cull,} -- Veg Modifiers Flags/Types
    },
    { -- spooni_sd_farming Hall
        coords = vector3(-397.5304, 736.54302, 115.29542), -- Coords
        radius = 10.0, -- Raduis
        veg = { flag = All, type = VMT_Cull,} -- Veg Modifiers Flags/Types
    },
    { -- valentine shack
    coords = vector3(-889.0645, -1403.299, 45.082355), -- Coords
    radius = 10.0, -- Raduis
    veg = { flag = All, type = VMT_Cull,} -- Veg Modifiers Flags/Types
    },
    { -- dumb tree
    coords = vector3(-737.1044, -1363.828, 44.378128), -- Coords
    radius = 10.0, -- Raduis
    veg = { flag = All, type = VMT_Cull,} -- Veg Modifiers Flags/Types
    },
    { -- straw gun
    coords = vector3(-1831.477, -629.0383, 155.25027), -- Coords
    radius = 10.0, -- Raduis
    veg = { flag = All, type = VMT_Cull,} -- Veg Modifiers Flags/Types
    },

}