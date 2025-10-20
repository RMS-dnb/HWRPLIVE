Config = {}

Config.keysmelt = 0x760A9C6F                -- key E for smelt  
Config.keypickup = 0xCEFD9220               -- key G for pickup

Config.itemsfurnace = "furnace"             -- item name furnace

Config.itemsgoldnuget = "goldnugget"  -- item name
Config.itemsgoldamount = 60                  -- How many pieces do you want to melt at a time
Config.itemsgoldmodel = "p_goldnugget01x"   -- model name

Config.reciveitem = "gold_bar"           -- item for recive
Config.reciveitemamount = 1                 -- item  recive amount

Config.Explosiondamage = 1.0                -- Explosion Damage if player fail smelt

Config.CheckZoneSmelt = false                -- true or false for player check zone

Config.ZoneSmelt = {
  
    { coords = vector3(-942.7389, -1291.169, 50.980049), radial = 80 },
    { coords = vector3(1938.7288, 1893.2947, 251.64138), radial = 50 },
    -- add more...
    
}