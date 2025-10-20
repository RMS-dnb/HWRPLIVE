Config = Config or {}
Config.Rocks = {}

---------------------------------------------
-- deploy prop settings
---------------------------------------------
Config.ForwardDistance   = 1.5
Config.PromptGroupName   = 'Place Rock'
Config.PromptCancelName  = 'Cancel'
Config.PromptPlaceName   = 'Place'
Config.PromptRotateLeft  = 'Rotate Left'
Config.PromptRotateRight = 'Rotate Right'

---------------------------------------------
-- settings
---------------------------------------------
Config.EnableVegModifier = true -- if set true clears vegetation
Config.RockProp = `mp_sca_rock_grp_l_03` -- rock prop
Config.SaltRockProp = `mp_sca_rock_grp_l_03` -- rock prop
Config.RockDriller = `p_drillpress01x` -- rock driller
Config.MiningTime = 10000 -- time player mines with pickaxe
Config.DrillTime = 2000 -- time for each rock to be drilled
Config.GemChance = 2 -- 5% chance of getting a rare gemstone

---------------------------------------------
-- cronjob
---------------------------------------------
Config.MiningCronJob = '*/5 * * * *' -- reset rocks every 5 mins
Config.ServerNotify  = false

---------------------------------------------
-- rock random outputs
---------------------------------------------
Config.RockOutputs = {
   { item = 'iron_ore', percentage = 0.40 },
   { item = 'lead_ore', percentage = 0.16 },
   { item = 'copper_ore', percentage = 0.20 },
   { item = 'zinc_ore', percentage = 0.14},
   { item = 'silver_ore', percentage = 0.10 },
}

Config.SaltRockOutputs = {
   { item = 'salt', percentage = 3 }
}

---------------------------------------------
-- rare gem random outputs
---------------------------------------------
Config.GemOutputs = {
    'ruby_uncut',
    'emerald_uncut',
    'opal_uncut',
    'sapphire_uncut',
    'sulfur',
}

---------------------------------------------
-- drill rocks locations
---------------------------------------------
Config.WorkshopTents = {
    {coords = vector4(-294.09, 974.43, 133.44, 339.37)}, -- valentine area
    
}
