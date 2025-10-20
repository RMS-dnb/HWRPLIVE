Config = {}

Config.Debug = false

---------------------------------
-- settings
---------------------------------
Config.BillingCycle     = 120 -- will remove credit every x minute
Config.LandTaxPerCycle  = 10 -- $ amount of tax added per cycle
Config.StartCredit      = 100
Config.CreditWarning    = 5 -- 5 x Config.LandTaxPerCycle amount : warning will trigger when < : example 5 x 1 = 5 so telegram will trigger on 4 hours
Config.SellBack         = 0.1 -- example: 0.5 = 50% of the buy price / 0.8 = 80% of the buy price
Config.StorageMaxWeight = 4000000
Config.StorageMaxSlots  = 100
Config.OwnedHouseBlips  = true -- when set to true, only the owned house will show the blip
Config.PurgeStorage     = false -- purge house inventory when the house is taken back by not paying taxes (disabled by default)

---------------------------------
-- npc settings
---------------------------------
Config.DistanceSpawn = 20.0 -- Distance before spawning/despawning the ped. (GTA Units.)
Config.FadeIn = true

-- blip settings
Config.Blip = {
    blipName   = 'Estate Agent', -- Config.Blip.blipName
    blipSprite = 'blip_ambient_quartermaster', -- Config.Blip.blipSprite
    blipScale  = 0.2 -- Config.Blip.blipScale
}

-- prompt locations
Config.EstateAgents = {

    {    --valentine
        name      = 'Estate Agent',
        prompt    = 'valestateagent',
        coords    = vector3(-250.8893, 743.20239, 118.08129),
        location  = 'newhanover', -- state
        npcmodel  = `A_M_O_SDUpperClass_01`,
        npccoords = vector4(-250.8893, 743.20239, 118.08129, 105.66469),
        showblip  = false
    },
    {    --blackwater
        name      = 'Estate Agent',
        prompt    = 'blkestateagent',
        coords    = vector3(-792.3216, -1203.232, 43.645206),
        location  = 'westelizabeth', -- state
        npcmodel  = `A_M_O_SDUpperClass_01`,
        npccoords = vector4(-792.3216, -1203.232, 43.645206, 184.15261),
        showblip  = true
    },
    {    --armadillo
        name      = 'Estate Agent',
        prompt    = 'armestateagent',
        coords    = vector3(-3645.38, -2551.91, -12.93),
        location  = 'newaustin', -- state
        npcmodel  = `A_M_O_SDUpperClass_01`,
        npccoords = vector4(-3645.38, -2551.91, -12.93, 102.9),
        showblip  = true
    },
    {    --hagen
        name      = 'Estate Agent',
        prompt    = 'hagestateagent',
        coords    = vector3(-1347.746, 2405.7084, 307.06127),
        location  = 'ambarino', -- state
        npcmodel  = `A_M_O_SDUpperClass_01`,
        npccoords = vector4(-1347.746, 2405.7084, 307.06127, 296.02886),
        showblip  = true
    },
    {    --saint denis
        name      = 'Estate Agent',
        prompt    = 'stdenisestateagent',
        coords    = vector3(2598.15, -1301.83, 52.82),
        location  = 'lemoyne', -- state
        npcmodel  = `A_M_O_SDUpperClass_01`,
        npccoords = vector4(2598.15, -1301.83, 52.82, 324.75),
        showblip  = true
    }

}

-- house config
Config.Houses = {

    {    -- house1
        name            = 'house 1',
        houseid         = 'house1',
        houseprompt     = 'houseprompt1',
        menucoords      = vector3(220.0229, 984.58837, 190.89463),
        blipcoords      = vector3(215.80004882813, 988.06512451172, 189.9015045166),
        showblip        = false
    },
    {    -- house2
        name            = ('house 2'),
        houseid         = 'house2',
        houseprompt     = 'houseprompt2',
        menucoords      = vector3(-608.9351, -33.68871, 85.995544),
        blipcoords      = vector3(-615.93969726563, -27.086599349976, 84.997604370117),
        showblip        = false
    },
    {    -- house3
        name            = ('house 3'),
        houseid         = 'house3',
        houseprompt     = 'houseprompt3',
        menucoords      = vector3(1887.1403, 300.56072, 77.066558),
        blipcoords      = vector3(1888.1700439453,297.95916748047,76.076202392578),
        showblip        = false
    },
    {    -- house4
        name            = ('house 4'),
        houseid         = 'house4',
        houseprompt     = 'houseprompt4',
        menucoords      = vector3(1787.467, -81.54805, 56.802436),
        blipcoords      = vector3(1781.1064453125,-89.115615844727,55.815963745117),
        showblip        = false
    },
    -- {    -- house5
    --     name            = ('house 5'),
    --     houseid         = 'house5',
    --     houseprompt     = 'houseprompt5',
    --     menucoords      = vector3(1269.6508, -412.1731, 97.596702),
    --     blipcoords      = vector3(1264.1951904297,-404.07095336914,96.595031738281),
    --     showblip        = false
    -- },
    {    -- house6
        name            = ('house 6'),
        houseid         = 'house6',
        houseprompt     = 'houseprompt6',
        menucoords      = vector3(1619.2441, -364.0213, 75.897171),
        blipcoords      = vector3(1627.2501220703,-366.25610351563,74.909873962402),
        showblip        = false
    },
    {    -- house7
        name            = ('house 7'),
        houseid         = 'house7',
        houseprompt     = 'houseprompt7',
        menucoords      = vector3(-2367.865, -2394.804, 62.278335),
        blipcoords      = vector3(-2368.841796875,-2390.40625,61.520217895508),
        showblip        = false
    },
    {    -- house8
        name            = ('house 8'),
        houseid         = 'house8',
        houseprompt     = 'houseprompt8',
        menucoords      = vector3(1120.2464, 492.69769, 97.284187),
        blipcoords      = vector3(1114.0626220703,493.74633789063,96.290939331055),
        showblip        = false
    },
    {    -- house9
        name            = ('house 9'),
        houseid         = 'house9',
        houseprompt     = 'houseprompt9',
        menucoords      = vector3(-63.72145, -392.5166, 72.218261),
        blipcoords      = vector3(-64.242599487305,-393.56112670898,71.248695373535),
        showblip        = false
    },
    {    -- house10
        name            = ('house 10'),
        houseid         = 'house10',
        houseprompt     = 'houseprompt10',
        menucoords      = vector3(339.88751, -667.7122, 42.811027),
        blipcoords      = vector3(338.25341796875,-669.94842529297,41.821144104004),
        showblip        = false
    },
    {    -- house11
        name            = ('house 11'),
        houseid         = 'house11',
        houseprompt     = 'houseprompt11',
        menucoords      = vector3(1111.6049, -1304.963, 66.403602),
        blipcoords      = vector3(1111.4659423828,-1297.5782470703,65.41828918457),
        showblip        = false
    },
    -- {    -- house12
    --     name            = ('house 12'),
    --     houseid         = 'house12',
    --     houseprompt     = 'houseprompt12',
    --     menucoords      = vector3(1369.3358, -870.8798, 70.127265),
    --     blipcoords      = vector3(1365.4197998047,-872.88018798828,69.162147521973),
    --     showblip        = false
    -- },
    {    -- house13
        name            = ('house 13'),
        houseid         = 'house13',
        houseprompt     = 'houseprompt13',
        menucoords      = vector3(2064.4531, -854.3615, 43.360958),
        blipcoords      = vector3(2068.3598632813,-847.32141113281,42.350879669189),
        showblip        = false
    },
    {    -- house14
        name            = ('house 14'),
        houseid         = 'house14',
        houseprompt     = 'houseprompt14',
        menucoords      = vector3(2254.1096, -795.2846, 44.226325),
        blipcoords      = vector3(2253.8466796875,-797.30505371094,43.133113861084),
        showblip        = false
    },
    {    -- house15
        name            = ('house 15'),
        houseid         = 'house15',
        houseprompt     = 'houseprompt15',
        menucoords      = vector3(2373.1706, -862.4254, 43.020359),
        blipcoords      = vector3(2370.9301757813,-857.48553466797,42.043087005615),
        showblip        = false
    },
    {    -- house16
        name            = ('house 16'),
        houseid         = 'house16',
        houseprompt     = 'houseprompt16',
        menucoords      = vector3(1706.3145, -1004.643, 43.473499),
        blipcoords      = vector3(1709.3989257813,-1003.7617797852,42.480758666992),
        showblip        = false
    },
    {    -- house17
        name            = ('house 17'),
        houseid         = 'house17',
        houseprompt     = 'houseprompt17',
        menucoords      = vector3(2624.0607, 1696.1097, 115.70227),
        blipcoords      = vector3(2628.2214355469,1694.3289794922,114.66619110107),
        showblip        = false
    },
    {    -- house18
        name            = ('house 18'),
        houseid         = 'house18',
        houseprompt     = 'houseprompt18',
        menucoords      = vector3(2990.2619, 2184.7788, 166.74037),
        blipcoords      = vector3(2993.4243164063,2188.4375,165.73570251465),
        showblip        = false
    },
    {    -- house19
        name            = ('house 19'),
        houseid         = 'house19',
        houseprompt     = 'houseprompt19',
        menucoords      = vector3(2477.8996, 1998.1372, 168.2523),
        blipcoords      = vector3(2473.8527832031,1996.4063720703,167.22595214844),
        showblip        = false
    },
    {    -- house20
        name            = ('house 20'),
        houseid         = 'house20',
        houseprompt     = 'houseprompt20',
        menucoords      = vector3(-422.9819, 1738.1881, 216.55885),
        blipcoords      = vector3(-422.6643371582,1733.5697021484,215.59002685547),
        showblip        = false
    },
    {    -- house21
        name            = ('house 21'),
        houseid         = 'house21',
        houseprompt     = 'houseprompt21',
        menucoords      = vector3(897.28363, 261.66098, 116.00907),
        blipcoords      = vector3(900.34381103516,265.21841430664,115.04807281494),
        showblip        = false
    },
    {    -- house22
        name            = ('house 22'),
        houseid         = 'house22',
        houseprompt     = 'houseprompt22',
        menucoords      = vector3(-1353.182, 2436.3557, 308.40505),
        blipcoords      = vector3(-1347.9483642578,2435.2036132813,307.49612426758),
        showblip        = false
    },
    {    -- house23
        name            = ('house 23'),
        houseid         = 'house23',
        houseprompt     = 'houseprompt23',
        menucoords      = vector3(-553.2758, 2701.4128, 320.41564),
        blipcoords      = vector3(-556.41680908203,2698.8635253906,319.38018798828),
        showblip        = false
    },
    {    -- house24
        name            = ('house 24'),
        houseid         = 'house24',
        houseprompt     = 'houseprompt24',
        menucoords      = vector3(-1021.677, 1695.299, 244.31025),
        blipcoords      = vector3(-1019.1105957031,1688.2989501953,243.27978515625),
        showblip        = false
    },
    {    -- house25
        name            = ('house 25'),
        houseid         = 'house25',
        houseprompt     = 'houseprompt25',
        menucoords      = vector3(-1819.195, 657.87084, 131.85984),
        blipcoords      = vector3(-1815.1489257813,654.96380615234,130.88250732422),
        showblip        = false
    },
    -- {    -- house26
    --     name            = ('house 26'),
    --     houseid         = 'house26',
    --     houseprompt     = 'houseprompt26',
    --     menucoords      = vector3(-2173.403, 715.4107, 122.61867),
    --     blipcoords      = vector3(-2182.5109863281,716.46356201172,121.62875366211),
    --     showblip        = false
    -- },
    {    -- house27
        name            = ('house 27'),
        houseid         = 'house27',
        houseprompt     = 'houseprompt27',
        menucoords      = vector3(-2579.494, -1380.417, 149.2548),
        blipcoords      = vector3(-2575.826171875,-1379.3582763672,148.27227783203),
        showblip        = false
    },
    {    -- house28
        name            = ('house 28'),
        houseid         = 'house28',
        houseprompt     = 'houseprompt28',
        menucoords      = vector3(-2375.747, -1591.876, 154.28628),
        blipcoords      = vector3(-2374.3642578125,-1592.6021728516,153.29959106445),
        showblip        = false
    },
    {    -- house29
        name            = ('house 29'),
        houseid         = 'house29',
        houseprompt     = 'houseprompt29',
        menucoords      = vector3(-1410.868, -2671.971, 42.17152),
        blipcoords      = vector3(-1410.5717773438,-2674.2229003906,41.185203552246),
        showblip        = false
    },
    {    -- house30
        name            = ('house 30'),
        houseid         = 'house30',
        houseprompt     = 'houseprompt30',
        menucoords      = vector3(-3960.028, -2124.254, -4.076438),
        blipcoords      = vector3(-3958.3901367188,-2129.3940429688,-5.235463142395),
        showblip        = false
    },
    {    -- house31
        name            = ('house 31'),
        houseid         = 'house31',
        houseprompt     = 'houseprompt31',
        menucoords      = vector3(-4370.378, -2415.955, 20.399623),
        blipcoords      = vector3(-4366.0122070313,-2416.3056640625,19.423376083374),
        showblip        = false
    },
    {    -- house32
        name            = ('house 32'),
        houseid         = 'house32',
        houseprompt     = 'houseprompt32',
        menucoords      = vector3(-5549.529, -2399.353, -8.745719),
        blipcoords      = vector3(-5552.146484375,-2401.5205078125,-9.7140893936157),
        showblip        = false
    },
    {    -- house33
        name            = ('house 33'),
        houseid         = 'house33',
        houseprompt     = 'houseprompt33',
        menucoords      = vector3(-3550.882, -3008.228, 11.887498),
        blipcoords      = vector3(-3552.3842773438,-3012.0998535156,10.820337295532),
        showblip        = false
    },
    {    -- house34
        name            = ('house 34'),
        houseid         = 'house34',
        houseprompt     = 'houseprompt34',
        menucoords      = vector3(-1962.949, 2157.6286, 327.58007),
        blipcoords      = vector3(-1959.1854248047,2160.2043457031,326.55380249023),
        showblip        = false
    },
    {    -- house35
        name            = ('house 35'),
        houseid         = 'house35',
        houseprompt     = 'houseprompt35',
        menucoords      = vector3(-1488.904, 1248.895, 314.49044),
        blipcoords      = vector3(-1494.4030761719,1246.7662353516,313.5432434082),
        showblip        = false
    },
    {    -- house36
        name            = ('house 36'),
        houseid         = 'house36',
        houseprompt     = 'houseprompt36',
        menucoords      = vector3(3028.9965, 1780.9338, 84.127723),
        blipcoords      = vector3(3024.1213378906,1777.0731201172,83.169136047363),
        showblip        = false
    },
    {    -- house37
        name            = ('house 37'),
        houseid         = 'house37',
        houseprompt     = 'houseprompt37',
        menucoords      = vector3(1984.8593, 1196.9948, 171.40205),
        blipcoords      = vector3(1981.9653320313,1195.0833740234,170.41778564453),
        showblip        = false
    },
    {    -- house38
        name            = ('house 38'),
        houseid         = 'house38',
        houseprompt     = 'houseprompt38',
        menucoords      = vector3(2718.0898, 710.00518, 79.543266),
        blipcoords      = vector3(2716.8154296875,708.16693115234,78.605178833008),
        showblip        = false
    },
    {    -- house39
        name            = ('house 39'),
        houseid         = 'house39',
        houseprompt     = 'houseprompt39',
        menucoords      = vector3(2823.6367, 275.38955, 48.096889),
        blipcoords      = vector3(2824.4970703125,270.89910888672,47.120807647705),
        showblip        = false
    },
    {    -- house40
        name            = ('house 40'),
        houseid         = 'house40',
        houseprompt     = 'houseprompt40',
        menucoords      = vector3(1391.1662, -2085.114, 52.56631),
        blipcoords      = vector3(1387.3020019531,-2077.4401855469,51.581089019775),
        showblip        = false
    },
    -- 41 spare
    {    -- house42
        name            = ('house 42'),
        houseid         = 'house42',
        houseprompt     = 'houseprompt42',
        menucoords      = vector3(1700.9014, 1512.7069, 147.86967),
        blipcoords      = vector3(1697.4683837891,1508.2376708984,146.8824005127),
        showblip        = false
    },
    {    -- house43
        name            = ('house 43'),
        houseid         = 'house43',
        houseprompt     = 'houseprompt43',
        menucoords      = vector3(-3402.104, -3304.445, -4.457978),
        blipcoords      = vector3(-3400.0258789063,-3302.1235351563,-5.3948922157288),
        showblip        = false
    },
    {    -- house44
        name            = ('house 44'),
        houseid         = 'house44',
        houseprompt     = 'houseprompt44',
        menucoords      = vector3(-819.3696, 356.07235, 98.078361),
        blipcoords      = vector3(-818.61383056641,351.16165161133,97.108840942383),
        showblip        = false
    },
    {    -- house45
        name            = ('house 45'),
        houseid         = 'house45',
        houseprompt     = 'houseprompt45',
        menucoords      = vector3(2717.03, -1282.79, 60.34),
        blipcoords      = vector3(2711.4370117188,-1293.0838623047,59.458484649658),
        showblip        = false
    },
    {    -- house46
        name            = ('house 46'),
        houseid         = 'house46',
        houseprompt     = 'houseprompt46',
        menucoords      = vector3(-2568.017, 350.39498, 151.45018),
        blipcoords      = vector3(-2571.12, 350.7572, 151.45018),
        showblip        = false
    },
    {    -- house47
        name            = ('house 47'),
        houseid         = 'house47',
        houseprompt     = 'houseprompt47',
        menucoords      = vector3(2309.7172, -331.0284, 41.898754),
        blipcoords      = vector3(2307.529, -332.8371, 41.898715),
        showblip        = false
    },
    {    -- house48
        name            = ('house 48'),
        houseid         = 'house48',
        houseprompt     = 'houseprompt48',
        menucoords      = vector3(-5627.474, -2947.845, 6.7072935),
        blipcoords      = vector3(-5622.978, -2944.408, 6.755721),
        showblip        = false
    },
    {    -- house49
        name            = ('house 49'),
        houseid         = 'house49',
        houseprompt     = 'houseprompt49',
        menucoords      = vector3(-1029.277, -285.3069, 82.06932),
        blipcoords      = vector3(-1029.37, -285.2012, 82.073776),
        showblip        = false
    },
    {    -- house50
        name            = ('house 50'),
        houseid         = 'house50',
        houseprompt     = 'houseprompt50',
        menucoords      = vector3(239.79168, -64.06994, 105.89093),
        blipcoords      = vector3(237.50721, -61.15749, 105.13743),
        showblip        = false
    },
    {    -- house51
        name            = ('house 51'),
        houseid         = 'house51',
        houseprompt     = 'houseprompt51',
        menucoords      = vector3(637.63818, -222.2627, 144.72094),
        blipcoords      = vector3(644.97546, -214.6335, 142.29745),
        showblip        = false
    },
    {    -- house52
        name            = ('house 52'),
        houseid         = 'house52',
        houseprompt     = 'houseprompt52',
        menucoords      = vector3(-1169.946, -1812.159, 62.807331),
        blipcoords      = vector3(-1165.017, -1823.073, 61.949291),
        showblip        = false
    },
    {    -- house53
        name            = ('house 53'),
        houseid         = 'house53',
        houseprompt     = 'houseprompt53',
        menucoords      = vector3(2286.2614, -77.61277, 45.589088),
        blipcoords      = vector3(2284.8142, -85.49312, 45.577217),
        showblip        = false
    },
    {    -- house54
        name            = ('house 54'),
        houseid         = 'house54',
        houseprompt     = 'houseprompt54',
        menucoords      = vector3(2239.0559, -144.6374, 47.631141),
        blipcoords      = vector3(2239.0559, -144.6374, 47.631141),
        showblip        = false
    },
    {    -- house55
        name            = ('house 55'),
        houseid         = 'house55',
        houseprompt     = 'houseprompt55',
        menucoords      = vector3(2239.0559, -144.6374, 47.631141),
        blipcoords      = vector3(2239.0559, -144.6374, 47.631141),
        showblip        = false
    },
    {    -- house56
        name            = ('house 56'),
        houseid         = 'house56',
        houseprompt     = 'houseprompt56',
        menucoords      = vector3(-1643.13, -1364.481, 84.402816),
        blipcoords      = vector3(-1642.641, -1362.496, 84.402816),
        showblip        = false
    },
    {    -- house57
        name            = ('house 57'),
        houseid         = 'house57',
        houseprompt     = 'houseprompt57',
        menucoords      = vector3(1426.3626, -1364.029, 81.831481),
        blipcoords      = vector3(1427.4974, -1364.888, 81.843536),
        showblip        = false
    },
    {    -- house58
        name            = ('house 58'),
        houseid         = 'house58',
        houseprompt     = 'houseprompt58',
        menucoords      = vector3(2448.5383, -561.8087, 42.586185),
        blipcoords      = vector3(2451.3374, -564.3812, 42.586677),
        showblip        = false
    },
    {    -- house59
        name            = ('house 59'),
        houseid         = 'house59',
        houseprompt     = 'houseprompt59',
        menucoords      = vector3(-2458.855, 840.68566, 146.38858),
        blipcoords      = vector3(-2459.966, 838.43872, 146.36059),
        showblip        = false
    },
    {    -- house60
        name            = ('house 60'),
        houseid         = 'house60',
        houseprompt     = 'houseprompt60',
        menucoords      = vector3(778.93719, 846.88494, 118.90489),
        blipcoords      = vector3(779.729, 849.19171, 118.93957),
        showblip        = false
    },
    {    -- house61
        name            = ('house 61'),
        houseid         = 'house61',
        houseprompt     = 'houseprompt61',
        menucoords      = vector3(2384.4101, -1214.971, 47.156871),
        blipcoords      = vector3(2388.3269, -1216.173, 47.1553),
        showblip        = false
    },
    {    -- house62
        name            = ('house 62'),
        houseid         = 'house62',
        houseprompt     = 'houseprompt62',
        menucoords      = vector3(1292.6912, -1148.935, 81.843955),
        blipcoords      = vector3(1292.6912, -1148.935, 81.843955),
        showblip        = false
    },
    {    -- house63
        name            = ('house 63'),
        houseid         = 'house63',
        houseprompt     = 'houseprompt63',
        menucoords      = vector3(1316.8604, -1140.399, 82.366371),
        blipcoords      = vector3(1316.2587, -1144.184, 82.789108),
        showblip        = false
    },
    {    -- house64
        name            = ('house 64'),
        houseid         = 'house64',
        houseprompt     = 'houseprompt64',
        menucoords      = vector3(1297.0063, -1130.593, 81.949127),
        blipcoords      = vector3(1296.8546, -1133.296, 82.304267),
        showblip        = false
    },
    {    -- house65
        name            = ('house 65'),
        houseid         = 'house65',
        houseprompt     = 'houseprompt65',
        menucoords      = vector3(2967.31, 598.12, 45.24),
        blipcoords      = vector3(2966.44, 599.06, 45.02),
        showblip        = false
    },
    {    -- house66
        name            = ('house 66'),
        houseid         = 'house66',
        houseprompt     = 'houseprompt66',
        menucoords      = vector3(2976.67, 576.35, 47.87),
        blipcoords      = vector3(2977.6, 575.63, 47.87),
        showblip        = false
    },
    {    -- house67
        name            = ('house 67'),
        houseid         = 'house67',
        houseprompt     = 'houseprompt67',
        menucoords      = vector3(3014.97, 509.32, 42.19),
        blipcoords      = vector3(3015.97, 508.32, 41.19),
        showblip        = false
    },
    {    -- house68
        name            = ('house 68'),
        houseid         = 'house68',
        houseprompt     = 'houseprompt68',
        menucoords      = vector3(3017.22, 542.42, 42.08),
        blipcoords      = vector3(3011.11, 541.94, 42.05),
        showblip        = false
    },
    {    -- house69
        name            = ('house 69'),
        houseid         = 'house69',
        houseprompt     = 'houseprompt69',
        menucoords      = vector3(2995.63, 487.45, 42.04),
        blipcoords      = vector3(2993.03, 492.78, 41.94),
        showblip        = false
    },
    {    -- house70
        name            = ('house 70'),
        houseid         = 'house70',
        houseprompt     = 'houseprompt70',
        menucoords      = vector3(3004.77, 479.74, 42.04),
        blipcoords      = vector3(3000.14, 479.11, 41.95),
        showblip        = false
    },
    {    -- house71
        name            = ('house 71'),
        houseid         = 'house71',
        houseprompt     = 'houseprompt71',
        menucoords      = vector3(2553.27, 809.1, 79.94),
        blipcoords      = vector3(2556.53, 806.58, 76.31),
        showblip        = false
    },
    {    -- house72
        name            = ('house 72'),
        houseid         = 'house72',
        houseprompt     = 'houseprompt72',
        menucoords      = vector3(2561.75, 765.13, 78.37), 
        blipcoords      = vector3(2534.41, 770.02, 76.12),
        showblip        = false
    },
    {    -- house73
        name            = ('house 73'),
        houseid         = 'house73',
        houseprompt     = 'houseprompt73',
        menucoords      = vector3(2533.21, 770.97, 76.12),
        blipcoords      = vector3(2535.06, 769.24, 76.12),
        showblip        = false
    },
    {    -- house74
        name            = ('house 74'),
        houseid         = 'house74',
        houseprompt     = 'houseprompt74',
        menucoords      = vector3(1246.26, 1154.87, 151.22),
        blipcoords      = vector3(1248.47, 1155.15, 151.23),
        showblip        = false
    },
    {    -- house75
        name            = ('house 75'),
        houseid         = 'house75',
        houseprompt     = 'houseprompt75',
        menucoords      = vector3(748.9, 1822.29, 242.39),
        blipcoords      = vector3(744.41, 1827.9, 238),
        showblip        = false
    },
    {    -- house76 guarma
        name            = ('house 76'),
        houseid         = 'house76',
        houseprompt     = 'houseprompt76',
        menucoords      = vector3(1392.87, -6499.83, 43.01),
        blipcoords      = vector3(1391.87, -6499.83, 43.01),
        showblip        = false
    },

    {    -- house77 saint denis mansion
        name            = ('house 77'),
        houseid         = 'house77',
        houseprompt     = 'houseprompt77',
        menucoords      = vector3(2376.8, -1260.88, 50.58),
        blipcoords      = vector3(2386.88, -1263.89, 46.41),
        showblip        = false
    },

    {    -- house78 heartland manor
        name            = ('house 78'),
        houseid         = 'house78',
        houseprompt     = 'houseprompt78',
        menucoords      = vector3(1803.71, 882.99, 111.16),
        blipcoords      = vector3(1803.67, 883.99, 111.12),
        showblip        = false
    },

    {    -- house79 Lannahechee Manor
        name            = ('house 79'),
        houseid         = 'house79',
        houseprompt     = 'houseprompt79',
        menucoords      = vector3(1762.64, -2004.7, 48.55),
        blipcoords      = vector3(1762.92, -2012.27, 45.17),
        showblip        = false
    },

    {    -- house80 Guarma balcony
        name            = ('house 80'),
        houseid         = 'house80',
        houseprompt     = 'houseprompt80',
        menucoords      = vector3(1347.55, -6838.5, 51.58),
        blipcoords      = vector3(1352.86, -6840.89, 51.54),
        showblip        = false
    },

    {    -- house81 Cumberland Manor
        name            = ('house 81'),
        houseid         = 'house81',
        houseprompt     = 'houseprompt81',
        menucoords      = vector3(505.79, 1095.49, 198.38),
        blipcoords      = vector3(517.8, 1099.46, 194.97),
        showblip        = false
    },

    {    -- house82 Snow Manor
        name            = ('house 82'),
        houseid         = 'house82',
        houseprompt     = 'houseprompt82',
        menucoords      = vector3(-711.43, 2766.47, 341.62),
        blipcoords      = vector3(-710.05, 2779.71, 338.23),
        showblip        = false
    },

    {    -- house83 cat tail manor
        name            = ('house 83'),
        houseid         = 'house83',
        houseprompt     = 'houseprompt83',
        menucoords      = vector3(-1098.55, 819.85, 121.96),
        blipcoords      = vector3(-1092.11, 823.67, 118.58),
        showblip        = false
    },

    {    -- house84 OwnJila Manor
        name            = ('house 84'),
        houseid         = 'house84',
        houseprompt     = 'houseprompt84',
        menucoords      = vector3(-2458.2, -522.26, 146.54),
        blipcoords      = vector3(-2457.37, -515.65, 146.53),
        showblip        = false
    },

    {    -- house85 Tall Trees Manor
        name            = ('house 85'),
        houseid         = 'house85',
        houseprompt     = 'houseprompt85',
        menucoords      = vector3(-1992.95, -1328.49, 121.08),
        blipcoords      = vector3(-1992.25, -1327.49, 121.18),
        showblip        = false
    },

    {    -- house86 Thieves Landing Manor
        name            = ('house 86'),
        houseid         = 'house86',
        houseprompt     = 'houseprompt86',
        menucoords      = vector3(-1354.04, -2583.82, 77.94),
        blipcoords      = vector3(-1344.04, -2583.12, 77.14),
        showblip        = false
    },

    {    -- house87 Whispering pines
        name            = ('house 87'),
        houseid         = 'house87',
        houseprompt     = 'houseprompt87',
        menucoords      = vector3(2489.71, -1097.35, 50.3),
        blipcoords      = vector3(2494.69, -1112.4, 50.32),
        showblip        = false
    },

    {    -- house88 Saint denis Mansion
        name            = ('house 88'),
        houseid         = 'house88',
        houseprompt     = 'houseprompt88',
        menucoords      = vector3(2422.28, -1278.79, 47.18),
        blipcoords      = vector3(2430.39, -1263.12, 47.17),
        showblip        = false
    },

    {    -- house89 Saint denis Mansion
        name            = ('house 89'),
        houseid         = 'house89',
        houseprompt     = 'houseprompt89',
        menucoords      = vector3(2448.23, -1266.44, 49.04),
        blipcoords      = vector3(2449.16, -1261.58, 46.34),
        showblip        = false
    },
    {    -- house89 elysian manor
        name            = ('house 90'),
        houseid         = 'house90',
        houseprompt     = 'houseprompt90',
        menucoords      = vector3(2389.22, 1029.19, 94.92),
        blipcoords      = vector3(2392.18, 1022.98, 91.5),
        showblip        = false
    },
}

-- door config
Config.HouseDoors = {

    ---------------------------------------------------------------------------
    {
        houseid         = 'house1',
        name            = ('house 1'),
        doorid          = 3598523785,
        doorcoords = vector3(215.80004882813, 988.06512451172, 189.9015045166)
    },
    {
        houseid         = 'house1',
        name            = ('house 1'),
        doorid          = 2031215067,
        doorcoords = vector3(222.8265838623, 990.53399658203, 189.9015045166)
    },
    ---------------------------------------------------------------------------
    {
        houseid         = 'house2',
        name            = ('house 2'),
        doorid          = 1189146288,
        doorcoords = vector3(-615.93969726563, -27.086599349976, 84.997604370117)
    },
    {
        houseid         = 'house2',
        name            = ('house 2'),
        doorid          = 906448125,
        doorcoords = vector3(-608.73846435547, -26.612947463989, 84.997634887695)
    },
    ---------------------------------------------------------------------------
    {
        houseid         = 'house3',
        name            = ('house 3'),
        doorid          = 2821676992,
        doorcoords = vector3(1888.1700439453,297.95916748047,76.076202392578)
    },
    {
        houseid         = 'house3',
        name            = ('house 3'),
        doorid          = 1510914117,
        doorcoords = vector3(1891.0832519531,302.62200927734,76.091575622559)
    },
    ---------------------------------------------------------------------------
    {
        houseid         = 'house4',
        name            = ('house 4'),
        doorid          = 3549587335,
        doorcoords = vector3(1781.1064453125,-89.115615844727,55.815963745117)
    },
    {
        houseid         = 'house4',
        name            = ('house 4'),
        doorid          = 3000692149,
        doorcoords = vector3(1781.3618164063,-82.687698364258,55.798538208008)
    },
    {
        houseid         = 'house4',
        name            = ('house 4'),
        doorid          = 1928053488,
        doorcoords = vector3(1792.0642089844,-83.22380065918,55.798538208008)
    },
    ---------------------------------------------------------------------------
    -- {
    --     houseid         = 'house5',
    --     name            = ('house 5'),
    --     doorid          = 772977516,
    --     doorcoords = vector3(1264.1951904297,-404.07095336914,96.595031738281)
    -- },
    -- {
    --     houseid         = 'house5',
    --     name            = ('house 5'),
    --     doorid          = 527767089,
    --     doorcoords = vector3(1266.837890625,-412.62899780273,96.595031738281),
    -- },
    ---------------------------------------------------------------------------
    {
        houseid         = 'house6',
        name            = ('house 6'),
        doorid          = 3468185317,
        doorcoords = vector3(1627.2501220703,-366.25610351563,74.909873962402)
    },
    ---------------------------------------------------------------------------
    {
        houseid         = 'house7',
        name            = ('house 7'),
        doorid          = 2779142555,
        doorcoords = vector3(-2368.841796875,-2390.40625,61.520217895508)
    },
    ---------------------------------------------------------------------------
    {
        houseid         = 'house8',
        name            = ('house 8'),
        doorid          = 1239033969,
        doorcoords = vector3(1114.0626220703,493.74633789063,96.290939331055)
    },
    {
        houseid         = 'house8',
        name            = ('house 8'),
        doorid          = 1597362984,
        doorcoords = vector3(1116.3991699219,485.99212646484,96.306297302246)
    },
    ---------------------------------------------------------------------------
    {
        houseid         = 'house9',
        name            = ('house 9'),
        doorid          = 1299456376,
        doorcoords = vector3(-64.242599487305,-393.56112670898,71.248695373535)
    },
    ---------------------------------------------------------------------------
    {
        houseid         = 'house10',
        name            = ('house 10'),
        doorid          = 2933656395,
        doorcoords = vector3(338.25341796875,-669.94842529297,41.821144104004)
    },
    {
        houseid         = 'house10',
        name            = ('house 10'),
        doorid          = 3238637478,
        doorcoords = vector3(347.24737548828,-666.05346679688,41.822761535645)
    },
    ---------------------------------------------------------------------------
    {
        houseid         = 'house11',
        name            = ('house 11'),
        doorid          = 3544613794,
        doorcoords = vector3(1111.4659423828,-1297.5782470703,65.41828918457)
    },
    {
        houseid         = 'house11',
        name            = ('house 11'),
        doorid          = 1485561723,
        doorcoords = vector3(1114.6071777344,-1305.0754394531,65.41828918457)
    },
    ---------------------------------------------------------------------------
    -- {
    --     houseid         = 'house12',
    --     name            = ('house 12'),
    --     doorid          = 1511858696,
    --     doorcoords = vector3(1365.4197998047,-872.88018798828,69.162147521973)
    -- },
    -- {
    --     houseid         = 'house12',
    --     name            = ('house 12'),
    --     doorid          = 1282705079,
    --     doorcoords = vector3(1376.0239257813,-873.24206542969,69.11506652832)
    -- },
    ---------------------------------------------------------------------------
    {
        houseid         = 'house13',
        name            = ('house 13'),
        doorid          = 2238665296,
        doorcoords = vector3(2068.3598632813,-847.32141113281,42.350879669189)
    },
    {
        houseid         = 'house13',
        name            = ('house 13'),
        doorid          = 2080980868,
        doorcoords = vector3(2069.7229003906,-847.31500244141,42.350879669189)
    },
    {
        houseid         = 'house13',
        name            = ('house 13'),
        doorid          = 2700347737,
        doorcoords = vector3(2064.388671875,-847.32141113281,42.350879669189)
    },
    {
        houseid         = 'house13',
        name            = ('house 13'),
        doorid          = 2544301759,
        doorcoords = vector3(2065.7514648438,-847.31500244141,42.350879669189)
    },
    {
        houseid         = 'house13',
        name            = ('house 13'),
        doorid          = 3720952508,
        doorcoords = vector3(2069.7219238281,-855.87939453125,42.350879669189)
    },
    {
        houseid         = 'house13',
        name            = ('house 13'),
        doorid          = 350169319,
        doorcoords = vector3(2068.3588867188,-855.8857421875,42.350879669189)
    },
    ---------------------------------------------------------------------------
    {
        houseid         = 'house14',
        name            = ('house 14'),
        doorid          = 984852093,
        doorcoords = vector3(2253.8466796875,-797.30505371094,43.133113861084)
    },
    {
        houseid         = 'house14',
        name            = ('house 14'),
        doorid          = 3473362722,
        doorcoords = vector3(2257.2678222656,-792.70416259766,43.167179107666)
    },
    {
        houseid         = 'house14',
        name            = ('house 14'),
        doorid          = 686097120,
        doorcoords = vector3(2257.9418945313,-786.59753417969,43.184906005859)
    },
    {
        houseid         = 'house14',
        name            = ('house 14'),
        doorid          = 3107660458,
        doorcoords = vector3(2254.5458984375,-781.7353515625,43.165546417236)
    },
    {
        houseid         = 'house14',
        name            = ('house 14'),
        doorid          = 3419719645,
        doorcoords = vector3(2252.3625488281,-781.66015625,43.165538787842)
    },
    ---------------------------------------------------------------------------
    {
        houseid         = 'house15',
        name            = ('house 15'),
        doorid          = 3945582303,
        doorcoords = vector3(2370.9301757813,-857.48553466797,42.043087005615)
    },
    {
        houseid         = 'house15',
        name            = ('house 15'),
        doorid          = 862008394,
        doorcoords = vector3(2370.8708496094,-864.43804931641,42.040088653564)
    },
    ---------------------------------------------------------------------------
    {
        houseid         = 'house16',
        name            = ('house 16'),
        doorid          = 1661737397,
        doorcoords = vector3(1709.3989257813,-1003.7617797852,42.480758666992)
    },
    ---------------------------------------------------------------------------
    {
        houseid         = 'house17',
        name            = ('house 17'),
        doorid          = 1574473390,
        doorcoords = vector3(2628.2214355469,1694.3289794922,114.66619110107)
    },
    ---------------------------------------------------------------------------
    {
        houseid         = 'house18',
        name            = ('house 18'),
        doorid          = 3731688048,
        doorcoords = vector3(2993.4243164063,2188.4375,165.73570251465)
    },
    {
        houseid         = 'house18',
        name            = ('house 18'),
        doorid          = 344028824,
        doorcoords = vector3(2989.1081542969,2193.7414550781,165.73979187012)
    },
    ---------------------------------------------------------------------------
    {
        houseid         = 'house19',
        name            = ('house 19'),
        doorid          = 2652873387,
        doorcoords = vector3(2473.8527832031,1996.4063720703,167.22595214844)
    },
    {
        houseid         = 'house19',
        name            = ('house 19'),
        doorid          = 2061942857,
        doorcoords = vector3(2472.6179199219,2001.7778320313,167.22595214844)
    },
    ---------------------------------------------------------------------------
    {
        houseid         = 'house20',
        name            = ('house 20'),
        doorid          = 3702071668,
        doorcoords = vector3(-422.6643371582,1733.5697021484,215.59002685547)
    },
    {
        houseid         = 'house20',
        name            = ('house 20'),
        doorid          = 4070066247,
        doorcoords = vector3(-397.8464, 1721.6102, 216.164)
    },
    {
        houseid         = 'house20',
        name            = ('house 20'),
        doorid          = 3444471262,
        doorcoords = vector3(-389.1067, 1730.9625, 216.22805)
    },
    ---------------------------------------------------------------------------
    {
        houseid         = 'house21',
        name            = ('house 21'),
        doorid          = 1934463007,
        doorcoords = vector3(900.34381103516,265.21841430664,115.04807281494)
    },
    ---------------------------------------------------------------------------
    {
        houseid         = 'house22',
        name            = ('house 22'),
        doorid          = 2183007198,
        doorcoords = vector3(-1347.9483642578,2435.2036132813,307.49612426758)
    },
    {
        houseid         = 'house22',
        name            = ('house 22'),
        doorid          = 4288310487,
        doorcoords = vector3(-1348.2998046875,2447.0854492188,307.48056030273)
    },
    ---------------------------------------------------------------------------
    {
        houseid         = 'house23',
        name            = ('house 23'),
        doorid          = 872775928,
        doorcoords = vector3(-556.41680908203,2698.8635253906,319.38018798828)
    },
    {
        houseid         = 'house23',
        name            = ('house 23'),
        doorid          = 2385374047,
        doorcoords = vector3(-557.96398925781,2708.9880371094,319.43182373047)
    },
    ---------------------------------------------------------------------------
    {
        houseid         = 'house24',
        name            = ('house 24'),
        doorid          = 3167436574,
        doorcoords = vector3(-1019.1105957031,1688.2989501953,243.27978515625)
    },
    ---------------------------------------------------------------------------
    {
        houseid         = 'house25',
        name            = ('house 25'),
        doorid          = 1195519038,
        doorcoords = vector3(-1815.1489257813,654.96380615234,130.88250732422)
    },
    ---------------------------------------------------------------------------
    -- {
    --     houseid         = 'house26',
    --     name            = ('house 26'),
    --     doorid          = 2212914984,
    --     doorcoords = vector3(-2182.5109863281,716.46356201172,121.62875366211)
    -- },
    ---------------------------------------------------------------------------
    {
        houseid         = 'house27',
        name            = ('house 27'),
        doorid          = 562830153,
        doorcoords = vector3(-2575.826171875,-1379.3582763672,148.27227783203)
    },
    {
        houseid         = 'house27',
        name            = ('house 27'),
        doorid          = 663425326,
        doorcoords = vector3(-2578.7858886719,-1385.2464599609,148.26223754883)
    },
    ---------------------------------------------------------------------------
    {
        houseid         = 'house28',
        name            = ('house 28'),
        doorid          = 1171581101,
        doorcoords = vector3(-2374.3642578125,-1592.6021728516,153.29959106445)
    },
    ---------------------------------------------------------------------------
    {
        houseid         = 'house29',
        name            = ('house 29'),
        doorid          = 52014802,
        doorcoords = vector3(-1410.5717773438,-2674.2229003906,41.185203552246)
    },
    ---------------------------------------------------------------------------
    {
        houseid         = 'house30',
        name            = ('house 30'),
        doorid          = 4164042403,
        doorcoords = vector3(-3958.3901367188,-2129.3940429688,-5.235463142395)
    },
    ---------------------------------------------------------------------------
    {
        houseid         = 'house31',
        name            = ('house 31'),
        doorid          = 2047072501,
        doorcoords = vector3(-4366.0122070313,-2416.3056640625,19.423376083374)
    },
    ---------------------------------------------------------------------------
    {
        houseid         = 'house32',
        name            = ('house 32'),
        doorid          = 2715667864,
        doorcoords = vector3(-5552.146484375,-2401.5205078125,-9.7140893936157)
    },
    {
        houseid         = 'house32',
        name            = ('house 32'),
        doorid          = 1263476860,
        doorcoords = vector3(-5555.2666015625,-2397.3522949219,-9.7149391174316)
    },
    ---------------------------------------------------------------------------
    {
        houseid         = 'house33',
        name            = ('house 33'),
        doorid          = 1894337720,
        doorcoords = vector3(-3552.3842773438,-3012.0998535156,10.820337295532)
    },
    {
        houseid         = 'house33',
        name            = ('house 33'),
        doorid          = 120764251,
        doorcoords = vector3(-3555.4401855469,-3007.9375,10.820337295532)
    },
    ---------------------------------------------------------------------------
    {
        houseid         = 'house34',
        name            = ('house 34'),
        doorid          = 943176298,
        doorcoords = vector3(-1959.1854248047,2160.2043457031,326.55380249023)
    },
    ---------------------------------------------------------------------------
    {
        houseid         = 'house35',
        name            = ('house 35'),
        doorid          = 2971757040,
        doorcoords = vector3(-1494.4030761719,1246.7662353516,313.5432434082)
    },
    ---------------------------------------------------------------------------
    {
        houseid         = 'house36',
        name            = ('house 36'),
        doorid          = 1973911195,
        doorcoords = vector3(3024.1213378906,1777.0731201172,83.169136047363)
    },
    ---------------------------------------------------------------------------
    {
        houseid         = 'house37',
        name            = ('house 37'),
        doorid          = 784290387,
        doorcoords = vector3(1981.9653320313,1195.0833740234,170.41778564453)
    },
    ---------------------------------------------------------------------------
    {
        houseid         = 'house38',
        name            = ('house 38'),
        doorid          = 843137708,
        doorcoords = vector3(2716.8154296875,708.16693115234,78.605178833008)
    },
    ---------------------------------------------------------------------------
    {
        houseid         = 'house39',
        name            = ('house 39'),
        doorid          = 4275653891,
        doorcoords = vector3(2824.4970703125,270.89910888672,47.120807647705)
    },
    {
        houseid         = 'house39',
        name            = ('house 39'),
        doorid          = 1431398235,
        doorcoords = vector3(2820.5607910156,278.90881347656,50.09118270874)
    },
    ---------------------------------------------------------------------------
    {
        houseid         = 'house40',
        name            = ('house 40'),
        doorid          = 896012811,
        doorcoords = vector3(1387.3020019531,-2077.4401855469,51.581089019775)
    },
    {
        houseid         = 'house40',
        name            = ('house 40'),
        doorid          = 2813949612,
        doorcoords = vector3(1385.0637207031,-2085.1806640625,51.583812713623)
    },
    ---------------------------------------------------------------------------
    -- 41 spare
    ---------------------------------------------------------------------------
    {
        houseid         = 'house42',
        name            = ('house 42'),
        doorid          = 868379185,
        doorcoords = vector3(1697.4683837891,1508.2376708984,146.8824005127)
    },
    {
        houseid         = 'house42',
        name            = ('house 42'),
        doorid          = 640077562,
        doorcoords = vector3(1702.7976074219,1514.3333740234,146.87799072266)
    },
    ---------------------------------------------------------------------------
    {
        houseid         = 'house43',
        name            = ('house 43'),
        doorid          = 3045682143,
        doorcoords = vector3(-3400.0258789063,-3302.1235351563,-5.3948922157288)
    },
    ---------------------------------------------------------------------------
    {
        houseid         = 'house44',
        name            = ('house 44'),
        doorid          = 1915887592,
        doorcoords = vector3(-818.61383056641,351.16165161133,97.108840942383)
    },
    {
        houseid         = 'house44',
        name            = ('house 44'),
        doorid          = 3324299212,
        doorcoords = vector3(-819.14367675781,358.73443603516,97.10627746582)
    },
    ---------------------------------------------------------------------------
    {
        houseid         = 'house45',
        name            = ('house 45'),
        doorid          = 1180868565,
        doorcoords = vector3(2711.4370117188,-1293.0838623047,59.458484649658)
    },
    ---------------------------------------------------------------------------
    --pronghorn autumn and braden
    {
        houseid         = 'house46',
        name            = ('house 46'),
        doorid          = 218846865,
        doorcoords = vector3(-2569.469970703125, 352.8999938964844, 150.5337371826172)
    },
    {
        houseid         = 'house46',
        name            = ('house 46'),
        doorid          = 639207597,
        doorcoords = vector3(-2579.75537109375, 344.6000061035156, 150.54786682128906)
    },
    {
        houseid         = 'house46',
        name            = ('house 46'),
        doorid          = 1012217124,
        doorcoords = vector3(-2569.469970703125, 335.9700012207031, 150.54786682128906)
    },
    ---right house
    {
        houseid         = 'house46',
        name            = ('house 46'),
        doorid          = 1535511805,
        doorcoords = vector3(-2590.841064453125, 457.8380126953125, 146.0139617919922)
    },
    
    {
        houseid         = 'house46',
        name            = ('house 46'),
        doorid          = 2395304827, --working
        doorcoords = vector3(-2596.81591796875, 458.4296875, 146.9975128173828)
    },
    ---left house
    {
        houseid         = 'house46',
        name            = ('house 46'),
        doorid          = 982192611, --working
        doorcoords = vector3(-2586.36669921875, 439.4800109863281, 146.97999572753906)
    },
    {
        houseid         = 'house46',
        name            = ('house 46'),
        doorid          = 2413608077, --working
        doorcoords = vector3(-2597.52294921875, 436.87542724609375, 146.9471435546875)
    },
 
    
    
    
    
    ---------------------------------------------------------------------------
    ---------------------------------------------------------------------------
    {
        houseid         = 'house47',
        name            = ('house 47'),
        doorid          = 3108731901,
        doorcoords = vector3(2307.5063, -333.1673, 41.895164)
    },
    {
        houseid         = 'house47',
        name            = ('house 47'),
        doorid          = 362914435,
        doorcoords = vector3(2311.6889, -327.8833, 41.86837)
    },
    ---------------------------------------------------------------------------
    ---------------------------------------------------------------------------
    {
        houseid         = 'house48',
        name            = ('house 48'),
        doorid          = 2785987570,
        doorcoords = vector3(-5623.18,-2943.08,5.757)
    },
    {
        houseid         = 'house48',
        name            = ('house 48'),
        doorid          = 3064818991,
        doorcoords = vector3(-5624.28,-2944.98,5.74)
    },
    {
        houseid         = 'house48',
        name            = ('house 48'),
        doorid          = 3364065499,
        doorcoords = vector3(-5631.96,-2938.66,5.78)
    },
    ---------------------------------------------------------------------------
    ---------------------------------------------------------------------------
    {
        houseid         = 'house49',
        name            = ('house 49'),
        doorid          = 2467261149,
        doorcoords = vector3(-1032.677, -287.9074, 82.268844)
    },
    -- {
    --     houseid         = 'house49',
    --     name            = ('house 49'),
    --     doorid          = 362914435,
    --     doorcoords = vector3(2311.6889, -327.8833, 41.86837)
    -- },
    ---------------------------------------------------------------------------
    ---------------------------------------------------------------------------
    {
        houseid         = 'house50',
        name            = ('house 50'),
        doorid          = 4253084944,
        doorcoords = vector3(238.37, -61.45, 105.73)
    },
    {
        houseid         = 'house50',
        name            = ('house 50'),
        doorid          = 269849145,
        doorcoords = vector3(235.92, -68.91, 105.88)
    },
    ---------------------------------------------------------------------------
    ---------------------------------------------------------------------------
   
    {
        houseid         = 'house51',
        name            = ('house 51'),
        doorid          = 1851177169,
        doorcoords = vector3(640.17718, -221.1513, 144.76742)
    },
    {
        houseid         = 'house51',
        name            = ('house 51'),
        doorid          = 1553962339,
        doorcoords = vector3(632.92871, -218.4532, 144.71482)
    },
    ---------------------------------------------------------------------------
    
    --------------------------------------------------------------------------
    {
        houseid         = 'house52',
        name            = ('house 52'),
        doorid          = 1572397678,
        doorcoords = vector3(-1167.369, -1816.54, 63.150253)
    },
    {
        houseid         = 'house52',
        name            = ('house 52'),
        doorid          = 2695653460,
        doorcoords = vector3(-1170.382, -1817.402, 63.14159)
    },
    {
        houseid         = 'house52',
        name            = ('house 52'),
        doorid          = 1299923443,
        doorcoords = vector3(-1170.999, -1809.57, 62.830249)
    },
    {
        houseid         = 'house52',
        name            = ('house 52'),
        doorid          = 874909457,
        doorcoords = vector3(-1173.536, -1810.978, 62.803565)
    },
    
    ---------------------------------------------------------------------------
    --bluewater marsh ranch
    --------------------------------------------------------------------------
    {
        houseid         = 'house53',
        name            = ('house 53'),
        doorid          = 4067361695,
        doorcoords = vector3(2284.6005859375, -84.13994598388672, 44.55998611450195)
    },
    {
        houseid         = 'house53',
        name            = ('house 53'),
        doorid          = 4069181361,
        doorcoords = vector3(2284.7255859375, -77.3845443725586, 44.56999588012695)
    },
    ---------------------------------------------------------------------------
    --bleuwater marsh house
    --------------------------------------------------------------------------
    {
        houseid         = 'house54',
        name            = ('house 54'),
        doorid          = 1762076266,
        doorcoords = vector3(2237.07568359375, -141.64028930664062, 46.6264419555664)
    },
    {
        houseid         = 'house54',
        name            = ('house 54'),
        doorid          = 2689340659,
        doorcoords = vector3(2234.14404296875, -147.45721435546875, 47.15731430053711)
    },
    ---------------------------------------------------------------------------
    --cumberland forest
    --------------------------------------------------------------------------
    {
        houseid         = 'house55',
        name            = ('house 54'),
        doorid          = 202296518,
        doorcoords = vector3(-67.3031997680664, 1235.837646484375, 169.76470947265625)
    },
    ---------------------------------------------------------------------------
    --great plains i think mcfarlanes
    --------------------------------------------------------------------------
    {
        houseid         = 'house56',
        name            = ('house 56'),
        doorid          = 1606546482,
        doorcoords = vector3(-1646.2449951171875, -1367.1334228515625, 83.46566009521484)
    },
    {
        houseid         = 'house56',
        name            = ('house 56'),
        doorid          = 2310818050,
        doorcoords = vector3(-1637.0777587890625, -1352.267333984375, 84.17796325683594)
    },
    {
        houseid         = 'house56',
        name            = ('house 56'),
        doorid          = 818583340,
        doorcoords = vector3(-1649.207275390625, -1359.2379150390625, 83.46454620361328)
    },
    -- {
    --     houseid         = 'house56',
    --     name            = ('house 56'),
    --     doorid          = 874909457,
    --     doorcoords = vector3(-1173.536, -1810.978, 62.803565)
    -- },
      ---------------------------------------------------------------------------
    --rhodes masnion
    --------------------------------------------------------------------------
    {
        houseid         = 'house57',
        name            = ('house 57'),
        doorid          = 3588743099,
        doorcoords = vector3(1425.4344482421875, -1367.2890625, 80.84294891357422)
    },
    {
        houseid         = 'house57',
        name            = ('house 57'),
        doorid          = 2710659207,
        doorcoords = vector3(1425.9898, -1368.319, 81.748962)
    },
    {
        houseid         = 'house57',
        name            = ('house 57'),
        doorid          = 1391745490,
        doorcoords = vector3(1431.0502, -1370.639, 81.747856)
    },
    {
        houseid         = 'house57',
        name            = ('house 57'),
        doorid          = 1933935600,
        doorcoords = vector3(1432.2485, -1371.202, 81.74868)
    },
    -- {
    --     houseid         = 'house57',
    --     name            = ('house 57'),
    --     doorid          = 2168829556,
    --     doorcoords = vector3(1434.0036, -1372.019, 81.748764)
    -- },
    -- {
    --     houseid         = 'house57',
    --     name            = ('house 57'),
    --     doorid          = 2290855548,
    --     doorcoords = vector3(1435.3203, -1372.538, 81.748474)
    -- },
    -- {
    --     houseid         = 'house57',
    --     name            = ('house 57'),
    --     doorid          = 1949299785,
    --     doorcoords = vector3(1431.4423828125, -1370.1708984375, 80.8331298828125)
    -- },
    -- {
    --     houseid         = 'house57',
    --     name            = ('house 57'),
    --     doorid          = 2945188489,
    --     doorcoords = vector3(1431.4423828125, -1370.1708984375, 80.8331298828125)
    -- },
    {
        houseid         = 'house57',
        name            = ('house 57'),
        doorid          = 137610238,
        doorcoords = vector3(1431.6572, -1364.773, 81.74382)
    },
    {
        houseid         = 'house57',
        name            = ('house 57'),
        doorid          = 1037179150,
        doorcoords = vector3(1430.3686, -1364.332, 81.743957)
    },
    -- {
    --     houseid         = 'house57',
    --     name            = ('house 57'),
    --     doorid          = 443869312,
    --     doorcoords = vector3(1430.1042, -1363.004, 81.743888)
    -- },
    -- {
    --     houseid         = 'house57',
    --     name            = ('house 57'),
    --     doorid          = 1880161675,
    --     doorcoords = vector3(1430.4494, -1362.359, 81.743888)
    -- },
    -- {
    --     houseid         = 'house57',
    --     name            = ('house 57'),
    --     doorid          = 2627759401,
    --     doorcoords = vector3(1429.458251953125, -1363.3154296875, 80.83924865722656)
    -- },
    -- {
    --     houseid         = 'house57',
    --     name            = ('house 57'),
    --     doorid          = 1516622389,
    --     doorcoords = vector3(1429.9202880859375, -1362.3099365234375, 80.834716796875)
    -- },
    -- {
    --     houseid         = 'house57',
    --     name            = ('house 57'),
    --     doorid          = 1852313785,
    --     doorcoords = vector3(1425.2396240234375, -1364.063720703125, 80.84025573730469)
    -- },
    -- {
    --     houseid         = 'house57',
    --     name            = ('house 57'),
    --     doorid          = 1456261887,
    --     doorcoords = vector3(1424.7774658203125, -1365.067138671875, 80.83920288085938)
    -- },
    {
        houseid         = 'house57',
        name            = ('house 57'),
        doorid          = 1754894799,
        doorcoords = vector3(1431.637939453125, -1365.3740234375, 84.16584777832031)
    },
    {
        houseid         = 'house57',
        name            = ('house 57'),
        doorid          = 2227667279,
        doorcoords = vector3(1430.63671875, -1364.9063720703125, 84.16439819335938)
    },
    -- {
    --     houseid         = 'house57',
    --     name            = ('house 57'),
    --     doorid          = 3071061684,
    --     doorcoords = vector3(1426.422119140625, -1367.85546875, 84.20870971679688)
    -- },
    -- {
    --     houseid         = 'house57',
    --     name            = ('house 57'),
    --     doorid          = 1285460218,
    --     doorcoords = vector3(1427.4244384765625, -1368.3162841796875, 84.20756530761719)
    -- },

    -- {
    --     houseid         = 'house57',
    --     name            = ('house 57'),
    --     doorid          = 1281743208,
    --     doorcoords = vector3(1431.14599609375, -1369.9600830078125, 84.21088409423828)
    -- },
    -- {
    --     houseid         = 'house57',
    --     name            = ('house 57'),
    --     doorid          = 2894614736,
    --     doorcoords = vector3(1432.0303955078125, -1370.5645751953125, 84.2084732055664)
    -- },
    {
        houseid         = 'house57',
        name            = ('house 57'),
        doorid          = 1584758151,
        doorcoords = vector3(1431.14599609375, -1369.9600830078125, 84.21088409423828)
    },
    {
        houseid         = 'house57',
        name            = ('house 57'),
        doorid          = 3193894013,
        doorcoords = vector3(1432.0303955078125, -1370.5645751953125, 84.2084732055664)
    },

    ---------------------------------------------------------------------------
    --shaman house vector3(-2687.081, -354.2728, 148.77404)
    --------------------------------------------------------------------------
    {
        houseid         = 'house58',
        name            = ('house 58'),
        doorid          = 666916433,
        doorcoords = vector3(2455.0539, -562.6623, 42.568973)
    },
    {
        houseid         = 'house58',
        name            = ('house 58'),
        doorid          = 58723793,
        doorcoords = vector3(2448.4299316406,-563.90002441406,41.5957832)
    },

    ---------------------------------------------------------------------------
    --treehouse
    --------------------------------------------------------------------------
    {
        houseid         = 'house59',
        name            = ('house 59'),
        doorid          = 524178042,
        doorcoords = vector3(-2459.966, 838.43896, 146.36062)
    },

     ---------------------------------------------------------------------------
    --new hanover farm 
    --------------------------------------------------------------------------
    {
        houseid         = 'house60',
        name            = ('house 60'),
        doorid          = 4123766266,
        doorcoords = vector3(779.46551, 849.23419, 118.93576)
    },

    {
        houseid         = 'house60',
        name            = ('house 60'),
        doorid          = 417362979,
        doorcoords = vector3(773.56958, 840.81732, 118.70379)
    },
   
    ---------------------------------------------------------------------------
    --st d mansion
    --------------------------------------------------------------------------
    {
        houseid         = 'house61',
        name            = ('house 61'),
        doorid          = 1291327218,
        doorcoords = vector3(2387.9267, -1216.933, 47.155231)
    },

    {
        houseid         = 'house61',
        name            = ('house 61'),
        doorid          = 1587886668,
        doorcoords = vector3(2387.9863, -1215.351, 47.155231)
    },
    {
        houseid         = 'house61',
        name            = ('house 61'),
        doorid          = 3517504371,
        doorcoords = vector3(2367.9472, -1207.939, 47.010848)
    },
    ---back doors
    {
        houseid         = 'house61',
        name            = ('house 61'),
        doorid          = 895866323,
        doorcoords = vector3(2360.9841, -1215.474, 47.193767)
    },
    {
        houseid         = 'house61',
        name            = ('house 61'),
        doorid          = 1130131904,
        doorcoords = vector3(2360.6975, -1217.146, 47.194042)
    },
     ---back gates
     {
        houseid         = 'house61',
        name            = ('house 61'),
        doorid          = 1313209843,
        doorcoords = vector3(2301.0439, -1218.099, 44.008773)
    },
    {
        houseid         = 'house61',
        name            = ('house 61'),
        doorid          = 3419633928,
        doorcoords = vector3(2301.0458, -1215.682, 44.008888)
    },

     ---rhodes caravan
     {
        houseid         = 'house62',
        name            = ('house 62'),
        doorid          = 500531673,
        doorcoords = vector3(1297.284, -1144.532, 82.18473)
    },
    {
        houseid         = 'house63',
        name            = ('house 63'),
        doorid          = 1279123113,
        doorcoords = vector3(1313.1143, -1142.938, 82.723503)
    },
    {
        houseid         = 'house63',
        name            = ('house 63'),
        doorid          = 3901724494,
        doorcoords = vector3(1320.5993, -1142.614, 82.354187)
    },
    {
        houseid         = 'house64',
        name            = ('house 64'),
        doorid          = 374673924,
        doorcoords = vector3(1298.7874, -1136.084, 82.29039)
    },
    {
        houseid         = 'house64',
        name            = ('house 64'),
        doorid          = 740441502,
        doorcoords = vector3(1294.9594, -1129.845, 81.750701)
    },
    ---------------------------------------------------------------------------
    {
        houseid         = 'house65',
        name            = ('house 65'),
        doorid          = 1266860502,
        doorcoords = vector3(2963.58, 594.56, 44.89)
    },
    {
        houseid         = 'house65',
        name            = ('house 65'),
        doorid          = 2017467220,
        doorcoords = vector3(2964.55, 602.65, 44.81)
    },
    {
        houseid         = 'house66',
        name            = ('house 66'),
        doorid          = 1997650502,
        doorcoords = vector3(2975.85, 571.03, 47.87)
    },
    {
        houseid         = 'house67',
        name            = ('house 67'),
        doorid          = 1837535197,
        doorcoords = vector3(3017.490234375,507.8893737793,41.18879699707)
    },
    {
        houseid         = 'house67',
        name            = ('house 67'),
        doorid          = 2038015939,
        doorcoords = vector3(3011.3505859375,509.85061645508,41.1896286)
    },
    {
        houseid         = 'house68',
        name            = ('house 68'),
        doorid          = 1530035389,
        doorcoords = vector3(3012.1206054688,542.44860839844,41.07879638)
    },
    {
        houseid         = 'house68',
        name            = ('house 68'),
        doorid          = 1283907430,
        doorcoords = vector3(3018.3544921875,540.81134033203,41.07958984)
    },
    {
        houseid         = 'house69',
        name            = ('house 69'),
        doorid          = 638113100,
        doorcoords = vector3(2993.8627929688,492.09744262695,41.04279708)
    },
    {
        houseid         = 'house69',
        name            = ('house 69'),
        doorid          = 913733159,
        doorcoords = vector3(2994.4565429688,485.67962646484,41.04362869)
    },
    {
        houseid         = 'house70',
        name            = ('house 70'),
        doorid          = 951440602,
        doorcoords = vector3(3000.265625,479.75698852539,41.0395889)
    },
    {
        houseid         = 'house70',
        name            = ('house 70'),
        doorid          = 312969406,
        doorcoords = vector3(3006.6110839844,480.88552856445,41.038795)
    },
    {
        houseid         = 'house71',
        name            = ('house 71'),
        doorid          = 1284091629,
        doorcoords = vector3(2556.574462890625,807.6187744140625,75.44783)
    },
    {
        houseid         = 'house71',
        name            = ('house 71'),
        doorid          = 1036292451,
        doorcoords = vector3(2556.923583984375,817.1561889648438,75.43783569335)
    },
    {
        houseid         = 'house72',
        name            = ('house 72'),
        doorid          = 1284607844,
        doorcoords = vector3(2557.1748046875,764.614990234375,77.3677520751)
    },
    {
        houseid         = 'house72',
        name            = ('house 72'),
        doorid          = 867360167,
        doorcoords = vector3(2562.794189453125,768.2518310546875,77.367752)
    },
    {
        houseid         = 'house73',
        name            = ('house 73'),
        doorid          = 533254708,
        doorcoords = vector3(2536.50537109375,767.1631469726562,75.14727020)
    },
    {
        houseid         = 'house73',
        name            = ('house 73'),
        doorid          = 57022831,
        doorcoords = vector3(2531.082275390625,769.91943359375,75.1452713012695)
    },
    {
        houseid         = 'house74',
        name            = ('house 74'),
        doorid          = 1088036680,
        doorcoords = vector3(1251.18, 1156.06, 151.22)
    },
    {
        houseid         = 'house75',
        name            = ('house 75'),
        doorid          = 716373713,
        doorcoords = vector3(745.28, 1827.3, 238.48)
    },
    {
        houseid         = 'house76',
        name            = ('house 76'),
        doorid          = 4182726252,
        doorcoords = vector3(1398.94, -6501.27, 43.01)
    },
    {
        houseid         = 'house76',
        name            = ('house 76'),
        doorid          = 3369203094,
        doorcoords = vector3(1382.437255859375, -6507.7646484375, 42.03208923339844)
    },
    {
        houseid         = 'house76',
        name            = ('house 76'),
        doorid          = 3037974042,
        doorcoords = vector3(1383.3651123046875, -6509.75439453125, 42.032089)
    },

    --saint denis mansion 1101234747
    {
        houseid         = 'house77',
        name            = ('Saint Denis Mansion'),
        doorid          = 3754990028,
        doorcoords = vector3(2387.24, -1263.81, 46.41)
    },
    {
        houseid         = 'house77',
        name            = ('Saint Denis Mansion'),
        doorid          = 1101234747,
        doorcoords = vector3(2386.72, -1264.49, 46.41)
    },
    --side
    {
        houseid         = 'house77',
        name            = ('Saint Denis Mansion'),
        doorid          = 3401412750,
        doorcoords = vector3(2362.49, -1251.47, 46.25)
    },
    
    

    --back
    {
        houseid         = 'house77',
        name            = ('Saint Denis Mansion'),
        doorid          = 3238789350,
        doorcoords = vector3(2362.87, -1262.57, 46.4)
    },

     --back
    {
        houseid         = 'house77',
        name            = ('Saint Denis Mansion'),
        doorid          = 3208183104,
        doorcoords = vector3(2362.66, -1263.19, 46.4)
    },

    --back
    {
        houseid         = 'house77',
        name            = ('Saint Denis Mansion'),
        doorid          = 3162493971,
        doorcoords = vector3(2354.52, -1256.19, 46.27)
    },

     --back
    {
        houseid         = 'house77',
        name            = ('Saint Denis Mansion'),
        doorid          = 755947794,
        doorcoords = vector3(2353.78, -1257.71, 46.27)
    },

     --house 78 front
    {
        houseid         = 'house78',
        name            = ('Heartland Manor'),
        doorid          = 2231341261,
        doorcoords = vector3(1803.79, 879.74, 111.13)
    },
    --house78 back
    {
        houseid         = 'house78',
        name            = ('Heartland Manor'),
        doorid          = 580794825,
        doorcoords = vector3(1805.27, 897.13, 111.12)
    },

    --house78 back2
    {
        houseid         = 'house78',
        name            = ('Heartland Manor'),
        doorid          = 201297072,
        doorcoords = vector3(1796.09, 892.58, 111.14)
    },

    --house78 balcony
    {
        houseid         = 'house78',
        name            = ('Heartland Manor'),
        doorid          = 3009174569,
        doorcoords = vector3(1808.65, 888.81, 114.54)
    },

     --house79 front
    {
        houseid         = 'house79',
        name            = ('Lannahechee Manor'),
        doorid          = 4174095493,
        doorcoords = vector3(1757.83, -2014.76, 45.24)
    },
     --house79 back
    {
        houseid         = 'house79',
        name            = ('Lannahechee Manor'),
        doorid          = 2903366477,
        doorcoords = vector3(1772.82, -2004.73, 45.23)
    },

     --house79 side
    {
        houseid         = 'house79',
        name            = ('Lannahechee Manor'),
        doorid          = 534888695,
        doorcoords = vector3(1763.34, -2000.07, 45.24)
    },
     --house79 balcony
    {
        houseid         = 'house79',
        name            = ('Lannahechee Manor'),
        doorid          = 945930511,
        doorcoords = vector3(1767.72, -2012.52, 48.63)
    },

     --house80 balcony guarma
    {
        houseid         = 'house80',
        name            = ('Guarma Balcony'),
        doorid          = 2952999151,
        doorcoords = vector3(1351.85, -6840.06, 51.54)
    },

     --house80 balcony1 guarma
    {
        houseid         = 'house80',
        name            = ('Guarma Balcony'),
        doorid          = 2719192336,
        doorcoords = vector3(1347.36, -6834.73, 51.53)
    },

     --house80 balcony2 guarma
    {
        houseid         = 'house80',
        name            = ('Guarma Balcony'),
        doorid          = 4258745474,
        doorcoords = vector3(1344.69, -6840.77, 51.53)
    },

     --house81 Cumberland Manor
    {
        houseid         = 'house81',
        name            = ('Cumberland Manor'),
        doorid          = 895420518,
        doorcoords = vector3(516.87, 1099.4, 194.96)
    },

     --house81 Cumberland Manor back
    {
        houseid         = 'house81',
        name            = ('Cumberland Manor'),
        doorid          = 1137630344,
        doorcoords = vector3(498.83, 1102.54, 194.97)
    },

     --house81 Cumberland Manor back side
    {
        houseid         = 'house81',
        name            = ('Cumberland Manor'),
        doorid          = 3883934700,
        doorcoords = vector3(502.22, 1092.57, 194.97)
    },

     --house81 Cumberland Manor balcony
    {
        houseid         = 'house81',
        name            = ('Cumberland Manor'),
        doorid          = 3039853598,
        doorcoords = vector3(507.9, 1104.67, 198.37)
    },

     --house82 Snow Manor
    {
        houseid         = 'house82',
        name            = ('Snow Manor'),
        doorid          = 3084776142,
        doorcoords = vector3(-711.36, 2777.45, 338.24)
    },

     --house82 Snow Manor back
    {
        houseid         = 'house82',
        name            = ('Snow Manor'),
        doorid          = 2594790573,
        doorcoords = vector3(-720.44, 2762.83, 338.23)
    },

     --house82 Snow Manor back side
    {
        houseid         = 'house82',
        name            = ('Snow Manor'),
        doorid          = 3725386611,
        doorcoords = vector3(-709.84, 2762.09, 338.23)
    },

     --house82 Snow Manor balcony
    {
        houseid         = 'house82',
        name            = ('Snow Manor'),
        doorid          = 1329044578,
        doorcoords = vector3(-719.51, 2770.99, 341.64)
    },

      --house83 Cat Tail Manor
    {
        houseid         = 'house83',
        name            = ('Cat Tail Manor'),
        doorid          = 2021391368,
        doorcoords = vector3(-1104.65, 827.4, 118.64)
    },

      --house83 Cat Tail Manor side
    {
        houseid         = 'house83',
        name            = ('Cat Tail Manor'),
        doorid          = 2389911546,
        doorcoords = vector3(-1102.79, 816.73, 118.64)
    },

      --house83 Cat Tail Manor front
    {
        houseid         = 'house83',
        name            = ('Cat Tail Manor'),
        doorid          = 1572265342,
        doorcoords = vector3(-1087.78, 822.43, 118.64)
    },

      --house83 Cat Tail Manor balcony
    {
        houseid         = 'house83',
        name            = ('Cat Tail Manor'),
        doorid          = 2797240060,
        doorcoords = vector3(-1095.72, 828.93, 122.05)
    },

       --house84 OwnJila Manor front
    {
        houseid         = 'house84',
        name            = ('OwnJila Manor'),
        doorid          = 2647721200,
        doorcoords = vector3(-2447.34, -519.46, 143.23)
    },

       --house84 OwnJila Manor back
    {
        houseid         = 'house84',
        name            = ('OwnJila Manor'),
        doorid          = 1851258335,
        doorcoords = vector3(-2464.2, -514.51, 143.24)
    },

       --house84 OwnJila Manor side
    {
        houseid         = 'house84',
        name            = ('OwnJila Manor'),
        doorid          = 1598117810,
        doorcoords = vector3(-2462.37, -524.91, 143.23)
    },

       --house84 OwnJila Manor balcony
    {
        houseid         = 'house84',
        name            = ('OwnJila Manor'),
        doorid          = 1782104003,
        doorcoords = vector3(-2455.69, -513.37, 146.63)
    },

       --house85 Tall Trees manor
    {
        houseid         = 'house85',
        name            = ('Tall Trees Manor'),
        doorid          = 746917281,
        doorcoords = vector3(-2001.28, -1321.44, 117.76)
    },

        --house85 Tall Trees manor back
    {
        houseid         = 'house85',
        name            = ('Tall Trees Manor'),
        doorid          = 1353075124,
        doorcoords = vector3(-1995.77, -1338.13, 117.76)
    },

        --house85 Tall Trees manor side
    {
        houseid         = 'house85',
        name            = ('Tall Trees Manor'),
        doorid          = 1708815388,
        doorcoords = vector3(-1988.39, -1330.4, 117.76)
    },

        --house85 Tall Trees manor balcony
    {
        houseid         = 'house85',
        name            = ('Tall Trees Manor'),
        doorid          = 777897090,
        doorcoords = vector3(-2001.74, -1331.97, 121.16)
    },

        --house86 Thieves manor front
    {
        houseid         = 'house86',
        name            = ('Tall Trees Manor'),
        doorid          = 1947211371,
        doorcoords = vector3(-1360.47, -2591.12, 74.62)
    },

        --house86 Thieves manor side
    {
        houseid         = 'house86',
        name            = ('Tall Trees Manor'),
        doorid          = 2571886818,
        doorcoords = vector3(-1350.78, -2587.14, 74.63)
    },

        --house86 Thieves manor back
    {
        houseid         = 'house86',
        name            = ('Tall Trees Manor'),
        doorid          = 2110929399,
        doorcoords = vector3(-1358.69, -2573.69, 74.62)
    },

        --house86 Thieves manor balcony
    {
        houseid         = 'house86',
        name            = ('Tall Trees Manor'),
        doorid          = 554336289,
        doorcoords = vector3(-1363.36, -2582.72, 78.02)
    },

        --house87 Whispering Pines front
    {
        houseid         = 'house87',
        name            = ('Whispering Pines'),
        doorid          = 3885505860,
        doorcoords = vector3(2494.74, -1112.71, 50.33)
    },

        --house87 Whispering Pines front side
    {
        houseid         = 'house87',
        name            = ('Whispering Pines'),
        doorid          = 1929148360,
        doorcoords = vector3(2503.47, -1098.78, 50.31)
    },

        --house87 Whispering Pines back left
    {
        houseid         = 'house87',
        name            = ('Whispering Pines'),
        doorid          = 3402613284,
        doorcoords = vector3(2501.44, -1088.09, 50.21)
    },
        --house87 Whispering Pines back double left
    {
        houseid         = 'house87',
        name            = ('Whispering Pines'),
        doorid          = 3059358009,
        doorcoords = vector3(2494.91, -1088.01, 50.42)
    },

       --house87 Whispering Pines back double right
    {
        houseid         = 'house87',
        name            = ('Whispering Pines'),
        doorid          = 3366436308,
        doorcoords = vector3(2494.61, -1088.17, 50.49)
    },
       --house87 Whispering Pines front side
    {
        houseid         = 'house87',
        name            = ('Whispering Pines'),
        doorid          = 1929148360,
        doorcoords = vector3(2483.05, -1101.77, 50.31)  --fix me
    },

       --house88 SAint denis mansion 1 front
    {
        houseid         = 'house88',
        name            = ('Saint Denis Mansion'),
        doorid          = 3193689275,
        doorcoords = vector3(2430.15, -1263.1, 47.18)
    },

       --house88 SAint denis mansion 1 back
    {
        houseid         = 'house88',
        name            = ('Saint Denis Mansion'),
        doorid          = 3504011705,
        doorcoords = vector3(2418.34, -1287.13, 46.77)
    },

       --house89 SAint denis mansion 1 stable left
    {
        houseid         = 'house89',
        name            = ('Saint Denis Mansion'),
        doorid          = 1196533861,
        doorcoords = vector3(2449.72, -1262.12, 46.37)
    },

       --house89 SAint denis mansion 1 stable right
    {
        houseid         = 'house89',
        name            = ('Saint Denis Mansion'),
        doorid          = 964889800,
        doorcoords = vector3(2448.51, -1261.71, 46.36)
    },

       --house89 SAint denis mansion 1 side
    {
        houseid         = 'house89',
        name            = ('Saint Denis Mansion'),
        doorid          = 1225171675,
        doorcoords = vector3(2457.59, -1274.84, 46.44)
    },

       --house89 SAint denis mansion 1 back
    {
        houseid         = 'house89',
        name            = ('Saint Denis Mansion'),
        doorid          = 522049534,
        doorcoords = vector3(2448.524902, -1283.1829, 44.9396)
    },

       --house90 Elysian Manor front
    {
        houseid         = 'house90',
        name            = ('Elysian Manor'),
        doorid          = 887173843,
        doorcoords = vector3(2378.73, 1025.63, 91.5)
    },

       --house90 Elysian Manor back
    {
        houseid         = 'house90',
        name            = ('Elysian Manor'),
        doorid          = 2536759197,
        doorcoords = vector3(2396.01, 1022.07, 91.51)
    },

      --house90 Elysian Manor side
    {
        houseid         = 'house90',
        name            = ('Elysian Manor'),
        doorid          = 2548293885,
        doorcoords = vector3(2392.87, 1032.11, 91.51)
    },

      --house90 Elysian Manor balcony
    {
        houseid         = 'house90',
        name            = ('Elysian Manor'),
        doorid          = 1384259890,
        doorcoords = vector3(2387.5, 1020.25, 94.91)
    },













    









}