Config = Config or {}
Config.PlayerProps = {}

---------------------------------------------
-- deploy prop settings
---------------------------------------------
Config.ForwardDistance = 1.0
Config.PromptGroupName = 'Place Moneybox'
Config.PromptCancelName = 'Cancel'
Config.PromptPlaceName = 'Place'
Config.PromptRotateLeft = 'Rotate Left'
Config.PromptRotateRight = 'Rotate Right'

---------------------------------------------
-- settings
---------------------------------------------
Config.EnableVegModifier = false -- if set true clears vegetation
Config.PickupTime        = 10000 -- how long for pickup proccess bar
Config.MaxMoneyBoxes     = 2 -- amount of stashes a character can have
Config.MoneyBoxItem      = 'moneybox' -- name for use item
Config.MoneyBoxProp      = 's_moneybox_loot' -- prop used for stash
Config.MoneyType         = 'cash' -- cash or bloodmoney
