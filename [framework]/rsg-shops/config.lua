Config = {}

---------------------------------
-- settings
---------------------------------
Config.Keybind = 'J' -- keybind prompt to open shop

---------------------------------
-- shop items

-- amount: default stock (remove to enable unlimited stock)
-- buyPrice: enables selling items to shop
-- maxStock: limits how much items players can sell to shop
-- minQuality: minimum quality that can be sold to shop (default 1)
-- restock: amount of items to be restocked per restock cycle

-- example: { name = 'bread', amount = 50, price = 0.10, buyPrice = 0.05, maxStock = 100, minQuality = 50, restock = 10 },
---------------------------------
Config.Products = {
    ['normal'] = {
        { name = 'bread', amount = 500, price = 0.45 },
        { name = 'water', amount = 500, price = 0.25 },
        { name = 'honey', amount = 500, price = 0.75 },
        { name = 'cookie', amount = 500, price = 0.25 },
        { name = 'chocolate', amount = 500, price = 0.25 },
        { name = 'cookingoil', amount = 500, price = 0.55 },
        { name = 'compass', amount = 50, price = 10.15 },
        { name = 'campfire', amount = 50, price = 2.25 },
        { name = 'camp_totem', amount = 50, price = 15.25 },
        { name = 'camp_supply', amount = 50, price = 1.25 },
        { name = 'pickaxe', amount = 50, price = 30.25 },
        { name = 'axe', amount = 50, price = 30.25 },
        { name = 'shovel', amount = 50, price = 30.25 },
        { name = 'goldpan', amount = 50, price = 20.25 },
        { name = 'pocket_watch', amount = 50, price = 15.25 },
        { name = 'canteen0', amount = 50, price = 12.25 },
        --{ name = 'hairpomade', amount = 50, price = 0.50 },
        { name = 'consumable_kidneybeans_can', amount = 500, price = 0.85 },
        { name = 'parasol', amount = 50, price = 5.25 },
        { name = 'weapon_kit_binoculars', amount = 50, price = 24.25 },
        { name = 'fan', amount = 50, price = 4.25 },
        { name = 'bottle', amount = 500, price = 0.02 },
        { name = 'mortarandpestle', amount = 50, price = 8.02 },
        { name = 'tealeaves', amound = 500, price = 0.12 },
        { name = 'bayleaves', amount = 500, price = 0.12 },
        { name = 'aloe', amount = 500, price = 0.12 },
        { name = 'bandage', amount = 500, price = 1.00 },
        { name = 'highwaterbook', amount = 50, price = 8.00 },
        { name = 'notebook', amount = 50, price = 5.00 },
        { name = 'archeology_brush', amount = 50, price = 10.00 },
        { name = 'dice', amount = 50, price = 9.50 },
        { name = 'banjo', amount = 50, price = 20.35 },
        { name = 'fiddle', amount = 50, price = 32.25 },
        { name = 'guitar', amount = 50, price = 27.50 },
        { name = 'concertina', amount = 50, price = 41.50 },
        { name = 'harmonica', amount = 50, price = 15.00 },
        { name = 'trumpet', amount = 50, price = 50.00 },
        
    },
    ['weapons'] = {
        { name = 'weapon_revolver_cattleman',            amount = 100, price = 50.00 },
        { name = 'weapon_melee_knife', amount = 50, price = 10.00 },
        { name = 'weapon_bow', amount = 50, price = 30.00 },
        { name = 'weapon_lasso', amount = 50, price = 20.00 },
        --{ name = 'weapon_revolver_doubleaction',         amount = 100, price = 127 },
        --{ name = 'weapon_revolver_doubleaction_gambler', amount = 100, price = 190 },
        --{ name = 'weapon_revolver_lemat',                amount = 100, price = 317 },
        --{ name = 'weapon_revolver_navy',                 amount = 100, price = 275 },
        --{ name = 'weapon_revolver_schofield',            amount = 100, price = 192 },
        --{ name = 'weapon_pistol_mauser',                 amount = 100, price = 600 },
        --{ name = 'weapon_pistol_semiauto',               amount = 100, price = 537 },
        --{ name = 'weapon_pistol_volcanic',               amount = 100, price = 270 },
        --{ name = 'weapon_rifle_boltaction',              amount = 100, price = 216 },
        --{ name = 'weapon_rifle_elephant',                amount = 100, price = 580 },
        --{ name = 'weapon_rifle_springfield',             amount = 100, price = 156 },
        --{ name = 'weapon_rifle_varmint',                 amount = 100, price = 72 },
        --{ name = 'weapon_repeater_carbine',              amount = 100, price = 90 },
        --{ name = 'weapon_repeater_evans',                amount = 100, price = 300 },
        --{ name = 'weapon_repeater_winchester',           amount = 100, price = 243 },
        --{ name = 'weapon_repeater_henry',                amount = 100, price = 348 },
        --{ name = 'weapon_sniperrifle_rollingblock',      amount = 100, price = 411 },
        --{ name = 'weapon_sniperrifle_carcano',           amount = 100, price = 456 },
        { name = 'ammo_box_revolver',                    amount = 100, price = 1.50 },
        { name = 'ammo_box_arrow',                       amount = 100, price = 1.50 },
        { name = 'ammo_box_pistol',                      amount = 100, price = 2.00 },
        { name = 'ammo_box_rifle',                       amount = 100, price = 2.00 },
        { name = 'ammo_box_varmint',                     amount = 100, price = 1.50 },
        { name = 'ammo_box_repeater',                    amount = 100, price = 1.75 },
        { name = 'ammo_box_shotgun',                     amount = 100, price = 3.00 },
       
    },
    ['minibar'] = {
        { name = 'bread', amount = 2, price = 1.10 },
        { name = 'water', amount = 2, price = 1.10 },
    },
    ['jail'] = {
        { name = 'bread', amount = 150, price = 1.10 },
        { name = 'water', amount = 150, price = 1.10 },
    },
    ['casino'] = {
        { name = 'white_chip', amount = 500, price = 1.00 },
        { name = 'red_chip', amount = 500, price = 5.00 },
        { name = 'blue_chip', amount = 500, price = 10.00 },
        { name = 'pink_chip', amount = 500, price = 20.00 },
        { name = 'black_chip', amount = 500, price = 50.00 },
    },
    ['companion'] = {
        { name = 'horse_brush', amount = 50, price = 5.0 },
        { name = 'companion_feed',amount = 50, price = 10.0 },
        { name = 'companion_drink',amount = 50, price = 5.0 },
        { name = 'companion_sugar',amount = 50, price = 10.0 },
        { name = 'companion_stimulant',amount = 50, price = 5.0 },
        { name = 'companion_reviver',amount = 50, price = 5.0 },
        { name = 'companion_bone',amount = 50, price = 5.0 },
    },
    ['madam'] = {
        -- { name = 'parabolspore', amount = 50, price = 1.10 },
        -- { name = 'mushroomspore', amount = 50, price = 1.10 },
        { name = 'moonlight_lantern', amount = 50, price = 21.10 },
        { name = 'water', amount = 50, price = 0.10 },
        { name = 'compass', amount = 50, price = 4.10 },
        { name = 'fan', amount = 50, price = 5.10 },
        { name = 'parasol', amount = 50, price = 5.10 },
       
    },
    ['blackmarket'] = {
        -- { name = 'parabolspore', amount = 50, price = 1.10 },
        -- { name = 'mushroomspore', amount = 50, price = 1.10 },
        { name = 'moonlight_lantern', amount = 50, price = 21.10 },
        { name = 'water', amount = 50, price = 0.10 },
        { name = 'compass', amount = 50, price = 4.10 },
        { name = 'fan', amount = 50, price = 5.10 },
        { name = 'parasol', amount = 50, price = 5.10 },
       
    },
    ['farmer'] = {
        { name = 'barleyseed', amount = 500, price = 0.10 },
        { name = 'cornseed', amount = 500, price = 0.15 },
        { name = 'sugarcaneseed', amount = 500, price = 0.10 },
        { name = 'cottonseed', amount = 500, price = 0.20 },
        { name = 'carrotseed', amount = 500, price = 0.19 },
        { name = 'potatoseed', amount = 500, price = 0.16 },
        -- { name = 'broccoliseed', amount = 500, price = 0.17 },
        { name = 'wheatseed', amount = 500, price = 0.19 },
        { name = 'onionseed', amount = 500, price = 0.10 },
        { name = 'beanseed', amount = 500, price = 0.10 },
        { name = 'rasberryseed', amount = 500, price = 0.10 },
        --{ name = 'lettuceseed', amount = 500, price = 0.10 },
        --{ name = 'yuccaseed', amount = 500, price = 0.10 },
        { name = 'tobaccoseed', amount = 500, price = 0.33 },
        -- { name = 'potatoseed', amount = 500, price = 0.10 },
        --{ name = 'artichokeseed', amount = 500, price = 0.10 },
        { name = 'chilipepperseed', amount = 500, price = 0.10 },
        { name = 'sageseed', amount = 500, price = 0.10 },
        { name = 'pepperseed', amount = 500, price = 0.10 },
        { name = 'watermelonseed', amount = 500, price = 0.10 },
        { name = 'garlicseed', amount = 500, price = 0.10 },
        { name = 'cucumberseed', amount = 500, price = 0.10 },
        { name = 'pumpkinseed', amount = 500, price = 0.10 },
        { name = 'riceseed', amount = 500, price = 0.10 },
        { name = 'coffeeseed', amount = 500, price = 0.10 },
        { name = 'oreganoseed', amount = 500, price = 0.10 },
        { name = 'tomatoseed', amount = 500, price = 0.10 },
        { name = 'broccoliseed', amount = 500, price = 0.10 },
        { name = 'lettuceseed', amount = 500, price = 0.10 },
        { name = 'teapotcan', amount = 50, price = 10.10 },
        { name = 'farmerbucket', amount = 50, price = 10.10 },
        { name = 'fertilizer', amount = 500, price = 0.40 },
        --{ name = 'hoe', amount = 50, price = 5.10 },
        { name = 'scarecrow', amount = 50, price = 15.10 },
    },
    ['hunting'] = {
        { name = 'weapon_melee_knife', amount = 50, price = 10.00 },
        { name = 'weapon_bow', amount = 50, price = 20.00 },
        { name = 'weapon_lasso', amount = 50, price = 15.00 },
        { name = 'weapon_kit_binoculars', amount = 50, price = 20.00 },
        { name = 'ammo_arrow', amount = 500, price = 2.00 },
    },
    ['camping'] = {
        { name = 'camphitchpost', amount = 50, price = 15.00 },
        { name = 'campcookstation', amount = 50, price = 20.00 },
        { name = 'camptorch', amount = 50, price = 10.00 },
        { name = 'stashchest', amount = 50, price = 30.00 },
        { name = 'campingchair', amount = 50, price = 15.00 },
    },
    ['horse'] = {
        { name = 'horse_brush',   amount = 50, price = 5 },
        { name = 'horse_lantern', amount = 50, price = 10 },
        { name = 'sugarcube',     amount = 50, price = 1 },
    },
    ['armoury'] = {
        --{ name = 'weapon_revolver_cattleman',  amount = 1, price = 0 },
        --{ name = 'weapon_repeater_winchester', amount = 1, price = 0 },
        { name = 'ammo_box_revolver',          amount = 10, price = 2.50 },
        { name = 'ammo_box_repeater',          amount = 10, price = 2.50 },
        { name = 'handcuffs',          amount = 10, price = 1 },
    },
    ['horse'] = {
        { name = 'horse_brush',   amount = 50, price = 5 },
        { name = 'horse_lantern', amount = 50, price = 10 },
        { name = 'sugarcube',     amount = 50, price = 1 },
    },
    ['prison'] = {
        { name = 'bread', amount = 50, price = 0.10 },
        { name = 'water', amount = 50, price = 0.10 },
    },
    ['medic'] = {
        { name = 'bandage',  amount = 50, price = 0 },
        { name = 'firstaid', amount = 50, price = 0 }
    },
    ['trapper'] = {
        { name = 'weapon_melee_knife', amount = 10, price = 5 },
    },
    ['fishmonger'] = {
        { name = 'weapon_fishingrod', amount = 50, price = 15.00 },
        { name = 'p_baitbread01x',    amount = 50, price = 0.15 },
        { name = 'p_baitcorn01x',     amount = 50, price = 0.15 },
        { name = 'p_baitcheese01x',   amount = 50, price = 0.25 },
        { name = 'p_baitworm01x',     amount = 50, price = 0.10 },
        { name = 'p_baitcricket01x',  amount = 50, price = 0.20 },
        { name = 'p_crawdad01x',      amount = 50, price = 0.15 },
    },
    ['prison'] = {
        { name = 'bread', amount = 50, price = 0.10 },
        { name = 'water', amount = 50, price = 0.10 },
    },
    ['moonshine'] = {
        { name = 'catch_container', amount = 50, price = 50.00 },
        { name = 'water', amount = 50, price = 0.10 },
    },
    ['crafting'] = {
        { name = 'bread', amount = 50, price = 0.10 },
        { name = 'water', amount = 50, price = 0.10 },
    },
    ['medic'] = {
        { name = 'bandage',  amount = 50, price = 0 },
        { name = 'firstaid', amount = 50, price = 0 }
    },
    ['butcher'] = {
        { name = 'weapon_melee_knife', amount = 100, price = 5 },
    },
    ['backpack'] = {
        { name = 'backpack_simple', amount = 50, price = 100 },
        { name = 'backpack_trapper',    amount = 50, price = 100 },
        { name = 'backpack_nat',     amount = 50, price = 100 },
        { name = 'backpack_normal',   amount = 50, price = 100 },
        { name = 'backpack_big',     amount = 50, price = 100 },
        { name = 'backpack_fish',  amount = 50, price = 100 },
        { name = 'backpack_ammo',      amount = 50, price = 100 },
    },
    ['tobaccostore'] = {
        { name = 'pipe', amount = 50, price = 10.75 },
        
        { name = 'matches',     amount = 500, price = 0.75 },
        --{ name = 'cigarette10',     amount = 500, price = 10.25 },
        { name = 'chewingtobacco',   amount = 500, price = 1.55 },
        { name = 'cigar',     amount = 500, price = 2.50 },
        { name = 'pipetobacco',  amount = 500, price = 1.25 },
        { name = 'rollingpaper',      amount = 1000, price = 0.10 },
        { name = 'zippo',      amount = 50, price = 10.50 },
        --{ name = 'joint_roller',      amount = 50, price = 15.50 },
        { name = 'emptycigarettebox',      amount = 500, price = 0.50 },
        { name = 'emptycigarbox',      amount = 500, price = 0.50 },
    },
    ['bagstore'] = {
        { name = 'bs_handbag_fancy', amount = 50, price = 10.75 },
        { name = 'bs_handbag_penelope',    amount = 50, price = 12.75 },
        { name = 'bs_handbag_purse1',    amount = 50, price = 10.75 },
        { name = 'bs_handbag_purse2',     amount = 50, price = 0.75 },
        { name = 'bs_handbag_workbag',     amount = 50, price = 3.25 },
        { name = 'bs_handbag_classy',   amount = 50, price = 1.55 },
        { name = 'bs_handbag_doctor',     amount = 50, price = 2.50 },
        { name = 'bs_handbag_cane',  amount = 50, price = 1.25 },
        { name = 'bs_handbag_coal',      amount = 50, price = 0.10 },
        { name = 'bs_handbag_penelopebig',      amount = 50, price = 10.50 },
        { name = 'bs_handbag_workbagdark',      amount = 50, price = 15.50 },
        { name = 'bs_handbag_purse',      amount = 50, price = 15.50 },
        
    },
    ['blueprintstore'] = {
    --    { name = 'bpo_pickaxe', amount = 10, price = 50 },
    --    { name = 'bpo_axe', amount = 10, price = 50 },
    --    { name = 'bpo_shovel', amount = 10, price = 50 },
        --{ name = 'bpo_weapon_revolver_cattleman_mexican', amount = 10, price = 100 },
        { name = 'bpo_weapon_pistol_volcanic', amount = 10, price = 750 },
        { name = 'bpo_weapon_repeater_carbine', amount = 10, price = 800 },
        --{ name = 'bpo_weapon_rifle_varmint', amount = 10, price = 100 },
        --{ name = 'bpo_weapon_revolver_doubleaction_gambler', amount = 10, price = 500 },
        { name = 'bpo_weapon_revolver_m1895', amount = 10, price = 800 },
        { name = 'bpo_weapon_revolver_lemat', amount = 10, price = 900 },
        { name = 'bpo_weapon_revolver_navy', amount = 10, price = 850 },
        { name = 'bpo_weapon_revolver_remington', amount = 10, price = 900 },
        { name = 'bpo_weapon_pistol_m1899', amount = 10, price = 800 },
        { name = 'bpo_weapon_pistol_mauser', amount = 10, price = 850 },
        { name = 'bpo_weapon_pistol_semiauto', amount = 10, price = 650 },
        { name = 'bpo_weapon_pistol_luger', amount = 10, price = 700 },
        { name = 'bpo_weapon_repeater_winchester', amount = 10, price = 750 },
        { name = 'bpo_weapon_repeater_henry', amount = 10, price = 800 },
        { name = 'bpo_weapon_rifle_springfield', amount = 10, price = 1200 },
        { name = 'bpo_weapon_rifle_boltaction', amount = 10, price = 1000 },
        { name = 'bpo_weapon_rifle_mosinnagant', amount = 10, price = 1150 },
        --{ name = 'bpo_weapon_rifle_elephant', amount = 10, price = 500 },
        --{ name = 'bpo_weapon_shotgun_doublebarrel_exotic', amount = 10, price = 500 },
        { name = 'bpo_weapon_shotgun_sawedoff', amount = 10, price = 950 },
        { name = 'bpo_weapon_shotgun_semiauto', amount = 10, price = 1500 },
        { name = 'bpo_weapon_shotgun_pump', amount = 10, price = 1500 },
        -- BPCs
        { name = 'bpc_weapon_pistol_volcanic', amount = 100, price = 82 },
        { name = 'bpc_weapon_repeater_carbine', amount = 100, price = 86 },
        { name = 'bpc_weapon_revolver_m1895', amount = 100, price = 86 },
        { name = 'bpc_weapon_revolver_lemat', amount = 100, price = 93 },
        { name = 'bpc_weapon_revolver_navy', amount = 100, price = 89 },
        { name = 'bpc_weapon_revolver_remington', amount = 100, price = 93 },
        { name = 'bpc_weapon_pistol_m1899', amount = 100, price = 86 },
        { name = 'bpc_weapon_pistol_mauser', amount = 100, price = 89 },
        { name = 'bpc_weapon_pistol_semiauto', amount = 100, price = 75 },
        { name = 'bpc_weapon_pistol_luger', amount = 100, price = 79 },
        { name = 'bpc_weapon_repeater_winchester', amount = 100, price = 82 },
        { name = 'bpc_weapon_repeater_henry', amount = 100, price = 86 },
        { name = 'bpc_weapon_rifle_springfield', amount = 100, price = 114 },
        { name = 'bpc_weapon_rifle_boltaction', amount = 100, price = 100 },
        { name = 'bpc_weapon_rifle_mosinnagant', amount = 100, price = 110 },
        { name = 'bpc_weapon_shotgun_sawedoff', amount = 100, price = 96 },
        { name = 'bpc_weapon_shotgun_semiauto', amount = 100, price = 114 },
        { name = 'bpc_weapon_shotgun_pump', amount = 100, price = 114 },
    },

    ['book'] = {
        { name = 'book1', amount = 50, price = 10.75 },
        { name = 'book2',    amount = 50, price = 12.75 },
        { name = 'gentlemansguide',    amount = 50, price = 6.75 },
        -- { name = 'gunsmithbook',    amount = 50, price = 6.75 },
        -- { name = 'publicbook',    amount = 50, price = 6.75 },
        -- { name = 'graverosebook',    amount = 50, price = 6.75 },
        -- { name = 'horsetrainerbook',    amount = 50, price = 6.75 },
        -- { name = 'valhorsetrainerbook',    amount = 50, price = 6.75 },
        -- { name = 'armabakerybook',    amount = 50, price = 6.75 },
        -- { name = 'valsaloonbook',    amount = 50, price = 6.75 },
        { name = 'highwaterbook',    amount = 50, price = 6.75 },
        { name = 'archeology_book',    amount = 50, price = 6.75 },
        
        
    },

    ['native1'] = {
        { name = 'weapon_bow', amount = 50, price = 30.00 },
        { name = 'ammo_box_arrow',amount = 100, price = 2.50 },
        { name = 'weapon_melee_knife', amount = 50, price = 10.00 },
        { name = 'campfire', amount = 50, price = 2.25 },
        { name = 'camp_totem', amount = 50, price = 15.25 },
        { name = 'camp_supply', amount = 50, price = 1.25 },
        
        
        
    },
    
    ['native'] = {
        { name = 'ind_na1', amount = 50, price = 10 },
        { name = 'ind_na2', amount = 50, price = 10 },
        { name = 'ind_na3', amount = 50, price = 10 },
        { name = 'ind_na4', amount = 50, price = 10 },
        { name = 'ind_na5', amount = 50, price = 10 },
        { name = 'ind_na6', amount = 50, price = 10 },
        { name = 'ind_na7', amount = 50, price = 10 },
        { name = 'ind_na8', amount = 50, price = 10 },
        -- { name = 'ind_headband1', amount = 50, price = 10 },
        -- { name = 'ind_headband2', amount = 50, price = 10 },
        -- { name = 'ind_headband3', amount = 50, price = 10 },
        -- { name = 'ind_headband4', amount = 50, price = 10 },
        -- { name = 'ind_headband5', amount = 50, price = 10 },
        -- { name = 'ind_headband6', amount = 50, price = 10 },
        -- { name = 'ind_headdress1', amount = 50, price = 10 },
        -- { name = 'ind_headdress2', amount = 50, price = 10 },
        -- { name = 'ind_headdress3', amount = 50, price = 10 },
        -- { name = 'ind_headdress4', amount = 50, price = 10 },
        -- { name = 'ind_headdress5', amount = 50, price = 10 },
        -- { name = 'ind_headdress6', amount = 50, price = 10 },
        
        { name = 'ind_feather1', amount = 50, price = 10 },
        { name = 'ind_feather2', amount = 50, price = 10 },
        { name = 'ind_feather3', amount = 50, price = 10 },
        { name = 'ind_feather4', amount = 50, price = 10 },
        { name = 'ind_feather5', amount = 50, price = 10 },
        { name = 'ind_feather6', amount = 50, price = 10 },
        { name = 'ind_feather7', amount = 50, price = 10 },
        { name = 'ind_feather8', amount = 50, price = 10 },
        { name = 'ind_cradle1', amount = 50, price = 10 },
     }
}

---------------------------------
-- shop locations and blips

-- persistentStock (true/false): enables stock to persist over server restart
---------------------------------
Config.StoreLocations = {
    ---------------------------------
    -- general store
    ---------------------------------
    {
        label = 'Rhodes General Store',
        name = 'gen-rhodes',
        products = 'normal',
        shopcoords = vector3(1329.3851318, -1293.3010253, 77.056404113),
        blipsprite = 'blip_shop_store',
        blipscale = 0.2,
        showblip = true,
        persistentStock = false,
    },
    {
        label = 'Valentine General Store',
        name = 'gen-valentine',
        products = 'normal',
        shopcoords = vector3(-322.41, 804.46, 117.88),
        blipsprite = 'blip_shop_store',
        blipscale = 0.2,
        showblip = true,
        persistentStock = false,
    },
    {
        label = 'Strawberry General Store',
        name = 'gen-strawberry',
        products = 'normal',
        shopcoords = vector3(-1790.833, -386.6215, 160.33488),
        blipsprite = 'blip_shop_store',
        blipscale = 0.2,
        showblip = true,
        persistentStock = false,
    },
    {
        label = 'Annesburg General Store',
        name = 'gen-annesburg',
        products = 'normal',
        shopcoords = vector3(2925.5214, 1366.8326, 45.186157),
        blipsprite = 'blip_shop_store',
        blipscale = 0.2,
        showblip = true,
        persistentStock = false,
    },
    {
        label = 'Saint Denis General Store',
        name = 'gen-stdenis',
        products = 'normal',
        shopcoords = vector3(2826.361, -1318.836, 46.755676),
        blipsprite = 'blip_shop_store',
        blipscale = 0.2,
        showblip = true,
        persistentStock = false,
    },
    {
        label = 'Tumbleweed General Store',
        name = 'gen-tumbleweed',
        products = 'normal',
        shopcoords = vector3(-5487.613, -2938.54, -0.38),
        blipsprite = 'blip_shop_store',
        blipscale = 0.2,
        showblip = true,
        persistentStock = false,
    },
    {
        label = 'Armadillo General Store',
        name = 'gen-armadillo',
        products = 'normal',
        shopcoords = vector3(-3685.56, -2622.59, -13.43),
        blipsprite = 'blip_shop_store',
        blipscale = 0.2,
        showblip = true,
        persistentStock = false,
    },
    {
        label = 'Blackwater General Store',
        name = 'gen-blackwater',
        products = 'normal',
        shopcoords = vector3(-785.66, -1323.79, 43.89),
        blipsprite = 'blip_shop_store',
        blipscale = 0.2,
        showblip = true,
        persistentStock = false,
    },
    {
        label = 'Van Horn General Store',
        name = 'gen-vanhorn',
        products = 'normal',
        shopcoords = vector3(2955.68, 475.17, 48.64),
        blipsprite = 'blip_shop_store',
        blipscale = 0.2,
        showblip = true,
        persistentStock = false,
    },
    {
        label = 'Guarma General Store',
        name = 'gen-guarma',
        products = 'normal',
        shopcoords = vector3(1276.1898193, -6893.8828, 44.09653),
        blipsprite = 'blip_shop_store',
        blipscale = 0.2,
        showblip = true,
        persistentStock = false,
    },
    ---------------------------------
    -- gunsmith
    ---------------------------------
    {
        label = 'Valentine Gunsmith',
        name = 'wep-valentine',
        products = 'weapons',
        shopcoords = vector3(-280.2546, 780.70251, 119.50397),
        blipsprite = 'blip_shop_gunsmith',
        blipscale = 0.2,
        showblip = true,
        persistentStock = false,
    },
    {
        label = 'Tumbleweed Gunsmith',
        name = 'wep-tumbleweed',
        products = 'weapons',
        shopcoords = vector3(-5507.951, -2965.163, -0.629222),
        blipsprite = 'blip_shop_gunsmith',
        blipscale = 0.2,
        showblip = true,
        persistentStock = false,
    },
    {
        label = 'Saint Denis Gunsmith',
        name = 'wep-stdenis',
        products = 'weapons',
        shopcoords = vector3(2717.4609, -1284.967, 49.63047),
        blipsprite = 'blip_shop_gunsmith',
        blipscale = 0.2,
        showblip = true,
        persistentStock = false,
    },
    {
        label = 'Rhodes Gunsmith',
        name = 'wep-rhodes',
        products = 'weapons',
        shopcoords = vector3(1323.7834, -1321.718, 77.889701),
        blipsprite = 'blip_shop_gunsmith',
        blipscale = 0.2,
        showblip = true,
        persistentStock = false,
    },
    {
        label = 'Annesburg Gunsmith',
        name = 'wep-annesburg',
        products = 'weapons',
        shopcoords = vector3(2946.50, 1319.53, 44.82),
        blipsprite = 'blip_shop_gunsmith',
        blipscale = 0.2,
        showblip = true,
        persistentStock = false,
    },
    {
        label = 'Blackwater Gunsmith',
        name = 'wep-blackwater',
        products = 'weapons',
        shopcoords = vector3(-786.2615, -1297.438, 43.734287),
        blipsprite = 'blip_shop_gunsmith',
        blipscale = 0.2,
        showblip = true,
        persistentStock = false,
    },
    {
        label = 'Strawberry Gunsmith',
        name = 'wep-strawberry',
        products = 'weapons',
        shopcoords = vector3(-1840.73, -421.38, 161.31),
        blipsprite = 'blip_shop_gunsmith',
        blipscale = 0.2,
        showblip = true,
        persistentStock = false,
    },
    {
        label = 'Van Horn Gunsmith',
        name = 'wep-vanhorn',
        products = 'weapons',
        shopcoords = vector3(2978.96, 499.57, 42.1),
        blipsprite = 'blip_shop_gunsmith',
        blipscale = 0.2,
        showblip = true,
        persistentStock = false,
    },
    {
        label = 'Armadillo Gunsmith',
        name = 'wep-arma',
        products = 'weapons',
        shopcoords = vector3(-3675.83, -2596.25, -13.34),
        blipsprite = 'blip_shop_gunsmith',
        blipscale = 0.2,
        showblip = true,
        persistentStock = false,
    },
    -----------------------
    --farmer shops
    ----------------------
    {
        label = 'Blackwater Farm Shop',
        name = 'farm-blackwater',
        products = 'farmer',
        shopcoords = vector3(-839.62, -1355.4, 43.6),
        blipsprite = 'blip_shop_store',
        blipscale = 0.2,
        persistentStock = false,
        showblip = true
    },
    {
        label = 'Saint Denis Farm Shop',
        name = 'farm-saintd',
        products = 'farmer',
        shopcoords = vector3(2845.55, -1225.99, 47.66),
        blipsprite = 'blip_shop_store',
        blipscale = 0.2,
        persistentStock = false,
        showblip = true
    },
    {
        label = 'Armadillo Farm Shop',
        name = 'farm-armadillo',
        products = 'farmer',
        shopcoords = vector3(-3691.12, -2622.97, -13.7),
        blipsprite = 'blip_shop_store',
        blipscale = 0.2,
        persistentStock = false,
        showblip = true
    },
    -- {
    --     label = 'Police Armoury',
    --     name = 'lawarmoury',
    --     products = 'armoury',
    --     shopcoords = vector3(-278.41, 804.94, 119.37),
    --     blipsprite = 'blip_shop_store',
    --     blipscale = 0.2,
    --     persistentStock = false,
    --     showblip = true
    -- },
    -----------------------
    --TOBACCO shops
    ----------------------
    {
        label = 'Tobacco Shop',
        name = 'tob-blkwater',
        products = 'tobaccostore',
        shopcoords = vector3(-779.7163, -1313.184, 43.704288),
        blipsprite = 'blip_shop_store',
        blipscale = 0.2,
        persistentStock = false,
        showblip = true
    },
        {
        label = 'Tobacco Shop',
        name = 'tob-vanhorn',
        products = 'tobaccostore',
        shopcoords = vector3(2953.87, 474.65, 48.64),
        blipsprite = 'blip_shop_store',
        blipscale = 0.2,
        persistentStock = false,
        showblip = true
    },

     -----------------------
    --TOBACCO shops
    ----------------------
    {
        label = 'Bag Shop',
        name = 'bag-blkwater',
        products = 'bagstore',
        shopcoords = vector3(-761.31, -1291.93, 43.85),
        blipsprite = 'blip_shop_store',
        blipscale = 0.2,
        persistentStock = false,
        showblip = true
    },

      -----------------------
    --native shops
    ----------------------
    {
        label = 'Native Vendor',
        name = 'native-wapiti',
        products = 'native1',
        shopcoords = vector3(433.91, 2193.89, 246.79),
        blipsprite = 'blip_shop_store',
        blipscale = 0.2,
        persistentStock = false,
        showblip = false
    },

    {
        label = 'Book Shop',
        name = 'book-shop',
        products = 'book',
        shopcoords = vector3(2859.79, -1200.52, 49.59),
        blipsprite = 'blip_shop_store',
        blipscale = 0.2,
        persistentStock = false,
        showblip = true
    },
-- Thieves Landing
    {
        label = 'Blueprint Shop',
        name = 'blueprint-shop',
        products = 'blueprintstore',
        shopcoords = vector3(-1354.97, -2298.68, 43.47),
        blipsprite = 'blip_shop_store',
        blipscale = 0.2,
        persistentStock = false,
        showblip = true
    },
-- Benedict Point
    {
        label = 'Blueprint Shop',
        name = 'blueprint-shop',
        products = 'blueprintstore',
        shopcoords = vector3(-5394.09, -3664.92, -24.92),
        blipsprite = 'blip_shop_store',
        blipscale = 0.2,
        persistentStock = false,
        showblip = true
    },
-- Mountain Mining Camp
    {
        label = 'Blueprint Shop',
        name = 'blueprint-shop',
        products = 'blueprintstore',
        shopcoords = vector3(-1881.13, 1319.13, 201.49),
        blipsprite = 'blip_shop_store',
        blipscale = 0.2,
        persistentStock = false,
        showblip = true
    },
    {
        label = 'Casino Chips',
        name = 'casino-shop',
        products = 'casino',
        shopcoords = vector3(2884.07, -1420.6, 43.33),
        blipsprite = 'blip_shop_store',
        blipscale = 0.2,
        persistentStock = false,
        showblip = true
    },
    {
        label = 'Sisika Canteen',
        name = 'jail-shop',
        products = 'jail',
        shopcoords = vector3(3364.905029296, -652.9566650390625, 46.15557098388672),
        blipsprite = 'blip_shop_store',
        blipscale = 0.2,
        persistentStock = false,
        showblip = true
    },
    {
        label = 'Moonshine Parts',
        name = 'moonshine-shop',
        products = 'moonshine',
        shopcoords = vector3(-1793.21, -383.06, 157.06),
        blipsprite = 'blip_shop_store',
        blipscale = 0.2,
        persistentStock = false,
        showblip = true
    },
    
    

}
