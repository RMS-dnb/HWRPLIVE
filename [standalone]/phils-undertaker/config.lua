Config = {}

-----------------------------------------------------------
-- debug
-----------------------------------------------------------
Config.Debug = false

-----------------------------------------------------------
-- npc settings
-----------------------------------------------------------
Config.DistanceSpawn = 20.0
Config.FadeIn = true
Config.PricePerNPC = 10
-----------------------------------------------------------
-- hunting wagon
-----------------------------------------------------------
Config.WagonPrice              = 1000    -- price set to buy a hunting wagon
Config.WagonSellRate           = 0.75    -- sell rate percentage for hunting wagon
Config.TotalPedsStored      = 10      -- total amount of animals you can store in the hunting cart
Config.StorageMaxWeight        = 400000  -- max inventory weight for the hunting wagon
Config.StorageMaxSlots         = 20      -- amount of inventory slots
Config.WagonFixRate            = 0.10    -- cost to fix the wagon when broken
Config.TargetDistance          = 5.0     -- distance you can target (prompt distance is defined in rsg-core/config.lua)
Config.MaxCargo                = 10      -- max animals stored in hunting cart
Config.StoreTime               = 10000   -- progress bar timer

Config.Blip = {
    blipName   = 'Undertaker', -- Config.Blip.blipName
    blipSprite = 'blip_mp_attack_target', -- Config.Blip.blipSprite
    blipScale  = 0.2 -- Config.Blip.blipScale
}

-- prompt locations
Config.HunterLocations = {
    {
        name       = 'undertakers',
        location   = 'undertakers1',
        coords     = vector3(2760.21, -1120.03, 48.62),
        npcmodel   = `u_m_m_rhdundertaker_01`,
        npccoords  = vector4(2760.21, -1120.03, 48.62, 348.8),
        wagonspawn = vector4(2768.68, -1102.21, 47.45, 94.67),
        showblip   = true
    },
    
}

------------------------------
-- shop items
------------------------------
Config.HuntingShop = {
    [1]  = { name = 'weapon_melee_knife',             price = 5,    amount = 50,  info = {}, type = 'weapon', slot = 1, },
    [2]  = { name = 'weapon_bow',                     price = 5,    amount = 50,  info = {}, type = 'weapon', slot = 2, },
    [3]  = { name = 'weapon_lasso',                   price = 10,   amount = 50,  info = {}, type = 'weapon', slot = 3, },
    [4]  = { name = 'weapon_kit_binoculars',          price = 20,   amount = 50,  info = {}, type = 'weapon', slot = 4, },
    [5]  = { name = 'weapon_kit_binoculars_improved', price = 50,   amount = 50,  info = {}, type = 'weapon', slot = 5, },
    [6]  = { name = 'ammo_arrow',                     price = 0.25, amount = 500, info = {}, type = 'item',   slot = 6, },
}

