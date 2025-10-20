Config = {}
Config.Debug = false

Config.discordHook = false
Config.webhookLink = ""
Config.webhookColor = 16755884
Config.webhookCreateFarm = true
Config.webhookAddHerbToFarm = true
Config.webhookHarvest = true
Config.webhookFertilizer = true
Config.webhookWater = true
Config.webhookjerks = true
Config.webhookProcure = true
Config.webhookDestroy = true
Config.webhookTapToSeed = true
Config.webhookLanguage = {
    [1] = "User get seed",
	[2] = "x Seed from : ",

	[3] = "Use feltirizer",
	[4] = "Farm ID : ",
	[5] = "Action : Fertilizer",
	[6] = "Add : ",

	[7] = "Use Water",
	[8] = "Farm ID : ",
	[9] = "Action : Watering",
	[10] = "Add : ",

	[11] = "Clean Pests",
	[12] = "Farm ID : ",
	[13] = "Action : Pests",
	[14] = "Remove : -",

	[15] = "Clean procedure",
	[16] = "Farm ID : ",
	[17] = "Action : Procedure",
	[18] = "Add : ",

	[19] = "Destroy herb : ",
	[20] = "Farm ID : ",
	[21] = "Destroy key : ",

	[22] = "Harvest herb : ",
	[23] = "Farm ID : ",
	[24] = "Get : ",

	[25] = "Create farm : ",
	[26] = "Farm ID : ",
	[27] = "Seed : ",

	[28] = "Plant herb to farm : ",
	[29] = "Farm ID : ",
	[30] = "Seed : ",
}

-- Block farming in cities
Config.BannedCity = false
Config.Banned_Towns_List = {
	'Annesburg',
	'Armadillo', 
	'Blackwater', 
	'Rhodes', 
	'Siska', 
	--'StDenis', 
	'Strawberry', 
	'Tumbleweed', 
	'Valentine', 
	'Vanhorn', 
	'Wapiti', 
}

Config.ToolsSystem = {
	hoeItemId = "hoe",--For mark and prepare lands
	bucketItemId = {"farmerbucket", 5, 50},--Item | Capacity | How much water on herb
	wateringCanId = {"teapotcan", 10, 100},

	--Its presetuped for gum stables
	--model = capacity for water
	oilWagon01x = 200,
	oilWagon02x = 200,
	cart05 = 50,
}

--Worker NPC can help with Procure and Pests on herbss. NPC work only farms created for JOB
Config.WorkerNPC = {
	--itemId = model
	farmnpc = "a_m_m_valfarmer_01"
}


-- /createFarm [Job] [Blip] [Count] [Protect]
-- /createFreeFarm [Blip] [Count] [Protect]
Config.JobFarmarSpeed = 0.5--0.5 Farmar make fastest interaction
Config.AdminForCreateFarm = {
	"admin",
	"moderator"
}

Config.plantSetting = {
	renderDistance = 60.0,--Render status for herbs etc.
	updateTime = 2,--15 minutes for update all herbs status and save to database
	canPlantEverywhere = false,--With false you can plant only on free farms or job farms
	nuiStatus = false,--You can see status of herb on NUI or on screen in 3D draw text
	skipMark = true, --If true you can plant without mark land and jump on prepare
    	disableHoe = true, --If true you can plant without hoe
	locationTempAffect = true,--If true location affect temperature Config.TemperatureDiscrict

	markerOnPlacedHerbs = true,--If true you can see marker on placed herbs (draw line up)
	canProtectInHouse = false,--If true you can protect herbs in house autoamticaly (only in gum_housing)
	maxHerbOutOfHome = 20,--Max herbs out of home
	maxHerbInHome = 10,--Max herbs in home (in gum_housing)

	----------------------------------------------------
	-- Values are setuped while update time tick
	waterDecrease = 10,--1% decrease on water
	fertilizeDecrease = 1,--1% decrease on fertilize

	procureIncrease = 50,--50% increase
	jerkDecrease = 10,--10% decrease on Pests

	-- Jerk Setting
	jerkChance = 5,--15% chance to get jerk
	jerkHowMuchGet = {1,2},--Get 2-10 Pests 15%
	jerkDecreaseQuality = 0.1,--Decrease quality of herb(for every 1% Pests max is 100%)
	jerkDecreaseProcure = 0.5,--Decrease state of herb (for every 1% Pests max is 100%)
	
	-- State settings1
	procureDecreaseUnderWater = 40,--Under 40% water state will decrease
	procureDecreaseIfUnderWater = 4.0,
	procureDecreaseUnderFertilize = 40,--Under 40% fertilize state will decrease
	procureDecreaseIfUnderFertilize = 4.0,--Under 40% fertilize state will decrease
	qualityDecreaseIfProcure1 = 50,--Under 50% procure quality will decrease
	qualityDecreaseIfProcureValue1 = 0.5,--Under 50% procure quality will decrease--(0.5)
	qualityDecreaseIfProcure2 = 20,--Under 20% procure quality will decrease
	qualityDecreaseIfProcureValue2 = 3.0,--Under 20% procure quality will decrease (0.5 + 1.5)
	moreWaterIfHot = 1.5,--If hot more water was taked
	moreGrowIfCold = 0.5,--If cold more grow was taked (updateTime*0.5)
	decreaseQualityIfWater = {40, 7.0},
	decreaseQualityIfFertilize = {60, 0.1},
	-- Values are setuped while update time tick
	----------------------------------------------------

	-- Config.Fertilizer
	fertilizer = {
		["fertilizer"] = {1, 50},--Count, How much increase on herb
		["premiumfertilizer"] = {1, 100},
	},

	--Scarecrow decrease chance on pests (animals what destroy herb)
	scareCrowItem = "scarecrow",--Scarecrow item
	scareCrowReducePests = 30,--decrease chance on Pests by 10%
}

Config.Language = {
    cancelLand = 'Cancel',
    markLand = 'Mark land',
    prepareLand = 'Prepare land',
    fertilize = 'Fertilize',
    water = 'Pour',
    procure = 'Procure',
    jerks = 'Destroy Pests',
    destroy = 'Destroy',
    harvest = 'Harvest',
    takeWater = 'Fill',
	pickScare = 'Take scarecrow',
	placeBucket = 'Place',
	fillBucket = 'Fill',
	takeBucket = 'Take',
	takeWaterFromCart = 'Fill from cart',
	giveWaterToCart = 'Pump to cart',
	cartForWater = 'Water tank',
	cartText = 'Cart',
	questionHerbToSeed = 'What do you want?',
	questionUseHerb = 'Use',
	questionUseSeed = 'Seed',
	farmarNpc = 'Farmar',
	doYouWantRemoveNpc = 'Do you want remove farmar?',
	fireNpc = 'Fire',
	yesRemoveNpc = 'Yes',
	noRemoveNpc = 'No',

	notifyFarmTitle = 'Farm',
	notifyFarmImage = 'farming',
	notifyCantPlantWithHoe = 'You cant plant with a Hoe in hand.',
	notifyCantPlantHere = 'You need to prepare the land before planting',
	notifyCantBecouseReady = 'There is already something planted or prepared here',
	notifyYouDontHaveFerti = 'You dont have any fertilizer',
	notifyYouHaveAlreadyScarecrow = 'You have already placed a scarecrow',
	notifyYouHaveAlreadyFarm = 'You already have a farm',
	notifyYouDontHaveFarm = 'You dont have a farm to place this on',
	notifyYouHaveSometingInHand = 'You have someting in hand.',
	notifyYouAreNearOtherFarm = 'You are much near to other farm.',
	notifyYouDontHaveSpace = 'You dont have space in inventory.',
	notifyYouAreOnOtherFarm = 'You cant plant on other farm.',
	notifyMaxHerbCount = 'You have max count herb in your farm.',
	notifyCantPlantHereBecouseYouHaveFarm = 'You cant plant here, because you need plant on your farm.',
	notifyFarmProtected = 'This Plot is protected by the law.',
	thisYouCantHerePlant = 'You cant plant this seed type here',
	notifyYouNeedPlantOnYourFarm = 'You need to plant on your farm',
	notifyFirstYouNeedPlaceHerb = 'First you need to place a herb for create land',
	notifyYouCanPlantOnSpecificField = 'You can plant only on specific field',
	notifyYouAreNotOwner = 'You are not owner of this farm',
	notifyFarmNpcCreated = 'Farmar is created',
    	notifyYouAreNotOnFarm = 'You are not on farm.',

	landEmpty = "Land : Empty",
	landPrepare = "Land : Prepare",
	herbWater = "Water : ",
	herbFertili = "Fertilize : ",
	herbJerks = "Pests : ",
	herbProcure = "Procure : ",
	herbQuality = "Quality : ",
	herbTime = "Grow : ",
	pumpText = 'Pump',
	bucketText = 'Watering can',
	scareCrowText = 'Scarecrow',
	landText = 'Land',

	blipJobText = 'Job farm',
	blipFreeText = 'Free farm',
    blipOwnedText = 'Your farm',
}

--Animation delays for specific interactions
Config.AnimationsDelay = {
	fillBucketFromCart = 1,
	defillBucketFromCart = 5,
	destroyLand = 2,
	markAnimation = 1.8,
	prepareAnimation = 2.1,
	jerksAnimation = 4,
	fertilizeAnimation = 2,
	procureAnimation = 2,
	makeHerbAnimation = {8, 8},
	destroyHerbAnimation = 10,
}

Config.CanDestroyJobs = {
    ["Sheriff_VL"] = true,
}

--Via clean zones you can clean specific farms in game. Like caliga lands, or brainwater lands etc.
Config.CleanZones = {
	[1] = {
		-- [baseCenter] = {x, y, z, renderRadius}
		baseCenter = {1866.5557861328127,-1556.222900390625,45.70060729980469, 120.0},
		spheres = {
			-- ["key"] = {"X, Y, Z, R"}
			[1] = {1857.108642578125,-1552.1961669921875,45.72179794311523, 23.0},
			[2] = {1871.8817138671875,-1544.357666015625,45.67536544799805, 23.0},
			[3] = {1878.453857421875,-1556.851806640625,45.53732681274414, 23.0},
			[4] = {1864.143310546875,-1564.8214111328125,45.79562759399414, 23.0},
		},
	},
}

Config.TemperatureDistrict = {--+- center of temperature in locations
	[2025841068] = {BayouNwa, 40},
	[822658194] = {bigvalley, 20},
	[1308232528] = {BluewaterMarsh, 40},
	[-108848014] = {ChollaSprings, 35},
	[1835499550] = {Cumberland, 25},
	[426773653] = {DiezCoronas, 40},
	[-2066240242] = {GaptoothRidge, 40},
	[476637847] = {greatPlains, 30},
	[-120156735] = {GrizzliesEast, 25},
	[1645618177] = {GrizzliesWest, -5},
	[-512529193] = {GuarmaD, 35},
	[131399519] = {Heartlands, 25},
	[892930832] = {HennigansStead, 30},
	[-1319956120] = {Perdido, 35},
	[1453836102] = {PuntaOrgullo, 40},
	[-2145992129] = {RioBravo, 40},
	[178647645] = {roanoke, 25},
	[-864275692] = {scarlettMeadows, 30},
	[1684533001] = {TallTrees, 20},
}
