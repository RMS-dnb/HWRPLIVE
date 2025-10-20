Config = Config or {}

Config.Blip = {
    blipName = 'Doctor',
    blipSprite = 'blip_shop_Doctor',
    blipScale = 0.2
}

Config.Target = false
Config.Debug = false

Config.Ped = 'U_M_M_RHDDoctor_01'
Config.OnlyDead = false
Config.JobDutyCheck = true
Config.MinMedics = 4
Config.ProgressTime = 15000

Config.Extras = {
    PayForTreatment = true,
    TreatmentCost = 10,
    TreatmentPayType = 'cash'
}

Config.LocationsDoc = {
    {
        name = 'Valentine Doctor',
        coords = vector4(-280.08, 817.3, 119.32, 111.91 -1),
        usePed = false,
        showblip = false,
        bed = vector4(-282.23, 814.38, 118.89, 101.00),
        Cam = vector4(-284.82, 816.64, 119.39, 239.37),
        anim = { ['M'] = 'PROP_HUMAN_SLEEP_BED_PILLOW_HIGH',
                 ['F'] = 'WORLD_PLAYER_SLEEP_GROUND',}
    },
    {
        name = 'Strawberry Doctor',
        coords = vector4(-1800.01, -433.07, 156.42, 50.52 -1),
        usePed = false,
        showblip = false,
        bed = vector4(-1804.43, -432.52, 158.32, 345.00),
        anim = { ['M'] = 'PROP_CAMP_FIRE_SEAT_CHAIR', ['F'] = 'PROP_CAMP_FIRE_SEAT_CHAIR'}
    },
    {
        name = 'Rhodes Doctor',
        --coords = vector4(1367.94, -1311.37, 77.96, 183.765 -1),
        coords = vector4(1365.12, -1307.15, 77.1, 258.9 -1),
        usePed = false,
        showblip = false,
        bed = vector4(1372.69, -1309.98, 77.45, 148.57),
        anim = { ['M'] = 'PROP_HUMAN_SLEEP_BED_PILLOW_HIGH',
                 ['F'] = 'PROP_HUMAN_SLEEP_BED_PILLOW',}
    },
    {
        name = 'St Denis Doctor',
        coords = vector4(2726.68, -1232.04, 50.37, 262.04 -1),
        usePed = false,
        showblip = false,
        bed = vector4(2732.03, -1230.15, 49.87, 106.74),
        Cam = vector4(2730.13, -1232.85, 50.37, 324.85),
        anim = 
        { ['M'] = 'PROP_CAMP_FIRE_SEAT_CHAIR', ['F'] = 'PROP_CAMP_FIRE_SEAT_CHAIR',}
    },
	-- {
    --     name = 'Armadillo Doctor',
    --     coords = vector4(-3648.3477, -2651.57, -14.43, 356.345 -1), 
    --     usePed = false,
    --     showblip = false,
    --     bed = vector4(-3655.06, -2648.07, -13.92, 265.93),
    --     anim = { ['M'] = 'PROP_HUMAN_SLEEP_BED_PILLOW_HIGH',
    --              ['F'] = 'PROP_HUMAN_SLEEP_BED_PILLOW',}
    -- },
	-- {
    --     name = 'Guarma Doctor',
    --     coords = vector4(1384.53, -7001.94, 56.10, 1385.125 -1),
    --     usePed = false,
    --     showblip = false,
    --     bed = vector4(1384.53, -7001.94, 56.10, 1385.125 -1),
    --     anim = { ['M'] = 'PROP_HUMAN_SLEEP_BED_PILLOW_HIGH',
    --              ['F'] = 'PROP_HUMAN_SLEEP_BED_PILLOW',}
    -- },
	{
        name = 'Annesburg Doctor',
        coords = vector4(2913.40, 1448.56, 56.45, 110.095 -1),
        usePed = false,
        showblip = false,
        bed = vector4(2913.40, 1448.56, 56.45, 110.095 -1),
        anim = { ['M'] = 'PROP_HUMAN_SLEEP_BED_PILLOW_HIGH',
                 ['F'] = 'PROP_HUMAN_SLEEP_BED_PILLOW',}
    },

    {
        name = 'Blackwater Doctor',
        coords = vector4(-778.9, -1306.03, 43.71, 87.03 -1),
        usePed = false,
        showblip = false,
        bed = vector4(-781.7546997070312, -1302.0445556640625, 43.35623550415039, 89.7845 -1),
        anim = { ['M'] = 'PROP_HUMAN_SLEEP_BED_PILLOW_HIGH',
                 ['F'] = 'PROP_HUMAN_SLEEP_BED_PILLOW',}
    },
}
