Config = Config or {}
Config.PlayerProps = {}

---------------------------------------------
-- deploy prop settings
---------------------------------------------
Config.ForwardDistance = 1.0
Config.PromptGroupName = 'Place Campsite Item'
Config.PromptCancelName = 'Cancel'
Config.PromptPlaceName = 'Set'
Config.PromptRotateLeft = 'Rotate Left'
Config.PromptRotateRight = 'Rotate Right'

---------------------------------------------
-- settings
---------------------------------------------
Config.Debug                = false
Config.MenuKeybind          = 'ENTER'
Config.MaxPropCount         = 7 -- maximum props
Config.MaintenancePerCycle  = 1 -- $ amount for prop maintenance
Config.PurgeStorage         = true
Config.BillingCycle         = 4 -- will remove credit every x hour/s
Config.ServerNotify         = true
Config.StorageMaxWeight     = 40000
Config.StorageMaxSlots      = 2
Config.Image                = "rsg-inventory/html/images/"
Config.EnableCredit         = true -- if false / turns off campsite upkeep

---------------------------------------------
-- blip settings
---------------------------------------------
Config.Blip = {
    blipName = 'Moonshine Still',
    blipSprite = 'blip_camp_tent',
    blipScale = 0.0,
    blipColour = 'BLIP_MODIFIER_MP_COLOR_6'
}

---------------------------------------------
-- deployable props / do not change if you have deployed props
---------------------------------------------

Config.MoonshineProp = `mp001_p_mp_still01x`


---------------------------------------------
-- moonshine recipes
---------------------------------------------
Config.MoonshineRecipes = {


    {
        category = "Moonshine",
        maketime = 30000,
        ingredients = { 
            [1] = { item = 'mash', amount = 3 },
            [2] = { item = 'bottle',  amount = 1 },
        },
        receive = 'moonshine',
        giveamount = 1
    },
 
}
