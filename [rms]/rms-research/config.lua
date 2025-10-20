Config = {}

---------------------------------
-- shop settings
---------------------------------
Config = {
    ResearchShopItems = {
       -- { name = 'bpo_pickaxe', amount = 10, price = 50 },
       -- { name = 'bpo_axe', amount = 10, price = 50 },
       -- { name = 'bpo_shovel', amount = 10, price = 50 },
        --{ name = 'bpo_weapon_revolver_cattleman_mexican', amount = 10, price = 100 },
        { name = 'bpo_weapon_pistol_volcanic', amount = 10, price = 750 },
        { name = 'bpo_weapon_repeater_carbine', amount = 10, price = 800 },
        --{ name = 'bpo_weapon_rifle_varmint', amount = 10, price = 100 },
        --{ name = 'bpo_weapon_revolver_doubleaction_gambler', amount = 10, price = 500 },
        { name = 'bpo_weapon_revolver_m1895', amount = 10, price = 800 },
        { name = 'bpo_weapon_revolver_lemat', amount = 10, price = 900 },
        { name = 'bpo_weapon_revolver_navy', amount = 10, price = 850 },
        { name = 'bpo_weapon_revolver_remington', amount = 10, price = 900 },
        { name = 'bpo_weapon_pistol_m1899', amount = 10, price = 800 },
        { name = 'bpo_weapon_pistol_mauser', amount = 10, price = 850 },
        { name = 'bpo_weapon_pistol_semiauto', amount = 10, price = 650 },
        { name = 'bpo_weapon_pistol_luger', amount = 10, price = 700 },
        { name = 'bpo_weapon_repeater_winchester', amount = 10, price = 750 },
        { name = 'bpo_weapon_repeater_henry', amount = 10, price = 800 },
        { name = 'bpo_weapon_rifle_springfield', amount = 10, price = 1200 },
        { name = 'bpo_weapon_rifle_boltaction', amount = 10, price = 1000 },
        { name = 'bpo_weapon_rifle_mosinnagant', amount = 10, price = 1150 },
        --{ name = 'bpo_weapon_rifle_elephant', amount = 10, price = 500 },
        --{ name = 'bpo_weapon_shotgun_doublebarrel_exotic', amount = 10, price = 500 },
        { name = 'bpo_weapon_shotgun_sawedoff', amount = 10, price = 950 },
        { name = 'bpo_weapon_shotgun_semiauto', amount = 10, price = 1500 },
        { name = 'bpo_weapon_shotgun_pump', amount = 10, price = 1500 },
-- BPCs
        { name = 'bpc_weapon_pistol_volcanic', amount = 100, price = 82 },
        { name = 'bpc_weapon_repeater_carbine', amount = 100, price = 86 },
        { name = 'bpc_weapon_revolver_m1895', amount = 100, price = 86 },
        { name = 'bpc_weapon_revolver_lemat', amount = 100, price = 93 },
        { name = 'bpc_weapon_revolver_navy', amount = 100, price = 89 },
        { name = 'bpc_weapon_revolver_remington', amount = 100, price = 93 },
        { name = 'bpc_weapon_pistol_m1899', amount = 100, price = 86 },
        { name = 'bpc_weapon_pistol_mauser', amount = 100, price = 89 },
        { name = 'bpc_weapon_pistol_semiauto', amount = 100, price = 75 },
        { name = 'bpc_weapon_pistol_luger', amount = 100, price = 79 },
        { name = 'bpc_weapon_repeater_winchester', amount = 100, price = 82 },
        { name = 'bpc_weapon_repeater_henry', amount = 100, price = 86 },
        { name = 'bpc_weapon_rifle_springfield', amount = 100, price = 114 },
        { name = 'bpc_weapon_rifle_boltaction', amount = 100, price = 100 },
        { name = 'bpc_weapon_rifle_mosinnagant', amount = 100, price = 110 },
        { name = 'bpc_weapon_shotgun_sawedoff', amount = 100, price = 96 },
        { name = 'bpc_weapon_shotgun_semiauto', amount = 100, price = 114 },
        { name = 'bpc_weapon_shotgun_pump', amount = 100, price = 114 },
    },
    PersistStock = false, --should stock save in database and load it after restart, to 'remember' stock value before restart
}

---------------------------------
-- settings
---------------------------------
Config.Image = "rsg-inventory/html/images/"
Config.Keybind = 'J'
Config.EnableTarget = true
Config.CopyTime = 10000

---------------------------------
-- npc settings
---------------------------------
Config.DistanceSpawn = 20.0
Config.FadeIn = true

---------------------------------
-- blip settings
---------------------------------
Config.Blip = {
    blipName = 'Research Lab', -- Config.Blip.blipName
    blipSprite = 'blip_mp_ugc', -- Config.Blip.blipSprite
    blipScale = 0.2 -- Config.Blip.blipScale
}

---------------------------------
-- npc locations
---------------------------------
Config.ResearchLocations = {
    {
        name = 'Research',
        prompt = 'research_lab',
        coords = vector3(1932.46, 1946.94, 263.06),
        npcmodel = `cs_crackpotrobot`,
        npccoords = vector4(1932.46, 1946.94, 263.06, 234.91),
        showblip = true
    },
}

---------------------------------
-- blueprints
---------------------------------
Config.Blueprints = {
    {
        item = 'bpo_pickaxe',
        receive = 'bpc_pickaxe',
        runcost = 5,
        copytime = 10000,
    },
    {
        item = 'bpo_axe',
        receive = 'bpc_axe',
        runcost = 5,
        copytime = 10000,
    },
    {
        item = 'bpo_shovel',
        receive = 'bpc_shovel',
        runcost = 5,
        copytime = 10000,
    },
    -- {
    --     item = 'bpo_weapon_revolver_cattleman',
    --     receive = 'bpc_weapon_revolver_cattleman',
    --     runcost = 1,
    --     copytime = 10000,
    -- },
    {
        item = 'bpo_weapon_pistol_volcanic',
        receive = 'bpc_weapon_pistol_volcanic',
        runcost = 52,
        copytime = 10000,
    },
    {
        item = 'bpo_weapon_repeater_carbine',
        receive = 'bpc_weapon_repeater_carbine',
        runcost = 56,
        copytime = 10000,
    },
    -- {
    --    item = 'bpo_weapon_rifle_varmint',
    --    receive = 'bpc_weapon_rifle_varmint',
    --    runcost = 1,
    --    copytime = 10000,
    -- },
    -- {
    --    item = 'bpo_weapon_shotgun_doublebarrel',
    --    receive = 'bpc_weapon_shotgun_doublebarrel',
    --    runcost = 1,
    --    copytime = 10000,
    -- },
    -- {
    --    item = 'bpo_weapon_revolver_doubleaction_gambler',
    --    receive = 'bpc_weapon_revolver_doubleaction_gambler',
    --    runcost = 1,
    --    copytime = 10000,
    -- },
    {
        item = 'bpo_weapon_revolver_m1895',
        receive = 'bpc_weapon_revolver_m1895',
        runcost = 56,
        copytime = 10000,
    },
    {
        item = 'bpo_weapon_revolver_lemat',
        receive = 'bpc_weapon_revolver_lemat',
        runcost = 63,
        copytime = 10000,
    },
    {
        item = 'bpo_weapon_revolver_navy',
        receive = 'bpc_weapon_revolver_navy',
        runcost = 59,
        copytime = 10000,
    },
    {
        item = 'bpo_weapon_revolver_remington',
        receive = 'bpc_weapon_revolver_remington',
        runcost = 63,
        copytime = 10000,
    },
    -- {
    --    item = 'bpo_weapon_revolver_navy_crossover',
    --    receive = 'bpc_weapon_revolver_navy_crossover',
    --    runcost = 1,
    --    copytime = 10000,
    -- },
    {
        item = 'bpo_weapon_pistol_m1899',
        receive = 'bpc_weapon_pistol_m1899',
        runcost = 56,
        copytime = 10000,
    },
    {
        item = 'bpo_weapon_pistol_mauser',
        receive = 'bpc_weapon_pistol_mauser',
        runcost = 59,
        copytime = 10000,
    },
    {
        item = 'bpo_weapon_pistol_semiauto',
        receive = 'bpc_weapon_pistol_semiauto',
        runcost = 45,
        copytime = 10000,
    },
    {
        item = 'bpo_weapon_pistol_luger',
        receive = 'bpc_weapon_pistol_luger',
        runcost = 49,
        copytime = 10000,
    },
    {
        item = 'bpo_weapon_repeater_winchester',
        receive = 'bpc_weapon_repeater_winchester',
        runcost = 52,
        copytime = 10000,
    },
    {
        item = 'bpo_weapon_repeater_henry',
        receive = 'bpc_weapon_repeater_henry',
        runcost = 56,
        copytime = 10000,
    },
    {
        item = 'bpo_weapon_rifle_springfield',
        receive = 'bpc_weapon_rifle_springfield',
        runcost = 84,
        copytime = 10000,
    },
    {
        item = 'bpo_weapon_rifle_boltaction',
        receive = 'bpc_weapon_rifle_boltaction',
        runcost = 70,
        copytime = 10000,
    },
    {
        item = 'bpo_weapon_rifle_mosinnagant',
        receive = 'bpc_weapon_rifle_mosinnagant',
        runcost = 80,
        copytime = 10000,
    },
    -- {
    --     item = 'bpo_weapon_rifle_elephant',
    --    receive = 'bpc_wweapon_rifle_elephant',
    --    runcost = 1,
    --    copytime = 10000,
    -- },
    -- {
    --    item = 'bpo_weapon_shotgun_doublebarrel_exotic',
    --    receive = 'bpc_weapon_shotgun_doublebarrel_exotic',
    --    runcost = 1,
    --    copytime = 10000,
    -- },
    {
        item = 'bpo_weapon_shotgun_sawedoff',
        receive = 'bpc_weapon_shotgun_sawedoff',
        runcost = 66,
        copytime = 10000,
    },
    {
        item = 'bpo_weapon_shotgun_semiauto',
        receive = 'bpc_weapon_shotgun_semiauto',
        runcost = 84,
        copytime = 10000,
    },
    {
        item = 'bpo_weapon_shotgun_pump',
        receive = 'bpc_weapon_shotgun_pump',
        runcost = 84,
        copytime = 10000,
    },
   
}
