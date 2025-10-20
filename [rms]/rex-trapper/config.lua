Config = {}

---------------------------------
-- settings
---------------------------------
Config.Debug = false
Config.KeyBind = 'J'
Config.SellTime = 10000
Config.PaymentType = 'cash' -- cash / bank / bloodmoney
Config.EnableTarget = true

---------------------------------
-- webhook settings
---------------------------------
Config.WebhookName = 'rextrapper'
Config.WebhookTitle = 'Rex Trapper'
Config.WebhookColour = 'default'
Config.Lang1 = ' Sold items to the Trapper for a total of $'

---------------------------------
-- npc settings
---------------------------------
Config.DistanceSpawn = 20.0
Config.FadeIn = true

---------------------------------
-- blip settings
---------------------------------
Config.Blip = {
    blipName = 'Trapper', -- Config.Blip.blipName
    blipSprite = 'blip_shop_animal_trapper', -- Config.Blip.blipSprite
    blipScale = 0.2 -- Config.Blip.blipScale
}

---------------------------------
-- trapper locations
---------------------------------
Config.TrapperLocations = {

    {
        name = 'Valentine Trapper',
        prompt = 'valentine-trapper',
        coords = vector3(-11334.2203, 11773.16943, 11116.24839),
        npcmodel = `u_m_m_sdtrapper_01`,
        npccoords = vector4(-111333.9737, 11773.49157, 11116.22194, 11111.8759),
        showblip = false
    },
    -- {
    --     name = 'St Denis Trapper',
    --     prompt = 'stdenis-trapper',
    --     coords = vector3(2832.5424, -1225.602, 47.661453),
    --     npcmodel = `u_m_m_sdtrapper_01`,
    --     npccoords = vector4(2832.3193, -1223.699, 47.654289, 190.36814),
    --     showblip = true
    -- },
    -- {
    --     name = 'Riggs Station Trapper',
    --     prompt = 'riggsstation-trapper',
    --     coords = vector3(-1006.938, -549.3896, 99.393592),
    --     npcmodel = `u_m_m_sdtrapper_01`,
    --     npccoords = vector4(-1007.607, -549.5084, 99.39138, 282.4226),
    --     showblip = true
    -- },
    -- {
    --     name = 'West Elizabeth Trapper',
    --     prompt = 'westelizabeth-trapper',
    --     coords = vector3(-2843.525, 142.12048, 184.59883),
    --     npcmodel = `u_m_m_sdtrapper_01`,
    --     npccoords = vector4(-2844.197, 142.13876, 184.61907, 255.25524),
    --     showblip = true
    -- },
    -- {
    --     name = 'Stawberry Trapper',
    --     prompt = 'stawberry-trapper',
    --     coords = vector3(-1746.634, -389.2384, 156.53625),
    --     npcmodel = `u_m_m_sdtrapper_01`,
    --     npccoords = vector4(-1745.992, -388.9831, 156.59568, 107.79673),
    --     showblip = true
    -- },
    -- {
    --     name = 'Tumbleweed Trapper',
    --     prompt = 'tumbleweed-trapper',
    --     coords = vector3(-5512.208, -2952.122, -1.791797),
    --     npcmodel = `u_m_m_sdtrapper_01`,
    --     npccoords = vector4(-5511.721, -2951.048, -1.83548, 165.87483),
    --     showblip = true
    -- },
    -- {
    --     name = 'Grifflies Trapper',
    --     prompt = 'grifflies-trapper',
    --     coords = vector3(1419.69, 363.57, 88.89),
    --     npcmodel = `u_m_m_sdtrapper_01`,
    --     npccoords = vector4(1419.69, 363.57, 88.89, 314.5),
    --     showblip = true
    -- },
    -- {
    --     name = 'Roanake Trapper',
    --     prompt = 'roanake-trapper',
    --     coords = vector3(2539.4578, 809.7834, 75.9239),
    --     npcmodel = `u_m_m_sdtrapper_01`,
    --     npccoords = vector4(2541.54, 809.94, 75.98, 98.15),
    --     showblip = true
    -- },
    -- {
    --     name = 'Ambario Trapper',
    --     prompt = 'ambario-trapper',
    --     coords = vector3(-1633.170, 1235.340, 351.892),
    --     npcmodel = `u_m_m_sdtrapper_01`,
    --     npccoords = vector4(-1632.52, 1235.91, 351.87, 165.18),
    --     showblip = true
    -- },
    -- {
    --     name = 'Corngual Trapper',
    --     prompt = 'corngual-trapper',
    --     coords = vector3(497.839, 580.183, 110.1711),
    --     npcmodel = `u_m_m_sdtrapper_01`,
    --     npccoords = vector4(497.70, 579.54, 110.20, 359.00),
    --     showblip = true
    -- },
    -- {
    --     name = 'Heartlands Trapper',
    --     prompt = 'heartlands-trapper',
    --     coords = vector3(-128.092, -23.935, 96.100),
    --     npcmodel = `u_m_m_sdtrapper_01`,
    --     npccoords = vector4(-127.70, -24.34, 96.08, 104.95),
    --     showblip = true
    -- },
    -- {
    --     name = 'Manzanita Trapper',
    --     prompt = 'manzanita-trapper',
    --     coords = vector3(-1981.611, -1650.570, 117.099),
    --     npcmodel = `u_m_m_sdtrapper_01`,
    --     npccoords = vector4(-1981.30, -1650.31, 117.09, 130.13),
    --     showblip = true
    -- },
    -- {
    --     name = 'Kamassa River Trapper',
    --     prompt = 'kamassariver-trapper',
    --     coords = vector3(1878.461, -1854.444, 42.748),
    --     npcmodel = `u_m_m_sdtrapper_01`,
    --     npccoords = vector4(1878.37, -1854.60, 42.76, 25.18),
    --     showblip = true
    -- },
    -- {
    --     name = 'Rio Bravo Trapper',
    --     prompt = 'riobravo-trapper',
    --     coords = vector3(-4621.124, -3366.574, 21.975),
    --     npcmodel = `u_m_m_sdtrapper_01`,
    --     npccoords = vector4(-4621.31, -3366.02, 21.97, 226.17),
    --     showblip = true
    -- },
    -- {
    --     name = 'Spider Gorge Trapper',
    --     prompt = 'spidergorge-trapper',
    --     coords = vector3(-1340.77, 2437.74, 308.18),
    --     npcmodel = `u_m_m_sdtrapper_01`,
    --     npccoords = vector4(-1340.77, 2437.74, 308.18, 177.71),
    --     showblip = true
    -- },

}

-------------------------------------
-- pelt sell prices
-------------------------------------
Config.PoorPeltPrice = 1
Config.GoodPeltPrice = 2
Config.PerfectPeltPrice = 3
Config.LegendaryPeltPrice = 10
Config.SmallPeltPrice = 1
Config.ReptileSkinPrice = 1
Config.FeatherPrice = 1

Config.Pelts = {
    
    -------------------------------------
-- BEAR
{ -- a_c_bear_01 / PROVISION_BEAR_FUR_POOR
pelthash    = 957520252,
name        = 'Poor Bear Pelt',
rewarditem1 = 'poor_bear_pelt',
rewarditem2 = 'biggamemeat',
rewarditem3 = 'animalfat',
rewarditem4 = 'biggamemeat'
},
{ -- a_c_bear_01 / PROVISION_BEAR_FUR
pelthash    = 143941906,
name        = 'Good Bear Pelt',
rewarditem1 = 'good_bear_pelt',
rewarditem2 = 'biggamemeat',
rewarditem3 = 'animalfat',
rewarditem4 = 'biggamemeat'


},
{ -- a_c_bear_01 / PROVISION_BEAR_FUR_PRISTINE
pelthash    = 1292673537,
name        = 'Perfect Bear Pelt',
rewarditem1 = 'perfect_bear_pelt',
rewarditem2 = 'biggamemeat',
rewarditem3 = 'animalfat',
rewarditem4 = 'biggamemeat'

},

-- BLACK_BEAR
{ -- a_c_bearblack_01 / PROVISION_BLACK_BEAR_FUR_POOR
pelthash    = 1083865179,
name        = 'Poor Black Bear Pelt',
rewarditem1 = 'poor_black_bear_pelt',
rewarditem2 = 'biggamemeat',
rewarditem3 = 'animalfat',
rewarditem4 = 'biggamemeat'

},
{ -- a_c_bearblack_01 / PROVISION_BLACK_BEAR_FUR
pelthash    = 1490032862,
name        = 'Good Black Bear Pelt',
rewarditem1 = 'good_black_bear_pelt',
rewarditem2 = 'biggamemeat',
rewarditem3 = 'animalfat',
rewarditem4 = 'biggamemeat'

},
{ -- possum
pelthash    = -1414989025,
name        = 'Wirginia Possum',
rewarditem1 = 'animalfat',
rewarditem2 = 'smallgamemeat',
rewarditem3 = 'possumfur',


},

{ -- a_c_bearblack_01 / PROVISION_BLACK_BEAR_FUR_PRISTINE
pelthash    = 663376218,
name        = 'Perfect Black Bear Pelt',
rewarditem1 = 'perfect_black_bear_pelt',
rewarditem2 = 'biggamemeat',
rewarditem3 = 'animalfat',
rewarditem4 = 'biggamemeat'

},

-- BOAR
{ -- a_c_boar_01 / PROVISION_BOAR_SKIN_POOR
pelthash    = 1248540072,
name        = 'Poor Boar Pelt',
rewarditem1 = 'poor_boar_pelt',
rewarditem2 = 'smallgamemeat',
rewarditem3 = 'boartusk',
rewarditem4 = 'boarhair',
rewarditem5 = 'boarhair',



},
{ -- a_c_boar_01 / PROVISION_BOAR_SKIN
pelthash    = 2116849039,
name        = 'Good Boar Pelt',
rewarditem1 = 'good_boar_pelt',
rewarditem2 = 'smallgamemeat',
rewarditem3 = 'boarhair',
rewarditem4 = 'boarhair',
rewarditem5 = 'boartusk',

},
{ -- a_c_boar_01 / PROVISION_BOAR_SKIN_PRISTINE
pelthash    = -1858513856,
name        = 'Perfect Boar Pelt',
rewarditem1 = 'perfect_boar_pelt',
rewarditem2 = 'smallgamemeat',
rewarditem3 = 'boarhair',
rewarditem4 = 'boarhair',
rewarditem5 = 'boartusk',

},

-- BUCK
{ -- a_c_buck_01 / PROVISION_BUCK_FUR_POOR
pelthash    = 1603936352,
name        = 'Poor Buck Pelt',
rewarditem1 = 'poor_buck_pelt',
rewarditem2 = 'biggamemeat',
rewarditem3 = 'leather',
rewarditem4 = 'biggamemeat',
rewarditem5 = 'deer_antlers'
},
{ -- a_c_buck_01 / PROVISION_BUCK_FUR
pelthash    = -868657362,
name        = 'Good Buck Pelt',
rewarditem1 = 'good_buck_pelt',
rewarditem2 = 'biggamemeat',
rewarditem3 = 'leather',
rewarditem4 = 'biggamemeat',
rewarditem5 = 'deer_antlers'
},
{ -- a_c_buck_01 / PROVISION_BUCK_FUR_PRISTINE
pelthash    = -702790226,
name        = 'Perfect Buck Pelt',
rewarditem1 = 'perfect_buck_pelt',
rewarditem2 = 'biggamemeat',
rewarditem3 = 'leather',
rewarditem4 = 'biggamemeat',
rewarditem5 = 'deer_antlers'
},

-- BUFFALO
{ -- a_c_buffalo_01 / PROVISION_BUFFALO_FUR_POOR
pelthash    = -1730060063,
name        = 'Poor Buffalo Pelt',
rewarditem1 = 'poor_buffalo_pelt',
rewarditem2 = 'biggamemeat',
rewarditem3 = 'bisonhorn',
rewarditem4 = 'animalfat',
rewarditem5 = 'biggamemeat'
},
{ -- a_c_buffalo_01 / PROVISION_BUFFALO_FUR
pelthash    = -591117838,
name        = 'Good Buffalo Pelt',
rewarditem1 = 'good_buffalo_pelt',
rewarditem2 = 'biggamemeat',
rewarditem3 = 'bisonhorn',
rewarditem4 = 'animalfat',
rewarditem5 = 'biggamemeat'
},
{ -- a_c_buffalo_01 / PROVISION_BUFFALO_FUR_PRISTINE
pelthash    = -237756948,
name        = 'Perfect Buffalo Pelt',
rewarditem1 = 'perfect_buffalo_pelt',
rewarditem2 = 'biggamemeat',
rewarditem3 = 'bisonhorn',
rewarditem4 = 'animalfat',
rewarditem5 = 'biggamemeat'
},

-- BULL
{ -- a_c_bull_01 / PROVISION_BULL_HIDE_POOR
pelthash    = 9293261,
name        = 'Poor Bull Hide',
rewarditem1 = 'poor_bull_pelt',
rewarditem2 = 'biggamemeat',
rewarditem4 = 'animalfat'
},
{ -- a_c_bull_01 / PROVISION_BULL_HIDE
pelthash    = -536086818,
name        = 'Good Bull Hide',
rewarditem1 = 'good_bull_pelt',
rewarditem2 = 'biggamemeat',
rewarditem4 = 'animalfat'
},
{ -- a_c_bull_01 / PROVISION_BULL_HIDE_PRISTINE
pelthash    = -53270317,
name        = 'Perfect Bull Hide',
rewarditem1 = 'poor_bull_pelt',
rewarditem2 = 'biggamemeat',
rewarditem4 = 'animalfat'
},

-- COUGAR
{ -- a_c_cougar_01 / PROVISION_COUGAR_FUR_POOR
pelthash    = 1914602340,
name        = 'Poor Cougar Pelt',
rewarditem1 = 'poor_cougar_pelt',
rewarditem2 = 'biggamemeat',
rewarditem3 = 'cougarclaw'
},
{ -- a_c_cougar_01 / PROVISION_COUGAR_FUR
pelthash    = 459744337,
name        = 'Good Cougar Pelt',
rewarditem1 = 'good_cougar_pelt',
rewarditem2 = 'biggamemeat',
rewarditem3 = 'cougarclaw'
},
{ -- a_c_cougar_01 / PROVISION_COUGAR_FUR_PRISTINE
pelthash    = -1791452194,
name        = 'Perfect Cougar Pelt',
rewarditem1 = 'perfect_cougar_pelt',
rewarditem2 = 'biggamemeat',
rewarditem3 = 'cougarclaw'
},

-- COW
{ -- a_c_cow / PROVISION_COW_HIDE_POOR
pelthash    = 334093551,
name        = 'Poor Cow Hide',
rewarditem1 = 'poor_cow_pelt',
rewarditem2 = 'biggamemeat',
rewarditem4 = 'animalfat'
},
{ -- a_c_cow / PROVISION_COW_HIDE
pelthash    = 1150594075,
name        = 'Good Cow Hide',
rewarditem1 = 'good_cow_pelt',
rewarditem2 = 'biggamemeat',
rewarditem4 = 'animalfat'
},
{ -- a_c_cow / PROVISION_COW_HIDE_PRISTINE
pelthash    = -845037222,
name        = 'Perfect Cow Hide',
rewarditem1 = 'perfect_cow_pelt',
rewarditem2 = 'biggamemeat',
rewarditem4 = 'animalfat'
},

-- COYOTE
{ -- a_c_coyote_01 / PROVISION_COYOTE_FUR_POOR
pelthash    = -1558096473,
name        = 'Poor Coyote Pelt',
rewarditem1 = 'poor_coyote_pelt',
rewarditem2 = 'smallgamemeat',
rewarditem3 = 'coyotefang'
},
{ -- a_c_coyote_01 / PROVISION_COYOTE_FUR
pelthash    = 1150939141,
name        = 'Good Coyote Pelt',
rewarditem1 = 'good_coyote_pelt',
rewarditem2 = 'smallgamemeat',
rewarditem3 = 'coyotefang'
},
{ -- a_c_coyote_01 / PROVISION_COYOTE_FUR_PRISTINE
pelthash    = -794277189,
name        = 'Perfect Coyote Pelt',
rewarditem1 = 'perfect_coyote_pelt',
rewarditem2 = 'smallgamemeat',
rewarditem3 = 'coyotefang'
},

-- DEER
{ -- a_c_deer_01 / PROVISION_DEER_HIDE_POOR
pelthash    = -662178186,
name        = 'Poor Deer Pelt',
rewarditem1 = 'poor_deer_pelt',
rewarditem2 = 'biggamemeat',
rewarditem3 = 'biggamemeat'
},
{ -- a_c_deer_01 / PROVISION_DEER_HIDE
pelthash    = -1827027577,
name        = 'Good Deer Pelt',
rewarditem1 = 'good_deer_pelt',
rewarditem2 = 'biggamemeat',
rewarditem3 = 'biggamemeat'
},
{ -- a_c_deer_01 / PROVISION_DEER_HIDE_PRISTINE
pelthash    = -1035515486,
name        = 'Perfect Deer Pelt',
rewarditem1 = 'perfect_deer_pelt',
rewarditem2 = 'biggamemeat',
rewarditem3 = 'biggamemeat'
},

-- ELK
{ -- a_c_elk_01 / PROVISION_ELK_FUR_POOR
pelthash    = 2053771712,
name        = 'Poor Elk Pelt',
rewarditem1 = 'poor_elk_pelt',
rewarditem2 = 'biggamemeat',
rewarditem3 = 'elkantlers'
},
{ -- a_c_elk_01 / PROVISION_ELK_FUR
pelthash    = 1181652728,
name        = 'Good Elk Pelt',
rewarditem1 = 'good_elk_pelt',
rewarditem2 = 'biggamemeat',
rewarditem3 = 'elkantlers' 
},
{ -- a_c_elk_01 / PROVISION_ELK_FUR_PRISTINE
pelthash    = -1332163079,
name        = 'Perfect Elk Pelt',
rewarditem1 = 'perfect_elk_pelt',
rewarditem2 = 'biggamemeat',
rewarditem3 = 'elkantlers'
},

-- FOX
{ -- a_c_fox_01 / PROVISION_FOX_FUR_POOR
pelthash    = 1647012424,
name        = 'Poor Fox Pelt',
rewarditem1 = 'poor_fox_pelt',
rewarditem2 = 'smallgamemeat',
rewarditem3 = 'foxclaw'
},
{ -- a_c_fox_01 / PROVISION_FOX_FUR
pelthash    = 238733925,
name        = 'Good Fox Pelt',
rewarditem1 = 'good_fox_pelt',
rewarditem2 = 'smallgamemeat',
rewarditem3 = 'foxclaw'
},
{ -- a_c_fox_01 / PROVISION_FOX_FUR_PRISTINE
pelthash    = 500722008,
name        = 'Perfect Fox Pelt',
rewarditem1 = 'perfect_fox_pelt',
rewarditem2 = 'smallgamemeat',
rewarditem3 = 'foxclaw'
},

-- GOAT
{ -- a_c_goat_01 / PROVISION_GOAT_HAIR_POOR
pelthash    = 699990316,
name        = 'Poor Goat Hide',
rewarditem1 = 'poor_goat_pelt',
rewarditem2 = 'smallgamemeat',
rewarditem3 = 'animalfat'

},
{ -- a_c_goat_01 / PROVISION_GOAT_HAIR
pelthash    = 1710714415,
name        = 'Good Goat Hide',
rewarditem1 = 'good_goat_pelt',
rewarditem2 = 'smallgamemeat',
rewarditem3 = 'animalfat'
},
{ -- a_c_goat_01 / PROVISION_GOAT_HAIR_PRISTINE
pelthash    = -1648383828,
name        = 'Perfect Goat Hide',
rewarditem1 = 'perfect_goat_pelt',
rewarditem2 = 'smallgamemeat',
rewarditem3 = 'animalfat'
},

-- JAVELINA
{ -- a_c_javelina_01 / PROVISION_JAVELINA_SKIN_POOR
pelthash    = -99092070,
name        = 'Poor Peccary Pig Pelt',
rewarditem1 = 'poor_javelina_pelt',
rewarditem2 = 'pork_meat',
rewarditem3 = 'animalfat'
},
{ -- a_c_javelina_01 / PROVISION_JAVELINA_SKIN
pelthash    = -1379330323,
name        = 'Good Peccary Pig Pelt',
rewarditem1 = 'good_javelina_pelt',
rewarditem2 = 'pork_meat',
rewarditem3 = 'animalfat'
},
{ -- a_c_javelina_01 / PROVISION_JAVELINA_SKIN_PRISTINE
pelthash    = 1963510418,
name        = 'Perfect Peccary Pig Pelt',
rewarditem1 = 'perfect_javelina_pelt',
rewarditem2 = 'pork_meat',
rewarditem3 = 'animalfat'
},

-- MOOSE
{ -- a_c_moose_01 / PROVISION_MOOSE_FUR_POOR
pelthash    = 1868576868,
name        = 'Poor Moose Pelt',
rewarditem1 = 'poor_moose_pelt',
rewarditem2 = 'biggamemeat',
rewarditem3 = 'animalfat'
},
{ -- a_c_moose_01 / PROVISION_MOOSE_FUR
pelthash    = 1636891382,
name        = 'Good Moose Pelt',
rewarditem1 = 'good_moose_pelt',
rewarditem2 = 'biggamemeat',
rewarditem3 = 'animalfat'
},
{ -- a_c_moose_01 / PROVISION_MOOSE_FUR_PRISTINE
pelthash    = -217731719,
name        = 'Perfect Moose Pelt',
rewarditem1 = 'perfect_moose_pelt',
rewarditem2 = 'biggamemeat',
rewarditem3 = 'animalfat'
},

-- OXEN
{ -- a_c_ox_01 / PROVISION_OXEN_HIDE_POOR
pelthash    = 462348928,
name        = 'Poor Ox Hide',
rewarditem1 = 'poor_ox_pelt',
rewarditem2 = 'biggamemeat',
rewarditem3 = 'animalfat'
},
{ -- a_c_ox_01 / PROVISION_OXEN_HIDE
pelthash    = 1208128650,
name        = 'Good Ox Hide',
rewarditem1 = 'good_ox_pelt',
rewarditem2 = 'biggamemeat',
rewarditem3 = 'animalfat'
},
{ -- a_c_ox_01 / PROVISION_OXEN_HIDE_PRISTINE
pelthash    = 659601266,
name        = 'Perfect Ox Hide',
rewarditem1 = 'perfect_ox_pelt',
rewarditem2 = 'biggamemeat',
rewarditem3 = 'animalfat'
},

-- PANTHER
{ -- a_c_panther_01 / PROVISION_PANTHER_FUR_POOR
pelthash    = 1584468323,
name        = 'Poor Panther Pelt',
rewarditem1 = 'poor_panther_pelt',
rewarditem2 = 'biggamemeat',
rewarditem3 = 'panthereyeball'
},
{ -- a_c_panther_01 / PROVISION_PANTHER_FUR
pelthash    = -395646254,
name        = 'Good Panther Pelt',
rewarditem1 = 'good_panther_pelt',
rewarditem2 = 'biggamemeat',
rewarditem3 = 'panthereyeball'
},
{ -- a_c_panther_01 / PROVISION_PANTHER_FUR_PRISTINE
pelthash    = 1969175294,
name        = 'Perfect Panther Pelt',
rewarditem1 = 'perfect_panther_pelt',
rewarditem2 = 'biggamemeat',
rewarditem3 = 'panthereyeball'
},

-- PIG
{ -- a_c_pig_01 / PROVISION_PIG_SKIN_POOR
pelthash    = -308965548,
name        = 'Poor Pig Hide',
rewarditem1 = 'poor_pig_pelt',
rewarditem2 = 'pork_meat',
rewarditem3 = 'animalfat'
},
{ -- a_c_pig_01 / PROVISION_PIG_SKIN
pelthash    = -57190831,
name        = 'Good Pig Hide',
rewarditem1 = 'good_pig_pelt',
rewarditem2 = 'pork_meat',
rewarditem3 = 'animalfat'
},
{ -- a_c_pig_01 / PROVISION_PIG_SKIN_PRISTINE
pelthash    = -1102272634,
name        = 'Perfect Pig Hide',
rewarditem1 = 'perfect_pig_pelt',
rewarditem2 = 'pork_meat',
rewarditem3 = 'animalfat'
},

-- PRONGHORN
{ -- a_c_pronghorn_01 / PROVISION_PRONGHORN_FUR_POOR
pelthash    = -983605026,
name        = 'Poor Pronghorn Hide',
rewarditem1 = 'poor_pronghorn_pelt',
rewarditem2 = 'biggamemeat',
rewarditem3 = 'leather'
},
{ -- a_c_pronghorn_01 / PROVISION_PRONGHORN_FUR
pelthash    = 554578289,
name        = 'Good Pronghorn Hide',
rewarditem1 = 'good_pronghorn_pelt',
rewarditem2 = 'biggamemeat',
rewarditem3 = 'leather'
},
{ -- a_c_pronghorn_01 / PROVISION_PRONGHORN_FUR_PRISTINE
pelthash    = -1544126829,
name        = 'Perfect Pronghorn Hide',
rewarditem1 = 'perfect_pronghorn_pelt',
rewarditem2 = 'biggamemeat',
rewarditem3 = 'leather'
},

-- RAM
{ -- a_c_bighornram_01 / PROVISION_RAM_HIDE_POOR
pelthash    = 1796037447,
name        = 'Poor Ram Hide',
rewarditem1 = 'poor_bighornram_pelt',
rewarditem2 = 'biggamemeat',
rewarditem3 = 'ramhorn'
},
{ -- a_c_bighornram_01 / PROVISION_RAM_HIDE
pelthash    = -476045512,
name        = 'Good Ram Hide',
rewarditem1 = 'good_bighornram_pelt',
rewarditem2 = 'biggamemeat',
rewarditem3 = 'ramhorn'
},
{ -- a_c_bighornram_01 / PROVISION_RAM_HIDE_PRISTINE
pelthash    = 1795984405,
name        = 'Perfect Ram Hide',
rewarditem1 = 'perfect_bighornram_pelt',
rewarditem2 = 'biggamemeat',
rewarditem3 = 'ramhorn'
},

-- SHEEP
{ -- a_c_sheep_01 / PROVISION_SHEEP_WOOL_POOR
pelthash    = 1729948479,
name        = 'Poor Sheep Hide',
rewarditem1 = 'poor_sheep_pelt',
rewarditem2 = 'smallgamemeat',
rewarditem3 = 'sheepwool',
rewarditem4 = 'animalfat'
},
{ -- a_c_sheep_01 / PROVISION_SHEEP_WOOL
pelthash    = -1317365569,
name        = 'Good Sheep Hide',
rewarditem1 = 'good_sheep_pelt',
rewarditem2 = 'smallgamemeat',
rewarditem3 = 'sheepwool',
rewarditem4 = 'animalfat'
},
{ -- a_c_sheep_01 / PROVISION_SHEEP_WOOL_PRISTINE
pelthash    = 1466150167,
name        = 'Perfect Sheep Hide',
rewarditem1 = 'perfect_sheep_pelt',
rewarditem2 = 'smallgamemeat',
rewarditem3 = 'sheepwool',
rewarditem4 = 'animalfat'
},

-- WOLF
{ -- a_c_wolf / PROVISION_WOLF_FUR_POOR
pelthash    = 85441452,
name        = 'Poor Wolf Pelt',
rewarditem1 = 'poor_wolf_pelt',
rewarditem2 = 'smallgamemeat',
rewarditem3 = 'wolfheart'
},
{ -- a_c_wolf / PROVISION_WOLF_FUR
pelthash    = 1145777975,
name        = 'Good Wolf Pelt',
rewarditem1 = 'good_wolf_pelt',
rewarditem2 = 'smallgamemeat',
rewarditem3 = 'wolfheart'
},
{ -- a_c_wolf / PROVISION_WOLF_FUR_PRISTINE
pelthash    = 653400939,
name        = 'Perfect Wolf Pelt',
rewarditem1 = 'perfect_wolf_pelt',
rewarditem2 = 'smallgamemeat',
rewarditem3 = 'wolfheart'
},



-- RACCOON
{ -- a_c_raccoon_01 / PROVISION_RACCOON_FUR_POOR
pelthash    = 1992476687,
name        = 'Poor Raccoon Pelt',
rewarditem1 = 'poor_raccoon_pelt',
rewarditem2 = 'smallgamemeat',
rewarditem3 = 'raccoonpaw'
},
{ -- a_c_raccoon_01 / PROVISION_RACCOON_FUR
pelthash    = -1178296218,
name        = 'Good Raccoon Pelt',
rewarditem1 = 'good_raccoon_pelt',
rewarditem2 = 'smallgamemeat',
rewarditem3 = 'raccoonpaw'
},
{ -- a_c_raccoon_01 / PROVISION_RACCOON_FUR_PRISTINE
pelthash    = -305970307,
name        = 'Perfect Raccoon Pelt',
rewarditem1 = 'perfect_raccoon_pelt',
rewarditem2 = 'smallgamemeat',
rewarditem3 = 'raccoonpaw'
},

-- LEGENDARY
{ -- mp_a_c_alligator_01 / Legendary Sun Gator
pelthash    = -1621144167,
name        = 'Legendary Sun Gator Skin',
rewarditem1 = 'legendary_alligator_pelt',
rewarditem2 = 'gator_meat',
rewarditem3 = 'animalfat'
},
{ -- mp_a_c_beaver_01 / Legendary Moon Beaver
pelthash    = -251416414,
name        = 'Legendary Moon Beaver Pelt',
rewarditem1 = 'legendary_beaver_pelt',
rewarditem2 = 'smallgamemeat',
rewarditem3 = 'animalfat'
},
{ -- mp_a_c_boar_01 / Legendary Wakpa Boar
pelthash    = -1249752300,
name        = 'Legendary Wakpa Boar Pelt',
rewarditem1 = 'legendary_boar_pelt',
rewarditem2 = 'pork_meat',
rewarditem3 = 'animalfat'
},
{ -- mp_a_c_cougar_01 / Legendary Maza Cougar
pelthash    = 397926876,
name        = 'Legendary Maza Cougar Pelt',
rewarditem1 = 'legendary_cougar_pelt',
rewarditem2 = 'biggamemeat',
rewarditem3 = 'animalfat'
},
{ -- mp_a_c_coyote_01 / Legendary Midnight Paw Coyote
pelthash    = 1728819413,
name        = 'Legendary Midnight Paw Coyote Pelt',
rewarditem1 = 'legendary_coyote_pelt',
rewarditem2 = 'smallgamemeat',
rewarditem3 = 'animalfat'
},
{ -- mp_a_c_panther_01 / Legendary Ghost Panther
pelthash    = 836208559,
name        = 'Legendary Ghost Panther Pelt',
rewarditem1 = 'legendary_panther_pelt',
rewarditem2 = 'biggamemeat',
rewarditem3 = 'animalfat'
},
{ -- mp_a_c_wolf_01? / Legendary Onyx Wolf
pelthash    = -1548204069,
name        = 'Legendary Onyx Wolf Pelt',
rewarditem1 = 'legendary_wolf_pelt',
rewarditem2 = 'smallgamemeat',
rewarditem3 = 'animalfat'
},
{ -- mp_a_c_wolf_01 / Legendary Emerald Wolf Pelt
pelthash    = -1946740647,
name        = 'Legendary Emerald Wolf Pelt',
rewarditem1 = 'legendary_wolf_pelt',
rewarditem2 = 'smallgamemeat',
rewarditem3 = 'animalfat'
},
{ -- mp_a_c_beaver_01 / Legendary Moon Beaver
pelthash    = -251416414,
name        = 'Legendary Moon Beaver Pelt',
rewarditem1 = 'legendary_moon_beaver_pelt',
rewarditem2 = 'smallgamemeat',
rewarditem3 = 'beavertail'
},
{ -- A_C_Beaver_01 / Legendary Beaver
pelthash    = -2059726619,
name        = 'Legendary Beaver Pelt',
rewarditem1 = 'legendary_beaver_pelt',
rewarditem2 = 'smallgamemeat',
rewarditem3 = 'beavertail'
},
{ -- mp_a_c_beaver_01 / Legendary Zizi Beaver
pelthash    = 121494806,
name        = 'Legendary Zizi Beaver Pelt',
rewarditem1 = 'legendary_zizi_beaver_pelt',
rewarditem2 = 'smallgamemeat',
rewarditem3 = 'beavertail'
},
{ -- mp_a_c_beaver_01 / Legendary Night Beaver
pelthash    = -1787430524,
name        = 'Legendary Night Beaver Pelt',
rewarditem1 = 'legendary_night_beaver_pelt',
rewarditem2 = 'smallgamemeat',
rewarditem3 = 'beavertail'
},

{ -- ga tor
pelthash    = -1202329112,
name        = 'Medium Gator Pelt',
rewarditem1 = 'good_alligator_pelt',
rewarditem2 = 'gator_meat',
rewarditem3 = 'gator_meat'
},
}


Config.Animal = {

    ----------------------------------------------
    -- birds
    ----------------------------------------------
    { -- California Condor : a_c_californiacondor_01
        modelhash   = 1205982615,
        name        = 'California Condor',
        rewarditem1 = 'feather', 
        rewarditem2 = 'bird_meat',
        rewarditem3 = nil,
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    { -- Chicken : a_c_chicken_01
        modelhash   = -2063183075,
        name        = 'Chicken',
        rewarditem1 = 'feather', 
        rewarditem2 = 'chicken_meat',
        rewarditem3 = nil,
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    { -- Neotropic Cormorant : "a_c_cormorant_01
        modelhash   = -2073130256,
        name        = 'Neotropic Cormorant',
        rewarditem1 = 'feather', 
        rewarditem2 = 'bird_meat',
        rewarditem3 = nil,
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    { -- Wooping Crane : a_c_cranewhooping_01
        modelhash   = -564099192,
        name        = 'Wooping Crane',
        rewarditem1 = 'feather', 
        rewarditem2 = 'bird_meat',
        rewarditem3 = nil,
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    { -- Malard Duck
        modelhash   = -1003616053,
        name        = 'Malard Duck',
        rewarditem1 = 'animal_heart', 
        rewarditem2 = 'duck_meat',
        rewarditem3 = nil,
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    { -- Bald Eagle
        modelhash   = 1459778951,
        name        = 'Bald Eagle',
        rewarditem1 = 'feather', 
        rewarditem2 = 'bird_meat',
        rewarditem3 = nil,
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    { -- Egret : a_c_egret_01
        modelhash   = 831859211,
        name        = 'Egret',
        rewarditem1 = 'feather', 
        rewarditem2 = 'bird_meat',
        rewarditem3 = nil,
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    { -- Goose : a_c_goosecanada_01
        modelhash   = 723190474,
        name        = 'Goose',
        rewarditem1 = 'animal_heart', 
        rewarditem2 = 'bird_meat',
        rewarditem3 = 'feather',
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    { -- Hawk : a_c_hawk_01
        modelhash   = -2145890973,
        name        = 'Hawk',
        rewarditem1 = 'hawkfeather', 
        rewarditem2 = 'bird_meat',
        rewarditem3 = nil,
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    { -- Heron : a_c_heron_01
        modelhash   = 1095117488,
        name        = 'Heron',
        rewarditem1 = 'feather', 
        rewarditem2 = 'bird_meat',
        rewarditem3 = nil,
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    { -- Loon : a_c_loon_01
        modelhash   = 386506078,
        name        = 'Loon',
        rewarditem1 = 'animal_heart', 
        rewarditem2 = 'bird_meat',
        rewarditem3 = 'feather',
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    { -- Owl : a_c_owl_01
        modelhash   = -861544272,
        name        = 'Owl',
        rewarditem1 = 'feather', 
        rewarditem2 = 'bird_meat',
        rewarditem3 = nil,
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    { -- Parrot : a_c_parrot_01
        modelhash   = -1797450568,
        name        = 'Parrot',
        rewarditem1 = 'feather', 
        rewarditem2 = 'bird_meat',
        rewarditem3 = nil,
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    { -- Pelican : a_c_pelican_01
        modelhash   = 1265966684,
        name        = 'Pelican',
        rewarditem1 = 'feather', 
        rewarditem2 = 'bird_meat',
        rewarditem3 = nil,
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    { -- Pheasant : a_c_pheasant_01
        modelhash   = 1416324601,
        name        = 'Pheasant',
        rewarditem1 = 'animal_heart', 
        rewarditem2 = 'bird_meat',
        rewarditem3 = 'feather',
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    { -- Pigeon : a_c_pigeon
        modelhash   = 111281960,
        name        = 'Pigeon',
        rewarditem1 = 'bird_meat', 
        rewarditem2 = 'feather',
        rewarditem3 = nil,
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    { -- Prairie Chicken : a_c_prairiechicken_01
        modelhash   = 2079703102,
        name        = 'Prairie Chicken',
        rewarditem1 = 'animal_heart', 
        rewarditem2 = 'chicken_meat',
        rewarditem3 = 'feather',
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    { -- Quail : a_c_quail_01
        modelhash   = 2105463796,
        name        = 'Quail',
        rewarditem2 = 'bird_meat',
        rewarditem3 = 'feather',
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    { -- Rabbit : a_c_rabbit_01
        modelhash   = -541762431,
        name        = 'Rabbit',
        rewarditem1 = 'small_pelt', 
        rewarditem2 = 'smallgamemeat',
        rewarditem3 = 'rabbitpaw',
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    { -- Racoon : a_c_raccoon_01
        modelhash   = 1458540991,
        name        = 'Racoon',
        rewarditem1 = 'small_pelt', 
        rewarditem2 = 'smallgamemeat',
        rewarditem3 = nil,
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    { -- Rat : a_c_rat_01
        modelhash   = 989669666,
        name        = 'Rat',
        rewarditem1 = 'smallgamemeat', 
        rewarditem2 = nil,
        rewarditem3 = nil,
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    { -- a_c_raven_01
        modelhash   = -575340245,
        name        = 'Raven',
        rewarditem1 = 'feather', 
        rewarditem2 = 'bird_meat',
        rewarditem3 = nil,
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    { -- a_c_redfootedbooby_01
        modelhash   = -466687768,
        name        = 'Red Footed Booby',
        rewarditem1 = 'feather', 
        rewarditem2 = 'bird_meat',
        rewarditem3 = nil,
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    { -- a_c_robin_01
        modelhash   = -1210546580,
        name        = 'Robin',
        rewarditem1 = 'bird_meat', 
        rewarditem2 = 'feather',
        rewarditem3 = nil,
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    { -- a_c_rooster_01
        modelhash   = 2023522846,
        name        = 'Rooster',
        rewarditem1 = 'animal_heart', 
        rewarditem2 = 'smallgamemeat',
        rewarditem3 = nil,
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    { -- a_c_roseatespoonbill_01
        modelhash   = -1076508705,
        name        = 'Roseate Spoonbill',
        rewarditem1 = 'feather', 
        rewarditem2 = 'bird_meat',
        rewarditem3 = nil,
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    { -- a_c_seagull_01
        modelhash   = -164963696,
        name        = 'Seagull',
        rewarditem1 = 'feather', 
        rewarditem2 = 'bird_meat',
        rewarditem3 = nil,
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    { -- a_c_skunk_01
        modelhash   = -1211566332,
        name        = 'Skunk',
        rewarditem1 = 'skunkfur', 
        rewarditem2 = 'smallgamemeat',
        rewarditem3 = nil,
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    { -- a_c_snakeblacktailrattle_01
        modelhash   = 846659001,
        name        = 'Snake',
        rewarditem1 = 'reptile_skin', 
        rewarditem2 = 'snake_meat',
        rewarditem3 = 'snakepoison',
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    { -- a_c_snake_01
        modelhash   = -22968827,
        name        = 'Water Snake',
        rewarditem1 = 'watersnake_skin', 
        rewarditem2 = 'snake_meat',
        rewarditem3 = 'snakepoison',
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    { -- a_c_snakeblacktailrattle_01
        modelhash   = 846659001,
        name        = 'Black Tail',
        rewarditem1 = 'blacktail_skin', 
        rewarditem2 = 'snake_meat',
        rewarditem3 = 'snakepoison',
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    { -- a_c_snakeferdelance_01
        modelhash   = 1464167925,
        name        = 'Fer-de-Lance',
        rewarditem1 = 'ferdelance_skin', 
        rewarditem2 = 'snake_meat',
        rewarditem3 = 'snakepoison',
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    { --cottonmouth
        modelhash   = -229688157,
        name        = 'Cotton Mouth',
        rewarditem1 = 'cottonmouth_skin', 
        rewarditem2 = 'snake_meat',
        rewarditem3 = nil,
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    { --red boa
        modelhash   = -1790499186,
        name        = 'Red Boa',
        rewarditem1 = 'redboa_skin', 
        rewarditem2 = 'snake_meat',
        rewarditem3 = nil,
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    
    
    { --western rattlesnake
        modelhash   = 545068538,
        name        = 'Western Diamond Back Rattler',
        rewarditem1 = 'diamondback_skin', 
        rewarditem2 = 'snake_meat',
        rewarditem3 = 'snakepoison',
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    { -- a_c_snakeferdelance_01
        modelhash   = 1464167925,
        name        = 'Snake',
        rewarditem1 = 'reptile_skin', 
        rewarditem2 = 'snake_meat',
        rewarditem3 = 'snakepoison',
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    { -- a_c_songbird_01
        modelhash   = -1910795227,
        name        = 'Song Bird',
        rewarditem1 = 'bird_meat', 
        rewarditem2 = 'feather',
        rewarditem3 = nil,
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    { -- a_c_sparrow_01
        modelhash   = -1028170431,
        name        = 'Sparrow',
        rewarditem1 = 'bird_meat', 
        rewarditem2 = 'feather',
        rewarditem3 = nil,
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    { -- a_c_squirrel_01
        modelhash   = 1465438313,
        name        = 'Squirrel',
        rewarditem1 = 'smallgamemeat', 
        rewarditem2 = nil,
        rewarditem3 = nil,
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    { -- a_c_toad_01
        modelhash   = 1502581273,
        name        = 'Toad',
        rewarditem1 = 'reptile_meat', 
        rewarditem2 = 'toad_legs',
        rewarditem3 = nil,
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
   
    { -- a_c_vulture_01
        modelhash   = 1104697660,
        name        = 'Vulture',
        rewarditem1 = 'bird_meat', 
        rewarditem2 = 'feather',
        rewarditem3 = nil,
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    { -- wild turkey
    modelhash   = -2011226991,
    name        = 'Wild Turkey',
    rewarditem1 = 'bird_meat', 
    rewarditem2 = 'feather',
    rewarditem3 = nil,
    rewarditem4 = nil,
    rewarditem5 = nil,
},
{ -- wild turkey
    modelhash   = -166054593,
    name        = 'Wild Turkey',
    rewarditem1 = 'bird_meat', 
    rewarditem2 = 'feather',
    rewarditem3 = nil,
    rewarditem4 = nil,
    rewarditem5 = nil,
},
{ -- wild turkey
    modelhash   = -466054788,
    name        = 'Wild Turkey',
    rewarditem1 = 'bird_meat', 
    rewarditem2 = 'feather',
    rewarditem3 = nil,
    rewarditem4 = nil,
    rewarditem5 = nil,
},
    { -- a_c_woodpecker_01
        modelhash   = 510312109,
        name        = 'Woodpecker',
        rewarditem1 = 'bird_meat', 
        rewarditem2 = 'feather',
        rewarditem3 = nil,
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    { -- a_c_woodpecker_02
        modelhash   = 729471181,
        name        = 'Woodpecker',
        rewarditem1 = 'bird_meat', 
        rewarditem2 = 'feather',
        rewarditem3 = nil,
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    { -- Snapping turtle
        modelhash   = -407730502,
        name        = 'Snapping Turtle',
        rewarditem1 = 'turtle_meat', 
        rewarditem2 = 'animalfat',
        rewarditem3 = nil,
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    { -- bullfrog
        modelhash   = -930822792,
        name        = 'Bullfrog',
        rewarditem1 = 'frog_meat', 
        rewarditem2 = 'animalfat',
        rewarditem3 = nil,
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    { -- chipmunk
        modelhash   = -1550768676,
        name        = 'Chipmunk',
        rewarditem1 = 'smallgamemeat', 
        rewarditem2 = 'animalfat',
        rewarditem3 = nil,
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    { -- cuban crab
        modelhash   = -2037578922,
        name        = 'Cuban Crab',
        rewarditem1 = 'crab', 
        rewarditem2 = 'crab',
        rewarditem3 = nil,
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    { -- toad
        modelhash   = 1502581273,
        name        = 'Western Toad',
        rewarditem1 = 'toad', 
        rewarditem2 = 'toadpoison',
        rewarditem3 = nil,
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    { -- armadillo
        modelhash   = -1797625440,
        name        = 'Nine Banded Armadillo',
        rewarditem1 = 'smallgamemeat', 
        rewarditem2 = 'armadilloskin',
        rewarditem3 = nil,
        rewarditem4 = nil,
        rewarditem5 = nil,
    },
    { -- green iguana
    modelhash   = -1854059305,
    name        = 'Green Iguana',
    rewarditem1 = 'reptile_meat', 
    rewarditem2 = 'animalfat',
    rewarditem3 = nil,
    rewarditem4 = nil,
    rewarditem5 = nil,
    },
    { -- desert iguana
    modelhash   = -593056309,
    name        = 'Desert Iguana',
    rewarditem1 = 'reptile_meat', 
    rewarditem2 = 'animalfat',
    rewarditem3 = nil,
    rewarditem4 = nil,
    rewarditem5 = nil,
    },
    { -- banded gila iguana
    modelhash   = 45741642,
    name        = 'Banded Gila Iguana',
    rewarditem1 = 'reptile_meat', 
    rewarditem2 = 'animalfat',
    rewarditem3 = nil,
    rewarditem4 = nil,
    rewarditem5 = nil,
    },
    { -- american badger
    modelhash   = -1170118274,
    name        = 'American Badger',
    rewarditem1 = 'smallgamemeat', 
    rewarditem2 = 'animalfat',
    rewarditem3 = 'smallpelt',
    rewarditem4 = nil,
    rewarditem5 = nil,
    },
    { -- wiginia possum
    modelhash   = -1414989025,
    name        = 'Wirginia Possum',
    rewarditem1 = 'smallgamemeat', 
    rewarditem2 = 'animalfat',
    rewarditem3 = 'smallpelt',
    rewarditem4 = nil,
    rewarditem5 = nil,
    },
    { -- american muskrat
    modelhash   = -1134449699,
    name        = 'American Muskrat',
    rewarditem1 = 'smallgamemeat', 
    rewarditem2 = 'animalfat',
    rewarditem3 = 'smallpelt',
    rewarditem4 = nil,
    rewarditem5 = nil,
    },

    --birds

    { -- crow
    modelhash   = 98537260,
    name        = 'Crow',
    rewarditem1 = 'bird_meat', 
    rewarditem2 = 'feather',
    rewarditem3 = 'feather',
    rewarditem4 = nil,
    rewarditem5 = nil,
    },




    -- ALLIGATOR
    { -- a_c_alligator_03 / PROVISION_ALLIGATOR_SKIN_POOR
    modelhash    = 1806153689,
    name        = 'Poor Alligator Skin',
    
    rewarditem1 = 'gator_meat',
    rewarditem2 = 'animalfat'
    },
    { -- a_c_alligator_03 / PROVISION_ALLIGATOR_SKIN
    modelhash   = -802026654,
    name        = 'Good Alligator Skin',
    
    rewarditem1 = 'gator_meat',
    rewarditem2 = 'animalfat'
    },
    { -- a_c_alligator_03 / PROVISION_ALLIGATOR_SKIN_PRISTINE
    modelhash    = -1625078531,
    name        = 'Perfect Alligator Skin',
    
    rewarditem1 = 'gator_meat',
    rewarditem2 = 'animalfat'
    },
    { -- a_c_alligator_01 / PROVISION_ALLIGATOR_SKIN_PRISTINE
    modelhash    = -1892280447,
    name        = 'Perfect Alligator Skin',
 
    rewarditem1 = 'gator_meat',
    rewarditem2 = 'animalfat'
    },
    { -- a_c_alligator_01 / PROVISION_ALLIGATOR_SKIN_PRISTINE
    modelhash    = -2004866590,
    name        = 'Perfect Alligator Skin',
 
    rewarditem1 = 'gator_meat',
    rewarditem2 = 'animalfat'
    },
    { -- a_c_alligator_01 / PROVISION_ALLIGATOR_SKIN_PRISTINE
    modelhash    = -1295720802,
    name        = 'Perfect Alligator Skin',
 
    rewarditem1 = 'gator_meat',
    rewarditem2 = 'animalfat'
    },

}