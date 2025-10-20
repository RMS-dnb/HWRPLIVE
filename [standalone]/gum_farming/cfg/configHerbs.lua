Config.FarmHerbs = {
	["tobaccoseed"] = {--Item Seed ID
		enableHerbToSeed = false,--If you have enabeld after you use herb -> automaticaly get seeds
		multipleUse = false,--If you have enabled you can use herb and get input with "To seed" "Interact"
		multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount (multipleUse)
		herbToSeed = 3,--How much get from herb seeds
		herbName = "Tobacco",
		herbItem = "tobacco",

		itIsTree = false,--Regrow system. Plant stay there but you can pick herb, and after again grow you an pick again. Good for apple trees etc.
		canPickAfterGrow = 0,--How much times from regrow system you can pick herb

		coordsLocks = {--If you want lock coords for plant herb
			[1] = {1060.07, -978.07, 70.86, 40.0}, -- Southfield Flats
            [2] = {1371.33, 496.79, 88, 35.0}, -- Emerald Ranch
            [3] = {-1428.04, -1140.91, 75.03, 35.0}, -- Blackwater  
            [4] = {2455.55, 869.01, 74.95, 35.0}, -- Elysian Pool 
            [5] = {2069.82, -308.16, 41.86, 25.0}, -- Swamp Shack
            [6] = {-1760.68, -2401.01, 42.68, 35.0}, -- Thieves Landing *********** no blip
            [7] = {1758.75, -2012.98, 44.24, 35.0}, -- Shady Belle Coast ********** no blip
            [8] = {-1429.78, 222.82, 100.36, 25.0}, -- south Wallace Station ********* no blip
            [9] = {3285.23, -563.71, 43.06, 35.0}, -- Sisika
            [10] = {-4396.13, -3874.86, -24.39, 25.0}, -- New Austin - San Luis River
            [11] = {-340.73, 18.31, 43.82, 25.0}, -- Limpany
            [12] = {2672.08, -778.71, 42.47, 25.0}, -- Saint Denis
            [13] = {1561.09, -7058.43, 85.04, 40.0}, -- Guarma
            [14] = {-3322.43, -3133.91, -3.54, 25.0}, -- Don Julio
            [15] = {1670.59, 1341.09, 146.48, 25.0}, -- O'Creaghs
            [16] = {-2581.66, -225.32, 170.62, 20.0}, -- Lake Owanjila
            [17] = {-198.71, -544.86, 42.94, 25.0}, -- South Flatneck Station Farm
		},
		potStageProps = {--Stage is calculated automaticaly from grow time
			/*STAGE   |   MODEL     |    TIME | HOW MUCH IN GROUND*/
			[1] = {"crp_tobaccoplant_aa_sim",  24, 0.0},
			[2] = {"crp_tobaccoplant_ab_sim",  16, 0.0},
			[3] = {"crp_tobaccoplant_ac_sim",   8, 0.0},
			[4] = {"crp_tobaccoplant_ca_sim",  -1, 0.0},
			
			
			
		},
		weatherAffect = true,--If is rain -> automaticaly water herb
		growTime = 26,--300 min time without affecting temp
		temperatureSlow = -3,--If temperature is under -3 automaticaly slow grow
		temperatureGood = {-3, 30},--If temperature between this, herb grow normal
		temperatureHot = 30,--If temperature is bigger thjan 30 herb need more water (2x more)
		
		fertilizer = 0,--If you plant herb, how much have fertilize
		quality = 100,--If you plant herb, how much have quality
		procure = 100,--If you plant herb, how much have procure
		jerks = 0,--If you plant herb, how much have jerks

		gatherAnimation = {"mech_pickup@plant@yarrow","base", 3},--Animation for gather herb
		rewardItem = {--If you have disabled quality set [XX] to [0]
			[80] = {"tobacco", 8},--Upper 80% to 100
			[50] = {"tobacco", 6},--Upper 50% to 80
			[25] = {"tobacco", 3},--Upper 25% to 50
			[0] = {"tobacco",  1},--Upper 0% to 2
		},
	},
	["rasberryseed"] = {--Item Seed ID
		enableHerbToSeed = false,--If you have enabeld after you use herb -> automaticaly get seeds
		multipleUse = false,--If you have enabled you can use herb and get input with "To seed" "Interact"
		multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount (multipleUse)
		herbToSeed = 3,--How much get from herb seeds
		herbName = "Rasberry",
		herbItem = "rasberry",

		itIsTree = false,--Regrow system. Plant stay there but you can pick herb, and after again grow you an pick again. Good for apple trees etc.
		canPickAfterGrow = 0,--How much times from regrow system you can pick herb

		coordsLocks = {--If you want lock coords for plant herb
			[1] = {1060.07, -978.07, 70.86, 40.0}, -- Southfield Flats
            [2] = {1371.33, 496.79, 88, 35.0}, -- Emerald Ranch
            [3] = {-1428.04, -1140.91, 75.03, 35.0}, -- Blackwater  
            [4] = {2455.55, 869.01, 74.95, 35.0}, -- Elysian Pool 
            [5] = {2069.82, -308.16, 41.86, 25.0}, -- Swamp Shack
            [6] = {-1760.68, -2401.01, 42.68, 35.0}, -- Thieves Landing *********** no blip
            [7] = {1758.75, -2012.98, 44.24, 35.0}, -- Shady Belle Coast ********** no blip
            [8] = {-1429.78, 222.82, 100.36, 25.0}, -- south Wallace Station ********* no blip
            [9] = {3285.23, -563.71, 43.06, 35.0}, -- Sisika
            [10] = {-4396.13, -3874.86, -24.39, 25.0}, -- New Austin - San Luis River
            [11] = {-340.73, 18.31, 43.82, 25.0}, -- Limpany
            [12] = {2672.08, -778.71, 42.47, 25.0}, -- Saint Denis
            [13] = {1561.09, -7058.43, 85.04, 40.0}, -- Guarma
            [14] = {-3322.43, -3133.91, -3.54, 25.0}, -- Don Julio
            [15] = {1670.59, 1341.09, 146.48, 25.0}, -- O'Creaghs
            [16] = {-2581.66, -225.32, 170.62, 20.0}, -- Lake Owanjila
            [17] = {-198.71, -544.86, 42.94, 25.0}, -- South Flatneck Station Farm
		},
		potStageProps = {--Stage is calculated automaticaly from grow time
			[1] = {"s_inv_raspberry01x", 24, 0.0},
			[2] = {"s_inv_raspberry01x", 16, 0.0},
			[3] = {"s_inv_raspberry01x",  8, 0.0},
			[4] = {"s_inv_raspberry01x", -1, 0.0},
		},
		weatherAffect = true,--If is rain -> automaticaly water herb
		growTime = 26,--300 min time without affecting temp
		temperatureSlow = -3,--If temperature is under -3 automaticaly slow grow
		temperatureGood = {-3, 30},--If temperature between this, herb grow normal
		temperatureHot = 30,--If temperature is bigger thjan 30 herb need more water (2x more)
		
		fertilizer = 0,--If you plant herb, how much have fertilize
		quality = 100,--If you plant herb, how much have quality
		procure = 100,--If you plant herb, how much have procure
		jerks = 0,--If you plant herb, how much have jerks

		gatherAnimation = {"mech_pickup@plant@yarrow","base", 3},--Animation for gather herb
		rewardItem = {--If you have disabled quality set [XX] to [0]
			[80] = {"rasberry", 8},--Upper 80% to 100
			[50] = {"rasberry", 6},--Upper 50% to 80
			[25] = {"rasberry", 3},--Upper 25% to 50
			[0] = {"rasberry", 1},--Upper 0% to 25
		},
	},

	["cornseed"] = {--Item Seed ID
		enableHerbToSeed = false,--If you have enabeld after you use herb -> automaticaly get seeds
		multipleUse = false,--If you have enabled you can use herb and get input with "To seed" "Interact"
		multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount (multipleUse)
		herbToSeed = 3,--How much get from herb seeds
		herbName = "Corn",
		herbItem = "corn",

		itIsTree = false,--Regrow system. Plant stay there but you can pick herb, and after again grow you an pick again. Good for apple trees etc.
		canPickAfterGrow = 0,--How much times from regrow system you can pick herb

		coordsLocks = {--If you want lock coords for plant herb
			[1] = {1060.07, -978.07, 70.86, 40.0}, -- Southfield Flats
            [2] = {1371.33, 496.79, 88, 35.0}, -- Emerald Ranch
            [3] = {-1428.04, -1140.91, 75.03, 35.0}, -- Blackwater  
            [4] = {2455.55, 869.01, 74.95, 35.0}, -- Elysian Pool 
            [5] = {2069.82, -308.16, 41.86, 25.0}, -- Swamp Shack
            [6] = {-1760.68, -2401.01, 42.68, 35.0}, -- Thieves Landing *********** no blip
            [7] = {1758.75, -2012.98, 44.24, 35.0}, -- Shady Belle Coast ********** no blip
            [8] = {-1429.78, 222.82, 100.36, 25.0}, -- south Wallace Station ********* no blip
            [9] = {3285.23, -563.71, 43.06, 35.0}, -- Sisika
            [10] = {-4396.13, -3874.86, -24.39, 25.0}, -- New Austin - San Luis River
            [11] = {-340.73, 18.31, 43.82, 25.0}, -- Limpany
            [12] = {2672.08, -778.71, 42.47, 25.0}, -- Saint Denis
            [13] = {1561.09, -7058.43, 85.04, 40.0}, -- Guarma
            [14] = {-3322.43, -3133.91, -3.54, 25.0}, -- Don Julio
            [15] = {1670.59, 1341.09, 146.48, 25.0}, -- O'Creaghs
            [16] = {-2581.66, -225.32, 170.62, 20.0}, -- Lake Owanjila
            [17] = {-198.71, -544.86, 42.94, 25.0}, -- South Flatneck Station Farm
		},
		potStageProps = {--Stage is calculated automaticaly from grow time
			[1] = {"crp_cornstalks_bb_sim", 24, 0.0},
			[2] = {"crp_cornstalks_bd_sim", 16, 0.0},
			[3] = {"crp_cornstalks_bc_sim",  8, 0.0},
			[4] = {"crp_cornstalks_bc_sim", -1, 0.0},
		},
		weatherAffect = true,--If is rain -> automaticaly water herb
		growTime = 26,--300 min time without affecting temp
		temperatureSlow = -3,--If temperature is under -3 automaticaly slow grow
		temperatureGood = {-3, 30},--If temperature between this, herb grow normal
		temperatureHot = 30,--If temperature is bigger thjan 30 herb need more water (2x more)
		
		fertilizer = 0,--If you plant herb, how much have fertilize
		quality = 100,--If you plant herb, how much have quality
		procure = 100,--If you plant herb, how much have procure
		jerks = 0,--If you plant herb, how much have jerks

		gatherAnimation = {"mech_pickup@plant@yarrow","base", 3},--Animation for gather herb
		rewardItem = {--If you have disabled quality set [XX] to [0]
			[80] = {"corn", 8},--Upper 80% to 100
			[50] = {"corn", 6},--Upper 50% to 80
			[25] = {"corn", 3},--Upper 25% to 50
			[0] = {"corn", 1},--Upper 0% to 25
		},
	},

	["sugarcaneseed"] = {--Item Seed ID
		enableHerbToSeed = false,--If you have enabeld after you use herb -> automaticaly get seeds
		multipleUse = false,--If you have enabled you can use herb and get input with "To seed" "Interact"
		multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount (multipleUse)
		herbToSeed = 3,--How much get from herb seeds
		herbName = "Raw Sugarcane",
		herbItem = "sugarcane",

		itIsTree = false,--Regrow system. Plant stay there but you can pick herb, and after again grow you an pick again. Good for apple trees etc.
		canPickAfterGrow = 0,--How much times from regrow system you can pick herb

		coordsLocks = {--If you want lock coords for plant herb
			[1] = {1060.07, -978.07, 70.86, 40.0}, -- Southfield Flats
            [2] = {1371.33, 496.79, 88, 35.0}, -- Emerald Ranch
            [3] = {-1428.04, -1140.91, 75.03, 35.0}, -- Blackwater  
            [4] = {2455.55, 869.01, 74.95, 35.0}, -- Elysian Pool 
            [5] = {2069.82, -308.16, 41.86, 25.0}, -- Swamp Shack
            [6] = {-1760.68, -2401.01, 42.68, 35.0}, -- Thieves Landing *********** no blip
            [7] = {1758.75, -2012.98, 44.24, 35.0}, -- Shady Belle Coast ********** no blip
            [8] = {-1429.78, 222.82, 100.36, 25.0}, -- south Wallace Station ********* no blip
            [9] = {3285.23, -563.71, 43.06, 35.0}, -- Sisika
            [10] = {-4396.13, -3874.86, -24.39, 25.0}, -- New Austin - San Luis River
            [11] = {-340.73, 18.31, 43.82, 25.0}, -- Limpany
            [12] = {2672.08, -778.71, 42.47, 25.0}, -- Saint Denis
            [13] = {1561.09, -7058.43, 85.04, 40.0}, -- Guarma
            [14] = {-3322.43, -3133.91, -3.54, 25.0}, -- Don Julio
            [15] = {1670.59, 1341.09, 146.48, 25.0}, -- O'Creaghs
            [16] = {-2581.66, -225.32, 170.62, 20.0}, -- Lake Owanjila
            [17] = {-198.71, -544.86, 42.94, 25.0}, -- South Flatneck Station Farm
		},
		potStageProps = {--Stage is calculated automaticaly from grow time
			/*STAGE   |   MODEL     |    TIME | HOW MUCH IN GROUND*/
			[1] = {"CRP_SUGARCANE_AC_SIM", 24, 0.0},
			[2] = {"CRP_SUGARCANE_AC_SIM", 16, 0.0},
			[3] = {"CRP_SUGARCANE_AC_SIM",  8, 0.0},
			[4] = {"CRP_SUGARCANE_AC_SIM", -1, 0.0},
			
			
			
		},
		weatherAffect = true,--If is rain -> automaticaly water herb
		growTime = 26,--300 min time without affecting temp
		temperatureSlow = -3,--If temperature is under -3 automaticaly slow grow
		temperatureGood = {-3, 30},--If temperature between this, herb grow normal
		temperatureHot = 30,--If temperature is bigger thjan 30 herb need more water (2x more)
		
		fertilizer = 0,--If you plant herb, how much have fertilize
		quality = 100,--If you plant herb, how much have quality
		procure = 100,--If you plant herb, how much have procure
		jerks = 0,--If you plant herb, how much have jerks

		gatherAnimation = {"mech_pickup@plant@yarrow","base", 3},--Animation for gather herb
		rewardItem = {--If you have disabled quality set [XX] to [0]
			[80] = {"sugarcane", 8},--Upper 80% to 100
			[50] = {"sugarcane", 6},--Upper 50% to 80
			[25] = {"sugarcane", 3},--Upper 25% to 50
			[0] = {"sugarcane", 1},--Upper 0% to 25
		},
	},

	["carrotseed"] = {--Item Seed ID
		enableHerbToSeed = false,--If you have enabeld after you use herb -> automaticaly get seeds
		multipleUse = false,--If you have enabled you can use herb and get input with "To seed" "Interact"
		multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount (multipleUse)
		herbToSeed = 3,--How much get from herb seeds
		herbName = "Wild Carrot",
		herbItem = "carrot",

		itIsTree = false,--Regrow system. Plant stay there but you can pick herb, and after again grow you an pick again. Good for apple trees etc.
		canPickAfterGrow = 0,--How much times from regrow system you can pick herb

		coordsLocks = {--If you want lock coords for plant herb
			[1] = {1060.07, -978.07, 70.86, 40.0}, -- Southfield Flats
            [2] = {1371.33, 496.79, 88, 35.0}, -- Emerald Ranch
            [3] = {-1428.04, -1140.91, 75.03, 35.0}, -- Blackwater  
            [4] = {2455.55, 869.01, 74.95, 35.0}, -- Elysian Pool 
            [5] = {2069.82, -308.16, 41.86, 25.0}, -- Swamp Shack
            [6] = {-1760.68, -2401.01, 42.68, 35.0}, -- Thieves Landing *********** no blip
            [7] = {1758.75, -2012.98, 44.24, 35.0}, -- Shady Belle Coast ********** no blip
            [8] = {-1429.78, 222.82, 100.36, 25.0}, -- south Wallace Station ********* no blip
            [9] = {3285.23, -563.71, 43.06, 35.0}, -- Sisika
            [10] = {-4396.13, -3874.86, -24.39, 25.0}, -- New Austin - San Luis River
            [11] = {-340.73, 18.31, 43.82, 25.0}, -- Limpany
            [12] = {2672.08, -778.71, 42.47, 25.0}, -- Saint Denis
            [13] = {1561.09, -7058.43, 85.04, 40.0}, -- Guarma
            [14] = {-3322.43, -3133.91, -3.54, 25.0}, -- Don Julio
            [15] = {1670.59, 1341.09, 146.48, 25.0}, -- O'Creaghs
            [16] = {-2581.66, -225.32, 170.62, 20.0}, -- Lake Owanjila
            [17] = {-198.71, -544.86, 42.94, 25.0}, -- South Flatneck Station Farm
		},
		potStageProps = {--Stage is calculated automaticaly from grow time
			/*STAGE   |   MODEL     |    TIME | HOW MUCH IN GROUND*/
			[1] = {"CRP_CARROTS_BA_SIM", 24, 0.0},
			[2] = {"CRP_CARROTS_BA_SIM", 16, 0.0},
			[3] = {"CRP_CARROTS_BA_SIM",  8, 0.0},
			[4] = {"CRP_CARROTS_BA_SIM", -1, 0.0},
			
			
			
		},
		weatherAffect = true,--If is rain -> automaticaly water herb
		growTime = 26,--300 min time without affecting temp
		temperatureSlow = -3,--If temperature is under -3 automaticaly slow grow
		temperatureGood = {-3, 30},--If temperature between this, herb grow normal
		temperatureHot = 30,--If temperature is bigger thjan 30 herb need more water (2x more)
		
		fertilizer = 0,--If you plant herb, how much have fertilize
		quality = 100,--If you plant herb, how much have quality
		procure = 100,--If you plant herb, how much have procure
		jerks = 0,--If you plant herb, how much have jerks

		gatherAnimation = {"mech_pickup@plant@yarrow","base", 3},--Animation for gather herb
		rewardItem = {--If you have disabled quality set [XX] to [0]
			[80] = {"carrot", 8},--Upper 80% to 100
			[50] = {"carrot", 6},--Upper 50% to 80
			[25] = {"carrot", 3},--Upper 25% to 50
			[0] = {"carrot", 1},--Upper 0% to 255
		},
	},

	["cottonseed"] = {--Item Seed ID
		enableHerbToSeed = false,--If you have enabeld after you use herb -> automaticaly get seeds
		multipleUse = false,--If you have enabled you can use herb and get input with "To seed" "Interact"
		multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount (multipleUse)
		herbToSeed = 3,--How much get from herb seeds
		herbName = "Cotton Plant",
		herbItem = "cotton",

		itIsTree = false,--Regrow system. Plant stay there but you can pick herb, and after again grow you an pick again. Good for apple trees etc.
		canPickAfterGrow = 0,--How much times from regrow system you can pick herb

		coordsLocks = {--If you want lock coords for plant herb
			[1] = {1060.07, -978.07, 70.86, 40.0}, -- Southfield Flats
            [2] = {1371.33, 496.79, 88, 35.0}, -- Emerald Ranch
            [3] = {-1428.04, -1140.91, 75.03, 35.0}, -- Blackwater  
            [4] = {2455.55, 869.01, 74.95, 35.0}, -- Elysian Pool 
            [5] = {2069.82, -308.16, 41.86, 25.0}, -- Swamp Shack
            [6] = {-1760.68, -2401.01, 42.68, 35.0}, -- Thieves Landing *********** no blip
            [7] = {1758.75, -2012.98, 44.24, 35.0}, -- Shady Belle Coast ********** no blip
            [8] = {-1429.78, 222.82, 100.36, 25.0}, -- south Wallace Station ********* no blip
            [9] = {3285.23, -563.71, 43.06, 35.0}, -- Sisika
            [10] = {-4396.13, -3874.86, -24.39, 25.0}, -- New Austin - San Luis River
            [11] = {-340.73, 18.31, 43.82, 25.0}, -- Limpany
            [12] = {2672.08, -778.71, 42.47, 25.0}, -- Saint Denis
            [13] = {1561.09, -7058.43, 85.04, 40.0}, -- Guarma
            [14] = {-3322.43, -3133.91, -3.54, 25.0}, -- Don Julio
            [15] = {1670.59, 1341.09, 146.48, 25.0}, -- O'Creaghs
            [16] = {-2581.66, -225.32, 170.62, 20.0}, -- Lake Owanjila
            [17] = {-198.71, -544.86, 42.94, 25.0}, -- South Flatneck Station Farm
		},
		potStageProps = {--Stage is calculated automaticaly from grow time
			/*STAGE   |   MODEL     |    TIME | HOW MUCH IN GROUND*/
			[1] = {"CRP_COTTON_BA_SIM", 24, 0.0},
			[2] = {"CRP_COTTON_BA_SIM", 16, 0.0},
			[3] = {"CRP_COTTON_BA_SIM",  8, 0.0},
			[4] = {"CRP_COTTON_BA_SIM", -1, 0.0},
			
			
			
		},
		weatherAffect = true,--If is rain -> automaticaly water herb
		growTime = 26,--300 min time without affecting temp
		temperatureSlow = -3,--If temperature is under -3 automaticaly slow grow
		temperatureGood = {-3, 30},--If temperature between this, herb grow normal
		temperatureHot = 30,--If temperature is bigger thjan 30 herb need more water (2x more)
		
		fertilizer = 0,--If you plant herb, how much have fertilize
		quality = 100,--If you plant herb, how much have quality
		procure = 100,--If you plant herb, how much have procure
		jerks = 0,--If you plant herb, how much have jerks

		gatherAnimation = {"mech_pickup@plant@yarrow","base", 3},--Animation for gather herb
		rewardItem = {--If you have disabled quality set [XX] to [0]
			[80] = {"cotton", 8},--Upper 80% to 100
			[50] = {"cotton", 6},--Upper 50% to 80
			[25] = {"cotton", 3},--Upper 25% to 50
			[0] = {"cotton", 1},--Upper 0% to 25
		},
	},

	["wheatseed"] = {--Item Seed ID
		enableHerbToSeed = false,--If you have enabeld after you use herb -> automaticaly get seeds
		multipleUse = false,--If you have enabled you can use herb and get input with "To seed" "Interact"
		multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount (multipleUse)
		herbToSeed = 3,--How much get from herb seeds
		herbName = "Wheat",
		herbItem = "wheat",

		itIsTree = false,--Regrow system. Plant stay there but you can pick herb, and after again grow you an pick again. Good for apple trees etc.
		canPickAfterGrow = 0,--How much times from regrow system you can pick herb

		coordsLocks = {--If you want lock coords for plant herb
			[1] = {1060.07, -978.07, 70.86, 40.0}, -- Southfield Flats
            [2] = {1371.33, 496.79, 88, 35.0}, -- Emerald Ranch
            [3] = {-1428.04, -1140.91, 75.03, 35.0}, -- Blackwater  
            [4] = {2455.55, 869.01, 74.95, 35.0}, -- Elysian Pool 
            [5] = {2069.82, -308.16, 41.86, 25.0}, -- Swamp Shack
            [6] = {-1760.68, -2401.01, 42.68, 35.0}, -- Thieves Landing *********** no blip
            [7] = {1758.75, -2012.98, 44.24, 35.0}, -- Shady Belle Coast ********** no blip
            [8] = {-1429.78, 222.82, 100.36, 25.0}, -- south Wallace Station ********* no blip
            [9] = {3285.23, -563.71, 43.06, 35.0}, -- Sisika
            [10] = {-4396.13, -3874.86, -24.39, 25.0}, -- New Austin - San Luis River
            [11] = {-340.73, 18.31, 43.82, 25.0}, -- Limpany
            [12] = {2672.08, -778.71, 42.47, 25.0}, -- Saint Denis
            [13] = {1561.09, -7058.43, 85.04, 40.0}, -- Guarma
            [14] = {-3322.43, -3133.91, -3.54, 25.0}, -- Don Julio
            [15] = {1670.59, 1341.09, 146.48, 25.0}, -- O'Creaghs
            [16] = {-2581.66, -225.32, 170.62, 20.0}, -- Lake Owanjila
            [17] = {-198.71, -544.86, 42.94, 25.0}, -- South Flatneck Station Farm
		},
		potStageProps = {--Stage is calculated automaticaly from grow time
			/*STAGE   |   MODEL     |    TIME | HOW MUCH IN GROUND*/
			[1] = {"crp_wheat_dry_aa_sim", 24, 0.0},
			[2] = {"crp_wheat_dry_aa_sim", 16, 0.0},
			[3] = {"crp_wheat_dry_aa_sim",  8, 0.0},
			[4] = {"crp_wheat_dry_aa_sim", -1, 0.0},
			
			
			
		},
		weatherAffect = true,--If is rain -> automaticaly water herb
		growTime = 26,--300 min time without affecting temp
		temperatureSlow = -3,--If temperature is under -3 automaticaly slow grow
		temperatureGood = {-3, 30},--If temperature between this, herb grow normal
		temperatureHot = 30,--If temperature is bigger thjan 30 herb need more water (2x more)
		
		fertilizer = 0,--If you plant herb, how much have fertilize
		quality = 100,--If you plant herb, how much have quality
		procure = 100,--If you plant herb, how much have procure
		jerks = 0,--If you plant herb, how much have jerks

		gatherAnimation = {"mech_pickup@plant@yarrow","base", 3},--Animation for gather herb
		rewardItem = {--If you have disabled quality set [XX] to [0]
			[80] = {"wheat", 8},--Upper 80% to 100
			[50] = {"wheat", 6},--Upper 50% to 80
			[25] = {"wheat", 3},--Upper 25% to 50
			[0] = {"wheat", 1},--Upper 0% to 25
		},
	},

	["broccoliseed"] = {--Item Seed ID
		enableHerbToSeed = false,--If you have enabeld after you use herb -> automaticaly get seeds
		multipleUse = false,--If you have enabled you can use herb and get input with "To seed" "Interact"
		multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount (multipleUse)
		herbToSeed = 3,--How much get from herb seeds
		herbName = "Broccoli",
		herbItem = "broccoli",

		itIsTree = false,--Regrow system. Plant stay there but you can pick herb, and after again grow you an pick again. Good for apple trees etc.
		canPickAfterGrow = 0,--How much times from regrow system you can pick herb

		coordsLocks = {--If you want lock coords for plant herb
			[1] = {1060.07, -978.07, 70.86, 40.0}, -- Southfield Flats
            [2] = {1371.33, 496.79, 88, 35.0}, -- Emerald Ranch
            [3] = {-1428.04, -1140.91, 75.03, 35.0}, -- Blackwater  
            [4] = {2455.55, 869.01, 74.95, 35.0}, -- Elysian Pool 
            [5] = {2069.82, -308.16, 41.86, 25.0}, -- Swamp Shack
            [6] = {-1760.68, -2401.01, 42.68, 35.0}, -- Thieves Landing *********** no blip
            [7] = {1758.75, -2012.98, 44.24, 35.0}, -- Shady Belle Coast ********** no blip
            [8] = {-1429.78, 222.82, 100.36, 25.0}, -- south Wallace Station ********* no blip
            [9] = {3285.23, -563.71, 43.06, 35.0}, -- Sisika
            [10] = {-4396.13, -3874.86, -24.39, 25.0}, -- New Austin - San Luis River
            [11] = {-340.73, 18.31, 43.82, 25.0}, -- Limpany
            [12] = {2672.08, -778.71, 42.47, 25.0}, -- Saint Denis
            [13] = {1561.09, -7058.43, 85.04, 40.0}, -- Guarma
            [14] = {-3322.43, -3133.91, -3.54, 25.0}, -- Don Julio
            [15] = {1670.59, 1341.09, 146.48, 25.0}, -- O'Creaghs
            [16] = {-2581.66, -225.32, 170.62, 20.0}, -- Lake Owanjila
            [17] = {-198.71, -544.86, 42.94, 25.0}, -- South Flatneck Station Farm
		},
		potStageProps = {--Stage is calculated automaticaly from grow time
			/*STAGE   |   MODEL     |    TIME | HOW MUCH IN GROUND*/
			[1] = {"CRP_BROCCOLI_AA_SIM", 24, 0.0},
			[2] = {"CRP_BROCCOLI_AA_SIM", 16, 0.0},
			[3] = {"CRP_BROCCOLI_AA_SIM",  8, 0.0},
			[4] = {"CRP_BROCCOLI_AA_SIM", -1, 0.0},
			
			
			
		},
		weatherAffect = true,--If is rain -> automaticaly water herb
		growTime = 26,--300 min time without affecting temp
		temperatureSlow = -3,--If temperature is under -3 automaticaly slow grow
		temperatureGood = {-3, 30},--If temperature between this, herb grow normal
		temperatureHot = 30,--If temperature is bigger thjan 30 herb need more water (2x more)
		
		fertilizer = 0,--If you plant herb, how much have fertilize
		quality = 100,--If you plant herb, how much have quality
		procure = 100,--If you plant herb, how much have procure
		jerks = 0,--If you plant herb, how much have jerks

		gatherAnimation = {"mech_pickup@plant@yarrow","base", 3},--Animation for gather herb
		rewardItem = {--If you have disabled quality set [XX] to [0]
			[80] = {"broccoli", 8},--Upper 80% to 100
			[50] = {"broccoli", 6},--Upper 50% to 80
			[25] = {"broccoli", 3},--Upper 25% to 50
			[0] = {"broccoli", 1},--Upper 0% to 25
		},
	},

	["lettuceseed"] = {--Item Seed ID
		enableHerbToSeed = false,--If you have enabeld after you use herb -> automaticaly get seeds
		multipleUse = false,--If you have enabled you can use herb and get input with "To seed" "Interact"
		multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount (multipleUse)
		herbToSeed = 3,--How much get from herb seeds
		herbName = "Lettuce",
		herbItem = "lettuce",

		itIsTree = false,--Regrow system. Plant stay there but you can pick herb, and after again grow you an pick again. Good for apple trees etc.
		canPickAfterGrow = 0,--How much times from regrow system you can pick herb

		coordsLocks = {--If you want lock coords for plant herb
			[1] = {1060.07, -978.07, 70.86, 40.0}, -- Southfield Flats
            [2] = {1371.33, 496.79, 88, 35.0}, -- Emerald Ranch
            [3] = {-1428.04, -1140.91, 75.03, 35.0}, -- Blackwater  
            [4] = {2455.55, 869.01, 74.95, 35.0}, -- Elysian Pool 
            [5] = {2069.82, -308.16, 41.86, 25.0}, -- Swamp Shack
            [6] = {-1760.68, -2401.01, 42.68, 35.0}, -- Thieves Landing *********** no blip
            [7] = {1758.75, -2012.98, 44.24, 35.0}, -- Shady Belle Coast ********** no blip
            [8] = {-1429.78, 222.82, 100.36, 25.0}, -- south Wallace Station ********* no blip
            [9] = {3285.23, -563.71, 43.06, 35.0}, -- Sisika
            [10] = {-4396.13, -3874.86, -24.39, 25.0}, -- New Austin - San Luis River
            [11] = {-340.73, 18.31, 43.82, 25.0}, -- Limpany
            [12] = {2672.08, -778.71, 42.47, 25.0}, -- Saint Denis
            [13] = {1561.09, -7058.43, 85.04, 40.0}, -- Guarma
            [14] = {-3322.43, -3133.91, -3.54, 25.0}, -- Don Julio
            [15] = {1670.59, 1341.09, 146.48, 25.0}, -- O'Creaghs
            [16] = {-2581.66, -225.32, 170.62, 20.0}, -- Lake Owanjila
            [17] = {-198.71, -544.86, 42.94, 25.0}, -- South Flatneck Station Farm
		},
		potStageProps = {--Stage is calculated automaticaly from grow time
			/*STAGE   |   MODEL     |    TIME | HOW MUCH IN GROUND*/
			[1] = {"crp_lettuce_aa_sim", 24, 0.0},
			[2] = {"crp_lettuce_aa_sim", 16, 0.0},
			[3] = {"crp_lettuce_aa_sim",  8, 0.0},
			[4] = {"crp_lettuce_aa_sim", -1, 0.0},
			
			
			
		},
		weatherAffect = true,--If is rain -> automaticaly water herb
		growTime = 26,--300 min time without affecting temp
		temperatureSlow = -3,--If temperature is under -3 automaticaly slow grow
		temperatureGood = {-3, 30},--If temperature between this, herb grow normal
		temperatureHot = 30,--If temperature is bigger thjan 30 herb need more water (2x more)
		
		fertilizer = 0,--If you plant herb, how much have fertilize
		quality = 100,--If you plant herb, how much have quality
		procure = 100,--If you plant herb, how much have procure
		jerks = 0,--If you plant herb, how much have jerks

		gatherAnimation = {"mech_pickup@plant@yarrow","base", 3},--Animation for gather herb
		rewardItem = {--If you have disabled quality set [XX] to [0]
			[80] = {"lettuce", 8},--Upper 80% to 100
			[50] = {"lettuce", 6},--Upper 50% to 80
			[25] = {"lettuce", 3},--Upper 25% to 50
			[0] = {"lettuce", 1},--Upper 0% to 25
		},
	},

	["potatoseed"] = {--Item Seed ID
		enableHerbToSeed = false,--If you have enabeld after you use herb -> automaticaly get seeds
		multipleUse = false,--If you have enabled you can use herb and get input with "To seed" "Interact"
		multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount (multipleUse)
		herbToSeed = 3,--How much get from herb seeds
		herbName = "Potatoes",
		herbItem = "potato",

		itIsTree = false,--Regrow system. Plant stay there but you can pick herb, and after again grow you an pick again. Good for apple trees etc.
		canPickAfterGrow = 0,--How much times from regrow system you can pick herb

		coordsLocks = {--If you want lock coords for plant herb
			[1] = {1060.07, -978.07, 70.86, 40.0}, -- Southfield Flats
            [2] = {1371.33, 496.79, 88, 35.0}, -- Emerald Ranch
            [3] = {-1428.04, -1140.91, 75.03, 35.0}, -- Blackwater  
            [4] = {2455.55, 869.01, 74.95, 35.0}, -- Elysian Pool 
            [5] = {2069.82, -308.16, 41.86, 25.0}, -- Swamp Shack
            [6] = {-1760.68, -2401.01, 42.68, 35.0}, -- Thieves Landing *********** no blip
            [7] = {1758.75, -2012.98, 44.24, 35.0}, -- Shady Belle Coast ********** no blip
            [8] = {-1429.78, 222.82, 100.36, 25.0}, -- south Wallace Station ********* no blip
            [9] = {3285.23, -563.71, 43.06, 35.0}, -- Sisika
            [10] = {-4396.13, -3874.86, -24.39, 25.0}, -- New Austin - San Luis River
            [11] = {-340.73, 18.31, 43.82, 25.0}, -- Limpany
            [12] = {2672.08, -778.71, 42.47, 25.0}, -- Saint Denis
            [13] = {1561.09, -7058.43, 85.04, 40.0}, -- Guarma
            [14] = {-3322.43, -3133.91, -3.54, 25.0}, -- Don Julio
            [15] = {1670.59, 1341.09, 146.48, 25.0}, -- O'Creaghs
            [16] = {-2581.66, -225.32, 170.62, 20.0}, -- Lake Owanjila
            [17] = {-198.71, -544.86, 42.94, 25.0}, -- South Flatneck Station Farm
		},
		potStageProps = {--Stage is calculated automaticaly from grow time
			/*STAGE   |   MODEL     |    TIME | HOW MUCH IN GROUND*/
			[1] = {"crp_potato_aa_sim", 24, 0.0},
			[2] = {"crp_potato_aa_sim", 16, 0.0},
			[3] = {"crp_potato_aa_sim",  8, 0.0},
			[4] = {"crp_potato_aa_sim", -1, 0.0},
			
			
			
		},
		weatherAffect = true,--If is rain -> automaticaly water herb
		growTime = 26,--300 min time without affecting temp
		temperatureSlow = -3,--If temperature is under -3 automaticaly slow grow
		temperatureGood = {-3, 30},--If temperature between this, herb grow normal
		temperatureHot = 30,--If temperature is bigger thjan 30 herb need more water (2x more)
		
		fertilizer = 0,--If you plant herb, how much have fertilize
		quality = 100,--If you plant herb, how much have quality
		procure = 100,--If you plant herb, how much have procure
		jerks = 0,--If you plant herb, how much have jerks

		gatherAnimation = {"mech_pickup@plant@yarrow","base", 3},--Animation for gather herb
		rewardItem = {--If you have disabled quality set [XX] to [0]
			[80] = {"potato", 8},--Upper 80% to 100
			[50] = {"potato", 6},--Upper 50% to 80
			[25] = {"potato", 3},--Upper 25% to 50
			[0] = {"potato", 1},--Upper 0% to 25
		},
	},

	["onionseed"] = {--Item Seed ID
		enableHerbToSeed = false,--If you have enabeld after you use herb -> automaticaly get seeds
		multipleUse = false,--If you have enabled you can use herb and get input with "To seed" "Interact"
		multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount (multipleUse)
		herbToSeed = 3,--How much get from herb seeds
		herbName = "Onions",
		herbItem = "onion",

		itIsTree = false,--Regrow system. Plant stay there but you can pick herb, and after again grow you an pick again. Good for apple trees etc.
		canPickAfterGrow = 0,--How much times from regrow system you can pick herb

		coordsLocks = {--If you want lock coords for plant herb
			[1] = {1060.07, -978.07, 70.86, 40.0}, -- Southfield Flats
            [2] = {1371.33, 496.79, 88, 35.0}, -- Emerald Ranch
            [3] = {-1428.04, -1140.91, 75.03, 35.0}, -- Blackwater  
            [4] = {2455.55, 869.01, 74.95, 35.0}, -- Elysian Pool 
            [5] = {2069.82, -308.16, 41.86, 25.0}, -- Swamp Shack
            [6] = {-1760.68, -2401.01, 42.68, 35.0}, -- Thieves Landing *********** no blip
            [7] = {1758.75, -2012.98, 44.24, 35.0}, -- Shady Belle Coast ********** no blip
            [8] = {-1429.78, 222.82, 100.36, 25.0}, -- south Wallace Station ********* no blip
            [9] = {3285.23, -563.71, 43.06, 35.0}, -- Sisika
            [10] = {-4396.13, -3874.86, -24.39, 25.0}, -- New Austin - San Luis River
            [11] = {-340.73, 18.31, 43.82, 25.0}, -- Limpany
            [12] = {2672.08, -778.71, 42.47, 25.0}, -- Saint Denis
            [13] = {1561.09, -7058.43, 85.04, 40.0}, -- Guarma
            [14] = {-3322.43, -3133.91, -3.54, 25.0}, -- Don Julio
            [15] = {1670.59, 1341.09, 146.48, 25.0}, -- O'Creaghs
            [16] = {-2581.66, -225.32, 170.62, 20.0}, -- Lake Owanjila
            [17] = {-198.71, -544.86, 42.94, 25.0}, -- South Flatneck Station Farm
		},
		potStageProps = {--Stage is calculated automaticaly from grow time
			/*STAGE   |   MODEL     |    TIME | HOW MUCH IN GROUND*/
			[1] = {"leek_plant", 24, 0.0},
			[2] = {"leek_plant", 16, 0.0},
			[3] = {"leek_plant",  8, 0.0},
			[4] = {"leek_plant", -1, 0.0},
			
			
			
		},
		weatherAffect = true,--If is rain -> automaticaly water herb
		growTime = 26,--300 min time without affecting temp
		temperatureSlow = -3,--If temperature is under -3 automaticaly slow grow
		temperatureGood = {-3, 30},--If temperature between this, herb grow normal
		temperatureHot = 30,--If temperature is bigger thjan 30 herb need more water (2x more)
		
		fertilizer = 0,--If you plant herb, how much have fertilize
		quality = 100,--If you plant herb, how much have quality
		procure = 100,--If you plant herb, how much have procure
		jerks = 0,--If you plant herb, how much have jerks

		gatherAnimation = {"mech_pickup@plant@yarrow","base", 3},--Animation for gather herb
		rewardItem = {--If you have disabled quality set [XX] to [0]
			[80] = {"onion", 8},--Upper 80% to 100
			[50] = {"onion", 6},--Upper 50% to 80
			[25] = {"onion", 3},--Upper 25% to 50
			[0] = {"onion", 1},--Upper 0% to 25
		},
	},

	["tomatoseed"] = {--Item Seed ID
		enableHerbToSeed = false,--If you have enabeld after you use herb -> automaticaly get seeds
		multipleUse = false,--If you have enabled you can use herb and get input with "To seed" "Interact"
		multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount (multipleUse)
		herbToSeed = 3,--How much get from herb seeds
		herbName = "Tomato Plants",
		herbItem = "tomato",

		itIsTree = false,--Regrow system. Plant stay there but you can pick herb, and after again grow you an pick again. Good for apple trees etc.
		canPickAfterGrow = 0,--How much times from regrow system you can pick herb

		coordsLocks = {--If you want lock coords for plant herb
			[1] = {1060.07, -978.07, 70.86, 40.0}, -- Southfield Flats
            [2] = {1371.33, 496.79, 88, 35.0}, -- Emerald Ranch
            [3] = {-1428.04, -1140.91, 75.03, 35.0}, -- Blackwater  
            [4] = {2455.55, 869.01, 74.95, 35.0}, -- Elysian Pool 
            [5] = {2069.82, -308.16, 41.86, 25.0}, -- Swamp Shack
            [6] = {-1760.68, -2401.01, 42.68, 35.0}, -- Thieves Landing *********** no blip
            [7] = {1758.75, -2012.98, 44.24, 35.0}, -- Shady Belle Coast ********** no blip
            [8] = {-1429.78, 222.82, 100.36, 25.0}, -- south Wallace Station ********* no blip
            [9] = {3285.23, -563.71, 43.06, 35.0}, -- Sisika
            [10] = {-4396.13, -3874.86, -24.39, 25.0}, -- New Austin - San Luis River
            [11] = {-340.73, 18.31, 43.82, 25.0}, -- Limpany
            [12] = {2672.08, -778.71, 42.47, 25.0}, -- Saint Denis
            [13] = {1561.09, -7058.43, 85.04, 40.0}, -- Guarma
            [14] = {-3322.43, -3133.91, -3.54, 25.0}, -- Don Julio
            [15] = {1670.59, 1341.09, 146.48, 25.0}, -- O'Creaghs
            [16] = {-2581.66, -225.32, 170.62, 20.0}, -- Lake Owanjila
            [17] = {-198.71, -544.86, 42.94, 25.0}, -- South Flatneck Station Farm
		},
		potStageProps = {--Stage is calculated automaticaly from grow time
			/*STAGE   |   MODEL     |    TIME | HOW MUCH IN GROUND*/
			[1] = {"crp_tomatoes_aa_sim", 24, 0.0},
			[2] = {"crp_tomatoes_aa_sim", 16, 0.0},
			[3] = {"crp_tomatoes_aa_sim",  8, 0.0},
			[4] = {"crp_tomatoes_aa_sim", -1, 0.0},
			
			
			
		},
		weatherAffect = true,--If is rain -> automaticaly water herb
		growTime = 26,--300 min time without affecting temp
		temperatureSlow = -3,--If temperature is under -3 automaticaly slow grow
		temperatureGood = {-3, 30},--If temperature between this, herb grow normal
		temperatureHot = 30,--If temperature is bigger thjan 30 herb need more water (2x more)
		
		fertilizer = 0,--If you plant herb, how much have fertilize
		quality = 100,--If you plant herb, how much have quality
		procure = 100,--If you plant herb, how much have procure
		jerks = 0,--If you plant herb, how much have jerks

		gatherAnimation = {"mech_pickup@plant@yarrow","base", 3},--Animation for gather herb
		rewardItem = {--If you have disabled quality set [XX] to [0]
			[80] = {"tomato", 8},--Upper 80% to 100
			[50] = {"tomato", 6},--Upper 50% to 80
			[25] = {"tomato", 3},--Upper 25% to 50
			[0] = {"tomato", 1},--Upper 0% to 25
		},
	},

	["beanseed"] = {--Item Seed ID
		enableHerbToSeed = false,--If you have enabeld after you use herb -> automaticaly get seeds
		multipleUse = false,--If you have enabled you can use herb and get input with "To seed" "Interact"
		multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount (multipleUse)
		herbToSeed = 3,--How much get from herb seeds
		herbName = "Beans",
		herbItem = "bean",

		itIsTree = false,--Regrow system. Plant stay there but you can pick herb, and after again grow you an pick again. Good for apple trees etc.
		canPickAfterGrow = 0,--How much times from regrow system you can pick herb

		coordsLocks = {--If you want lock coords for plant herb
			[1] = {1060.07, -978.07, 70.86, 40.0}, -- Southfield Flats
            [2] = {1371.33, 496.79, 88, 35.0}, -- Emerald Ranch
            [3] = {-1428.04, -1140.91, 75.03, 35.0}, -- Blackwater  
            [4] = {2455.55, 869.01, 74.95, 35.0}, -- Elysian Pool 
            [5] = {2069.82, -308.16, 41.86, 25.0}, -- Swamp Shack
            [6] = {-1760.68, -2401.01, 42.68, 35.0}, -- Thieves Landing *********** no blip
            [7] = {1758.75, -2012.98, 44.24, 35.0}, -- Shady Belle Coast ********** no blip
            [8] = {-1429.78, 222.82, 100.36, 25.0}, -- south Wallace Station ********* no blip
            [9] = {3285.23, -563.71, 43.06, 35.0}, -- Sisika
            [10] = {-4396.13, -3874.86, -24.39, 25.0}, -- New Austin - San Luis River
            [11] = {-340.73, 18.31, 43.82, 25.0}, -- Limpany
            [12] = {2672.08, -778.71, 42.47, 25.0}, -- Saint Denis
            [13] = {1561.09, -7058.43, 85.04, 40.0}, -- Guarma
            [14] = {-3322.43, -3133.91, -3.54, 25.0}, -- Don Julio
            [15] = {1670.59, 1341.09, 146.48, 25.0}, -- O'Creaghs
            [16] = {-2581.66, -225.32, 170.62, 20.0}, -- Lake Owanjila
            [17] = {-198.71, -544.86, 42.94, 25.0}, -- South Flatneck Station Farm
		},
		potStageProps = {--Stage is calculated automaticaly from grow time
			/*STAGE   |   MODEL     |    TIME | HOW MUCH IN GROUND*/
			[1] = {"crp_tobaccoplant_ba_sim", 24, 0.0},
			[2] = {"crp_tobaccoplant_ba_sim", 16, 0.0},
			[3] = {"crp_tobaccoplant_ba_sim",  8, 0.0},
			[4] = {"crp_tobaccoplant_ba_sim", -1, 0.0},
			
			
			
		},
		weatherAffect = true,--If is rain -> automaticaly water herb
		growTime = 26,--300 min time without affecting temp
		temperatureSlow = -3,--If temperature is under -3 automaticaly slow grow
		temperatureGood = {-3, 30},--If temperature between this, herb grow normal
		temperatureHot = 30,--If temperature is bigger thjan 30 herb need more water (2x more)
		
		fertilizer = 0,--If you plant herb, how much have fertilize
		quality = 100,--If you plant herb, how much have quality
		procure = 100,--If you plant herb, how much have procure
		jerks = 0,--If you plant herb, how much have jerks

		gatherAnimation = {"mech_pickup@plant@yarrow","base", 3},--Animation for gather herb
		rewardItem = {--If you have disabled quality set [XX] to [0]
			[80] = {"bean", 8},--Upper 80% to 100
			[50] = {"bean", 6},--Upper 50% to 80
			[25] = {"bean", 3},--Upper 25% to 50
			[0] = {"bean", 1},--Upper 0% to 25
		},
	},

	["oreganoseed"] = {--Item Seed ID
		enableHerbToSeed = false,--If you have enabeld after you use herb -> automaticaly get seeds
		multipleUse = false,--If you have enabled you can use herb and get input with "To seed" "Interact"
		multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount (multipleUse)
		herbToSeed = 3,--How much get from herb seeds
		herbName = "Oregano",
		herbItem = "oregano",

		itIsTree = false,--Regrow system. Plant stay there but you can pick herb, and after again grow you an pick again. Good for apple trees etc.
		canPickAfterGrow = 0,--How much times from regrow system you can pick herb

		coordsLocks = {--If you want lock coords for plant herb
			[1] = {1060.07, -978.07, 70.86, 40.0}, -- Southfield Flats
            [2] = {1371.33, 496.79, 88, 35.0}, -- Emerald Ranch
            [3] = {-1428.04, -1140.91, 75.03, 35.0}, -- Blackwater  
            [4] = {2455.55, 869.01, 74.95, 35.0}, -- Elysian Pool 
            [5] = {2069.82, -308.16, 41.86, 25.0}, -- Swamp Shack
            [6] = {-1760.68, -2401.01, 42.68, 35.0}, -- Thieves Landing *********** no blip
            [7] = {1758.75, -2012.98, 44.24, 35.0}, -- Shady Belle Coast ********** no blip
            [8] = {-1429.78, 222.82, 100.36, 25.0}, -- south Wallace Station ********* no blip
            [9] = {3285.23, -563.71, 43.06, 35.0}, -- Sisika
            [10] = {-4396.13, -3874.86, -24.39, 25.0}, -- New Austin - San Luis River
            [11] = {-340.73, 18.31, 43.82, 25.0}, -- Limpany
            [12] = {2672.08, -778.71, 42.47, 25.0}, -- Saint Denis
            [13] = {1561.09, -7058.43, 85.04, 40.0}, -- Guarma
            [14] = {-3322.43, -3133.91, -3.54, 25.0}, -- Don Julio
            [15] = {1670.59, 1341.09, 146.48, 25.0}, -- O'Creaghs
            [16] = {-2581.66, -225.32, 170.62, 20.0}, -- Lake Owanjila
            [17] = {-198.71, -544.86, 42.94, 25.0}, -- South Flatneck Station Farm
		},
		potStageProps = {--Stage is calculated automaticaly from grow time
			/*STAGE   |   MODEL     |    TIME | HOW MUCH IN GROUND*/
			[1] = {"oregano_p", 24, 0.0},
			[2] = {"oregano_p", 16, 0.0},
			[3] = {"oregano_p",  8, 0.0},
			[4] = {"oregano_p", -1, 0.0},
			
			
			
		},
		weatherAffect = true,--If is rain -> automaticaly water herb
		growTime = 26,--300 min time without affecting temp
		temperatureSlow = -3,--If temperature is under -3 automaticaly slow grow
		temperatureGood = {-3, 30},--If temperature between this, herb grow normal
		temperatureHot = 30,--If temperature is bigger thjan 30 herb need more water (2x more)
		
		fertilizer = 0,--If you plant herb, how much have fertilize
		quality = 100,--If you plant herb, how much have quality
		procure = 100,--If you plant herb, how much have procure
		jerks = 0,--If you plant herb, how much have jerks

		gatherAnimation = {"mech_pickup@plant@yarrow","base", 3},--Animation for gather herb
		rewardItem = {--If you have disabled quality set [XX] to [0]
			[80] = {"oregano", 8},--Upper 80% to 100
			[50] = {"oregano", 6},--Upper 50% to 80
			[25] = {"oregano", 3},--Upper 25% to 50
			[0] = {"oregano", 1},--Upper 0% to 25
		},
	},


	["chilipepperseed"] = {--Item Seed ID
		enableHerbToSeed = false,--If you have enabeld after you use herb -> automaticaly get seeds
		multipleUse = false,--If you have enabled you can use herb and get input with "To seed" "Interact"
		multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount (multipleUse)
		herbToSeed = 3,--How much get from herb seeds
		herbName = "Chili Pepper Plant",
		herbItem = "chilipepper",

		itIsTree = false,--Regrow system. Plant stay there but you can pick herb, and after again grow you an pick again. Good for apple trees etc.
		canPickAfterGrow = 0,--How much times from regrow system you can pick herb

		coordsLocks = {--If you want lock coords for plant herb
			[1] = {1060.07, -978.07, 70.86, 40.0}, -- Southfield Flats
            [2] = {1371.33, 496.79, 88, 35.0}, -- Emerald Ranch
            [3] = {-1428.04, -1140.91, 75.03, 35.0}, -- Blackwater  
            [4] = {2455.55, 869.01, 74.95, 35.0}, -- Elysian Pool 
            [5] = {2069.82, -308.16, 41.86, 25.0}, -- Swamp Shack
            [6] = {-1760.68, -2401.01, 42.68, 35.0}, -- Thieves Landing *********** no blip
            [7] = {1758.75, -2012.98, 44.24, 35.0}, -- Shady Belle Coast ********** no blip
            [8] = {-1429.78, 222.82, 100.36, 25.0}, -- south Wallace Station ********* no blip
            [9] = {3285.23, -563.71, 43.06, 35.0}, -- Sisika
            [10] = {-4396.13, -3874.86, -24.39, 25.0}, -- New Austin - San Luis River
            [11] = {-340.73, 18.31, 43.82, 25.0}, -- Limpany
            [12] = {2672.08, -778.71, 42.47, 25.0}, -- Saint Denis
            [13] = {1561.09, -7058.43, 85.04, 40.0}, -- Guarma
            [14] = {-3322.43, -3133.91, -3.54, 25.0}, -- Don Julio
            [15] = {1670.59, 1341.09, 146.48, 25.0}, -- O'Creaghs
            [16] = {-2581.66, -225.32, 170.62, 20.0}, -- Lake Owanjila
            [17] = {-198.71, -544.86, 42.94, 25.0}, -- South Flatneck Station Farm
		},
		potStageProps = {--Stage is calculated automaticaly from grow time
			/*STAGE   |   MODEL     |    TIME | HOW MUCH IN GROUND*/
			[1] = {"crp_tomatoes_har_aa_sim", 24, 0.0},
			[2] = {"crp_tomatoes_har_aa_sim", 16, 0.0},
			[3] = {"crp_tomatoes_har_aa_sim",  8, 0.0},
			[4] = {"crp_tomatoes_har_aa_sim", -1, 0.0},
			
			
			
		},
		weatherAffect = true,--If is rain -> automaticaly water herb
		growTime = 26,--300 min time without affecting temp
		temperatureSlow = -3,--If temperature is under -3 automaticaly slow grow
		temperatureGood = {-3, 30},--If temperature between this, herb grow normal
		temperatureHot = 30,--If temperature is bigger thjan 30 herb need more water (2x more)
		
		fertilizer = 0,--If you plant herb, how much have fertilize
		quality = 100,--If you plant herb, how much have quality
		procure = 100,--If you plant herb, how much have procure
		jerks = 0,--If you plant herb, how much have jerks

		gatherAnimation = {"mech_pickup@plant@yarrow","base", 3},--Animation for gather herb
		rewardItem = {--If you have disabled quality set [XX] to [0]
			[80] = {"chilipepper", 8},--Upper 80% to 100
			[50] = {"chilipepper", 6},--Upper 50% to 80
			[25] = {"chilipepper", 3},--Upper 25% to 50
			[0] = {"chilipepper", 1},--Upper 0% to 25
		},
	},

	["sageseed"] = {--Item Seed ID
		enableHerbToSeed = false,--If you have enabeld after you use herb -> automaticaly get seeds
		multipleUse = false,--If you have enabled you can use herb and get input with "To seed" "Interact"
		multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount (multipleUse)
		herbToSeed = 3,--How much get from herb seeds
		herbName = "Hummingbird Sage",
		herbItem = "sage",

		itIsTree = false,--Regrow system. Plant stay there but you can pick herb, and after again grow you an pick again. Good for apple trees etc.
		canPickAfterGrow = 0,--How much times from regrow system you can pick herb

		coordsLocks = {--If you want lock coords for plant herb
			[1] = {1060.07, -978.07, 70.86, 40.0}, -- Southfield Flats
            [2] = {1371.33, 496.79, 88, 35.0}, -- Emerald Ranch
            [3] = {-1428.04, -1140.91, 75.03, 35.0}, -- Blackwater  
            [4] = {2455.55, 869.01, 74.95, 35.0}, -- Elysian Pool 
            [5] = {2069.82, -308.16, 41.86, 25.0}, -- Swamp Shack
            [6] = {-1760.68, -2401.01, 42.68, 35.0}, -- Thieves Landing *********** no blip
            [7] = {1758.75, -2012.98, 44.24, 35.0}, -- Shady Belle Coast ********** no blip
            [8] = {-1429.78, 222.82, 100.36, 25.0}, -- south Wallace Station ********* no blip
            [9] = {3285.23, -563.71, 43.06, 35.0}, -- Sisika
            [10] = {-4396.13, -3874.86, -24.39, 25.0}, -- New Austin - San Luis River
            [11] = {-340.73, 18.31, 43.82, 25.0}, -- Limpany
            [12] = {2672.08, -778.71, 42.47, 25.0}, -- Saint Denis
            [13] = {1561.09, -7058.43, 85.04, 40.0}, -- Guarma
            [14] = {-3322.43, -3133.91, -3.54, 25.0}, -- Don Julio
            [15] = {1670.59, 1341.09, 146.48, 25.0}, -- O'Creaghs
            [16] = {-2581.66, -225.32, 170.62, 20.0}, -- Lake Owanjila
            [17] = {-198.71, -544.86, 42.94, 25.0}, -- South Flatneck Station Farm
		},
		potStageProps = {--Stage is calculated automaticaly from grow time
			/*STAGE   |   MODEL     |    TIME | HOW MUCH IN GROUND*/
			[1] = {"s_hummingbirdsagepicked01x", 24, 0.0},
			[2] = {"s_hummingbirdsagepicked01x", 16, 0.0},
			[3] = {"s_hummingbirdsagepicked01x",  8, 0.0},
			[4] = {"s_hummingbirdsagepicked01x", -1, 0.0},
			
			
			
		},
		weatherAffect = true,--If is rain -> automaticaly water herb
		growTime = 26,--300 min time without affecting temp
		temperatureSlow = -3,--If temperature is under -3 automaticaly slow grow
		temperatureGood = {-3, 30},--If temperature between this, herb grow normal
		temperatureHot = 30,--If temperature is bigger thjan 30 herb need more water (2x more)
		
		fertilizer = 0,--If you plant herb, how much have fertilize
		quality = 100,--If you plant herb, how much have quality
		procure = 100,--If you plant herb, how much have procure
		jerks = 0,--If you plant herb, how much have jerks

		gatherAnimation = {"mech_pickup@plant@yarrow","base", 3},--Animation for gather herb
		rewardItem = {--If you have disabled quality set [XX] to [0]
			[80] = {"sage", 8},--Upper 80% to 100
			[50] = {"sage", 6},--Upper 50% to 80
			[25] = {"sage", 3},--Upper 25% to 50
			[0] = {"sage", 1},--Upper 0% to 25
		},
	},

	["pepperseed"] = {--Item Seed ID
		enableHerbToSeed = false,--If you have enabeld after you use herb -> automaticaly get seeds
		multipleUse = false,--If you have enabled you can use herb and get input with "To seed" "Interact"
		multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount (multipleUse)
		herbToSeed = 3,--How much get from herb seeds
		herbName = "Peppers",
		herbItem = "pepper",

		itIsTree = false,--Regrow system. Plant stay there but you can pick herb, and after again grow you an pick again. Good for apple trees etc.
		canPickAfterGrow = 0,--How much times from regrow system you can pick herb

		coordsLocks = {--If you want lock coords for plant herb
			[1] = {1060.07, -978.07, 70.86, 40.0}, -- Southfield Flats
            [2] = {1371.33, 496.79, 88, 35.0}, -- Emerald Ranch
            [3] = {-1428.04, -1140.91, 75.03, 35.0}, -- Blackwater  
            [4] = {2455.55, 869.01, 74.95, 35.0}, -- Elysian Pool 
            [5] = {2069.82, -308.16, 41.86, 25.0}, -- Swamp Shack
            [6] = {-1760.68, -2401.01, 42.68, 35.0}, -- Thieves Landing *********** no blip
            [7] = {1758.75, -2012.98, 44.24, 35.0}, -- Shady Belle Coast ********** no blip
            [8] = {-1429.78, 222.82, 100.36, 25.0}, -- south Wallace Station ********* no blip
            [9] = {3285.23, -563.71, 43.06, 35.0}, -- Sisika
            [10] = {-4396.13, -3874.86, -24.39, 25.0}, -- New Austin - San Luis River
            [11] = {-340.73, 18.31, 43.82, 25.0}, -- Limpany
            [12] = {2672.08, -778.71, 42.47, 25.0}, -- Saint Denis
            [13] = {1561.09, -7058.43, 85.04, 40.0}, -- Guarma
            [14] = {-3322.43, -3133.91, -3.54, 25.0}, -- Don Julio
            [15] = {1670.59, 1341.09, 146.48, 25.0}, -- O'Creaghs
            [16] = {-2581.66, -225.32, 170.62, 20.0}, -- Lake Owanjila
            [17] = {-198.71, -544.86, 42.94, 25.0}, -- South Flatneck Station Farm
		},
		potStageProps = {--Stage is calculated automaticaly from grow time
			/*STAGE   |   MODEL     |    TIME | HOW MUCH IN GROUND*/
			[1] = {"s_inv_redsage01dx", 24, 0.0},
			[2] = {"s_inv_redsage01dx", 16, 0.0},
			[3] = {"s_inv_redsage01dx",  8, 0.0},
			[4] = {"s_inv_redsage01dx", -1, 0.0},
			
			
			
		},
		weatherAffect = true,--If is rain -> automaticaly water herb
		growTime = 26,--300 min time without affecting temp
		temperatureSlow = -3,--If temperature is under -3 automaticaly slow grow
		temperatureGood = {-3, 30},--If temperature between this, herb grow normal
		temperatureHot = 30,--If temperature is bigger thjan 30 herb need more water (2x more)
		
		fertilizer = 0,--If you plant herb, how much have fertilize
		quality = 100,--If you plant herb, how much have quality
		procure = 100,--If you plant herb, how much have procure
		jerks = 0,--If you plant herb, how much have jerks

		gatherAnimation = {"mech_pickup@plant@yarrow","base", 3},--Animation for gather herb
		rewardItem = {--If you have disabled quality set [XX] to [0]
			[80] = {"pepper", 8},--Upper 80% to 100
			[50] = {"pepper", 6},--Upper 50% to 80
			[25] = {"pepper", 3},--Upper 25% to 50
			[0] = {"pepper", 1},--Upper 0% to 25
		},
	},
	["seed_bell_pepper"] = {--Item Seed ID
		enableHerbToSeed = false,--If you have enabeld after you use herb -> automaticaly get seeds
		multipleUse = false,--If you have enabled you can use herb and get input with "To seed" "Interact"
		multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount (multipleUse)
		herbToSeed = 3,--How much get from herb seeds
		herbName = "Bell Pepper",
		herbItem = "bellpepper",

		itIsTree = false,--Regrow system. Plant stay there but you can pick herb, and after again grow you an pick again. Good for apple trees etc.
		canPickAfterGrow = 0,--How much times from regrow system you can pick herb

		coordsLocks = {--If you want lock coords for plant herb
			[1] = {1060.07, -978.07, 70.86, 40.0}, -- Southfield Flats
            [2] = {1371.33, 496.79, 88, 35.0}, -- Emerald Ranch
            [3] = {-1428.04, -1140.91, 75.03, 35.0}, -- Blackwater  
            [4] = {2455.55, 869.01, 74.95, 35.0}, -- Elysian Pool 
            [5] = {2069.82, -308.16, 41.86, 25.0}, -- Swamp Shack
            [6] = {-1760.68, -2401.01, 42.68, 35.0}, -- Thieves Landing *********** no blip
            [7] = {1758.75, -2012.98, 44.24, 35.0}, -- Shady Belle Coast ********** no blip
            [8] = {-1429.78, 222.82, 100.36, 25.0}, -- south Wallace Station ********* no blip
            [9] = {3285.23, -563.71, 43.06, 35.0}, -- Sisika
            [10] = {-4396.13, -3874.86, -24.39, 25.0}, -- New Austin - San Luis River
            [11] = {-340.73, 18.31, 43.82, 25.0}, -- Limpany
            [12] = {2672.08, -778.71, 42.47, 25.0}, -- Saint Denis
            [13] = {1561.09, -7058.43, 85.04, 40.0}, -- Guarma
            [14] = {-3322.43, -3133.91, -3.54, 25.0}, -- Don Julio
            [15] = {1670.59, 1341.09, 146.48, 25.0}, -- O'Creaghs
            [16] = {-2581.66, -225.32, 170.62, 20.0}, -- Lake Owanjila
            [17] = {-198.71, -544.86, 42.94, 25.0}, -- South Flatneck Station Farm
		},
		potStageProps = {--Stage is calculated automaticaly from grow time
			/*STAGE   |   MODEL     |    TIME | HOW MUCH IN GROUND*/
			[1] = {"s_inv_redsage01dx", 24, 0.0},
			[2] = {"s_inv_redsage01dx", 16, 0.0},
			[3] = {"s_inv_redsage01dx",  8, 0.0},
			[4] = {"s_inv_redsage01dx", -1, 0.0},
			
			
			
		},
		weatherAffect = true,--If is rain -> automaticaly water herb
		growTime = 26,--300 min time without affecting temp
		temperatureSlow = -3,--If temperature is under -3 automaticaly slow grow
		temperatureGood = {-3, 30},--If temperature between this, herb grow normal
		temperatureHot = 30,--If temperature is bigger thjan 30 herb need more water (2x more)
		
		fertilizer = 0,--If you plant herb, how much have fertilize
		quality = 100,--If you plant herb, how much have quality
		procure = 100,--If you plant herb, how much have procure
		jerks = 0,--If you plant herb, how much have jerks

		gatherAnimation = {"mech_pickup@plant@yarrow","base", 3},--Animation for gather herb
		rewardItem = {--If you have disabled quality set [XX] to [0]
			[80] = {"bellpepper", 8},--Upper 80% to 100
			[50] = {"bellpepper", 6},--Upper 50% to 80
			[25] = {"bellpepper", 3},--Upper 25% to 50
			[0] = {"bellpepper", 1},--Upper 0% to 25
		},
	},

	["watermelonseed"] = {--Item Seed ID
		enableHerbToSeed = false,--If you have enabeld after you use herb -> automaticaly get seeds
		multipleUse = false,--If you have enabled you can use herb and get input with "To seed" "Interact"
		multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount (multipleUse)
		herbToSeed = 3,--How much get from herb seeds
		herbName = "Watermelon",
		herbItem = "watermelon",

		itIsTree = false,--Regrow system. Plant stay there but you can pick herb, and after again grow you an pick again. Good for apple trees etc.
		canPickAfterGrow = 0,--How much times from regrow system you can pick herb

		coordsLocks = {--If you want lock coords for plant herb
			[1] = {1060.07, -978.07, 70.86, 40.0}, -- Southfield Flats
            [2] = {1371.33, 496.79, 88, 35.0}, -- Emerald Ranch
            [3] = {-1428.04, -1140.91, 75.03, 35.0}, -- Blackwater  
            [4] = {2455.55, 869.01, 74.95, 35.0}, -- Elysian Pool 
            [5] = {2069.82, -308.16, 41.86, 25.0}, -- Swamp Shack
            [6] = {-1760.68, -2401.01, 42.68, 35.0}, -- Thieves Landing *********** no blip
            [7] = {1758.75, -2012.98, 44.24, 35.0}, -- Shady Belle Coast ********** no blip
            [8] = {-1429.78, 222.82, 100.36, 25.0}, -- south Wallace Station ********* no blip
            [9] = {3285.23, -563.71, 43.06, 35.0}, -- Sisika
            [10] = {-4396.13, -3874.86, -24.39, 25.0}, -- New Austin - San Luis River
            [11] = {-340.73, 18.31, 43.82, 25.0}, -- Limpany
            [12] = {2672.08, -778.71, 42.47, 25.0}, -- Saint Denis
            [13] = {1561.09, -7058.43, 85.04, 40.0}, -- Guarma
            [14] = {-3322.43, -3133.91, -3.54, 25.0}, -- Don Julio
            [15] = {1670.59, 1341.09, 146.48, 25.0}, -- O'Creaghs
            [16] = {-2581.66, -225.32, 170.62, 20.0}, -- Lake Owanjila
            [17] = {-198.71, -544.86, 42.94, 25.0}, -- South Flatneck Station Farm
		},
		potStageProps = {--Stage is calculated automaticaly from grow time
			/*STAGE   |   MODEL     |    TIME | HOW MUCH IN GROUND*/
			[1] = {"watermelon_plant", 24, 0.0},
			[2] = {"watermelon_plant", 16, 0.0},
			[3] = {"watermelon_plant",  8, 0.0},
			[4] = {"watermelon_plant", -1, 0.0},
			
			
			
		},
		weatherAffect = true,--If is rain -> automaticaly water herb
		growTime = 26,--300 min time without affecting temp
		temperatureSlow = -3,--If temperature is under -3 automaticaly slow grow
		temperatureGood = {-3, 30},--If temperature between this, herb grow normal
		temperatureHot = 30,--If temperature is bigger thjan 30 herb need more water (2x more)
		
		fertilizer = 0,--If you plant herb, how much have fertilize
		quality = 100,--If you plant herb, how much have quality
		procure = 100,--If you plant herb, how much have procure
		jerks = 0,--If you plant herb, how much have jerks

		gatherAnimation = {"mech_pickup@plant@yarrow","base", 3},--Animation for gather herb
		rewardItem = {--If you have disabled quality set [XX] to [0]
			[80] = {"watermelon", 8},--Upper 80% to 100
			[50] = {"watermelon", 6},--Upper 50% to 80
			[25] = {"watermelon", 3},--Upper 25% to 50
			[0] = {"watermelon", 1},--Upper 0% to 25
		},
	},
	
	["garlicseed"] = {--Item Seed ID
		enableHerbToSeed = false,--If you have enabeld after you use herb -> automaticaly get seeds
		multipleUse = false,--If you have enabled you can use herb and get input with "To seed" "Interact"
		multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount (multipleUse)
		herbToSeed = 3,--How much get from herb seeds
		herbName = "Garlic",
		herbItem = "garlic",

		itIsTree = false,--Regrow system. Plant stay there but you can pick herb, and after again grow you an pick again. Good for apple trees etc.
		canPickAfterGrow = 0,--How much times from regrow system you can pick herb

		coordsLocks = {--If you want lock coords for plant herb
			[1] = {1060.07, -978.07, 70.86, 40.0}, -- Southfield Flats
            [2] = {1371.33, 496.79, 88, 35.0}, -- Emerald Ranch
            [3] = {-1428.04, -1140.91, 75.03, 35.0}, -- Blackwater  
            [4] = {2455.55, 869.01, 74.95, 35.0}, -- Elysian Pool 
            [5] = {2069.82, -308.16, 41.86, 25.0}, -- Swamp Shack
            [6] = {-1760.68, -2401.01, 42.68, 35.0}, -- Thieves Landing *********** no blip
            [7] = {1758.75, -2012.98, 44.24, 35.0}, -- Shady Belle Coast ********** no blip
            [8] = {-1429.78, 222.82, 100.36, 25.0}, -- south Wallace Station ********* no blip
            [9] = {3285.23, -563.71, 43.06, 35.0}, -- Sisika
            [10] = {-4396.13, -3874.86, -24.39, 25.0}, -- New Austin - San Luis River
            [11] = {-340.73, 18.31, 43.82, 25.0}, -- Limpany
            [12] = {2672.08, -778.71, 42.47, 25.0}, -- Saint Denis
            [13] = {1561.09, -7058.43, 85.04, 40.0}, -- Guarma
            [14] = {-3322.43, -3133.91, -3.54, 25.0}, -- Don Julio
            [15] = {1670.59, 1341.09, 146.48, 25.0}, -- O'Creaghs
            [16] = {-2581.66, -225.32, 170.62, 20.0}, -- Lake Owanjila
            [17] = {-198.71, -544.86, 42.94, 25.0}, -- South Flatneck Station Farm
		},
		potStageProps = {--Stage is calculated automaticaly from grow time
			/*STAGE   |   MODEL     |    TIME | HOW MUCH IN GROUND*/
			[1] = {"crp_carrots_sap_ba_sim", 24, 0.0},
			[2] = {"crp_carrots_sap_ba_sim", 16, 0.0},
			[3] = {"crp_carrots_sap_ba_sim",  8, 0.0},
			[4] = {"crp_carrots_sap_ba_sim", -1, 0.0},
			
			
			
		},
		weatherAffect = true,--If is rain -> automaticaly water herb
		growTime = 26,--300 min time without affecting temp
		temperatureSlow = -3,--If temperature is under -3 automaticaly slow grow
		temperatureGood = {-3, 30},--If temperature between this, herb grow normal
		temperatureHot = 30,--If temperature is bigger thjan 30 herb need more water (2x more)
		
		fertilizer = 0,--If you plant herb, how much have fertilize
		quality = 100,--If you plant herb, how much have quality
		procure = 100,--If you plant herb, how much have procure
		jerks = 0,--If you plant herb, how much have jerks

		gatherAnimation = {"mech_pickup@plant@yarrow","base", 3},--Animation for gather herb
		rewardItem = {--If you have disabled quality set [XX] to [0]
			[80] = {"garlic", 8},--Upper 80% to 100
			[50] = {"garlic", 6},--Upper 50% to 80
			[25] = {"garlic", 3},--Upper 25% to 50
			[0] = {"garlic", 1},--Upper 0% to 25
		},
	},

	["cucumberseed"] = {--Item Seed ID
		enableHerbToSeed = false,--If you have enabeld after you use herb -> automaticaly get seeds
		multipleUse = false,--If you have enabled you can use herb and get input with "To seed" "Interact"
		multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount (multipleUse)
		herbToSeed = 3,--How much get from herb seeds
		herbName = "Cucumber",
		herbItem = "cucumber",

		itIsTree = false,--Regrow system. Plant stay there but you can pick herb, and after again grow you an pick again. Good for apple trees etc.
		canPickAfterGrow = 0,--How much times from regrow system you can pick herb

		coordsLocks = {--If you want lock coords for plant herb
			[1] = {1060.07, -978.07, 70.86, 40.0}, -- Southfield Flats
            [2] = {1371.33, 496.79, 88, 35.0}, -- Emerald Ranch
            [3] = {-1428.04, -1140.91, 75.03, 35.0}, -- Blackwater  
            [4] = {2455.55, 869.01, 74.95, 35.0}, -- Elysian Pool 
            [5] = {2069.82, -308.16, 41.86, 25.0}, -- Swamp Shack
            [6] = {-1760.68, -2401.01, 42.68, 35.0}, -- Thieves Landing *********** no blip
            [7] = {1758.75, -2012.98, 44.24, 35.0}, -- Shady Belle Coast ********** no blip
            [8] = {-1429.78, 222.82, 100.36, 25.0}, -- south Wallace Station ********* no blip
            [9] = {3285.23, -563.71, 43.06, 35.0}, -- Sisika
            [10] = {-4396.13, -3874.86, -24.39, 25.0}, -- New Austin - San Luis River
            [11] = {-340.73, 18.31, 43.82, 25.0}, -- Limpany
            [12] = {2672.08, -778.71, 42.47, 25.0}, -- Saint Denis
            [13] = {1561.09, -7058.43, 85.04, 40.0}, -- Guarma
            [14] = {-3322.43, -3133.91, -3.54, 25.0}, -- Don Julio
            [15] = {1670.59, 1341.09, 146.48, 25.0}, -- O'Creaghs
            [16] = {-2581.66, -225.32, 170.62, 20.0}, -- Lake Owanjila
            [17] = {-198.71, -544.86, 42.94, 25.0}, -- South Flatneck Station Farm
		},
		potStageProps = {--Stage is calculated automaticaly from grow time
			/*STAGE   |   MODEL     |    TIME | HOW MUCH IN GROUND*/
			[1] = {"cucumber_plant", 24, 0.0},
			[2] = {"cucumber_plant", 16, 0.0},
			[3] = {"cucumber_plant",  8, 0.0},
			[4] = {"cucumber_plant", -1, 0.0},
			
			
			
		},
		weatherAffect = true,--If is rain -> automaticaly water herb
		growTime = 26,--300 min time without affecting temp
		temperatureSlow = -3,--If temperature is under -3 automaticaly slow grow
		temperatureGood = {-3, 30},--If temperature between this, herb grow normal
		temperatureHot = 30,--If temperature is bigger thjan 30 herb need more water (2x more)
		
		fertilizer = 0,--If you plant herb, how much have fertilize
		quality = 100,--If you plant herb, how much have quality
		procure = 100,--If you plant herb, how much have procure
		jerks = 0,--If you plant herb, how much have jerks

		gatherAnimation = {"mech_pickup@plant@yarrow","base", 3},--Animation for gather herb
		rewardItem = {--If you have disabled quality set [XX] to [0]
			[80] = {"cucumber", 8},--Upper 80% to 100
			[50] = {"cucumber", 6},--Upper 50% to 80
			[25] = {"cucumber", 3},--Upper 25% to 50
			[0] = {"cucumber", 1},--Upper 0% to 25
		},
	},

	["coffeeseed"] = {--Item Seed ID
		enableHerbToSeed = false,--If you have enabeld after you use herb -> automaticaly get seeds
		multipleUse = false,--If you have enabled you can use herb and get input with "To seed" "Interact"
		multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount (multipleUse)
		herbToSeed = 3,--How much get from herb seeds
		herbName = "Coffee Beans",
		herbItem = "coffeebean",

		itIsTree = false,--Regrow system. Plant stay there but you can pick herb, and after again grow you an pick again. Good for apple trees etc.
		canPickAfterGrow = 0,--How much times from regrow system you can pick herb

		coordsLocks = {--If you want lock coords for plant herb
			[1] = {1060.07, -978.07, 70.86, 40.0}, -- Southfield Flats
            [2] = {1371.33, 496.79, 88, 35.0}, -- Emerald Ranch
            [3] = {-1428.04, -1140.91, 75.03, 35.0}, -- Blackwater  
            [4] = {2455.55, 869.01, 74.95, 35.0}, -- Elysian Pool 
            [5] = {2069.82, -308.16, 41.86, 25.0}, -- Swamp Shack
            [6] = {-1760.68, -2401.01, 42.68, 35.0}, -- Thieves Landing *********** no blip
            [7] = {1758.75, -2012.98, 44.24, 35.0}, -- Shady Belle Coast ********** no blip
            [8] = {-1429.78, 222.82, 100.36, 25.0}, -- south Wallace Station ********* no blip
            [9] = {3285.23, -563.71, 43.06, 35.0}, -- Sisika
            [10] = {-4396.13, -3874.86, -24.39, 25.0}, -- New Austin - San Luis River
            [11] = {-340.73, 18.31, 43.82, 25.0}, -- Limpany
            [12] = {2672.08, -778.71, 42.47, 25.0}, -- Saint Denis
            [13] = {1561.09, -7058.43, 85.04, 40.0}, -- Guarma
            [14] = {-3322.43, -3133.91, -3.54, 25.0}, -- Don Julio
            [15] = {1670.59, 1341.09, 146.48, 25.0}, -- O'Creaghs
            [16] = {-2581.66, -225.32, 170.62, 20.0}, -- Lake Owanjila
            [17] = {-198.71, -544.86, 42.94, 25.0}, -- South Flatneck Station Farm
		},
		potStageProps = {--Stage is calculated automaticaly from grow time
			/*STAGE   |   MODEL     |    TIME | HOW MUCH IN GROUND*/
			[1] = {"crp_tobaccoplant_aa_sim", 24, 0.0},
			[2] = {"crp_tobaccoplant_aa_sim", 16, 0.0},
			[3] = {"crp_tobaccoplant_aa_sim",  8, 0.0},
			[4] = {"crp_tobaccoplant_aa_sim", -1, 0.0},
			
			
			
		},
		weatherAffect = true,--If is rain -> automaticaly water herb
		growTime = 26,--300 min time without affecting temp
		temperatureSlow = -3,--If temperature is under -3 automaticaly slow grow
		temperatureGood = {-3, 30},--If temperature between this, herb grow normal
		temperatureHot = 30,--If temperature is bigger thjan 30 herb need more water (2x more)
		
		fertilizer = 0,--If you plant herb, how much have fertilize
		quality = 100,--If you plant herb, how much have quality
		procure = 100,--If you plant herb, how much have procure
		jerks = 0,--If you plant herb, how much have jerks

		gatherAnimation = {"mech_pickup@plant@yarrow","base", 3},--Animation for gather herb
		rewardItem = {--If you have disabled quality set [XX] to [0]
			[80] = {"coffeebean", 8},--Upper 80% to 100
			[50] = {"coffeebean", 6},--Upper 50% to 80
			[25] = {"coffeebean", 3},--Upper 25% to 50
			[0] = {"coffeebean", 1},--Upper 0% to 25
		},
	},

	["pumpkinseed"] = {--Item Seed ID
		enableHerbToSeed = false,--If you have enabeld after you use herb -> automaticaly get seeds
		multipleUse = false,--If you have enabled you can use herb and get input with "To seed" "Interact"
		multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount (multipleUse)
		herbToSeed = 3,--How much get from herb seeds
		herbName = "Pumpkin",
		herbItem = "pumpkin",

		itIsTree = false,--Regrow system. Plant stay there but you can pick herb, and after again grow you an pick again. Good for apple trees etc.
		canPickAfterGrow = 0,--How much times from regrow system you can pick herb

		coordsLocks = {--If you want lock coords for plant herb
			[1] = {1060.07, -978.07, 70.86, 40.0}, -- Southfield Flats
            [2] = {1371.33, 496.79, 88, 35.0}, -- Emerald Ranch
            [3] = {-1428.04, -1140.91, 75.03, 35.0}, -- Blackwater  
            [4] = {2455.55, 869.01, 74.95, 35.0}, -- Elysian Pool 
            [5] = {2069.82, -308.16, 41.86, 25.0}, -- Swamp Shack
            [6] = {-1760.68, -2401.01, 42.68, 35.0}, -- Thieves Landing *********** no blip
            [7] = {1758.75, -2012.98, 44.24, 35.0}, -- Shady Belle Coast ********** no blip
            [8] = {-1429.78, 222.82, 100.36, 25.0}, -- south Wallace Station ********* no blip
            [9] = {3285.23, -563.71, 43.06, 35.0}, -- Sisika
            [10] = {-4396.13, -3874.86, -24.39, 25.0}, -- New Austin - San Luis River
            [11] = {-340.73, 18.31, 43.82, 25.0}, -- Limpany
            [12] = {2672.08, -778.71, 42.47, 25.0}, -- Saint Denis
            [13] = {1561.09, -7058.43, 85.04, 40.0}, -- Guarma
            [14] = {-3322.43, -3133.91, -3.54, 25.0}, -- Don Julio
            [15] = {1670.59, 1341.09, 146.48, 25.0}, -- O'Creaghs
            [16] = {-2581.66, -225.32, 170.62, 20.0}, -- Lake Owanjila
            [17] = {-198.71, -544.86, 42.94, 25.0}, -- South Flatneck Station Farm
		},
		potStageProps = {--Stage is calculated automaticaly from grow time
			/*STAGE   |   MODEL     |    TIME | HOW MUCH IN GROUND*/
			[1] = {"pumpkin_plant", 24, 0.0},
			[2] = {"pumpkin_plant", 16, 0.0},
			[3] = {"pumpkin_plant",  8, 0.0},
			[4] = {"pumpkin_plant", -1, 0.0},
			
			
			
		},
		weatherAffect = true,--If is rain -> automaticaly water herb
		growTime = 26,--300 min time without affecting temp
		temperatureSlow = -3,--If temperature is under -3 automaticaly slow grow
		temperatureGood = {-3, 30},--If temperature between this, herb grow normal
		temperatureHot = 30,--If temperature is bigger thjan 30 herb need more water (2x more)
		
		fertilizer = 0,--If you plant herb, how much have fertilize
		quality = 100,--If you plant herb, how much have quality
		procure = 100,--If you plant herb, how much have procure
		jerks = 0,--If you plant herb, how much have jerks

		gatherAnimation = {"mech_pickup@plant@yarrow","base", 3},--Animation for gather herb
		rewardItem = {--If you have disabled quality set [XX] to [0]
			[80] = {"pumpkin", 8},--Upper 80% to 100
			[50] = {"pumpkin", 6},--Upper 50% to 80
			[25] = {"pumpkin", 3},--Upper 25% to 50
			[0] = {"pumpkin", 1},--Upper 0% to 25
		},
	},

	["riceseed"] = {--Item Seed ID
		enableHerbToSeed = false,--If you have enabeld after you use herb -> automaticaly get seeds
		multipleUse = false,--If you have enabled you can use herb and get input with "To seed" "Interact"
		multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount (multipleUse)
		herbToSeed = 3,--How much get from herb seeds
		herbName = "Rice",
		herbItem = "rice",

		itIsTree = false,--Regrow system. Plant stay there but you can pick herb, and after again grow you an pick again. Good for apple trees etc.
		canPickAfterGrow = 0,--How much times from regrow system you can pick herb

		coordsLocks = {--If you want lock coords for plant herb
			[1] = {1060.07, -978.07, 70.86, 40.0}, -- Southfield Flats
            [2] = {1371.33, 496.79, 88, 35.0}, -- Emerald Ranch
            [3] = {-1428.04, -1140.91, 75.03, 35.0}, -- Blackwater  
            [4] = {2455.55, 869.01, 74.95, 35.0}, -- Elysian Pool 
            [5] = {2069.82, -308.16, 41.86, 25.0}, -- Swamp Shack
            [6] = {-1760.68, -2401.01, 42.68, 35.0}, -- Thieves Landing *********** no blip
            [7] = {1758.75, -2012.98, 44.24, 35.0}, -- Shady Belle Coast ********** no blip
            [8] = {-1429.78, 222.82, 100.36, 25.0}, -- south Wallace Station ********* no blip
            [9] = {3285.23, -563.71, 43.06, 35.0}, -- Sisika
            [10] = {-4396.13, -3874.86, -24.39, 25.0}, -- New Austin - San Luis River
            [11] = {-340.73, 18.31, 43.82, 25.0}, -- Limpany
            [12] = {2672.08, -778.71, 42.47, 25.0}, -- Saint Denis
            [13] = {1561.09, -7058.43, 85.04, 40.0}, -- Guarma
            [14] = {-3322.43, -3133.91, -3.54, 25.0}, -- Don Julio
            [15] = {1670.59, 1341.09, 146.48, 25.0}, -- O'Creaghs
            [16] = {-2581.66, -225.32, 170.62, 20.0}, -- Lake Owanjila
            [17] = {-198.71, -544.86, 42.94, 25.0}, -- South Flatneck Station Farm
		},
		potStageProps = {--Stage is calculated automaticaly from grow time
			/*STAGE   |   MODEL     |    TIME | HOW MUCH IN GROUND*/
			[1] = {"crp_wheat_sap_long_aa_sim", 24, 0.0},
			[2] = {"crp_wheat_sap_long_aa_sim", 16, 0.0},
			[3] = {"crp_wheat_sap_long_aa_sim",  8, 0.0},
			[4] = {"crp_wheat_sap_long_aa_sim", -1, 0.0},
			
			
			
		},
		weatherAffect = true,--If is rain -> automaticaly water herb
		growTime = 26,--300 min time without affecting temp
		temperatureSlow = -3,--If temperature is under -3 automaticaly slow grow
		temperatureGood = {-3, 30},--If temperature between this, herb grow normal
		temperatureHot = 30,--If temperature is bigger thjan 30 herb need more water (2x more)
		
		fertilizer = 0,--If you plant herb, how much have fertilize
		quality = 100,--If you plant herb, how much have quality
		procure = 100,--If you plant herb, how much have procure
		jerks = 0,--If you plant herb, how much have jerks

		gatherAnimation = {"mech_pickup@plant@yarrow","base", 3},--Animation for gather herb
		rewardItem = {--If you have disabled quality set [XX] to [0]
			[80] = {"rice", 8},--Upper 80% to 100
			[50] = {"rice", 6},--Upper 50% to 80
			[25] = {"rice", 3},--Upper 25% to 50
			[0] = {"rice", 1},--Upper 0% to 25
		},
	},

	["barleyseed"] = {--Item Seed ID
		enableHerbToSeed = false,--If you have enabeld after you use herb -> automaticaly get seeds
		multipleUse = false,--If you have enabled you can use herb and get input with "To seed" "Interact"
		multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount (multipleUse)
		herbToSeed = 3,--How much get from herb seeds
		herbName = "Barley",
		herbItem = "barley",

		itIsTree = false,--Regrow system. Plant stay there but you can pick herb, and after again grow you an pick again. Good for apple trees etc.
		canPickAfterGrow = 0,--How much times from regrow system you can pick herb

		coordsLocks = {--If you want lock coords for plant herb
			[1] = {1060.07, -978.07, 70.86, 40.0}, -- Southfield Flats
            [2] = {1371.33, 496.79, 88, 35.0}, -- Emerald Ranch
            [3] = {-1428.04, -1140.91, 75.03, 35.0}, -- Blackwater  
            [4] = {2455.55, 869.01, 74.95, 35.0}, -- Elysian Pool 
            [5] = {2069.82, -308.16, 41.86, 25.0}, -- Swamp Shack
            [6] = {-1760.68, -2401.01, 42.68, 35.0}, -- Thieves Landing *********** no blip
            [7] = {1758.75, -2012.98, 44.24, 35.0}, -- Shady Belle Coast ********** no blip
            [8] = {-1429.78, 222.82, 100.36, 25.0}, -- south Wallace Station ********* no blip
            [9] = {3285.23, -563.71, 43.06, 35.0}, -- Sisika
            [10] = {-4396.13, -3874.86, -24.39, 25.0}, -- New Austin - San Luis River
            [11] = {-340.73, 18.31, 43.82, 25.0}, -- Limpany
            [12] = {2672.08, -778.71, 42.47, 25.0}, -- Saint Denis
            [13] = {1561.09, -7058.43, 85.04, 40.0}, -- Guarma
            [14] = {-3322.43, -3133.91, -3.54, 25.0}, -- Don Julio
            [15] = {1670.59, 1341.09, 146.48, 25.0}, -- O'Creaghs
            [16] = {-2581.66, -225.32, 170.62, 20.0}, -- Lake Owanjila
            [17] = {-198.71, -544.86, 42.94, 25.0}, -- South Flatneck Station Farm
		},
		potStageProps = {--Stage is calculated automaticaly from grow time
			/*STAGE   |   MODEL     |    TIME | HOW MUCH IN GROUND*/
			[1] = {"crp_wheat_sap_long_ab_sim", 24, 0.0},
			[2] = {"crp_wheat_sap_long_ab_sim", 16, 0.0},
			[3] = {"crp_wheat_sap_long_ab_sim",  8, 0.0},
			[4] = {"crp_wheat_sap_long_ab_sim", -1, 0.0},
			
			
			
		},
		weatherAffect = true,--If is rain -> automaticaly water herb
		growTime = 26,--300 min time without affecting temp
		temperatureSlow = -3,--If temperature is under -3 automaticaly slow grow
		temperatureGood = {-3, 30},--If temperature between this, herb grow normal
		temperatureHot = 30,--If temperature is bigger thjan 30 herb need more water (2x more)
		
		fertilizer = 0,--If you plant herb, how much have fertilize
		quality = 100,--If you plant herb, how much have quality
		procure = 100,--If you plant herb, how much have procure
		jerks = 0,--If you plant herb, how much have jerks

		gatherAnimation = {"mech_pickup@plant@yarrow","base", 3},--Animation for gather herb
		rewardItem = {--If you have disabled quality set [XX] to [0]
			[80] = {"barley",  8},--Upper 80% to 100
			[50] = {"barley",  6},--Upper 50% to 80
			[25] = {"barley",  3},--Upper 25% to 50
			[0] = {"barley",  1},--Upper 0% to 25
		},
	},

-------------------
-----  DRUGS  -----
-------------------

	["weedseed"] = {--Item Seed ID
		enableHerbToSeed = false,--If you have enabeld after you use herb -> automaticaly get seeds
		multipleUse = false,--If you have enabled you can use herb and get input with "To seed" "Interact"
		multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount (multipleUse)
		herbToSeed = 3,--How much get from herb seeds
		herbName = "Weed",
		herbItem = "weed",

		itIsTree = false,--Regrow system. Plant stay there but you can pick herb, and after again grow you an pick again. Good for apple trees etc.
		canPickAfterGrow = 0,--How much times from regrow system you can pick herb

		coordsLocks = {--If you want lock coords for plant herb
			[1] = {1060.07, -978.07, 70.86, 40.0}, -- Southfield Flats
            [2] = {1371.33, 496.79, 88, 35.0}, -- Emerald Ranch
            [3] = {-1428.04, -1140.91, 75.03, 35.0}, -- Blackwater  
            [4] = {2455.55, 869.01, 74.95, 35.0}, -- Elysian Pool 
            [5] = {2069.82, -308.16, 41.86, 25.0}, -- Swamp Shack
            [6] = {-1760.68, -2401.01, 42.68, 35.0}, -- Thieves Landing *********** no blip
            [7] = {1758.75, -2012.98, 44.24, 35.0}, -- Shady Belle Coast ********** no blip
            [8] = {-1429.78, 222.82, 100.36, 25.0}, -- south Wallace Station ********* no blip
            [9] = {3285.23, -563.71, 43.06, 35.0}, -- Sisika
            [10] = {-4396.13, -3874.86, -24.39, 25.0}, -- New Austin - San Luis River
            [11] = {-340.73, 18.31, 43.82, 25.0}, -- Limpany
            [12] = {2672.08, -778.71, 42.47, 25.0}, -- Saint Denis
            [13] = {1561.09, -7058.43, 85.04, 40.0}, -- Guarma
            [14] = {-3322.43, -3133.91, -3.54, 25.0}, -- Don Julio
            [15] = {1670.59, 1341.09, 146.48, 25.0}, -- O'Creaghs
            [16] = {-2581.66, -225.32, 170.62, 20.0}, -- Lake Owanjila
            [17] = {-198.71, -544.86, 42.94, 25.0}, -- South Flatneck Station Farm
		},
		potStageProps = {--Stage is calculated automaticaly from grow time
			/*STAGE   |   MODEL     |    TIME | HOW MUCH IN GROUND*/
			[1] = {"weed_plant", 24, 0.0},
			[2] = {"weed_plant", 16, 0.0},
			[3] = {"weed_plant",  8, 0.0},
			[4] = {"weed_plant", -1, 0.0},
			
			
			
		},
		weatherAffect = true,--If is rain -> automaticaly water herb
		growTime = 36,--300 min time without affecting temp
		temperatureSlow = -3,--If temperature is under -3 automaticaly slow grow
		temperatureGood = {-3, 30},--If temperature between this, herb grow normal
		temperatureHot = 30,--If temperature is bigger thjan 30 herb need more water (2x more)
		
		fertilizer = 0,--If you plant herb, how much have fertilize
		quality = 100,--If you plant herb, how much have quality
		procure = 100,--If you plant herb, how much have procure
		jerks = 0,--If you plant herb, how much have jerks

		gatherAnimation = {"mech_pickup@plant@yarrow","base", 3},--Animation for gather herb
		rewardItem = {--If you have disabled quality set [XX] to [0]
			[80] = {"weed", 8},--Upper 80% to 100
			[50] = {"weed", 6},--Upper 50% to 80
			[25] = {"weed", 3},--Upper 25% to 50
			[0] = {"weed", 1},--Upper 0% to 2
		},
	},
	
	["cocaineseed"] = {--Item Seed ID
		enableHerbToSeed = false,--If you have enabeld after you use herb -> automaticaly get seeds
		multipleUse = false,--If you have enabled you can use herb and get input with "To seed" "Interact"
		multipleEvent = "gum_farming:useSeed",--argument is herbSeed, herbName, herbCount (multipleUse)
		herbToSeed = 3,--How much get from herb seeds
		herbName = "Coca Plants",
		herbItem = "cocaleaf",

		itIsTree = false,--Regrow system. Plant stay there but you can pick herb, and after again grow you an pick again. Good for apple trees etc.
		canPickAfterGrow = 0,--How much times from regrow system you can pick herb

		coordsLocks = {--If you want lock coords for plant herb
			[1] = {1561.09, -7058.43, 85.04, 40.0}, -- Guarma
		},
		potStageProps = {--Stage is calculated automaticaly from grow time
			/*STAGE   |   MODEL     |    TIME | HOW MUCH IN GROUND*/
			[1] = {"s_indiantobacco01x", 24, 0.0},
			[2] = {"s_indiantobacco01x", 16, 0.0},
			[3] = {"s_indiantobacco01x",  8, 0.0},
			[4] = {"s_indiantobacco01x", -1, 0.0},
			
			
			
		},
		weatherAffect = true,--If is rain -> automaticaly water herb
		growTime = 36,--300 min time without affecting temp
		temperatureSlow = -3,--If temperature is under -3 automaticaly slow grow
		temperatureGood = {-3, 30},--If temperature between this, herb grow normal
		temperatureHot = 30,--If temperature is bigger thjan 30 herb need more water (2x more)
		
		fertilizer = 0,--If you plant herb, how much have fertilize
		quality = 100,--If you plant herb, how much have quality
		procure = 100,--If you plant herb, how much have procure
		jerks = 0,--If you plant herb, how much have jerks

		gatherAnimation = {"mech_pickup@plant@yarrow","base", 3},--Animation for gather herb
		rewardItem = {--If you have disabled quality set [XX] to [0]
			[80] = {"cocaleaf", 8},--Upper 80% to 100
			[50] = {"cocaleaf", 6},--Upper 50% to 80
			[25] = {"cocaleaf", 3},--Upper 25% to 50
			[0] = {"cocaleaf", 1},--Upper 0% to 25
		},
	},
	
	


}