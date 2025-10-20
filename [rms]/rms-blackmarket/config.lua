Config = {}

---------------------------------
-- shop settings
---------------------------------
Config = {
    BlackmarketShopItems = {
        -- FIXED: Added missing 'info', 'type', and 'slot' fields required by rsg-inventory
        { name = 'weapon_thrown_molotov', amount = 50, price = 125.00, info = {}, type = 'item', slot = 1 },
        { name = 'handcuffs', amount = 50, price = 200.00, info = {}, type = 'item', slot = 2 },
        { name = 'weedseed', amount = 500, price = 3.10, info = {}, type = 'item', slot = 3 },
        --{ name = 'cocaineseed', amount = 500, price = 1.50, info = {}, type = 'item', slot = 4 },
        --{ name = 'poppyseed', amount = 500, price = 1.75, info = {}, type = 'item', slot = 5 },
        { name = 'opiumpipe', amount = 500, price = 25.00, info = {}, type = 'item', slot = 6 },
        { name = 'dynamite', amount = 50, price = 50.00, info = {}, type = 'item', slot = 4 },
        { name = 'lockpick', amount = 500, price = 12.50, info = {}, type = 'item', slot = 5 },
        { name = 'cocainegum', amount = 50, price = 14.50, info = {}, type = 'item', slot = 8 },
        { name = 'headbag', amount = 50, price = 19.50, info = {}, type = 'item', slot = 6 },
    },
    PersistStock = false, --should stock save in database and load it after restart, to 'remember' stock value before restart
}

-- settings
Config.EnableServerNotify = true
Config.BlackmarketCronJob = '0 * * * *' -- cronjob time runs every 1 hour
Config.WashTime = 1000 -- amount of time per 1 x bloodmoney
Config.MaxWash = 100 -- maximum blood money to wash each time

-- blackmarket npcs
Config.spawnPoints = {
    
    vector4(2734.09, -1162.03, 53.25, 52.65), -- Montana River
    vector4(-3361.17, -1930.61, -6.08, 338.74), -- Cumberland Forest
    vector4(395.4, -1265.66, 41.68, 23.12), -- East Ambarino
    -- vector4(-811.87, -1354.47, 51.92, 117.01), -- blackwater
    -- vector4(-1767.94, -371.09, 163.13, 21.08), -- strawberry
    -- vector4(-3696.08, -2600.49, -10.32, 231.91), -- armadillo
    -- vector4(-5602.09, -2981.57, 2.10, 281.05), -- tumbleweed
    -- vector4(-278.44, 920.71, 128.22, 313.55), -- valentine
    -- vector4(1431.47, -1361.52, 85.15, 214.52), -- rhodes
    -- vector4(2844.11, -1158.94, 46.49, 14.24), -- stdenis
    -- vector4(2942.34, 539.52, 49.50, 358.81), -- van-horn
}

-- blackmarket npc models
Config.npcModels = {
    'mp_wgnthief_recipient_males_01',
    'mp_g_m_m_unicriminals_01',
    'mp_g_m_m_unicriminals_02'
}