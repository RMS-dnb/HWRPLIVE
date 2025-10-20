Config = {}


Config.lawmenMinimun = 3

Config.PoliceChance = 70
Config.npcChance = 0
Config.HouseCooldowns = 1800
Config.DeletePropAfterInteraction = true -- if true, Props will be removed once you interact with them // if false props only get removed once you leave the house

Config.SearchingTime = 3000
Config.BreakInItem = 'lockpick'
Config.LockpickBreaksOnError = false -- on Break In if lockpick minigame is failed lockpick gets broken

Config.Animations = {
	HouseEnter = {
		anim = 'script_ca@carust@02@ig@ig1_rustlerslockpickingconv01',
		clip = 'idle_04_smhthug_01',
	}
}

Config.HousesToRob =  {
	[1] = { 
		name = "house1",
		entercoords = vec4(-833.83, -1413.94, 43.80, 193.04),
		houseInformation = { -- tier 1 house
			exit = vector3(2701.93, -2445.98, 55.59),
			locations = {
				[1] = { prop = 'p_vase01x' ,coords = vec3(2705.83, -2450.10, 54.59), rot = vec3(-4.99999952316284,0,-64.95000457763672), rewards = { "goldring","vase","finechina"},rewardsAmount = {min = 1, max = 3},},
				[2] = { prop = 's_misclockbox_loot_f' ,coords = vec3(2701.118408203125, -2447.653564453125, 55.35358428955078), rot = vec3(-4.99999952316284,0,-64.95000457763672),rewards = { "broach","oldwatch", "hairpin"},rewardsAmount = {min = 1, max = 3},},
				[3] = { prop = 'mp006_p_mshn_painting02x' ,coords = vec3(2705.159912109375, -2447.580078125, 55.64999847412109), rot = vec3(-4.99999952316284,0,-64.95000457763672),rewards = { "bible","weddingring","oldpainting"},rewardsAmount = {min = 1, max = 1},},
			},
			Dog = { chance = 0 , model = 'a_c_doghound_01' ,coords = vec4(2703.19, -2449.31, 55.54, 25.22)},
			SpecialProp = { chance = 40 , prop = 'p_cs_footlocker01x' ,coords = vec4(2703.97, -2446.78, 55.59, 114.42), rewards = {"moneybag","brokenkey"},rewardsAmount = {min = 1, max = 2}, },
			npcModel = 'msp_reverend1_males_01',
			npcSpawnLocation = vec3(2702.72, -2448.28, 55.54),
			npcWeapon = "WEAPON_UNARMED",
			ammoCount = 50,
		}
	},
	[2] = {
		name = "house2",
		entercoords = vec4(2594.74, -1113.96, 52.88, 359.73),
		houseInformation = { -- Tier 2 house
			exit = vector3(2709.12, -2421.69, 56.04),
			locations = {
				[1] = { prop = 'p_lampstanding07x' ,coords = vec3(2712.89990234375, -2418.050048828125, 55),rot = vec3(0,0,-30), rewards = { "fan","newboots","rosary"},rewardsAmount = {min = 1, max = 3},},
				[2] = { prop = 'p_painting02x' ,coords = vec3(2714.780029296875, -2421.239990234375, 56.56999969482422),rot = vec3(-6.00000095367431,0,-117.99999237060547), rewards = { "broach","oldplate","oldpainting"},rewardsAmount = {min = 1, max = 3},},
				[3] = { prop = 'p_jewelrybox02bx' ,coords = vec3(2710.02001953125, -2420.25, 58.79999923706055),rot = vec3(0,0,69.81129455566406), rewards = { "hairpin","spectacles","silverware"},rewardsAmount = {min = 1, max = 1},},
				[4] = { prop = 'p_cs_rug01x' ,coords = vec3(2712.389892578125, -2420.489990234375, 55.00804138183594),rot = vec3(0,0,60), rewards = { "newboots","oldcoin","sharkstick"},rewardsAmount = {min = 1, max = 1},},
			},
			Dog = { chance = 10 , model = 'a_c_doghound_01' ,coords = vec4(2712.61, -2421.98, 56.05, 69.80)},
			SpecialProp = { chance = 40 , prop = 'p_cs_footlocker01x' ,coords = vec4(2703.97, -2446.78, 55.59, 114.42), rewards = {"moneybag","brokenkey"},rewardsAmount = {min = 1, max = 2}, },
			npcModel = 'msp_reverend1_males_01',
			npcSpawnLocation = vec3(2712.75, -2421.22, 59.05),
			npcWeapon = "WEAPON_REVOLVER_CATTLEMAN",
			ammoCount = 50,
		},
	},
	[3] = {
		name = "house3",
		entercoords = vec4(2642.89, -1072.41, 49.33, 89.97),
		houseInformation = { -- Tier 3 house
			exit = vector3(2701.2, -2432.07, 56.1),
			locations = {
				[1] = { prop = 's_jewelrybox02x_a' ,coords = vec3(2707.38, -2441.193115234375, 55.84999847412109), rot = vec3(0,0,-63.00643539428711), rewards = { "goldring","hairpin","spectacles"},rewardsAmount = {min = 1, max = 3},},
				[2] = { prop = 'p_spainting_01' ,coords = vec3(2693.699951171875, -2439.419921875, 56.18999938964844),rot = vec3(0,-0.99999940395355,84.99999237060547), rewards = { "oldpainting","oldwatch","weddingring"},rewardsAmount = {min = 1, max = 3},},
				[3] = { prop = 'p_int_clothing01' ,coords = vec3(2702.968017578125, -2434.618408203125, 55.0205192565918), rot = vec3(0,0,79.14398956298828), rewards = { "spectacles","goldring","newboots"},rewardsAmount = {min = 1, max = 3},},
				[4] = { prop = 'p_vase01x' ,coords = vec3(2708.172119140625, -2432.55517578125, 55.00137710571289),rot = vec3(0,0,-58.27288818359375), rewards = { "goldring","vase","finechina"},rewardsAmount = {min = 1, max = 3},},
				[5] = { prop = 'p_int_playingcardset01' ,coords = vec3(2696.56982421875, -2435.85546875, 56.60827255249023),rot = vec3(0,0,175.41954040527344), rewards = { "silverware","oldcoin","mantleclock"},rewardsAmount = {min = 1, max = 3},},
			},
			Dog = { chance = 100 , model = 'a_c_doghound_01' ,coords = vec4(2697.11, -2432.50, 56.13, 251.79)},
			SpecialProp = { chance = 40 , prop = 'p_cs_footlocker01x' ,coords = vec4(2703.97, -2446.78, 55.59, 114.42), rewards = {"moneybag","brokenkey"},rewardsAmount = {min = 1, max = 2}, },
			npcModel = 'msp_reverend1_males_01',
			npcSpawnLocation = vec3(2704.47, -2441.31, 56.10),
			npcWeapon = "weapon_shotgun_doublebarrel",
			ammoCount = 50,
		},
	},
	[4] = {
		name = "house4",
		entercoords = vector4(2689.4, -1218.72, 52.77, 180.57),
		houseInformation = { -- Tier 3 house
			exit = vector3(2701.2, -2432.07, 56.1),
			locations = {
				[1] = { prop = 's_jewelrybox02x_a' ,coords = vec3(2707.38, -2441.193115234375, 55.84999847412109), rot = vec3(0,0,-63.00643539428711), rewards = { "goldring","hairpin","spectacles"},rewardsAmount = {min = 1, max = 3},},
				[2] = { prop = 'p_spainting_01' ,coords = vec3(2693.699951171875, -2439.419921875, 56.18999938964844),rot = vec3(0,-0.99999940395355,84.99999237060547), rewards = { "oldpainting","oldwatch","weddingring"},rewardsAmount = {min = 1, max = 3},},
				[3] = { prop = 'p_int_clothing01' ,coords = vec3(2702.968017578125, -2434.618408203125, 55.0205192565918), rot = vec3(0,0,79.14398956298828), rewards = { "spectacles","goldring","newboots"},rewardsAmount = {min = 1, max = 3},},
				[4] = { prop = 'p_vase01x' ,coords = vec3(2708.172119140625, -2432.55517578125, 55.00137710571289),rot = vec3(0,0,-58.27288818359375), rewards = { "goldring","vase","finechina"},rewardsAmount = {min = 1, max = 3},},
				[5] = { prop = 'p_int_playingcardset01' ,coords = vec3(2696.56982421875, -2435.85546875, 56.60827255249023),rot = vec3(0,0,175.41954040527344), rewards = { "silverware","oldcoin","mantleclock"},rewardsAmount = {min = 1, max = 3},},
			},
			Dog = { chance = 100 , model = 'a_c_doghound_01' ,coords = vec4(2697.11, -2432.50, 56.13, 251.79)},
			SpecialProp = { chance = 40 , prop = 'p_cs_footlocker01x' ,coords = vec4(2703.97, -2446.78, 55.59, 114.42), rewards = {"moneybag","brokenkey"},rewardsAmount = {min = 1, max = 2}, },
			npcModel = 'msp_reverend1_males_01',
			npcSpawnLocation = vec3(2704.47, -2441.31, 56.10),
			npcWeapon = "weapon_shotgun_doublebarrel",
			ammoCount = 50,
		},
	},
	[5] = {
		name = "house5",
		entercoords = vector4(2741.99, -1178.89, 49.45, 326.7),
		houseInformation = { -- Tier 3 house
			exit = vector3(2701.2, -2432.07, 56.1),
			locations = {
				[1] = { prop = 's_jewelrybox02x_a' ,coords = vec3(2707.38, -2441.193115234375, 55.84999847412109), rot = vec3(0,0,-63.00643539428711), rewards = { "goldring","hairpin","spectacles"},rewardsAmount = {min = 1, max = 3},},
				[2] = { prop = 'p_spainting_01' ,coords = vec3(2693.699951171875, -2439.419921875, 56.18999938964844),rot = vec3(0,-0.99999940395355,84.99999237060547), rewards = { "oldpainting","oldwatch","weddingring"},rewardsAmount = {min = 1, max = 3},},
				[3] = { prop = 'p_int_clothing01' ,coords = vec3(2702.968017578125, -2434.618408203125, 55.0205192565918), rot = vec3(0,0,79.14398956298828), rewards = { "spectacles","goldring","newboots"},rewardsAmount = {min = 1, max = 3},},
				[4] = { prop = 'p_vase01x' ,coords = vec3(2708.172119140625, -2432.55517578125, 55.00137710571289),rot = vec3(0,0,-58.27288818359375), rewards = { "goldring","vase","finechina"},rewardsAmount = {min = 1, max = 3},},
				[5] = { prop = 'p_int_playingcardset01' ,coords = vec3(2696.56982421875, -2435.85546875, 56.60827255249023),rot = vec3(0,0,175.41954040527344), rewards = { "silverware","oldcoin","mantleclock"},rewardsAmount = {min = 1, max = 3},},
			},
			Dog = { chance = 100 , model = 'a_c_doghound_01' ,coords = vec4(2697.11, -2432.50, 56.13, 251.79)},
			SpecialProp = { chance = 40 , prop = 'p_cs_footlocker01x' ,coords = vec4(2703.97, -2446.78, 55.59, 114.42), rewards = {"moneybag","brokenkey"},rewardsAmount = {min = 1, max = 2}, },
			npcModel = 'msp_reverend1_males_01',
			npcSpawnLocation = vec3(2704.47, -2441.31, 56.10),
			npcWeapon = "weapon_shotgun_doublebarrel",
			ammoCount = 50,
		},
	},
	[6] = {
		name = "house6",
		entercoords = vector4(2740.33, -1208.52, 49.75, 240),
		houseInformation = { -- Tier 3 house
			exit = vector3(2701.2, -2432.07, 56.1),
			locations = {
				[1] = { prop = 's_jewelrybox02x_a' ,coords = vec3(2707.38, -2441.193115234375, 55.84999847412109), rot = vec3(0,0,-63.00643539428711), rewards = { "goldring","hairpin","spectacles"},rewardsAmount = {min = 1, max = 3},},
				[2] = { prop = 'p_spainting_01' ,coords = vec3(2693.699951171875, -2439.419921875, 56.18999938964844),rot = vec3(0,-0.99999940395355,84.99999237060547), rewards = { "oldpainting","oldwatch","weddingring"},rewardsAmount = {min = 1, max = 3},},
				[3] = { prop = 'p_int_clothing01' ,coords = vec3(2702.968017578125, -2434.618408203125, 55.0205192565918), rot = vec3(0,0,79.14398956298828), rewards = { "spectacles","goldring","newboots"},rewardsAmount = {min = 1, max = 3},},
				[4] = { prop = 'p_vase01x' ,coords = vec3(2708.172119140625, -2432.55517578125, 55.00137710571289),rot = vec3(0,0,-58.27288818359375), rewards = { "goldring","vase","finechina"},rewardsAmount = {min = 1, max = 3},},
				[5] = { prop = 'p_int_playingcardset01' ,coords = vec3(2696.56982421875, -2435.85546875, 56.60827255249023),rot = vec3(0,0,175.41954040527344), rewards = { "silverware","oldcoin","mantleclock"},rewardsAmount = {min = 1, max = 3},},
			},
			Dog = { chance = 100 , model = 'a_c_doghound_01' ,coords = vec4(2697.11, -2432.50, 56.13, 251.79)},
			SpecialProp = { chance = 40 , prop = 'p_cs_footlocker01x' ,coords = vec4(2703.97, -2446.78, 55.59, 114.42), rewards = {"moneybag","brokenkey"},rewardsAmount = {min = 1, max = 2}, },
			npcModel = 'msp_reverend1_males_01',
			npcSpawnLocation = vec3(2704.47, -2441.31, 56.10),
			npcWeapon = "weapon_shotgun_doublebarrel",
			ammoCount = 50,
		},
	},
	[7] = {
		name = "house7",
		entercoords = vector4(2852.49, -1145.43, 46.84, 276.64),
		houseInformation = { -- Tier 2 house
			exit = vector3(2709.08, -2421.67, 56.04),
			locations = {
				[1] = { prop = 'p_lampstanding07x' ,coords = vec3(2712.89990234375, -2418.050048828125, 55),rot = vec3(0,0,-30), rewards = { "fan","newboots","rosary"},rewardsAmount = {min = 1, max = 3},},
				[2] = { prop = 'p_painting02x' ,coords = vec3(2714.780029296875, -2421.239990234375, 56.56999969482422),rot = vec3(-6.00000095367431,0,-117.99999237060547), rewards = { "broach","oldplate","oldpainting"},rewardsAmount = {min = 1, max = 3},},
				[3] = { prop = 'p_jewelrybox02bx' ,coords = vec3(2710.02001953125, -2420.25, 58.79999923706055),rot = vec3(0,0,69.81129455566406), rewards = { "hairpin","spectacles","silverware"},rewardsAmount = {min = 1, max = 1},},
				[4] = { prop = 'p_cs_rug01x' ,coords = vec3(2712.389892578125, -2420.489990234375, 55.00804138183594),rot = vec3(0,0,60), rewards = { "newboots","oldcoin","sharkstick"},rewardsAmount = {min = 1, max = 1},},
			},
			Dog = { chance = 10 , model = 'a_c_doghound_01' ,coords = vec4(2712.61, -2421.98, 56.05, 69.80)},
			SpecialProp = { chance = 40 , prop = 'p_cs_footlocker01x' ,coords = vec4(2703.97, -2446.78, 55.59, 114.42), rewards = {"moneybag","brokenkey"},rewardsAmount = {min = 1, max = 2}, },
			npcModel = 'msp_reverend1_males_01',
			npcSpawnLocation = vec3(2712.75, -2421.22, 59.05),
			npcWeapon = "WEAPON_REVOLVER_CATTLEMAN",
			ammoCount = 50,
		},
	},
	[8] = { 
		name = "house8",
		entercoords = vector4(2857.14, -1111.64, 46.41, 109.42),
		houseInformation = { -- tier 1 house
			exit = vector3(2701.92, -2445.94, 55.59),
			locations = {
				[1] = { prop = 'p_vase01x' ,coords = vec3(2705.83, -2450.10, 54.59), rot = vec3(-4.99999952316284,0,-64.95000457763672), rewards = { "goldring","vase","finechina"},rewardsAmount = {min = 1, max = 3},},
				[2] = { prop = 's_misclockbox_loot_f' ,coords = vec3(2701.118408203125, -2447.653564453125, 55.35358428955078), rot = vec3(-4.99999952316284,0,-64.95000457763672),rewards = { "broach","oldwatch", "hairpin"},rewardsAmount = {min = 1, max = 3},},
				[3] = { prop = 'mp006_p_mshn_painting02x' ,coords = vec3(2705.159912109375, -2447.580078125, 55.64999847412109), rot = vec3(-4.99999952316284,0,-64.95000457763672),rewards = { "bible","weddingring","oldpainting"},rewardsAmount = {min = 1, max = 1},},
			},
			Dog = { chance = 0 , model = 'a_c_doghound_01' ,coords = vec4(2703.19, -2449.31, 55.54, 25.22)},
			SpecialProp = { chance = 40 , prop = 'p_cs_footlocker01x' ,coords = vec4(2703.97, -2446.78, 55.59, 114.42), rewards = {"moneybag","brokenkey"},rewardsAmount = {min = 1, max = 2}, },
			npcModel = 'msp_reverend1_males_01',
			npcSpawnLocation = vec3(2702.72, -2448.28, 55.54),
			npcWeapon = "WEAPON_UNARMED",
			ammoCount = 50,
		}
	},
	[9] = {
		name = "house9",
		entercoords = vector4(2839.59, -1107.65, 46.9, 109.79),
		houseInformation = { -- Tier 2 house
			exit = vector3(2709.2, -2421.74, 56.04),
			locations = {
				[1] = { prop = 'p_lampstanding07x' ,coords = vec3(2712.89990234375, -2418.050048828125, 55),rot = vec3(0,0,-30), rewards = { "fan","newboots","rosary"},rewardsAmount = {min = 1, max = 3},},
				[2] = { prop = 'p_painting02x' ,coords = vec3(2714.780029296875, -2421.239990234375, 56.56999969482422),rot = vec3(-6.00000095367431,0,-117.99999237060547), rewards = { "broach","oldplate","oldpainting"},rewardsAmount = {min = 1, max = 3},},
				[3] = { prop = 'p_jewelrybox02bx' ,coords = vec3(2710.02001953125, -2420.25, 58.79999923706055),rot = vec3(0,0,69.81129455566406), rewards = { "hairpin","spectacles","silverware"},rewardsAmount = {min = 1, max = 1},},
				[4] = { prop = 'p_cs_rug01x' ,coords = vec3(2712.389892578125, -2420.489990234375, 55.00804138183594),rot = vec3(0,0,60), rewards = { "newboots","oldcoin","sharkstick"},rewardsAmount = {min = 1, max = 1},},
			},
			Dog = { chance = 10 , model = 'a_c_doghound_01' ,coords = vec4(2712.61, -2421.98, 56.05, 69.80)},
			SpecialProp = { chance = 40 , prop = 'p_cs_footlocker01x' ,coords = vec4(2703.97, -2446.78, 55.59, 114.42), rewards = {"moneybag","brokenkey"},rewardsAmount = {min = 1, max = 2}, },
			npcModel = 'msp_reverend1_males_01',
			npcSpawnLocation = vec3(2712.75, -2421.22, 59.05),
			npcWeapon = "WEAPON_REVOLVER_CATTLEMAN",
			ammoCount = 50,
		},
	},
	[10] = {
		name = "house10",
		entercoords = vector4(2816.05, -1079.61, 45.83, 20.75),
		houseInformation = { -- Tier 3 house
			exit = vector3(2701.15, -2432.08, 56.1),
			locations = {
				[1] = { prop = 's_jewelrybox02x_a' ,coords = vec3(2707.38, -2441.193115234375, 55.84999847412109), rot = vec3(0,0,-63.00643539428711), rewards = { "goldring","hairpin","spectacles"},rewardsAmount = {min = 1, max = 3},},
				[2] = { prop = 'p_spainting_01' ,coords = vec3(2693.699951171875, -2439.419921875, 56.18999938964844),rot = vec3(0,-0.99999940395355,84.99999237060547), rewards = { "oldpainting","oldwatch","weddingring"},rewardsAmount = {min = 1, max = 3},},
				[3] = { prop = 'p_int_clothing01' ,coords = vec3(2702.968017578125, -2434.618408203125, 55.0205192565918), rot = vec3(0,0,79.14398956298828), rewards = { "spectacles","goldring","newboots"},rewardsAmount = {min = 1, max = 3},},
				[4] = { prop = 'p_vase01x' ,coords = vec3(2708.172119140625, -2432.55517578125, 55.00137710571289),rot = vec3(0,0,-58.27288818359375), rewards = { "goldring","vase","finechina"},rewardsAmount = {min = 1, max = 3},},
				[5] = { prop = 'p_int_playingcardset01' ,coords = vec3(2696.56982421875, -2435.85546875, 56.60827255249023),rot = vec3(0,0,175.41954040527344), rewards = { "silverware","oldcoin","mantleclock"},rewardsAmount = {min = 1, max = 3},},
			},
			Dog = { chance = 100 , model = 'a_c_doghound_01' ,coords = vec4(2697.11, -2432.50, 56.13, 251.79)},
			SpecialProp = { chance = 40 , prop = 'p_cs_footlocker01x' ,coords = vec4(2703.97, -2446.78, 55.59, 114.42), rewards = {"moneybag","brokenkey"},rewardsAmount = {min = 1, max = 2}, },
			npcModel = 'msp_reverend1_males_01',
			npcSpawnLocation = vec3(2704.47, -2441.31, 56.10),
			npcWeapon = "weapon_shotgun_doublebarrel",
			ammoCount = 50,
		},
	},
	[11] = { 
		name = "house11",
		entercoords = vector4(2815.15, -1042.4, 44.6, 90.64),
		houseInformation = { -- tier 1 house
			exit = vector3(2701.89, -2445.95, 55.59),
			locations = {
				[1] = { prop = 'p_vase01x' ,coords = vec3(2705.83, -2450.10, 54.59), rot = vec3(-4.99999952316284,0,-64.95000457763672), rewards = { "goldring","vase","finechina"},rewardsAmount = {min = 1, max = 3},},
				[2] = { prop = 's_misclockbox_loot_f' ,coords = vec3(2701.118408203125, -2447.653564453125, 55.35358428955078), rot = vec3(-4.99999952316284,0,-64.95000457763672),rewards = { "broach","oldwatch", "hairpin"},rewardsAmount = {min = 1, max = 3},},
				[3] = { prop = 'mp006_p_mshn_painting02x' ,coords = vec3(2705.159912109375, -2447.580078125, 55.64999847412109), rot = vec3(-4.99999952316284,0,-64.95000457763672),rewards = { "bible","weddingring","oldpainting"},rewardsAmount = {min = 1, max = 1},},
			},
			Dog = { chance = 0 , model = 'a_c_doghound_01' ,coords = vec4(2703.19, -2449.31, 55.54, 25.22)},
			SpecialProp = { chance = 40 , prop = 'p_cs_footlocker01x' ,coords = vec4(2703.97, -2446.78, 55.59, 114.42), rewards = {"moneybag","brokenkey"},rewardsAmount = {min = 1, max = 2}, },
			npcModel = 'msp_reverend1_males_01',
			npcSpawnLocation = vec3(2702.72, -2448.28, 55.54),
			npcWeapon = "WEAPON_UNARMED",
			ammoCount = 50,
		}
	},
	
	-- more blackwater

	[12] = { 
		name = "house12",
		entercoords = vector4(-790.09, -1406.82, 44.95, 198.44),
		houseInformation = { -- tier 1 house
			exit = vector3(2701.98, -2445.91, 55.59),
			locations = {
				[1] = { prop = 'p_vase01x' ,coords = vec3(2705.83, -2450.10, 54.59), rot = vec3(-4.99999952316284,0,-64.95000457763672), rewards = { "goldring","vase","finechina"},rewardsAmount = {min = 1, max = 3},},
				[2] = { prop = 's_misclockbox_loot_f' ,coords = vec3(2701.118408203125, -2447.653564453125, 55.35358428955078), rot = vec3(-4.99999952316284,0,-64.95000457763672),rewards = { "broach","oldwatch", "hairpin"},rewardsAmount = {min = 1, max = 3},},
				[3] = { prop = 'mp006_p_mshn_painting02x' ,coords = vec3(2705.159912109375, -2447.580078125, 55.64999847412109), rot = vec3(-4.99999952316284,0,-64.95000457763672),rewards = { "bible","weddingring","oldpainting"},rewardsAmount = {min = 1, max = 1},},
			},
			Dog = { chance = 0 , model = 'a_c_doghound_01' ,coords = vec4(2703.19, -2449.31, 55.54, 25.22)},
			SpecialProp = { chance = 40 , prop = 'p_cs_footlocker01x' ,coords = vec4(2703.97, -2446.78, 55.59, 114.42), rewards = {"moneybag","brokenkey"},rewardsAmount = {min = 1, max = 2}, },
			npcModel = 'msp_reverend1_males_01',
			npcSpawnLocation = vec3(2702.72, -2448.28, 55.54),
			npcWeapon = "WEAPON_UNARMED",
			ammoCount = 50,
		}
	},

	[13] = { 
		name = "house13",
		entercoords = vector4(-821.52, -1410.94, 44.53, 189.61),
		houseInformation = { -- tier 1 house
			exit = vector3(2701.98, -2445.91, 55.59),
			locations = {
				[1] = { prop = 'p_vase01x' ,coords = vec3(2705.83, -2450.10, 54.59), rot = vec3(-4.99999952316284,0,-64.95000457763672), rewards = { "goldring","vase","finechina"},rewardsAmount = {min = 1, max = 3},},
				[2] = { prop = 's_misclockbox_loot_f' ,coords = vec3(2701.118408203125, -2447.653564453125, 55.35358428955078), rot = vec3(-4.99999952316284,0,-64.95000457763672),rewards = { "broach","oldwatch", "hairpin"},rewardsAmount = {min = 1, max = 3},},
				[3] = { prop = 'mp006_p_mshn_painting02x' ,coords = vec3(2705.159912109375, -2447.580078125, 55.64999847412109), rot = vec3(-4.99999952316284,0,-64.95000457763672),rewards = { "bible","weddingring","oldpainting"},rewardsAmount = {min = 1, max = 1},},
			},
			Dog = { chance = 0 , model = 'a_c_doghound_01' ,coords = vec4(2703.19, -2449.31, 55.54, 25.22)},
			SpecialProp = { chance = 40 , prop = 'p_cs_footlocker01x' ,coords = vec4(2703.97, -2446.78, 55.59, 114.42), rewards = {"moneybag","brokenkey"},rewardsAmount = {min = 1, max = 2}, },
			npcModel = 'msp_reverend1_males_01',
			npcSpawnLocation = vec3(2702.72, -2448.28, 55.54),
			npcWeapon = "WEAPON_REVOLVER_CATTLEMAN",
			ammoCount = 50,
		}
	},
	[14] = { 
		name = "house14",
		entercoords = vector4(-878.99, -1418.56, 45.18, 182.33),
		houseInformation = { -- tier 1 house
			exit = vector3(2701.98, -2445.91, 55.59),
			locations = {
				[1] = { prop = 'p_vase01x' ,coords = vec3(2705.83, -2450.10, 54.59), rot = vec3(-4.99999952316284,0,-64.95000457763672), rewards = { "goldring","vase","finechina"},rewardsAmount = {min = 1, max = 3},},
				[2] = { prop = 's_misclockbox_loot_f' ,coords = vec3(2701.118408203125, -2447.653564453125, 55.35358428955078), rot = vec3(-4.99999952316284,0,-64.95000457763672),rewards = { "broach","oldwatch", "hairpin"},rewardsAmount = {min = 1, max = 3},},
				[3] = { prop = 'mp006_p_mshn_painting02x' ,coords = vec3(2705.159912109375, -2447.580078125, 55.64999847412109), rot = vec3(-4.99999952316284,0,-64.95000457763672),rewards = { "bible","weddingring","oldpainting"},rewardsAmount = {min = 1, max = 1},},
			},
			Dog = { chance = 0 , model = 'a_c_doghound_01' ,coords = vec4(2703.19, -2449.31, 55.54, 25.22)},
			SpecialProp = { chance = 40 , prop = 'p_cs_footlocker01x' ,coords = vec4(2703.97, -2446.78, 55.59, 114.42), rewards = {"moneybag","brokenkey"},rewardsAmount = {min = 1, max = 2}, },
			npcModel = 'msp_reverend1_males_01',
			npcSpawnLocation = vec3(2702.72, -2448.28, 55.54),
			npcWeapon = "WEAPON_REVOLVER_CATTLEMAN",
			ammoCount = 50,
		}
	},
	[15] = { 
		name = "house15",
		entercoords = vector4(-909.41, -1367.34, 45.46, 182.33),
		houseInformation = { -- tier 1 house
			exit = vector3(2701.98, -2445.91, 55.59),
			locations = {
				[1] = { prop = 'p_vase01x' ,coords = vec3(2705.83, -2450.10, 54.59), rot = vec3(-4.99999952316284,0,-64.95000457763672), rewards = { "goldring","vase","finechina"},rewardsAmount = {min = 1, max = 3},},
				[2] = { prop = 's_misclockbox_loot_f' ,coords = vec3(2701.118408203125, -2447.653564453125, 55.35358428955078), rot = vec3(-4.99999952316284,0,-64.95000457763672),rewards = { "broach","oldwatch", "hairpin"},rewardsAmount = {min = 1, max = 3},},
				[3] = { prop = 'mp006_p_mshn_painting02x' ,coords = vec3(2705.159912109375, -2447.580078125, 55.64999847412109), rot = vec3(-4.99999952316284,0,-64.95000457763672),rewards = { "bible","weddingring","oldpainting"},rewardsAmount = {min = 1, max = 1},},
			},
			Dog = { chance = 0 , model = 'a_c_doghound_01' ,coords = vec4(2703.19, -2449.31, 55.54, 25.22)},
			SpecialProp = { chance = 40 , prop = 'p_cs_footlocker01x' ,coords = vec4(2703.97, -2446.78, 55.59, 114.42), rewards = {"moneybag","brokenkey"},rewardsAmount = {min = 1, max = 2}, },
			npcModel = 'msp_reverend1_males_01',
			npcSpawnLocation = vec3(2702.72, -2448.28, 55.54),
			npcWeapon = "WEAPON_UNARMED",
			ammoCount = 50,
		}
	},
	[16] = { 
		name = "house16",
		entercoords = vector4(-861.34, -748.97, 59.82, 19.99),
		houseInformation = { -- tier 1 house
			exit = vector3(2701.98, -2445.91, 55.59),
			locations = {
				[1] = { prop = 'p_vase01x' ,coords = vec3(2705.83, -2450.10, 54.59), rot = vec3(-4.99999952316284,0,-64.95000457763672), rewards = { "goldring","vase","finechina"},rewardsAmount = {min = 1, max = 3},},
				[2] = { prop = 's_misclockbox_loot_f' ,coords = vec3(2701.118408203125, -2447.653564453125, 55.35358428955078), rot = vec3(-4.99999952316284,0,-64.95000457763672),rewards = { "broach","oldwatch", "hairpin"},rewardsAmount = {min = 1, max = 3},},
				[3] = { prop = 'mp006_p_mshn_painting02x' ,coords = vec3(2705.159912109375, -2447.580078125, 55.64999847412109), rot = vec3(-4.99999952316284,0,-64.95000457763672),rewards = { "bible","weddingring","oldpainting"},rewardsAmount = {min = 1, max = 1},},
			},
			Dog = { chance = 0 , model = 'a_c_doghound_01' ,coords = vec4(2703.19, -2449.31, 55.54, 25.22)},
			SpecialProp = { chance = 40 , prop = 'p_cs_footlocker01x' ,coords = vec4(2703.97, -2446.78, 55.59, 114.42), rewards = {"moneybag","brokenkey"},rewardsAmount = {min = 1, max = 2}, },
			npcModel = 'msp_reverend1_males_01',
			npcSpawnLocation = vec3(2702.72, -2448.28, 55.54),
			npcWeapon = "WEAPON_UNARMED",
			ammoCount = 50,
		}
	},

	--valentine

	[17] = { 
		name = "house17",
		entercoords = vector4(-260.22, 843.88, 123.58, 284.99),
		houseInformation = { -- tier 1 house
			exit = vector3(2701.98, -2445.91, 55.59),
			locations = {
				[1] = { prop = 'p_vase01x' ,coords = vec3(2705.83, -2450.10, 54.59), rot = vec3(-4.99999952316284,0,-64.95000457763672), rewards = { "goldring","vase","finechina"},rewardsAmount = {min = 1, max = 3},},
				[2] = { prop = 's_misclockbox_loot_f' ,coords = vec3(2701.118408203125, -2447.653564453125, 55.35358428955078), rot = vec3(-4.99999952316284,0,-64.95000457763672),rewards = { "broach","oldwatch", "hairpin"},rewardsAmount = {min = 1, max = 3},},
				[3] = { prop = 'mp006_p_mshn_painting02x' ,coords = vec3(2705.159912109375, -2447.580078125, 55.64999847412109), rot = vec3(-4.99999952316284,0,-64.95000457763672),rewards = { "bible","weddingring","oldpainting"},rewardsAmount = {min = 1, max = 1},},
			},
			Dog = { chance = 0 , model = 'a_c_doghound_01' ,coords = vec4(2703.19, -2449.31, 55.54, 25.22)},
			SpecialProp = { chance = 40 , prop = 'p_cs_footlocker01x' ,coords = vec4(2703.97, -2446.78, 55.59, 114.42), rewards = {"moneybag","brokenkey"},rewardsAmount = {min = 1, max = 2}, },
			npcModel = 'msp_reverend1_males_01',
			npcSpawnLocation = vec3(2702.72, -2448.28, 55.54),
			npcWeapon = "WEAPON_UNARMED",
			ammoCount = 50,
		}
	},
	[18] = {
		name = "house18",
		entercoords = vector4(-285.47, 869, 121.14, 85),
		houseInformation = { -- Tier 3 house
			exit = vector3(2701.15, -2432.05, 56.1),
			locations = {
				[1] = { prop = 's_jewelrybox02x_a' ,coords = vec3(2707.38, -2441.193115234375, 55.84999847412109), rot = vec3(0,0,-63.00643539428711), rewards = { "goldring","hairpin","spectacles"},rewardsAmount = {min = 1, max = 3},},
				[2] = { prop = 'p_spainting_01' ,coords = vec3(2693.699951171875, -2439.419921875, 56.18999938964844),rot = vec3(0,-0.99999940395355,84.99999237060547), rewards = { "oldpainting","oldwatch","weddingring"},rewardsAmount = {min = 1, max = 3},},
				[3] = { prop = 'p_int_clothing01' ,coords = vec3(2702.968017578125, -2434.618408203125, 55.0205192565918), rot = vec3(0,0,79.14398956298828), rewards = { "spectacles","goldring","newboots"},rewardsAmount = {min = 1, max = 3},},
				[4] = { prop = 'p_vase01x' ,coords = vec3(2708.172119140625, -2432.55517578125, 55.00137710571289),rot = vec3(0,0,-58.27288818359375), rewards = { "goldring","vase","finechina"},rewardsAmount = {min = 1, max = 3},},
				[5] = { prop = 'p_int_playingcardset01' ,coords = vec3(2696.56982421875, -2435.85546875, 56.60827255249023),rot = vec3(0,0,175.41954040527344), rewards = { "silverware","oldcoin","mantleclock"},rewardsAmount = {min = 1, max = 3},},
			},
			Dog = { chance = 100 , model = 'a_c_doghound_01' ,coords = vec4(2697.11, -2432.50, 56.13, 251.79)},
			SpecialProp = { chance = 40 , prop = 'p_cs_footlocker01x' ,coords = vec4(2703.97, -2446.78, 55.59, 114.42), rewards = {"moneybag","brokenkey"},rewardsAmount = {min = 1, max = 2}, },
			npcModel = 'msp_reverend1_males_01',
			npcSpawnLocation = vec3(2704.47, -2441.31, 56.10),
			npcWeapon = "weapon_shotgun_doublebarrel",
			ammoCount = 50,
		},
	},
	[19] = {
		name = "house19",
		entercoords = vector4(-281.18, 913.17, 128, 34.99),
		houseInformation = { -- Tier 3 house
			exit = vector3(2701.15, -2432.05, 56.1),
			locations = {
				[1] = { prop = 's_jewelrybox02x_a' ,coords = vec3(2707.38, -2441.193115234375, 55.84999847412109), rot = vec3(0,0,-63.00643539428711), rewards = { "goldring","hairpin","spectacles"},rewardsAmount = {min = 1, max = 3},},
				[2] = { prop = 'p_spainting_01' ,coords = vec3(2693.699951171875, -2439.419921875, 56.18999938964844),rot = vec3(0,-0.99999940395355,84.99999237060547), rewards = { "oldpainting","oldwatch","weddingring"},rewardsAmount = {min = 1, max = 3},},
				[3] = { prop = 'p_int_clothing01' ,coords = vec3(2702.968017578125, -2434.618408203125, 55.0205192565918), rot = vec3(0,0,79.14398956298828), rewards = { "spectacles","goldring","newboots"},rewardsAmount = {min = 1, max = 3},},
				[4] = { prop = 'p_vase01x' ,coords = vec3(2708.172119140625, -2432.55517578125, 55.00137710571289),rot = vec3(0,0,-58.27288818359375), rewards = { "goldring","vase","finechina"},rewardsAmount = {min = 1, max = 3},},
				[5] = { prop = 'p_int_playingcardset01' ,coords = vec3(2696.56982421875, -2435.85546875, 56.60827255249023),rot = vec3(0,0,175.41954040527344), rewards = { "silverware","oldcoin","mantleclock"},rewardsAmount = {min = 1, max = 3},},
			},
			Dog = { chance = 100 , model = 'a_c_doghound_01' ,coords = vec4(2697.11, -2432.50, 56.13, 251.79)},
			SpecialProp = { chance = 40 , prop = 'p_cs_footlocker01x' ,coords = vec4(2703.97, -2446.78, 55.59, 114.42), rewards = {"moneybag","brokenkey"},rewardsAmount = {min = 1, max = 2}, },
			npcModel = 'msp_reverend1_males_01',
			npcSpawnLocation = vec3(2704.47, -2441.31, 56.10),
			npcWeapon = "weapon_shotgun_doublebarrel",
			ammoCount = 50,
		},
	},
	[20] = {
		name = "house20",
		entercoords = vector4(-382.62, 917.07, 118.52, 269.59),
		houseInformation = { -- Tier 3 house
			exit = vector3(2701.15, -2432.05, 56.1),
			locations = {
				[1] = { prop = 's_jewelrybox02x_a' ,coords = vec3(2707.38, -2441.193115234375, 55.84999847412109), rot = vec3(0,0,-63.00643539428711), rewards = { "goldring","hairpin","spectacles"},rewardsAmount = {min = 1, max = 3},},
				[2] = { prop = 'p_spainting_01' ,coords = vec3(2693.699951171875, -2439.419921875, 56.18999938964844),rot = vec3(0,-0.99999940395355,84.99999237060547), rewards = { "oldpainting","oldwatch","weddingring"},rewardsAmount = {min = 1, max = 3},},
				[3] = { prop = 'p_int_clothing01' ,coords = vec3(2702.968017578125, -2434.618408203125, 55.0205192565918), rot = vec3(0,0,79.14398956298828), rewards = { "spectacles","goldring","newboots"},rewardsAmount = {min = 1, max = 3},},
				[4] = { prop = 'p_vase01x' ,coords = vec3(2708.172119140625, -2432.55517578125, 55.00137710571289),rot = vec3(0,0,-58.27288818359375), rewards = { "goldring","vase","finechina"},rewardsAmount = {min = 1, max = 3},},
				[5] = { prop = 'p_int_playingcardset01' ,coords = vec3(2696.56982421875, -2435.85546875, 56.60827255249023),rot = vec3(0,0,175.41954040527344), rewards = { "silverware","oldcoin","mantleclock"},rewardsAmount = {min = 1, max = 3},},
			},
			Dog = { chance = 100 , model = 'a_c_doghound_01' ,coords = vec4(2697.11, -2432.50, 56.13, 251.79)},
			SpecialProp = { chance = 40 , prop = 'p_cs_footlocker01x' ,coords = vec4(2703.97, -2446.78, 55.59, 114.42), rewards = {"moneybag","brokenkey"},rewardsAmount = {min = 1, max = 2}, },
			npcModel = 'msp_reverend1_males_01',
			npcSpawnLocation = vec3(2704.47, -2441.31, 56.10),
			npcWeapon = "weapon_shotgun_doublebarrel",
			ammoCount = 50,
		},
	},
	[21] = {
		name = "house21",
		entercoords = vector4(-294.31, 774.01, 122.47, 280),
		houseInformation = { -- Tier 3 house
			exit = vector3(2701.15, -2432.05, 56.1),
			locations = {
				[1] = { prop = 's_jewelrybox02x_a' ,coords = vec3(2707.38, -2441.193115234375, 55.84999847412109), rot = vec3(0,0,-63.00643539428711), rewards = { "goldring","hairpin","spectacles"},rewardsAmount = {min = 1, max = 3},},
				[2] = { prop = 'p_spainting_01' ,coords = vec3(2693.699951171875, -2439.419921875, 56.18999938964844),rot = vec3(0,-0.99999940395355,84.99999237060547), rewards = { "oldpainting","oldwatch","weddingring"},rewardsAmount = {min = 1, max = 3},},
				[3] = { prop = 'p_int_clothing01' ,coords = vec3(2702.968017578125, -2434.618408203125, 55.0205192565918), rot = vec3(0,0,79.14398956298828), rewards = { "spectacles","goldring","newboots"},rewardsAmount = {min = 1, max = 3},},
				[4] = { prop = 'p_vase01x' ,coords = vec3(2708.172119140625, -2432.55517578125, 55.00137710571289),rot = vec3(0,0,-58.27288818359375), rewards = { "goldring","vase","finechina"},rewardsAmount = {min = 1, max = 3},},
				[5] = { prop = 'p_int_playingcardset01' ,coords = vec3(2696.56982421875, -2435.85546875, 56.60827255249023),rot = vec3(0,0,175.41954040527344), rewards = { "silverware","oldcoin","mantleclock"},rewardsAmount = {min = 1, max = 3},},
			},
			Dog = { chance = 100 , model = 'a_c_doghound_01' ,coords = vec4(2697.11, -2432.50, 56.13, 251.79)},
			SpecialProp = { chance = 40 , prop = 'p_cs_footlocker01x' ,coords = vec4(2703.97, -2446.78, 55.59, 114.42), rewards = {"moneybag","brokenkey"},rewardsAmount = {min = 1, max = 2}, },
			npcModel = 'msp_reverend1_males_01',
			npcSpawnLocation = vec3(2704.47, -2441.31, 56.10),
			npcWeapon = "weapon_shotgun_doublebarrel",
			ammoCount = 50,
		},
	},

	---blackwater

	[22] = { 
		name = "house22",
		entercoords = vector4(-830.34, -1413.27, 44.05, 192.21),
		houseInformation = { -- tier 1 house
			exit = vector3(2701.88, -2445.95, 55.59),
			locations = {
				[1] = { prop = 'p_vase01x' ,coords = vec3(2705.83, -2450.10, 54.59), rot = vec3(-4.99999952316284,0,-64.95000457763672), rewards = { "goldring","vase","finechina"},rewardsAmount = {min = 1, max = 3},},
				[2] = { prop = 's_misclockbox_loot_f' ,coords = vec3(2701.118408203125, -2447.653564453125, 55.35358428955078), rot = vec3(-4.99999952316284,0,-64.95000457763672),rewards = { "broach","oldwatch", "hairpin"},rewardsAmount = {min = 1, max = 3},},
				[3] = { prop = 'mp006_p_mshn_painting02x' ,coords = vec3(2705.159912109375, -2447.580078125, 55.64999847412109), rot = vec3(-4.99999952316284,0,-64.95000457763672),rewards = { "bible","weddingring","oldpainting"},rewardsAmount = {min = 1, max = 1},},
			},
			Dog = { chance = 0 , model = 'a_c_doghound_01' ,coords = vec4(2703.19, -2449.31, 55.54, 25.22)},
			SpecialProp = { chance = 40 , prop = 'p_cs_footlocker01x' ,coords = vec4(2703.97, -2446.78, 55.59, 114.42), rewards = {"moneybag","brokenkey"},rewardsAmount = {min = 1, max = 2}, },
			npcModel = 'msp_reverend1_males_01',
			npcSpawnLocation = vec3(2702.72, -2448.28, 55.54),
			npcWeapon = "WEAPON_UNARMED",
			ammoCount = 50,
		}
	},

	[23] = { 
		name = "house23",
		entercoords = vector4(-804.36, -1410.21, 45.01, 192.73),
		houseInformation = { -- tier 1 house
			exit = vector3(2701.88, -2445.95, 55.59),
			locations = {
				[1] = { prop = 'p_vase01x' ,coords = vec3(2705.83, -2450.10, 54.59), rot = vec3(-4.99999952316284,0,-64.95000457763672), rewards = { "goldring","vase","finechina"},rewardsAmount = {min = 1, max = 3},},
				[2] = { prop = 's_misclockbox_loot_f' ,coords = vec3(2701.118408203125, -2447.653564453125, 55.35358428955078), rot = vec3(-4.99999952316284,0,-64.95000457763672),rewards = { "broach","oldwatch", "hairpin"},rewardsAmount = {min = 1, max = 3},},
				[3] = { prop = 'mp006_p_mshn_painting02x' ,coords = vec3(2705.159912109375, -2447.580078125, 55.64999847412109), rot = vec3(-4.99999952316284,0,-64.95000457763672),rewards = { "bible","weddingring","oldpainting"},rewardsAmount = {min = 1, max = 1},},
			},
			Dog = { chance = 0 , model = 'a_c_doghound_01' ,coords = vec4(2703.19, -2449.31, 55.54, 25.22)},
			SpecialProp = { chance = 40 , prop = 'p_cs_footlocker01x' ,coords = vec4(2703.97, -2446.78, 55.59, 114.42), rewards = {"moneybag","brokenkey"},rewardsAmount = {min = 1, max = 2}, },
			npcModel = 'msp_reverend1_males_01',
			npcSpawnLocation = vec3(2702.72, -2448.28, 55.54),
			npcWeapon = "WEAPON_UNARMED",
			ammoCount = 50,
		}
	},

	[24] = {
		name = "house24",
		entercoords = vector4(-762.7, -1454.67, 55.49, 265.16),
		houseInformation = { -- Tier 3 house
			exit = vector3(2701.14, -2432.07, 56.1),
			locations = {
				[1] = { prop = 's_jewelrybox02x_a' ,coords = vec3(2707.38, -2441.193115234375, 55.84999847412109), rot = vec3(0,0,-63.00643539428711), rewards = { "goldring","hairpin","spectacles"},rewardsAmount = {min = 1, max = 3},},
				[2] = { prop = 'p_spainting_01' ,coords = vec3(2693.699951171875, -2439.419921875, 56.18999938964844),rot = vec3(0,-0.99999940395355,84.99999237060547), rewards = { "oldpainting","oldwatch","weddingring"},rewardsAmount = {min = 1, max = 3},},
				[3] = { prop = 'p_int_clothing01' ,coords = vec3(2702.968017578125, -2434.618408203125, 55.0205192565918), rot = vec3(0,0,79.14398956298828), rewards = { "spectacles","goldring","newboots"},rewardsAmount = {min = 1, max = 3},},
				[4] = { prop = 'p_vase01x' ,coords = vec3(2708.172119140625, -2432.55517578125, 55.00137710571289),rot = vec3(0,0,-58.27288818359375), rewards = { "goldring","vase","finechina"},rewardsAmount = {min = 1, max = 3},},
				[5] = { prop = 'p_int_playingcardset01' ,coords = vec3(2696.56982421875, -2435.85546875, 56.60827255249023),rot = vec3(0,0,175.41954040527344), rewards = { "silverware","oldcoin","mantleclock"},rewardsAmount = {min = 1, max = 3},},
			},
			Dog = { chance = 100 , model = 'a_c_doghound_01' ,coords = vec4(2697.11, -2432.50, 56.13, 251.79)},
			SpecialProp = { chance = 40 , prop = 'p_cs_footlocker01x' ,coords = vec4(2703.97, -2446.78, 55.59, 114.42), rewards = {"moneybag","brokenkey"},rewardsAmount = {min = 1, max = 2}, },
			npcModel = 'msp_reverend1_males_01',
			npcSpawnLocation = vec3(2704.47, -2441.31, 56.10),
			npcWeapon = "weapon_shotgun_doublebarrel",
			ammoCount = 50,
		},

	},
	[25] = {
		name = "house25",
		entercoords = vector4(-805.72, -1501.63, 63.49, 70),
		houseInformation = { -- Tier 3 house
			exit = vector3(2701.14, -2432.07, 56.1),
			locations = {
				[1] = { prop = 's_jewelrybox02x_a' ,coords = vec3(2707.38, -2441.193115234375, 55.84999847412109), rot = vec3(0,0,-63.00643539428711), rewards = { "goldring","hairpin","spectacles"},rewardsAmount = {min = 1, max = 3},},
				[2] = { prop = 'p_spainting_01' ,coords = vec3(2693.699951171875, -2439.419921875, 56.18999938964844),rot = vec3(0,-0.99999940395355,84.99999237060547), rewards = { "oldpainting","oldwatch","weddingring"},rewardsAmount = {min = 1, max = 3},},
				[3] = { prop = 'p_int_clothing01' ,coords = vec3(2702.968017578125, -2434.618408203125, 55.0205192565918), rot = vec3(0,0,79.14398956298828), rewards = { "spectacles","goldring","newboots"},rewardsAmount = {min = 1, max = 3},},
				[4] = { prop = 'p_vase01x' ,coords = vec3(2708.172119140625, -2432.55517578125, 55.00137710571289),rot = vec3(0,0,-58.27288818359375), rewards = { "goldring","vase","finechina"},rewardsAmount = {min = 1, max = 3},},
				[5] = { prop = 'p_int_playingcardset01' ,coords = vec3(2696.56982421875, -2435.85546875, 56.60827255249023),rot = vec3(0,0,175.41954040527344), rewards = { "silverware","oldcoin","mantleclock"},rewardsAmount = {min = 1, max = 3},},
			},
			Dog = { chance = 100 , model = 'a_c_doghound_01' ,coords = vec4(2697.11, -2432.50, 56.13, 251.79)},
			SpecialProp = { chance = 40 , prop = 'p_cs_footlocker01x' ,coords = vec4(2703.97, -2446.78, 55.59, 114.42), rewards = {"moneybag","brokenkey"},rewardsAmount = {min = 1, max = 2}, },
			npcModel = 'msp_reverend1_males_01',
			npcSpawnLocation = vec3(2704.47, -2441.31, 56.10),
			npcWeapon = "weapon_shotgun_doublebarrel",
			ammoCount = 50,
		},

	},
	[26] = {
		name = "house26",
		entercoords = vector4(-877.79, -1643.4, 69.17, 239.99),
		houseInformation = { -- Tier 3 house
			exit = vector3(2701.23, -2432.08, 56.1),
			locations = {
				[1] = { prop = 's_jewelrybox02x_a' ,coords = vec3(2707.38, -2441.193115234375, 55.84999847412109), rot = vec3(0,0,-63.00643539428711), rewards = { "goldring","hairpin","spectacles"},rewardsAmount = {min = 1, max = 3},},
				[2] = { prop = 'p_spainting_01' ,coords = vec3(2693.699951171875, -2439.419921875, 56.18999938964844),rot = vec3(0,-0.99999940395355,84.99999237060547), rewards = { "oldpainting","oldwatch","weddingring"},rewardsAmount = {min = 1, max = 3},},
				[3] = { prop = 'p_int_clothing01' ,coords = vec3(2702.968017578125, -2434.618408203125, 55.0205192565918), rot = vec3(0,0,79.14398956298828), rewards = { "spectacles","goldring","newboots"},rewardsAmount = {min = 1, max = 3},},
				[4] = { prop = 'p_vase01x' ,coords = vec3(2708.172119140625, -2432.55517578125, 55.00137710571289),rot = vec3(0,0,-58.27288818359375), rewards = { "goldring","vase","finechina"},rewardsAmount = {min = 1, max = 3},},
				[5] = { prop = 'p_int_playingcardset01' ,coords = vec3(2696.56982421875, -2435.85546875, 56.60827255249023),rot = vec3(0,0,175.41954040527344), rewards = { "silverware","oldcoin","mantleclock"},rewardsAmount = {min = 1, max = 3},},
			},
			Dog = { chance = 100 , model = 'a_c_doghound_01' ,coords = vec4(2697.11, -2432.50, 56.13, 251.79)},
			SpecialProp = { chance = 40 , prop = 'p_cs_footlocker01x' ,coords = vec4(2703.97, -2446.78, 55.59, 114.42), rewards = {"moneybag","brokenkey"},rewardsAmount = {min = 1, max = 2}, },
			npcModel = 'msp_reverend1_males_01',
			npcSpawnLocation = vec3(2704.47, -2441.31, 56.10),
			npcWeapon = "weapon_shotgun_doublebarrel",
			ammoCount = 50,
		},
	},
	[27] = {
		name = "house27",
		entercoords = vector4(-1022.46, -1625.01, 79.01, 344.59),
		houseInformation = { -- Tier 3 house
			exit = vector3(2701.23, -2432.08, 56.1),
			locations = {
				[1] = { prop = 's_jewelrybox02x_a' ,coords = vec3(2707.38, -2441.193115234375, 55.84999847412109), rot = vec3(0,0,-63.00643539428711), rewards = { "goldring","hairpin","spectacles"},rewardsAmount = {min = 1, max = 3},},
				[2] = { prop = 'p_spainting_01' ,coords = vec3(2693.699951171875, -2439.419921875, 56.18999938964844),rot = vec3(0,-0.99999940395355,84.99999237060547), rewards = { "oldpainting","oldwatch","weddingring"},rewardsAmount = {min = 1, max = 3},},
				[3] = { prop = 'p_int_clothing01' ,coords = vec3(2702.968017578125, -2434.618408203125, 55.0205192565918), rot = vec3(0,0,79.14398956298828), rewards = { "spectacles","goldring","newboots"},rewardsAmount = {min = 1, max = 3},},
				[4] = { prop = 'p_vase01x' ,coords = vec3(2708.172119140625, -2432.55517578125, 55.00137710571289),rot = vec3(0,0,-58.27288818359375), rewards = { "goldring","vase","finechina"},rewardsAmount = {min = 1, max = 3},},
				[5] = { prop = 'p_int_playingcardset01' ,coords = vec3(2696.56982421875, -2435.85546875, 56.60827255249023),rot = vec3(0,0,175.41954040527344), rewards = { "silverware","oldcoin","mantleclock"},rewardsAmount = {min = 1, max = 3},},
			},
			Dog = { chance = 100 , model = 'a_c_doghound_01' ,coords = vec4(2697.11, -2432.50, 56.13, 251.79)},
			SpecialProp = { chance = 40 , prop = 'p_cs_footlocker01x' ,coords = vec4(2703.97, -2446.78, 55.59, 114.42), rewards = {"moneybag","brokenkey"},rewardsAmount = {min = 1, max = 2}, },
			npcModel = 'msp_reverend1_males_01',
			npcSpawnLocation = vec3(2704.47, -2441.31, 56.10),
			npcWeapon = "weapon_shotgun_doublebarrel",
			ammoCount = 50,
		},
	},
	[28] = {
		name = "house28",
		entercoords = vector4(-929.61, -1272.31, 51.43, 170.29),
		houseInformation = { -- Tier 3 house
			exit = vector3(2701.23, -2432.08, 56.1),
			locations = {
				[1] = { prop = 's_jewelrybox02x_a' ,coords = vec3(2707.38, -2441.193115234375, 55.84999847412109), rot = vec3(0,0,-63.00643539428711), rewards = { "goldring","hairpin","spectacles"},rewardsAmount = {min = 1, max = 3},},
				[2] = { prop = 'p_spainting_01' ,coords = vec3(2693.699951171875, -2439.419921875, 56.18999938964844),rot = vec3(0,-0.99999940395355,84.99999237060547), rewards = { "oldpainting","oldwatch","weddingring"},rewardsAmount = {min = 1, max = 3},},
				[3] = { prop = 'p_int_clothing01' ,coords = vec3(2702.968017578125, -2434.618408203125, 55.0205192565918), rot = vec3(0,0,79.14398956298828), rewards = { "spectacles","goldring","newboots"},rewardsAmount = {min = 1, max = 3},},
				[4] = { prop = 'p_vase01x' ,coords = vec3(2708.172119140625, -2432.55517578125, 55.00137710571289),rot = vec3(0,0,-58.27288818359375), rewards = { "goldring","vase","finechina"},rewardsAmount = {min = 1, max = 3},},
				[5] = { prop = 'p_int_playingcardset01' ,coords = vec3(2696.56982421875, -2435.85546875, 56.60827255249023),rot = vec3(0,0,175.41954040527344), rewards = { "silverware","oldcoin","mantleclock"},rewardsAmount = {min = 1, max = 3},},
			},
			Dog = { chance = 100 , model = 'a_c_doghound_01' ,coords = vec4(2697.11, -2432.50, 56.13, 251.79)},
			SpecialProp = { chance = 40 , prop = 'p_cs_footlocker01x' ,coords = vec4(2703.97, -2446.78, 55.59, 114.42), rewards = {"moneybag","brokenkey"},rewardsAmount = {min = 1, max = 2}, },
			npcModel = 'msp_reverend1_males_01',
			npcSpawnLocation = vec3(2704.47, -2441.31, 56.10),
			npcWeapon = "weapon_shotgun_doublebarrel",
			ammoCount = 50,
		},
	},
	[29] = {
		name = "house29",
		entercoords = vector4(-965.8, -1253.18, 53.96, 134.57),
		houseInformation = { -- Tier 3 house
			exit = vector3(2701.23, -2432.08, 56.1),
			locations = {
				[1] = { prop = 's_jewelrybox02x_a' ,coords = vec3(2707.38, -2441.193115234375, 55.84999847412109), rot = vec3(0,0,-63.00643539428711), rewards = { "goldring","hairpin","spectacles"},rewardsAmount = {min = 1, max = 3},},
				[2] = { prop = 'p_spainting_01' ,coords = vec3(2693.699951171875, -2439.419921875, 56.18999938964844),rot = vec3(0,-0.99999940395355,84.99999237060547), rewards = { "oldpainting","oldwatch","weddingring"},rewardsAmount = {min = 1, max = 3},},
				[3] = { prop = 'p_int_clothing01' ,coords = vec3(2702.968017578125, -2434.618408203125, 55.0205192565918), rot = vec3(0,0,79.14398956298828), rewards = { "spectacles","goldring","newboots"},rewardsAmount = {min = 1, max = 3},},
				[4] = { prop = 'p_vase01x' ,coords = vec3(2708.172119140625, -2432.55517578125, 55.00137710571289),rot = vec3(0,0,-58.27288818359375), rewards = { "goldring","vase","finechina"},rewardsAmount = {min = 1, max = 3},},
				[5] = { prop = 'p_int_playingcardset01' ,coords = vec3(2696.56982421875, -2435.85546875, 56.60827255249023),rot = vec3(0,0,175.41954040527344), rewards = { "silverware","oldcoin","mantleclock"},rewardsAmount = {min = 1, max = 3},},
			},
			Dog = { chance = 100 , model = 'a_c_doghound_01' ,coords = vec4(2697.11, -2432.50, 56.13, 251.79)},
			SpecialProp = { chance = 40 , prop = 'p_cs_footlocker01x' ,coords = vec4(2703.97, -2446.78, 55.59, 114.42), rewards = {"moneybag","brokenkey"},rewardsAmount = {min = 1, max = 2}, },
			npcModel = 'msp_reverend1_males_01',
			npcSpawnLocation = vec3(2704.47, -2441.31, 56.10),
			npcWeapon = "weapon_shotgun_doublebarrel",
			ammoCount = 50,
		},
	},
	[30] = {
		name = "house30",
		entercoords = vector4(-942.54, -1226.2, 53.5, 325),
		houseInformation = { -- Tier 3 house
			exit = vector3(2701.23, -2432.08, 56.1),
			locations = {
				[1] = { prop = 's_jewelrybox02x_a' ,coords = vec3(2707.38, -2441.193115234375, 55.84999847412109), rot = vec3(0,0,-63.00643539428711), rewards = { "goldring","hairpin","spectacles"},rewardsAmount = {min = 1, max = 3},},
				[2] = { prop = 'p_spainting_01' ,coords = vec3(2693.699951171875, -2439.419921875, 56.18999938964844),rot = vec3(0,-0.99999940395355,84.99999237060547), rewards = { "oldpainting","oldwatch","weddingring"},rewardsAmount = {min = 1, max = 3},},
				[3] = { prop = 'p_int_clothing01' ,coords = vec3(2702.968017578125, -2434.618408203125, 55.0205192565918), rot = vec3(0,0,79.14398956298828), rewards = { "spectacles","goldring","newboots"},rewardsAmount = {min = 1, max = 3},},
				[4] = { prop = 'p_vase01x' ,coords = vec3(2708.172119140625, -2432.55517578125, 55.00137710571289),rot = vec3(0,0,-58.27288818359375), rewards = { "goldring","vase","finechina"},rewardsAmount = {min = 1, max = 3},},
				[5] = { prop = 'p_int_playingcardset01' ,coords = vec3(2696.56982421875, -2435.85546875, 56.60827255249023),rot = vec3(0,0,175.41954040527344), rewards = { "silverware","oldcoin","mantleclock"},rewardsAmount = {min = 1, max = 3},},
			},
			Dog = { chance = 100 , model = 'a_c_doghound_01' ,coords = vec4(2697.11, -2432.50, 56.13, 251.79)},
			SpecialProp = { chance = 40 , prop = 'p_cs_footlocker01x' ,coords = vec4(2703.97, -2446.78, 55.59, 114.42), rewards = {"moneybag","brokenkey"},rewardsAmount = {min = 1, max = 2}, },
			npcModel = 'msp_reverend1_males_01',
			npcSpawnLocation = vec3(2704.47, -2441.31, 56.10),
			npcWeapon = "weapon_shotgun_doublebarrel",
			ammoCount = 50,
		},
	},
	

}