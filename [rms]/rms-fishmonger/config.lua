Config = {}

---------------------------------
-- shop settings
---------------------------------
Config = {
    FishmongerShopItems = {
        { name = 'weapon_fishingrod', amount = 50, price = 10 },
        { name = 'p_baitbread01x',    amount = 50, price = 0.25 },
        { name = 'p_baitcorn01x',     amount = 50, price = 0.25 },
        { name = 'p_baitcheese01x',   amount = 50, price = 0.25 },
        { name = 'p_baitworm01x',     amount = 50, price = 0.50 },
        { name = 'p_baitcricket01x',  amount = 50, price = 0.50 },
        { name = 'p_crawdad01x',      amount = 50, price = 0.50 },
        { name = 'fishtrap',          amount = 50, price = 50.00 },
        { name = 'trapbait',          amount = 500, price = 0.35 },  
    },
    PersistStock = true, --should stock save in database and load it after restart, to 'remember' stock value before restart
}

---------------------------------
-- settings
---------------------------------
Config.Debug         = false
Config.KeyBind       = 'J'
Config.SellTime      = 5000
Config.EnableTarget  = true

---------------------------------
-- npc settings
---------------------------------
Config.DistanceSpawn = 20.0
Config.FadeIn        = true

---------------------------------
-- webhook settings
---------------------------------
Config.WebhookName = 'rex-fishmonger'
Config.WebhookTitle = 'Rex Fishmonger'
Config.WebhookColour = 'default'
Config.Lang1 = ' Sold items to the Fishmonger for a total of $'

---------------------------------
-- fish sell price
---------------------------------
Config.FishPrice = {
    Small     = 1.50,
    Medium    = 2.00,
    Large     = 3.50,
    Crayfish  = 0.40,
    Lobster   = 0.70,
    Crab      = 0.40,
    BlueCrab  = 0.50,
}

---------------------------------
-- fish meat amount
---------------------------------
Config.FishAmount = {
    Small  = 3,
    Medium = 5,
    Large  = 6,
}

---------------------------------
-- blip settings
---------------------------------
Config.Blip = {
    blipName = 'Fish Monger', -- Config.Blip.blipName
    blipSprite = 'blip_mg_fishing', -- Config.Blip.blipSprite
    blipScale = 0.2 -- Config.Blip.blipScale
}

---------------------------------
-- prompt locations
---------------------------------
Config.FishMongerLocations = {
    {   --st denis
        name = 'St Denis Fish Monger',
        prompt = 'stdenis-fishmonger',
        coords = vector3(2662.2517, -1505.653, 45.968982),
        npcmodel = `cs_fishcollector`,
        npccoords = vector4(2661.7463, -1506.055, 45.968948, 321.56686),
        showblip = true
    }, 
    {   --valentine
        name = 'Valentine Fish Monger',
        prompt = 'valentine-fishmonger',
        coords = vector3(-335.5372, 761.984, 116.58402),
        npcmodel = `cs_fishcollector`,
        npccoords = vector4(-335.4444, 762.00537, 116.5845, 45.516292),
        showblip = true
    }, 
    {   -- rhodes
        name = 'Rhodes Fish Monger',
        prompt = 'rhodes-fishmonger',
        coords = vector3(1295.14, -1275.36, 75.9),
        npcmodel = `cs_fishcollector`,
        npccoords = vector4(1295.14, -1275.36, 75.9, 139.38),
        showblip = true
    }, 
    {   -- annesburg
        name = 'Annesburg Fish Monger',
        prompt = 'annesburg-fishmonger',
        coords = vector3(3017.9001, 1352.2457, 42.735687),
        npcmodel = `cs_fishcollector`,
        npccoords = vector4(3018.2368, 1352.096, 42.713443, 23.409223),
        showblip = true
    },
    {   -- vanhorn
        name = 'Van Horn Fish Monger',
        prompt = 'vanhorn-fishmonger',
        coords = vector3(3003.9787, 513.5899, 42.579635),
        npcmodel = `cs_fishcollector`,
        npccoords = vector4(3003.9787, 513.5899, 42.579635, 88.501037),
        showblip = true
    },
    {   -- blackwater
        name = 'Blackwater Fish Monger',
        prompt = 'blackwater-fishmonger',
        coords = vector3(-724.5062, -1253.603, 44.734111),
        npcmodel = `cs_fishcollector`,
        npccoords = vector4(-723.9387, -1254.361, 44.734092, 49.674472),
        showblip = true
    },
    {   -- tumbleweed
        name = 'Tumbleweed Fish Monger',
        prompt = 'tumbleweed-fishmonger',
        coords = vector3(-5513.275, -2943.476, -2.025686),
        npcmodel = `cs_fishcollector`,
        npccoords = vector4(-5513.404, -2944.167, -2.001027, 29.520355),
        showblip = true
    }, 
    {   -- river
        name = 'River Fish Monger',
        prompt = 'river-fishmonger',
        coords = vector3(-1451.595, -2685.068, 41.228832),
        npcmodel = `cs_fishcollector`,
        npccoords = vector4(-1452.24, -2684.517, 41.256187, 221.86631),
        showblip = false
    },
    {   -- river
        name = 'Annesburg Fish Monger',
        prompt = 'annes-fishmonger',
        coords = vector3(2959.3, 464.79, 49.45),
        npcmodel = `cs_fishcollector`,
        npccoords = vector4(2958.14, 464.09, 49.45, 297.66),
        showblip = false
    },
    {   -- river
        name = 'Guarma Fish Monger',
        prompt = 'guarma-fishmonger',
        coords = vector3(1308.37, -6810.13, 43.61),
        npcmodel = `cs_fishcollector`,
        npccoords = vector4(1308.37, -6810.13, 43.61, 231.04),
        showblip = false
    },
}
