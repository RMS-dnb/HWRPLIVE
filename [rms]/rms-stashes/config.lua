Config = Config or {}
Config.PlayerProps = {}

---------------------------------------------
-- deploy prop settings
---------------------------------------------
Config.ForwardDistance = 1.5
Config.PromptGroupName = 'Place Stash'
Config.PromptCancelName = 'Cancel'
Config.PromptPlaceName = 'Place'
Config.PromptRotateLeft = 'Rotate Left'
Config.PromptRotateRight = 'Rotate Right'

---------------------------------------------
-- settings
---------------------------------------------
Config.EnableVegModifier = false -- if set true clears vegetation
Config.StashMaxWeight    = 4000000 -- max weight the stash can hold
Config.StashMaxSlots     = 48 -- number of slots per stash
Config.DestroyTime       = 10000 -- how long for destroy proccess bar
Config.MaxStashes        = 1 -- amount of stashes a character can have
Config.StashProp         = 's_footlocker05x' -- prop used for stash

---------------------------------------------
-- blip settings
---------------------------------------------
Config.Blip = {
    blipName = 'Stash',
    blipSprite = 'blip_chest',
    blipScale = 0.2,
    blipColour = 'BLIP_MODIFIER_MP_COLOR_6'
}
