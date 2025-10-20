Config = {}

---------------------------------
-- settings
---------------------------------
Config.SearchTime       = 10000
Config.GiveRewardChance = 40 -- 40% change of giving a reward
Config.RareItemChance   = 5 -- 5% chance of finding a rare item
Config.TrashCronJob     = '0 * * * *' -- https://crontab.guru/#0_*_*_*_*
Config.CronNotification = false
Config.ObjectDistance   = 1.5

---------------------------------
-- dumpster props
---------------------------------
Config.TrashCans = {
    `p_streettrashcannbx01x`
}

---------------------------------
-- commons reward items
---------------------------------
Config.CommonRewardItems = {
    'carrot',
    'bottle'
}

---------------------------------
-- rare reward items
---------------------------------
Config.RareRewardItems = {
    'bible',
    'saltrock'
}
