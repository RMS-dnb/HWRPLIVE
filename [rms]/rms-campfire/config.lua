Config = {}

---------------------------------
-- deploy prop settings
---------------------------------
Config.PromptGroupName = 'Place Campfire'
Config.PromptCancelName = 'Cancel'
Config.PromptPlaceName = 'Set'
Config.PromptRotateLeft = 'Rotate Left'
Config.PromptRotateRight = 'Rotate Right'
Config.CampfireProp = 'p_campfire03x_nofire'
Config.PlaceDistance = 5.0

---------------------------------
-- campfire rewards settings
---------------------------------
Config.CampfireRewards = {
    coalAmount = 3,  -- Amount of coal to give when campfire is destroyed
}

---------------------------------
-- other settings
---------------------------------
Config.Image = 'rsg-inventory/html/images/'

---------------------------------
-- cooking system
---------------------------------
Config.Cooking = {
    {
        category = 'Food',
        cooktime = 10000,
        ingredients = {
            [1] = { item = 'biggamemeat', amount = 1 },
            
        },
        receive = 'steak',
        giveamount = 3
    },
    {
        category = 'Food',
        cooktime = 10000,
        ingredients = {
            [1] = { item = 'smallgamemeat', amount = 1 },
            
        },
        receive = 'steak',
        giveamount = 2
    },
    {
        category = 'Food',
        cooktime = 10000,
        ingredients = {
            [1] = { item = 'beef_meat', amount = 1 },
            [2] = { item = 'potato', amount = 1 },
            [3] = { item = 'corn', amount = 1 },
            
        },
        receive = 'sheperdspie',
        giveamount = 2
    },
    {
        category = 'Meat',
        cooktime = 10000,
        ingredients = {
            [1] = { item = 'beef_meat', amount = 1 },
        },
        receive = 'steak',
        giveamount = 1
    },
    {
        category = 'Meat',
        cooktime = 10000,
        ingredients = {
            [1] = { item = 'pork_meat', amount = 1 },
        },
        receive = 'bacon',
        giveamount = 3
    },
    
    {
        category = 'Stew',
        cooktime = 10000,
        ingredients = {
            [1] = { item = 'biggamemeat', amount = 1 },
            [2] = { item = 'potato', amount = 1 },
            [3] = { item = 'carrot', amount = 1 },
        },
        receive = 'stew',
        giveamount = 2
    },
    {
        category = 'Stew',
        cooktime = 10000,
        ingredients = {
            [1] = { item = 'bluecrab', amount = 1 },
            [2] = { item = 'potato', amount = 1 },
            [3] = { item = 'carrot', amount = 1 },
        },
        receive = 'fishstew',
        giveamount = 2
    },
    {
        category = 'Stew',
        cooktime = 10000,
        ingredients = {
            [1] = { item = 'lobster', amount = 1 },
            [2] = { item = 'potato', amount = 1 },
            [3] = { item = 'carrot', amount = 1 },
        },
        receive = 'seafoodstew',
        giveamount = 2
    },
    {
        category = 'Stew',
        cooktime = 10000,
        ingredients = {
            [1] = { item = 'sausage', amount = 2 },
            [2] = { item = 'potato', amount = 2 },
            [3] = { item = 'carrot', amount = 2 },
        },
        receive = 'gumbo',
        giveamount = 2
    },
    
    
    -- add more as required
}

