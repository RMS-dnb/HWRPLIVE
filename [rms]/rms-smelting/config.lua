Config = {}

---------------------------------
-- settings
---------------------------------
Config.Image = "rsg-inventory/html/images/"
Config.Keybind = 'G'

---------------------------------
-- npc settings
---------------------------------
Config.DistanceSpawn = 20.0
Config.FadeIn = true

---------------------------------
-- npc locations
---------------------------------
Config.SmeltingLocations = {
    {
        name = 'Smelting Furnace',
        prompt = 'furnace1',
        coords = vector3(499.38, 678.90, 117.43),
        npcmodel = `mp_u_M_M_lom_rhd_smithassistant_01`,
        npccoords = vector4(499.38, 678.90, 117.43, 125.32),
        showblip = true
    },
}

---------------------------------
-- smelting items
---------------------------------
Config.Smelting = {
    ----------------------
    -- bars
    ----------------------
    {
        category = 'Bars',
        smelttime = 30000,
        ingredients = { 
            [1] = { item = 'coal', amount = 4 },
            [2] = { item = 'goldnugget', amount = 80 },
        },
        receive = 'gold_bar',
        giveamount = 1
    },
   
{   receive = 'silver_bar',
    giveamount = 1,
    category = 'Bars',
    crafttime = 30000,
    ingredients = {
        [1] = { item = 'coal', amount = 4 },
        [2] = { item = 'silver_ore', amount = 20 },
    },
},
{   receive = 'iron_bar',
    giveamount = 1,
    category = 'Bars',
    crafttime = 30000,
    ingredients = {
        [1] = { item = 'coal', amount = 2 },
        [2] = { item = 'iron_ore', amount = 6 },
    },
},
{   receive = 'steel_bar',
    giveamount = 1,
    category = 'Bars',
    crafttime = 30000,
    ingredients = {
        [1] = { item = 'coal', amount = 4 },
        [2] = { item = 'iron_bar', amount = 1 },
    },
},
{   receive = 'lead_bar',
    giveamount = 1,
    category = 'Bars',
    crafttime = 30000,
    ingredients = {
        [1] = { item = 'coal', amount = 2 },
        [2] = { item = 'lead_ore', amount = 6 },
    },
},
{   receive = 'copper_bar',
    giveamount = 1,
    category = 'Bars',
    crafttime = 30000,
    ingredients = {
        [1] = { item = 'coal', amount = 2 },
        [2] = { item = 'copper_ore', amount = 6 },
    },
},
{   receive = 'zinc_bar',
    giveamount = 1,
    category = 'Bars',
    crafttime = 30000,
    ingredients = {
        [1] = { item = 'coal', amount = 2 },
        [2] = { item = 'zinc_ore', amount = 6 },
    },
},
{   receive = 'brass_bar',
    giveamount = 1,
    category = 'Bars',
    crafttime = 30000,
    ingredients = {
        [1] = { item = 'coal', amount = 4 },
        [2] = { item = 'zinc_ore', amount = 6 },
        [3] = { item = 'copper_ore', amount = 6 },
    },
},
    -- add more as required
}
