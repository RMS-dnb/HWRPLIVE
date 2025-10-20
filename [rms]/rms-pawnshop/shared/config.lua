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
        job = 'vhpawnshop',
        Prompt = {
            name = 'unique_ph',
            keybind = 0xF3830D8E, 
            msg = 'Open Pawnshop Seller',
            promptvec = vector3(3018.95, 557.76, 47.83) 
        },
        ItemPrices = {
            ['bible'] = 4.00,
            ['oldcoin'] = 3.5,
            ['fan'] = 4.00,
            ['goldring'] = 10.00,
            ['oldwatch'] = 6.00,
            ['rosary'] = 4.00,
            ['weddingring'] = 10.00,
            ['piratering'] = 10.00,
            ['rubyring'] = 10.00,
            ['oldbuckle'] = 5.00,
            ['goldtooth'] = 6.00,
            ['spectacles'] = 6.00,
            ['sharkstick'] = 5.5,
            ['oldplate'] = 6.00,
            ['oldpainting'] = 10.00,
            ['mantleclock'] = 8.00,
            ['broach'] = 9.00,
            ['newboots'] = 6.00,
            ['hairpin'] = 9.50,
            ['silverware'] = 10.50,
            ['finechina'] = 12.00,
            ['vase'] = 12.00,
-- Fossils
            ['bone_shards'] = 1.15,
            ['arrowhead_bone'] = 1.15,
            ['dinosaur_egg'] = 1.15,
            ['finger_bone'] = 1.15,
            ['fossil_bivalve'] = 1.15,
            ['fossil_brachiopod'] = 1.15,
            ['fossil_brow_horn'] = 1.15,
            ['fossil_cephalopod'] = 1.15,
            ['fossil_coral'] = 1.15,
            ['fossil_neo'] = 1.15,
            ['fossil_old'] = 1.15,
            ['fossil_pet_wood'] = 1.15,
            ['fossil_pet_wood_rainbow'] = 1.15,
            ['fossil_pet_wood_yellow_cat'] = 1.15,
            ['fossil_sea_lily'] = 1.15,
            ['fossil_sea_scorpion'] = 1.15,
            ['fossil_stone'] = 1.15,
            ['fossil_tail_spike'] = 1.15,
            ['fossil_toe_claw'] = 1.15,
            ['fossil_tooth_mega'] = 1.15,
            ['fossil_tooth_serrated'] = 1.15,
            ['fossil_tooth_trex'] = 1.15,
            ['fossil_trilobit'] = 1.15,
            ['fossil_trilobite_crypto'] = 1.15,
            ['fossilbox'] = 45.00,
        }
        
    },
    {   
        job = 'twpawnshop',
        Prompt = {
            name = 'unique_ph',
            keybind = 0xF3830D8E, 
            msg = 'Open Pawnshop Seller',
            promptvec = vector3(-5506.98,-2913.01,1.7) 
        },
        ItemPrices = {
            ['bible'] = 4.00,
            ['oldcoin'] = 3.5,
            ['fan'] = 4.00,
            ['goldring'] = 10.00,
            ['oldwatch'] = 6.00,
            ['rosary'] = 4.00,
            ['weddingring'] = 10.00,
            ['piratering'] = 10.00,
            ['rubyring'] = 10.00,
            ['oldbuckle'] = 5.00,
            ['goldtooth'] = 6.00,
            ['spectacles'] = 6.00,
            ['sharkstick'] = 5.5,
            ['oldplate'] = 6.00,
            ['oldpainting'] = 10.00,
            ['mantleclock'] = 8.00,
            ['broach'] = 9.00,
            ['newboots'] = 6.00,
            ['hairpin'] = 9.50,
            ['silverware'] = 10.50,
            ['finechina'] = 12.00,
            ['vase'] = 12.00,
-- Fossils
            ['bone_shards'] = 1.15,
            ['arrowhead_bone'] = 1.15,
            ['dinosaur_egg'] = 1.15,
            ['finger_bone'] = 1.15,
            ['fossil_bivalve'] = 1.15,
            ['fossil_brachiopod'] = 1.15,
            ['fossil_brow_horn'] = 1.15,
            ['fossil_cephalopod'] = 1.15,
            ['fossil_coral'] = 1.15,
            ['fossil_neo'] = 1.15,
            ['fossil_old'] = 1.15,
            ['fossil_pet_wood'] = 1.15,
            ['fossil_pet_wood_rainbow'] = 1.15,
            ['fossil_pet_wood_yellow_cat'] = 1.15,
            ['fossil_sea_lily'] = 1.15,
            ['fossil_sea_scorpion'] = 1.15,
            ['fossil_stone'] = 1.15,
            ['fossil_tail_spike'] = 1.15,
            ['fossil_toe_claw'] = 1.15,
            ['fossil_tooth_mega'] = 1.15,
            ['fossil_tooth_serrated'] = 1.15,
            ['fossil_tooth_trex'] = 1.15,
            ['fossil_trilobit'] = 1.15,
            ['fossil_trilobite_crypto'] = 1.15,
            ['fossilbox'] = 45.00,
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