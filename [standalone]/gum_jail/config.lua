Config = {}

Config.Debug = false
Config.Lockpick = "lockpick"
Config.jailJobs = {
	[1] = "lso",
	[2] = "nhso",
	[3] = "usms",
	[4] = "doj",
	[5] = "naso",
}

Config.JailTimeDownWhileDisconnect = true --If player disconnect, time in jail will be down

Config.NotifyImage = "jail"
Config.JailVehicle = "wagonPrison01x"
Config.jailCenter = {--All zones for Sisica where can player go
	[1] = {3355.17578125,-676.0379638671875,45.55828094482422, 60.0},
	[2] = {3323.546630859375,-611.462158203125,45.3578872680664, 30.0},
	[3] = {3269.2890625,-553.3578491210938,45.75790023803711, 60.0}
}

Config.hangPosition = {--Client check this position for hang
	[1] = {-765.2006225585938,-1260.01318359375,46.42012023925781,358.9866027832031},
	[2] = {2688.362060546875,-1113.9144287109375,51.89967346191406,177.0725250244141},
	[3] = {-315.18505859375,733.5380249023438,119.63656616210938,95.34561920166016},
}

Config.HandcuffsUsable = true
Config.HandcuffsNeedItem = true
Config.Handcuffs = "handcuffs"

Config.wearClotheCommand = "wearClothe"
Config.unjailCommand = "unjail"--Command for unjail (protected by job)

Config.CommandForAdmin = "jailplayeradmin" --Command for admin menu

Config.CommandForJail = true --Command for jail player
Config.CommandForPlayers = "jailplayer"

Config.adminRoles = {
	"admin",
	"Admin",
	"Moderator",
}
Config.Suggestions = {
	[1] = "For wear player to prisoner",
	[2] = "ID",
	[3] = "Player ID",
	[4] = "Command for admin jail",
	[5] = "Time",
	[6] = "Time in minutes.",
	[7] = "For unjail player by ID"
}

Config.KeysButton = {
	[1] = 0x6D1319BE,--CUFF
	[2] = 0x760A9C6F,--HOLD
}
Config.UseGumMDT = false
Config.TakeBoat = true
Config.BoatModel = "boatsteam02x"
Config.BoatSpawn = {
	[1] = {
		blipSprite = 1047294027,--0 is disabled
		blipName = "Boat spawn",
		coords = {2930.90380859375,-1203.0013427734375,43.27612686157226},
		spawnPosition = {2938.35400390625,-1205.2913818359375,39.8178825378418,354.5490417480469},
	},
	[2] = {
		blipSprite = 1047294027,--0 is disabled
		blipName = "Boat spawn",
		coords = {3276.3076171875,-712.9437866210938,43.37929534912109},
		spawnPosition = {3263.243896484375, -716.6755981445312, 40.56303787231445,19},
	},
	[3] = {
		blipSprite = 1047294027,--0 is disabled --blackwater
		blipName = "Boat spawn",
		coords = {-717.82, -1276.15, 41.74},
		spawnPosition = {-715.12, -1277.32, 40.57, 0.91},
		
	}
}

Config.TakeCart = true
Config.CartModel = "wagonPrison01x"
Config.CartSpawn = {
	[1] = {
		blipSprite = 1047294027, --std
		blipName = "Cart spawn",
		coords = {2482.07, -1307.03, 48.88},
		spawnPosition = {2486.17, -1307.88, 48.87, 197.4},
	},
	[2] = {
		blipSprite = 1047294027, --bw
		blipName = "Cart spawn",
		coords = {-767.76, -1258.29, 43.5},
		spawnPosition = {-767.93, -1252.4, 43.42, 89.38},
	},
	[3] = {
		blipSprite = 1047294027, --val
		blipName = "Cart spawn",
		coords = {-280.2, 824.49, 119.45},
		spawnPosition = {-279.28, 829.12, 119.36, 284.99},
	},
 }


Config.positionForJail = {3326.367431640625,-706.578369140625,44.34174346923828, 1.0}
Config.jailNpc = {
	[1] = {
		["coords"] = {3324.344970703125,-705.9620361328125,43.41492462158203,130.6850128173828},
		["model"] = "s_m_m_ambientsdpolice_01",
		["name"] = "Jail guard",
	},
	[2] = {
		["coords"] = {3326.99853515625,-708.9507446289062,43.3071060180664,130.9337921142578},
		["model"] = "s_m_m_ambientsdpolice_01",
		["name"] = "Jail guard",
	},
	[3] = {
		["coords"] = {3344.924560546875,-684.1889038085938,43.09342956542969,170.13949584960938},
		["model"] = "s_m_m_ambientsdpolice_01",
		["name"] = "Jail guard",
	},
}

--/* Jail work */
Config.jailWorkCommand = "jailwork" --Command for jail work
Config.cityWorkSpamProtect = 10-- Cant work on last 10 spots
Config.cityWorkPosition = {
	BlackWater = {
		["wearClothe"] = true,--Wear clothe to prisoners
		["spotForSpawn"] = {-756.0338134765625,-1267.1104736328125,43.05162811279297,284.13177490234375},--Where spawn players after his added too work list
		["cityCenter"] = {-808.0633544921875,-1303.146240234375,43.16069793701172, 125.0},--Range if player escape to port back
		["workTime"] = 15,--Second for 1 spot
		[1] = {-755.321533203125,-1260.33544921875,43.6241455078125},--all position for works
		[2] = {-771.7781372070312,-1258.9949951171875,43.67844009399414},
		[3] = {-792.2232055664062,-1259.5185546875,43.67721557617187},
		[4] = {-792.6172485351562,-1276.705810546875,43.66606521606445},
		[5] = {-792.7381591796875,-1297.7691650390625,43.66527557373047},
		[6] = {-792.570068359375,-1312.7344970703125,43.63569259643555},
		[7] = {-792.6483764648438,-1329.9835205078125,43.67689895629883},
		[8] = {-775.4683227539062,-1330.2677001953125,43.66316604614258},
		[9] = {-756.1395874023438,-1330.10302734375,43.68218994140625},
		[10] = {-754.7337646484375,-1305.3272705078125,43.63833618164062},
		[11] = {-755.39892578125,-1279.9610595703125,43.81078720092773},
		[12] = {-735.3326416015625,-1249.283935546875,44.76350021362305},
		[13] = {-724.8889770507812,-1242.988525390625,44.76325988769531},
		[14] = {-738.7879028320312,-1230.1685791015625,44.76429748535156},
		[15] = {-806.9609985351562,-1261.026123046875,43.70237350463867},
		[16] = {-833.4073486328125,-1265.6549072265625,43.61069869995117},
		[17] = {-843.0267333984375,-1284.2520751953125,43.60959243774414},
		[18] = {-842.3195190429688,-1309.122314453125,43.67100524902344},
		[19] = {-834.9019165039062,-1328.4605712890625,43.60121536254883},
		[20] = {-819.7418212890625,-1330.424560546875,43.69501113891601},
		[21] = {-806.5499267578125,-1321.0283203125,43.69176483154297},
		[22] = {-807.203857421875,-1304.439697265625,43.69261169433594},
		[23] = {-806.585205078125,-1282.0390625,43.68657302856445},
		[24] = {-808.1583251953125,-1260.57275390625,43.70339202880859},
		[25] = {-793.0519409179688,-1342.2276611328125,43.79407119750976},
		[26] = {-776.958984375,-1342.6622314453125,43.79582977294922},
		[27] = {-756.728759765625,-1345.3638916015625,43.60496520996094},
		[28] = {-756.1470947265625,-1369.295166015625,43.62323379516601},
		[29] = {-767.5635375976562,-1380.263427734375,43.64327621459961},
		[30] = {-790.9766845703125,-1382.722412109375,43.46782302856445},
		[31] = {-793.4700317382812,-1365.0849609375,43.80779266357422},
		[32] = {-793.2313842773438,-1351.9478759765625,43.78935623168945},
		[33] = {-806.8242797851562,-1343.895751953125,43.70333480834961},
		[34] = {-822.75439453125,-1343.7679443359375,43.69544982910156},
		[35] = {-841.6410522460938,-1343.67431640625,43.4783706665039},
		[36] = {-841.66748046875,-1350.4013671875,44.21895980834961},
		[37] = {-843.129638671875,-1362.2432861328125,43.64782333374023},
		[38] = {-842.7732543945312,-1381.0931396484375,43.65925598144531},
		[39] = {-836.1913452148438,-1392.41796875,43.61261749267578},
		[40] = {-824.857177734375,-1382.5087890625,43.66095733642578},
		[41] = {-812.6654052734375,-1389.7293701171875,43.58862686157226},
		[42] = {-806.3512573242188,-1378.4659423828125,43.50200653076172},
		[43] = {-854.4327392578125,-1399.7908935546875,43.62256622314453},
		[44] = {-854.004150390625,-1382.1707763671875,43.63412094116211},
		[45] = {-854.3226318359375,-1362.3758544921875,43.6602897644043},
		[46] = {-870.3944702148438,-1357.8306884765625,43.66471862792969},
		[47] = {-886.7752685546875,-1360.3511962890625,43.50224304199219},
		[48] = {-881.5494995117188,-1339.873046875,44.01966094970703},
		[49] = {-876.7335815429688,-1323.9417724609375,44.00833892822265},
		[50] = {-858.1547241210938,-1337.4910888671875,44.51569747924805},
		[51] = {-868.7855834960938,-1329.5650634765625,43.98103332519531},
		[52] = {-868.4717407226562,-1336.925537109375,43.97796630859375},
		[53] = {-833.6740112304688,-1232.7374267578125,43.59405517578125},
		[54] = {-804.8125,-1215.286376953125,43.19198608398437},
		[55] = {-777.0989990234375,-1233.44873046875,43.59830856323242},
	},
	Valentine = {
		["wearClothe"] = true,
		["spotForSpawn"] = {-277.32568359375,801.3238525390625,118.40276336669922,193.6487579345703},
		["cityCenter"] = {-296.1278991699219,791.06396484375,118.4647445678711, 80.0},
		["workTime"] = 15,--Second
		[1] = {-277.9736328125,800.2982788085938,119.37858581542967},
		[2] = {-288.9114990234375,801.4765625,119.40957641601564},
		[3] = {-295.7435302734375,799.9321899414062,119.28878784179688},
		[4] = {-302.6455993652344,797.3108520507812,118.9782257080078},
		[5] = {-309.630615234375,796.0829467773438,118.99115753173828},
		[6] = {-320.9917602539063,794.8837890625,117.91629028320312},
		[7] = {-329.6161804199219,794.7915649414062,117.89958190917967},
		[8] = {-329.9867248535156,802.558349609375,117.54778289794922},
		[9] = {-333.5785827636719,795.514404296875,117.1428451538086},
		[10] = {-340.53558349609375,794.800048828125,117.13338470458984},
		[11] = {-342.4176330566406,800.4237670898438,117.1488265991211},
		[12] = {-361.7357177734375,797.7783813476562,116.28707885742188},
		[13] = {-352.3806457519531,773.423583984375,116.11864471435548},
		[14] = {-330.0092468261719,762.977294921875,117.47248077392578},
		[15] = {-330.8955078125,767.7606201171875,117.4118423461914},
		[16] = {-332.5368347167969,776.7634887695312,117.42385864257812},
		[17] = {-325.4587707519531,778.5764770507812,117.45524597167967},
		[18] = {-319.8332214355469,779.6198120117188,117.9528350830078},
		[19] = {-314.32244873046875,772.3824462890625,118.07344818115236},
		[20] = {-313.3351745605469,780.5162963867188,118.777587890625},
		[21] = {-305.60491943359375,782.2411499023438,118.77465057373048},
		[22] = {-301.5946044921875,782.8516235351562,118.77625274658205},
		[23] = {-300.7449645996094,776.8914794921875,118.81336212158205},
		[24] = {-299.7046508789063,770.6102905273438,118.81192016601564},
		[25] = {-297.8511352539063,763.0735473632812,118.78890991210938},
		[26] = {-294.7639465332031,784.1378173828125,119.3140106201172},
		[27] = {-289.521240234375,784.6654052734375,119.3213882446289},
		[28] = {-280.7873229980469,785.860107421875,119.53181457519533},
		[29] = {-276.52777099609375,785.9755249023438,119.53173065185548},
		[30] = {-267.8948059082031,782.6874389648438,118.59700012207033},
		[31] = {-262.80755615234375,764.873779296875,118.17251586914064},
		[32] = {-262.1529235839844,762.0509033203125,118.18579864501952},
		[33] = {-247.58059692382812,770.503173828125,118.1699447631836},
		[34] = {-245.8894805908203,766.0792236328125,118.2052230834961},
		[35] = {-242.97543334960935,754.6709594726562,117.7133331298828},
		[36] = {-241.1571807861328,749.6270141601562,117.73657989501952},
		[37] = {-239.67674255371097,760.6198120117188,117.73676300048828},
		[38] = {-256.1329650878906,746.407470703125,118.1506118774414},
		[39] = {-251.94290161132812,743.141845703125,118.12600708007812},
		[40] = {-253.37928771972656,737.9918823242188,118.1791000366211},
		[41] = {-255.0151824951172,733.8269653320312,118.18045043945312},
	},
		SaintDenis = {
		["wearClothe"] = true,
		["spotForSpawn"] = {2517.94, -1311.4, 48.98, 274.88},
		["cityCenter"] = {2617.95, -1288.24, 52.38, 294.24},
		["workTime"] = 15,--Second
		[1] = {2518.26, -1318.33, 48.77},
		[2] = {2518.62, -1299.52, 49.05},
		[3] = {2518.7, -1292.56, 48.94},
		[4] = {2518.7, -1282.01, 49.07},
		[5] = {2517.63, -1272.48, 49.23},
		[6] = {2528.73, -1271.35, 49.24},
		[7] = {2533.05, -1256.17, 49.27},
		[8] = {2520.83, -1250.01, 50.09},
		[9] = {2512.89, -1239.93, 50.09},
		[10] = {2523.86, -1240.31, 50.11},
		[11] = {2529.84, -1242.86, 50.1},
		[12] = {2538.03, -1234.79, 53.35},
		[13] = {2543.76, -1219.88, 53.36},
		[14] = {2548.44, -1209.05, 53.36},
		[15] = {2547.87, -1198.86, 53.36},
		[16] = {2542.76, -1185.04, 53.35},
		[17] = {2591.09, -1179.79, 53.36},
		[18] = {2595.45, -1182.39, 53.23},
		[19] = {2596.66, -1194.78, 53.24},
		[20] = {2594.11, -1205.09, 53.33},
		[21] = {2618.12, -1207.72, 53.46},
		[22] = {2627.94, -1216.9, 53.29},
		[23] = {2622.58, -1217.94, 53.35},
		[24] = {2639.65, -1217.09, 53.37},
		[25] = {2662.53, -1218.67, 53.36},
		[26] = {2670.53, -1208.34, 53.37},
		[27] = {2684.78, -1209, 53.1},
		[28] = {2701.99, -1217.7, 51.79},
		[29] = {2704.27, -1236.65, 50.22},
		[30] = {2715, -1239.58, 50.01},
		[31] = {2725.01, -1238.14, 49.99},
		[32] = {2735.03, -1236.03, 49.95},
		[33] = {2734.36, -1248.27, 49.94},
		[34] = {2735.84, -1262.03, 49.79},
		[35] = {2739.61, -1261.86, 50.65},
		[36] = {2720.59, -1248.53, 49.98},
		[37] = {2717.52, -1251.04, 49.92},
		[38] = {2721.01, -1261.47, 49.84},
		[39] = {2716.35, -1271.67, 49.8},
		[40] = {2721.2, -1279.37, 49.61},
		[41] = {2728.43, -1276.98, 49.72},
		[42] = {2728.62, -1294.36, 48.8},
		[43] = {2737.51, -1293.86, 48.57},
	},

}

--/* Jail work */
Config.jobWork = {
	[1] = {
		name = "Wall fixing",--Name
		coords = {3327.907470703125, -690.1498413085938, 44.19221496582031, 2.0},--Coords where
		timedown = 10,--second
		animation = {"mini_games@story@beechers@build_wall_pannels", "hammer3_loop_good"},--Animations
		workTime = 10,--Work time in seconds
		propBone = {"p_hammer01x", "XH_R_Hand01"},--prop, bone
		coordProps = {-0.03, -0.12, -0.04, 260.89, -109.9, -25.1},--x, y, z, xR, yR, zR
	},
	[2] = {
		name = "Wall fixing",
		coords = {3327.907470703125, -690.1498413085938, 44.19221496582031, 2.0},
		timedown = 10,--second
		animation = {"mini_games@story@beechers@build_wall_pannels", "hammer3_loop_good"},
		workTime = 10,
		propBone = {"p_hammer01x", "XH_R_Hand01"},
		coordProps = {-0.03, -0.12, -0.04, 260.89, -109.9, -25.1},
	},
	[3] = {
		name = "Tearing roots",
		coords = {3347.98876953125, -674.4352416992188, 46.31880569458008, 2.0},
		timedown = 10,
		animation = {"mech_pickup@object", "herb_pick"},
		workTime = 10,
		propBone = {"", ""},
		coordProps = {},
	},
	[4] = {
		name = "Sweep ground",
		coords = {3353.5478515625, -653.9155883789062, 45.40378952026367, 2.0},
		timedown = 10,
		animation = {"amb_work@world_human_broom@working@female_a@base", "base"},
		workTime = 10,
		propBone = {"p_broom04x", "PH_R_Hand"},
		coordProps = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
	},
	[5] = {
		name = "Clean barell",
		coords = {3374.6396484375, -659.2492065429688, 46.46572875976562, 2.0},
		timedown = 10,
		animation = {"amb_work@world_human_clean_table@female_a@trans", "a_trans_b"},
		workTime = 10,
		propBone = {"", ""},
		coordProps = {},
	},
	[6] = {
		name = "Sweep ground",
		coords = {3333.242919921875, -680.7379150390625, 47.69435501098633, 2.0},
		timedown = 10,
		animation = {"amb_work@world_human_broom@working@female_a@base", "base"},
		workTime = 10,
		propBone = {"p_broom04x", "PH_R_Hand"},
		coordProps = {0.0, 0.0, 0.0, 0.0, 0.0, 0.0},
	},
	[7] = {
		name = "Rearrange bags",
		coords = {3354.354736328125, -692.4991455078125, 44.14186477661133, 2.0},
		timedown = 10,
		animation = {"script_mp@moonshiner@story_missions@moon2@ig3_stashsearch_find", "stashsearch_find_male"},
		workTime = 10,
		propBone = {"", ""},
		coordProps = {},
	},
	[8] = {
		name = "Rake ground",
		coords = {3285.92822265625,-579.8067016601562,43.1414680480957, 2.0},
		timedown = 10,
		animation = {"amb_work@world_human_farmer_rake@male_a@idle_a", "idle_a"},
		workTime = 10,
		propBone = {"p_rake02x", "PH_R_Hand"},
		coordProps = {0.0, 0.0, 0.19, 0.0, 0.0, 0.0},
	},
	[9] = {
		name = "Rake ground",
		coords = {3269.54931640625,-569.7819213867188,43.12810516357422, 2.0},
		timedown = 10,
		animation = {"amb_work@world_human_farmer_rake@male_a@idle_a", "idle_a"},
		workTime = 10,
		propBone = {"p_rake02x", "PH_R_Hand"},
		coordProps = {0.0, 0.0, 0.19, 0.0, 0.0, 0.0},
	},
	[10] = {
		name = "Rake ground",
		coords = {3275.99560546875,-558.1201782226562,43.0243911743164, 2.0},
		timedown = 10,
		animation = {"amb_work@world_human_farmer_rake@male_a@idle_a", "idle_a"},
		workTime = 10,
		propBone = {"p_rake02x", "PH_R_Hand"},
		coordProps = {0.0, 0.0, 0.19, 0.0, 0.0, 0.0},
	},
	[11] = {
		name = "Rake ground",
		coords = {3299.52197265625,-570.3076171875,42.92543411254883, 2.0},
		timedown = 10,
		animation = {"amb_work@world_human_farmer_rake@male_a@idle_a", "idle_a"},
		workTime = 10,
		propBone = {"p_rake02x", "PH_R_Hand"},
		coordProps = {0.0, 0.0, 0.19, 0.0, 0.0, 0.0},
	}
}


--/* Escape quest */
Config.EscapeMissionEnabled = false
Config.OnlyOneTime = true--This protect spamming mission every time, and can be chance only 1 for escape
Config.OnlyCrounchEscape = true--With this player must start, and make escape mission in crounch
Config.OnlyAtNightCanEscape = true--With this player can escape only at night
Config.NightSetup = {20, 6}--Night start and end time

Config.EscapeProtectClothe = true
Config.TimeAfterEscape = 1--minutes Player must be in game after release for this time and clothing is weared automaticaly

Config.SearchChange = 30--Chance for search item for prisoners
Config.EscapeChance = 80--Chance for escape if player finish all missions 

Config.BoatModelEscape = "canoeTreeTrunk"--Boat model what is spawned after player have success escape
Config.CanoeCoords = {3367.614501953125,-834.6759643554688,39.30137634277344,209.0036773681641}--Coords for boat

Config.TimeForEscape = 60 --In seconds how long player have time to escape after start escape mission
Config.EscapeMission = {
	[1] = {
		model = "a_m_m_skpprisoner_01",
		style = 1,
		coords = {3352.239990234375,-662.5738525390625,44.6462516784668,278.5808715820313},
		interactions = {
			[0] = {"How can i escape?", "Search here my Soap, and i tell you how.", "Soap", 3395.718994140625,-686.5203247070312,46.39573669433594},
			[1] = {"How are you?", "Good"},
			[2] = {"You ever meet that guy Richard Saints?", "Yeah the coppers son who wrote about spending 90 days crying in his cell?"},
			[3] = {"what do you know about pudding?", "It summons a crazy lady. Best to avoid it."},
			[4] = {"how did you get that scar?", "trying to rob a field medic"},
			[5] = {"Wow a doctor scarred you?", "Field Medics aren't doctors, they are vultures with angel wings, you best do well to remember that!"},

		},
		scenario = "",
		idea = "To escape the prison, head towards the tower. While approaching, crouch and run up the tower. Once you reach the top, move to the left."
	},
	[2] = {
		model = "a_f_m_skpprisononline_01",
		style = 2,
		coords = {3355.30908203125,-682.718017578125,43.23403549194336,87.70730590820312},
		interactions = {
			[0] = {"How can i escape?", "Search around here for my cigarette, and i'll tell you how.", "Cigarette", 3365.887451171875,-689.4115600585938,45.34380340576172},
			[1] = {"How are you?", "Bad"},
			[2] = {"Who locked u up?", "Ya, that one eyed SOB got me..."},
			[3] = {"Heard of anyone escaping? ", "That damn medic almost did."},
			[4] = {"Tired of my questions?", "I'd take this any day over hearing that old Lady Agatha's life story"},
			[5] = {"Have u tried Agatha's oatmeal raisen cookies?", "OH my, they are amazing!"},

		},
		scenario = "",
		idea = "Continue crouch-running along the walls near the second tower."

	},
	[3] = {
		model = "a_m_m_skpprisoner_01",
		style = 3,
		coords = {3364.803955078125,-700.1846313476562,44.12590789794922,52.87057495117187},
		interactions = {
			[0] = {"How can i escape?", "Look around for my Smokes , and ill tell you how.", "Smokes", 3373.397705078125,-680.912841796875,46.45663070678711},
			[1] = {"How are you?", "Not your problem"},
			[2] = {"Have you heard of that female doctor, I heard she does research?", "Yea, on condoms. Thats just downright unholy!"},
			[3] = {"How long ya got left in here?", "I dunno, I can't read."},
			[4] = {"He read how many books?", "A whole two and a half, can you believe it."},
			[5] = {"Whered the other half go?", "Something about the book getting stolen, i dont know not like i payed attention while i was being arrested"},

		},
		scenario = "",
		idea = "Descend from the walls, land on the roof, and head towards the nearby brush."

	},
	[4] = {
		model = "a_f_m_skpprisononline_01",
		style = 1,
		coords = {3370.15478515625,-708.6262817382812,44.12652587890625,228.4534912109375},
		interactions = {
			[0] = {"How can i escape?", "Search ariound here for my Bear, and i'll tell you how.", "Bear", 3381.4853515625,-704.2103881835938,45.14247512817383},
			[1] = {"How are you?", "Good"},
			[2] = {"What are you in here for?", "I used to be an outlaw like you, then i took a bullet to the ass"},
			[3] = {"Did you read about the crazy attack on BlackWater?", "Oh yeah bud , gatling wagons, presidential papers, and outlaws, who hasnt!?"},
			[4] = {"You got any tips for making it out?", "dont, eat the pudding."},
			[5] = {"Who is this mess-hall named after?", "Some rich fat guy who owns something"},

		},
		scenario = "",
		idea = "Crouch-Run along the pathway towards the next brush."
	},
	[5] = {
		model = "a_m_m_skpprisoner_01",
		style = 2,
		coords = {3329.451904296875,-695.8256225585938,43.27538299560547,280.11956787109375},
		interactions = {
			[0] = {"How can i escape?", "Search around for my Bread, and ill tell you how.", "Bread", 3334.007568359375,-630.5943603515625,43.66881561279297},
			[1] = {"How are you?", "bad"},
			[2] = {"Got Any Stories?", "Yeah heres one"},
			[3] = {"ok tell me the story then?", "well its more a riddle than a story"},
			[4] = {"Well im not going to ask again!", "Hold your horses pal!"},
			[5] = {"Forget it I dont want to know anymore", "Ok , maybe youll have better luck with the next guy"},

		},
		scenario = "",
		idea = "Continue crouch-running in the same direction towards the next brush."
	},
	[6] = {
		model = "a_f_m_skpprisononline_01",
		style = 3,
		coords = {3330.875244140625,-633.240966796875,42.64661026000976,89.06194305419922},
		interactions = {
			[0] = {"How can i escape?", "Search around for my Money, and i'll tell you how.", "Money", 3338.1083984375,-655.4976806640625,45.71045303344726},
			[1] = {"How are you?", "Good"},
			[2] = {"What's the food like in this place?", "Ah, the cuisine here is a true delicacy, I reckon the rats have more flavor than the stew."},
			[3] = {"Is there any way to make this cell more comfortable?", "Well, you could try using your imagination, pretend the hay is a feather mattress, and the bars are golden pillars."},
			[4] = {"Got any advice on dealing with the guards?", "Sure, just nod and smile like you understand every word they're sayin'. They appreciate the effort, even if you're clueless."},
			[5] = {"How do you pass the time in here?", "Oh, I've become quite the philosopher. I ponder the meaning of life while counting the cracks in the wall."},

		},
		scenario = "",
		idea = "Crouch-Run along towards the next brush."
	},
	[7] = {
		model = "a_m_m_skpprisoner_01",
		style = 1,
		coords = {3267.81005859375,-580.8668823242188,41.93994903564453,92.22257232666016},
		interactions = {
			[0] = {"How can i escape?", "Search around here for my Drink, and i'll tell you how.", "Drink", 3246.338134765625,-598.5587768554688,43.10533905029297},
			[1] = {"How are you?", "Bad"},
			[2] = {"Any tips on avoiding trouble with the other inmates?", "Keep to yourself, nod politely, and for the love of all that's holy, don't touch anyone's cornbread."},
			[3] = {"What's the best way to escape from this joint?", "Escape? Well, you could try flappin' your arms real hard and wishin' for wings, but I wouldn't hold my breath."},
			[4] = {"How do you handle the lack of privacy in here?", "Privacy? Son, in here, we're practically family. Get used to folks knowin' when you're sleepin' or sneezin'."},
			[5] = {"Any exciting events happening in the yard today?", "Oh, you're in for a treat! The annual dust storm should be rollin' in any minute now. It's like a free exfoliation for your skin."},

		},
		scenario = "WORLD_HUMAN_FARMER_RAKE",
		idea = "Run towards the small forest ahead."
	},
	[8] = {
		model = "a_f_m_skpprisononline_01",
		style = 2,
		coords = {3272.350341796875,-552.3306884765625,42.11882019042969,62.52620697021484},
		interactions = {
			[0] = {"How can i escape?", "Search around here for my Knife, and i'll tell you how.", "Knife", 3332.05810546875,-677.6008911132812,45.60700225830078},
			[1] = {"How are you?", "Good"},
			[2] = {"Is there any way to get a message to the outside world?", "Well, you could try sendin' smoke signals through the barred window, but I doubt anyone out there's fluent in 'Prisoner Morse Code.'"},
			[3] = {"How do you deal with the monotony of prison life?", "Monotony? Son, we've got a front-row seat to the greatest drama ever: the daily struggle for the last spoonful of slop."},
			[4] = {"Got any tips for making friends in here?", "Friends? Sure, just offer to share your daily ration of misery, and you'll find comrades in no time."},
			[5] = {"Any recommendations for the best spot to enjoy the view?", "Ah, the view! Well, if you squint just right, you can almost convince yourself those bars are an intricate wrought-iron design."},

		},
		idea = "Search canoe in brush if you are lucky you search it and police dont see you",
		scenario = "WORLD_HUMAN_FARMER_RAKE",
	},
}

-- [1] number must be same like Config.EscapeMission
Config.EscapePoints = {
	[1] = {3386.450927734375,-637.406494140625,46.48310470581055},
	[2] = {3388.484619140625,-642.1422119140625,51.88094329833984},
	[3] = {3395.87353515625,-693.4915161132812,51.88090133666992},
	[4] = {3396.56689453125,-717.544921875,44.95216751098633},
	[5] = {3404.82861328125,-723.86767578125,44.6013069152832},
	[6] = {3421.30126953125,-740.2578735351562,44.3215217590332},
	[7] = {3413.481689453125,-773.2434692382812,43.73228454589844},
	[8] = {3380.22705078125,-814.448486328125,42.41836929321289}
}

Config.Language = {
	[1] = "Add him to cart",
	[2] = "Take all from cart",
	[3] = "Prepare hang",
	[4] = "Push lever",
	[5] = "Work",
	[6] = "Spawn",
	[7] = "Despawn",
	[8] = "Send to jail",
	[9] = "Release",
	[10] = "Work",
	[11] = "Switch question",
	[12] = "Tell question",
	[13] = "Search",
	[14] = "Start escape",
	[15] = "Cuff",
	[155] = "Hold",
	[1555] = "Wagon",
	[16] = "Lever no one",
	[166] = "Lever :",
	[17] = "You are not near to hang position.",
	[18] = "You can be released.",
	[19] = "Now you can switch your clothes.",
	[20] = "Accept",
	[21] = "How much work | Max is : ",
	[22] = "do Police take all your weapons, clothes",
	[222] = "do Police give you clothes, and you change wear",
	[2222] = "do Police take you to jail",
	[23] = "Work for jail | You need : ",
	[24] = "Pull out boat",
	[25] = "Park boat",
	[26] = "Search somewhere : ",
	[27] = "Search spot for ",
	[28] = "You found the ",
	[29] = "You didn't find the spot, try again.",
	[299] = "Jail no one",
	[2999] = "Jail ID : ",
	[30] = "Time in minutes",
	[31] = "Policer : ",
	[32] = "Policer : You can be released",
	[33] = "Policer : Release soo close",
	[34] = "Not its not your time, you must wait",
	[35] = "Police give you back all your weapons",
	[36] = "Police take your clothes, and you give you your",
	[37] = "Police take you to jail",
	[38] = "In cart is not free sit",
	[39] = "Escape point",
	[40] = "You start a mission",
	[41] = "You hit point : ",
	[42] = "Last point was hittet",
	[43] = "Robbery",
	[44] = "You rob : ",
	[45] = "I dont have nothing for now !",
	[46] = "Jailed",
	[47] = "From : ",
	[48] = "To : ",
	[49] = "Jail work : ",
	[50] = "You get : ",
	[52] = "Jail Notify",
	[53] = "You dont have handcuff in inventory.",
	[54] = "Pull Out Cart",
	[55] = "Park Cart",
}

--If you aim out of city on NPC and go near him he give you money
Config.AimRobbery = false
Config.AimRobberyBannedTown = {'Annesburg','Guarma','SaintDenis','Armadillo','Blackwater','BeechersHope','Breaithwaite','Butcher','Caliga','Cornwall','Emerald','Lagras','Manzanita','Rhodes','Siska','StDenis','Strawberry','Tumbleweed','Valentine','Vanhorn','Wallace','Wapiti','AguasducesFarm','AguasdulcesRuins','AguasdulcesVilla','Manico'}
Config.AimRobberyReward = {2, 5}

-- Shop robbery
Config.shopRobberies = false
Config.shopRobberyTime = 3000--Every 3 second give money and check fire chance
Config.againRobberyTime = 30--Every 30 min can be robbery again
Config.shopRobbery = {
	[1] = {
		model = "u_m_m_sdexoticsshopkeeper_01",
		coord = {-281.1776123046875,778.8616333007812,118.53397369384766,340.6102600097656},
		money = {min={0,20}, max={2,25}},--(Values was 0.20$ -> 2.25$)
		maxMoney = 20,--Max money can rob
		fireChance = 5,--Chance to fire
	},
}