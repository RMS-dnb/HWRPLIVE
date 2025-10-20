Config = {}

-- debug
Config.Debug = false

-- settings
Config.AddGPSRoute = false
Config.AlertTimer = 60
Config.Keybind = 'J'
Config.StorageMaxWeight = 4000000
Config.StorageMaxSlots = 1000
Config.TrashCollection = 1 -- mins
Config.ArmouryAccessGrade = 1 -- and greater than
Config.SearchTime = 10000
Config.SearchDistance = 2.5
Config.EnablePlayerDeathAlerts = false    
Config.EnableNPCDeathAlerts = false     
Config.AlertCooldown = 30000             
Config.AlertDistance = 100.0             

-- Law Office Prompt Locations
Config.LawOfficeLocations =
{
    {   -- valentine
        name = 'Valentine Sheriffs Office',
        prompt = 'vallawoffice',
        coords = vector3(-278.42, 805.29, 119.38),
        jobaccess = {'nhso', 'usms', 'doj'}, -- Add multiple jobs here
        blipsprite = 'blip_ambient_sheriff',
        blipscale = 0.2,
        showblip = true
    },
    {   -- rhodes
        name = 'Rhodes Sheriffs Office',
        prompt = 'rholawoffice',
        coords = vector3(1362.04, -1302.10, 77.77),
        jobaccess = {'nhso', 'usms', 'lso', 'doj'}, -- Add multiple jobs here
        blipsprite = 'blip_ambient_sheriff',
        blipscale = 0.2,
        showblip = true
    },
    {   -- blackwater
        name = 'Black Water Sheriffs Office',
        prompt = 'blklawoffice',
        coords = vector3(-761.76, -1268.18, 44.04),
        jobaccess = {'naso', 'usms', 'doj'}, -- Add multiple jobs here
        blipsprite = 'blip_ambient_sheriff',
        blipscale = 0.2,
        showblip = true
    },
    {   -- strawberry
        name = 'Strawberry Sheriffs Office',
        prompt = 'strlawoffice',
        coords = vector3(-1811.95, -353.94, 164.65),
        jobaccess = {'naso', 'usms', 'doj'}, -- Add multiple jobs here
        blipsprite = 'blip_ambient_sheriff',
        blipscale = 0.2,
        showblip = true
    },
    {   -- Armadillo
        name = 'Armadillo Sheriffs Office',
        prompt = 'Armadawoffice',
        coords = vector3(-3625.07, -2602.05, -13.34),
        jobaccess = {'naso', 'usms', 'doj'}, -- Add multiple jobs here
        blipsprite = 'blip_ambient_sheriff',
        blipscale = 0.2,
        showblip = true
    },
    {   -- Tumbleweed
        name = 'Tumbleweed Sheriffs Office',
        prompt = 'Tumbawoffice',
        coords = vector3(-5531.13, -2930.2, -1.36),
        jobaccess = {'naso', 'usms', 'doj'}, -- Add multiple jobs here
        blipsprite = 'blip_ambient_sheriff',
        blipscale = 0.2,
        showblip = true
    },
    {   -- saint denis
        name = 'Saint Denis Sheriffs Office',
        prompt = 'stdenlawoffice',
        coords = vector3(2507.72, -1301.89, 48.95),
        jobaccess = {'nhso', 'usms', 'lso', 'doj'}, -- Add multiple jobs here
        blipsprite = 'blip_ambient_sheriff',
        blipscale = 0.2,
        showblip = true
    },
        {   -- annesburg
        name = 'Annesburg Sheriffs Office',
        prompt = 'annesburglawoffice',
        coords = vector3(2907.92, 1308.78, 44.98),
        jobaccess = {'nhso', 'usms', 'lso', 'doj'}, -- Add multiple jobs here
        blipsprite = 'blip_ambient_sheriff',
        blipscale = 0.2,
        showblip = true
    },
        {   -- fort wallace
        name = 'Fort Wallace Marshals Office',
        prompt = 'wallacelawoffice',
        coords = vector3(341.81, 1471.35, 179.79),
        jobaccess = {'usms', 'doj'}, -- Add multiple jobs here
        blipsprite = 'blip_ambient_sheriff',
        blipscale = 0.2,
        showblip = true
    },
        {   -- val doj office
        name = 'Valentine DOJ Office',
        prompt = 'valdojoffice',
        coords = vector3(-293.3, 778.43, 119.31),
        jobaccess = {'usms', 'doj'}, -- Add multiple jobs here
        blipsprite = 'blip_ambient_sheriff',
        blipscale = 0.2,
        showblip = true
    },
        {   -- st. denis doj office
        name = 'Saint Denis DOJ Office',
        prompt = 'stdenisdojoffice',
        coords = vector3(2577.69, -1298.27, 52.92),
        jobaccess = {'usms', 'doj'}, -- Add multiple jobs here
        blipsprite = 'blip_ambient_sheriff',
        blipscale = 0.2,
        showblip = true
    },
        {   -- bw doj office
        name = 'Blackwater DOJ Office',
        prompt = 'bwdojoffice',
        coords = vector3(-811.77, -1193.97, 47.5),
        jobaccess = {'usms', 'doj'}, -- Add multiple jobs here
        blipsprite = 'blip_ambient_sheriff',
        blipscale = 0.2,
        showblip = true
    },
}

--Config.LawJobs = { 'vallaw' , 'rholaw', 'blklaw', 'strlaw', 'doj', 'usms' , 'naso', 'nhso', 'lso' }
Config.LawJobs = {  'doj', 'usms' , 'naso', 'nhso', 'lso' }

Config.SpawnLocations = {
    ['valentine'] = {
        wagon = vector4(-279.18, 829.78, 119.33, 95.33),
        horse = vector4(-279.18, 829.78, 119.33, 95.33)
    },
    ['saint_denis'] = {
        wagon = vector4(2493.00, -1321.87, 48.87, 281.19),
        horse = vector4(2493.00, -1321.87, 48.87, 281.19)
    },
    ['blackwater'] = {
        wagon = vector4(-750.53, -1268.28, 43.29, 179.58),
        horse = vector4(-750.53, -1268.28, 43.29, 179.58)
    },
    ['rhodes'] = {
        wagon = vector4(1355.71, -1312.88, 76.83, 90.77),
        horse = vector4(1355.71, -1312.88, 76.83, 90.77)
    },
    ['strawberry'] = {
        wagon = vector4(-1800.32, -352.68, 164.06, 204.48),
        horse = vector4(-1800.32, -352.68, 164.06, 204.48)
    },
    ['forwallace'] = {
        wagon = vector4(373.8, 1470.1, 179.74, 156.92),
        horse = vector4(373.8, 1470.1, 179.74, 156.92)
    }
    
}
