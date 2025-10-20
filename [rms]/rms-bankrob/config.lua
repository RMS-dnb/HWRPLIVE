Config = {}

-- Law enforcement job settings
Config.LawEnforcement = {
    enabled = true, -- Set to false to disable law job checks entirely
    minOnlineOfficers = 2, -- Global minimum officers required
    preventRobberyIfNoLaw = true, -- Prevent robbery if no law enforcement is online
    notifyLawOnRobbery = true, -- Send alerts to law enforcement
}

Config.banks = {
    {
        name = "Saint Denis Bank",
        coords = vector3(2644.579, -1292.313, 52.25),
        radius = 10.0,
        -- Law enforcement requirements for this specific bank
        lawRequirements = {
            enabled = true, -- Enable law checks for this bank
            minOfficers = 6, -- Minimum officers required for this high-value bank
            allowedJobs = {"nhso", "usms"}, -- Multiple job types allowed
            blockMessage = "Saint Denis Bank requires at least 6 law enforcement officers online!"
        },
        vaults = {
            {
                id = "saint_denis_vault_1",
                model = `s_vault_lrg_r_val01x_high`,
                label = "Large Vault",
                coords = vector3(2644.59, -1306.15, 52.25),
                reward = {
                    cash_min = 400,
                    cash_max = 1000,
                    diamond_chance = 100,
                    diamond_amount = {1, 3}
                },
                timeout = 1800000, -- 30 minutes
                spawnAmount = 10 -- Number of drops per explosion
            },
            {
                id = "saint_denis_vault_2",
                model = `s_vault_sml_r_val01x_high`,
                label = "Small Vault",
                coords = vector3(2644.20, -1303.80, 52.25),
                reward = {
                    cash_min = 75,
                    cash_max = 200,
                    diamond_chance = 25,
                    diamond_amount = {1, 3}
                },
                timeout = 1800000,
                spawnAmount = 10
            },
            {
                id = "saint_denis_vault_3", 
                model = `s_vault_med_r_val01x_high`,
                label = "Medium Vault",
                coords = vector3(2641.59, -1303.12, 52.25),
                reward = {
                    cash_min = 75,
                    cash_max = 200,
                    diamond_chance = 25,
                    diamond_amount = {1, 3}
                },
                timeout = 1800000,
                spawnAmount = 10
            }
        },
        doors = {
            {
                id = "saint_denis_door_1",
                model = `s_bank_door`,
                label = "Bank Door",
                coords = vector3(2643.0, -1291.0, 52.25),
                timeout = 1200000 -- 20 minutes
            }
        }
    },
    {
        name = "Valentine Bank",
        coords = vector3(-308.12, 775.88, 118.7),
        radius = 15.0,
        -- Different law requirements for Valentine
        lawRequirements = {
            enabled = true,
            minOfficers = 6, -- Lower requirement for smaller town
            allowedJobs = {"nhso", "usms"}, -- Town-specific jobs
            blockMessage = "Valentine Bank requires at least 6 law enforcement officers online!"
        },
        vaults = {
            {
                id = "valentine_vault_1",
                model = `s_vault_sml_r_val01x`,
                label = "Small Vault",
                coords = vector3(-308.27, 762.66, 118.70),
                reward = {
                    cash_min = 50,
                    cash_max = 150,
                    diamond_chance = 15,
                    diamond_amount = {1, 2}
                },
                timeout = 1200000,
                spawnAmount = 10
            },
            {
                id = "valentine_vault_2",
                model = `s_vault_med_r_val01x`,
                label = "Large Vault",
                coords = vector3(-308.88, 764.78, 118.70),
                reward = {
                    cash_min = 50,
                    cash_max = 150,
                    diamond_chance = 15,
                    diamond_amount = {1, 2}
                },
                timeout = 1200000,
                spawnAmount = 10
            },
            {
                id = "valentine_vault_3", 
                model = `s_vault_med_r_val01x`,
                label = "Large Vault",
                coords = vector3(-308.78, 765.08, 118.70),
                reward = {
                    cash_min = 50,
                    cash_max = 150,
                    diamond_chance = 15,
                    diamond_amount = {1, 2}
                },
                timeout = 1200000,
                spawnAmount = 10
            }
        },
        doors = {
            {
                id = "valentine_door_1",
                model = `s_bank_door`,
                label = "Bank Door",
                coords = vector3(-310.0, 775.0, 118.7),
                timeout = 1200000
            }
        }
    },
    {
        name = "Blackwater Bank",
        coords = vector3(-819.78, -1274.12, 43.65),
        radius = 15.0,
        -- Blackwater with federal law enforcement
        lawRequirements = {
            enabled = true,
            minOfficers = 4,
            allowedJobs = {"naso", "usms"}, -- Federal and local
            blockMessage = "Blackwater Bank requires 4 federal or local law enforcement presence!"
        },
        vaults = {
            {
                id = "blackwater_vault_1",
                model = `p_safe_ser`,
                label = "Small Vault",
                coords = vector3(-813.48, -1273.28, 43.64),
                reward = {
                    cash_min = 50,
                    cash_max = 150,
                    diamond_chance = 15,
                    diamond_amount = {1, 2}
                },
                timeout = 1200000,
                spawnAmount = 10
            },
            {
                id = "blackwater_vault_2",
                model = `p_door_bla_bankvault`,
                label = "Vault",
                coords = vector3(-816.28, -1274.36, 43.64),
                reward = {
                    cash_min = 50,
                    cash_max = 150,
                    diamond_chance = 15,
                    diamond_amount = {1, 2}
                },
                timeout = 1200000,
                spawnAmount = 10
            }
        },
        doors = {
            {
                id = "blackwater_door_1",
                model = `s_bank_door`,
                label = "Bank Door",
                coords = vector3(-819.0, -1274.0, 43.65),
                timeout = 1200000
            }
        }
    },
    {
        name = "Rhodes Bank",
        coords = vector3(1287.65, -1314.49, 77.04),
        radius = 15.0,
        -- Rhodes with no law requirement (lawless town example)
        lawRequirements = {
            enabled = true, -- No law enforcement required for this bank
            minOfficers = 6,
            allowedJobs = {"nhso", "usms"}, -- Federal and local
            blockMessage = "Rhodes Bank requires 6 Law on to start robbery"
        },
        vaults = {
            {
                id = "rhodes_vault_1",
                model = `s_vault_med_r_val_bent02x`,
                label = "Large Vault",
                coords = vector3(1287.65, -1314.49, 77.04),
                reward = {
                    cash_min = 50,
                    cash_max = 150,
                    diamond_chance = 15,
                    diamond_amount = {1, 2}
                },
                timeout = 1200000,
                spawnAmount = 10
            },
            {
                id = "rhodes_vault_2",
                model = `s_vault_med_r_val_bent01x`,
                label = "Large Vault",
                coords = vector3(1286.65, -1315.20, 77.04),
                reward = {
                    cash_min = 50,
                    cash_max = 150,
                    diamond_chance = 15,
                    diamond_amount = {1, 2}
                },
                timeout = 1200000,
                spawnAmount = 10
            },
            {
                id = "rhodes_vault_3",
                model = `s_vault_sml_l_val_bent01x`,
                label = "Small Vault",
                coords = vector3(1286.61, -1315.31, 77.04),
                reward = {
                    cash_min = 50,
                    cash_max = 150,
                    diamond_chance = 15,
                    diamond_amount = {1, 2}
                },
                timeout = 1200000,
                spawnAmount = 10
            },
            {
                id = "rhodes_vault_4",
                model = `s_vault_sml_r_val_bent01x`,
                label = "Small Vault",
                coords = vector3(1287.84, -1313.51, 77.04),
                reward = {
                    cash_min = 50,
                    cash_max = 150,
                    diamond_chance = 15,
                    diamond_amount = {1, 2}
                },
                timeout = 1200000,
                spawnAmount = 10
            }
        },
        doors = {
            {
                id = "rhodes_door_1",
                model = `s_bank_door`,
                label = "Bank Door",
                coords = vector3(1288.0, -1314.0, 77.04), 
                timeout = 1200000
            }
        }
    }
}

Config.BankDoors = {
    -- Saint Denis Bank Doors
    {
        id = "saint_denis_vault_door",
        bank_name = "Saint Denis Bank",
        model = `p_door_val_bankvault02x`,
        label = "Main Bank Door",
        coords = vector3(2644.11, -1300.02, 52.25),
        heading = 90.0,
        doorlock_name = "saint_denis_vault_door", -- ox_doorlock door name
        explosion_coords = vector3(2644.11, -1300.02, 52.25),
        interact_distance = 2.5,
        timeout = 3600000, -- 1 hour cooldown
        tnt_cost = 1,
        explosion_type = "door"
    },
    {
        id = "valentine_vault_door",
        bank_name = "Valentine Bank",
        model = `p_door_val_bankvault`,
        label = "Back Bank Door",
        coords = vector3(-307.71, 767.57, 118.70),
        heading = 180.0,
        doorlock_name = "valentine_vault_door",
        explosion_coords = vector3(-307.71, 767.57, 118.70),
        interact_distance = 2.5,
        timeout = 3600000, -- 1 hour cooldown
        tnt_cost = 1,
        explosion_type = "door"
    },
    -- Rhodes Bank Doors
    {
        id = "rhodes_main_door",
        bank_name = "Rhodes Bank",
        model = `p_door13x`,
        label = "Main Bank Door",
        coords = vector3(1286.24, -1302.64, 77.04),
        heading = 270.0,
        doorlock_name = "rhodes_main_door",
        explosion_coords = vector3(1286.24, -1302.64, 77.04),
        interact_distance = 2.5,
        timeout = 3600000, -- 1 hour cooldown
        tnt_cost = 1,
        explosion_type = "door"
    },
    {
        id = "rhodes_side_door",
        bank_name = "Rhodes Bank",
        model = `p_door_val_bankvault`,
        label = "Side Bank Door",
        coords = vector3(1281.99, -1308.36, 77.04),
        heading = 270.0,
        doorlock_name = "rhodes_vault_door",
        explosion_coords = vector3(1281.99, -1308.36, 77.04),
        interact_distance = 2.5,
        timeout = 3600000, -- 1 hour cooldown
        tnt_cost = 1,
        explosion_type = "door"
    }
}



-- Door explosion settings
Config.DoorExplosionSettings = {
    delay = 10000, -- 8 seconds before explosion
    notify_planting = "TNT Planted - Run for cover!",
    notify_success = "The door has been blown open!",
    notify_cooldown = "This door is on cooldown!",
    notify_already_exploded = "This door has already been blown open!",
    notify_no_tnt = "You don't have any TNT!",
    notify_no_law = "Not enough law enforcement online to rob this bank!"
}

-- Door interaction settings
Config.DoorInteraction = {
    plant_tnt_duration = 100000, -- 5 seconds to plant TNT
    max_distance = 3.0
}

-- Explosion settings
Config.explosion = {
    vault = {
        type = 29,
        radius = 20.0,
        shake = 2.0
    },
    door = {
        type = 25,
        radius = 15.0,
        shake = 1.5
    }
}

Config.robberyDuration = 20000 -- 20 seconds for looting

-- Animations
Config.animations = {
    safecracking = {
        dict = "amb_work@world_human_crouch_inspect@male_c@idle_c",
        clip = "idle_h",
        flag = 1
    },
    plantingTNT = {
        dict = "amb_work@world_human_crouch_inspect@male_c@idle_c",
        clip = "idle_h",
        flag = 1
    }
}

-- Money stash drop settings
Config.Tiers = {
    High = {
        Weapons = {'dollar'},
        AmmoBoxes = {'blood_dollar'},
        Items = {'ammo_box_pistol'}
    }
}

-- Drop reward amounts (configurable)
Config.DropRewards = {
    dollar = {
        min = 75,
        max = 150
    },
    blood_dollar = {
        min = 75,
        max = 175
    },
    cent = {
        min = 300,
        max = 500
    },
    ammo_box_pistol = {
        min = 1,
        max = 2
    }
}

Config.Weapons = {'dollar', 'blood_dollar'}
Config.AmmoBoxes = {'dollar', 'blood_dollar'}
Config.Items = {'ammo_box_pistol'}
Config.PropMapping = {
    ['dollar'] = 'p_moneystack02x',
    ['blood_dollar'] = 'p_moneybaggen02x',
    ['ammo_box_pistol'] = 'p_ammo_box_001',
}
Config.DropTimeout = 1800000 -- 30 minutes
Config.ZOffset = 0.0
Config.DebugBlips = false

return Config