Config = {}

---------------------------------
-- settings
---------------------------------
Config.EnableTarget     = true
Config.Keybind          = 'J'
Config.Img              = "rsg-inventory/html/images/"
Config.Money            = 'cash' -- 'cash', 'bank' or 'bloodmoney'
Config.ServerNotify     = true
Config.LicenseRequired  = false
Config.EnableRentSystem = true
Config.xpEnabled        = false

---------------------------------
-- rent settings
---------------------------------
Config.MaxWeaponsmiths    = 1
Config.RentStartup        = 10000
Config.RentPerHour        = 1
Config.WeaponsmithCronJob = '0 * * * *' -- cronjob runs every hour (0 * * * *)
Config.MaxRent            = 750

---------------------------------
-- storage settings
---------------------------------
Config.PlayerShareMaxWeight = 4000000
Config.PlayerShareMaxSlots  = 4
Config.PlayerShareName      = 'Player Share Storage'
Config.CraftingMaxWeight    = 4000000
Config.CraftingMaxSlots     = 50
Config.CraftingName         = 'Crafting Storage'
Config.StockMaxWeight       = 4000000
Config.StockMaxSlots        = 100
Config.StockName            = 'Stock Storage'

---------------------------------
-- npc settings
---------------------------------
Config.DistanceSpawn = 20.0
Config.FadeIn = true

---------------------------------
-- weaponsmith locations
---------------------------------
Config.WeaponsmithLocations = {
    { 
        name = 'Valentine Gunsmith',
        weaponsmithid = 'valweaponsmith',
        coords = vector3(-283.218, 780.56945, 119.50395),
        npcmodel = `mp_u_M_M_lom_rhd_smithassistant_01`,
        npccoords = vector4(-283.218, 780.56945, 119.50395, 195.57691),
        jobaccess = 'valgunsmith',
        blipname = 'Valentine Gunsmith',
        blipsprite = 'blip_shop_gunsmith',
        blipscale = 0.2,
        showblip = false
    },
    { 
        name = 'Saint Denis Gunsmith',
        weaponsmithid = 'stdweaponsmith',
        coords = vector3(2714.3962, -1287.823, 49.635405),
        npcmodel = `mp_u_M_M_lom_rhd_smithassistant_01`,
        npccoords = vector4(2715.3962, -1287.723, 49.630405, 10.533507),
        jobaccess = 'stdgunsmith',
        blipname = 'Saint Denis Gunsmith',
        blipsprite = 'blip_shop_gunsmith',
        blipscale = 0.2,
        showblip = false
    },
    { 
        name = 'Annesburg Gunsmith',
        weaponsmithid = 'annweaponsmith',
        coords = vector3(2945.4055, 1319.3961, 44.820247),
        npcmodel = `mp_u_M_M_lom_rhd_smithassistant_01`,
        npccoords = vector4(2948.23, 1318.93, 44.87, 82.16),
        jobaccess = 'anngunsmith',
        blipname = 'Annesburg Gunsmith',
        blipsprite = 'blip_shop_gunsmith',
        blipscale = 0.2,
        showblip = false
    },
    { 
        name = 'Rhodes Gunsmith',
        weaponsmithid = 'rhoweaponsmith',
        coords = vector3(1324.9614, -1322.386, 77.89064),
        npcmodel = `mp_u_M_M_lom_rhd_smithassistant_01`,
        npccoords = vector4(1321.7536, -1322.941, 77.887725, 344.5783),
        jobaccess = 'rhogunsmith',
        blipname = 'Rhodes Gunsmith',
        blipsprite = 'blip_shop_gunsmith',
        blipscale = 0.2,
        showblip = false
    },
    { 
        name = 'Blackwater Gunsmith',
        weaponsmithid = 'blkweaponsmith',
        coords = vector3(-782.76, -1298.332, 42.775379),
        npcmodel = `mp_u_M_M_lom_rhd_smithassistant_01`,
        npccoords = vector4(-782.8546, -1299.332, 43.775379, 340.8132),
        jobaccess = 'blkgunsmith',
        blipname = 'Blackwater Gunsmith',
        blipsprite = 'blip_shop_gunsmith',
        blipscale = 0.2,
        showblip = false
    },
    { 
        name = 'Tumbleweed Gunsmith',
        weaponsmithid = 'tumweaponsmith',
        coords = vector3(-5506.3, -2963.778, -0.636365),
        npcmodel = `mp_u_M_M_lom_rhd_smithassistant_01`,
        npccoords = vector4(-5506.3, -2963.778, -0.636365, 12.501747),
        jobaccess = 'tumgunsmith',
        blipname = 'Tumbleweed Gunsmith',
        blipsprite = 'blip_shop_gunsmith',
        blipscale = 0.2,
        showblip = false
    },
    { 
        name = 'Van Horn Gunsmith',
        weaponsmithid = 'vanweaponsmith',
        coords = vector3(2979.59, 499.75, 42.1),
        npcmodel = `mp_u_M_M_lom_rhd_smithassistant_01`,
        npccoords = vector4(2979.69, 498.27, 42.09, 12.07),
        jobaccess = 'vangunsmith',
        blipname = 'Van Horn Gunsmith',
        blipsprite = 'blip_shop_gunsmith',
        blipscale = 0.2,
        showblip = false
    },
    { 
        name = 'Strawberry Gunsmith',
        weaponsmithid = 'strawweaponsmith',
        coords = vector3(-1841.75, -422.6, 161.31),
        npcmodel = `mp_u_M_M_lom_rhd_smithassistant_01`,
        npccoords = vector4(-1841.75, -422.6, 161.31, 342.57),
        jobaccess = 'strawgunsmith',
        blipname = 'Strawberry Gunsmith',
        blipsprite = 'blip_shop_gunsmith',
        blipscale = 0.2,
        showblip = false
    },
    { 
        name = 'Armadillo Gunsmith',
        weaponsmithid = 'armaweaponsmith',
        coords = vector3(-3677.45, -2596.05, -13.29),
        npcmodel = `mp_u_M_M_lom_rhd_smithassistant_01`,
        npccoords = vector4(-3677.45, -2596.05, -13.29, 274.14),
        jobaccess = 'armagunsmith',
        blipname = 'Armadillo Gunsmith',
        blipsprite = 'blip_shop_gunsmith',
        blipscale = 0.2,
        showblip = false
    },
}

---------------------------------
-- weaponsmith crafting
---------------------------------
Config.WeaponsmithCrafting = {

    {
        category = 'Revolver',
        crafttime = 30000,
        --craftingxp = 0,
        --bpc = 'bpc_weapon_revolver_cattleman',
        ingredients = { 
            [1] = { item = 'revolverbarrel',  amount = 1 },
            [2] = { item = 'revolvercylinder', amount = 1 },
            [3] = { item = 'revolverhandle', amount = 1 },
        },
        receive = 'weapon_revolver_cattleman',
        giveamount = 1
    },
    {
        category = 'Revolver',
        crafttime = 30000,
        craftingxp = 0,
        bpc = 'bpc_weapon_revolver_m1895',
        ingredients = { 
            [1] = { item = 'revolverbarrel',  amount = 1 },
            [2] = { item = 'revolvercylinder', amount = 1 },
            [3] = { item = 'revolverhandle', amount = 1 },
            [4] = { item = 'bpc_weapon_revolver_m1895', amount = 1 },
        },
        receive = 'weapon_revolver_cattleman_mexican',
        giveamount = 1
    },
    {
        category = 'Revolver',
        crafttime = 30000,
        --craftingxp = 0,
        --bpc = 'bpc_weapon_revolver_doubleaction',
        ingredients = { 
            [1] = { item = 'revolverbarrel',  amount = 1 },
            [2] = { item = 'revolvercylinder', amount = 1 },
            [3] = { item = 'revolverhandle', amount = 1 },
        },
        receive = 'weapon_revolver_doubleaction',
        giveamount = 1
    },
    {
        category = 'Revolver',
        crafttime = 30000,
        craftingxp = 0,
        bpc = 'bpc_weapon_revolver_doubleaction_gambler',
        ingredients = { 
            [1] = { item = 'revolverbarrel',  amount = 1 },
            [2] = { item = 'revolvercylinder', amount = 1 },
            [3] = { item = 'revolverhandle', amount = 1 },
            [3] = { item = 'bpc_weapon_revolver_doubleaction_gambler', amount = 1 },
        },
        receive = 'weapon_revolver_doubleaction_gambler',
        giveamount = 1
    },
    {
        category = 'Revolver',
        crafttime = 30000,
        --craftingxp = 0,
        --bpc = 'bpc_weapon_revolver_schofield',
        ingredients = { 
            [1] = { item = 'revolverbarrel',  amount = 1 },
            [2] = { item = 'revolvercylinder', amount = 1 },
            [3] = { item = 'revolverhandle', amount = 1 },
        },
        receive = 'weapon_revolver_schofield',
        giveamount = 1
    },
    {
        category = 'Revolver',
        crafttime = 30000,
        craftingxp = 0,
        bpc = 'bpc_weapon_revolver_lemat',
        ingredients = { 
            [1] = { item = 'revolverbarrel',  amount = 1 },
            [2] = { item = 'revolvercylinder', amount = 1 },
            [3] = { item = 'revolverhandle', amount = 1 },
            [4] = { item = 'bpc_weapon_revolver_lemat', amount = 1 },
        },
        receive = 'weapon_revolver_lemat',
        giveamount = 1
    },
    {
        category = 'Revolver',
        crafttime = 30000,
        craftingxp = 0,
        bpc = 'bpc_weapon_revolver_navy',
        ingredients = { 
            [1] = { item = 'revolverbarrel',  amount = 1 },
            [2] = { item = 'revolvercylinder', amount = 1 },
            [3] = { item = 'revolverhandle', amount = 1 },
            [4] = { item = 'bpc_weapon_revolver_navy', amount = 1 },
        },
        receive = 'weapon_revolver_navy',
        giveamount = 1
    },
    {
        category = 'Revolver',
        crafttime = 30000,
        craftingxp = 0,
        bpc = 'bpc_weapon_revolver_remington',
        ingredients = { 
            [1] = { item = 'revolverbarrel',  amount = 1 },
            [2] = { item = 'revolvercylinder', amount = 1 },
            [3] = { item = 'revolverhandle', amount = 1 },
            [4] = { item = 'bpc_weapon_revolver_remington', amount = 1 },
        },
        receive = 'weapon_revolver_navy_crossover',
        giveamount = 1
    },
    {
        category = 'Pistol',
        crafttime = 30000,
        craftingxp = 0,
        bpc = 'bpc_weapon_pistol_volcanic',
        ingredients = { 
            [1] = { item = 'pistolbarrel',  amount = 1 },
            [2] = { item = 'pistolreceiver', amount = 1 },
            [3] = { item = 'pistolgrip', amount = 1 },
            [4] = { item = 'bpc_weapon_pistol_volcanic', amount = 1 },
        },
        receive = 'weapon_pistol_volcanic',
        giveamount = 1
    },
    {
        category = 'Pistol',
        crafttime = 30000,
        craftingxp = 0,
        bpc = 'bpc_weapon_pistol_m1899',
        ingredients = { 
            [1] = { item = 'pistolbarrel',  amount = 1 },
            [2] = { item = 'pistolreceiver', amount = 1 },
            [3] = { item = 'pistolgrip', amount = 1 },
            [4] = { item = 'bpc_weapon_pistol_m1899', amount = 1 },
        },
        receive = 'weapon_pistol_m1899',
        giveamount = 1
    },
    {
        category = 'Pistol',
        crafttime = 30000,
        craftingxp = 0,
        bpc = 'bpc_weapon_pistol_mauser',
        ingredients = { 
            [1] = { item = 'pistolbarrel',  amount = 1 },
            [2] = { item = 'pistolreceiver', amount = 1 },
            [3] = { item = 'pistolgrip', amount = 1 },
            [4] = { item = 'bpc_weapon_pistol_mauser', amount = 1 },
        },
        receive = 'weapon_pistol_mauser',
        giveamount = 1
    },
    {
        category = 'Pistol',
        crafttime = 30000,
        craftingxp = 0,
        bpc = 'bpc_weapon_pistol_semiauto',
        ingredients = { 
            [1] = { item = 'pistolbarrel',  amount = 1 },
            [2] = { item = 'pistolreceiver', amount = 1 },
            [3] = { item = 'pistolgrip', amount = 1 },
            [4] = { item = 'bpc_weapon_pistol_semiauto', amount = 1 },
        },
        receive = 'weapon_pistol_semiauto',
        giveamount = 1
    },
    {
        category = 'Pistol',
        crafttime = 30000,
        craftingxp = 0,
        bpc = 'bpc_weapon_pistol_luger',
        ingredients = { 
            [1] = { item = 'pistolbarrel',  amount = 1 },
            [2] = { item = 'pistolreceiver', amount = 1 },
            [3] = { item = 'pistolgrip', amount = 1 },
            [4] = { item = 'bpc_weapon_pistol_luger', amount = 1 },
        },
        receive = 'weapon_revolver_doubleaction_gambler',
        giveamount = 1
    },
    {
        category = 'Repeater',
        crafttime = 30000,
        craftingxp = 0,
        bpc = 'bpc_weapon_repeater_carbine',
        ingredients = { 
            [1] = { item = 'repeaterbarrel',  amount = 1 },
            [2] = { item = 'repeaterreceiver', amount = 1 },
            [3] = { item = 'repeaterstock', amount = 1 },
            [4] = { item = 'bpc_weapon_repeater_carbine', amount = 1 },
        },
        receive = 'weapon_repeater_carbine',
        giveamount = 1
    },
    {
        category = 'Repeater',
        crafttime = 30000,
        craftingxp = 0,
        bpc = 'bpc_weapon_repeater_winchester',
        ingredients = { 
            [1] = { item = 'repeaterbarrel',  amount = 1 },
            [2] = { item = 'repeaterreceiver', amount = 1 },
            [3] = { item = 'repeaterstock', amount = 1 },
            [4] = { item = 'bpc_weapon_repeater_winchester', amount = 1 },
        },
        receive = 'weapon_repeater_winchester',
        giveamount = 1
    },
    {
        category = 'Repeater',
        crafttime = 30000,
        craftingxp = 0,
        bpc = 'bpc_weapon_repeater_henry',
        ingredients = { 
            [1] = { item = 'repeaterbarrel',  amount = 1 },
            [2] = { item = 'repeaterreceiver', amount = 1 },
            [3] = { item = 'repeaterstock', amount = 1 },
            [4] = { item = 'bpc_weapon_repeater_henry', amount = 1 },
        },
        receive = 'weapon_repeater_henry',
        giveamount = 1
    },
    {
        category = 'Repeater',
        crafttime = 30000,
        --craftingxp = 0,
        --bpc = 'bpc_weapon_repeater_evans',
        ingredients = { 
            [1] = { item = 'repeaterbarrel',  amount = 1 },
            [2] = { item = 'repeaterreceiver', amount = 1 },
            [3] = { item = 'repeaterstock', amount = 1 },
        },
        receive = 'weapon_repeater_evans',
        giveamount = 1
    },
    {
        category = 'Rifle',
        crafttime = 30000,
        --craftingxp = 0,
        --bpc = 'bpc_weapon_rifle_varmint',
        ingredients = { 
            [1] = { item = 'riflebarrel',  amount = 1 },
            [2] = { item = 'riflereceiver', amount = 1 },
            [3] = { item = 'riflestock', amount = 1 },
        },
        receive = 'weapon_rifle_varmint',
        giveamount = 1
    },
    {
        category = 'Rifle',
        crafttime = 30000,
        craftingxp = 0,
        bpc = 'bpc_weapon_rifle_boltaction',
        ingredients = { 
            [1] = { item = 'riflebarrel',  amount = 1 },
            [2] = { item = 'riflereceiver', amount = 1 },
            [3] = { item = 'riflestock', amount = 1 },
            [4] = { item = 'bpc_weapon_rifle_boltaction', amount = 1 },
        },
        receive = 'weapon_rifle_boltaction',
        giveamount = 1
    },
    {
        category = 'Rifle',
        crafttime = 30000,
        craftingxp = 0,
        bpc = 'bpc_weapon_rifle_springfield',
        ingredients = { 
            [1] = { item = 'riflebarrel',  amount = 1 },
            [2] = { item = 'riflereceiver', amount = 1 },
            [3] = { item = 'riflestock', amount = 1 },
            [4] = { item = 'bpc_weapon_rifle_springfield', amount = 1 },
        },
        receive = 'weapon_rifle_springfield',
        giveamount = 1
    },
        {
        category = 'Rifle',
        crafttime = 30000,
        craftingxp = 0,
        bpc = 'bpc_weapon_rifle_mosinnagant',
        ingredients = { 
            [1] = { item = 'riflebarrel',  amount = 1 },
            [2] = { item = 'riflereceiver', amount = 1 },
            [3] = { item = 'riflestock', amount = 1 },
            [4] = { item = 'bpc_weapon_rifle_mosinnagant', amount = 1 },
        },
        receive = 'weapon_rifle_elephant',
        giveamount = 1
    },
    --{
    --    category = 'Rifle',
    --    crafttime = 30000,
    --    craftingxp = 0,
    --    bpc = 'bpc_weapon_rifle_elephant',
    --    ingredients = { 
    --        [1] = { item = 'riflebarrel',  amount = 1 },
    --        [2] = { item = 'riflereceiver', amount = 1 },
    --        [3] = { item = 'riflestock', amount = 1 },
    --        [4] = { item = 'bpc_weapon_rifle_elephant', amount = 1 },
    --    },
    --    receive = 'weapon_rifle_elephant',
    --    giveamount = 1
    --},
    {
        category = 'Shotgun',
        crafttime = 30000,
        --craftingxp = 0,
        --bpc = 'bpc_weapon_shotgun_doublebarrel',
        ingredients = { 
            [1] = { item = 'shotgunbarrel',  amount = 1 },
            [2] = { item = 'shotgunstock', amount = 1 },
            [3] = { item = 'shotgunreceiver', amount = 1 },
        },
        receive = 'weapon_shotgun_doublebarrel',
        giveamount = 1
    },
    {
        category = 'Shotgun',
        crafttime = 30000,
        craftingxp = 0,
        bpc = 'bpc_weapon_shotgun_doublebarrel_exotic',
        ingredients = { 
            [1] = { item = 'shotgunbarrel',  amount = 1 },
            [2] = { item = 'shotgunstock', amount = 1 },
            [3] = { item = 'shotgunreceiver', amount = 1 },
            [4] = { item = 'bpc_weapon_shotgun_doublebarrel_exotic', amount = 1 },
        },
        receive = 'weapon_shotgun_doublebarrel_exotic',
        giveamount = 1
    },
    {
        category = 'Shotgun',
        crafttime = 30000,
        craftingxp = 0,
        bpc = 'bpc_weapon_shotgun_sawedoff',
        ingredients = { 
            [1] = { item = 'shotgunbarrel',  amount = 1 },
            [2] = { item = 'shotgunstock', amount = 1 },
            [3] = { item = 'shotgunreceiver', amount = 1 },
            [4] = { item = 'bpc_weapon_shotgun_sawedoff', amount = 1 },
        },
        receive = 'weapon_shotgun_sawedoff',
        giveamount = 1
    },
    {
        category = 'Shotgun',
        crafttime = 30000,
        craftingxp = 0,
        bpc = 'bpc_weapon_shotgun_semiauto',
        ingredients = { 
            [1] = { item = 'shotgunbarrel',  amount = 1 },
            [2] = { item = 'shotgunstock', amount = 1 },
            [3] = { item = 'shotgunreceiver', amount = 1 },
            [4] = { item = 'bpc_weapon_shotgun_semiauto', amount = 1 },
        },
        receive = 'weapon_shotgun_semiauto',
        giveamount = 1
    },
    {
        category = 'Shotgun',
        crafttime = 30000,
        craftingxp = 0,
        bpc = 'bpc_weapon_shotgun_pump',
        ingredients = { 
            [1] = { item = 'shotgunbarrel',  amount = 1 },
            [2] = { item = 'shotgunstock', amount = 1 },
            [3] = { item = 'shotgunreceiver', amount = 1 },
            [4] = { item = 'bpc_weapon_shotgun_pump', amount = 1 },
        },
        receive = 'weapon_shotgun_pump',
        giveamount = 1
    },
    {
        category = 'Shotgun',
        crafttime = 30000,
        --craftingxp = 0,
        --bpc = 'bpc_weapon_shotgun_repeating',
        ingredients = { 
            [1] = { item = 'shotgunbarrel',  amount = 1 },
            [2] = { item = 'shotgunstock', amount = 1 },
            [3] = { item = 'shotgunreceiver', amount = 1 },
        },
        receive = 'weapon_shotgun_repeating',
        giveamount = 1
    },
    {
        category = 'Parts',
        crafttime = 30000,
        craftingxp = 0,
        
        ingredients = { 
            [1] = { item = 'steel_bar',  amount = 2 },
        },
        receive = 'shotgunbarrel',
        giveamount = 2
    },
    {
        category = 'Parts',
        crafttime = 30000,
        craftingxp = 0,
        
        ingredients = { 
            [1] = { item = 'iron_bar',  amount = 1 },
            [2] = { item = 'wood', amount = 2 },
        },
        receive = 'shotgunstock',
        giveamount = 2
    },
    {
        category = 'Parts',
        crafttime = 30000,
        craftingxp = 0,
        
        ingredients = { 
            [1] = { item = 'steel_bar',  amount = 2 },
            [2] = { item = 'iron_bar', amount = 1 },
        },
        receive = 'shotgunreceiver',
        giveamount = 2
    },
    {
        category = 'Parts',
        crafttime = 30000,
        craftingxp = 0,
        
        ingredients = { 
            [1] = { item = 'iron_bar',  amount = 1 },
            [2] = { item = 'wood', amount = 2 },
        },
        receive = 'riflestock',
        giveamount = 2
    },
    {
        category = 'Parts',
        crafttime = 30000,
        craftingxp = 0,
        
        ingredients = { 
            [1] = { item = 'steel_bar',  amount = 2 },
            [2] = { item = 'iron_bar', amount = 1 },
        },
        receive = 'riflereceiver',
        giveamount = 2
    },
    {
        category = 'Parts',
        crafttime = 30000,
        craftingxp = 0,
        
        ingredients = { 
            [1] = { item = 'steel_bar',  amount = 2 },
        },
        receive = 'riflebarrel',
        giveamount = 2
    },
    {
        category = 'Parts',
        crafttime = 30000,
        craftingxp = 0,
        
        ingredients = { 
            [1] = { item = 'iron_bar',  amount = 1 },
            [2] = { item = 'wood', amount = 2 },
        },
        receive = 'repeaterstock',
        giveamount = 2
    },
    {
        category = 'Parts',
        crafttime = 30000,
        craftingxp = 0,
        
        ingredients = { 
            [1] = { item = 'steel_bar',  amount = 2 },
            [2] = { item = 'iron_bar', amount = 1 },
        },
        receive = 'repeaterreceiver',
        giveamount = 2
    },
    {
        category = 'Parts',
        crafttime = 30000,
        craftingxp = 0,
        
        ingredients = { 
            [1] = { item = 'steel_bar',  amount = 2 },
        },
        receive = 'repeaterbarrel',
        giveamount = 2
    },
    {
        category = 'Parts',
        crafttime = 30000,
        craftingxp = 0,
        
        ingredients = { 
            [1] = { item = 'steel_bar',  amount = 1 },
            [2] = { item = 'wood', amount = 1 },
        },
        receive = 'pistolgrip',
        giveamount = 2
    },
    {
        category = 'Parts',
        crafttime = 30000,
        craftingxp = 0,
        
        ingredients = { 
            [1] = { item = 'steel_bar',  amount = 1 },
            [2] = { item = 'iron_bar', amount = 1 },
        },
        receive = 'pistolreceiver',
        giveamount = 2
    },
    {
        category = 'Parts',
        crafttime = 30000,
        craftingxp = 0,
        
        ingredients = { 
            [1] = { item = 'steel_bar',  amount = 1 },
        },
        receive = 'pistolbarrel',
        giveamount = 2
    },
    {
        category = 'Parts',
        crafttime = 30000,
        craftingxp = 0,
        
        ingredients = { 
            [1] = { item = 'steel_bar',  amount = 1 },
            [2] = { item = 'wood', amount = 1 },
        },
        receive = 'revolverhandle',
        giveamount = 2
    },
    {
        category = 'Parts',
        crafttime = 30000,
        craftingxp = 0,
        
        ingredients = { 
            [1] = { item = 'steel_bar',  amount = 1 },
            [2] = { item = 'iron_bar', amount = 1 },
        },
        receive = 'revolvercylinder',
        giveamount = 2
    },
    {
        category = 'Parts',
        crafttime = 30000,
        craftingxp = 0,
        
        ingredients = { 
            [1] = { item = 'steel_bar',  amount = 1 },
        },
        receive = 'revolverbarrel',
        giveamount = 2
    },
    {
        category = 'Repair Kit',
        crafttime = 30000,
        craftingxp = 0,
        
        ingredients = { 
            [1] = { item = 'steel_bar',  amount = 2 },
            [2] = { item = 'wood', amount = 1 },
            [3] = { item = 'oilyrag', amount = 1 },
        },
        receive = 'weapon_repair_kit',
        giveamount = 2
    },
}
