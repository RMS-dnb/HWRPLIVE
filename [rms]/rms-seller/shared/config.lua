Config = {}

Config.Core = 'rsg-core'

Config.Debug = true

Config.Inv = 'v2'
Config.InvName = 'rsg-inventory' -- this is used for rsg inventory v2 exports
Config.InvSettings = {
    maxweight = 10000000,
    slots = 10,
}

---------------------------------
-- blip settings
---------------------------------



Config.Interaction = 'target' -- prompt : RSGCORE PROMPT SYSTEM | target : target System

Config.InteractionName = 'rsg-target' --- rsg-core : using for prompt | rsg-target : for target system


Config.Locations = {
    {
        Prompt = {
            name = 'unique_butcher',
            keybind = 0xF3830D8E, -- This keybind only works for prompt system
            msg = 'Open Meat Seller',
            promptvec = vector3(2817.9174, -1329.932, 46.517669)    -- Saint Denis 
        },
        ItemPrices = {
            
            --meats
            --meats
            ['deer_meat'] = 0.60,
            ['biggamemeat'] = 0.80,
            ['smallgamemeat'] = 0.40,
            ['elk_meat'] = 0.80,
            ['boar_meat'] = 0.65,
            ['ram_meat'] = 0.70,
            ['bear_meat'] = 0.90,
            ['bison_meat'] = 1.25,
            ['bull_meat'] = 1.40,
            ['duck_meat'] = 0.50,
            ['eagle_meat'] = 2.00,
            ['egret_meat'] = 0.75,
            ['fox_meat'] = 0.60,
            ['wolf_meat'] = 1.00,
            ['vulture_meat'] = 0.80,
            ['turtle_meat'] = 0.50,
            ['turkey_meat'] = 0.50,
            ['snake_meat'] = 0.40,
            ['sheep_meat'] = 0.40,
            ['bird_meat'] = 0.60,
            ['raccoon_meat'] = 0.40,
            ['rabbit_meat'] = 0.40,
            ['possum_meat'] = 0.20,
            ['pork_meat'] = 0.65,
            ['panther_meat'] = 2.00,
            ['chicken_meat'] = 0.60,
            ['cougar_meat'] = 2.00,
            ['coyote_meat'] = 0.50,
            ['lizard_meat'] = 0.60,
            ['goat_meat'] = 0.50,
            ['moose_meat'] = 2.00,
            ['ox_meat'] = 0.75,
            ['gator_meat'] = 0.70,
            ['beaver_meat'] = 0.70,
            ['beef_meat'] = 0.70,
            ['crawfish'] = 0.80,
            
            --parts 
            ['skunkfur'] = 0.30,
            ['sheepwool'] = 0.30,
            ['birdfeather'] = 0.25,
            ['raccoonpaw'] = 0.20,
            ['rabbitpaw'] = 0.15,
            ['possumfur'] = 0.20,
            ['pigskin'] = 0.20,
            ['pelicanfeather'] = 0.20,
            ['panthereyeball'] = 2.00,
            ['coyotefang'] = 0.20,
            ['hawkfeather'] = 0.30,
            ['hawktalon'] = 0.40,
            ['elkantlers'] = 0.40,
            ['animalfat'] = 0.10,
            ['ramhorn'] = 0.30,
            ['foxclaw'] = 0.20,
            ['cougarclaw'] = 1.00,
            ['beavertail'] = 1.00,
            ['feather'] = 0.15,
            ['diamondback_skin'] = 0.50,
            ['watersnake_skin'] = 0.50,
            ['redboa_skin'] = 0.50,
            ['blacktail_skin'] = 0.50,
            ['cottonmouth_skin'] = 0.60,
            ['ferdelance_skin'] = 0.70,
            ['deer_antlers'] = 0.30,
            ['bearclaw'] = 1.00,
            ['boartusk'] = 0.30,
            ['bisonhorn'] = 1.00,
            ['deerhide'] = 0.30,
            ['duckfeather'] = 0.30,
            ['eagletalon'] = 2.00,
            ['eaglefeather'] = 1.00,
            ['egretfeather'] = 0.70,
            ['wolfheart'] = 0.90,
            ['vulturefeather'] = 0.20,
            ['turtleshell'] = 0.70,
            ['turkeyfeather'] = 0.15,
            ['snakevenom'] = 0.90,
            ['reptile_skin'] = 0.90,
            ['animal_heart'] = 0.90,
            ['small_pelt'] = 0.90,
            

            -- Bear Pelts
            ['perfect_bear_pelt'] = 2.00,
            ['good_bear_pelt'] = 1.50,
            ['poor_bear_pelt'] = 1.00,

            -- Black Bear Pelts
            ['perfect_black_bear_pelt'] = 1.75,
            ['good_black_bear_pelt'] = 1.35,
            ['poor_black_bear_pelt'] = 0.95,

            -- Boar Pelts
            ['perfect_boar_pelt'] = 1.00,
            ['good_boar_pelt'] = 0.75,
            ['poor_boar_pelt'] = 0.55,

            -- Buck Pelts
            ['perfect_buck_pelt'] = 1.00,
            ['good_buck_pelt'] = 0.80,
            ['poor_buck_pelt'] = 0.60,

            -- Buffalo Pelts
            ['perfect_buffalo_pelt'] = 2.25,
            ['good_buffalo_pelt'] = 1.75,
            ['poor_buffalo_pelt'] = 1.25,

            -- Bull Pelts
            ['perfect_bull_pelt'] = 1.25,
            ['good_bull_pelt'] = 0.75,
            ['poor_bull_pelt'] = 0.50,

            -- Cougar Pelts
            ['perfect_cougar_pelt'] = 2.00,
            ['good_cougar_pelt'] = 1.75,
            ['poor_cougar_pelt'] = 1.50,

            -- Cow Pelts
            ['perfect_cow_pelt'] = 0.80,
            ['good_cow_pelt'] = 0.60,
            ['poor_cow_pelt'] = 0.40,

            -- Coyote Pelts
            ['perfect_coyote_pelt'] = 0.60,
            ['good_coyote_pelt'] = 0.40,
            ['poor_coyote_pelt'] = 0.25,

            -- Deer Pelts
            ['perfect_deer_pelt'] = 0.60,
            ['good_deer_pelt'] = 0.45,
            ['poor_deer_pelt'] = 0.30,

            -- Elk Pelts
            ['perfect_elk_pelt'] = 0.90,
            ['good_elk_pelt'] = 0.75,
            ['poor_elk_pelt'] = 0.60,

            -- Fox Pelts
            ['perfect_fox_pelt'] = 0.60,
            ['good_fox_pelt'] = 0.45,
            ['poor_fox_pelt'] = 0.30,

            -- Goat Pelts
            ['perfect_goat_pelt'] = 0.60,
            ['good_goat_pelt'] = 0.45,
            ['poor_goat_pelt'] = 0.30,

            -- Javelina Pelts
            ['perfect_javelina_pelt'] = 0.75,
            ['good_javelina_pelt'] = 0.60,
            ['poor_javelina_pelt'] = 0.45,

            -- Moose Pelts
            ['perfect_moose_pelt'] = 2.00,
            ['good_moose_pelt'] = 1.70,
            ['poor_moose_pelt'] = 1.40,

            -- Ox Pelts
            ['perfect_ox_pelt'] = 1.90,
            ['good_ox_pelt'] = 1.40,
            ['poor_ox_pelt'] = 1.00,

            -- Panther Pelts
            ['perfect_panther_pelt'] = 2.50,
            ['good_panther_pelt'] = 1.90,
            ['poor_panther_pelt'] = 1.30,


            -- Pig Pelts
            ['perfect_pig_pelt'] = 0.80,
            ['good_pig_pelt'] = 0.65,
            ['poor_pig_pelt'] = 0.50,

            -- Pronghorn Pelts
            ['perfect_pronghorn_pelt'] = 0.60,
            ['good_pronghorn_pelt'] = 0.45,
            ['poor_pronghorn_pelt'] = 0.30,

            -- Bighorn Ram Pelts
            ['perfect_bighornram_pelt'] = 0.85,
            ['good_bighornram_pelt'] = 0.65,
            ['poor_bighornram_pelt'] = 0.45,

            -- Sheep Pelts
            ['perfect_sheep_pelt'] = 0.75,
            ['good_sheep_pelt'] = 0.50,
            ['poor_sheep_pelt'] = 0.30,

            -- Wolf Pelts
            ['perfect_wolf_pelt'] = 1.90,
            ['good_wolf_pelt'] = 1.50,
            ['poor_wolf_pelt'] = 1.00,

            -- Alligator Pelts
            ['perfect_alligator_pelt'] = 1.50,
            ['good_alligator_pelt'] = 1.20,
            ['poor_alligator_pelt'] = 0.90,

            -- Legendary Alligator Pelt
            ['legendary_alligator_pelt'] = 5.00,

            -- Large Alligator Pelts
            ['perfect_large_alligator_pelt'] = 2.00,
            ['good_large_alligator_pelt'] = 1.50,
            ['poor_large_alligator_pelt'] = 1.10,


          -- Legendary Beaver Pelts
            ['legendary_beaver_pelt'] = 2.40,
            ['legendary_moon_beaver_pelt'] = 2.10,
            ['legendary_zizi_beaver_pelt'] = 2.20,
            ['legendary_night_beaver_pelt'] = 2.30,

            -- Legendary Boar Pelt
            ['legendary_boar_pelt'] = 2.50,

            -- Legendary Cougar Pelt
            ['legendary_cougar_pelt'] = 2.00,

            -- Legendary Coyote Pelt
            ['legendary_coyote_pelt'] = 1.90,

            -- Legendary Panther Pelt
            ['legendary_panther_pelt'] = 2.30,

            -- Legendary Wolf Pelt
            ['legendary_wolf_pelt'] = 2.10,

            -- Raccoon Pelts
            ['perfect_raccoon_pelt'] = 1.50,
            ['good_raccoon_pelt'] = 1.10,
            ['poor_raccoon_pelt'] = 0.80,
            ['boarhair'] = 0.80,

        },
    },
    {
        Prompt = {
            name = 'unique_butcher_1',
            keybind = 0xF3830D8E,
            msg = 'Open Meat Seller',
            promptvec = vector3(-334.0964, 766.18469, 116.63094) -- Valentine
        },
        ItemPrices = {
            
            --meats
            ['deer_meat'] = 0.60,
            ['biggamemeat'] = 0.80,
            ['smallgamemeat'] = 0.40,
            ['boar_meat'] = 0.65,
            ['ram_meat'] = 0.70,
            ['bear_meat'] = 0.90,
            ['bison_meat'] = 1.25,
            ['bull_meat'] = 1.40,
            ['duck_meat'] = 0.50,
            ['eagle_meat'] = 2.00,
            ['egret_meat'] = 0.75,
            ['fox_meat'] = 0.60,
            ['wolf_meat'] = 1.00,
            ['vulture_meat'] = 0.80,
            ['turtle_meat'] = 0.50,
            ['turkey_meat'] = 0.50,
            ['snake_meat'] = 0.40,
            ['sheep_meat'] = 0.40,
            ['bird_meat'] = 0.60,
            ['raccoon_meat'] = 0.40,
            ['rabbit_meat'] = 0.40,
            ['possum_meat'] = 0.20,
            ['pork_meat'] = 0.65,
            ['panther_meat'] = 2.00,
            ['chicken_meat'] = 0.60,
            ['cougar_meat'] = 2.00,
            ['coyote_meat'] = 0.50,
            ['lizard_meat'] = 0.60,
            ['goat_meat'] = 0.50,
            ['moose_meat'] = 2.00,
            ['ox_meat'] = 0.75,
            ['gator_meat'] = 0.70,
            ['beaver_meat'] = 0.70,
            ['beef_meat'] = 0.70,
            ['crawfish'] = 0.80,
            
            --parts 
            ['skunkfur'] = 0.30,
            ['sheepwool'] = 0.30,
            ['birdfeather'] = 0.25,
            ['raccoonpaw'] = 0.20,
            ['rabbitpaw'] = 0.15,
            ['possumfur'] = 0.20,
            ['pigskin'] = 0.20,
            ['pelicanfeather'] = 0.20,
            ['panthereyeball'] = 2.00,
            ['coyotefang'] = 0.20,
            ['hawkfeather'] = 0.30,
            ['hawktalon'] = 0.40,
            ['elkantlers'] = 0.40,
            ['animalfat'] = 0.10,
            ['ramhorn'] = 0.30,
            ['foxclaw'] = 0.20,
            ['cougarclaw'] = 1.00,
            ['beavertail'] = 1.00,
            ['feather'] = 0.15,
            ['diamondback_skin'] = 0.50,
            ['watersnake_skin'] = 0.50,
            ['redboa_skin'] = 0.50,
            ['blacktail_skin'] = 0.50,
            ['cottonmouth_skin'] = 0.60,
            ['ferdelance_skin'] = 0.70,
            ['deer_antlers'] = 0.30,
            ['bearclaw'] = 1.00,
            ['boartusk'] = 0.30,
            ['bisonhorn'] = 1.00,
            ['deerhide'] = 0.30,
            ['duckfeather'] = 0.30,
            ['eagletalon'] = 2.00,
            ['eaglefeather'] = 1.00,
            ['egretfeather'] = 0.70,
            ['wolfheart'] = 0.90,
            ['vulturefeather'] = 0.20,
            ['turtleshell'] = 0.70,
            ['turkeyfeather'] = 0.15,
            ['snakevenom'] = 0.90,
            ['reptile_skin'] = 0.90,
            ['animal_heart'] = 0.90,
            ['small_pelt'] = 0.90,
            

            -- Bear Pelts
            ['perfect_bear_pelt'] = 2.00,
            ['good_bear_pelt'] = 1.50,
            ['poor_bear_pelt'] = 1.00,

            -- Black Bear Pelts
            ['perfect_black_bear_pelt'] = 1.75,
            ['good_black_bear_pelt'] = 1.35,
            ['poor_black_bear_pelt'] = 0.95,

            -- Boar Pelts
            ['perfect_boar_pelt'] = 1.00,
            ['good_boar_pelt'] = 0.75,
            ['poor_boar_pelt'] = 0.55,

            -- Buck Pelts
            ['perfect_buck_pelt'] = 1.00,
            ['good_buck_pelt'] = 0.80,
            ['poor_buck_pelt'] = 0.60,

            -- Buffalo Pelts
            ['perfect_buffalo_pelt'] = 2.25,
            ['good_buffalo_pelt'] = 1.75,
            ['poor_buffalo_pelt'] = 1.25,

            -- Bull Pelts
            ['perfect_bull_pelt'] = 1.25,
            ['good_bull_pelt'] = 0.75,
            ['poor_bull_pelt'] = 0.50,

            -- Cougar Pelts
            ['perfect_cougar_pelt'] = 2.00,
            ['good_cougar_pelt'] = 1.75,
            ['poor_cougar_pelt'] = 1.50,

            -- Cow Pelts
            ['perfect_cow_pelt'] = 0.80,
            ['good_cow_pelt'] = 0.60,
            ['poor_cow_pelt'] = 0.40,

            -- Coyote Pelts
            ['perfect_coyote_pelt'] = 0.60,
            ['good_coyote_pelt'] = 0.40,
            ['poor_coyote_pelt'] = 0.25,

            -- Deer Pelts
            ['perfect_deer_pelt'] = 0.60,
            ['good_deer_pelt'] = 0.45,
            ['poor_deer_pelt'] = 0.30,

            -- Elk Pelts
            ['perfect_elk_pelt'] = 0.90,
            ['good_elk_pelt'] = 0.75,
            ['poor_elk_pelt'] = 0.60,

            -- Fox Pelts
            ['perfect_fox_pelt'] = 0.60,
            ['good_fox_pelt'] = 0.45,
            ['poor_fox_pelt'] = 0.30,

            -- Goat Pelts
            ['perfect_goat_pelt'] = 0.60,
            ['good_goat_pelt'] = 0.45,
            ['poor_goat_pelt'] = 0.30,

            -- Javelina Pelts
            ['perfect_javelina_pelt'] = 0.75,
            ['good_javelina_pelt'] = 0.60,
            ['poor_javelina_pelt'] = 0.45,

            -- Moose Pelts
            ['perfect_moose_pelt'] = 2.00,
            ['good_moose_pelt'] = 1.70,
            ['poor_moose_pelt'] = 1.40,

            -- Ox Pelts
            ['perfect_ox_pelt'] = 1.90,
            ['good_ox_pelt'] = 1.40,
            ['poor_ox_pelt'] = 1.00,

            -- Panther Pelts
            ['perfect_panther_pelt'] = 2.50,
            ['good_panther_pelt'] = 1.90,
            ['poor_panther_pelt'] = 1.30,


            -- Pig Pelts
            ['perfect_pig_pelt'] = 0.80,
            ['good_pig_pelt'] = 0.65,
            ['poor_pig_pelt'] = 0.50,

            -- Pronghorn Pelts
            ['perfect_pronghorn_pelt'] = 0.60,
            ['good_pronghorn_pelt'] = 0.45,
            ['poor_pronghorn_pelt'] = 0.30,

            -- Bighorn Ram Pelts
            ['perfect_bighornram_pelt'] = 0.85,
            ['good_bighornram_pelt'] = 0.65,
            ['poor_bighornram_pelt'] = 0.45,

            -- Sheep Pelts
            ['perfect_sheep_pelt'] = 0.75,
            ['good_sheep_pelt'] = 0.50,
            ['poor_sheep_pelt'] = 0.30,

            -- Wolf Pelts
            ['perfect_wolf_pelt'] = 1.90,
            ['good_wolf_pelt'] = 1.50,
            ['poor_wolf_pelt'] = 1.00,

            -- Alligator Pelts
            ['perfect_alligator_pelt'] = 1.50,
            ['good_alligator_pelt'] = 1.20,
            ['poor_alligator_pelt'] = 0.90,

            -- Legendary Alligator Pelt
            ['legendary_alligator_pelt'] = 5.00,

            -- Large Alligator Pelts
            ['perfect_large_alligator_pelt'] = 2.00,
            ['good_large_alligator_pelt'] = 1.50,
            ['poor_large_alligator_pelt'] = 1.10,


          -- Legendary Beaver Pelts
            ['legendary_beaver_pelt'] = 2.40,
            ['legendary_moon_beaver_pelt'] = 2.10,
            ['legendary_zizi_beaver_pelt'] = 2.20,
            ['legendary_night_beaver_pelt'] = 2.30,

            -- Legendary Boar Pelt
            ['legendary_boar_pelt'] = 2.50,

            -- Legendary Cougar Pelt
            ['legendary_cougar_pelt'] = 2.00,

            -- Legendary Coyote Pelt
            ['legendary_coyote_pelt'] = 1.90,

            -- Legendary Panther Pelt
            ['legendary_panther_pelt'] = 2.30,

            -- Legendary Wolf Pelt
            ['legendary_wolf_pelt'] = 2.10,

            -- Raccoon Pelts
            ['perfect_raccoon_pelt'] = 1.50,
            ['good_raccoon_pelt'] = 1.10,
            ['poor_raccoon_pelt'] = 0.80,
            ['boarhair'] = 0.80,

        }
        
    },
    {
        Prompt = {
            name = 'unique_butcher_2',
            keybind = 0xF3830D8E,
            msg = 'Open Meat Seller',
            promptvec = vector3(2940.5637, 1310.312, 44.479141)  -- Annesburg
        },
        ItemPrices = {
            
            --meats
            --meats
            ['deer_meat'] = 0.60,
            ['biggamemeat'] = 0.80,
            ['smallgamemeat'] = 0.40,
            ['elk_meat'] = 0.80,
            ['boar_meat'] = 0.65,
            ['ram_meat'] = 0.70,
            ['bear_meat'] = 0.90,
            ['bison_meat'] = 1.25,
            ['bull_meat'] = 1.40,
            ['duck_meat'] = 0.50,
            ['eagle_meat'] = 2.00,
            ['egret_meat'] = 0.75,
            ['fox_meat'] = 0.60,
            ['wolf_meat'] = 1.00,
            ['vulture_meat'] = 0.80,
            ['turtle_meat'] = 0.50,
            ['turkey_meat'] = 0.50,
            ['snake_meat'] = 0.40,
            ['sheep_meat'] = 0.40,
            ['bird_meat'] = 0.60,
            ['raccoon_meat'] = 0.40,
            ['rabbit_meat'] = 0.40,
            ['possum_meat'] = 0.20,
            ['pork_meat'] = 0.65,
            ['panther_meat'] = 2.00,
            ['chicken_meat'] = 0.60,
            ['cougar_meat'] = 2.00,
            ['coyote_meat'] = 0.50,
            ['lizard_meat'] = 0.60,
            ['goat_meat'] = 0.50,
            ['moose_meat'] = 2.00,
            ['ox_meat'] = 0.75,
            ['gator_meat'] = 0.70,
            ['beaver_meat'] = 0.70,
            ['beef_meat'] = 0.70,
            ['crawfish'] = 0.80,
            
            --parts 
            ['skunkfur'] = 0.30,
            ['sheepwool'] = 0.30,
            ['birdfeather'] = 0.25,
            ['raccoonpaw'] = 0.20,
            ['rabbitpaw'] = 0.15,
            ['possumfur'] = 0.20,
            ['pigskin'] = 0.20,
            ['pelicanfeather'] = 0.20,
            ['panthereyeball'] = 2.00,
            ['coyotefang'] = 0.20,
            ['hawkfeather'] = 0.30,
            ['hawktalon'] = 0.40,
            ['elkantlers'] = 0.40,
            ['animalfat'] = 0.10,
            ['ramhorn'] = 0.30,
            ['foxclaw'] = 0.20,
            ['cougarclaw'] = 1.00,
            ['beavertail'] = 1.00,
            ['feather'] = 0.15,
            ['diamondback_skin'] = 0.50,
            ['watersnake_skin'] = 0.50,
            ['redboa_skin'] = 0.50,
            ['blacktail_skin'] = 0.50,
            ['cottonmouth_skin'] = 0.60,
            ['ferdelance_skin'] = 0.70,
            ['deer_antlers'] = 0.30,
            ['bearclaw'] = 1.00,
            ['boartusk'] = 0.30,
            ['bisonhorn'] = 1.00,
            ['deerhide'] = 0.30,
            ['duckfeather'] = 0.30,
            ['eagletalon'] = 2.00,
            ['eaglefeather'] = 1.00,
            ['egretfeather'] = 0.70,
            ['wolfheart'] = 0.90,
            ['vulturefeather'] = 0.20,
            ['turtleshell'] = 0.70,
            ['turkeyfeather'] = 0.15,
            ['snakevenom'] = 0.90,
            ['reptile_skin'] = 0.90,
            ['animal_heart'] = 0.90,
            ['small_pelt'] = 0.90,
            

            -- Bear Pelts
            ['perfect_bear_pelt'] = 2.00,
            ['good_bear_pelt'] = 1.50,
            ['poor_bear_pelt'] = 1.00,

            -- Black Bear Pelts
            ['perfect_black_bear_pelt'] = 1.75,
            ['good_black_bear_pelt'] = 1.35,
            ['poor_black_bear_pelt'] = 0.95,

            -- Boar Pelts
            ['perfect_boar_pelt'] = 1.00,
            ['good_boar_pelt'] = 0.75,
            ['poor_boar_pelt'] = 0.55,

            -- Buck Pelts
            ['perfect_buck_pelt'] = 1.00,
            ['good_buck_pelt'] = 0.80,
            ['poor_buck_pelt'] = 0.60,

            -- Buffalo Pelts
            ['perfect_buffalo_pelt'] = 2.25,
            ['good_buffalo_pelt'] = 1.75,
            ['poor_buffalo_pelt'] = 1.25,

            -- Bull Pelts
            ['perfect_bull_pelt'] = 1.25,
            ['good_bull_pelt'] = 0.75,
            ['poor_bull_pelt'] = 0.50,

            -- Cougar Pelts
            ['perfect_cougar_pelt'] = 2.00,
            ['good_cougar_pelt'] = 1.75,
            ['poor_cougar_pelt'] = 1.50,

            -- Cow Pelts
            ['perfect_cow_pelt'] = 0.80,
            ['good_cow_pelt'] = 0.60,
            ['poor_cow_pelt'] = 0.40,

            -- Coyote Pelts
            ['perfect_coyote_pelt'] = 0.60,
            ['good_coyote_pelt'] = 0.40,
            ['poor_coyote_pelt'] = 0.25,

            -- Deer Pelts
            ['perfect_deer_pelt'] = 0.60,
            ['good_deer_pelt'] = 0.45,
            ['poor_deer_pelt'] = 0.30,

            -- Elk Pelts
            ['perfect_elk_pelt'] = 0.90,
            ['good_elk_pelt'] = 0.75,
            ['poor_elk_pelt'] = 0.60,

            -- Fox Pelts
            ['perfect_fox_pelt'] = 0.60,
            ['good_fox_pelt'] = 0.45,
            ['poor_fox_pelt'] = 0.30,

            -- Goat Pelts
            ['perfect_goat_pelt'] = 0.60,
            ['good_goat_pelt'] = 0.45,
            ['poor_goat_pelt'] = 0.30,

            -- Javelina Pelts
            ['perfect_javelina_pelt'] = 0.75,
            ['good_javelina_pelt'] = 0.60,
            ['poor_javelina_pelt'] = 0.45,

            -- Moose Pelts
            ['perfect_moose_pelt'] = 2.00,
            ['good_moose_pelt'] = 1.70,
            ['poor_moose_pelt'] = 1.40,

            -- Ox Pelts
            ['perfect_ox_pelt'] = 1.90,
            ['good_ox_pelt'] = 1.40,
            ['poor_ox_pelt'] = 1.00,

            -- Panther Pelts
            ['perfect_panther_pelt'] = 2.50,
            ['good_panther_pelt'] = 1.90,
            ['poor_panther_pelt'] = 1.30,


            -- Pig Pelts
            ['perfect_pig_pelt'] = 0.80,
            ['good_pig_pelt'] = 0.65,
            ['poor_pig_pelt'] = 0.50,

            -- Pronghorn Pelts
            ['perfect_pronghorn_pelt'] = 0.60,
            ['good_pronghorn_pelt'] = 0.45,
            ['poor_pronghorn_pelt'] = 0.30,

            -- Bighorn Ram Pelts
            ['perfect_bighornram_pelt'] = 0.85,
            ['good_bighornram_pelt'] = 0.65,
            ['poor_bighornram_pelt'] = 0.45,

            -- Sheep Pelts
            ['perfect_sheep_pelt'] = 0.75,
            ['good_sheep_pelt'] = 0.50,
            ['poor_sheep_pelt'] = 0.30,

            -- Wolf Pelts
            ['perfect_wolf_pelt'] = 1.90,
            ['good_wolf_pelt'] = 1.50,
            ['poor_wolf_pelt'] = 1.00,

            -- Alligator Pelts
            ['perfect_alligator_pelt'] = 1.50,
            ['good_alligator_pelt'] = 1.20,
            ['poor_alligator_pelt'] = 0.90,

            -- Legendary Alligator Pelt
            ['legendary_alligator_pelt'] = 5.00,

            -- Large Alligator Pelts
            ['perfect_large_alligator_pelt'] = 2.00,
            ['good_large_alligator_pelt'] = 1.50,
            ['poor_large_alligator_pelt'] = 1.10,


          -- Legendary Beaver Pelts
            ['legendary_beaver_pelt'] = 2.40,
            ['legendary_moon_beaver_pelt'] = 2.10,
            ['legendary_zizi_beaver_pelt'] = 2.20,
            ['legendary_night_beaver_pelt'] = 2.30,

            -- Legendary Boar Pelt
            ['legendary_boar_pelt'] = 2.50,

            -- Legendary Cougar Pelt
            ['legendary_cougar_pelt'] = 2.00,

            -- Legendary Coyote Pelt
            ['legendary_coyote_pelt'] = 1.90,

            -- Legendary Panther Pelt
            ['legendary_panther_pelt'] = 2.30,

            -- Legendary Wolf Pelt
            ['legendary_wolf_pelt'] = 2.10,

            -- Raccoon Pelts
            ['perfect_raccoon_pelt'] = 1.50,
            ['good_raccoon_pelt'] = 1.10,
            ['poor_raccoon_pelt'] = 0.80,
            ['boarhair'] = 0.80,

        }
        
    },
    {
        Prompt = {
            name = 'unique_butcher_3',
            keybind = 0xF3830D8E,
            msg = 'Open Meat Seller',
            promptvec = vector3(466.34167, 2247.0439, 248.36877) -- Wapiti
        },
        ItemPrices = {
            
            --meats
            --meats
            ['deer_meat'] = 0.60,
            ['biggamemeat'] = 0.80,
            ['smallgamemeat'] = 0.40,
           
            ['boar_meat'] = 0.65,
            ['ram_meat'] = 0.70,
            ['bear_meat'] = 0.90,
            ['bison_meat'] = 1.25,
            ['bull_meat'] = 1.40,
            ['duck_meat'] = 0.50,
            ['eagle_meat'] = 2.00,
            ['egret_meat'] = 0.75,
            ['fox_meat'] = 0.60,
            ['wolf_meat'] = 1.00,
            ['vulture_meat'] = 0.80,
            ['turtle_meat'] = 0.50,
            ['turkey_meat'] = 0.50,
            ['snake_meat'] = 0.40,
            ['sheep_meat'] = 0.40,
            ['bird_meat'] = 0.60,
            ['raccoon_meat'] = 0.40,
            ['rabbit_meat'] = 0.40,
            ['possum_meat'] = 0.20,
            ['pork_meat'] = 0.65,
            ['panther_meat'] = 2.00,
            ['chicken_meat'] = 0.60,
            ['cougar_meat'] = 2.00,
            ['coyote_meat'] = 0.50,
            ['lizard_meat'] = 0.60,
            ['goat_meat'] = 0.50,
            ['moose_meat'] = 2.00,
            ['ox_meat'] = 0.75,
            ['gator_meat'] = 0.70,
            ['beaver_meat'] = 0.70,
            ['beef_meat'] = 0.70,
            ['crawfish'] = 0.80,
            
            --parts 
            ['skunkfur'] = 0.30,
            ['sheepwool'] = 0.30,
            ['birdfeather'] = 0.25,
            ['raccoonpaw'] = 0.20,
            ['rabbitpaw'] = 0.15,
            ['possumfur'] = 0.20,
            ['pigskin'] = 0.20,
            ['pelicanfeather'] = 0.20,
            ['panthereyeball'] = 2.00,
            ['coyotefang'] = 0.20,
            ['hawkfeather'] = 0.30,
            ['hawktalon'] = 0.40,
            ['elkantlers'] = 0.40,
            ['animalfat'] = 0.10,
            ['ramhorn'] = 0.30,
            ['foxclaw'] = 0.20,
            ['cougarclaw'] = 1.00,
            ['beavertail'] = 1.00,
            ['feather'] = 0.15,
            ['diamondback_skin'] = 0.50,
            ['watersnake_skin'] = 0.50,
            ['redboa_skin'] = 0.50,
            ['blacktail_skin'] = 0.50,
            ['cottonmouth_skin'] = 0.60,
            ['ferdelance_skin'] = 0.70,
            ['deer_antlers'] = 0.30,
            ['bearclaw'] = 1.00,
            ['boartusk'] = 0.30,
            ['bisonhorn'] = 1.00,
            ['deerhide'] = 0.30,
            ['duckfeather'] = 0.30,
            ['eagletalon'] = 2.00,
            ['eaglefeather'] = 1.00,
            ['egretfeather'] = 0.70,
            ['wolfheart'] = 0.90,
            ['vulturefeather'] = 0.20,
            ['turtleshell'] = 0.70,
            ['turkeyfeather'] = 0.15,
            ['snakevenom'] = 0.90,
            ['reptile_skin'] = 0.90,
            ['animal_heart'] = 0.90,
            ['small_pelt'] = 0.90,
            

            -- Bear Pelts
            ['perfect_bear_pelt'] = 2.00,
            ['good_bear_pelt'] = 1.50,
            ['poor_bear_pelt'] = 1.00,

            -- Black Bear Pelts
            ['perfect_black_bear_pelt'] = 1.75,
            ['good_black_bear_pelt'] = 1.35,
            ['poor_black_bear_pelt'] = 0.95,

            -- Boar Pelts
            ['perfect_boar_pelt'] = 1.00,
            ['good_boar_pelt'] = 0.75,
            ['poor_boar_pelt'] = 0.55,

            -- Buck Pelts
            ['perfect_buck_pelt'] = 1.00,
            ['good_buck_pelt'] = 0.80,
            ['poor_buck_pelt'] = 0.60,

            -- Buffalo Pelts
            ['perfect_buffalo_pelt'] = 2.25,
            ['good_buffalo_pelt'] = 1.75,
            ['poor_buffalo_pelt'] = 1.25,

            -- Bull Pelts
            ['perfect_bull_pelt'] = 1.25,
            ['good_bull_pelt'] = 0.75,
            ['poor_bull_pelt'] = 0.50,

            -- Cougar Pelts
            ['perfect_cougar_pelt'] = 2.00,
            ['good_cougar_pelt'] = 1.75,
            ['poor_cougar_pelt'] = 1.50,

            -- Cow Pelts
            ['perfect_cow_pelt'] = 0.80,
            ['good_cow_pelt'] = 0.60,
            ['poor_cow_pelt'] = 0.40,

            -- Coyote Pelts
            ['perfect_coyote_pelt'] = 0.60,
            ['good_coyote_pelt'] = 0.40,
            ['poor_coyote_pelt'] = 0.25,

            -- Deer Pelts
            ['perfect_deer_pelt'] = 0.60,
            ['good_deer_pelt'] = 0.45,
            ['poor_deer_pelt'] = 0.30,

            -- Elk Pelts
            ['perfect_elk_pelt'] = 0.90,
            ['good_elk_pelt'] = 0.75,
            ['poor_elk_pelt'] = 0.60,

            -- Fox Pelts
            ['perfect_fox_pelt'] = 0.60,
            ['good_fox_pelt'] = 0.45,
            ['poor_fox_pelt'] = 0.30,

            -- Goat Pelts
            ['perfect_goat_pelt'] = 0.60,
            ['good_goat_pelt'] = 0.45,
            ['poor_goat_pelt'] = 0.30,

            -- Javelina Pelts
            ['perfect_javelina_pelt'] = 0.75,
            ['good_javelina_pelt'] = 0.60,
            ['poor_javelina_pelt'] = 0.45,

            -- Moose Pelts
            ['perfect_moose_pelt'] = 2.00,
            ['good_moose_pelt'] = 1.70,
            ['poor_moose_pelt'] = 1.40,

            -- Ox Pelts
            ['perfect_ox_pelt'] = 1.90,
            ['good_ox_pelt'] = 1.40,
            ['poor_ox_pelt'] = 1.00,

            -- Panther Pelts
            ['perfect_panther_pelt'] = 2.50,
            ['good_panther_pelt'] = 1.90,
            ['poor_panther_pelt'] = 1.30,


            -- Pig Pelts
            ['perfect_pig_pelt'] = 0.80,
            ['good_pig_pelt'] = 0.65,
            ['poor_pig_pelt'] = 0.50,

            -- Pronghorn Pelts
            ['perfect_pronghorn_pelt'] = 0.60,
            ['good_pronghorn_pelt'] = 0.45,
            ['poor_pronghorn_pelt'] = 0.30,

            -- Bighorn Ram Pelts
            ['perfect_bighornram_pelt'] = 0.85,
            ['good_bighornram_pelt'] = 0.65,
            ['poor_bighornram_pelt'] = 0.45,

            -- Sheep Pelts
            ['perfect_sheep_pelt'] = 0.75,
            ['good_sheep_pelt'] = 0.50,
            ['poor_sheep_pelt'] = 0.30,

            -- Wolf Pelts
            ['perfect_wolf_pelt'] = 1.90,
            ['good_wolf_pelt'] = 1.50,
            ['poor_wolf_pelt'] = 1.00,

            -- Alligator Pelts
            ['perfect_alligator_pelt'] = 1.50,
            ['good_alligator_pelt'] = 1.20,
            ['poor_alligator_pelt'] = 0.90,

            -- Legendary Alligator Pelt
            ['legendary_alligator_pelt'] = 5.00,

            -- Large Alligator Pelts
            ['perfect_large_alligator_pelt'] = 2.00,
            ['good_large_alligator_pelt'] = 1.50,
            ['poor_large_alligator_pelt'] = 1.10,


          -- Legendary Beaver Pelts
            ['legendary_beaver_pelt'] = 2.40,
            ['legendary_moon_beaver_pelt'] = 2.10,
            ['legendary_zizi_beaver_pelt'] = 2.20,
            ['legendary_night_beaver_pelt'] = 2.30,

            -- Legendary Boar Pelt
            ['legendary_boar_pelt'] = 2.50,

            -- Legendary Cougar Pelt
            ['legendary_cougar_pelt'] = 2.00,

            -- Legendary Coyote Pelt
            ['legendary_coyote_pelt'] = 1.90,

            -- Legendary Panther Pelt
            ['legendary_panther_pelt'] = 2.30,

            -- Legendary Wolf Pelt
            ['legendary_wolf_pelt'] = 2.10,

            -- Raccoon Pelts
            ['perfect_raccoon_pelt'] = 1.50,
            ['good_raccoon_pelt'] = 1.10,
            ['poor_raccoon_pelt'] = 0.80,
            ['boarhair'] = 0.80,




            
            
        }
        
    },
    {
        Prompt = {
            name = 'unique_butcher_4',
            keybind = 0xF3830D8E,
            msg = 'Open Meat Seller',
            promptvec = vector3(-755.6054, -1287.679, 43.647121) -- Blackwater
        },
        ItemPrices = {
            
            ---meats
            ['deer_meat'] = 0.60,
            ['biggamemeat'] = 0.80,
            ['smallgamemeat'] = 0.40,
            ['elk_meat'] = 0.80,
            ['boar_meat'] = 0.65,
            ['ram_meat'] = 0.70,
            ['bear_meat'] = 0.90,
            ['bison_meat'] = 1.25,
            ['bull_meat'] = 1.40,
            ['duck_meat'] = 0.50,
            ['eagle_meat'] = 2.00,
            ['egret_meat'] = 0.75,
            ['fox_meat'] = 0.60,
            ['wolf_meat'] = 1.00,
            ['vulture_meat'] = 0.80,
            ['turtle_meat'] = 0.50,
            ['turkey_meat'] = 0.50,
            ['snake_meat'] = 0.40,
            ['sheep_meat'] = 0.40,
            ['bird_meat'] = 0.60,
            ['raccoon_meat'] = 0.40,
            ['rabbit_meat'] = 0.40,
            ['possum_meat'] = 0.20,
            ['pork_meat'] = 0.65,
            ['panther_meat'] = 2.00,
            ['chicken_meat'] = 0.60,
            ['cougar_meat'] = 2.00,
            ['coyote_meat'] = 0.50,
            ['lizard_meat'] = 0.60,
            ['goat_meat'] = 0.50,
            ['moose_meat'] = 2.00,
            ['ox_meat'] = 0.75,
            ['gator_meat'] = 0.70,
            ['beaver_meat'] = 0.70,
            ['beef_meat'] = 0.70,
            ['crawfish'] = 0.80,
            
            --parts 
            ['skunkfur'] = 0.30,
            ['sheepwool'] = 0.30,
            ['birdfeather'] = 0.25,
            ['raccoonpaw'] = 0.20,
            ['rabbitpaw'] = 0.15,
            ['possumfur'] = 0.20,
            ['pigskin'] = 0.20,
            ['pelicanfeather'] = 0.20,
            ['panthereyeball'] = 2.00,
            ['coyotefang'] = 0.20,
            ['hawkfeather'] = 0.30,
            ['hawktalon'] = 0.40,
            ['elkantlers'] = 0.40,
            ['animalfat'] = 0.10,
            ['ramhorn'] = 0.30,
            ['foxclaw'] = 0.20,
            ['cougarclaw'] = 1.00,
            ['beavertail'] = 1.00,
            ['feather'] = 0.15,
            ['diamondback_skin'] = 0.50,
            ['watersnake_skin'] = 0.50,
            ['redboa_skin'] = 0.50,
            ['blacktail_skin'] = 0.50,
            ['cottonmouth_skin'] = 0.60,
            ['ferdelance_skin'] = 0.70,
            ['deer_antlers'] = 0.30,
            ['bearclaw'] = 1.00,
            ['boartusk'] = 0.30,
            ['bisonhorn'] = 1.00,
            ['deerhide'] = 0.30,
            ['duckfeather'] = 0.30,
            ['eagletalon'] = 2.00,
            ['eaglefeather'] = 1.00,
            ['egretfeather'] = 0.70,
            ['wolfheart'] = 0.90,
            ['vulturefeather'] = 0.20,
            ['turtleshell'] = 0.70,
            ['turkeyfeather'] = 0.15,
            ['snakevenom'] = 0.90,
            ['reptile_skin'] = 0.90,
            ['animal_heart'] = 0.90,
            ['small_pelt'] = 0.90,
            

            -- Bear Pelts
            ['perfect_bear_pelt'] = 2.00,
            ['good_bear_pelt'] = 1.50,
            ['poor_bear_pelt'] = 1.00,

            -- Black Bear Pelts
            ['perfect_black_bear_pelt'] = 1.75,
            ['good_black_bear_pelt'] = 1.35,
            ['poor_black_bear_pelt'] = 0.95,

            -- Boar Pelts
            ['perfect_boar_pelt'] = 1.00,
            ['good_boar_pelt'] = 0.75,
            ['poor_boar_pelt'] = 0.55,

            -- Buck Pelts
            ['perfect_buck_pelt'] = 1.00,
            ['good_buck_pelt'] = 0.80,
            ['poor_buck_pelt'] = 0.60,

            -- Buffalo Pelts
            ['perfect_buffalo_pelt'] = 2.25,
            ['good_buffalo_pelt'] = 1.75,
            ['poor_buffalo_pelt'] = 1.25,

            -- Bull Pelts
            ['perfect_bull_pelt'] = 1.25,
            ['good_bull_pelt'] = 0.75,
            ['poor_bull_pelt'] = 0.50,

            -- Cougar Pelts
            ['perfect_cougar_pelt'] = 2.00,
            ['good_cougar_pelt'] = 1.75,
            ['poor_cougar_pelt'] = 1.50,

            -- Cow Pelts
            ['perfect_cow_pelt'] = 0.80,
            ['good_cow_pelt'] = 0.60,
            ['poor_cow_pelt'] = 0.40,

            -- Coyote Pelts
            ['perfect_coyote_pelt'] = 0.60,
            ['good_coyote_pelt'] = 0.40,
            ['poor_coyote_pelt'] = 0.25,

            -- Deer Pelts
            ['perfect_deer_pelt'] = 0.60,
            ['good_deer_pelt'] = 0.45,
            ['poor_deer_pelt'] = 0.30,

            -- Elk Pelts
            ['perfect_elk_pelt'] = 0.90,
            ['good_elk_pelt'] = 0.75,
            ['poor_elk_pelt'] = 0.60,

            -- Fox Pelts
            ['perfect_fox_pelt'] = 0.60,
            ['good_fox_pelt'] = 0.45,
            ['poor_fox_pelt'] = 0.30,

            -- Goat Pelts
            ['perfect_goat_pelt'] = 0.60,
            ['good_goat_pelt'] = 0.45,
            ['poor_goat_pelt'] = 0.30,

            -- Javelina Pelts
            ['perfect_javelina_pelt'] = 0.75,
            ['good_javelina_pelt'] = 0.60,
            ['poor_javelina_pelt'] = 0.45,

            -- Moose Pelts
            ['perfect_moose_pelt'] = 2.00,
            ['good_moose_pelt'] = 1.70,
            ['poor_moose_pelt'] = 1.40,

            -- Ox Pelts
            ['perfect_ox_pelt'] = 1.90,
            ['good_ox_pelt'] = 1.40,
            ['poor_ox_pelt'] = 1.00,

            -- Panther Pelts
            ['perfect_panther_pelt'] = 2.50,
            ['good_panther_pelt'] = 1.90,
            ['poor_panther_pelt'] = 1.30,


            -- Pig Pelts
            ['perfect_pig_pelt'] = 0.80,
            ['good_pig_pelt'] = 0.65,
            ['poor_pig_pelt'] = 0.50,

            -- Pronghorn Pelts
            ['perfect_pronghorn_pelt'] = 0.60,
            ['good_pronghorn_pelt'] = 0.45,
            ['poor_pronghorn_pelt'] = 0.30,

            -- Bighorn Ram Pelts
            ['perfect_bighornram_pelt'] = 0.85,
            ['good_bighornram_pelt'] = 0.65,
            ['poor_bighornram_pelt'] = 0.45,

            -- Sheep Pelts
            ['perfect_sheep_pelt'] = 0.75,
            ['good_sheep_pelt'] = 0.50,
            ['poor_sheep_pelt'] = 0.30,

            -- Wolf Pelts
            ['perfect_wolf_pelt'] = 1.90,
            ['good_wolf_pelt'] = 1.50,
            ['poor_wolf_pelt'] = 1.00,

            -- Alligator Pelts
            ['perfect_alligator_pelt'] = 1.50,
            ['good_alligator_pelt'] = 1.20,
            ['poor_alligator_pelt'] = 0.90,

            -- Legendary Alligator Pelt
            ['legendary_alligator_pelt'] = 5.00,

            -- Large Alligator Pelts
            ['perfect_large_alligator_pelt'] = 2.00,
            ['good_large_alligator_pelt'] = 1.50,
            ['poor_large_alligator_pelt'] = 1.10,


          -- Legendary Beaver Pelts
            ['legendary_beaver_pelt'] = 2.40,
            ['legendary_moon_beaver_pelt'] = 2.10,
            ['legendary_zizi_beaver_pelt'] = 2.20,
            ['legendary_night_beaver_pelt'] = 2.30,

            -- Legendary Boar Pelt
            ['legendary_boar_pelt'] = 2.50,

            -- Legendary Cougar Pelt
            ['legendary_cougar_pelt'] = 2.00,

            -- Legendary Coyote Pelt
            ['legendary_coyote_pelt'] = 1.90,

            -- Legendary Panther Pelt
            ['legendary_panther_pelt'] = 2.30,

            -- Legendary Wolf Pelt
            ['legendary_wolf_pelt'] = 2.10,

            -- Raccoon Pelts
            ['perfect_raccoon_pelt'] = 1.50,
            ['good_raccoon_pelt'] = 1.10,
            ['poor_raccoon_pelt'] = 0.80,
            ['boarhair'] = 0.80,

        }
        
    },
    {
        Prompt = {
            name = 'unique_butcher_5',
            keybind = 0xF3830D8E,
            msg = 'Open Meat Seller',
            promptvec = vector3(-3695.61, -2625.2, -13.81) -- Armadillo
        },
        ItemPrices = {
            
            --meats
            ['deer_meat'] = 0.60,
            ['biggamemeat'] = 0.80,
            ['smallgamemeat'] = 0.40,
            ['elk_meat'] = 0.80,
            ['boar_meat'] = 0.65,
            ['ram_meat'] = 0.70,
            ['bear_meat'] = 0.90,
            ['bison_meat'] = 1.25,
            ['bull_meat'] = 1.40,
            ['duck_meat'] = 0.50,
            ['eagle_meat'] = 2.00,
            ['egret_meat'] = 0.75,
            ['fox_meat'] = 0.60,
            ['wolf_meat'] = 1.00,
            ['vulture_meat'] = 0.80,
            ['turtle_meat'] = 0.50,
            ['turkey_meat'] = 0.50,
            ['snake_meat'] = 0.40,
            ['sheep_meat'] = 0.40,
            ['bird_meat'] = 0.60,
            ['raccoon_meat'] = 0.40,
            ['rabbit_meat'] = 0.40,
            ['possum_meat'] = 0.20,
            ['pork_meat'] = 0.65,
            ['panther_meat'] = 2.00,
            ['chicken_meat'] = 0.60,
            ['cougar_meat'] = 2.00,
            ['coyote_meat'] = 0.50,
            ['lizard_meat'] = 0.60,
            ['goat_meat'] = 0.50,
            ['moose_meat'] = 2.00,
            ['ox_meat'] = 0.75,
            ['gator_meat'] = 0.70,
            ['beaver_meat'] = 0.70,
            ['beef_meat'] = 0.70,
            ['crawfish'] = 0.80,
            ['armadilloskin'] = 0.80,
            
            --parts 
            ['skunkfur'] = 0.30,
            ['sheepwool'] = 0.30,
            ['birdfeather'] = 0.25,
            ['raccoonpaw'] = 0.20,
            ['rabbitpaw'] = 0.15,
            ['possumfur'] = 0.20,
            ['pigskin'] = 0.20,
            ['pelicanfeather'] = 0.20,
            ['panthereyeball'] = 2.00,
            ['coyotefang'] = 0.20,
            ['hawkfeather'] = 0.30,
            ['hawktalon'] = 0.40,
            ['elkantlers'] = 0.40,
            ['animalfat'] = 0.10,
            ['ramhorn'] = 0.30,
            ['foxclaw'] = 0.20,
            ['cougarclaw'] = 1.00,
            ['beavertail'] = 1.00,
            ['feather'] = 0.15,
            ['diamondback_skin'] = 0.50,
            ['watersnake_skin'] = 0.50,
            ['redboa_skin'] = 0.50,
            ['blacktail_skin'] = 0.50,
            ['cottonmouth_skin'] = 0.60,
            ['ferdelance_skin'] = 0.70,
            ['deer_antlers'] = 0.30,
            ['bearclaw'] = 1.00,
            ['boartusk'] = 0.30,
            ['bisonhorn'] = 1.00,
            ['deerhide'] = 0.30,
            ['duckfeather'] = 0.30,
            ['eagletalon'] = 2.00,
            ['eaglefeather'] = 1.00,
            ['egretfeather'] = 0.70,
            ['wolfheart'] = 0.90,
            ['vulturefeather'] = 0.20,
            ['turtleshell'] = 0.70,
            ['turkeyfeather'] = 0.15,
            ['snakevenom'] = 0.90,
            ['reptile_skin'] = 0.90,
            ['animal_heart'] = 0.90,
            ['small_pelt'] = 0.90,
            

            -- Bear Pelts
            ['perfect_bear_pelt'] = 2.00,
            ['good_bear_pelt'] = 1.50,
            ['poor_bear_pelt'] = 1.00,

            -- Black Bear Pelts
            ['perfect_black_bear_pelt'] = 1.75,
            ['good_black_bear_pelt'] = 1.35,
            ['poor_black_bear_pelt'] = 0.95,

            -- Boar Pelts
            ['perfect_boar_pelt'] = 1.00,
            ['good_boar_pelt'] = 0.75,
            ['poor_boar_pelt'] = 0.55,

            -- Buck Pelts
            ['perfect_buck_pelt'] = 1.00,
            ['good_buck_pelt'] = 0.80,
            ['poor_buck_pelt'] = 0.60,

            -- Buffalo Pelts
            ['perfect_buffalo_pelt'] = 2.25,
            ['good_buffalo_pelt'] = 1.75,
            ['poor_buffalo_pelt'] = 1.25,

            -- Bull Pelts
            ['perfect_bull_pelt'] = 1.25,
            ['good_bull_pelt'] = 0.75,
            ['poor_bull_pelt'] = 0.50,

            -- Cougar Pelts
            ['perfect_cougar_pelt'] = 2.00,
            ['good_cougar_pelt'] = 1.75,
            ['poor_cougar_pelt'] = 1.50,

            -- Cow Pelts
            ['perfect_cow_pelt'] = 0.80,
            ['good_cow_pelt'] = 0.60,
            ['poor_cow_pelt'] = 0.40,

            -- Coyote Pelts
            ['perfect_coyote_pelt'] = 0.60,
            ['good_coyote_pelt'] = 0.40,
            ['poor_coyote_pelt'] = 0.25,

            -- Deer Pelts
            ['perfect_deer_pelt'] = 0.60,
            ['good_deer_pelt'] = 0.45,
            ['poor_deer_pelt'] = 0.30,

            -- Elk Pelts
            ['perfect_elk_pelt'] = 0.90,
            ['good_elk_pelt'] = 0.75,
            ['poor_elk_pelt'] = 0.60,

            -- Fox Pelts
            ['perfect_fox_pelt'] = 0.60,
            ['good_fox_pelt'] = 0.45,
            ['poor_fox_pelt'] = 0.30,

            -- Goat Pelts
            ['perfect_goat_pelt'] = 0.60,
            ['good_goat_pelt'] = 0.45,
            ['poor_goat_pelt'] = 0.30,

            -- Javelina Pelts
            ['perfect_javelina_pelt'] = 0.75,
            ['good_javelina_pelt'] = 0.60,
            ['poor_javelina_pelt'] = 0.45,

            -- Moose Pelts
            ['perfect_moose_pelt'] = 2.00,
            ['good_moose_pelt'] = 1.70,
            ['poor_moose_pelt'] = 1.40,

            -- Ox Pelts
            ['perfect_ox_pelt'] = 1.90,
            ['good_ox_pelt'] = 1.40,
            ['poor_ox_pelt'] = 1.00,

            -- Panther Pelts
            ['perfect_panther_pelt'] = 2.50,
            ['good_panther_pelt'] = 1.90,
            ['poor_panther_pelt'] = 1.30,


            -- Pig Pelts
            ['perfect_pig_pelt'] = 0.80,
            ['good_pig_pelt'] = 0.65,
            ['poor_pig_pelt'] = 0.50,

            -- Pronghorn Pelts
            ['perfect_pronghorn_pelt'] = 0.60,
            ['good_pronghorn_pelt'] = 0.45,
            ['poor_pronghorn_pelt'] = 0.30,

            -- Bighorn Ram Pelts
            ['perfect_bighornram_pelt'] = 0.85,
            ['good_bighornram_pelt'] = 0.65,
            ['poor_bighornram_pelt'] = 0.45,

            -- Sheep Pelts
            ['perfect_sheep_pelt'] = 0.75,
            ['good_sheep_pelt'] = 0.50,
            ['poor_sheep_pelt'] = 0.30,

            -- Wolf Pelts
            ['perfect_wolf_pelt'] = 1.90,
            ['good_wolf_pelt'] = 1.50,
            ['poor_wolf_pelt'] = 1.00,

            -- Alligator Pelts
            ['perfect_alligator_pelt'] = 1.50,
            ['good_alligator_pelt'] = 1.20,
            ['poor_alligator_pelt'] = 0.90,

            -- Legendary Alligator Pelt
            ['legendary_alligator_pelt'] = 5.00,

            -- Large Alligator Pelts
            ['perfect_large_alligator_pelt'] = 2.00,
            ['good_large_alligator_pelt'] = 1.50,
            ['poor_large_alligator_pelt'] = 1.10,


          -- Legendary Beaver Pelts
            ['legendary_beaver_pelt'] = 2.40,
            ['legendary_moon_beaver_pelt'] = 2.10,
            ['legendary_zizi_beaver_pelt'] = 2.20,
            ['legendary_night_beaver_pelt'] = 2.30,

            -- Legendary Boar Pelt
            ['legendary_boar_pelt'] = 2.50,

            -- Legendary Cougar Pelt
            ['legendary_cougar_pelt'] = 2.00,

            -- Legendary Coyote Pelt
            ['legendary_coyote_pelt'] = 1.90,

            -- Legendary Panther Pelt
            ['legendary_panther_pelt'] = 2.30,

            -- Legendary Wolf Pelt
            ['legendary_wolf_pelt'] = 2.10,

            -- Raccoon Pelts
            ['perfect_raccoon_pelt'] = 1.50,
            ['good_raccoon_pelt'] = 1.10,
            ['poor_raccoon_pelt'] = 0.80,
            ['boarhair'] = 0.80,

        }
        
    },
    {
        Prompt = {
            name = 'unique_butcher_6',
            keybind = 0xF3830D8E,
            msg = 'Open Meat Seller',
            promptvec = vector3(-5508.935, -2944.571, -1.900522) -- Tumbleweed
        },
        ItemPrices = {
            
            --meats
            --meats
            ['deer_meat'] = 0.60,
            ['armadilloskin'] = 0.80,
            ['biggamemeat'] = 0.80,
            ['smallgamemeat'] = 0.40,
            ['elk_meat'] = 0.80,
            ['boar_meat'] = 0.65,
            ['ram_meat'] = 0.70,
            ['bear_meat'] = 0.90,
            ['bison_meat'] = 1.25,
            ['bull_meat'] = 1.40,
            ['duck_meat'] = 0.50,
            ['eagle_meat'] = 2.00,
            ['egret_meat'] = 0.75,
            ['fox_meat'] = 0.60,
            ['wolf_meat'] = 1.00,
            ['vulture_meat'] = 0.80,
            ['turtle_meat'] = 0.50,
            ['turkey_meat'] = 0.50,
            ['snake_meat'] = 0.40,
            ['sheep_meat'] = 0.40,
            ['bird_meat'] = 0.60,
            ['raccoon_meat'] = 0.40,
            ['rabbit_meat'] = 0.40,
            ['possum_meat'] = 0.20,
            ['pork_meat'] = 0.65,
            ['panther_meat'] = 2.00,
            ['chicken_meat'] = 0.60,
            ['cougar_meat'] = 2.00,
            ['coyote_meat'] = 0.50,
            ['lizard_meat'] = 0.60,
            ['goat_meat'] = 0.50,
            ['moose_meat'] = 2.00,
            ['ox_meat'] = 0.75,
            ['gator_meat'] = 0.70,
            ['beaver_meat'] = 0.70,
            ['beef_meat'] = 0.70,
            ['crawfish'] = 0.80,
            
            --parts 
            ['skunkfur'] = 0.30,
            ['sheepwool'] = 0.30,
            ['birdfeather'] = 0.25,
            ['raccoonpaw'] = 0.20,
            ['rabbitpaw'] = 0.15,
            ['possumfur'] = 0.20,
            ['pigskin'] = 0.20,
            ['pelicanfeather'] = 0.20,
            ['panthereyeball'] = 2.00,
            ['coyotefang'] = 0.20,
            ['hawkfeather'] = 0.30,
            ['hawktalon'] = 0.40,
            ['elkantlers'] = 0.40,
            ['animalfat'] = 0.10,
            ['ramhorn'] = 0.30,
            ['foxclaw'] = 0.20,
            ['cougarclaw'] = 1.00,
            ['beavertail'] = 1.00,
            ['feather'] = 0.15,
            ['diamondback_skin'] = 0.50,
            ['watersnake_skin'] = 0.50,
            ['redboa_skin'] = 0.50,
            ['blacktail_skin'] = 0.50,
            ['cottonmouth_skin'] = 0.60,
            ['ferdelance_skin'] = 0.70,
            ['deer_antlers'] = 0.30,
            ['bearclaw'] = 1.00,
            ['boartusk'] = 0.30,
            ['bisonhorn'] = 1.00,
            ['deerhide'] = 0.30,
            ['duckfeather'] = 0.30,
            ['eagletalon'] = 2.00,
            ['eaglefeather'] = 1.00,
            ['egretfeather'] = 0.70,
            ['wolfheart'] = 0.90,
            ['vulturefeather'] = 0.20,
            ['turtleshell'] = 0.70,
            ['turkeyfeather'] = 0.15,
            ['snakevenom'] = 0.90,
            ['reptile_skin'] = 0.90,
            ['animal_heart'] = 0.90,
            ['small_pelt'] = 0.90,
            

            -- Bear Pelts
            ['perfect_bear_pelt'] = 2.00,
            ['good_bear_pelt'] = 1.50,
            ['poor_bear_pelt'] = 1.00,

            -- Black Bear Pelts
            ['perfect_black_bear_pelt'] = 1.75,
            ['good_black_bear_pelt'] = 1.35,
            ['poor_black_bear_pelt'] = 0.95,

            -- Boar Pelts
            ['perfect_boar_pelt'] = 1.00,
            ['good_boar_pelt'] = 0.75,
            ['poor_boar_pelt'] = 0.55,

            -- Buck Pelts
            ['perfect_buck_pelt'] = 1.00,
            ['good_buck_pelt'] = 0.80,
            ['poor_buck_pelt'] = 0.60,

            -- Buffalo Pelts
            ['perfect_buffalo_pelt'] = 2.25,
            ['good_buffalo_pelt'] = 1.75,
            ['poor_buffalo_pelt'] = 1.25,

            -- Bull Pelts
            ['perfect_bull_pelt'] = 1.25,
            ['good_bull_pelt'] = 0.75,
            ['poor_bull_pelt'] = 0.50,

            -- Cougar Pelts
            ['perfect_cougar_pelt'] = 2.00,
            ['good_cougar_pelt'] = 1.75,
            ['poor_cougar_pelt'] = 1.50,

            -- Cow Pelts
            ['perfect_cow_pelt'] = 0.80,
            ['good_cow_pelt'] = 0.60,
            ['poor_cow_pelt'] = 0.40,

            -- Coyote Pelts
            ['perfect_coyote_pelt'] = 0.60,
            ['good_coyote_pelt'] = 0.40,
            ['poor_coyote_pelt'] = 0.25,

            -- Deer Pelts
            ['perfect_deer_pelt'] = 0.60,
            ['good_deer_pelt'] = 0.45,
            ['poor_deer_pelt'] = 0.30,

            -- Elk Pelts
            ['perfect_elk_pelt'] = 0.90,
            ['good_elk_pelt'] = 0.75,
            ['poor_elk_pelt'] = 0.60,

            -- Fox Pelts
            ['perfect_fox_pelt'] = 0.60,
            ['good_fox_pelt'] = 0.45,
            ['poor_fox_pelt'] = 0.30,

            -- Goat Pelts
            ['perfect_goat_pelt'] = 0.60,
            ['good_goat_pelt'] = 0.45,
            ['poor_goat_pelt'] = 0.30,

            -- Javelina Pelts
            ['perfect_javelina_pelt'] = 0.75,
            ['good_javelina_pelt'] = 0.60,
            ['poor_javelina_pelt'] = 0.45,

            -- Moose Pelts
            ['perfect_moose_pelt'] = 2.00,
            ['good_moose_pelt'] = 1.70,
            ['poor_moose_pelt'] = 1.40,

            -- Ox Pelts
            ['perfect_ox_pelt'] = 1.90,
            ['good_ox_pelt'] = 1.40,
            ['poor_ox_pelt'] = 1.00,

            -- Panther Pelts
            ['perfect_panther_pelt'] = 2.50,
            ['good_panther_pelt'] = 1.90,
            ['poor_panther_pelt'] = 1.30,


            -- Pig Pelts
            ['perfect_pig_pelt'] = 0.80,
            ['good_pig_pelt'] = 0.65,
            ['poor_pig_pelt'] = 0.50,

            -- Pronghorn Pelts
            ['perfect_pronghorn_pelt'] = 0.60,
            ['good_pronghorn_pelt'] = 0.45,
            ['poor_pronghorn_pelt'] = 0.30,

            -- Bighorn Ram Pelts
            ['perfect_bighornram_pelt'] = 0.85,
            ['good_bighornram_pelt'] = 0.65,
            ['poor_bighornram_pelt'] = 0.45,

            -- Sheep Pelts
            ['perfect_sheep_pelt'] = 0.75,
            ['good_sheep_pelt'] = 0.50,
            ['poor_sheep_pelt'] = 0.30,

            -- Wolf Pelts
            ['perfect_wolf_pelt'] = 1.90,
            ['good_wolf_pelt'] = 1.50,
            ['poor_wolf_pelt'] = 1.00,

            -- Alligator Pelts
            ['perfect_alligator_pelt'] = 1.50,
            ['good_alligator_pelt'] = 1.20,
            ['poor_alligator_pelt'] = 0.90,

            -- Legendary Alligator Pelt
            ['legendary_alligator_pelt'] = 5.00,

            -- Large Alligator Pelts
            ['perfect_large_alligator_pelt'] = 2.00,
            ['good_large_alligator_pelt'] = 1.50,
            ['poor_large_alligator_pelt'] = 1.10,


          -- Legendary Beaver Pelts
            ['legendary_beaver_pelt'] = 2.40,
            ['legendary_moon_beaver_pelt'] = 2.10,
            ['legendary_zizi_beaver_pelt'] = 2.20,
            ['legendary_night_beaver_pelt'] = 2.30,

            -- Legendary Boar Pelt
            ['legendary_boar_pelt'] = 2.50,

            -- Legendary Cougar Pelt
            ['legendary_cougar_pelt'] = 2.00,

            -- Legendary Coyote Pelt
            ['legendary_coyote_pelt'] = 1.90,

            -- Legendary Panther Pelt
            ['legendary_panther_pelt'] = 2.30,

            -- Legendary Wolf Pelt
            ['legendary_wolf_pelt'] = 2.10,

            -- Raccoon Pelts
            ['perfect_raccoon_pelt'] = 1.50,
            ['good_raccoon_pelt'] = 1.10,
            ['poor_raccoon_pelt'] = 0.80,
            ['boarhair'] = 0.80,

        }
        
    },
    {
        Prompt = {
            name = 'unique_butcher_7',
            keybind = 0xF3830D8E,
            msg = 'Ore Buyer',
            promptvec = vector3(2799.6154, 1349.9226, 73.13272)  -- Annesburg
        },
        ItemPrices = {
            --ores
            ['iron_ore'] = 0.35,
            ['lead_ore'] = 0.25,
            ['copper_ore'] = 0.15,
            ['coal_ore'] = 0.35,
            ['zinc_ore'] = 0.25,
            ['silver_ore'] = 0.15,
            ['stone'] = 0.35,
            ['clay'] = 0.25,
            ['diamond_uncut'] = 0.15,
            
        }
        
    },
    {
        Prompt = {
            name = 'unique_butcher_8',
            keybind = 0xF3830D8E,
            msg = 'Ore Buyer',
            promptvec = vector3(-5984.12, -3224.48, -21.18) -- Gaptooth Mine
        },
        ItemPrices = {
            --ores
            ['iron_ore'] = 0.35,
            ['lead_ore'] = 0.25,
            ['copper_ore'] = 0.15,
            ['coal_ore'] = 0.35,
            ['zinc_ore'] = 0.25,
            ['silver_ore'] = 0.15,
            ['stone'] = 0.35,
            ['clay'] = 0.25,
            ['diamond_uncut'] = 0.15
            
        }
        
    },
    {
        Prompt = {
            name = 'unique_miner_1',
            keybind = 0xF3830D8E,
            msg = 'Ore Buyer',
            promptvec = vector3(-1386.55, 1152.42, 225.02) -- near Strawberry
        },
        ItemPrices = {
            --ores
            ['iron_ore'] = 0.35,
            ['lead_ore'] = 0.25,
            ['copper_ore'] = 0.15,
            ['coal_ore'] = 0.35,
            ['zinc_ore'] = 0.25,
            ['silver_ore'] = 0.15,
            ['stone'] = 0.35,
            ['clay'] = 0.25,
            ['diamond_uncut'] = 0.15
            
        }
        
    },
    

    {
        Prompt = {
            name = 'unique_butcher_9',
            keybind = 0xF3830D8E,
            msg = 'Open Meat Seller',
            promptvec = vector3(1301.004, -1278.831, 76.026367)  -- Rhodes
        },
        ItemPrices = {
            
            --meats
            ['deer_meat'] = 0.60,
            ['armadilloskin'] = 0.80,
            ['biggamemeat'] = 0.80,
            ['smallgamemeat'] = 0.40,
            ['elk_meat'] = 0.80,
            ['boar_meat'] = 0.65,
            ['ram_meat'] = 0.70,
            ['bear_meat'] = 0.90,
            ['bison_meat'] = 1.25,
            ['bull_meat'] = 1.40,
            ['duck_meat'] = 0.50,
            ['eagle_meat'] = 2.00,
            ['egret_meat'] = 0.75,
            ['fox_meat'] = 0.60,
            ['wolf_meat'] = 1.00,
            ['vulture_meat'] = 0.80,
            ['turtle_meat'] = 0.50,
            ['turkey_meat'] = 0.50,
            ['snake_meat'] = 0.40,
            ['sheep_meat'] = 0.40,
            ['bird_meat'] = 0.60,
            ['raccoon_meat'] = 0.40,
            ['rabbit_meat'] = 0.40,
            ['possum_meat'] = 0.20,
            ['pork_meat'] = 0.65,
            ['panther_meat'] = 2.00,
            ['chicken_meat'] = 0.60,
            ['cougar_meat'] = 2.00,
            ['coyote_meat'] = 0.50,
            ['lizard_meat'] = 0.60,
            ['goat_meat'] = 0.50,
            ['moose_meat'] = 2.00,
            ['ox_meat'] = 0.75,
            ['gator_meat'] = 0.70,
            ['beaver_meat'] = 0.70,
            ['beef_meat'] = 0.70,
            ['crawfish'] = 0.80,
            
            --parts 
            ['skunkfur'] = 0.30,
            ['sheepwool'] = 0.30,
            ['birdfeather'] = 0.25,
            ['raccoonpaw'] = 0.20,
            ['rabbitpaw'] = 0.15,
            ['possumfur'] = 0.20,
            ['pigskin'] = 0.20,
            ['pelicanfeather'] = 0.20,
            ['panthereyeball'] = 2.00,
            ['coyotefang'] = 0.20,
            ['hawkfeather'] = 0.30,
            ['hawktalon'] = 0.40,
            ['elkantlers'] = 0.40,
            ['animalfat'] = 0.10,
            ['ramhorn'] = 0.30,
            ['foxclaw'] = 0.20,
            ['cougarclaw'] = 1.00,
            ['beavertail'] = 1.00,
            ['feather'] = 0.15,
            ['diamondback_skin'] = 0.50,
            ['watersnake_skin'] = 0.50,
            ['redboa_skin'] = 0.50,
            ['blacktail_skin'] = 0.50,
            ['cottonmouth_skin'] = 0.60,
            ['ferdelance_skin'] = 0.70,
            ['deer_antlers'] = 0.30,
            ['bearclaw'] = 1.00,
            ['boartusk'] = 0.30,
            ['bisonhorn'] = 1.00,
            ['deerhide'] = 0.30,
            ['duckfeather'] = 0.30,
            ['eagletalon'] = 2.00,
            ['eaglefeather'] = 1.00,
            ['egretfeather'] = 0.70,
            ['wolfheart'] = 0.90,
            ['vulturefeather'] = 0.20,
            ['turtleshell'] = 0.70,
            ['turkeyfeather'] = 0.15,
            ['snakevenom'] = 0.90,
            ['reptile_skin'] = 0.90,
            ['animal_heart'] = 0.90,
            ['small_pelt'] = 0.90,
            

            -- Bear Pelts
            ['perfect_bear_pelt'] = 2.00,
            ['good_bear_pelt'] = 1.50,
            ['poor_bear_pelt'] = 1.00,

            -- Black Bear Pelts
            ['perfect_black_bear_pelt'] = 1.75,
            ['good_black_bear_pelt'] = 1.35,
            ['poor_black_bear_pelt'] = 0.95,

            -- Boar Pelts
            ['perfect_boar_pelt'] = 1.00,
            ['good_boar_pelt'] = 0.75,
            ['poor_boar_pelt'] = 0.55,

            -- Buck Pelts
            ['perfect_buck_pelt'] = 1.00,
            ['good_buck_pelt'] = 0.80,
            ['poor_buck_pelt'] = 0.60,

            -- Buffalo Pelts
            ['perfect_buffalo_pelt'] = 2.25,
            ['good_buffalo_pelt'] = 1.75,
            ['poor_buffalo_pelt'] = 1.25,

            -- Bull Pelts
            ['perfect_bull_pelt'] = 1.25,
            ['good_bull_pelt'] = 0.75,
            ['poor_bull_pelt'] = 0.50,

            -- Cougar Pelts
            ['perfect_cougar_pelt'] = 2.00,
            ['good_cougar_pelt'] = 1.75,
            ['poor_cougar_pelt'] = 1.50,

            -- Cow Pelts
            ['perfect_cow_pelt'] = 0.80,
            ['good_cow_pelt'] = 0.60,
            ['poor_cow_pelt'] = 0.40,

            -- Coyote Pelts
            ['perfect_coyote_pelt'] = 0.60,
            ['good_coyote_pelt'] = 0.40,
            ['poor_coyote_pelt'] = 0.25,

            -- Deer Pelts
            ['perfect_deer_pelt'] = 0.60,
            ['good_deer_pelt'] = 0.45,
            ['poor_deer_pelt'] = 0.30,

            -- Elk Pelts
            ['perfect_elk_pelt'] = 0.90,
            ['good_elk_pelt'] = 0.75,
            ['poor_elk_pelt'] = 0.60,

            -- Fox Pelts
            ['perfect_fox_pelt'] = 0.60,
            ['good_fox_pelt'] = 0.45,
            ['poor_fox_pelt'] = 0.30,

            -- Goat Pelts
            ['perfect_goat_pelt'] = 0.60,
            ['good_goat_pelt'] = 0.45,
            ['poor_goat_pelt'] = 0.30,

            -- Javelina Pelts
            ['perfect_javelina_pelt'] = 0.75,
            ['good_javelina_pelt'] = 0.60,
            ['poor_javelina_pelt'] = 0.45,

            -- Moose Pelts
            ['perfect_moose_pelt'] = 2.00,
            ['good_moose_pelt'] = 1.70,
            ['poor_moose_pelt'] = 1.40,

            -- Ox Pelts
            ['perfect_ox_pelt'] = 1.90,
            ['good_ox_pelt'] = 1.40,
            ['poor_ox_pelt'] = 1.00,

            -- Panther Pelts
            ['perfect_panther_pelt'] = 2.50,
            ['good_panther_pelt'] = 1.90,
            ['poor_panther_pelt'] = 1.30,


            -- Pig Pelts
            ['perfect_pig_pelt'] = 0.80,
            ['good_pig_pelt'] = 0.65,
            ['poor_pig_pelt'] = 0.50,

            -- Pronghorn Pelts
            ['perfect_pronghorn_pelt'] = 0.60,
            ['good_pronghorn_pelt'] = 0.45,
            ['poor_pronghorn_pelt'] = 0.30,

            -- Bighorn Ram Pelts
            ['perfect_bighornram_pelt'] = 0.85,
            ['good_bighornram_pelt'] = 0.65,
            ['poor_bighornram_pelt'] = 0.45,

            -- Sheep Pelts
            ['perfect_sheep_pelt'] = 0.75,
            ['good_sheep_pelt'] = 0.50,
            ['poor_sheep_pelt'] = 0.30,

            -- Wolf Pelts
            ['perfect_wolf_pelt'] = 1.90,
            ['good_wolf_pelt'] = 1.50,
            ['poor_wolf_pelt'] = 1.00,

            -- Alligator Pelts
            ['perfect_alligator_pelt'] = 1.50,
            ['good_alligator_pelt'] = 1.20,
            ['poor_alligator_pelt'] = 0.90,

            -- Legendary Alligator Pelt
            ['legendary_alligator_pelt'] = 5.00,

            -- Large Alligator Pelts
            ['perfect_large_alligator_pelt'] = 2.00,
            ['good_large_alligator_pelt'] = 1.50,
            ['poor_large_alligator_pelt'] = 1.10,


          -- Legendary Beaver Pelts
            ['legendary_beaver_pelt'] = 2.40,
            ['legendary_moon_beaver_pelt'] = 2.10,
            ['legendary_zizi_beaver_pelt'] = 2.20,
            ['legendary_night_beaver_pelt'] = 2.30,

            -- Legendary Boar Pelt
            ['legendary_boar_pelt'] = 2.50,

            -- Legendary Cougar Pelt
            ['legendary_cougar_pelt'] = 2.00,

            -- Legendary Coyote Pelt
            ['legendary_coyote_pelt'] = 1.90,

            -- Legendary Panther Pelt
            ['legendary_panther_pelt'] = 2.30,

            -- Legendary Wolf Pelt
            ['legendary_wolf_pelt'] = 2.10,

            -- Raccoon Pelts
            ['perfect_raccoon_pelt'] = 1.50,
            ['good_raccoon_pelt'] = 1.10,
            ['poor_raccoon_pelt'] = 0.80,
            ['boarhair'] = 0.80,

        }
        
    },

    {
        Prompt = {
            name = 'unique_butcher_10',
            keybind = 0xF3830D8E,
            msg = 'Open Meat Seller',
            promptvec = vector3(2992.6, 569.45, 44.47)  -- van horn
        },
        ItemPrices = {
            
            --meats
            ['deer_meat'] = 0.60,
            ['armadilloskin'] = 0.80,
            ['biggamemeat'] = 0.80,
            ['smallgamemeat'] = 0.40,
            ['elk_meat'] = 0.80,
            ['boar_meat'] = 0.65,
            ['ram_meat'] = 0.70,
            ['bear_meat'] = 0.90,
            ['bison_meat'] = 1.25,
            ['bull_meat'] = 1.40,
            ['duck_meat'] = 0.50,
            ['eagle_meat'] = 2.00,
            ['egret_meat'] = 0.75,
            ['fox_meat'] = 0.60,
            ['wolf_meat'] = 1.00,
            ['vulture_meat'] = 0.80,
            ['turtle_meat'] = 0.50,
            ['turkey_meat'] = 0.50,
            ['snake_meat'] = 0.40,
            ['sheep_meat'] = 0.40,
            ['bird_meat'] = 0.60,
            ['raccoon_meat'] = 0.40,
            ['rabbit_meat'] = 0.40,
            ['possum_meat'] = 0.20,
            ['pork_meat'] = 0.65,
            ['panther_meat'] = 2.00,
            ['chicken_meat'] = 0.60,
            ['cougar_meat'] = 2.00,
            ['coyote_meat'] = 0.50,
            ['lizard_meat'] = 0.60,
            ['goat_meat'] = 0.50,
            ['moose_meat'] = 2.00,
            ['ox_meat'] = 0.75,
            ['gator_meat'] = 0.70,
            ['beaver_meat'] = 0.70,
            ['beef_meat'] = 0.70,
            ['crawfish'] = 0.80,
            
            --parts 
            ['skunkfur'] = 0.30,
            ['sheepwool'] = 0.30,
            ['birdfeather'] = 0.25,
            ['raccoonpaw'] = 0.20,
            ['rabbitpaw'] = 0.15,
            ['possumfur'] = 0.20,
            ['pigskin'] = 0.20,
            ['pelicanfeather'] = 0.20,
            ['panthereyeball'] = 2.00,
            ['coyotefang'] = 0.20,
            ['hawkfeather'] = 0.30,
            ['hawktalon'] = 0.40,
            ['elkantlers'] = 0.40,
            ['animalfat'] = 0.10,
            ['ramhorn'] = 0.30,
            ['foxclaw'] = 0.20,
            ['cougarclaw'] = 1.00,
            ['beavertail'] = 1.00,
            ['feather'] = 0.15,
            ['diamondback_skin'] = 0.50,
            ['watersnake_skin'] = 0.50,
            ['redboa_skin'] = 0.50,
            ['blacktail_skin'] = 0.50,
            ['cottonmouth_skin'] = 0.60,
            ['ferdelance_skin'] = 0.70,
            ['deer_antlers'] = 0.30,
            ['bearclaw'] = 1.00,
            ['boartusk'] = 0.30,
            ['bisonhorn'] = 1.00,
            ['deerhide'] = 0.30,
            ['duckfeather'] = 0.30,
            ['eagletalon'] = 2.00,
            ['eaglefeather'] = 1.00,
            ['egretfeather'] = 0.70,
            ['wolfheart'] = 0.90,
            ['vulturefeather'] = 0.20,
            ['turtleshell'] = 0.70,
            ['turkeyfeather'] = 0.15,
            ['snakevenom'] = 0.90,
            ['reptile_skin'] = 0.90,
            ['animal_heart'] = 0.90,
            ['small_pelt'] = 0.90,
            

            -- Bear Pelts
            ['perfect_bear_pelt'] = 2.00,
            ['good_bear_pelt'] = 1.50,
            ['poor_bear_pelt'] = 1.00,

            -- Black Bear Pelts
            ['perfect_black_bear_pelt'] = 1.75,
            ['good_black_bear_pelt'] = 1.35,
            ['poor_black_bear_pelt'] = 0.95,

            -- Boar Pelts
            ['perfect_boar_pelt'] = 1.00,
            ['good_boar_pelt'] = 0.75,
            ['poor_boar_pelt'] = 0.55,

            -- Buck Pelts
            ['perfect_buck_pelt'] = 1.00,
            ['good_buck_pelt'] = 0.80,
            ['poor_buck_pelt'] = 0.60,

            -- Buffalo Pelts
            ['perfect_buffalo_pelt'] = 2.25,
            ['good_buffalo_pelt'] = 1.75,
            ['poor_buffalo_pelt'] = 1.25,

            -- Bull Pelts
            ['perfect_bull_pelt'] = 1.25,
            ['good_bull_pelt'] = 0.75,
            ['poor_bull_pelt'] = 0.50,

            -- Cougar Pelts
            ['perfect_cougar_pelt'] = 2.00,
            ['good_cougar_pelt'] = 1.75,
            ['poor_cougar_pelt'] = 1.50,

            -- Cow Pelts
            ['perfect_cow_pelt'] = 0.80,
            ['good_cow_pelt'] = 0.60,
            ['poor_cow_pelt'] = 0.40,

            -- Coyote Pelts
            ['perfect_coyote_pelt'] = 0.60,
            ['good_coyote_pelt'] = 0.40,
            ['poor_coyote_pelt'] = 0.25,

            -- Deer Pelts
            ['perfect_deer_pelt'] = 0.60,
            ['good_deer_pelt'] = 0.45,
            ['poor_deer_pelt'] = 0.30,

            -- Elk Pelts
            ['perfect_elk_pelt'] = 0.90,
            ['good_elk_pelt'] = 0.75,
            ['poor_elk_pelt'] = 0.60,

            -- Fox Pelts
            ['perfect_fox_pelt'] = 0.60,
            ['good_fox_pelt'] = 0.45,
            ['poor_fox_pelt'] = 0.30,

            -- Goat Pelts
            ['perfect_goat_pelt'] = 0.60,
            ['good_goat_pelt'] = 0.45,
            ['poor_goat_pelt'] = 0.30,

            -- Javelina Pelts
            ['perfect_javelina_pelt'] = 0.75,
            ['good_javelina_pelt'] = 0.60,
            ['poor_javelina_pelt'] = 0.45,

            -- Moose Pelts
            ['perfect_moose_pelt'] = 2.00,
            ['good_moose_pelt'] = 1.70,
            ['poor_moose_pelt'] = 1.40,

            -- Ox Pelts
            ['perfect_ox_pelt'] = 1.90,
            ['good_ox_pelt'] = 1.40,
            ['poor_ox_pelt'] = 1.00,

            -- Panther Pelts
            ['perfect_panther_pelt'] = 2.50,
            ['good_panther_pelt'] = 1.90,
            ['poor_panther_pelt'] = 1.30,


            -- Pig Pelts
            ['perfect_pig_pelt'] = 0.80,
            ['good_pig_pelt'] = 0.65,
            ['poor_pig_pelt'] = 0.50,

            -- Pronghorn Pelts
            ['perfect_pronghorn_pelt'] = 0.60,
            ['good_pronghorn_pelt'] = 0.45,
            ['poor_pronghorn_pelt'] = 0.30,

            -- Bighorn Ram Pelts
            ['perfect_bighornram_pelt'] = 0.85,
            ['good_bighornram_pelt'] = 0.65,
            ['poor_bighornram_pelt'] = 0.45,

            -- Sheep Pelts
            ['perfect_sheep_pelt'] = 0.75,
            ['good_sheep_pelt'] = 0.50,
            ['poor_sheep_pelt'] = 0.30,

            -- Wolf Pelts
            ['perfect_wolf_pelt'] = 1.90,
            ['good_wolf_pelt'] = 1.50,
            ['poor_wolf_pelt'] = 1.00,

            -- Alligator Pelts
            ['perfect_alligator_pelt'] = 1.50,
            ['good_alligator_pelt'] = 1.20,
            ['poor_alligator_pelt'] = 0.90,

            -- Legendary Alligator Pelt
            ['legendary_alligator_pelt'] = 5.00,

            -- Large Alligator Pelts
            ['perfect_large_alligator_pelt'] = 2.00,
            ['good_large_alligator_pelt'] = 1.50,
            ['poor_large_alligator_pelt'] = 1.10,


          -- Legendary Beaver Pelts
            ['legendary_beaver_pelt'] = 2.40,
            ['legendary_moon_beaver_pelt'] = 2.10,
            ['legendary_zizi_beaver_pelt'] = 2.20,
            ['legendary_night_beaver_pelt'] = 2.30,

            -- Legendary Boar Pelt
            ['legendary_boar_pelt'] = 2.50,

            -- Legendary Cougar Pelt
            ['legendary_cougar_pelt'] = 2.00,

            -- Legendary Coyote Pelt
            ['legendary_coyote_pelt'] = 1.90,

            -- Legendary Panther Pelt
            ['legendary_panther_pelt'] = 2.30,

            -- Legendary Wolf Pelt
            ['legendary_wolf_pelt'] = 2.10,

            -- Raccoon Pelts
            ['perfect_raccoon_pelt'] = 1.50,
            ['good_raccoon_pelt'] = 1.10,
            ['poor_raccoon_pelt'] = 0.80,
            ['boarhair'] = 0.80,

        }
        
    },
    {
        Prompt = {
            name = 'unique_butcher_11',
            keybind = 0xF3830D8E,
            msg = 'Open Meat Seller',
            promptvec = vector3(-1355.32, 2417.68, 307.4)  -- colter
        },
        ItemPrices = {
            
            --meats
            ['deer_meat'] = 0.60,
            ['armadilloskin'] = 0.80,
            ['biggamemeat'] = 0.80,
            ['smallgamemeat'] = 0.40,
            ['elk_meat'] = 0.80,
            ['boar_meat'] = 0.65,
            ['ram_meat'] = 0.70,
            ['bear_meat'] = 0.90,
            ['bison_meat'] = 1.25,
            ['bull_meat'] = 1.40,
            ['duck_meat'] = 0.50,
            ['eagle_meat'] = 2.00,
            ['egret_meat'] = 0.75,
            ['fox_meat'] = 0.60,
            ['wolf_meat'] = 1.00,
            ['vulture_meat'] = 0.80,
            ['turtle_meat'] = 0.50,
            ['turkey_meat'] = 0.50,
            ['snake_meat'] = 0.40,
            ['sheep_meat'] = 0.40,
            ['bird_meat'] = 0.60,
            ['raccoon_meat'] = 0.40,
            ['rabbit_meat'] = 0.40,
            ['possum_meat'] = 0.20,
            ['pork_meat'] = 0.65,
            ['panther_meat'] = 2.00,
            ['chicken_meat'] = 0.60,
            ['cougar_meat'] = 2.00,
            ['coyote_meat'] = 0.50,
            ['lizard_meat'] = 0.60,
            ['goat_meat'] = 0.50,
            ['moose_meat'] = 2.00,
            ['ox_meat'] = 0.75,
            ['gator_meat'] = 0.70,
            ['beaver_meat'] = 0.70,
            ['beef_meat'] = 0.70,
            ['crawfish'] = 0.80,
            
            --parts 
            ['skunkfur'] = 0.30,
            ['sheepwool'] = 0.30,
            ['birdfeather'] = 0.25,
            ['raccoonpaw'] = 0.20,
            ['rabbitpaw'] = 0.15,
            ['possumfur'] = 0.20,
            ['pigskin'] = 0.20,
            ['pelicanfeather'] = 0.20,
            ['panthereyeball'] = 2.00,
            ['coyotefang'] = 0.20,
            ['hawkfeather'] = 0.30,
            ['hawktalon'] = 0.40,
            ['elkantlers'] = 0.40,
            ['animalfat'] = 0.10,
            ['ramhorn'] = 0.30,
            ['foxclaw'] = 0.20,
            ['cougarclaw'] = 1.00,
            ['beavertail'] = 1.00,
            ['feather'] = 0.15,
            ['diamondback_skin'] = 0.50,
            ['watersnake_skin'] = 0.50,
            ['redboa_skin'] = 0.50,
            ['blacktail_skin'] = 0.50,
            ['cottonmouth_skin'] = 0.60,
            ['ferdelance_skin'] = 0.70,
            ['deer_antlers'] = 0.30,
            ['bearclaw'] = 1.00,
            ['boartusk'] = 0.30,
            ['bisonhorn'] = 1.00,
            ['deerhide'] = 0.30,
            ['duckfeather'] = 0.30,
            ['eagletalon'] = 2.00,
            ['eaglefeather'] = 1.00,
            ['egretfeather'] = 0.70,
            ['wolfheart'] = 0.90,
            ['vulturefeather'] = 0.20,
            ['turtleshell'] = 0.70,
            ['turkeyfeather'] = 0.15,
            ['snakevenom'] = 0.90,
            ['reptile_skin'] = 0.90,
            ['animal_heart'] = 0.90,
            ['small_pelt'] = 0.90,
            

            -- Bear Pelts
            ['perfect_bear_pelt'] = 2.00,
            ['good_bear_pelt'] = 1.50,
            ['poor_bear_pelt'] = 1.00,

            -- Black Bear Pelts
            ['perfect_black_bear_pelt'] = 1.75,
            ['good_black_bear_pelt'] = 1.35,
            ['poor_black_bear_pelt'] = 0.95,

            -- Boar Pelts
            ['perfect_boar_pelt'] = 1.00,
            ['good_boar_pelt'] = 0.75,
            ['poor_boar_pelt'] = 0.55,

            -- Buck Pelts
            ['perfect_buck_pelt'] = 1.00,
            ['good_buck_pelt'] = 0.80,
            ['poor_buck_pelt'] = 0.60,

            -- Buffalo Pelts
            ['perfect_buffalo_pelt'] = 2.25,
            ['good_buffalo_pelt'] = 1.75,
            ['poor_buffalo_pelt'] = 1.25,

            -- Bull Pelts
            ['perfect_bull_pelt'] = 1.25,
            ['good_bull_pelt'] = 0.75,
            ['poor_bull_pelt'] = 0.50,

            -- Cougar Pelts
            ['perfect_cougar_pelt'] = 2.00,
            ['good_cougar_pelt'] = 1.75,
            ['poor_cougar_pelt'] = 1.50,

            -- Cow Pelts
            ['perfect_cow_pelt'] = 0.80,
            ['good_cow_pelt'] = 0.60,
            ['poor_cow_pelt'] = 0.40,

            -- Coyote Pelts
            ['perfect_coyote_pelt'] = 0.60,
            ['good_coyote_pelt'] = 0.40,
            ['poor_coyote_pelt'] = 0.25,

            -- Deer Pelts
            ['perfect_deer_pelt'] = 0.60,
            ['good_deer_pelt'] = 0.45,
            ['poor_deer_pelt'] = 0.30,

            -- Elk Pelts
            ['perfect_elk_pelt'] = 0.90,
            ['good_elk_pelt'] = 0.75,
            ['poor_elk_pelt'] = 0.60,

            -- Fox Pelts
            ['perfect_fox_pelt'] = 0.60,
            ['good_fox_pelt'] = 0.45,
            ['poor_fox_pelt'] = 0.30,

            -- Goat Pelts
            ['perfect_goat_pelt'] = 0.60,
            ['good_goat_pelt'] = 0.45,
            ['poor_goat_pelt'] = 0.30,

            -- Javelina Pelts
            ['perfect_javelina_pelt'] = 0.75,
            ['good_javelina_pelt'] = 0.60,
            ['poor_javelina_pelt'] = 0.45,

            -- Moose Pelts
            ['perfect_moose_pelt'] = 2.00,
            ['good_moose_pelt'] = 1.70,
            ['poor_moose_pelt'] = 1.40,

            -- Ox Pelts
            ['perfect_ox_pelt'] = 1.90,
            ['good_ox_pelt'] = 1.40,
            ['poor_ox_pelt'] = 1.00,

            -- Panther Pelts
            ['perfect_panther_pelt'] = 2.50,
            ['good_panther_pelt'] = 1.90,
            ['poor_panther_pelt'] = 1.30,


            -- Pig Pelts
            ['perfect_pig_pelt'] = 0.80,
            ['good_pig_pelt'] = 0.65,
            ['poor_pig_pelt'] = 0.50,

            -- Pronghorn Pelts
            ['perfect_pronghorn_pelt'] = 0.60,
            ['good_pronghorn_pelt'] = 0.45,
            ['poor_pronghorn_pelt'] = 0.30,

            -- Bighorn Ram Pelts
            ['perfect_bighornram_pelt'] = 0.85,
            ['good_bighornram_pelt'] = 0.65,
            ['poor_bighornram_pelt'] = 0.45,

            -- Sheep Pelts
            ['perfect_sheep_pelt'] = 0.75,
            ['good_sheep_pelt'] = 0.50,
            ['poor_sheep_pelt'] = 0.30,

            -- Wolf Pelts
            ['perfect_wolf_pelt'] = 1.90,
            ['good_wolf_pelt'] = 1.50,
            ['poor_wolf_pelt'] = 1.00,

            -- Alligator Pelts
            ['perfect_alligator_pelt'] = 1.50,
            ['good_alligator_pelt'] = 1.20,
            ['poor_alligator_pelt'] = 0.90,

            -- Legendary Alligator Pelt
            ['legendary_alligator_pelt'] = 5.00,

            -- Large Alligator Pelts
            ['perfect_large_alligator_pelt'] = 2.00,
            ['good_large_alligator_pelt'] = 1.50,
            ['poor_large_alligator_pelt'] = 1.10,


          -- Legendary Beaver Pelts
            ['legendary_beaver_pelt'] = 2.40,
            ['legendary_moon_beaver_pelt'] = 2.10,
            ['legendary_zizi_beaver_pelt'] = 2.20,
            ['legendary_night_beaver_pelt'] = 2.30,

            -- Legendary Boar Pelt
            ['legendary_boar_pelt'] = 2.50,

            -- Legendary Cougar Pelt
            ['legendary_cougar_pelt'] = 2.00,

            -- Legendary Coyote Pelt
            ['legendary_coyote_pelt'] = 1.90,

            -- Legendary Panther Pelt
            ['legendary_panther_pelt'] = 2.30,

            -- Legendary Wolf Pelt
            ['legendary_wolf_pelt'] = 2.10,

            -- Raccoon Pelts
            ['perfect_raccoon_pelt'] = 1.50,
            ['good_raccoon_pelt'] = 1.10,
            ['poor_raccoon_pelt'] = 0.80,
            ['boarhair'] = 0.80,

        }
        
    },

    {
        Prompt = {
            name = 'unique_butcher_125',
            keybind = 0xF3830D8E,
            msg = 'Open Meat Seller',
            promptvec = vector3(-1752.94, -389.81, 156.27)  -- strawberry
        },
        ItemPrices = {
            
            --meats
            ['deer_meat'] = 0.60,
            ['armadilloskin'] = 0.80,
            ['biggamemeat'] = 0.80,
            ['smallgamemeat'] = 0.40,
            ['elk_meat'] = 0.80,
            ['boar_meat'] = 0.65,
            ['ram_meat'] = 0.70,
            ['bear_meat'] = 0.90,
            ['bison_meat'] = 1.25,
            ['bull_meat'] = 1.40,
            ['duck_meat'] = 0.50,
            ['eagle_meat'] = 2.00,
            ['egret_meat'] = 0.75,
            ['fox_meat'] = 0.60,
            ['wolf_meat'] = 1.00,
            ['vulture_meat'] = 0.80,
            ['turtle_meat'] = 0.50,
            ['turkey_meat'] = 0.50,
            ['snake_meat'] = 0.40,
            ['sheep_meat'] = 0.40,
            ['bird_meat'] = 0.60,
            ['raccoon_meat'] = 0.40,
            ['rabbit_meat'] = 0.40,
            ['possum_meat'] = 0.20,
            ['pork_meat'] = 0.65,
            ['panther_meat'] = 2.00,
            ['chicken_meat'] = 0.60,
            ['cougar_meat'] = 2.00,
            ['coyote_meat'] = 0.50,
            ['lizard_meat'] = 0.60,
            ['goat_meat'] = 0.50,
            ['moose_meat'] = 2.00,
            ['ox_meat'] = 0.75,
            ['gator_meat'] = 0.70,
            ['beaver_meat'] = 0.70,
            ['beef_meat'] = 0.70,
            ['crawfish'] = 0.80,
            
            --parts 
            ['skunkfur'] = 0.30,
            ['sheepwool'] = 0.30,
            ['birdfeather'] = 0.25,
            ['raccoonpaw'] = 0.20,
            ['rabbitpaw'] = 0.15,
            ['possumfur'] = 0.20,
            ['pigskin'] = 0.20,
            ['pelicanfeather'] = 0.20,
            ['panthereyeball'] = 2.00,
            ['coyotefang'] = 0.20,
            ['hawkfeather'] = 0.30,
            ['hawktalon'] = 0.40,
            ['elkantlers'] = 0.40,
            ['animalfat'] = 0.10,
            ['ramhorn'] = 0.30,
            ['foxclaw'] = 0.20,
            ['cougarclaw'] = 1.00,
            ['beavertail'] = 1.00,
            ['feather'] = 0.15,
            ['diamondback_skin'] = 0.50,
            ['watersnake_skin'] = 0.50,
            ['redboa_skin'] = 0.50,
            ['blacktail_skin'] = 0.50,
            ['cottonmouth_skin'] = 0.60,
            ['ferdelance_skin'] = 0.70,
            ['deer_antlers'] = 0.30,
            ['bearclaw'] = 1.00,
            ['boartusk'] = 0.30,
            ['bisonhorn'] = 1.00,
            ['deerhide'] = 0.30,
            ['duckfeather'] = 0.30,
            ['eagletalon'] = 2.00,
            ['eaglefeather'] = 1.00,
            ['egretfeather'] = 0.70,
            ['wolfheart'] = 0.90,
            ['vulturefeather'] = 0.20,
            ['turtleshell'] = 0.70,
            ['turkeyfeather'] = 0.15,
            ['snakevenom'] = 0.90,
            ['reptile_skin'] = 0.90,
            ['animal_heart'] = 0.90,
            ['small_pelt'] = 0.90,
            

            -- Bear Pelts
            ['perfect_bear_pelt'] = 2.00,
            ['good_bear_pelt'] = 1.50,
            ['poor_bear_pelt'] = 1.00,

            -- Black Bear Pelts
            ['perfect_black_bear_pelt'] = 1.75,
            ['good_black_bear_pelt'] = 1.35,
            ['poor_black_bear_pelt'] = 0.95,

            -- Boar Pelts
            ['perfect_boar_pelt'] = 1.00,
            ['good_boar_pelt'] = 0.75,
            ['poor_boar_pelt'] = 0.55,

            -- Buck Pelts
            ['perfect_buck_pelt'] = 1.00,
            ['good_buck_pelt'] = 0.80,
            ['poor_buck_pelt'] = 0.60,

            -- Buffalo Pelts
            ['perfect_buffalo_pelt'] = 2.25,
            ['good_buffalo_pelt'] = 1.75,
            ['poor_buffalo_pelt'] = 1.25,

            -- Bull Pelts
            ['perfect_bull_pelt'] = 1.25,
            ['good_bull_pelt'] = 0.75,
            ['poor_bull_pelt'] = 0.50,

            -- Cougar Pelts
            ['perfect_cougar_pelt'] = 2.00,
            ['good_cougar_pelt'] = 1.75,
            ['poor_cougar_pelt'] = 1.50,

            -- Cow Pelts
            ['perfect_cow_pelt'] = 0.80,
            ['good_cow_pelt'] = 0.60,
            ['poor_cow_pelt'] = 0.40,

            -- Coyote Pelts
            ['perfect_coyote_pelt'] = 0.60,
            ['good_coyote_pelt'] = 0.40,
            ['poor_coyote_pelt'] = 0.25,

            -- Deer Pelts
            ['perfect_deer_pelt'] = 0.60,
            ['good_deer_pelt'] = 0.45,
            ['poor_deer_pelt'] = 0.30,

            -- Elk Pelts
            ['perfect_elk_pelt'] = 0.90,
            ['good_elk_pelt'] = 0.75,
            ['poor_elk_pelt'] = 0.60,

            -- Fox Pelts
            ['perfect_fox_pelt'] = 0.60,
            ['good_fox_pelt'] = 0.45,
            ['poor_fox_pelt'] = 0.30,

            -- Goat Pelts
            ['perfect_goat_pelt'] = 0.60,
            ['good_goat_pelt'] = 0.45,
            ['poor_goat_pelt'] = 0.30,

            -- Javelina Pelts
            ['perfect_javelina_pelt'] = 0.75,
            ['good_javelina_pelt'] = 0.60,
            ['poor_javelina_pelt'] = 0.45,

            -- Moose Pelts
            ['perfect_moose_pelt'] = 2.00,
            ['good_moose_pelt'] = 1.70,
            ['poor_moose_pelt'] = 1.40,

            -- Ox Pelts
            ['perfect_ox_pelt'] = 1.90,
            ['good_ox_pelt'] = 1.40,
            ['poor_ox_pelt'] = 1.00,

            -- Panther Pelts
            ['perfect_panther_pelt'] = 2.50,
            ['good_panther_pelt'] = 1.90,
            ['poor_panther_pelt'] = 1.30,


            -- Pig Pelts
            ['perfect_pig_pelt'] = 0.80,
            ['good_pig_pelt'] = 0.65,
            ['poor_pig_pelt'] = 0.50,

            -- Pronghorn Pelts
            ['perfect_pronghorn_pelt'] = 0.60,
            ['good_pronghorn_pelt'] = 0.45,
            ['poor_pronghorn_pelt'] = 0.30,

            -- Bighorn Ram Pelts
            ['perfect_bighornram_pelt'] = 0.85,
            ['good_bighornram_pelt'] = 0.65,
            ['poor_bighornram_pelt'] = 0.45,

            -- Sheep Pelts
            ['perfect_sheep_pelt'] = 0.75,
            ['good_sheep_pelt'] = 0.50,
            ['poor_sheep_pelt'] = 0.30,

            -- Wolf Pelts
            ['perfect_wolf_pelt'] = 1.90,
            ['good_wolf_pelt'] = 1.50,
            ['poor_wolf_pelt'] = 1.00,

            -- Alligator Pelts
            ['perfect_alligator_pelt'] = 1.50,
            ['good_alligator_pelt'] = 1.20,
            ['poor_alligator_pelt'] = 0.90,

            -- Legendary Alligator Pelt
            ['legendary_alligator_pelt'] = 5.00,

            -- Large Alligator Pelts
            ['perfect_large_alligator_pelt'] = 2.00,
            ['good_large_alligator_pelt'] = 1.50,
            ['poor_large_alligator_pelt'] = 1.10,


          -- Legendary Beaver Pelts
            ['legendary_beaver_pelt'] = 2.40,
            ['legendary_moon_beaver_pelt'] = 2.10,
            ['legendary_zizi_beaver_pelt'] = 2.20,
            ['legendary_night_beaver_pelt'] = 2.30,

            -- Legendary Boar Pelt
            ['legendary_boar_pelt'] = 2.50,

            -- Legendary Cougar Pelt
            ['legendary_cougar_pelt'] = 2.00,

            -- Legendary Coyote Pelt
            ['legendary_coyote_pelt'] = 1.90,

            -- Legendary Panther Pelt
            ['legendary_panther_pelt'] = 2.30,

            -- Legendary Wolf Pelt
            ['legendary_wolf_pelt'] = 2.10,

            -- Raccoon Pelts
            ['perfect_raccoon_pelt'] = 1.50,
            ['good_raccoon_pelt'] = 1.10,
            ['poor_raccoon_pelt'] = 0.80,
            ['boarhair'] = 0.80,

        }
        
    },

   --GUARMA
   {
        Prompt = {
            name = 'unique_butcher_guarma',
            keybind = 0xF3830D8E,
            msg = 'Open Meat Seller',
            promptvec = vector3(1249.73, -7040.58, 41.9)  -- guarma
        },
        ItemPrices = {
            
            --meats
            ['deer_meat'] = 0.60,
            ['armadilloskin'] = 0.80,
            ['biggamemeat'] = 0.80,
            ['smallgamemeat'] = 0.40,
            ['elk_meat'] = 0.80,
            ['boar_meat'] = 0.65,
            ['ram_meat'] = 0.70,
            ['bear_meat'] = 0.90,
            ['bison_meat'] = 1.25,
            ['bull_meat'] = 1.40,
            ['duck_meat'] = 0.50,
            ['eagle_meat'] = 2.00,
            ['egret_meat'] = 0.75,
            ['fox_meat'] = 0.60,
            ['wolf_meat'] = 1.00,
            ['vulture_meat'] = 0.80,
            ['turtle_meat'] = 0.50,
            ['turkey_meat'] = 0.50,
            ['snake_meat'] = 0.40,
            ['sheep_meat'] = 0.40,
            ['bird_meat'] = 0.60,
            ['raccoon_meat'] = 0.40,
            ['rabbit_meat'] = 0.40,
            ['possum_meat'] = 0.20,
            ['pork_meat'] = 0.65,
            ['panther_meat'] = 2.00,
            ['chicken_meat'] = 0.60,
            ['cougar_meat'] = 2.00,
            ['coyote_meat'] = 0.50,
            ['lizard_meat'] = 0.60,
            ['goat_meat'] = 0.50,
            ['moose_meat'] = 2.00,
            ['ox_meat'] = 0.75,
            ['gator_meat'] = 0.70,
            ['beaver_meat'] = 0.70,
            ['beef_meat'] = 0.70,
            ['crawfish'] = 0.80,
            
            --parts 
            ['skunkfur'] = 0.30,
            ['sheepwool'] = 0.30,
            ['birdfeather'] = 0.25,
            ['raccoonpaw'] = 0.20,
            ['rabbitpaw'] = 0.15,
            ['possumfur'] = 0.20,
            ['pigskin'] = 0.20,
            ['pelicanfeather'] = 0.20,
            ['panthereyeball'] = 2.00,
            ['coyotefang'] = 0.20,
            ['hawkfeather'] = 0.30,
            ['hawktalon'] = 0.40,
            ['elkantlers'] = 0.40,
            ['animalfat'] = 0.10,
            ['ramhorn'] = 0.30,
            ['foxclaw'] = 0.20,
            ['cougarclaw'] = 1.00,
            ['beavertail'] = 1.00,
            ['feather'] = 0.15,
            ['diamondback_skin'] = 0.50,
            ['watersnake_skin'] = 0.50,
            ['redboa_skin'] = 0.50,
            ['blacktail_skin'] = 0.50,
            ['cottonmouth_skin'] = 0.60,
            ['ferdelance_skin'] = 0.70,
            ['deer_antlers'] = 0.30,
            ['bearclaw'] = 1.00,
            ['boartusk'] = 0.30,
            ['bisonhorn'] = 1.00,
            ['deerhide'] = 0.30,
            ['duckfeather'] = 0.30,
            ['eagletalon'] = 2.00,
            ['eaglefeather'] = 1.00,
            ['egretfeather'] = 0.70,
            ['wolfheart'] = 0.90,
            ['vulturefeather'] = 0.20,
            ['turtleshell'] = 0.70,
            ['turkeyfeather'] = 0.15,
            ['snakevenom'] = 0.90,
            ['reptile_skin'] = 0.90,
            ['animal_heart'] = 0.90,
            ['small_pelt'] = 0.90,
            

            -- Bear Pelts
            ['perfect_bear_pelt'] = 2.00,
            ['good_bear_pelt'] = 1.50,
            ['poor_bear_pelt'] = 1.00,

            -- Black Bear Pelts
            ['perfect_black_bear_pelt'] = 1.75,
            ['good_black_bear_pelt'] = 1.35,
            ['poor_black_bear_pelt'] = 0.95,

            -- Boar Pelts
            ['perfect_boar_pelt'] = 1.00,
            ['good_boar_pelt'] = 0.75,
            ['poor_boar_pelt'] = 0.55,

            -- Buck Pelts
            ['perfect_buck_pelt'] = 1.00,
            ['good_buck_pelt'] = 0.80,
            ['poor_buck_pelt'] = 0.60,

            -- Buffalo Pelts
            ['perfect_buffalo_pelt'] = 2.25,
            ['good_buffalo_pelt'] = 1.75,
            ['poor_buffalo_pelt'] = 1.25,

            -- Bull Pelts
            ['perfect_bull_pelt'] = 1.25,
            ['good_bull_pelt'] = 0.75,
            ['poor_bull_pelt'] = 0.50,

            -- Cougar Pelts
            ['perfect_cougar_pelt'] = 2.00,
            ['good_cougar_pelt'] = 1.75,
            ['poor_cougar_pelt'] = 1.50,

            -- Cow Pelts
            ['perfect_cow_pelt'] = 0.80,
            ['good_cow_pelt'] = 0.60,
            ['poor_cow_pelt'] = 0.40,

            -- Coyote Pelts
            ['perfect_coyote_pelt'] = 0.60,
            ['good_coyote_pelt'] = 0.40,
            ['poor_coyote_pelt'] = 0.25,

            -- Deer Pelts
            ['perfect_deer_pelt'] = 0.60,
            ['good_deer_pelt'] = 0.45,
            ['poor_deer_pelt'] = 0.30,

            -- Elk Pelts
            ['perfect_elk_pelt'] = 0.90,
            ['good_elk_pelt'] = 0.75,
            ['poor_elk_pelt'] = 0.60,

            -- Fox Pelts
            ['perfect_fox_pelt'] = 0.60,
            ['good_fox_pelt'] = 0.45,
            ['poor_fox_pelt'] = 0.30,

            -- Goat Pelts
            ['perfect_goat_pelt'] = 0.60,
            ['good_goat_pelt'] = 0.45,
            ['poor_goat_pelt'] = 0.30,

            -- Javelina Pelts
            ['perfect_javelina_pelt'] = 0.75,
            ['good_javelina_pelt'] = 0.60,
            ['poor_javelina_pelt'] = 0.45,

            -- Moose Pelts
            ['perfect_moose_pelt'] = 2.00,
            ['good_moose_pelt'] = 1.70,
            ['poor_moose_pelt'] = 1.40,

            -- Ox Pelts
            ['perfect_ox_pelt'] = 1.90,
            ['good_ox_pelt'] = 1.40,
            ['poor_ox_pelt'] = 1.00,

            -- Panther Pelts
            ['perfect_panther_pelt'] = 2.50,
            ['good_panther_pelt'] = 1.90,
            ['poor_panther_pelt'] = 1.30,


            -- Pig Pelts
            ['perfect_pig_pelt'] = 0.80,
            ['good_pig_pelt'] = 0.65,
            ['poor_pig_pelt'] = 0.50,

            -- Pronghorn Pelts
            ['perfect_pronghorn_pelt'] = 0.60,
            ['good_pronghorn_pelt'] = 0.45,
            ['poor_pronghorn_pelt'] = 0.30,

            -- Bighorn Ram Pelts
            ['perfect_bighornram_pelt'] = 0.85,
            ['good_bighornram_pelt'] = 0.65,
            ['poor_bighornram_pelt'] = 0.45,

            -- Sheep Pelts
            ['perfect_sheep_pelt'] = 0.75,
            ['good_sheep_pelt'] = 0.50,
            ['poor_sheep_pelt'] = 0.30,

            -- Wolf Pelts
            ['perfect_wolf_pelt'] = 1.90,
            ['good_wolf_pelt'] = 1.50,
            ['poor_wolf_pelt'] = 1.00,

            -- Alligator Pelts
            ['perfect_alligator_pelt'] = 1.50,
            ['good_alligator_pelt'] = 1.20,
            ['poor_alligator_pelt'] = 0.90,

            -- Legendary Alligator Pelt
            ['legendary_alligator_pelt'] = 5.00,

            -- Large Alligator Pelts
            ['perfect_large_alligator_pelt'] = 2.00,
            ['good_large_alligator_pelt'] = 1.50,
            ['poor_large_alligator_pelt'] = 1.10,


          -- Legendary Beaver Pelts
            ['legendary_beaver_pelt'] = 2.40,
            ['legendary_moon_beaver_pelt'] = 2.10,
            ['legendary_zizi_beaver_pelt'] = 2.20,
            ['legendary_night_beaver_pelt'] = 2.30,

            -- Legendary Boar Pelt
            ['legendary_boar_pelt'] = 2.50,

            -- Legendary Cougar Pelt
            ['legendary_cougar_pelt'] = 2.00,

            -- Legendary Coyote Pelt
            ['legendary_coyote_pelt'] = 1.90,

            -- Legendary Panther Pelt
            ['legendary_panther_pelt'] = 2.30,

            -- Legendary Wolf Pelt
            ['legendary_wolf_pelt'] = 2.10,

            -- Raccoon Pelts
            ['perfect_raccoon_pelt'] = 1.50,
            ['good_raccoon_pelt'] = 1.10,
            ['poor_raccoon_pelt'] = 0.80,
            ['boarhair'] = 0.80,

        }
        
    },

    --GUARMA
   {
        Prompt = {
            name = 'unique_butcher_manza',
            keybind = 0xF3830D8E,
            msg = 'Open Meat Seller',
            promptvec = vector3(-1970.3, -1641.68, 117.13)  -- manze
        },
        ItemPrices = {
            
            --meats
            ['deer_meat'] = 0.60,
            ['armadilloskin'] = 0.80,
            ['biggamemeat'] = 0.80,
            ['smallgamemeat'] = 0.40,
            ['elk_meat'] = 0.80,
            ['boar_meat'] = 0.65,
            ['ram_meat'] = 0.70,
            ['bear_meat'] = 0.90,
            ['bison_meat'] = 1.25,
            ['bull_meat'] = 1.40,
            ['duck_meat'] = 0.50,
            ['eagle_meat'] = 2.00,
            ['egret_meat'] = 0.75,
            ['fox_meat'] = 0.60,
            ['wolf_meat'] = 1.00,
            ['vulture_meat'] = 0.80,
            ['turtle_meat'] = 0.50,
            ['turkey_meat'] = 0.50,
            ['snake_meat'] = 0.40,
            ['sheep_meat'] = 0.40,
            ['bird_meat'] = 0.60,
            ['raccoon_meat'] = 0.40,
            ['rabbit_meat'] = 0.40,
            ['possum_meat'] = 0.20,
            ['pork_meat'] = 0.65,
            ['panther_meat'] = 2.00,
            ['chicken_meat'] = 0.60,
            ['cougar_meat'] = 2.00,
            ['coyote_meat'] = 0.50,
            ['lizard_meat'] = 0.60,
            ['goat_meat'] = 0.50,
            ['moose_meat'] = 2.00,
            ['ox_meat'] = 0.75,
            ['gator_meat'] = 0.70,
            ['beaver_meat'] = 0.70,
            ['beef_meat'] = 0.70,
            ['crawfish'] = 0.80,
            
            --parts 
            ['skunkfur'] = 0.30,
            ['sheepwool'] = 0.30,
            ['birdfeather'] = 0.25,
            ['raccoonpaw'] = 0.20,
            ['rabbitpaw'] = 0.15,
            ['possumfur'] = 0.20,
            ['pigskin'] = 0.20,
            ['pelicanfeather'] = 0.20,
            ['panthereyeball'] = 2.00,
            ['coyotefang'] = 0.20,
            ['hawkfeather'] = 0.30,
            ['hawktalon'] = 0.40,
            ['elkantlers'] = 0.40,
            ['animalfat'] = 0.10,
            ['ramhorn'] = 0.30,
            ['foxclaw'] = 0.20,
            ['cougarclaw'] = 1.00,
            ['beavertail'] = 1.00,
            ['feather'] = 0.15,
            ['diamondback_skin'] = 0.50,
            ['watersnake_skin'] = 0.50,
            ['redboa_skin'] = 0.50,
            ['blacktail_skin'] = 0.50,
            ['cottonmouth_skin'] = 0.60,
            ['ferdelance_skin'] = 0.70,
            ['deer_antlers'] = 0.30,
            ['bearclaw'] = 1.00,
            ['boartusk'] = 0.30,
            ['bisonhorn'] = 1.00,
            ['deerhide'] = 0.30,
            ['duckfeather'] = 0.30,
            ['eagletalon'] = 2.00,
            ['eaglefeather'] = 1.00,
            ['egretfeather'] = 0.70,
            ['wolfheart'] = 0.90,
            ['vulturefeather'] = 0.20,
            ['turtleshell'] = 0.70,
            ['turkeyfeather'] = 0.15,
            ['snakevenom'] = 0.90,
            ['reptile_skin'] = 0.90,
            ['animal_heart'] = 0.90,
            ['small_pelt'] = 0.90,
            

            -- Bear Pelts
            ['perfect_bear_pelt'] = 2.00,
            ['good_bear_pelt'] = 1.50,
            ['poor_bear_pelt'] = 1.00,

            -- Black Bear Pelts
            ['perfect_black_bear_pelt'] = 1.75,
            ['good_black_bear_pelt'] = 1.35,
            ['poor_black_bear_pelt'] = 0.95,

            -- Boar Pelts
            ['perfect_boar_pelt'] = 1.00,
            ['good_boar_pelt'] = 0.75,
            ['poor_boar_pelt'] = 0.55,

            -- Buck Pelts
            ['perfect_buck_pelt'] = 1.00,
            ['good_buck_pelt'] = 0.80,
            ['poor_buck_pelt'] = 0.60,

            -- Buffalo Pelts
            ['perfect_buffalo_pelt'] = 2.25,
            ['good_buffalo_pelt'] = 1.75,
            ['poor_buffalo_pelt'] = 1.25,

            -- Bull Pelts
            ['perfect_bull_pelt'] = 1.25,
            ['good_bull_pelt'] = 0.75,
            ['poor_bull_pelt'] = 0.50,

            -- Cougar Pelts
            ['perfect_cougar_pelt'] = 2.00,
            ['good_cougar_pelt'] = 1.75,
            ['poor_cougar_pelt'] = 1.50,

            -- Cow Pelts
            ['perfect_cow_pelt'] = 0.80,
            ['good_cow_pelt'] = 0.60,
            ['poor_cow_pelt'] = 0.40,

            -- Coyote Pelts
            ['perfect_coyote_pelt'] = 0.60,
            ['good_coyote_pelt'] = 0.40,
            ['poor_coyote_pelt'] = 0.25,

            -- Deer Pelts
            ['perfect_deer_pelt'] = 0.60,
            ['good_deer_pelt'] = 0.45,
            ['poor_deer_pelt'] = 0.30,

            -- Elk Pelts
            ['perfect_elk_pelt'] = 0.90,
            ['good_elk_pelt'] = 0.75,
            ['poor_elk_pelt'] = 0.60,

            -- Fox Pelts
            ['perfect_fox_pelt'] = 0.60,
            ['good_fox_pelt'] = 0.45,
            ['poor_fox_pelt'] = 0.30,

            -- Goat Pelts
            ['perfect_goat_pelt'] = 0.60,
            ['good_goat_pelt'] = 0.45,
            ['poor_goat_pelt'] = 0.30,

            -- Javelina Pelts
            ['perfect_javelina_pelt'] = 0.75,
            ['good_javelina_pelt'] = 0.60,
            ['poor_javelina_pelt'] = 0.45,

            -- Moose Pelts
            ['perfect_moose_pelt'] = 2.00,
            ['good_moose_pelt'] = 1.70,
            ['poor_moose_pelt'] = 1.40,

            -- Ox Pelts
            ['perfect_ox_pelt'] = 1.90,
            ['good_ox_pelt'] = 1.40,
            ['poor_ox_pelt'] = 1.00,

            -- Panther Pelts
            ['perfect_panther_pelt'] = 2.50,
            ['good_panther_pelt'] = 1.90,
            ['poor_panther_pelt'] = 1.30,


            -- Pig Pelts
            ['perfect_pig_pelt'] = 0.80,
            ['good_pig_pelt'] = 0.65,
            ['poor_pig_pelt'] = 0.50,

            -- Pronghorn Pelts
            ['perfect_pronghorn_pelt'] = 0.60,
            ['good_pronghorn_pelt'] = 0.45,
            ['poor_pronghorn_pelt'] = 0.30,

            -- Bighorn Ram Pelts
            ['perfect_bighornram_pelt'] = 0.85,
            ['good_bighornram_pelt'] = 0.65,
            ['poor_bighornram_pelt'] = 0.45,

            -- Sheep Pelts
            ['perfect_sheep_pelt'] = 0.75,
            ['good_sheep_pelt'] = 0.50,
            ['poor_sheep_pelt'] = 0.30,

            -- Wolf Pelts
            ['perfect_wolf_pelt'] = 1.90,
            ['good_wolf_pelt'] = 1.50,
            ['poor_wolf_pelt'] = 1.00,

            -- Alligator Pelts
            ['perfect_alligator_pelt'] = 1.50,
            ['good_alligator_pelt'] = 1.20,
            ['poor_alligator_pelt'] = 0.90,

            -- Legendary Alligator Pelt
            ['legendary_alligator_pelt'] = 5.00,

            -- Large Alligator Pelts
            ['perfect_large_alligator_pelt'] = 2.00,
            ['good_large_alligator_pelt'] = 1.50,
            ['poor_large_alligator_pelt'] = 1.10,


          -- Legendary Beaver Pelts
            ['legendary_beaver_pelt'] = 2.40,
            ['legendary_moon_beaver_pelt'] = 2.10,
            ['legendary_zizi_beaver_pelt'] = 2.20,
            ['legendary_night_beaver_pelt'] = 2.30,

            -- Legendary Boar Pelt
            ['legendary_boar_pelt'] = 2.50,

            -- Legendary Cougar Pelt
            ['legendary_cougar_pelt'] = 2.00,

            -- Legendary Coyote Pelt
            ['legendary_coyote_pelt'] = 1.90,

            -- Legendary Panther Pelt
            ['legendary_panther_pelt'] = 2.30,

            -- Legendary Wolf Pelt
            ['legendary_wolf_pelt'] = 2.10,

            -- Raccoon Pelts
            ['perfect_raccoon_pelt'] = 1.50,
            ['good_raccoon_pelt'] = 1.10,
            ['poor_raccoon_pelt'] = 0.80,
            ['boarhair'] = 0.80,

        }
        
    },

      --GUARMA
   {
        Prompt = {
            name = 'unique_butcher_thieves',
            keybind = 0xF3830D8E,
            msg = 'Open Meat Seller',
            promptvec = vector3(-1416.86, -2286.97, 43.1)  -- thieves
        },
        ItemPrices = {
            
            --meats
            ['deer_meat'] = 0.60,
            ['armadilloskin'] = 0.80,
            ['biggamemeat'] = 0.80,
            ['smallgamemeat'] = 0.40,
            ['elk_meat'] = 0.80,
            ['boar_meat'] = 0.65,
            ['ram_meat'] = 0.70,
            ['bear_meat'] = 0.90,
            ['bison_meat'] = 1.25,
            ['bull_meat'] = 1.40,
            ['duck_meat'] = 0.50,
            ['eagle_meat'] = 2.00,
            ['egret_meat'] = 0.75,
            ['fox_meat'] = 0.60,
            ['wolf_meat'] = 1.00,
            ['vulture_meat'] = 0.80,
            ['turtle_meat'] = 0.50,
            ['turkey_meat'] = 0.50,
            ['snake_meat'] = 0.40,
            ['sheep_meat'] = 0.40,
            ['bird_meat'] = 0.60,
            ['raccoon_meat'] = 0.40,
            ['rabbit_meat'] = 0.40,
            ['possum_meat'] = 0.20,
            ['pork_meat'] = 0.65,
            ['panther_meat'] = 2.00,
            ['chicken_meat'] = 0.60,
            ['cougar_meat'] = 2.00,
            ['coyote_meat'] = 0.50,
            ['lizard_meat'] = 0.60,
            ['goat_meat'] = 0.50,
            ['moose_meat'] = 2.00,
            ['ox_meat'] = 0.75,
            ['gator_meat'] = 0.70,
            ['beaver_meat'] = 0.70,
            ['beef_meat'] = 0.70,
            ['crawfish'] = 0.80,
            
            --parts 
            ['skunkfur'] = 0.30,
            ['sheepwool'] = 0.30,
            ['birdfeather'] = 0.25,
            ['raccoonpaw'] = 0.20,
            ['rabbitpaw'] = 0.15,
            ['possumfur'] = 0.20,
            ['pigskin'] = 0.20,
            ['pelicanfeather'] = 0.20,
            ['panthereyeball'] = 2.00,
            ['coyotefang'] = 0.20,
            ['hawkfeather'] = 0.30,
            ['hawktalon'] = 0.40,
            ['elkantlers'] = 0.40,
            ['animalfat'] = 0.10,
            ['ramhorn'] = 0.30,
            ['foxclaw'] = 0.20,
            ['cougarclaw'] = 1.00,
            ['beavertail'] = 1.00,
            ['feather'] = 0.15,
            ['diamondback_skin'] = 0.50,
            ['watersnake_skin'] = 0.50,
            ['redboa_skin'] = 0.50,
            ['blacktail_skin'] = 0.50,
            ['cottonmouth_skin'] = 0.60,
            ['ferdelance_skin'] = 0.70,
            ['deer_antlers'] = 0.30,
            ['bearclaw'] = 1.00,
            ['boartusk'] = 0.30,
            ['bisonhorn'] = 1.00,
            ['deerhide'] = 0.30,
            ['duckfeather'] = 0.30,
            ['eagletalon'] = 2.00,
            ['eaglefeather'] = 1.00,
            ['egretfeather'] = 0.70,
            ['wolfheart'] = 0.90,
            ['vulturefeather'] = 0.20,
            ['turtleshell'] = 0.70,
            ['turkeyfeather'] = 0.15,
            ['snakevenom'] = 0.90,
            ['reptile_skin'] = 0.90,
            ['animal_heart'] = 0.90,
            ['small_pelt'] = 0.90,
            

            -- Bear Pelts
            ['perfect_bear_pelt'] = 2.00,
            ['good_bear_pelt'] = 1.50,
            ['poor_bear_pelt'] = 1.00,

            -- Black Bear Pelts
            ['perfect_black_bear_pelt'] = 1.75,
            ['good_black_bear_pelt'] = 1.35,
            ['poor_black_bear_pelt'] = 0.95,

            -- Boar Pelts
            ['perfect_boar_pelt'] = 1.00,
            ['good_boar_pelt'] = 0.75,
            ['poor_boar_pelt'] = 0.55,

            -- Buck Pelts
            ['perfect_buck_pelt'] = 1.00,
            ['good_buck_pelt'] = 0.80,
            ['poor_buck_pelt'] = 0.60,

            -- Buffalo Pelts
            ['perfect_buffalo_pelt'] = 2.25,
            ['good_buffalo_pelt'] = 1.75,
            ['poor_buffalo_pelt'] = 1.25,

            -- Bull Pelts
            ['perfect_bull_pelt'] = 1.25,
            ['good_bull_pelt'] = 0.75,
            ['poor_bull_pelt'] = 0.50,

            -- Cougar Pelts
            ['perfect_cougar_pelt'] = 2.00,
            ['good_cougar_pelt'] = 1.75,
            ['poor_cougar_pelt'] = 1.50,

            -- Cow Pelts
            ['perfect_cow_pelt'] = 0.80,
            ['good_cow_pelt'] = 0.60,
            ['poor_cow_pelt'] = 0.40,

            -- Coyote Pelts
            ['perfect_coyote_pelt'] = 0.60,
            ['good_coyote_pelt'] = 0.40,
            ['poor_coyote_pelt'] = 0.25,

            -- Deer Pelts
            ['perfect_deer_pelt'] = 0.60,
            ['good_deer_pelt'] = 0.45,
            ['poor_deer_pelt'] = 0.30,

            -- Elk Pelts
            ['perfect_elk_pelt'] = 0.90,
            ['good_elk_pelt'] = 0.75,
            ['poor_elk_pelt'] = 0.60,

            -- Fox Pelts
            ['perfect_fox_pelt'] = 0.60,
            ['good_fox_pelt'] = 0.45,
            ['poor_fox_pelt'] = 0.30,

            -- Goat Pelts
            ['perfect_goat_pelt'] = 0.60,
            ['good_goat_pelt'] = 0.45,
            ['poor_goat_pelt'] = 0.30,

            -- Javelina Pelts
            ['perfect_javelina_pelt'] = 0.75,
            ['good_javelina_pelt'] = 0.60,
            ['poor_javelina_pelt'] = 0.45,

            -- Moose Pelts
            ['perfect_moose_pelt'] = 2.00,
            ['good_moose_pelt'] = 1.70,
            ['poor_moose_pelt'] = 1.40,

            -- Ox Pelts
            ['perfect_ox_pelt'] = 1.90,
            ['good_ox_pelt'] = 1.40,
            ['poor_ox_pelt'] = 1.00,

            -- Panther Pelts
            ['perfect_panther_pelt'] = 2.50,
            ['good_panther_pelt'] = 1.90,
            ['poor_panther_pelt'] = 1.30,


            -- Pig Pelts
            ['perfect_pig_pelt'] = 0.80,
            ['good_pig_pelt'] = 0.65,
            ['poor_pig_pelt'] = 0.50,

            -- Pronghorn Pelts
            ['perfect_pronghorn_pelt'] = 0.60,
            ['good_pronghorn_pelt'] = 0.45,
            ['poor_pronghorn_pelt'] = 0.30,

            -- Bighorn Ram Pelts
            ['perfect_bighornram_pelt'] = 0.85,
            ['good_bighornram_pelt'] = 0.65,
            ['poor_bighornram_pelt'] = 0.45,

            -- Sheep Pelts
            ['perfect_sheep_pelt'] = 0.75,
            ['good_sheep_pelt'] = 0.50,
            ['poor_sheep_pelt'] = 0.30,

            -- Wolf Pelts
            ['perfect_wolf_pelt'] = 1.90,
            ['good_wolf_pelt'] = 1.50,
            ['poor_wolf_pelt'] = 1.00,

            -- Alligator Pelts
            ['perfect_alligator_pelt'] = 1.50,
            ['good_alligator_pelt'] = 1.20,
            ['poor_alligator_pelt'] = 0.90,

            -- Legendary Alligator Pelt
            ['legendary_alligator_pelt'] = 5.00,

            -- Large Alligator Pelts
            ['perfect_large_alligator_pelt'] = 2.00,
            ['good_large_alligator_pelt'] = 1.50,
            ['poor_large_alligator_pelt'] = 1.10,


          -- Legendary Beaver Pelts
            ['legendary_beaver_pelt'] = 2.40,
            ['legendary_moon_beaver_pelt'] = 2.10,
            ['legendary_zizi_beaver_pelt'] = 2.20,
            ['legendary_night_beaver_pelt'] = 2.30,

            -- Legendary Boar Pelt
            ['legendary_boar_pelt'] = 2.50,

            -- Legendary Cougar Pelt
            ['legendary_cougar_pelt'] = 2.00,

            -- Legendary Coyote Pelt
            ['legendary_coyote_pelt'] = 1.90,

            -- Legendary Panther Pelt
            ['legendary_panther_pelt'] = 2.30,

            -- Legendary Wolf Pelt
            ['legendary_wolf_pelt'] = 2.10,

            -- Raccoon Pelts
            ['perfect_raccoon_pelt'] = 1.50,
            ['good_raccoon_pelt'] = 1.10,
            ['poor_raccoon_pelt'] = 0.80,
            ['boarhair'] = 0.80,

        }
        
    },

    {
        Prompt = {
            name = 'trinket_buyer',
            keybind = 0xF3830D8E,
            msg = 'Open Trinket Buyer',
            promptvec = vector3(499.84, -241.87, 143.96) -- Strawberry
        },
        ItemPrices = {
            
            --meats
            ['bible'] = 1.00,
            ['oldcoin'] = 1.50,
            ['fan'] = 2.00,
            ['goldring'] = 6.00,
            ['oldwatch'] = 4.00,
            ['rosary'] = 1.00,
            ['weddingring'] = 5.00,
            

        }
        
        
    },
    {
        Prompt = {
            name = 'tobacco_buyer',
            keybind = 0xF3830D8E,
            msg = 'Open Tobacco Buyer',
            promptvec = vector3(-785.94, -1315.18, 43.7) -- Blackwater
        },
        ItemPrices = {
            
            --tobacco
            ['cigarette10'] = 10.60,
            ['cigar'] = 0.50,
            ['cigarbox'] = 10.50,
            
            
           
            

        }
        
        
    },
    {
        Prompt = {
            name = 'tobacco_buyer2',
            keybind = 0xF3830D8E,
            msg = 'Open Tobacco Buyer',
            promptvec = vector4(2701.99, -1382.1, 46.5, 130.17) -- Saint D
        },
        ItemPrices = {
            
             --tobacco
            ['cigarette10'] = 10.60,
            ['cigar'] = 0.50,
            ['cigarbox'] = 10.50,
           
            

        }
        
        
    },
}



Config.locale = "en"

Config.locales = {
    ["en"] = {
        open_inv = "Put your goods on the table",
        sell_stuff = "Sell That Stuff",
        seller_name = "Seller",
        seller_error = "I do not buy these types of items!",
        seller_success = "I will Buy All The Items For: ",
        seller_currency = "$",
        seller_Menu_Title = "Menu",
        
    }

}