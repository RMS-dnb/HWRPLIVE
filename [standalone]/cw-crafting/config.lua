Config = {}
Config.Debug = false

Config.oxInv = false -- set this to ox if you have ox_inventory

--  DISABLE OX LIB IN FXMANIFEST IF THIS IS FALSE:
Config.oxLib = true -- set this to ox if you have ox_lib !!! MAKE SURE OX LIB IS ADDED TO SHARED_SCRIPTS IN FXMANIFEST!!
Config.useOxTarget = true -- Set to true if you use ox-target. If this is false the script uses qb target

Config.UseLocalImages = false -- set this to true if you want to use local images rather than automatic. Put the images for the recipes and ingredients in the 'images' folder next to the blueprint.png
Config.ReopenCraftingWhenFinished = false -- if true the script will re-open the crafting when it's done

Config.ItemName = "blueprint" -- Name of the item in your items.lua
Config.PlayersTableName = 'players' -- 'players' for qb/qbox, 'characters' for ox. Something else for esx probably
Config.PlayerDbIdentifier = 'citizenId' -- 'citizenId' for qb/qbox, 'stateId' for ox, Something else for ex probably
Config.UseCWRepForCraftingSkill = false -- Set to true if you want to use cw-rep for skill instead of qbs metadata
-- The following all require cw-rep to be enabled:

Config.PrimaryUiColor = '#0ABFFF' -- Primary color in UI, default is blue



-- You can tweak this function to return different amount of points per skill
-- The default one will give you 1 skill for a crafted item and the +1 for each 100 in skill requirement the item has. 



Config.Blueprints = { -- rarity is 1-5, chance is 0.0-1.0 with lower numbers lowering chance of getting the item
}


Config.DefaultCraftingTime = 1000 -- in milliseconds
Config.LearningTime = 2500 -- time it takes to learn BP in milliseconds

Config.Recipes = {


	-----------------------------------------------
	--------------------------------------------------

	-- Public Crafting

	['leather'] = {
		category = "Processing",
		toItems = {
			leather = 1,
		},
		materials = {
			small_pelt = 2,
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "medic","vhwilddoctor","strawprivatedoctor", "vtwilddoctor", "rdwilddoctor", "publiccraftone", "publiccrafttwo", "sdprivatedoctor", "tipaniwilddoctor", "comwilddoctor", "twwilddoctor"},
	},
	['refinedsugar'] = {
		category = "Processing",
		toItems = {
			refinedsugar = 2,
		},
		materials = {
			sugarcane = 1,
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "publiccraftone", "publiccrafttwo"},
	},
    ['salt'] = {
		category = "Processing",
		toItems = {
			salt = 2,
		},
		materials = {
			saltrock = 1,
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "publiccraftone", "publiccrafttwo"},
	},
	['flour'] = {
		category = "Processing",
		toItems = {
			flour = 1,
		},
		materials = {
			wheat = 2,
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "publiccraftone", "publiccrafttwo"},
	},
	['dough'] = {
		category = "Processing",
		toItems = {
			dough = 2,
		},
		materials = {
			flour = 1,
			water = 1,
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "publiccraftone", "publiccrafttwo"},
	},
	['butter'] = {
		category = "Processing",
		toItems = {
			butter = 1,
		},
		materials = {
			cream = 2,
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "publiccraftone", "publiccrafttwo"},
	},
	['cinnamon'] = {
		category = "Processing",
		toItems = {
			cinnamon = 2,
		},
		materials = {
			treebark = 1,
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "publiccraftone", "publiccrafttwo"},
	},
    ['canteen100'] = {
		category = "Processing",
		toItems = {
			canteen100 = 1,
		},
		materials = {
			canteendirty = 1,
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "publiccraftone", "publiccrafttwo", "graverose", "sdicecream", "emeraldsaloon" , "elysian", "armbakery", "valsaloon", "blasaloon", "doysaloon", "bassaloon", "rhosaloon", "strawsaloon", "guarmasaloon", "tlsaloon", "valcandy", "blabakery" },
	},
-- Casino
['rustwoodwhiskey'] = {
    category = "Casino",
    toItems = {
        rustwoodwhiskey = 1,
    },
    materials = {
        refinedsugar = 1,
        corn = 1,
        barley = 1,
        cinnamon = 1,
        wheat = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "casino" },
},
['riverboatbrew'] = {
    category = "Casino",
    toItems = {
        riverboatbrew = 1,
    },
    materials = {
        barley = 1,
        refinedsugar = 1,
        orange = 1,
        apple = 1,
        wheat = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "casino" },
},
['porkrinds'] = {
    category = "Casino",
    toItems = {
        porkrinds = 1,
    },
    materials = {
        cookingoil = 1,
        salt = 1,
        pork_meat = 1,
        pepper = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "casino" },
},
	---MEDICS AND WILD DOCTORS
	['bandage'] = {
		category = "Medical",
		toItems = {
			bandage = 5,
		},
		materials = {
			cloth = 5,
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "medic","vhwilddoctor","strawprivatedoctor", "vtwilddoctor", "rdwilddoctor", "sdprivatedoctor", "tipaniwilddoctor", "comwilddoctor", "twwilddoctor"},
	},

	['cloth'] = {
		category = "Medical",
		toItems = {
			cloth = 5,
		},
		materials = {
			cotton = 5,
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "medic","vhwilddoctor","strawprivatedoctor", "vtwilddoctor", "rdwilddoctor", "publiccraftone", "publiccrafttwo", "sdprivatedoctor", "tipaniwilddoctor", "comwilddoctor", "twwilddoctor"},
	},

    ---ginseng extracts

    ['ginseng_extract'] = {
        category = "Medical",
        toItems = {
            ginseng_extract = 4,
        },
        materials = {
            consumable_herb_american_ginseng = 1,
        },
        craftingTime = 2500,
        craftingSkill = 0,
        customSkillGain = 0,
        skillName = 'crafting',
        tables = { "medic" ,"strawprivatedoctor","vhwilddoctor", "vtwilddoctor", "rdwilddoctor", "sdprivatedoctor", "tipaniwilddoctor", "comwilddoctor", "twwilddoctor", "vhhorsetrainer", "sdhorsetrainer", "rhodeshorsetrainer", "armahorsetrainer", "emeraldhorsetrainer", "bwhorsetrainer", "strawhorsetrainer", "valhorsetrainer", "macfarlaneshorsetrainer", "wapitihorsetrainer", "tumhorsetrainer", "valherbalist" },
    },

    ['ginseng_extract2'] = {
        category = "Medical",
        toItems = {
            ginseng_extract = 4,
        },
        materials = {
            consumable_herb_alaskan_ginseng = 1,
        },
        craftingTime = 2500,
        craftingSkill = 0,
        customSkillGain = 0,
        skillName = 'crafting',
        tables = { "medic" ,"strawprivatedoctor","vhwilddoctor", "vtwilddoctor", "rdwilddoctor", "sdprivatedoctor", "tipaniwilddoctor", "comwilddoctor", "twwilddoctor", "vhhorsetrainer", "sdhorsetrainer", "rhodeshorsetrainer", "armahorsetrainer", "emeraldhorsetrainer", "bwhorsetrainer", "strawhorsetrainer", "valhorsetrainer", "macfarlaneshorsetrainer", "wapitihorsetrainer", "tumhorsetrainer", "valherbalist" },
    },

	['herbalbandage'] = {
		category = "Medical",
		toItems = {
			herbalbandage = 10,
		},
		materials = {
			bandage = 10,
			sage = 10,
			ginseng_extract = 10,
            consumable_herb_yarrow = 10,
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "medic","strawprivatedoctor", "sdprivatedoctor", "tipaniwilddoctor", "comwilddoctor", "twwilddoctor" },
	},

	['tonic'] = {
		category = "Medical",
		toItems = {
			tonic = 10,
		},
		materials = {
			water = 10,
			bayleaves = 10,
			aloe = 10,
			lemon = 10,
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "medic","strawprivatedoctor", "sdprivatedoctor", "tipaniwilddoctor", "comwilddoctor", "twwilddoctor" },
	},

	['antipoison'] = {
		category = "Medical",
		toItems = {
			antipoison = 2,
		},
		materials = {
			water = 1,
			snakepoison = 1,
			bottle = 1,
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "medic" ,"strawprivatedoctor","vhwilddoctor", "vtwilddoctor", "rdwilddoctor", "sdprivatedoctor", "tipaniwilddoctor", "comwilddoctor", "twwilddoctor" },
	},

	['doctorbag'] = {
		category = "Medical",
		toItems = {
			doctorbag = 1,
		},
		materials = {
			tonic = 5,
			leather = 5,
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "medic","strawprivatedoctor", "sdprivatedoctor", "tipaniwilddoctor", "comwilddoctor", "twwilddoctor" },
	},

	['improvisedbandage'] = {
		category = "medical",
		toItems = {
			improvisedbandage = 10,
		},
		materials = {
			bandage = 10,
			sage = 10,
			ginseng_extract = 10,
            consumable_herb_yarrow = 10,
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "vhwilddoctor", "vtwilddoctor", "rdwilddoctor" },
	},

	['wildtonic '] = {
		category = "Medical",
		toItems = {
			wildtonic  = 10,
		},
		materials = {
			water = 10,
			bayleaves = 10,
			aloe = 10,
			lemon = 10,
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "vhwilddoctor" , "vtwilddoctor", "rdwilddoctor"},
	},

	['improviseddoctorbag'] = {
		category = "Medical",
		toItems = {
			improviseddoctorbag = 1,
		},
		materials = {
			wildtonic = 5,
			small_pelt = 1,
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "vhwilddoctor", "vtwilddoctor" , "rdwilddoctor"},
	},
    ['scentpouch'] = {
		category = "Medical",
		toItems = {
			scentpouch = 2,
		},
		materials = {
			consumable_herb_wild_mint = 1,
			chilipepper = 1,
            coffeebean = 1,
            garlic = 1,
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "strawprivatedoctor" },
	},
    ['midnighttea'] = {
		category = "Medical",
		toItems = {
			midnighttea = 2,
		},
		materials = {
			consumable_herb_wild_mint = 1,
			water = 1,
            lemon = 1,
            tealeaves = 1,
            consumable_herb_prairie_poppy = 1,
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "strawprivatedoctor" },
	},
    ['calmingchew'] = {
		category = "Medical",
		toItems = {
			calmingchew = 2,
		},
		materials = {
			rasberry = 1,
			consumable_herb_indian_tobacco = 1,
            water = 1,
            sage = 1,
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "strawprivatedoctor" },
	},

    --cinema

    ['popcorn'] = {
		category = "Cinema",
		toItems = {
			popcorn = 1,
		},
		materials = {
			corn = 1,
			salt = 1,
            cookingoil = 1,
            butter = 1,
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "cinema"},
	},

    ['peanuts'] = {
		category = "Cinema",
		toItems = {
			peanuts = 1,
		},
		materials = {
			bean = 1,
			salt = 1,
            refinedsugar = 1,
            cookingoil = 1,

		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "cinema"},
	},

    ['crayfishbites'] = {
		category = "Cinema",
		toItems = {
			crayfishbites = 1,
		},
		materials = {
			crayfish = 1,
			butter = 1,
            cookingoil = 1,
            flour = 1,

		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "cinema"},
	},

	
	-- Tobacco Products
	['drytobacco'] = {
		category = "Tobacco",
		toItems = {
			drytobacco = 1,
		},
		materials = {
			tobacco = 2,
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "tobaccoprocessone"},
	},
	['cigarette'] = {
		category = "Tobacco",
		toItems = {
			cigarette = 1,
		},
		materials = {
			drytobacco = 3,
			rollingpaper = 1,
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "tobaccoprocessone"},
	},
		['cigar'] = {
		category = "Tobacco",
		toItems = {
			cigar = 1,
		},
		materials = {
			drytobacco = 6,
			rollingpaper = 3,
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "tobaccoprocessone"},
	},
		['cigarette10'] = {
		category = "Tobacco",
		toItems = {
			cigarette10 = 1,
		},
		materials = {
			cigarette = 10,
			emptycigarettebox = 1,
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "tobaccoprocessone"},
	},
		['cigarbox'] = {
		category = "Tobacco",
		toItems = {
			cigarbox = 1,
		},
		materials = {
			cigar = 5,
			emptycigarbox = 1,
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "tobaccoprocessone"},
	},

	['weedjoint'] = {
		category = "Swamp",
		toItems = {
			weedjoint = 1,
		},
		materials = {
			dryweed = 4,
			rollingpaper = 1,
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "swampprocessone"},
	},
    -------------------------------------
	-------------------------------------
	---------Tobacco Business------------
	-------------------------------------
	-------------------------------------

        -- Grave Rose Tobacco Business
    ['nyxs'] = {
		category = "Tobacco",
		toItems = {
			nyxs = 3,        
		},
		materials = {
			drytobacco = 2,
            nightscented_extract = 1,
            consumable_herb_wild_mint = 1,
            rollingpaper = 1, 
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "elysian"},
	},
    ['nyxs_pack'] = {
		category = "Tobacco",
		toItems = {
			nyxs_pack = 1,        
		},
		materials = {
			nyxs = 10,
            emptycigarettebox = 1,
 
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "elysian"},
	},
    ['persephones_kiss_cigar'] = {
		category = "Tobacco",
		toItems = {
			persephones_kiss_cigar = 3,        
		},
		materials = {
			drytobacco = 4,
            queens_extract = 1,
            pomegranate = 1,
            rollingpaper = 2, 
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "elysian"},
	},
    ['persephones_kiss_cigar_box'] = {
		category = "Tobacco",
		toItems = {
			persephones_kiss_cigar_box = 1,        
		},
		materials = {
			persephones_kiss_cigar = 10,
            emptycigarbox = 1,
 
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "elysian"},
	},

    -- Grave Rose Tobacco Business
    ['blood_moon'] = {
		category = "Tobacco",
		toItems = {
			blood_moon = 3,        
		},
		materials = {
			drytobacco = 2,
            ladyflower_extract = 1,
            roses = 1,
            rollingpaper = 1, 
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "graverose"},
	},
    ['blood_moon_pack'] = {
		category = "Tobacco",
		toItems = {
			blood_moon_pack = 1,        
		},
		materials = {
			blood_moon = 10,
            emptycigarettebox = 1,
 
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "graverose"},
	},
    ['graveleaf_gold_cigar'] = {
		category = "Tobacco",
		toItems = {
			graveleaf_gold_cigar = 3,        
		},
		materials = {
			drytobacco = 4,
            goldnugget = 1,
            spiderflower_extract = 1,
            rollingpaper = 2, 
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "graverose"},
	},
    ['graveleaf_gold_cigar_box'] = {
		category = "Tobacco",
		toItems = {
			graveleaf_gold_cigar_box = 1,        
		},
		materials = {
			graveleaf_gold_cigar = 10,
            emptycigarbox = 1,
 
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "graverose"},
	},
    -- Blackwater Tobacco Business
    ['prairie_breeze'] = {
		category = "Tobacco",
		toItems = {
			prairie_breeze = 3,        
		},
		materials = {
			drytobacco = 2,
            consumable_herb_wild_mint = 1,
            consumable_herb_yarrow = 1,
            rollingpaper = 1, 
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "bwtobacco"},
	},
    ['prairie_breeze_pack'] = {
		category = "Tobacco",
		toItems = {
			prairie_breeze_pack = 1,        
		},
		materials = {
			prairie_breeze = 10,
            emptycigarettebox = 1,
 
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "bwtobacco"},
	},
    ['golden_leaf'] = {
		category = "Tobacco",
		toItems = {
			golden_leaf = 3,        
		},
		materials = {
			drytobacco = 2,
            honey = 1,
            consumable_herb_indian_tobacco = 1,
            rollingpaper = 1, 
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "bwtobacco"},
	},
    ['golden_leaf_pack'] = {
		category = "Tobacco",
		toItems = {
			golden_leaf_pack = 1,        
		},
		materials = {
			golden_leaf = 10,
            emptycigarettebox = 1,
 
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "bwtobacco"},
	},
    ['iron_horse_cigar'] = {
		category = "Tobacco",
		toItems = {
			iron_horse_cigar = 3,        
		},
		materials = {
			drytobacco = 4,
            consumable_herb_red_sage = 1,
            consumable_herb_burdock_root  = 1,
            rollingpaper = 2, 
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "bwtobacco"},
	},
    ['iron_horse_cigar_box'] = {
		category = "Tobacco",
		toItems = {
			iron_horse_cigar_box = 1,        
		},
		materials = {
			iron_horse_cigar = 10,
            emptycigarbox = 1,
 
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "bwtobacco"},
	},

    -- Rhodes Tobacco Business
    ['mourning_wing'] = {
		category = "Tobacco",
		toItems = {
			mourning_wing = 3,        
		},
		materials = {
			drytobacco = 2,
            rasberry = 1,
            consumable_herb_wild_mint = 1,
            rollingpaper = 1, 
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "rhotobacco"},
	},
    ['mourning_wing_pack'] = {
		category = "Tobacco",
		toItems = {
			mourning_wing_pack = 1,        
		},
		materials = {
			mourning_wing = 10,
            emptycigarettebox = 1,
 
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "rhotobacco"},
	},
    ['ashen_bloom'] = {
		category = "Tobacco",
		toItems = {
			ashen_bloom = 3,        
		},
		materials = {
			drytobacco = 2,
            consumable_herb_black_berry = 1,
            consumable_herb_violet_snowdrop = 1,
            rollingpaper = 1, 
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "rhotobacco"},
	},
    ['ashen_bloom_pack'] = {
		category = "Tobacco",
		toItems = {
			ashen_bloom_pack = 1,        
		},
		materials = {
			ashen_bloom = 10,
            emptycigarettebox = 1,
 
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "rhotobacco"},
	},
    ['blackfeather_cigar'] = {
		category = "Tobacco",
		toItems = {
			blackfeather_cigar = 3,        
		},
		materials = {
			drytobacco = 4,
            coffeebean = 1,
            consumable_herb_vanilla_flower  = 1,
            rollingpaper = 2, 
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "rhotobacco"},
	},
    ['blackfeather_cigar_box'] = {
		category = "Tobacco",
		toItems = {
			blackfeather_cigar_box = 1,        
		},
		materials = {
			blackfeather_cigar = 10,
            emptycigarbox = 1,
 
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "rhotobacco"},
	},

    -- Tobacco Extras
        ['pipe'] = {
		category = "Extra",
		toItems = {
			pipe = 1,        
		},
		materials = {
			wood = 2,
            animalfat = 1,
 
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "rhotobacco", "bwtobacco" },
	},
        ['rollingpaper'] = {
		category = "Extra",
		toItems = {
			rollingpaper = 5,        
		},
		materials = {
			pulp = 2,
 
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "rhotobacco", "bwtobacco" },
	},
        ['emptycigarettebox'] = {
		category = "Extra",
		toItems = {
			emptycigarettebox = 1,        
		},
		materials = {
			pulp = 2,
 
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "rhotobacco", "bwtobacco" },
	},
        ['emptycigarbox'] = {
		category = "Extra",
		toItems = {
			emptycigarbox = 1,        
		},
		materials = {
			wood = 1,
            leather = 1,
 
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "rhotobacco", "bwtobacco" },
	},




    -- Wood Processing

	['fibres1'] = {
		category = "Processing",
		toItems = {
			fibres = 5,
		},
		materials = {
			wood = 1,
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "woodprocessingone", "woodprocessingtwo"},
	},
    ['fibres2'] = {
		category = "Processing",
		toItems = {
			fibres = 5,
		},
		materials = {
			hardwood = 1,
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "woodprocessingone", "woodprocessingtwo"},
	},
    ['fibres3'] = {
		category = "Processing",
		toItems = {
			fibres = 5,
		},
		materials = {
			yewwood = 1,
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "woodprocessingone", "woodprocessingtwo"},
	},
    ['fibres4'] = {
		category = "Processing",
		toItems = {
			fibres = 5,
		},
		materials = {
			hickorywood = 1,
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "woodprocessingone", "woodprocessingtwo"},
	},
    --
    ['pulp1'] = {
		category = "Processing",
		toItems = {
			pulp = 5,
		},
		materials = {
			wood = 1,
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "woodprocessingone", "woodprocessingtwo"},
	},
    ['pulp2'] = {
		category = "Processing",
		toItems = {
			pulp = 5,
		},
		materials = {
			hardwood = 1,
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "woodprocessingone", "woodprocessingtwo"},
	},
    ['pulp3'] = {
		category = "Processing",
		toItems = {
			pulp = 5,
		},
		materials = {
			yewwood = 1,
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "woodprocessingone", "woodprocessingtwo"},
	},
    ['pulp4'] = {
		category = "Processing",
		toItems = {
			pulp = 5,
		},
		materials = {
			hickorywood = 1,
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "woodprocessingone", "woodprocessingtwo"},
	},
    --
    ['treebark1'] = {
		category = "Processing",
		toItems = {
			treebark = 5,
		},
		materials = {
			wood = 1,
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "woodprocessingone", "woodprocessingtwo"},
	},
    ['treebark2'] = {
		category = "Processing",
		toItems = {
			treebark = 5,
		},
		materials = {
			hardwood = 1,
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "woodprocessingone", "woodprocessingtwo"},
	},
    ['treebark3'] = {
		category = "Processing",
		toItems = {
			treebark = 5,
		},
		materials = {
			yewwood = 1,
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "woodprocessingone", "woodprocessingtwo"},
	},
    ['treebark4'] = {
		category = "Processing",
		toItems = {
			treebark = 5,
		},
		materials = {
			hickorywood = 1,
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "woodprocessingone", "woodprocessingtwo"},
	},
    --
    ['sap1'] = {
		category = "Processing",
		toItems = {
			sap = 5,
		},
		materials = {
			wood = 1,
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "woodprocessingone", "woodprocessingtwo"},
	},
    ['sap2'] = {
		category = "Processing",
		toItems = {
			sap = 5,
		},
		materials = {
			hardwood = 1,
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "woodprocessingone", "woodprocessingtwo"},
	},
    ['sap3'] = {
		category = "Processing",
		toItems = {
			sap = 5,
		},
		materials = {
			yewwood = 1,
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "woodprocessingone", "woodprocessingtwo"},
	},
    ['sap4'] = {
		category = "Processing",
		toItems = {
			sap = 5,
		},
		materials = {
			hickorywood = 1,
		},
		craftingTime = 2500,
		craftingSkill = 0,
		customSkillGain = 0,
		skillName = 'crafting',
		tables = { "woodprocessingone", "woodprocessingtwo"},
	},


	-------------------------------------
	----------------------------------------------------------
	----------------------------------------------------------
	---------------------
	-- HORSE TRAINERS

	['consumable_sugarcube'] = {
	category = "Horsetrainer",
	toItems = {
		consumable_sugarcube = 1,
	},
	materials = {
		sugarcane = 2,
	},
	craftingTime = 2500,
	craftingSkill = 0,
	customSkillGain = 0,
	skillName = 'crafting',
	tables = { 
		"vhhorsetrainer",
		"sdhorsetrainer",
		"rhodeshorsetrainer",
		"armahorsetrainer",
		"emeraldhorsetrainer",
		"bwhorsetrainer",
		"strawhorsetrainer",
		"valhorsetrainer",
        "macfarlaneshorsetrainer",
        "wapitihorsetrainer",
        "tumhorsetrainer"
	},
},

['consumable_horse_reviver'] = {
	category = "Horsetrainer",
	toItems = {
		consumable_horse_reviver = 1,
	},
	materials = {
		lemon = 1,
        consumable_herb_wild_mint = 1,
		consumable_sugarcube = 3,
	},
	craftingTime = 2500,
	craftingSkill = 0,
	customSkillGain = 0,
	skillName = 'crafting',
	tables = { 
		"vhhorsetrainer",
		"sdhorsetrainer",
		"rhodeshorsetrainer",
		"armahorsetrainer",
		"emeraldhorsetrainer",
		"bwhorsetrainer",
		"strawhorsetrainer",
		"valhorsetrainer",
        "macfarlaneshorsetrainer",
        "wapitihorsetrainer",
        "tumhorsetrainer"
	},
},

['horse_stimulant'] = {
	category = "Horsetrainer",
	toItems = {
		horse_stimulant = 1,
	},
	materials = {
		ginseng_extract = 2,
		consumable_sugarcube = 5,
		water = 1,
	},
	craftingTime = 2500,
	craftingSkill = 0,
	customSkillGain = 0,
	skillName = 'crafting',
	tables = { 
		"vhhorsetrainer",
		"sdhorsetrainer",
		"rhodeshorsetrainer",
		"armahorsetrainer",
		"emeraldhorsetrainer",
		"bwhorsetrainer",
		"strawhorsetrainer",
		"valhorsetrainer",
        "macfarlaneshorsetrainer",
        "wapitihorsetrainer",
        "tumhorsetrainer"
	},
},

['horse_brush'] = {
	category = "Horsetrainer",
	toItems = {
		horse_brush = 1,
	},
	materials = {
		wood = 2,
		boarhair = 2,
        leather = 2,
	},
	craftingTime = 2500,
	craftingSkill = 0,
	customSkillGain = 0,
	skillName = 'crafting',
	tables = { 
		"vhhorsetrainer",
		"sdhorsetrainer",
		"rhodeshorsetrainer",
		"armahorsetrainer",
		"emeraldhorsetrainer",
		"bwhorsetrainer",
		"strawhorsetrainer",
		"valhorsetrainer",
        "macfarlaneshorsetrainer",
        "wapitihorsetrainer",
        "tumhorsetrainer"
	},
},

['hay'] = {
	category = "Horsetrainer",
	toItems = {
		hay = 1,
	},
	materials = {
		wheat = 10,
	},
	craftingTime = 2500,
	craftingSkill = 0,
	customSkillGain = 0,
	skillName = 'crafting',
	tables = { 
		"vhhorsetrainer",
		"sdhorsetrainer",
		"rhodeshorsetrainer",
		"armahorsetrainer",
		"emeraldhorsetrainer",
		"bwhorsetrainer",
		"strawhorsetrainer",
		"valhorsetrainer",
        "macfarlaneshorsetrainer",
        "wapitihorsetrainer",
        "tumhorsetrainer"
	},
},


----------------------------------------------
---
---
---			RESTAURANT

-- Graverose
['deathrolldinner'] = {
    category = "Food",
    toItems = {
        deathrolldinner = 1,
    },
    materials = {
        gator_meat = 1,
        sparrowsflower_petal = 1,
        provision_disco_gator_egg = 1,
        apple = 1,
        cookingoil = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "graverose" },
},

['gravemelts'] = {
    category = "Food",
    toItems = {
        gravemelts = 3,
    },
    materials = {
        animalfat = 1,
        consumable_herb_evergreen_huckleberry = 1,
        provision_disco_gator_egg = 1,
        dragonflower_extract = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "graverose" },
},

['velvetandvine'] = {
    category = "Food",
    toItems = {
        velvetandvine = 3,
    },
    materials = {
        strawberry = 2,
        chocolate = 1,
        ladyflower_extract = 1
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "graverose" },
},

['badomen'] = {
    category = "Drink",
    toItems = {
        badomen = 3,
    },
    materials = {
        cherries = 1,
        water = 1,
        provision_disco_gator_egg = 1,
        vanilla_extract = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "graverose" },
},

['mourningdew'] = {
    category = "Drink",
    toItems = {
        mourningdew = 1,
    },
    materials = {
        apple = 1,
        plum = 1,
        water = 1,
        ghostflower_extract = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "graverose" },
},

['bitterblossom'] = {
    category = "Drink",
    toItems = {
        bitterblossom = 1,
    },
    materials = {
        kiwi = 1,
        watermelon = 1,
        water = 1,
        spiderflower_extract = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "graverose" },
},

['fallenstar'] = {
    category = "Drink",
    toItems = {
        fallenstar = 1,
    },
    materials = {
        provision_ro_flower_acunas_star = 1,
        roses = 1,
        wormwood = 1,
        goldnugget = 1,
        anise = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "graverose" },
},

['moonmist'] = {
    category = "Drink",
    toItems = {
        moonmist = 1,
    },
    materials = {
        coconut = 1,
        dragonflower_extract = 1,
        water = 1,
        consumable_herb_evergreen_huckleberry = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "graverose" },
},

-- Armadillo Saloon
['toogoodchili'] = {
    category = "Food",
    toItems = {
        toogoodchili = 1,
    },
    materials = {
        smallgamemeat = 1,
        chilipepper = 1,
        bean = 1,
        consumable_herb_wild_carrots = 1,
        onion = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "armsaloon" },
},

['depuyer'] = {
    category = "Food",
    toItems = {
        depuyer = 1,
    },
    materials = {
        animalfat = 1,
        biggamemeat = 1,
        cookingoil = 1,
        garlic = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "armsaloon" },
},

['trail_mix'] = {
    category = "Food",
    toItems = {
        trail_mix = 1,
    },
    materials = {
        pumpkin = 1,
        provision_wldflwr_wild_rhubarb = 1,
        rasberry = 1,
        consumable_herb_burdock_root = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "armsaloon" },
},

['cactuswater'] = {
    category = "Drink",
    toItems = {
        cactuswater = 1,
    },
    materials = {
        water = 1,
        cactuspulp = 1,
        aloe = 1,
        cucumber = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "armsaloon" },
},

['rancheropunch'] = {
    category = "Drink",
    toItems = {
        rancheropunch = 1,
    },
    materials = {
        prickly_pear = 1,
        wheat = 1,
        chilipepper = 1,
        refinedsugar = 1,
        consumable_herb_yarrow = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "armsaloon" },
},

-- Saint Denis Ice Cream
['icecreamsundae'] = {
    category = "Food",
    toItems = {
        icecreamsundae = 1,
    },
    materials = {
        vanilla_extract = 1,
        chocolate = 1,
        milk = 1,
        refinedsugar = 1,
        salt = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "sdicecream" },
},

['bigsauceyballs'] = {
    category = "Food",
    toItems = {
        bigsauceyballs = 1,
    },
    materials = {
        dough = 1,
        refinedsugar = 1,
        cinnamon = 1,
        butter = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "sdicecream" },
},

['gummywhales'] = {
    category = "Food",
    toItems = {
        gummywhales = 5,
    },
    materials = {
        refinedsugar = 1,
        water = 1,
        consumable_herb_evergreen_huckleberry  = 1,
        animalfat = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "sdicecream" },
},

['brightonrootbeer'] = {
    category = "Drink",
    toItems = {
        brightonrootbeer = 1,
    },
    materials = {
        consumable_herb_burdock_root = 1,
        refinedsugar = 1,
        water = 1,
        vanilla_extract = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "sdicecream" },
},

['choccyshake'] = {
    category = "Drink",
    toItems = {
        choccyshake = 1,
    },
    materials = {
        chocolate = 1,
        milk = 1,
        refinedsugar = 1,
        cream = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "sdicecream" },
},
-- Rhodes Candy Shop
['barbslolis'] = {
    category = "Food",
    toItems = {
        barbslolis = 5,
    },
    materials = {
        refinedsugar = 1,
        orange = 1,
        lemon  = 1,
        pomegranate = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "valcandy" },
},
['chocolatebox'] = {
    category = "Food",
    toItems = {
        chocolatebox = 5,
    },
    materials = {
        refinedsugar = 1,
        chocolate = 1,
        coconut  = 1,
        cherries = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "valcandy" },
},
['butterscotch'] = {
    category = "Food",
    toItems = {
        butterscotch = 5,
    },
    materials = {
        refinedsugar = 1,
        butter = 1,
        vanilla_extract  = 1,
        honey = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "valcandy" },
},
['candyapple'] = {
    category = "Food",
    toItems = {
        candyapple = 3,
    },
    materials = {
        refinedsugar = 1,
        apple = 1,
        honey  = 1,
        cherries = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "valcandy" },
},
['peppermintcoco'] = {
    category = "Food",
    toItems = {
        peppermintcoco = 1,
    },
    materials = {
        refinedsugar = 1,
        milk = 1,
        chocolate  = 1,
        mint_extract = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "valcandy" },
},
-- Blackwater Bakery
['lecroissant'] = {
    category = "Food",
    toItems = {
        lecroissant = 1,
    },
    materials = {
        ginseng_extract = 1,
        pork_meat = 1,
        eggs  = 1,
        cheese = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "blabakery" },
},
['midnightstrawberry'] = {
    category = "Food",
    toItems = {
        midnightstrawberry = 3,
    },
    materials = {
        milk = 1,
        chocolate = 1,
        flour  = 1,
        strawberries = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "blabakery" },
},
['strawberrymilk'] = {
    category = "Food",
    toItems = {
        strawberrymilk = 1,
    },
    materials = {
        refinedsugar = 1,
        milk = 1,
        consumable_herb_evergreen_huckleberry  = 1,
        strawberries = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "blabakery" },
},
['pumpkinspicelatte'] = {
    category = "Food",
    toItems = {
        pumpkinspicelatte = 1,
    },
    materials = {
        refinedsugar = 1,
        milk = 1,
        pumpkin  = 1,
        coffeebean = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "blabakery" },
},
['macarons'] = {
    category = "Food",
    toItems = {
        macarons = 3,
    },
    materials = {
        refinedsugar = 1,
        milk = 1,
        flour  = 1,
        vanilla_extract = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "blabakery" },
},
-- Thieves Landing Saloon
['irishstew'] = {
    category = "Food",
    toItems = {
        irishstew = 1,
    },
    materials = {
        sheep_meat = 1,
        potato = 1,
        carrot = 1,
        onion = 1,
        oregano = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "tlsaloon" },
},
['potatosoup'] = {
    category = "Food",
    toItems = {
        potatosoup = 1,
    },
    materials = {
        garlic = 1,
        pork_meat = 1,
        milk = 1,
        cheese = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "tlsaloon" },
},
['landingsalad'] = {
    category = "Food",
    toItems = {
        landingsalad = 1,
    },
    materials = {
        raw_fish = 1,
        cucumber = 1,
        lettuce = 1,
        tomato = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "tlsaloon" },
},
['newaustinicedtea'] = {
    category = "Drink",
    toItems = {
        newaustinicedtea = 1,
    },
    materials = {
        tealeaves = 1,
        rasberry = 1,
        ginseng_extract = 1
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "tlsaloon" },
},
['doylestout'] = {
    category = "Drink",
    toItems = {
        doylestout = 2,
    },
    materials = {
        consumable_herb_golden_currant = 1,
        potato = 1,
        barley = 1,
        wheat = 1,
        orange = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "tlsaloon" },
},
-- The Bastille
['loadedsteakfries'] = {
    category = "Food",
    toItems = {
        loadedsteakfries = 1,
    },
    materials = {
        beef_meat = 1,
        cookingoil = 1,
        cheese = 1,
        potato = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "bassaloon" },
},
['chickenfettuccine'] = {
    category = "Food",
    toItems = {
        chickenfettuccine = 1,
    },
    materials = {
        chicken_meat = 1,
        cream = 1,
        dough = 1,
        butter = 1,
        cheese = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "bassaloon" },
},
['strawberrycheesecake'] = {
    category = "Food",
    toItems = {
        strawberrycheesecake = 1,
    },
    materials = {
        cream = 1,
        milk = 1,
        refinedsugar = 1,
        strawberry = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "bassaloon" },
},
['oceanbreeze'] = {
    category = "Drink",
    toItems = {
        oceanbreeze = 1,
    },
    materials = {
        coconut = 1,
        peach = 1,
        kiwi = 1,
        consumable_herb_red_raspberry = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "bassaloon" },
},
['corruptcocktail'] = {
    category = "Drink",
    toItems = {
        corruptcocktail = 2,
    },
    materials = {
        mint_extract = 1,
        refinedsugar = 1,
        vodka = 1,
        chilipepper = 1,
        watermelon = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "bassaloon" },
},
-- Tumbleweed Saloon
['chilliconcarne'] = {
    category = "Food",
    toItems = {
        chilliconcarne = 1,
    },
    materials = {
        biggamemeat = 1,
        chilipepper = 1,
        consumable_kidneybeans_can = 1,
        potato = 1,
        garlic = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "tumsaloon" },
},
['taco'] = {
    category = "Food",
    toItems = {
        taco = 1,
    },
    materials = {
        smallgamemeat = 1,
        consumable_kidneybeans_can = 1,
        cheese = 1,
        onion = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "tumsaloon" },
},
['tamale'] = {
    category = "Food",
    toItems = {
        tamale = 1,
    },
    materials = {
        beef_meat = 1,
        salt = 1,
        cheese = 1,
        corn = 1,
        butter = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "tumsaloon" },
},
['aguadelimon'] = {
    category = "Drink",
    toItems = {
        aguadelimon = 1,
    },
    materials = {
        water = 1,
        lemon = 1,
        consumable_sugarcube = 1,
        prickly_pear = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "tumsaloon" },
},
['tequila'] = {
    category = "Drink",
    toItems = {
        tequila = 1,
    },
    materials = {
        water = 1,
        consumable_herb_desert_sage = 1,
        lemon = 1,
        salt = 1,
        consumable_sugarcube = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "tumsaloon" },
},
['whisky'] = {
    category = "Extra",
    toItems = {
        whisky = 2,
    },
    materials = {
        water = 1,
        barley = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "emeraldsaloon", "elysian" },
},

-- Strawberry Saloon
['herbedvenison'] = {
    category = "Food",
    toItems = {
        herbedvenison = 1,
    },
    materials = {
        biggamemeat = 1,
        butter = 1,
        potato = 1,
        oregano = 1,
        flour = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "strawsaloon" },
},
['cheesychickendumpling'] = {
    category = "Food",
    toItems = {
        cheesychickendumpling = 1,
    },
    materials = {
        chicken_meat = 1,
        broth = 1,
        dough = 1,
        cheese = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "strawsaloon" },
},
['strawberryshortcake'] = {
    category = "Food",
    toItems = {
        strawberryshortcake = 1,
    },
    materials = {
        strawberry = 1,
        flour = 1,
        eggs = 1,
        refinedsugar = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "strawsaloon" },
},
['strawberryspritzer'] = {
    category = "Food",
    toItems = {
        strawberryspritzer = 1,
    },
    materials = {
        strawberry = 1,
        water = 1,
        honey = 1,
        refinedsugar = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "strawsaloon" },
},
['strawberryrhubarbwhiskey'] = {
    category = "Food",
    toItems = {
        strawberryrhubarbwhiskey = 1,
    },
    materials = {
        wheat = 1,
        water = 1,
        refinedsugar = 1,
        rasberry = 1,
        strawberry = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "strawsaloon" },
},

---taste of japan
['noodlesoup'] = {
    category = "Food",
    toItems = {
        noodlesoup = 1,
    },
    materials = {
        pork_meat = 1,
        flour = 1,
        eggs = 1,
        onion = 1,
        salt = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "tasteofjapan" },
},
['nigiri'] = {
    category = "Food",
    toItems = {
        nigiri = 1,
    },
    materials = {
        rice = 1,
        raw_fish = 1,
        cucumber = 1,
        carrot = 1,
        
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "tasteofjapan" },
},
['sashimi'] = {
    category = "Food",
    toItems = {
        sashimi = 1,
    },
    materials = {
        salt = 1,
        raw_fish = 1,
        cucumber = 1,
        onion = 1,
        
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "tasteofjapan" },
},
['rasberrysake'] = {    
    category = "Drink",
    toItems = {
        rasberrysake = 1,
    },
    materials = {
        rasberry = 1,
        refinedsugar = 1,
        rice = 1,
        consumable_herb_yarrow = 1,
        water = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "tasteofjapan" },
},
['matchatea'] = {
    category = "Drink",
    toItems = {
        matchatea = 1,
    },
    materials = {
        tealeaves = 1,
        water = 1,
        refinedsugar = 1,
        honey = 1,
        
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "tasteofjapan" },
},


-- Elysian Food Items
['honeytea'] = {
    category = "Food",
    toItems = {
        honeytea = 1,
    },
    materials = {
        tealeaves = 1,
        honey = 1,
        lemon = 1,
        water = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "elysian" },
},
['pommartini'] = {
    category = "Food",
    toItems = {
        pommartini = 1,
    },
    materials = {
        vodka = 1,
        pomegranate = 1,
        refinedsugar = 1,
        lemon = 1,
		orange = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "elysian" },
},
['grog'] = {
    category = "Food",
    toItems = {
        grog = 1,
    },
    materials = {
        refinedsugar = 1,
        lemon = 1,
        water = 1,
        cinnamon = 1,
		rum = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "elysian" },
},
['mintlemonade'] = {
    category = "Food",
    toItems = {
        mintlemonade = 1,
    },
    materials = {
        refinedsugar = 1,
        lemon = 1,
        water = 1,
        mint_extract = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "elysian" },
},
['pitatzatziki'] = {
    category = "Food",
    toItems = {
        pitatzatziki = 3,
    },
    materials = {
        flour = 1,
        cucumber = 1,
        cream = 1,
        cookingoil = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "elysian" },
},
['choccypommies'] = {
    category = "Food",
    toItems = {
        choccypommies = 3,
    },
    materials = {
        chocolate = 1,
        refinedsugar = 1,
        pomegranate = 1,
        salt = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "elysian" },
},
['crabcakes'] = {
    category = "Food",
    toItems = {
        crabcakes = 1,
    },
    materials = {
        crab = 1,
        eggs = 1,
        cookingoil = 1,
        lemon = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "elysian" },
},
['danioldfashioned'] = {
    category = "Food",
    toItems = {
        danioldfashioned = 1,
    },
    materials = {
        whisky = 1,
        orange = 1,
        chocolate = 1,
        refinedsugar = 1,
		chilipepper = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "elysian" },
},

-- Blackwater Saloon
['bisonstew'] = {
    category = "Food",
    toItems = {
        bisonstew = 1,
    },
    materials = {
        biggamemeat = 1,
        broth = 1,
        carrot = 1,
        onion = 1,
		chilipepper = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "blasaloon" },
},
['applefrybread'] = {
    category = "Food",
    toItems = {
        applefrybread = 1,
    },
    materials = {
        apple = 1,
        dough = 1,
        milk = 1,
        vanilla_extract = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "blasaloon" },
},
['squashsoup'] = {
    category = "Food",
    toItems = {
        squashsoup = 1,
    },
    materials = {
        corn = 1,
        potato = 1,
        onion = 1,
        pumpkin = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "blasaloon" },
},
['spikedpinole'] = {
    category = "Food",
    toItems = {
        spikedpinole = 1,
    },
    materials = {
        wheat = 1,
        corn = 1,
        honey = 1,
        cinnamon = 1,
        milk = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "blasaloon" },
},
['curranttea'] = {
    category = "Food",
    toItems = {
        curranttea = 1,
    },
    materials = {
        honey = 1,
        consumable_herb_golden_currant = 1,
        water = 1,
        consumable_herb_red_raspberry = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "blasaloon" },
},
-- Valentine Saloon
['steakeggs'] = {
    category = "Food",
    toItems = {
        steakeggs = 1,
    },
    materials = {
        beef_meat = 1,
        eggs = 1,
        salt = 1,
        onion = 1,
        cookingoil = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "valsaloon" },
},
['schmuddpie'] = {
    category = "Food",
    toItems = {
        schmuddpie = 1,
    },
    materials = {
        flour = 1,
        chocolate = 1,
        milk = 1,
        refinedsugar = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "valsaloon" },
},
['biscuitsngravy'] = {
    category = "Food",
    toItems = {
        biscuitsngravy = 1,
    },
    materials = {
        milk = 1,
        flour = 1,
        eggs = 1,
        pepper = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "valsaloon" },
},
['chocolatemilk'] = {
    category = "Food",
    toItems = {
        chocolatemilk = 1,
    },
    materials = {
        milk = 1,
        chocolate = 1,
        refinedsugar = 1,
        cinnamon  = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "valsaloon" },
},
['blushwhiskey'] = {
    category = "Food",
    toItems = {
        blushwhiskey = 1,
    },
    materials = {
        corn = 1,
        refinedsugar = 1,
        watermelon = 1,
        wheat = 1,
        water = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "valsaloon" },
},

-- Emerald Saloon
['meatloaf'] = {
    category = "Emerald Ranch",
    toItems = {
        meatloaf = 1,
    },
    materials = {
        salt = 1,
        tomato = 1,
        onion = 1,
        potato = 1,
		beef_meat = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "emeraldsaloon" },
},
['brunswickstew'] = {
    category = "Emerald Ranch",
    toItems = {
        brunswickstew = 1,
    },
    materials = {
        beef_meat = 1,
        corn = 1,
        onion = 1,
        tomato = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "emeraldsaloon" },
},
['hushpuppies'] = {
    category = "Emerald Ranch",
    toItems = {
        hushpuppies = 1,
    },
    materials = {
        flour = 1,
        milk = 1,
        onion = 1,
        cookingoil = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "emeraldsaloon" },
},
['whiskeysour'] = {
    category = "Emerald Ranch",
    toItems = {
        whiskeysour = 1,
    },
    materials = {
        lemon = 1,
        eggs = 1,
        refinedsugar = 1,
        whisky = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "emeraldsaloon" },
},
['cherrysoda'] = {
    category = "Emerald Ranch",
    toItems = {
        cherrysoda = 1,
    },
    materials = {
        refinedsugar = 1,
        water = 1,
        lemon = 1,
        cherries = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "emeraldsaloon" },
},
-- Guarma Saloon
['hottea'] = {
    category = "Food",
    toItems = {
        hottea = 1,
    },
    materials = {
        refinedsugar = 1,
        milk = 1,
        water = 1,
        tealeaves = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "guarmasaloon" },
},
['virginpinacolada'] = {
    category = "Food",
    toItems = {
        virginpinacolada = 1,
    },
    materials = {
        refinedsugar = 1,
        kiwi = 1,
        pineapple = 1,
        coconut = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "guarmasaloon" },
},
['chickenricebeans'] = {
    category = "Food",
    toItems = {
        chickenricebeans = 1,
    },
    materials = {
        chicken_meat = 1,
        bean = 1,
        rice = 1,
        garlic = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "guarmasaloon" },
},
['wingsnfries'] = {
    category = "Food",
    toItems = {
        wingsnfries = 1,
    },
    materials = {
        chicken_meat = 1,
        potato = 1,
        chilipepper = 1,
        pineapple = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "guarmasaloon" },
},
['crawfishboil'] = {
    category = "Food",
    toItems = {
        crawfishboil = 1,
    },
    materials = {
        crayfish = 1,
        corn = 1,
        onion = 1,
        potato = 1,
        pepper = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "guarmasaloon" },
},
-- Hicks
['applepieshine'] = {
    category = "Drink",
    toItems = {
        applepieshine = 7,
    },
    materials = {
        moonshine = 1,
        bottle = 7,
        apple = 2,
        cinnamon = 2,
        refinedsugar  = 2,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "bluemixologist" },
},
['peachcobblershine'] = {
    category = "Drink",
    toItems = {
        peachcobblershine = 7,
    },
    materials = {
        moonshine = 1,
        bottle = 7,
        peach = 2,
        cinnamon = 2,
        refinedsugar  = 2,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "bluemixologist" },
},
['swamppunchshine'] = {
    category = "Drink",
    toItems = {
        swamppunchshine = 7,
    },
    materials = {
        moonshine = 1,
        bottle = 7,
        peach = 2,
        orange = 2,
        rasberry  = 2,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "bluemixologist" },
},
-- Frankies
['jamboozle'] = {
    category = "Food",
    toItems = {
        jamboozle = 1,
    },
    materials = {
        gin = 1,
        lemon = 1,
        water = 1,
        honey = 1,
        consumable_herb_black_berry  = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "rhosaloon" },
},
['fruitpunch'] = {
    category = "Food",
    toItems = {
        fruitpunch = 1,
    },
    materials = {
        refinedsugar = 1,
        apple = 1,
        orange = 1,
        rasberry = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "rhosaloon" },
},
['gabagoolsandwich'] = {
    category = "Food",
    toItems = {
        gabagoolsandwich = 1,
    },
    materials = {
        pork_meat = 1,
        bread = 1,
        cheese = 1,
        pepper = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "rhosaloon" },
},
['loadedpotato'] = {
    category = "Food",
    toItems = {
        loadedpotato = 1,
    },
    materials = {
        biggamemeat = 1,
        potato = 1,
        cheese = 1,
        butter = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "rhosaloon" },
},
['farmerbrunch'] = {
    category = "Food",
    toItems = {
        farmerbrunch = 1,
    },
    materials = {
        eggs = 1,
        pork_meat = 1,
        bean = 1,
        potato = 1,
        tomato = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "rhosaloon" },
},
-- general crafting
['coffe'] = {
    category = "Basics",
    toItems = {
        coffee = 1,
    },
    materials = {
        water = 1,
        coffeebean = 2,

    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "graverose", "sdicecream", "emeraldsaloon" , "elysian", "armbakery", "valsaloon", "blasaloon", "doysaloon", "bassaloon", "rhosaloon", "strawsaloon", "guarmasaloon" },
},
['lemonade'] = {
    category = "Basics",
    toItems = {
        lemonade = 1,
    },
    materials = {
        water = 1,
        lemon = 2,

    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "graverose", "sdicecream", "emeraldsaloon" , "elysian", "armbakery", "valsaloon", "blasaloon", "doysaloon", "bassaloon", "rhosaloon", "strawsaloon", "guarmasaloon" },
},
-- Extra Steps for ingredients 
['rum'] = {
    category = "Extra",
    toItems = {
        rum = 2,
    },
    materials = {
        water = 1,
        sugarcane = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "elysian" },
},
['vodka'] = {
    category = "Extra",
    toItems = {
        vodka = 2,
    },
    materials = {
        water = 1,
        potato = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "elysian", "bassaloon" },
},
['gin'] = {
    category = "Extra",
    toItems = {
        gin = 2,
    },
    materials = {
        water = 1,
        consumable_herb_evergreen_huckleberry = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "rhosaloon" },
},


-- Campfire Public Crafts
['sheperdspie'] = {
    category = "Food",
    toItems = {
        sheperdspie = 1,
    },
    materials = {
        beef_meat = 1,
        potato = 1,
        corn = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "camping" },
},
['steak'] = {
    category = "Food",
    toItems = {
        steak = 1,
    },
    materials = {
        beef_meat = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "camping" },
},
['steak2'] = {
    category = "Food",
    toItems = {
        steak = 1,
    },
    materials = {
        smallgamemeat = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "camping" },
},
['steak3'] = {
    category = "Food",
    toItems = {
        steak = 1,
    },
    materials = {
        biggamemeat = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "camping" },
},
['bacon'] = {
    category = "Food",
    toItems = {
        bacon = 1,
    },
    materials = {
        pork_meat = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "camping" },
},
['stew'] = {
    category = "Stew",
    toItems = {
        stew = 1,
    },
    materials = {
        biggamemeat = 1,
		potato = 1,
		carrot = 1,
        bayleaves = 1
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "camping" },
},
['fishstew'] = {
    category = "Stew",
    toItems = {
        fishstew = 1,
    },
    materials = {
        raw_fish = 1,
		potato = 1,
		onion = 1,
        bayleaves = 1
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "camping" },
},
['seafoodstew'] = {
    category = "Stew",
    toItems = {
        seafoodstew = 1,
    },
    materials = {
        lobster = 1,
		potato = 1,
		carrot = 1,
        raw_fish = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "camping" },
},
['gumbo'] = {
    category = "Stew",
    toItems = {
        gumbo = 1,
    },
    materials = {
        sausage = 1,
		potato = 1,
		carrot = 1,
        rice = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "camping" },
},
['gatorgumbo'] = {
    category = "Stew",
    toItems = {
        gatorgumbo = 1,
    },
    materials = {
        gator_meat = 1,
		onion = 1,
		garlic = 1,
        bayleaves = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "camping" },
},

-- Saloon Material Crafts
['dough'] = {
    category = "Baking",
    toItems = {
        dough = 5,
    },
    materials = {
        flour = 1,
		water = 1,

    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "graverose", "sdicecream", "emeraldsaloon" , "elysian", "armbakery", "valsaloon", "blasaloon", "doysaloon", "bassaloon", "rhosaloon", "strawsaloon", "guarmasaloon", "tlsaloon", "valcandy", "blabakery" },
},


--Extracts
['ghostflower_extract'] = {
    category = "extracts",
    toItems = {
        ghostflower_extract = 3,
    },
    materials = {
        provision_ro_flower_ghost = 1,

    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "graverose" },
},
['spiderflower_extract'] = {
    category = "extracts",
    toItems = {
        spiderflower_extract = 3,
    },
    materials = {
        provision_ro_flower_spider = 1,

    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "graverose" },
},
['sparrowsflower_petal'] = {
    category = "extracts",
    toItems = {
        sparrowsflower_petal = 3,
    },
    materials = {
        provision_ro_flower_sparrows = 1,

    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "graverose" },
},
['dragonflower_extract'] = {
    category = "extracts",
    toItems = {
        dragonflower_extract = 3,
    },
    materials = {
        provision_ro_flower_dragons = 1,

    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "graverose" },
},
['nightscented_extract'] = {
    category = "extracts",
    toItems = {
        nightscented_extract = 3,
    },
    materials = {
        provision_ro_flower_night_scented = 1,

    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "elysian", "valherbalist" },
},
['queens_extract'] = {
    category = "extracts",
    toItems = {
        queens_extract = 3,
    },
    materials = {
        provision_ro_flower_queens = 1,

    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "elysian" },
},
----------------------------------------------
---
---
---			Blacksmith Items
['weapon_melee_hammer'] = {
    category = "Tools",
    toItems = {
        weapon_melee_hammer = 1,
    },
    materials = {
        coal = 3,
		steel_bar = 1,
		leather = 1,
		wood = 2,
    },
    craftingTime = 2500,
    maxCraft = 1,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'weapon_crafting',
    tables = { "valblacksmith", "blkblacksmith", "vanblacksmith", "stdblacksmith", "strblacksmith", "macblacksmith", "spiblacksmith", "tumblacksmith", "armablacksmith", "emerblacksmith", "rhoblacksmith" },
},
['pickaxe'] = {
    category = "Tools",
    toItems = {
        pickaxe = 1,
    },
    materials = {
        coal = 2,
		steel_bar = 2,
		wood = 2,
    },
    craftingTime = 2500,
    maxCraft = 1,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'weapon_crafting',
    tables = { "valblacksmith", "blkblacksmith", "vanblacksmith", "stdblacksmith", "strblacksmith", "macblacksmith", "spiblacksmith", "tumblacksmith", "armablacksmith", "emerblacksmith", "rhoblacksmith" },
},
['axe'] = {
    category = "Tools",
    toItems = {
        axe = 1,
    },
    materials = {
        coal = 2,
		steel_bar = 1,
		wood = 2,
    },
    craftingTime = 2500,
    maxCraft = 1,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'weapon_crafting',
    tables = { "valblacksmith", "blkblacksmith", "vanblacksmith", "stdblacksmith", "strblacksmith", "macblacksmith", "spiblacksmith", "tumblacksmith", "armablacksmith", "emerblacksmith", "rhoblacksmith" },
},
['shovel'] = {
    category = "Tools",
    toItems = {
        shovel = 1,
    },
    materials = {
        coal = 2,
		steel_bar = 1,
		wood = 2,
    },
    craftingTime = 2500,
    maxCraft = 1,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'weapon_crafting',
    tables = { "valblacksmith", "blkblacksmith", "vanblacksmith", "stdblacksmith", "strblacksmith", "macblacksmith", "spiblacksmith", "tumblacksmith", "armablacksmith", "emerblacksmith", "rhoblacksmith" },
},
['horse_lantern'] = {
    category = "Tools",
    toItems = {
        horse_lantern = 1,
    },
    materials = {
        coal = 5,
		iron_bar = 2,
		silver_bar = 1,
		animalfat = 1,
    },
    craftingTime = 2500,
    maxCraft = 1,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'weapon_crafting',
    tables = { "valblacksmith", "blkblacksmith", "vanblacksmith", "stdblacksmith", "strblacksmith", "macblacksmith", "spiblacksmith", "tumblacksmith", "armablacksmith", "emerblacksmith", "rhoblacksmith" },
},
['weapon_melee_lantern'] = {
    category = "Tools",
    toItems = {
        weapon_melee_lantern = 1,
    },
    materials = {
        coal = 5,
		iron_bar = 2,
		cotton = 1,
		animalfat = 2,
    },
    craftingTime = 2500,
    maxCraft = 1,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'weapon_crafting',
    tables = { "valblacksmith", "blkblacksmith", "vanblacksmith", "stdblacksmith", "strblacksmith", "macblacksmith", "spiblacksmith", "tumblacksmith", "armablacksmith", "emerblacksmith", "rhoblacksmith" },
},
['weapon_melee_davy_lantern'] = {
    category = "Tools",
    toItems = {
        weapon_melee_davy_lantern = 1,
    },
    materials = {
        coal = 5,
		iron_bar = 1,
		copper_bar = 2,
		zinc_ore = 1,
    },
    craftingTime = 2500,
    maxCraft = 1,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'weapon_crafting',
    tables = { "valblacksmith", "blkblacksmith", "vanblacksmith", "stdblacksmith", "strblacksmith", "macblacksmith", "spiblacksmith", "tumblacksmith", "armablacksmith", "emerblacksmith", "rhoblacksmith" },
},
['weapon_melee_lantern_halloween'] = {
    category = "Tools",
    toItems = {
        weapon_melee_lantern_halloween = 1,
    },
    materials = {
        coal = 5,
		steel_bar = 2,
		cotton = 2,
		animalfat = 2,
    },
    craftingTime = 2500,
    maxCraft = 1,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'weapon_crafting',
    tables = { "valblacksmith", "blkblacksmith", "vanblacksmith", "stdblacksmith", "strblacksmith", "macblacksmith", "spiblacksmith", "tumblacksmith", "armablacksmith", "emerblacksmith", "rhoblacksmith" },
},
['weapon_lasso_reinforced'] = {
    category = "Tools",
    toItems = {
        weapon_lasso_reinforced = 1,
    },
    materials = {
        coal = 3,
        steel_bar = 2,
        fibres = 10,
    },
    craftingTime = 2500,
    maxCraft = 1,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'weapon_crafting',
    tables = { "valblacksmith", "blkblacksmith", "vanblacksmith", "stdblacksmith", "strblacksmith", "macblacksmith", "spiblacksmith", "tumblacksmith", "armablacksmith", "emerblacksmith", "rhoblacksmith" },
},
['furnace'] = {
    category = "Tools",
    toItems = {
        furnace = 1,
    },
    materials = {
        coal = 10,
		steel_bar = 5,
		brass_bar = 2,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'weapon_crafting',
    tables = { "valblacksmith", "blkblacksmith", "vanblacksmith", "stdblacksmith", "strblacksmith", "macblacksmith", "spiblacksmith", "tumblacksmith", "armablacksmith", "emerblacksmith", "rhoblacksmith" },
},
['stashchest'] = {
    category = "Items",
    toItems = {
        stashchest = 1,
    },
    materials = {
        coal = 10,
		steel_bar = 5,
		iron_bar = 2,
		wood = 8,
        leather = 2,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'weapon_crafting',
    tables = { "valblacksmith", "blkblacksmith", "vanblacksmith", "stdblacksmith", "strblacksmith", "macblacksmith", "spiblacksmith", "tumblacksmith", "armablacksmith", "emerblacksmith", "rhoblacksmith" },
},
['moneybox'] = {
    category = "Items",
    toItems = {
        moneybox = 1,
    },
    materials = {
        coal = 10,
		steel_bar = 5,
		iron_bar = 2,
        leather = 2,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'weapon_crafting',
    tables = { "valblacksmith", "blkblacksmith", "vanblacksmith", "stdblacksmith", "strblacksmith", "macblacksmith", "spiblacksmith", "tumblacksmith", "armablacksmith", "emerblacksmith", "rhoblacksmith" },
},
['zippo'] = {
    category = "Items",
    toItems = {
        zippo = 3,
    },
    materials = {
        coal = 3,
		brass_bar = 1,
		cotton = 1,
		animalfat = 2,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "valblacksmith", "blkblacksmith", "vanblacksmith", "stdblacksmith", "strblacksmith", "macblacksmith", "spiblacksmith", "tumblacksmith", "armablacksmith", "emerblacksmith", "rhoblacksmith" },
},
['goldpan'] = {
    category = "Items",
    toItems = {
        goldpan = 1,
    },
    materials = {
        coal = 3,
		iron_bar = 2,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "valblacksmith", "blkblacksmith", "vanblacksmith", "stdblacksmith", "strblacksmith", "macblacksmith", "spiblacksmith", "tumblacksmith", "armablacksmith", "emerblacksmith", "rhoblacksmith" },
},
['coil'] = {
    category = "Items",
    toItems = {
        coil = 1,
    },
    materials = {
        coal = 6,
        copper_bar = 6,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    maxCraft = 1,
    skillName = 'crafting',
    tables = { "valblacksmith", "blkblacksmith", "vanblacksmith", "stdblacksmith", "strblacksmith", "macblacksmith", "spiblacksmith", "tumblacksmith", "armablacksmith", "emerblacksmith", "rhoblacksmith" },
},
['forged_key'] = {
    category = "Items",
    toItems = {
        forged_key = 1,
    },
    materials = {
        brokenkey = 3,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    maxCraft = 1,
    skillName = 'crafting',
    tables = { "valblacksmith", "blkblacksmith", "vanblacksmith", "stdblacksmith", "strblacksmith", "macblacksmith", "spiblacksmith", "tumblacksmith", "armablacksmith", "emerblacksmith", "rhoblacksmith" },
},
['weapon_melee_hatchet'] = {
    category = "Hatchets",
    toItems = {
        weapon_melee_hatchet = 1,
    },
    materials = {
        coal = 3,
		steel_bar = 1,
		wood = 2,
    },
    craftingTime = 2500,
    maxCraft = 1,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'weapon_crafting',
    tables = { "valblacksmith", "blkblacksmith", "vanblacksmith", "stdblacksmith", "strblacksmith", "macblacksmith", "spiblacksmith", "tumblacksmith", "armablacksmith", "emerblacksmith", "rhoblacksmith" },
},
['weapon_melee_hatchet_hunter'] = {
    category = "Hatchets",
    toItems = {
        weapon_melee_hatchet_hunter = 1,
    },
    materials = {
        coal = 3,
		steel_bar = 1,
		wood = 2,
    },
    craftingTime = 2500,
    maxCraft = 1,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'weapon_crafting',
    tables = { "valblacksmith", "blkblacksmith", "vanblacksmith", "stdblacksmith", "strblacksmith", "macblacksmith", "spiblacksmith", "tumblacksmith", "armablacksmith", "emerblacksmith", "rhoblacksmith" },
},
['weapon_melee_cleaver'] = {
    category = "Hatchets",
    toItems = {
        weapon_melee_cleaver = 1,
    },
    materials = {
        coal = 4,
		steel_bar = 2,
		wood = 4,
        leather = 2,
    },
    craftingTime = 2500,
    maxCraft = 1,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'weapon_crafting',
    tables = { "valblacksmith", "blkblacksmith", "vanblacksmith", "stdblacksmith", "strblacksmith", "macblacksmith", "spiblacksmith", "tumblacksmith", "armablacksmith", "emerblacksmith", "rhoblacksmith" },
},
['weapon_thrown_throwing_knives'] = {
    category = "Hatchets",
    toItems = {
        weapon_thrown_throwing_knives = 1,
    },
    materials = {
        coal = 4,
		steel_bar = 2,
		wood = 4,
    },
    craftingTime = 2500,
    maxCraft = 1,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'weapon_crafting',
    tables = { "valblacksmith", "blkblacksmith", "vanblacksmith", "stdblacksmith", "strblacksmith", "macblacksmith", "spiblacksmith", "tumblacksmith", "armablacksmith", "emerblacksmith", "rhoblacksmith" },
},
['weapon_melee_knife_horror'] = {
    category = "Hatchets",
    toItems = {
        weapon_melee_knife_horror = 1,
    },
    materials = {
        coal = 3,
		steel_bar = 2,
		leather = 1,
    },
    craftingTime = 2500,
    maxCraft = 1,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'weapon_crafting',
    tables = { "valblacksmith", "blkblacksmith", "vanblacksmith", "stdblacksmith", "strblacksmith", "macblacksmith", "spiblacksmith", "tumblacksmith", "armablacksmith", "emerblacksmith", "rhoblacksmith" },
},
['weapon_melee_knife_rustic'] = {
    category = "Hatchets",
    toItems = {
        weapon_melee_knife_rustic = 1,
    },
    materials = {
        coal = 3,
		steel_bar = 2,
		wood = 2,
        leather = 2,
    },
    craftingTime = 2500,
    maxCraft = 1,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'weapon_crafting',
    tables = { "valblacksmith", "blkblacksmith", "vanblacksmith", "stdblacksmith", "strblacksmith", "macblacksmith", "spiblacksmith", "tumblacksmith", "armablacksmith", "emerblacksmith", "rhoblacksmith" },
},
['weapon_melee_knife_trader'] = {
    category = "Hatchets",
    toItems = {
        weapon_melee_knife_trader = 1,
    },
    materials = {
        coal = 3,
		steel_bar = 2,
		wood = 2,
    },
    craftingTime = 2500,
    maxCraft = 1,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'weapon_crafting',
    tables = { "valblacksmith", "blkblacksmith", "vanblacksmith", "stdblacksmith", "strblacksmith", "macblacksmith", "spiblacksmith", "tumblacksmith", "armablacksmith", "emerblacksmith", "rhoblacksmith" },
},
['weapon_melee_machete'] = {
    category = "Machete",
    toItems = {
        weapon_melee_machete = 1,
    },
    materials = {
        coal = 4,
		steel_bar = 2,
		wood = 2,
        leather = 2,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    maxCraft = 1,
    customSkillGain = 0,
    skillName = 'weapon_crafting',
    tables = { "valblacksmith", "blkblacksmith", "vanblacksmith", "stdblacksmith", "strblacksmith", "macblacksmith", "spiblacksmith", "tumblacksmith", "armablacksmith", "emerblacksmith", "rhoblacksmith" },
},
['weapon_melee_machete_horror'] = {
    category = "Machete",
    toItems = {
        weapon_melee_machete_horror = 1,
    },
    materials = {
        coal = 4,
		steel_bar = 2,
		silver_bar = 1,
		ruby_uncut  = 2,
		wood = 2,
        leather = 2,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    maxCraft = 1,
    customSkillGain = 0,
    skillName = 'weapon_crafting',
    tables = { "valblacksmith", "blkblacksmith", "vanblacksmith", "stdblacksmith", "strblacksmith", "macblacksmith", "spiblacksmith", "tumblacksmith", "armablacksmith", "emerblacksmith", "rhoblacksmith" },
},
['weapon_melee_machete_collector'] = {
    category = "Machete",
    toItems = {
        weapon_melee_machete_collector = 1,
    },
    materials = {
        coal = 4,
		gold_bar = 2,
		silver_bar = 1,
		sapphire_uncut  = 2,
		wood = 2,
        leather = 2,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    maxCraft = 1,
    skillName = 'weapon_crafting',
    tables = { "valblacksmith", "blkblacksmith", "vanblacksmith", "stdblacksmith", "strblacksmith", "macblacksmith", "spiblacksmith", "tumblacksmith", "armablacksmith", "emerblacksmith", "rhoblacksmith" },
},
['silver_bar'] = {
    category = "Smelting",
    toItems = {
        silver_bar = 1,
    },
    materials = {
        coal = 3,
		silver_ore = 18,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "valblacksmith", "blkblacksmith", "vanblacksmith", "stdblacksmith", "strblacksmith", "macblacksmith", "spiblacksmith", "tumblacksmith", "armablacksmith", "emerblacksmith", "rhoblacksmith" },
},
['iron_bar'] = {
    category = "Smelting",
    toItems = {
        iron_bar = 1,
    },
    materials = {
        coal = 2,
		iron_ore = 4,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "valblacksmith", "blkblacksmith", "vanblacksmith", "stdblacksmith", "strblacksmith", "macblacksmith", "spiblacksmith", "tumblacksmith", "armablacksmith", "emerblacksmith", "rhoblacksmith" },
},
['steel_bar'] = {
    category = "Smelting",
    toItems = {
        steel_bar = 1,
    },
    materials = {
        coal = 2,
		iron_bar = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "valblacksmith", "blkblacksmith", "vanblacksmith", "stdblacksmith", "strblacksmith", "macblacksmith", "spiblacksmith", "tumblacksmith", "armablacksmith", "emerblacksmith", "rhoblacksmith" },
},
['lead_bar'] = {
    category = "Smelting",
    toItems = {
        lead_bar = 1,
    },
    materials = {
        coal = 2,
		lead_ore = 4,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "valblacksmith", "blkblacksmith", "vanblacksmith", "stdblacksmith", "strblacksmith", "macblacksmith", "spiblacksmith", "tumblacksmith", "armablacksmith", "emerblacksmith", "rhoblacksmith" },
},
['copper_bar'] = {
    category = "Smelting",
    toItems = {
        copper_bar = 1,
    },
    materials = {
        coal = 2,
		copper_ore = 4,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "valblacksmith", "blkblacksmith", "vanblacksmith", "stdblacksmith", "strblacksmith", "macblacksmith", "spiblacksmith", "tumblacksmith", "armablacksmith", "emerblacksmith", "rhoblacksmith" },
},
['zinc_bar'] = {
    category = "Smelting",
    toItems = {
        zinc_bar = 1,
    },
    materials = {
        coal = 2,
		zinc_ore = 4,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "valblacksmith", "blkblacksmith", "vanblacksmith", "stdblacksmith", "strblacksmith", "macblacksmith", "spiblacksmith", "tumblacksmith", "armablacksmith", "emerblacksmith", "rhoblacksmith" },
},
['brass_bar'] = {
    category = "Smelting",
    toItems = {
        brass_bar = 1,
    },
    materials = {
        coal = 2,
		zinc_ore = 4,
        copper_ore = 4,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "valblacksmith", "blkblacksmith", "vanblacksmith", "stdblacksmith", "strblacksmith", "macblacksmith", "spiblacksmith", "tumblacksmith", "armablacksmith", "emerblacksmith", "rhoblacksmith" },
},
['electricwires'] = {
    category = "Smelting",
    toItems = {
        electricwires = 1,
    },
    materials = {
        copper_bar = 4,
		silver_bar = 2,
        cloth = 10,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "valblacksmith", "blkblacksmith", "vanblacksmith", "stdblacksmith", "strblacksmith", "macblacksmith", "spiblacksmith", "tumblacksmith", "armablacksmith", "emerblacksmith", "rhoblacksmith" },
},
-- Native Face Paints
['nativepaint1'] = {
    category = "Paint",
    toItems = {
        nativepaint1 = 1,
    },
    materials = {
        water = 1,
		consumable_herb_milkweed = 1,
		consumable_herb_evergreen_huckleberry = 2,

    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "native" },
},
['nativepaint2'] = {
    category = "Paint",
    toItems = {
        nativepaint2  = 1,
    },
    materials = {
        water = 1,
		consumable_herb_wild_carrots = 1,
		provision_wldflwr_wisteria = 1,

    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "native" },
},
['nativepaint3'] = {
    category = "Paint",
    toItems = {
        nativepaint3  = 1,
    },
    materials = {
        water = 1,
		consumable_herb_indian_tobacco = 1,
		consumable_herb_wild_mint = 2,

    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "native" },
},
['nativepaint4'] = {
    category = "Paint",
    toItems = {
        nativepaint4  = 1,
    },
    materials = {
        water = 1,
		consumable_herb_milkweed = 1,
		consumable_herb_oregano = 2,

    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "native" },
},
['nativepaint5'] = {
    category = "Paint",
    toItems = {
        nativepaint5  = 1,
    },
    materials = {
        water = 1,
		consumable_herb_wild_carrots = 1,
		consumable_herb_black_berry = 2,

    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "native" },
},
['item_facepaint_001'] = {
    category = "Paint",
    toItems = {
        item_facepaint_001  = 1,
    },
    materials = {
        water = 1,
		consumable_herb_indian_tobacco = 1,
		consumable_herb_black_berry = 2,

    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "native" },
},
['item_facepaint_002'] = {
    category = "Paint",
    toItems = {
        item_facepaint_002  = 1,
    },
    materials = {
        water = 1,
		consumable_herb_indian_tobacco = 1,
		consumable_herb_oregano = 2,

    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "native" },
},
['item_facepaint_003'] = {
    category = "Paint",
    toItems = {
        item_facepaint_003  = 1,
    },
    materials = {
        water = 1,
		consumable_herb_milkweed = 1,
		consumable_herb_black_berry = 2,

    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "native" },
},
['item_facepaint_004'] = {
    category = "Paint",
    toItems = {
        item_facepaint_004  = 1,
    },
    materials = {
        water = 1,
		consumable_herb_milkweed = 1,
		provision_wldflwr_wisteria = 2,

    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "native" },
},
['item_facepaint_005'] = {
    category = "Paint",
    toItems = {
        item_facepaint_005  = 1,
    },
    materials = {
        water = 1,
		consumable_herb_wild_carrots = 1,
		consumable_herb_wild_mint = 2,

    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "native" },
},
['item_facepaint_006'] = {
    category = "Paint",
    toItems = {
        item_facepaint_006  = 1,
    },
    materials = {
        water = 1,
		consumable_herb_milkweed = 1,
		consumable_herb_wild_mint = 2,

    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "native" },
},
['item_facepaint_007'] = {
    category = "Paint",
    toItems = {
        item_facepaint_007  = 1,
    },
    materials = {
        water = 1,
		consumable_herb_wild_carrots = 1,
		consumable_herb_evergreen_huckleberry = 2,

    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "native" },
},
['item_facepaint_008'] = {
    category = "Paint",
    toItems = {
        item_facepaint_008  = 1,
    },
    materials = {
        water = 1,
		consumable_herb_indian_tobacco = 1,
		consumable_herb_black_berry = 2,

    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "native" },
},
['item_bodypaint_001'] = {
    category = "Paint",
    toItems = {
        item_bodypaint_001  = 1,
    },
    materials = {
        water = 1,
		consumable_herb_wild_carrots = 1,
		consumable_herb_yarrow = 2,

    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "native" },
},
['item_bodypaint_002'] = {
    category = "Paint",
    toItems = {
        item_bodypaint_002  = 1,
    },
    materials = {
        water = 1,
		consumable_herb_milkweed = 1,
		provision_wldflwr_wild_rhubarb = 2,

    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "native" },
},
['item_bodypaint_003'] = {
    category = "Paint",
    toItems = {
        item_bodypaint_003  = 1,
    },
    materials = {
        water = 1,
		consumable_herb_indian_tobacco = 1,
		provision_wldflwr_texas_blue_bonnet = 2,

    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "native" },
},
 
['menwaagamig '] = {
    category = "Food",
    toItems = {
        menwaagamig  = 1,
    },
    materials = {
        water = 1,
		rasberry = 5,
		consumable_herb_black_berry = 5,
        honey = 1, 

    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "native" },
},
['pemmican '] = {
    category = "Food",
    toItems = {
        pemmican  = 1,
    },
    materials = {
        biggamemeat = 2,
		honey = 1,
		butter = 1,
        apple = 1, 

    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "native" },
},
['warriorsstew '] = {
    category = "Food",
    toItems = {
        warriorsstew  = 1,
    },
    materials = {
        beef_meat = 2,
		onion = 1,
		salt = 1,
        pepper = 1,
        consumable_herb_wild_carrots = 1, 

    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "native" },
},
['threesistersstew '] = {
    category = "Food",
    toItems = {
        threesistersstew  = 1,
    },
    materials = {
        corn = 1,
		bean = 2,
		pumpkin = 2,
        water = 1,

    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "native" },
},

-- Native Craftsman 

['weapon_bow_improved'] = {
    category = "Weapon",
    toItems = {
        weapon_bow_improved = 1,
    },
    materials = {
        yewwood = 10,
		fibres = 25,
		animalfat = 2,
        leather = 3,
    },
    craftingTime = 2500,
    maxCraft = 1,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'weapon_crafting',
    tables = { "nativecraftsman", "comcraftsman", "twnativecraftsman" },
},
['weapon_thrown_tomahawk'] = {
    category = "Weapon",
    toItems = {
        weapon_thrown_tomahawk = 1,
    },
    materials = {
        iron_bar = 2,
		yewwood = 5,
		hawkfeather = 3,
    },
    craftingTime = 2500,
    maxCraft = 1,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'weapon_crafting',
    tables = { "nativecraftsman", "comcraftsman", "twnativecraftsman" },
},
['weapon_thrown_tomahawk_ancient'] = {
    category = "Weapon",
    toItems = {
        weapon_thrown_tomahawk_ancient = 1,
    },
    materials = {
        iron_bar = 3,
		water = 8,
		hawkfeather = 5,
        feather = 3,
    },
    craftingTime = 2500,
    maxCraft = 1,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'weapon_crafting',
    tables = { "nativecraftsman", "comcraftsman", "twnativecraftsman" },
},
['weapon_melee_knife_jawbone'] = {
    category = "Weapon",
    toItems = {
        weapon_melee_knife_jawbone = 1,
    },
    materials = {
        iron_bar = 3,
		elkantlers = 2,
		boartusk = 5,
    },
    craftingTime = 2500,
    maxCraft = 1,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'weapon_crafting',
    tables = { "nativecraftsman", "comcraftsman", "twnativecraftsman" },
},
['native_backpack_001'] = {
    category = "Weapon",
    toItems = {
        native_backpack_001 = 1,
    },
    materials = {
        leather  = 10,
		fibres = 5,
		elkantlers = 2,
    },
    craftingTime = 2500,
    maxCraft = 1,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'weapon_crafting',
    tables = { "nativecraftsman", "comcraftsman", "twnativecraftsman" },
},
['native_backpack_002'] = {
    category = "Weapon",
    toItems = {
        native_backpack_002 = 1,
    },
    materials = {
        leather = 10,
		fibres = 5,
		feather = 10,
    },
    craftingTime = 2500,
    maxCraft = 1,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'weapon_crafting',
    tables = { "nativecraftsman", "comcraftsman", "twnativecraftsman" },
},
['spear1'] = {
    category = "Weapon",
    toItems = {
        spear1 = 1,
    },
    materials = {
        yewwood = 10,
		hawkfeather = 5,
		iron_bar  = 2,
    },
    craftingTime = 2500,
    maxCraft = 1,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'weapon_crafting',
    tables = { "nativecraftsman", "comcraftsman", "twnativecraftsman" },
},
['spear2'] = {
    category = "Weapon",
    toItems = {
        spear2 = 1,
    },
    materials = {
        yewwood = 10,
		hawkfeather = 5,
		iron_bar  = 2,
    },
    craftingTime = 2500,
    maxCraft = 1,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'weapon_crafting',
    tables = { "nativecraftsman", "comcraftsman", "twnativecraftsman" },
},

-- Rancher Crafting
['cheese'] = {
    category = "Rancher",
    toItems = {
        cheese  = 5,
    },
    materials = {
        cream = 2,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "ranch1", "ranch2", "ranch3", "ranch4", "ranch5", "ranch6", "ranch7" },
},
['cream'] = {
    category = "Rancher",
    toItems = {
        cream  = 2,
    },
    materials = {
        milk = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "ranch1", "ranch2", "ranch3", "ranch4", "ranch5", "ranch6", "ranch7" },
},
['flour2'] = {
    category = "Rancher",
    toItems = {
        flour  = 10,
    },
    materials = {
        barrel_grain = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "ranch1", "ranch2", "ranch3", "ranch4", "ranch5", "ranch6", "ranch7" },
},
['broth'] = {
    category = "Rancher",
    toItems = {
        broth  = 4,
    },
    materials = {
        consumable_herb_parasol_mushroom = 5,
        water = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "ranch1", "ranch2", "ranch3", "ranch4", "ranch5", "ranch6", "ranch7" },
},
['butter2'] = {
    category = "Rancher",
    toItems = {
        butter  = 5,
    },
    materials = {
        cream = 2,

    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "ranch1", "ranch2", "ranch3", "ranch4", "ranch5", "ranch6", "ranch7" },
},
['cloth2'] = {
    category = "Rancher",
    toItems = {
        cloth  = 2,
    },
    materials = {
        sheepwool = 1,

    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "ranch1", "ranch2", "ranch3", "ranch4", "ranch5", "ranch6", "ranch7" },
},
['premiumfertilizer'] = {
    category = "Rancher",
    toItems = {
        premiumfertilizer  = 1,
    },
    materials = {
        animalpoop = 2,

    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "ranch1", "ranch2", "ranch3", "ranch4", "ranch5", "ranch6", "ranch7" },
},

-- Moonshine
['mash'] = {
    category = "Moonshine",
    toItems = {
        mash  = 5,
    },
    materials = {
        bottle = 1,
        yeast = 2,
        corn = 5,
        refinedsugar = 5,

    },
    craftingTime = 2500,
    craftingSkill = 0,
    maxCraft = 5,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "moonshinemash" },
},
['yeast'] = {
    category = "Moonshine",
    toItems = {
        yeast = 3,
    },
    materials = {
        water = 1,
        refinedsugar = 1,
        consumable_herb_parasol_mushroom = 2,
        bottle = 1,

    },
    craftingTime = 2500,
    craftingSkill = 0,
    maxCraft = 5,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "moonshinemash" },
},
['boiler'] = {
    category = "Moonshine",
    toItems = {
        boiler = 1,
    },
    materials = {
        brass_bar = 4,
        copper_bar = 3,
        steel_bar = 3,

    },
    craftingTime = 2500,
    craftingSkill = 0,
    maxCraft = 5,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "moonshinemash" },
},
['thump_keg'] = {
    category = "Moonshine",
    toItems = {
        thump_keg = 1,
    },
    materials = {
        brass_bar = 2,
        copper_bar = 4,
        steel_bar = 3,

    },
    craftingTime = 2500,
    craftingSkill = 0,
    maxCraft = 5,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "moonshinemash" },
},
['campmoonshine'] = {
    category = "Moonshine",
    toItems = {
        campmoonshine = 1,
    },
    materials = {
        boiler = 1,
        thump_keg = 1,
        coil = 3,
        catch_container = 1,

    },
    craftingTime = 2500,
    craftingSkill = 0,
    maxCraft = 5,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "moonshinemash" },
},
-- Pawn shop crafting
['fossilbox'] = {
    category = "Pawn",
    toItems = {
        fossilbox = 1,
    },
    materials = {
        wood = 3,
        cloth = 2,
        leather = 2,
        bone_shards = 1,
        arrowhead_bone = 1,
        dinosaur_egg = 1,
        finger_bone = 1,
        fossil_bivalve = 1,
        fossil_brachiopod = 1,
        fossil_brow_horn = 1,
        fossil_cephalopod = 1,
        fossil_coral = 1,
        fossil_neo = 1,
        fossil_old = 1,
        fossil_pet_wood = 1,
        fossil_pet_wood_rainbow = 1,
        fossil_pet_wood_yellow_cat = 1,
        fossil_sea_lily = 1,
        fossil_sea_scorpion = 1,
        fossil_stone = 1,
        fossil_tail_spike = 1,
        fossil_toe_claw = 1,
        fossil_tooth_mega = 1,
        fossil_tooth_serrated = 1,
        fossil_tooth_trex = 1,
        fossil_trilobit = 1,
        fossil_trilobite_crypto = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    maxCraft = 5,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "vhpawnshop", "twpawnshop" },
},

['incense'] = {
    category = "Herbalist",
    toItems = {
        incense = 1,
    },
    materials = {
        water = 1,
        ladyflower_extract = 1,
        sap = 1,
        fibres = 2,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    maxCraft = 5,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "valherbalist" },
},
['witchesbrew'] = {
    category = "Herbalist",
    toItems = {
        witchesbrew = 1,
    },
    materials = {
        consumable_herb_parasol_mushroom = 1,
        water = 1,
        honey = 1
    },
    craftingTime = 2500,
    craftingSkill = 0,
    maxCraft = 5,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "valherbalist" },
},
['flyingointment'] = {
    category = "Herbalist",
    toItems = {
        flyingointment = 1,
    },
    materials = {
        animalfat = 1,
        consumable_herb_oleander_sage = 1,
        nightscented_extract = 1,
        fibres = 1,
    },
    craftingTime = 2500,
    craftingSkill = 0,
    maxCraft = 5,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "valherbalist" },
},
['ladyflower_extract'] = {
    category = "extracts",
    toItems = {
        ladyflower_extract = 3,
    },
    materials = {
        provision_ro_flower_lady_of_night = 1,

    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "graverose", "valherbalist"},
},
['mint_extract'] = {
    category = "extracts",
    toItems = {
        mint_extract = 3,
    },
    materials = {
        consumable_herb_wild_mint = 1,

    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "valherbalist" },
},
['vanilla_extract'] = {
    category = "extracts",
    toItems = {
        vanilla_extract = 4,
    },
    materials = {
        consumable_herb_vanilla_flower = 1,

    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "valherbalist" },
},
-- Non-herbalism versions
['mint_extract2'] = {
    category = "extracts",
    toItems = {
        mint_extract = 1,
    },
    materials = {
        consumable_herb_wild_mint = 1,

    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "elysian", "bassaloon", "valcandy" },
},
['vanilla_extract2'] = {
    category = "extracts",
    toItems = {
        vanilla_extract = 1,
    },
    materials = {
        consumable_herb_vanilla_flower = 1,

    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "blasaloon", "blabakery", "sdicecream", "valcandy", "graverose" },
},
-- Illegal crafting
['detonator'] = {
    category = "crafting",
    toItems = {
        detonator = 1,
    },
    materials = {
        brokendetonator = 1,
        detonatingcord = 1,
        electricwires = 2,

    },
    craftingTime = 2500,
    craftingSkill = 0,
    customSkillGain = 0,
    skillName = 'crafting',
    tables = { "illegalcrafting" },
},

}

Config.CraftingTables = {


	-- Native Face Paint
	['native'] = {
		title = "Native Face Paint",
		objects = {},
		icon = "face-smile", -- optional. Defaults to 'wrench'
        jobName = { ['native'] = 0 },
		locations = { vector3(-1976.33, -1650.9, 117.11),  -- Manzanita Post
					  vector3(452.92, 2214.05, 245.98),    -- Wapiti
                      vector3(-5188.13, -2084.62, 12.7),   -- Tumbleweed
                      vector3(-2802.14, -2755.21, 79.29)   -- Comanche
					}, 
		-- BOXZONE: If you add one of these objects (locations = ...) it will spawn boxzones
		-- spawnTable = { { coords = vec4(-289.84, 816.27, 119.39, 6.10), prop = 'ex_prop_ex_toolchest_01' } } -- SPAWNS TABLE: the spawnTable field holds a list of several tables with prop and location. If these are added it will SPAWN a table that's interactable
		skipPlaceObjectOnGroundProperly = false
	},
    ['nativecraftsman'] = {
		title = "Native Craftsman",
		objects = {},
        jobName = { ['nativecraftsman'] = 0 },
		icon = "face-smile", -- optional. Defaults to 'wrench'
		locations = { vector3(370.07, 2448.88, 302.89),  -- Tipani Camp
					}, 
		-- BOXZONE: If you add one of these objects (locations = ...) it will spawn boxzones
		-- spawnTable = { { coords = vec4(-289.84, 816.27, 119.39, 6.10), prop = 'ex_prop_ex_toolchest_01' } } -- SPAWNS TABLE: the spawnTable field holds a list of several tables with prop and location. If these are added it will SPAWN a table that's interactable
		skipPlaceObjectOnGroundProperly = false
	},
    ['comcraftsman'] = {
		title = "Comanche Craftsman",
		objects = {},
        jobName = { ['comcraftsman'] = 0 },
		icon = "face-smile", -- optional. Defaults to 'wrench'
		locations = { vector3(-2825.6, -2747.85, 78.38),  
					}, 
		-- BOXZONE: If you add one of these objects (locations = ...) it will spawn boxzones
		-- spawnTable = { { coords = vec4(-289.84, 816.27, 119.39, 6.10), prop = 'ex_prop_ex_toolchest_01' } } -- SPAWNS TABLE: the spawnTable field holds a list of several tables with prop and location. If these are added it will SPAWN a table that's interactable
		skipPlaceObjectOnGroundProperly = false
	},
    ['twnativecraftsman'] = {
		title = "Tumbleweed Native Craftsman",
		objects = {},
        jobName = { ['twnativecraftsman'] = 0 },
		icon = "face-smile", -- optional. Defaults to 'wrench'
		locations = { vector3(-5184.38, -2103.95, 12.7),  
					}, 
		-- BOXZONE: If you add one of these objects (locations = ...) it will spawn boxzones
		-- spawnTable = { { coords = vec4(-289.84, 816.27, 119.39, 6.10), prop = 'ex_prop_ex_toolchest_01' } } -- SPAWNS TABLE: the spawnTable field holds a list of several tables with prop and location. If these are added it will SPAWN a table that's interactable
		skipPlaceObjectOnGroundProperly = false
	},
    -- Pawn Crafting
        ['vhpawnshop'] = {
		title = "Van Horn Pawn Shop Crafting",
		objects = {},
        jobName = { ['vhpawnshop'] = 0 },
		icon = "face-smile", -- optional. Defaults to 'wrench'
		locations = { vector3(3020.13, 559.21, 44.79),  
					}, 
		-- BOXZONE: If you add one of these objects (locations = ...) it will spawn boxzones
		-- spawnTable = { { coords = vec4(-289.84, 816.27, 119.39, 6.10), prop = 'ex_prop_ex_toolchest_01' } } -- SPAWNS TABLE: the spawnTable field holds a list of several tables with prop and location. If these are added it will SPAWN a table that's interactable
		skipPlaceObjectOnGroundProperly = false
	},
        ['twpawnshop'] = {
		title = "Tumbleweed Pawn Shop Crafting",
		objects = {},
        jobName = { ['twpawnshop'] = 0 },
		icon = "face-smile", -- optional. Defaults to 'wrench'
		locations = { vector3(-5509.32, -2910.98, 1.69),  
					}, 
		-- BOXZONE: If you add one of these objects (locations = ...) it will spawn boxzones
		-- spawnTable = { { coords = vec4(-289.84, 816.27, 119.39, 6.10), prop = 'ex_prop_ex_toolchest_01' } } -- SPAWNS TABLE: the spawnTable field holds a list of several tables with prop and location. If these are added it will SPAWN a table that's interactable
		skipPlaceObjectOnGroundProperly = false
	},
	-- Extracts
	['extracts'] = {
		title = "Extracts",
		objects = {},
		icon = "fan", -- optional. Defaults to 'wrench'
		locations = {}, 
		-- BOXZONE: If you add one of these objects (locations = ...) it will spawn boxzones
		-- spawnTable = { { coords = vec4(-289.84, 816.27, 119.39, 6.10), prop = 'ex_prop_ex_toolchest_01' } } -- SPAWNS TABLE: the spawnTable field holds a list of several tables with prop and location. If these are added it will SPAWN a table that's interactable
		skipPlaceObjectOnGroundProperly = false
	},
	-- Campfire public crafts
	['camping'] = {
        title = "Cooking",
        objects = {},
        icon = "utensils",
        locations = {}, 
        -- BOXZONE: If you add one of these objects (locations = ...) it will spawn boxzones
        -- spawnTable = { { coords = vec4(-289.84, 816.27, 119.39, 6.10), prop = 'ex_prop_ex_toolchest_01' } } -- SPAWNS TABLE: the spawnTable field holds a list of several tables with prop and location. If these are added it will SPAWN a table that's interactable
        skipPlaceObjectOnGroundProperly = false
    },

	-- Public Processing 1 -- Rhodes 
	['publiccraftone'] = {
		title = "Process",
		objects = {},
		icon = "wrench", -- optional. Defaults to 'wrench'
		locations = { vector3(1406.24, -1284.63, 81.53),         -- rhodes  
					  
					}, 
		-- BOXZONE: If you add one of these objects (locations = ...) it will spawn boxzones
		-- spawnTable = { { coords = vec4(-289.84, 816.27, 119.39, 6.10), prop = 'ex_prop_ex_toolchest_01' } } -- SPAWNS TABLE: the spawnTable field holds a list of several tables with prop and location. If these are added it will SPAWN a table that's interactable
		skipPlaceObjectOnGroundProperly = false
	},
	-- Public Processing 2 -- New Austin
	['publiccrafttwo'] = {
		title = "Process",
		objects = {},
		icon = "wrench", -- optional. Defaults to 'wrench'
		locations = { vector3(-3816.175, -2980.568, -5.871672),         -- New Austin  
					  
					}, 
		-- BOXZONE: If you add one of these objects (locations = ...) it will spawn boxzones
		-- spawnTable = { { coords = vec4(-289.84, 816.27, 119.39, 6.10), prop = 'ex_prop_ex_toolchest_01' } } -- SPAWNS TABLE: the spawnTable field holds a list of several tables with prop and location. If these are added it will SPAWN a table that's interactable
		skipPlaceObjectOnGroundProperly = false
	},

    -- Moonshine Crafting
    ['moonshinemash'] = {
		title = "Process",
		objects = {},
		icon = "wrench", -- optional. Defaults to 'wrench'
		locations = { vector3(2357.86, 548.03, 76.96), }, 
		-- BOXZONE: If you add one of these objects (locations = ...) it will spawn boxzones
		-- spawnTable = { { coords = vec4(-289.84, 816.27, 119.39, 6.10), prop = 'ex_prop_ex_toolchest_01' } } -- SPAWNS TABLE: the spawnTable field holds a list of several tables with prop and location. If these are added it will SPAWN a table that's interactable
		skipPlaceObjectOnGroundProperly = false
	},
    ['illegalcrafting'] = {
		title = "Craft",
		objects = {},
		icon = "wrench", -- optional. Defaults to 'wrench'
		locations = { vector3(-5853.21, -3743.93, -24.87), }, 
		-- BOXZONE: If you add one of these objects (locations = ...) it will spawn boxzones
		-- spawnTable = { { coords = vec4(-289.84, 816.27, 119.39, 6.10), prop = 'ex_prop_ex_toolchest_01' } } -- SPAWNS TABLE: the spawnTable field holds a list of several tables with prop and location. If these are added it will SPAWN a table that's interactable
		skipPlaceObjectOnGroundProperly = false
	},
    ['moonshine'] = {
		title = "Process",
		objects = {},
		icon = "wrench", -- optional. Defaults to 'wrench'
		locations = { }, 
		-- BOXZONE: If you add one of these objects (locations = ...) it will spawn boxzones
		-- spawnTable = { { coords = vec4(-289.84, 816.27, 119.39, 6.10), prop = 'ex_prop_ex_toolchest_01' } } -- SPAWNS TABLE: the spawnTable field holds a list of several tables with prop and location. If these are added it will SPAWN a table that's interactable
		skipPlaceObjectOnGroundProperly = false
	},

	-- Doctor area's
	['medic'] = {
		title = "Medical Crafting",
		objects = { 'p_chestmedice01x','p_boxmedmedical01x','s_lootablemedicinecrate' },
		icon = "medical-bag", -- optional. Defaults to 'wrench'
		jobName = { ['medic'] = 0 }, -- JOBS FOR THIS TABLE
		locations = { vector3(2733.25, -1233.38, 55.38),         -- Saint Denis  
					  vector3(-290.09, 816.23, 119.4), 			-- Valentine
					  vector3(-785.29, -1302.21, 43.83),		-- Blackwater
					  vector3(-3734.19, -2629.39, -12.39),   	-- Armadillo
                      vector3(311.89, 1497.97, 181.37)   	-- Fort Wallace
					}, 
		-- BOXZONE: If you add one of these objects (locations = ...) it will spawn boxzones
		-- spawnTable = { { coords = vec4(-289.84, 816.27, 119.39, 6.10), prop = 'ex_prop_ex_toolchest_01' } } -- SPAWNS TABLE: the spawnTable field holds a list of several tables with prop and location. If these are added it will SPAWN a table that's interactable
		skipPlaceObjectOnGroundProperly = false
	},

    -- Private Doctors

	['strawprivatedoctor'] = {
		title = "Medical Crafting",
		objects = { 'p_chestmedice01x','p_boxmedmedical01x','s_lootablemedicinecrate' },
		icon = "medical-bag", -- optional. Defaults to 'wrench'
		jobName = { ['strawprivatedoctor'] = 0 },
		locations = { vector3(-1805.97, -434.63, 159.25), -- Strawberry
					}, 
		-- BOXZONE: If you add one of these objects (locations = ...) it will spawn boxzones
		-- spawnTable = { { coords = vec4(-289.84, 816.27, 119.39, 6.10), prop = 'ex_prop_ex_toolchest_01' } } -- SPAWNS TABLE: the spawnTable field holds a list of several tables with prop and location. If these are added it will SPAWN a table that's interactable
		skipPlaceObjectOnGroundProperly = false
	},
	['sdprivatedoctor'] = {
		title = "Medical Crafting",
		objects = { 'p_chestmedice01x','p_boxmedmedical01x','s_lootablemedicinecrate' },
		icon = "medical-bag", -- optional. Defaults to 'wrench'
		jobName = { ['sdprivatedoctor'] = 0 },
		locations = { vector3(2491.23, -1095.54, 55.51), -- Saint Denis
					}, 
		-- BOXZONE: If you add one of these objects (locations = ...) it will spawn boxzones
		-- spawnTable = { { coords = vec4(-289.84, 816.27, 119.39, 6.10), prop = 'ex_prop_ex_toolchest_01' } } -- SPAWNS TABLE: the spawnTable field holds a list of several tables with prop and location. If these are added it will SPAWN a table that's interactable
		skipPlaceObjectOnGroundProperly = false
	},
    ['tipaniwilddoctor'] = {
		title = "Medical Crafting",
		objects = { 'p_chestmedice01x','p_boxmedmedical01x','s_lootablemedicinecrate' },
		icon = "medical-bag", -- optional. Defaults to 'wrench'
		jobName = { ['tipaniwilddoctor'] = 0 },
		locations = { vector3(381.35, 2446.64, 304.35) , -- Tipani Camp
					}, 
		-- BOXZONE: If you add one of these objects (locations = ...) it will spawn boxzones
		-- spawnTable = { { coords = vec4(-289.84, 816.27, 119.39, 6.10), prop = 'ex_prop_ex_toolchest_01' } } -- SPAWNS TABLE: the spawnTable field holds a list of several tables with prop and location. If these are added it will SPAWN a table that's interactable
		skipPlaceObjectOnGroundProperly = false
	},

    -- Wild Doctors

	['vhwilddoctor'] = {
		title = "Medical Crafting",
		objects = { 'p_chestmedice01x','p_boxmedmedical01x','s_lootablemedicinecrate' },
		icon = "medical-bag", -- optional. Defaults to 'wrench'
		jobName = { ['vhwilddoctor'] = 0 },
		locations = { vector3(2787.64, 524.34, 71.7),  -- Van Horn
					}, 
		-- BOXZONE: If you add one of these objects (locations = ...) it will spawn boxzones
		-- spawnTable = { { coords = vec4(-289.84, 816.27, 119.39, 6.10), prop = 'ex_prop_ex_toolchest_01' } } -- SPAWNS TABLE: the spawnTable field holds a list of several tables with prop and location. If these are added it will SPAWN a table that's interactable
		skipPlaceObjectOnGroundProperly = false
	},
    ['vtwilddoctor'] = {
        title = "Medical Crafting",
        objects = { 'p_chestmedice01x','p_boxmedmedical01x','s_lootablemedicinecrate' },
        icon = "medical-bag", -- optional. Defaults to 'wrench'
        jobName = { ['vtwilddoctor'] = 0 },
        locations = { vector3(2508.17, 2287.2, 177.4),   -- Valentine
                    }, 
        -- BOXZONE: If you add one of these objects (locations = ...) it will spawn boxzones
        -- spawnTable = { { coords = vec4(-289.84, 816.27, 119.39, 6.10), prop = 'ex_prop_ex_toolchest_01' } } -- SPAWNS TABLE: the spawnTable field holds a list of several tables with prop and location. If these are added it will SPAWN a table that's interactable
        skipPlaceObjectOnGroundProperly = false
    },
	['rdwilddoctor'] = {
		title = "Medical Crafting",
		objects = { 'p_chestmedice01x','p_boxmedmedical01x','s_lootablemedicinecrate' },
		icon = "medical-bag", -- optional. Defaults to 'wrench'
		jobName = { ['rdwilddoctor'] = 0 },
		locations = { vector3(1307.62, -1314.84, 76.78),   -- Rhodes
					}, 
		-- BOXZONE: If you add one of these objects (locations = ...) it will spawn boxzones
		-- spawnTable = { { coords = vec4(-289.84, 816.27, 119.39, 6.10), prop = 'ex_prop_ex_toolchest_01' } } -- SPAWNS TABLE: the spawnTable field holds a list of several tables with prop and location. If these are added it will SPAWN a table that's interactable
		skipPlaceObjectOnGroundProperly = false
	},
    	['comwilddoctor'] = {
		title = "Medical Crafting",
		objects = { 'p_chestmedice01x','p_boxmedmedical01x','s_lootablemedicinecrate' },
		icon = "medical-bag", -- optional. Defaults to 'wrench'
		jobName = { ['comwilddoctor'] = 0 },
		locations = { vector3(-2844.51, -2727.15, 81.38),   -- Comanche Camp
					}, 
		-- BOXZONE: If you add one of these objects (locations = ...) it will spawn boxzones
		-- spawnTable = { { coords = vec4(-289.84, 816.27, 119.39, 6.10), prop = 'ex_prop_ex_toolchest_01' } } -- SPAWNS TABLE: the spawnTable field holds a list of several tables with prop and location. If these are added it will SPAWN a table that's interactable
		skipPlaceObjectOnGroundProperly = false
	},
        ['twwilddoctor'] = {
		title = "Medical Crafting",
		objects = { 'p_chestmedice01x','p_boxmedmedical01x','s_lootablemedicinecrate' },
		icon = "medical-bag", -- optional. Defaults to 'wrench'
		jobName = { ['twwilddoctor'] = 0 },
		locations = { vector3(-5209.97, -2099.89, 12.59),   -- Tumbleweed Native Camp
					}, 
		-- BOXZONE: If you add one of these objects (locations = ...) it will spawn boxzones
		-- spawnTable = { { coords = vec4(-289.84, 816.27, 119.39, 6.10), prop = 'ex_prop_ex_toolchest_01' } } -- SPAWNS TABLE: the spawnTable field holds a list of several tables with prop and location. If these are added it will SPAWN a table that's interactable
		skipPlaceObjectOnGroundProperly = false
	},

    -- Ranching Crafting
    ['ranch1'] = { 													        -- MacFarlane Ranch
		title = "Rancher Crafting",
		objects = { 'p_horsebrush01x', 'p_feedbag01x', 'p_saddle02x' },
		icon = "horse",
		jobName = { ['ranch1'] = 0 },
		locations = { vector3(-2393.14, -2451.24, 60.22) }, --
		skipPlaceObjectOnGroundProperly = false
	},
    ['ranch2'] = { 													        -- Beechers Hope Ranch
		title = "Rancher Crafting",
		objects = { 'p_horsebrush01x', 'p_feedbag01x', 'p_saddle02x' },
		icon = "horse",
		jobName = { ['ranch2'] = 0 },
		locations = { vector3(-1608.95, -1414.14, 81.94) }, -- 
		skipPlaceObjectOnGroundProperly = false
	},
    ['ranch3'] = { 													        -- OilFields Ranch
		title = "Rancher Crafting",
		objects = { 'p_horsebrush01x', 'p_feedbag01x', 'p_saddle02x' },
		icon = "horse",
		jobName = { ['ranch3'] = 0 },
		locations = { vector3(770.69, 867.22, 120.82) }, -- 
		skipPlaceObjectOnGroundProperly = false
	},
    ['ranch4'] = { 													        -- Kamassa Ranch
		title = "Rancher Crafting",
		objects = { 'p_horsebrush01x', 'p_feedbag01x', 'p_saddle02x' },
		icon = "horse",
		jobName = { ['ranch4'] = 0 },
		locations = { vector3(1365.29, -846.77, 70.91) }, -- 
		skipPlaceObjectOnGroundProperly = false
	},
    ['ranch5'] = { 													        -- Emerald Ranch
		title = "Rancher Crafting",
		objects = { 'p_horsebrush01x', 'p_feedbag01x', 'p_saddle02x' },
		icon = "horse",
		jobName = { ['ranch5'] = 0 },
		locations = { vector3(1445.98, 344.55, 88.59) }, -- 
		skipPlaceObjectOnGroundProperly = false
	},
    ['ranch6'] = { 													        -- Hanging Dog Ranch
		title = "Rancher Crafting",
		objects = { 'p_horsebrush01x', 'p_feedbag01x', 'p_saddle02x' },
		icon = "horse",
		jobName = { ['ranch6'] = 0 },
		locations = { vector3(-2214.98, 722.87, 122.80) }, --
		skipPlaceObjectOnGroundProperly = false
	},
    ['ranch7'] = { 													        -- Rathskellar Ranch
		title = "Rancher Crafting",
		objects = { 'p_horsebrush01x', 'p_feedbag01x', 'p_saddle02x' },
		icon = "horse",
		jobName = { ['ranch7'] = 0 },
		locations = { vector3(-5188.02, -2135.94, 12.04) }, --
		skipPlaceObjectOnGroundProperly = false
	},
    -- Tobacco Businesses
    ['bwtobacco'] = { 													        -- Blackwater
		title = "Blackwater Tobacco Crafting",
		objects = { 'p_horsebrush01x', 'p_feedbag01x', 'p_saddle02x' },
		icon = "hammer",
		jobName = { ['bwtobacco'] = 0 },
		locations = { vector3(-779.25, -1314.91, 43.7) }, -- 
		skipPlaceObjectOnGroundProperly = false
	},
    ['rhotobacco'] = { 													        -- Rhodes
		title = "Rhodes Tobacco Crafting",
		objects = { 'p_horsebrush01x', 'p_feedbag01x', 'p_saddle02x' },
		icon = "hammer",
		jobName = { ['rhotobacco'] = 0 },
		locations = { vector3(1345.26, -1328.99, 77.78) }, -- 
		skipPlaceObjectOnGroundProperly = false
	},

	-- Horse Trainers

	['vhhorsetrainer'] = { 													-- Van Horn
		title = "Horse Training Crafting",
		objects = { 'p_horsebrush01x', 'p_feedbag01x', 'p_saddle02x' },
		icon = "horse",
		jobName = { ['vhhorsetrainer'] = 0 },
		locations = { vector3(2967.12, 792.4, 51.8) }, -- North of Van Horn
		skipPlaceObjectOnGroundProperly = false
	},
	['sdhorsetrainer'] = {													-- Saint Denis
		title = "Horse Training Crafting",
		objects = { 'p_horsebrush01x', 'p_feedbag01x', 'p_saddle02x' },
		icon = "horse",
		jobName = { ['sdhorsetrainer'] = 0 },
		locations = { vector3(2507.51, -1459.57, 46.71) },
		skipPlaceObjectOnGroundProperly = false
	},
	['rhodeshorsetrainer'] = {												-- Rhodes 
		title = "Horse Training Crafting",
		objects = { 'p_horsebrush01x', 'p_feedbag01x', 'p_saddle02x' },
		icon = "horse",
		jobName = { ['rhodeshorsetrainer'] = 0 },
		locations = { vector3(1428.99, -1302.48, 78.21) },
		skipPlaceObjectOnGroundProperly = false
	},
    ['macfarlaneshorsetrainer'] = {												-- Rhodes 
		title = "Horse Training Crafting",
		objects = { 'p_horsebrush01x', 'p_feedbag01x', 'p_saddle02x' },
		icon = "horse",
		jobName = { ['macfarlaneshorsetrainer'] = 0 },
		locations = { vector3(-2404.89, -2381.39, 61.23) },
		skipPlaceObjectOnGroundProperly = false
	},
	['armahorsetrainer'] = {												-- Armadillo
		title = "Horse Training Crafting",
		objects = { 'p_horsebrush01x', 'p_feedbag01x', 'p_saddle02x' },
		icon = "horse",
		jobName = { ['armahorsetrainer'] = 0 },
		locations = { vector3(-3700.54, -2574.25, -13.7) },
		skipPlaceObjectOnGroundProperly = false
	},
	['emeraldhorsetrainer'] = {												-- Emerald Ranch
		title = "Horse Training Crafting",
		objects = { 'p_horsebrush01x', 'p_feedbag01x', 'p_saddle02x' },
		icon = "horse",
		jobName = { ['emeraldhorsetrainer'] = 0 },
		locations = { vector3(1412.99, 273.57, 89.93) },
		skipPlaceObjectOnGroundProperly = false
	},
	['bwhorsetrainer'] = {													-- Blackwater
		title = "Horse Training Crafting",
		objects = { 'p_horsebrush01x', 'p_feedbag01x', 'p_saddle02x' },
		icon = "horse",
		jobName = { ['bwhorsetrainer'] = 0 },
		locations = { vector3(-878.38, -1361.8, 43.6) },
		skipPlaceObjectOnGroundProperly = false
	},
	['strawhorsetrainer'] = {												-- Strawberry
		title = "Horse Training Crafting",
		objects = { 'p_horsebrush01x', 'p_feedbag01x', 'p_saddle02x' },
		icon = "horse",
		jobName = { ['strawhorsetrainer'] = 0 },
		locations = { vector3(-1816.72, -567.38, 155.98) },
		skipPlaceObjectOnGroundProperly = false
	},
	['valhorsetrainer'] = {													-- Valentine
		title = "Horse Training Crafting",
		objects = { 'p_horsebrush01x', 'p_feedbag01x', 'p_saddle02x' },
		icon = "horse",
		jobName = { ['valhorsetrainer'] = 0 },
		locations = { vector3(-366.45, 793.05, 116.16) },
		skipPlaceObjectOnGroundProperly = false
	},
	['wapitihorsetrainer'] = {													-- Valentine
		title = "Horse Training Crafting",
		objects = { 'p_horsebrush01x', 'p_feedbag01x', 'p_saddle02x' },
		icon = "horse",
		jobName = { ['wapitihorsetrainer'] = 0 },
		locations = { vector3(416.15, 2235.52, 254.56) },
		skipPlaceObjectOnGroundProperly = false
	},
    ['tumhorsetrainer'] = {													-- Tumbleweed
		title = "Horse Training Crafting",
		objects = { 'p_horsebrush01x', 'p_feedbag01x', 'p_saddle02x' },
		icon = "horse",
		jobName = { ['tumhorsetrainer'] = 0 },
		locations = { vector3(-5515.71, -3038.96, -2.34) },
		skipPlaceObjectOnGroundProperly = false
	},
	-- Blacksmith Locations
	['valblacksmith'] = {													-- Valentine
		title = "Valentine Blacksmith Crafting",
		objects = { 'p_horsebrush01x', 'p_feedbag01x', 'p_saddle02x' },
		icon = "hammer",
		jobName = { ['valblacksmith'] = 0 },
		locations = { vector3(-369.29, 795.93, 117.19) },
		skipPlaceObjectOnGroundProperly = false
	},
	['emerblacksmith'] = {													-- Emerald Ranch
		title = "Emerald Ranch Blacksmith Crafting",
		objects = { 'p_horsebrush01x', 'p_feedbag01x', 'p_saddle02x' },
		icon = "hammer",
		jobName = { ['emerblacksmith'] =0 },
		locations = { vector3(1442.63, 266.45, 91.35) },
		skipPlaceObjectOnGroundProperly = false
	},
	['blkblacksmith'] = {												-- Blackwater
		title = "Blackwater Blacksmith Crafting",
		objects = { 'p_horsebrush01x', 'p_feedbag01x', 'p_saddle02x' },
		icon = "hammer",
		jobName = { ['blkblacksmith'] = 0 },
		locations = { vector3(-869.60, -1394.87, 44.53) },
		skipPlaceObjectOnGroundProperly = false
	},
	['vanblacksmith'] = {												-- Van Horn
		title = "Van Horn Blacksmith Crafting",
		objects = { 'p_horsebrush01x', 'p_feedbag01x', 'p_saddle02x' },
		icon = "hammer",
		jobName = { ['vanblacksmith'] = 0 },
		locations = { vector3(2948.77, 562.22, 44.79) },
		skipPlaceObjectOnGroundProperly = false
	},
	['stdblacksmith'] = {												-- Saint Denis
		title = "Saint Denis Blacksmith Crafting",
		objects = { 'p_horsebrush01x', 'p_feedbag01x', 'p_saddle02x' },
		icon = "hammer",
		jobName = { ['stdblacksmith'] = 0 },
		locations = { vector3(2515.53, -1458.43, 46.31) },
		skipPlaceObjectOnGroundProperly = false
	},
	['armablacksmith'] = {												-- Armadillo 
		title = "Armadillo Blacksmith Crafting",
		objects = { 'p_horsebrush01x', 'p_feedbag01x', 'p_saddle02x' },
		icon = "hammer",
		jobName = { ['armablacksmith'] = 0 },
		locations = { vector3(-3681.31, -2565.66, -13.56) },
		skipPlaceObjectOnGroundProperly = false
	},
	['tumblacksmith'] = {												-- Tumbleweed 
		title = "Tumbleweed Blacksmith Crafting",
		objects = { 'p_horsebrush01x', 'p_feedbag01x', 'p_saddle02x' },
		icon = "hammer",
		jobName = { ['tumblacksmith'] = 0 },
		locations = { vector3(-5516.69, -3040.95, -2.39) },
		skipPlaceObjectOnGroundProperly = false
	},
	['spiblacksmith'] = {												-- Colter 
		title = "Colter Blacksmith Crafting",
		objects = { 'p_horsebrush01x', 'p_feedbag01x', 'p_saddle02x' },
		icon = "hammer",
		jobName = { ['spiblacksmith'] = 0 },
		locations = { vector3(-1348.27, 2404.61, 307.06) },
		skipPlaceObjectOnGroundProperly = false
	},
	['macblacksmith'] = {												-- MacFarlane 
		title = "MacFarlane Blacksmith Crafting",
		objects = { 'p_horsebrush01x', 'p_feedbag01x', 'p_saddle02x' },
		icon = "hammer",
		jobName = { ['macblacksmith'] = 0 },
		locations = { vector3(-2395.84, -2378.86, 61.19) },
		skipPlaceObjectOnGroundProperly = false
	},
	['strblacksmith'] = {												-- Strawberry 
		title = "Strawberry Blacksmith Crafting",
		objects = { 'p_horsebrush01x', 'p_feedbag01x', 'p_saddle02x' },
		icon = "hammer",
		jobName = { ['strblacksmith'] = 0 },
		locations = { vector3(-1819.69, -568.37, 155.99) },
		skipPlaceObjectOnGroundProperly = false
	},
    ['rhoblacksmith'] = {                                                -- Rhodes 
        title = "Rhodes Blacksmith Crafting",
        objects = { 'p_horsebrush01x', 'p_feedbag01x', 'p_saddle02x' },
        icon = "hammer",
        jobName = { ['rhoblacksmith'] = 0 },
        locations = { vector3(1357.8, -1248.07, 80) },
        skipPlaceObjectOnGroundProperly = false
    },




	-- Saloons                                                              "graverose", "rhosaloon", "sdicecream", "emeraldsaloon" , "elysian", "armbakery", "valsaloon", "blasaloon", "doysaloon"
	['armsaloon'] = {
		title = "Armadillo Kitchen",
		objects = { 'p_stewpot01x', 'p_pot02x', 'p_pievent01x' }, -- Saloon-themed cooking objects
		icon = "glass-whiskey", -- A suitable icon for a saloon/bar (change if you have a custom icon set)
		jobName = { ['armsaloon'] = 0 },
		locations = { vector3(-3698.03, -2601.38, -13.32) }, -- Update or add more positions as needed
		-- spawnTable = { { coords = vec4(-1793.1, -422.38, 158.31, 85.0), prop = 'p_woodbowl01x' } }
		skipPlaceObjectOnGroundProperly = false
	},
    ['tasteofjapan'] = {												-- Van Horn
		title = "Taste of Japan",
		objects = { 'p_horsebrush01x', 'p_feedbag01x', 'p_saddle02x' },
		icon = "hammer",
		jobName = { ['oldsaloon'] = 0 },
		locations = { vector3(2950.33, 529.04, 45.35) },
		skipPlaceObjectOnGroundProperly = false
	},
    ['graverose'] = {
		title = "Graverose Kitchen",
		objects = { 'p_stewpot01x', 'p_pot02x', 'p_pievent01x' }, -- Saloon-themed cooking objects
		icon = "glass-whiskey", -- A suitable icon for a saloon/bar (change if you have a custom icon set)
		jobName = { ['graverose'] = 0 },
		locations = { vector3(2713.45, -1290.43, 60.34) }, -- Update or add more positions as needed
		-- spawnTable = { { coords = vec4(-1793.1, -422.38, 158.31, 85.0), prop = 'p_woodbowl01x' } }
		skipPlaceObjectOnGroundProperly = false
	},
    ['bassaloon'] = {                                                          -- Bastille Saloon
		title = "Bastille Kitchen",
		objects = { 'p_stewpot01x', 'p_pot02x', 'p_pievent01x' }, -- Saloon-themed cooking objects
		icon = "glass-whiskey", -- A suitable icon for a saloon/bar (change if you have a custom icon set)
		jobName = { ['bassaloon'] = 0 },
		locations = { vector3(2640.14, -1228.94, 53.38) }, -- Update or add more positions as needed
		-- spawnTable = { { coords = vec4(-1793.1, -422.38, 158.31, 85.0), prop = 'p_woodbowl01x' } }
		skipPlaceObjectOnGroundProperly = false
	},
    ['tlsaloon'] = {                                                          -- Thieve's Saloon
		title = "Thieves Kitchen",
		objects = { 'p_stewpot01x', 'p_pot02x', 'p_pievent01x' }, -- Saloon-themed cooking objects
		icon = "glass-whiskey", -- A suitable icon for a saloon/bar (change if you have a custom icon set)
		jobName = { ['tlsaloon'] = 0 },
		locations = { vec3(-1394.79, -2320.53, 43.70) }, -- Update or add more positions as needed
		-- spawnTable = { { coords = vec4(-1793.1, -422.38, 158.31, 85.0), prop = 'p_woodbowl01x' } }
		skipPlaceObjectOnGroundProperly = false
	},
    ['tumsaloon'] = {                                                          -- Thieve's Saloon
		title = "Tumbleweed Kitchen",
		objects = { 'p_stewpot01x', 'p_pot02x', 'p_pievent01x' }, -- Saloon-themed cooking objects
		icon = "glass-whiskey", -- A suitable icon for a saloon/bar (change if you have a custom icon set)
		jobName = { ['tumsaloon'] = 0 },
		locations = { vec3(-5520.79, -2906.48, -1.70) }, -- Update or add more positions as needed
		-- spawnTable = { { coords = vec4(-1793.1, -422.38, 158.31, 85.0), prop = 'p_woodbowl01x' } }
		skipPlaceObjectOnGroundProperly = false
	},
    ['rhosaloon'] = {                                                          -- rhodes Saloon
		title = "Rhodes Parlor House",
		objects = { 'p_stewpot01x', 'p_pot02x', 'p_pievent01x' }, -- Saloon-themed cooking objects
		icon = "glass-whiskey", -- A suitable icon for a saloon/bar (change if you have a custom icon set)
		jobName = { ['rhosaloon'] = 0 },
		locations = { vector3(1338.75, -1373.61, 80.48) }, -- Update or add more positions as needed
		-- spawnTable = { { coords = vec4(-1793.1, -422.38, 158.31, 85.0), prop = 'p_woodbowl01x' } }
		skipPlaceObjectOnGroundProperly = false
	},

    ['sdicecream'] = {                                                          -- Saint Denis Ice Cream Shop
		title = "Saint Denis Ice Cream",
		objects = { 'p_stewpot01x', 'p_pot02x', 'p_pievent01x' }, -- Saloon-themed cooking objects
		icon = "glass-whiskey", -- A suitable icon for a saloon/bar (change if you have a custom icon set)
		jobName = { ['sdicecream'] = 0 },
		locations = { vector3(2683.99, -1152.93, 47.3) }, -- Update or add more positions as needed
		-- spawnTable = { { coords = vec4(-1793.1, -422.38, 158.31, 85.0), prop = 'p_woodbowl01x' } }
		skipPlaceObjectOnGroundProperly = false
	},
    ['valcandy'] = {                                                          -- Rhodes Candy Shop
		title = "Rhodes Candy Shop",
		objects = { 'p_stewpot01x', 'p_pot02x', 'p_pievent01x' }, -- Saloon-themed cooking objects
		icon = "glass-whiskey", -- A suitable icon for a saloon/bar (change if you have a custom icon set)
		jobName = { ['valcandy'] = 0 },
		locations = { vector3(1330.17, -1294.47, 77.07) }, -- Update or add more positions as needed
		-- spawnTable = { { coords = vec4(-1793.1, -422.38, 158.31, 85.0), prop = 'p_woodbowl01x' } }
		skipPlaceObjectOnGroundProperly = false
	},
    ['blabakery'] = {
		title = "Blackwater Bakery",
		objects = { 'p_stewpot01x', 'p_pot02x', 'p_pievent01x' }, -- Saloon-themed cooking objects
		icon = "glass-whiskey", -- A suitable icon for a saloon/bar (change if you have a custom icon set)
		jobName = { ['blabakery'] = 0 },
		locations = { vector3(-782.81, -1322.11, 43.93) }, -- Update or add more positions as needed
		-- spawnTable = { { coords = vec4(-1793.1, -422.38, 158.31, 85.0), prop = 'p_woodbowl01x' } }
		skipPlaceObjectOnGroundProperly = false
	},
    ['emeraldsaloon'] = {
		title = "Emerald Kitchen",
		objects = { 'p_stewpot01x', 'p_pot02x', 'p_pievent01x' }, -- Saloon-themed cooking objects
		icon = "glass-whiskey", -- A suitable icon for a saloon/bar (change if you have a custom icon set)
		jobName = { ['emeraldsaloon'] = 0 },
		locations = { vector3(1451.64, 369.28, 89.9) }, -- Update or add more positions as needed
		-- spawnTable = { { coords = vec4(-1793.1, -422.38, 158.31, 85.0), prop = 'p_woodbowl01x' } }
		skipPlaceObjectOnGroundProperly = false
	},
	['elysian'] = {
		title = "Elysian Kitchen",
		objects = { 'p_stewpot01x', 'p_pot02x', 'p_pievent01x' }, -- Saloon-themed cooking objects
		icon = "glass-whiskey", -- A suitable icon for a saloon/bar (change if you have a custom icon set)
		jobName = { ['elysian'] = 0 },
		locations = { vec3(2926.35, 526.44, 38.08) }, -- Update or add more positions as needed
		-- spawnTable = { { coords = vec4(-1793.1, -422.38, 158.31, 85.0), prop = 'p_woodbowl01x' } }
		skipPlaceObjectOnGroundProperly = false
	},

	['armbakery'] = {
		title = "Armadillo Bakery",
		objects = { 'p_stewpot01x', 'p_pot02x', 'p_pievent01x' }, -- Saloon-themed cooking objects
		icon = "glass-whiskey", -- A suitable icon for a saloon/bar (change if you have a custom icon set)
		jobName = { ['armbakery'] = 0 },
		locations = { vector3(-3738.76, -2550.79, -13.04) }, -- Update or add more positions as needed
		-- spawnTable = { { coords = vec4(-1793.1, -422.38, 158.31, 85.0), prop = 'p_woodbowl01x' } }
		skipPlaceObjectOnGroundProperly = false
	},

    ['valsaloon'] = {
		title = "Valentine Saloon",
		objects = { 'p_stewpot01x', 'p_pot02x', 'p_pievent01x' }, -- Saloon-themed cooking objects
		icon = "glass-whiskey", -- A suitable icon for a saloon/bar (change if you have a custom icon set)
		jobName = { ['valsaloon'] = 0 },
		locations = { vector3(-313.83, 807.22, 118.98) }, -- Update or add more positions as needed
		-- spawnTable = { { coords = vec4(-1793.1, -422.38, 158.31, 85.0), prop = 'p_woodbowl01x' } }
		skipPlaceObjectOnGroundProperly = false
	},

	['blasaloon'] = {
		title = "Blackwater Saloon",
		objects = { 'p_stewpot01x', 'p_pot02x', 'p_pievent01x' }, -- Saloon-themed cooking objects
		icon = "glass-whiskey", -- A suitable icon for a saloon/bar (change if you have a custom icon set)
		jobName = { ['blasaloon'] = 0 },
		locations = { vector3(-819.44, -1318.42, 43.67) }, -- Update or add more positions as needed
		-- spawnTable = { { coords = vec4(-1793.1, -422.38, 158.31, 85.0), prop = 'p_woodbowl01x' } }
		skipPlaceObjectOnGroundProperly = false
	},

	['doysaloon'] = {
		title = "Scarlet Lounge", --Doyles Saloon
		objects = { 'p_stewpot01x', 'p_pot02x', 'p_pievent01x' }, -- Saloon-themed cooking objects
		icon = "glass-whiskey", -- A suitable icon for a saloon/bar (change if you have a custom icon set)
		jobName = { ['doysaloon'] = 0 },
		locations = { vector3(2802.91, -1165.67, 47.98) }, -- Update or add more positions as needed
		-- spawnTable = { { coords = vec4(-1793.1, -422.38, 158.31, 85.0), prop = 'p_woodbowl01x' } }
		skipPlaceObjectOnGroundProperly = false
	},
    ['strawsaloon'] = {
		title = "Strawberry Saloon",
		objects = { 'p_stewpot01x', 'p_pot02x', 'p_pievent01x' }, -- Saloon-themed cooking objects
		icon = "glass-whiskey", -- A suitable icon for a saloon/bar (change if you have a custom icon set)
		jobName = { ['strawsaloon'] = 0 },
		locations = { vector3(-1771.82, -376.2, 160.05) }, -- Update or add more positions as needed
		-- spawnTable = { { coords = vec4(-1793.1, -422.38, 158.31, 85.0), prop = 'p_woodbowl01x' } }
		skipPlaceObjectOnGroundProperly = false
	},
    ['guarmasaloon'] = {
		title = "Guarma Saloon",
		objects = { 'p_stewpot01x', 'p_pot02x', 'p_pievent01x' }, -- Saloon-themed cooking objects
		icon = "glass-whiskey", -- A suitable icon for a saloon/bar (change if you have a custom icon set)
		jobName = { ['guarmasaloon'] = 0 },
		locations = { vector3(1287.15, -6908.27, 44.69) }, -- Update or add more positions as needed
		-- spawnTable = { { coords = vec4(-1793.1, -422.38, 158.31, 85.0), prop = 'p_woodbowl01x' } }
		skipPlaceObjectOnGroundProperly = false
	},
    ['valherbalist'] = {
		title = "Herbalist",
		objects = { 'p_stewpot01x', 'p_pot02x', 'p_pievent01x' }, -- Saloon-themed cooking objects
		icon = "glass-whiskey", -- A suitable icon for a saloon/bar (change if you have a custom icon set)
		jobName = { ['valherbalist'] = 0 },
		locations = { vector3(1182.74, 2036.28, 324.02) }, -- Update or add more positions as needed
		-- spawnTable = { { coords = vec4(-1793.1, -422.38, 158.31, 85.0), prop = 'p_woodbowl01x' } }
		skipPlaceObjectOnGroundProperly = false
	},
    
    --cinema
    ['cinema'] = {
		title = "Saint D theatre",
		objects = {},
		icon = "glass-whiskey", -- A suitable icon for a saloon/bar (change if you have a custom icon set)
		jobName = { ['cinema'] = 0 },
		locations = { vector3(2547.86, -1283.97, 49.23) }, -- Update or add more positions as needed
		-- spawnTable = { { coords = vec4(-1793.1, -422.38, 158.31, 85.0), prop = 'p_woodbowl01x' } }
		skipPlaceObjectOnGroundProperly = false
	},

	-- Tobacco Crafting
	['tobaccoprocessone'] = {
		title = "Process",
		objects = {},
		icon = "wrench", -- optional. Defaults to 'wrench'
		locations = { vector3(1833.93, -1280.15, 43.84),
					  vector3(1832.43, -1278.85, 43.84),
					  vector3(1830.66, -1277.72, 43.83),
					  vector3(1838.43, -1274.89, 43.86),	          
					  
					}, 
		-- BOXZONE: If you add one of these objects (locations = ...) it will spawn boxzones
		-- spawnTable = { { coords = vec4(-289.84, 816.27, 119.39, 6.10), prop = 'ex_prop_ex_toolchest_01' } } -- SPAWNS TABLE: the spawnTable field holds a list of several tables with prop and location. If these are added it will SPAWN a table that's interactable
		skipPlaceObjectOnGroundProperly = false
	},
        -- Wood Processing -- St. Denis
            -- Wood Processing -- St. Denis
    ['woodprocessingone'] = {
        title = "Process",
        objects = {},
        icon = "wrench", -- optional. Defaults to 'wrench'
        locations = { vector3(2884.68, -1205.24, 46.31),         -- SaintDenis  
                      
                    }, 
        -- BOXZONE: If you add one of these objects (locations = ...) it will spawn boxzones
        -- spawnTable = { { coords = vec4(-289.84, 816.27, 119.39, 6.10), prop = 'ex_prop_ex_toolchest_01' } } -- SPAWNS TABLE: the spawnTable field holds a list of several tables with prop and location. If these are added it will SPAWN a table that's interactable
        skipPlaceObjectOnGroundProperly = false
    },
    -- Wood Processing -- Blackwater
    ['woodprocessingtwo'] = {
        title = "Process",
        objects = {},
        icon = "wrench", -- optional. Defaults to 'wrench'
        locations = { vector3(-867.01, -1291.76, 43.15),         -- Blackwater  
                      
                    }, 
        -- BOXZONE: If you add one of these objects (locations = ...) it will spawn boxzones
        -- spawnTable = { { coords = vec4(-289.84, 816.27, 119.39, 6.10), prop = 'ex_prop_ex_toolchest_01' } } -- SPAWNS TABLE: the spawnTable field holds a list of several tables with prop and location. If these are added it will SPAWN a table that's interactable
        skipPlaceObjectOnGroundProperly = false
    },
    ['casino'] = {
        title = "Casino Kitchen",
        objects = { 'p_stewpot01x', 'p_pot02x', 'p_pievent01x' }, -- Saloon-themed cooking objects
        icon = "glass-whiskey", -- A suitable icon for a saloon/bar (change if you have a custom icon set)
        jobName = { ['casino'] = 0 },
        locations = { vector3(2864.71, -1398.41, 43.6) }, -- Update or add more positions as needed
        -- spawnTable = { { coords = vec4(-1793.1, -422.38, 158.31, 85.0), prop = 'p_woodbowl01x' } }
        skipPlaceObjectOnGroundProperly = false
    },


    -- Swamp Herb Crafting

	['swampprocessone'] = {
		title = "Process",
		objects = {},
		icon = "wrench", -- optional. Defaults to 'wrench'
		locations = { vector3(1869.03, 582.85, 113.91) }, 
		-- BOXZONE: If you add one of these objects (locations = ...) it will spawn boxzones
		-- spawnTable = { { coords = vec4(-289.84, 816.27, 119.39, 6.10), prop = 'ex_prop_ex_toolchest_01' } } -- SPAWNS TABLE: the spawnTable field holds a list of several tables with prop and location. If these are added it will SPAWN a table that's interactable
		skipPlaceObjectOnGroundProperly = false
	},

	-- Moonshine Mixer
    ['bluemixologist'] = {                                                -- Rhodes 
        title = "Bluewater Marsh Mixologist",
        objects = { 'p_stewpot01x', 'p_pot02x', 'p_pievent01x' },
        icon = "glass-whiskey",
        jobName = { ['bluemixologist'] = 0 },
        locations = { vector3(2497.3, -419.52, 44.58) },
        skipPlaceObjectOnGroundProperly = false
    },




}

Config.UseSundownUtils = false

Config.BlueprintDudes = nil