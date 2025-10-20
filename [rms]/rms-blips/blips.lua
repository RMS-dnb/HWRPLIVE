BlipData = {}

BlipData.blips = {
	--SHERIFF
	--{name = "Sheriff (DP)", sprite = 1047294027, x = -3622.86, y = -2605.45, z = 13.34}, --ARMADILLO
	--{name = "Sheriff (DP)", sprite = 1047294027, x = -5527.6, y = -2953.36, z = -0.7}, --TUMBLEWEED
	--{name = "Sheriff (DP)", sprite = 1047294027, x = -759.17, y = -1266.61, z = 44.06}, --BLAKCWATER
	--{name = "Sheriff (DP)", sprite = 1047294027, x = -1808.51, y = -348.13, z = 164.65}, --STRAWBERRY
	--{name = "Sheriff (DP)", sprite = 1047294027, x = -275.95, y = 804.97, z = 119.38}, --VALENTINE
    {name = "Trapper", sprite = -1406874050, x = -336.035, y = 769.14, z = 116.1, color = Config.colors.BRIGHT_PURPLE},
    {name = "Trapper", sprite = -1406874050, x = 2817.9174, y = -1329.932, z = 46.517669, color = Config.colors.BRIGHT_PURPLE},
    {name = "Trapper", sprite = -1406874050, x = 2940.5637, y = 1310.312, z = 44.479141, color = Config.colors.BRIGHT_PURPLE},
    {name = "Trapper", sprite = -1406874050, x = 466.34167, y = 2247.0439, z = 248.3687, color = Config.colors.BRIGHT_PURPLE},
    {name = "Trapper", sprite = -1406874050, x = -755.6054, y = -1287.679, z = 43.64712, color = Config.colors.BRIGHT_PURPLE},
    {name = "Trapper", sprite = -1406874050, x = -3612.56, y = -2617.063, z = -13.7332, color = Config.colors.BRIGHT_PURPLE},
    {name = "Trapper", sprite = -1406874050, x = -5508.935, y = -2944.571, z = -1.90052, color = Config.colors.BRIGHT_PURPLE},
    -- Mining Rock Cracking Locations
    {name = "Rock Grinder", sprite = 2120954438, x = 2516.45, y = 766.22, z = 74.44, color = Config.colors.WHITE},           -- Butchers CreekAdd commentMore actions
    {name = "Rock Grinder", sprite = 2120954438, x = -1511.83, y = -771.51, z = 104.66, color = Config.colors.WHITE},        -- North of BW

    -- Mining Rock Cracking Locations
    {name = "Rock Grinder", sprite = 2120954438, x = 2516.45, y = 766.22, z = 74.44, color = Config.colors.WHITE},           -- Butchers Creek
    {name = "Rock Grinder", sprite = 2120954438, x = -1511.83, y = -771.51, z = 104.66, color = Config.colors.WHITE},
    {name = "Rock Grinder", sprite = 2120954438, x = -5217.03, y = -3476.21, z = -21.51, color = Config.colors.WHITE},        -- North of BW

    -- Farming Plots
    {name = "Farming", sprite = 669307703,x = 1060.07, y = -978.07, z = 70.86, color = Config.colors.WHITE},    -- Southfield Flats
    {name = "Farming", sprite = 669307703,x = 1371.33, y = 496.79, z = 88, color = Config.colors.WHITE},        -- Emerald Ranch
    {name = "Farming", sprite = 669307703,x = -1428.04, y = -1140.91, z = 75.03, color = Config.colors.WHITE},  -- Blackwater     
    {name = "Farming", sprite = 669307703,x = 2455.55, y = 869.01, z = 74.95,  color = Config.colors.WHITE},    -- Elysian Pool 
    {name = "Farming", sprite = 669307703,x = 2069.82, y = -308.16, z = 41.86, color = Config.colors.WHITE},    -- Swamp Shack
    --{name = "Farming", sprite = 669307703,x = -1760.68, y = -2401.01, z = 42.68, color = Config.colors.WHITE},  -- Thieves Landing *********** no blip
    --{name = "Farming", sprite = 669307703,x = 1758.75, y = -2012.98, z = 44.24, color = Config.colors.WHITE},   -- Shady Belle Coast ********** no blip
    --{name = "Farming", sprite = 669307703,x = -1429.78, y = 222.82, z = 100.36, color = Config.colors.WHITE},   -- south Wallace Station ********* no blip
    {name = "Farming", sprite = 669307703,x = 3285.23, y = -563.71, z = 43.06, color = Config.colors.WHITE},    -- Sisika
    {name = "Farming", sprite = 669307703,x = -4396.13, y = -3874.86, z = -24.39, color = Config.colors.WHITE}, -- New Austin - San Luis River
    {name = "Farming", sprite = 669307703,x = -340.73, y = 18.31, z = 43.82, color = Config.colors.WHITE},      -- Limpany
    {name = "Farming", sprite = 669307703,x = 2672.08, y = -778.71, z = 42.47, color = Config.colors.WHITE},    -- Saint Denis
    {name = "Farming", sprite = 669307703,x = 1561.09, y = -7058.43, z = 85.04, color = Config.colors.WHITE},   -- Guarma
    {name = "Farming", sprite = 669307703,x = -3322.43, y = -3133.91, z = -3.54, color = Config.colors.WHITE},  -- Don Julio
    {name = "Farming", sprite = 669307703,x = 1670.59, y = 1341.09, z = 146.48, color = Config.colors.WHITE},   -- O'Creaghs
    {name = "Farming", sprite = 669307703,x = -2581.66, y = -225.32, z = 170.62, color = Config.colors.WHITE},  -- Lake Owanjila
    {name = "Farming", sprite = 669307703,x = -198.71, y = -544.86, z = 42.94, color = Config.colors.WHITE},    -- South Flatneck Station Farm
        
    -- {name = "Estrume de Porco", sprite = 2107754879, x = -290.11, y = 835.31, z = 120.04, color = Config.colors.BRIGHT_PURPLE},
    -- {name = "Estrume de Porco", sprite = 2107754879, x = -296.76, y = 834.33, z = 120.06, color = Config.colors.BRIGHT_PURPLE},

    -- Public Processing Locations 
    {name = "Processing", sprite = 1012165077,x = -3815.66, y = -2980.88, z = -5.91, color = Config.colors.WHITE},  -- New Austin Public Processing. 
    {name = "Processing", sprite = 1012165077,x = 1410.18, y = -1283.53, z = 81.59, color = Config.colors.WHITE},    -- Rhodes Public Processing. 

    -- Public Processing Locations 
    {name = "Wood Processing", sprite = 1480984695,x = 2882.56, y = -1248.35, z = 46.11, color = Config.colors.WHITE},  -- Saint Denis
    {name = "Wood Processing", sprite = 1480984695,x = -867.01, y = -1291.76, z = 43.15, color = Config.colors.WHITE},  -- Blackwater 



    --mining
    -- {name = "AnnesBurg Mine", sprite = 1480984695, x = 2785.28, y = 1339.99, z = 71.32, color = Config.colors.OFF_WHITE},
    -- {name = "Tall Trees Mines", sprite = 1480984695, x = -2426.91, y = -1005.54, z = 167.93, color = Config.colors.OFF_WHITE},
    -- {name = "Jorges Gap Salt Mines", sprite = 1480984695, x = -4166.492, y = -2804.764, z =  -6.91907, color = Config.colors.OFF_WHITE},
    -- {name = "Estrume de Porco", sprite = 2107754879, x = -439.76, y = 657.72, z = 111.79, color = Config.colors.BRIGHT_PURPLE},
    -- {name = "Estrume de Porco", sprite = 2107754879, x = -439.62, y = 651.02, z = 112.13, color = Config.colors.BRIGHT_PURPLE},

    -- {name = "Estrume de Porco", sprite = 2107754879, x = -400.38, y = 916.44, z = 117.32, color = Config.colors.BRIGHT_PURPLE},
    -- {name = "Estrume de Porco", sprite = 2107754879, x = -409.07, y = 921.16, z = 117.21, color = Config.colors.BRIGHT_PURPLE},
    -- {name = "Estrume de Porco", sprite = 2107754879, x = -400.12, y = 927.25, z = 117.54, color = Config.colors.BRIGHT_PURPLE},
    -- {name = "Estrume de Porco", sprite = 2107754879, x = -410.56, y = 932.67, z = 117.15, color = Config.colors.BRIGHT_PURPLE},

	-- -- LOJA DE ARMAS
	-- {name = "Armazem", sprite = -1741111493, x = 2554.3872070313 , y = -1502.5126953125 , z = 45.973064422607, color = Config.colors.YELLOW_GREEN},
    -- {name = "Armazem", sprite = -1741111493, x = 2540.984375 , y = -1502.6560058594 , z = 45.042175292969, color = Config.colors.YELLOW_GREEN},
    -- {name = "Armazem", sprite = -1741111493, x = 2533.6171875 , y = -1502.5972900391 , z = 45.973007202148, color = Config.colors.YELLOW_GREEN},
    -- {name = "Armazem", sprite = -1741111493, x = 2527.1716308594 , y = -1521.0766601563 , z = 45.971336364746, color = Config.colors.YELLOW_GREEN},
    -- {name = "Armazem", sprite = -1741111493, x = 2533.4074707031 , y = -1563.6743164063 , z = 45.969356536865, color = Config.colors.YELLOW_GREEN},
    -- {name = "Armazem", sprite = -1741111493, x = 2553.685546875 , y = -1563.6044921875 , z = 45.969337463379, color = Config.colors.YELLOW_GREEN},
    -- {name = "Armazem", sprite = -1741111493, x = 2560.3181152344 , y = -1513.2344970703 , z = 45.972061157227, color = Config.colors.YELLOW_GREEN},
    -- {name = "Armazem", sprite = -1741111493, x = 2560.3156738281 , y = -1521.2735595703 , z = 45.971366882324, color = Config.colors.YELLOW_GREEN},--
    -- {name = "Armazem", sprite = -1741111493, x = 2560.1828613281 , y = -1533.296875 , z = 45.970226287842, color = Config.colors.YELLOW_GREEN},
    -- {name = "Armazem", sprite = -1741111493, x = 2560.3151855469 , y = -1549.3579101563 , z = 45.969345092773, color = Config.colors.YELLOW_GREEN},
    -- {name = "Armazem", sprite = -1741111493, x = 2560.3146972656 , y = -1557.0972900391 , z = 44.969345092773, color = Config.colors.YELLOW_GREEN},
    -- {name = "Armazem", sprite = -1741111493, x = 2572.1389160156 , y = -1500.7891845703 , z = 45.969554901123, color = Config.colors.YELLOW_GREEN},
    -- {name = "Armazem", sprite = -1741111493, x = -821.35974121094 , y = -1305.4404296875 , z = 43.69189453125, color = Config.colors.YELLOW_GREEN},
    -- {name = "Armazem", sprite = -1741111493, x = -827.76586914063 , y = -1302.8413085938 , z = 44.36071395874, color = Config.colors.YELLOW_GREEN},
    -- {name = "Armazem", sprite = -1741111493, x = -234.93292236328 , y = 748.07257080078 , z = 117.74546813965, color = Config.colors.YELLOW_GREEN},
    -- {name = "Armazem", sprite = -1741111493, x = -229.62919616699 , y = 750.00299072266 , z = 117.7493057251, color = Config.colors.YELLOW_GREEN},
    -- {name = "Armazem", sprite = -1741111493, x = -239.70028686523 , y = 760.03765869141 , z = 117.71298217773, color = Config.colors.YELLOW_GREEN},
    -- {name = "Armazem", sprite = -1741111493, x = 1421.3009033203 , y = -1324.4378662109 , z = 78.383430480957, color = Config.colors.YELLOW_GREEN},
    -- {name = "Armazem", sprite = -1741111493, x = 1429.2729492188 , y = -1322.9432373047 , z = 78.394523620605, color = Config.colors.YELLOW_GREEN},
    -- {name = "Armazem", sprite = -1741111493, x = 1436.6829833984 , y = -1322.6209716797 , z = 78.358253479004, color = Config.colors.YELLOW_GREEN},
    -- {name = "Armazem", sprite = -1741111493, x = -1831.3309326172 , y = -401.35586547852 , z = 162.22650146484, color = Config.colors.YELLOW_GREEN},
    -- {name = "Armazem", sprite = -1741111493, x = -1781.1722412109 , y = -396.77624511719 , z = 156.29689025879, color = Config.colors.YELLOW_GREEN},
    -- {name = "Armazem", sprite = -1741111493, x = -1404.4808349609 , y = -2293.5310058594 , z = 43.528388977051, color = Config.colors.YELLOW_GREEN},
    -- {name = "Armazem", sprite = -1741111493, x = -1429.34765625 , y = -2296.5864257813 , z = 43.295291900635, color = Config.colors.YELLOW_GREEN},
    -- {name = "Armazem", sprite = -1741111493, x = -5484.4936523438 , y = -2961.5559082031 , z = -1.7326645851135, color = Config.colors.YELLOW_GREEN},
    -- {name = "Armazem", sprite = -1741111493, x = 417.12631225586 , y = 2231.73046875 , z = 254.53454589844, color = Config.colors.YELLOW_GREEN},

    -- {name = "Arcos e Flechas", sprite = -132369645, x = -2415.61, y = -1006.52, z = 167.84, color = Config.colors.DARK_PINK},
	-- CORREIOS
--	{name = "Correio", sprite = 1861010125, x = -872.21, y = -1334.13, z = 43.97},
	--{name = "Correio", sprite = 1861010125, x = -178.02, y = 635.27, z = 114.09}, -- valentine
}