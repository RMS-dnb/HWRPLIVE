Config = {}

Config.debug    = false
Config.img      = "rsg-inventory/html/images/"

Config.ScriptName = "rms-nativeaccessories"

-------------------
-- NPC SHOP
-------------------
Config.KeyShop          = 'J'
Config.UseTarget	    = flase -- 'true' or 'false'

Config.StoreAlwaysOpen  = true
Config.Payment          = 'money' -- can 'item' or 'money'
Config.PaymentType 	    = 'cash' -- Payment = money you can select 'cash' or 'bloodmoney' / Payment = item you can select 'cash' or 'bloodmoney'

Config.SellTime         = 3000 -- time sell all
Config.OpenTime         = 6 -- hrs : 24hour clock
Config.CloseTime        = 18 -- hrs : 24hour clock

Config.FadeIn           = true -- 'true' or 'false' npc Fade In
Config.DistanceSpawn    = 20 -- number distance npc

-------------------
-- SELL ITEMS X100 (1$ = 100CTVS)
------------------
local typeA = {
	["ind_na1"] = 100,
	["ind_na2"] = 200,
	["ind_na3"] = 200,
	["ind_na4"] = 300,
	["ind_na5"] = 400,
	["ind_na6"] = 120,
	["ind_na7"] = 120,
	["ind_na8"] = 100,
}

local typeB = {
	["ind_headband1"] = 100,
	["ind_headband2"] = 200,
	["ind_headband3"] = 200,
	["ind_headband4"] = 300,
	["ind_headband5"] = 400,
	["ind_headband6"] = 120,
}

local typeC = {
	["ind_headdress1"] = 100,
	["ind_headdress2"] = 200,
	["ind_headdress3"] = 200,
	["ind_headdress4"] = 300,
	["ind_headdress5"] = 400,
	["ind_headdress6"] = 120,
}

local typeD = {
	["ind_ns1"] = 100,
	["ind_ns2"] = 200,
	["ind_ns3"] = 200,
	["ind_ns4"] = 300,
	["ind_ns5"] = 400,
	["ind_ns6"] = 120,
	["ind_ns7"] = 120,
	["ind_ns8"] = 100,
	["ind_ns9"] = 100,
	["ind_ns10"] = 100,
	["ind_ns11"] = 100,
	["ind_ns12"] = 200,
	["ind_ns13"] = 200,
	["ind_ns14"] = 300,
}

local typeE = {
	["ind_feather1"] = 100,
	["ind_feather2"] = 200,
	["ind_feather3"] = 200,
	["ind_feather4"] = 300,
	["ind_feather5"] = 400,
	["ind_feather6"] = 120,
	["ind_feather7"] = 120,
	["ind_feather8"] = 100,
}

local typeF = {
	["ind_cradle1"] = 100,
}

-------------------------
-- LOCATIONS
-------------------------
Config.nativeLocations = {
    {   name        = 'Vendor native',
        id          = 'wattipi-nativevendor',
        model       = `a_m_o_waptownfolk_01`,
        coords      = vector3(-1496.234, -791.744, 102.924),
        coords2     = vector4(-1496.234, -791.744, 102.924, 141.4),
        blipsprite  = 'blip_mp_mission_robbery',
        blipscale   = 0.2,
        showblip    = true,
		shopdata 	= {typeA, typeB, typeC, typeD, typeE, typeF}
    }, --st denis 
}

-------------------------
-- ACCESORIES
-------------------------
Config.UseAccessoriesCommand = false
Config.UsableItems = true

Config.MultiItemSetList = {
    ["ind_na1"] = {
        {ObjectCode = "p_arrowbundle02x",        Attachment = "CP_L_WaistOuter", x= -0.17,y= -0.10999999999999,z= 0.01 , xRot=3.0,              yRot=0.00,     zRot=149.0},
        {ObjectCode = "p_noose03x",        Attachment = "CP_L_WaistOuter", x= -0.05,y= 0.02,z= -0.00999999999999  , xRot=108.0,              yRot=-84.0,     zRot=0.00},
    },
    ["ind_na2"] = {
        {ObjectCode = "p_arrowbundle01x",        Attachment = "CP_Back", x= -0.146,y= 0.033,z= -0.007 , xRot=-15.0,              yRot=-6.0,     zRot=59.0},
        {ObjectCode = "w_repeater_strap01",        Attachment = "CP_Chest", x= -0.235,y= -0.065,z= -0.26 , xRot=112.0,              yRot=3.0,     zRot=41.0},
    },
    ["ind_na3"] = {
        {ObjectCode = "p_cs_indianpipebag01x",        Attachment = "CP_R_Shoulder", x=-0.027,y= -0.152,z= -0.369, xRot=89.0,              yRot=0.00,     zRot=10.0},
        {ObjectCode = "mp005_s_mp_lassoloop01x",        Attachment = "CP_R_Shoulder", x=0.00,y= -0.015,z= 0.044, xRot=0.00,              yRot=87.0,     zRot=0.00},
    },
    ["ind_na4"] = {
        {ObjectCode = "p_noose02x",        Attachment = "CP_R_WaistOuter", x= -0.13999999999999,y= -0.07,z= 0.03 , xRot=146.39999999999932,              yRot=2.4,     zRot=-118.19999999999959},  
        {ObjectCode = "p_peacepipe01x",    Attachment = "CP_R_WaistOuter", x= -0.28,y=-0.08,z= -0.12999999999999 , xRot=-3.6,              yRot=-7.79999999999999,     zRot=-19.2},     
        {ObjectCode = "p_peacepipe02x",    Attachment = "CP_R_WaistOuter", x= -0.27,y= -0.04,z= -0.08 , xRot=9.59999999999999,              yRot=-0.59999999999999,     zRot=-10.19999999999999},     
        {ObjectCode = "p_peacepipe01x",    Attachment = "CP_R_WaistOuter", x= -0.26,y= -0.01999999999999,z= -0.10999999999999 , xRot=9.59999999999999,              yRot=-0.59999999999999,     zRot=-19.2},     
    },
    ["ind_na5"] = {       
        {ObjectCode = "p_cs_owlfeathertrinket",        Attachment = "skel_r_hand", x=0.01,y= 0.00,z= 0.01999999999999, xRot=250.0,              yRot=350.0,     zRot=-84.0},
    },
    ["ind_na6"] = {
        {ObjectCode = "s_ornategoldtrinket01x",        Attachment = "HairScale_B", x=-0.06,y= -0.02,z= 0.00, xRot=18.0,              yRot=3.0,     zRot=94.0},  
        {ObjectCode = "s_cranefeathertrinket01x",        Attachment = "HairScale_B", x=-0.06,y= -0.04,z= -0.08, xRot=22.0,              yRot=-155.0,     zRot=0.00}, 
    },
    ["ind_na7"] = {
        {ObjectCode = "p_indianartifact01x",        Attachment = "CP_R_WaistOuter", x=-0.32,y= 0.1,z= 0.06, xRot=94.79999999999981,              yRot=-4.2,     zRot=51.60000000000007},  
        {ObjectCode = "p_noose02x",        Attachment = "CP_R_WaistOuter", x=-0.08,y= -0.07,z= 0.00, xRot=100.79999999999976,              yRot=-57.00000000000008,     zRot=77.99999999999997},  
    },
    ["ind_na8"] = {
        {ObjectCode = "p_spookynative05x",        Attachment = "CP_Back", x=-1.17,y= -0.74,z= -0.24, xRot=79.79999999999995,              yRot=361.20000000000226,     zRot=121.19999999999956},  
        {ObjectCode = "mp005_s_mp_lassoloop01x",        Attachment = "CP_R_Shoulder", x=0.00,y= -0.015,z= 0.044, xRot=0.00,              yRot=87.0,     zRot=0.00},
    },
    ["ind_headband1"] = {
        {ObjectCode = "p_hat_band_001",        Attachment = "HairScale_B", x= 0,y=  -0.09999999999999,  z= 0,                 xRot=78.0,              yRot=0,     zRot=-2.0},    
        {ObjectCode = "p_cs_eaglefeather02x",  Attachment = "HairScale_B", x= 0.07,y= 0.08,             z= -0.03,             xRot=63.49999999999995, yRot=-18.9, zRot=3.59999999999998}, 
        {ObjectCode = "p_cs_eaglefeather02x",  Attachment = "HairScale_B", x=0.06,y= 0.08,              z= -0.03,             xRot=63.49999999999995, yRot=-0.9,  zRot=-32.39999999999999}, 
        {ObjectCode = "s_heronfeathertrinket", Attachment = "HairScale_B", x=0.09999999999999,y= -0.05, z= -0.10999999999999, xRot=-13.5,             yRot=7.2,   zRot=64.79999999999993}, 
    },
    ["ind_headband2"] = {
        {ObjectCode = "p_hat_band_012", Attachment = "HairScale_B",x=0,y= -0.09999999999999,z= 0, xRot=85.0, yRot=0, zRot=0},    
        {ObjectCode = "s_cs_californiafeather_01x", Attachment = "HairScale_B",x=-0.03,y= 0.09999999999999,z= -0.02, xRot=-136.0, yRot=172.0, zRot=-196.0},   
        {ObjectCode = "s_heronfeathertrinket", Attachment = "HairScale_B",x=0.08,y= -0.02999999999999,z= -0.09999999999999, xRot=-0, yRot=7.0, zRot=-91.0},   
        {ObjectCode = "s_heronfeathertrinket", Attachment = "HairScale_B",x=-0.07,y= -0.02999999999999,z= -0.09999999999999, xRot=-0, yRot=7.0, zRot=-57.0},
    },
    ["ind_headband3"] = {
        {ObjectCode = "p_hat_band_011", Attachment = "HairScale_B",x=0,y= -0.09999999999999,z= 0, xRot=85.0, yRot=0, zRot=0},    
        {ObjectCode = "s_heronfeathertrinket", Attachment = "HairScale_B",x=0.08,y= -0.04,z= -0.10999999999999, xRot=0, yRot=4.0, zRot=75.0}, 
        {ObjectCode = "s_cs_roseatefeather_04x", Attachment = "HairScale_B",x=-0.03,y= 0.09999999999999,z= -0.04, xRot=-66.0, yRot=22.0, zRot=0}, 
        {ObjectCode = "s_cs_roseatefeather_04x", Attachment = "HairScale_B",x=0,y= 0.09999999999999,z= -0.04, xRot=-66.0, yRot=0, zRot=0}, 
        {ObjectCode = "s_cs_roseatefeather_04x", Attachment = "HairScale_B",x=0.02,y= 0.09999999999999,z= -0.04, xRot=-57.0, yRot=-3.0, zRot=-25.0},
        {ObjectCode = "s_turtleshelltrinket01x", Attachment = "HairScale_B",x=0,y= 0.09999999999999,z= -0.01999999999999, xRot=-26.0, yRot=0, zRot=179.0},  
    },
    ["ind_headband4"] = {
        {ObjectCode = "p_hat_band_001", Attachment = "HairScale_B",x=0,y= -0.09999999999999,z= 0.00999999999999, xRot=72.0, yRot=0, zRot=0},   
        {ObjectCode = "p_hat_band_001", Attachment = "HairScale_B",x=0,y= -0.09,z= 0.03, xRot=69.0, yRot=0, zRot=0},  
        {ObjectCode = "p_hat_band_001", Attachment = "HairScale_B",x=0,y= -0.07,z= 0.06, xRot=51.0, yRot=0, zRot=0},    
        {ObjectCode = "p_cs_eaglefeather04x", Attachment = "HairScale_B",x=0, y=-0.04,z= 0.05, xRot=42.0, yRot=0, zRot=0},  
        {ObjectCode = "p_cs_eaglefeather04x", Attachment = "HairScale_B",x=0.04,y= -0.04,z= 0.04, xRot=43.0, yRot=0, zRot=3.0},
        {ObjectCode = "p_cs_eaglefeather04x", Attachment = "HairScale_B",x=-0.05,y= -0.04,z= 0, xRot=55.0, yRot=0, zRot=0},
        {ObjectCode = "p_cs_owlfeathertrinket", Attachment = "HairScale_B",x=-0.05,y= -0.06,z= 0.02, xRot=-9.0, yRot=-8.0, zRot=-54.0},
    },
    ["ind_headband5"] = {
        {ObjectCode = "p_hat_band_002", Attachment = "HairScale_B",x=0,y= -0.09999999999999,z= -0.01, xRot=83.59999999999995, yRot=0, zRot=1.1},   
        {ObjectCode = "s_duckfeather01x", Attachment = "HairScale_B",x=0.08,y= -0.05,z= -0.02, xRot=0, yRot=0, zRot=52.80000000000004}, 
        {ObjectCode = "s_cranefeathertrinket01x", Attachment = "HairScale_B",x=0,y= 0.12999999999999,z= 0.03, xRot=-26.40000000000001, yRot=4.4, zRot=-3.3},  
    },
    ["ind_headband6"] = {
        {ObjectCode = "s_masknative01x", Attachment = "HairScale_B", x = 0,y= -0.08,z= -0.19, xRot= 0, yRot= 0, zRot= 0},
        {ObjectCode = "p_hat_band_006", Attachment = "HairScale_B", x = 0,y= -0.09,z= 0, xRot= 83.0, yRot= 0, zRot=-1.0},
        {ObjectCode = "s_spoonbillfeather01x", Attachment = "HairScale_B", x = -0.03,y= 0.11999999999999,z= -0.01999999999999, xRot= 53.0, yRot= -35.0, zRot=0},
        {ObjectCode = "s_spoonbillfeather01x", Attachment = "HairScale_B", x = -0.03,y= 0.11999999999999,z= -0.01999999999999, xRot= 53.0, yRot=   0, zRot=0},
        {ObjectCode = "s_spoonbillfeather01x", Attachment = "HairScale_B", x = -0.03,y= 0.11999999999999,z= -0.01999999999999, xRot= 53.0, yRot=  26.0, zRot=0},
    },
    ["ind_headdress1"] = {
        {ObjectCode = "p_hat_band_001",        Attachment = "HairScale_B", x=0.002,y= -0.09999999999999,z= 0.011, xRot=80.0,              yRot=0.00,     zRot=0.00,}, 
        {ObjectCode = "p_cs_eaglefeather04x",        Attachment = "HairScale_B", x=-0.01,y= -0.03,z= 0.04999999999999, xRot=37.1,              yRot=0.00,     zRot=0.00}, 
        {ObjectCode = "p_cs_eaglefeather04x",        Attachment = "HairScale_B", x=0.00,y= 0.00,z= -0.00999999999999, xRot=-17.49999999999999,              yRot=0.00,     zRot=0.00}, 
        {ObjectCode = "p_cs_eaglefeather04x",        Attachment = "HairScale_B", x=0.03,y= 0.00,z= -0.00999999999999, xRot=2.8,              yRot=0.00,     zRot=0.00}, 
        {ObjectCode = "p_cs_eaglefeather04x",        Attachment = "HairScale_B", x=0.02,y= 0.00,z= -0.00999999999999, xRot=2.8,              yRot=0.00,     zRot=0.00}, 
        {ObjectCode = "p_cs_eaglefeather04x",        Attachment = "HairScale_B", x=0.05,y= 0.00999999999999,z= 0.01999999999999, xRot=12.6,              yRot=0.00,     zRot=0.00}, 
        {ObjectCode = "p_cs_eaglefeather04x",        Attachment = "HairScale_B", x=-0.00999999999999,y= 0.00999999999999,z= 0.01999999999999, xRot=12.6,              yRot=0.00,     zRot=0.00}, 
        {ObjectCode = "p_cs_eaglefeather04x",        Attachment = "HairScale_B", x=0.02,y= 0.02,z= 0.05, xRot=28.69999999999998,              yRot=0.00,     zRot=0.00}, 
        {ObjectCode = "s_cateyetrinket01x_1",        Attachment = "HairScale_B", x=0.00,y= -0.09499999999999,z= 0.01999999999999, xRot=80.40000000000006,              yRot=1.5,     zRot=-6.0}, 
    },
    ["ind_headdress2"] = {
        {ObjectCode = "p_hat_band_012",        Attachment = "HairScale_B", x=0.001,y= 0.108,z= -0.041, xRot=-100.40000000000035,              yRot=0.00,     zRot=0.00,}, 
        {ObjectCode = "p_cs_eaglefeather04x",        Attachment = "HairScale_B", x=-0.08,y= 0.071,z= -0.01999999999999, xRot=20.20000000000001,              yRot=20.99999999999998,     zRot=45.59999999999995}, 
        {ObjectCode = "p_cs_eaglefeather04x",        Attachment = "HairScale_B", x=-0.05299999999999,y=0.094,z= -0.053, xRot=53.39999999999989,              yRot=-2.20000000000001,     zRot=28.40000000000002}, 
        {ObjectCode = "p_cs_eaglefeather04x",        Attachment = "HairScale_B", x=0.051,y= 0.095,z= -0.053, xRot=53.39999999999989,              yRot=-2.20000000000001,     zRot=-27.99999999999991}, 
        {ObjectCode = "p_cs_eaglefeather04x",        Attachment = "HairScale_B", x=0.064,y= 0.099,z= -0.051, xRot=26.59999999999998,              yRot=-2.20000000000001,     zRot=-53.19999999999982}, 
        {ObjectCode = "s_spoonbillfeather01x",        Attachment = "HairScale_B", x=0.04,y= 0.085,z= -0.046, xRot=73.99999999999997,              yRot=43.59999999999991,     zRot=-11.2}, 
        {ObjectCode = "s_spoonbillfeather01x",        Attachment = "HairScale_B", x=-0.05,y= 0.085,z= -0.028, xRot=75.19999999999999,              yRot=-28.39999999999996,     zRot=19.99999999999999}, 
        {ObjectCode = "s_cranefeathertrinket01x",        Attachment = "HairScale_B", x=-0.012,y= 0.113,z= -0.133, xRot=-166.80000000000024,              yRot=8.79999999999999,     zRot=-28.80000000000001}, 
        {ObjectCode = "s_cranefeathertrinket01x",        Attachment = "HairScale_B", x=0.057,y= 0.103,z= -0.123, xRot=-162.80000000000018,              yRot=0.8,     zRot=-28.80000000000001}, 
        {ObjectCode = "s_cranefeathertrinket01x",        Attachment = "HairScale_B", x=0.021,y= 0.108,z= -0.13, xRot=-166.80000000000024,              yRot=8.79999999999999,     zRot=-28.80000000000001}, 
        {ObjectCode = "s_cranefeathertrinket01x",        Attachment = "HairScale_B", x=-0.049,y= 0.113,z= -0.132, xRot=-166.80000000000024,              yRot=8.79999999999999,     zRot=-28.80000000000001},  
    },
    ["ind_headdress3"] = {
        {ObjectCode = "p_hat_band_002",        Attachment = "HairScale_B", x=0.00,y= -0.09999999999999,z= 0.00, xRot=78.0,              yRot=0.00,     zRot=0.00,}, 
        {ObjectCode = "p_indiandream03x",        Attachment = "HairScale_B", x=-0.036,y= -0.012,z= -0.093, xRot=117.0,              yRot=0.00,     zRot=0.00}, 
        {ObjectCode = "s_ornategoldtrinket01x",        Attachment = "HairScale_B", x=0.082,y= 0.019,z= -0.014, xRot=0.00,              yRot=4.0,     zRot=-271.0}, 
    },
    ["ind_headdress4"] = {
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=-0.05,y= -0.03899999999999,z= -0.04499999999999, xRot=-27.30000000000015,              yRot=-17.39999999999998,     zRot=0.00},    
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=-0.039,y= -0.06899999999999,z= -0.02799999999999, xRot=-27.30000000000015,              yRot=-16.99999999999997,     zRot=0.00},    
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=-0.058,y= -0.02599999999999,z= -0.04499999999999, xRot=-48.00000000000044,              yRot=-17.39999999999998,     zRot=-0.5},  
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=-0.066,y= -0.00999999999999,z= -0.04499999999999, xRot=-65.80000000000057,              yRot=-17.39999999999998,     zRot=-0.5},  
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=-0.068,y= 0.013,z= -0.04999999999999, xRot=-85.29999999999946,              yRot=-17.39999999999998,     zRot=-0.5},  
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=0.048,y= 0.021,z= -0.078, xRot=-96.09999999999884,              yRot=-17.39999999999998,     zRot=-16.99999999999997},  
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=-0.062,y= 0.015,z= -0.087, xRot=-99.29999999999866,              yRot=-17.39999999999998,     zRot=-0.5},  
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=0.048,y= 0.021,z= -0.03399999999999, xRot=-83.39999999999957,              yRot=-17.39999999999998,     zRot=-16.29999999999996},  
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=0.054,y= 0.026,z= -0.03699999999999, xRot=-62.70000000000065,              yRot=9.39999999999998,     zRot=-16.29999999999996},  
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=0.057,y= 0.028,z= -0.02299999999999, xRot=-37.9000000000003,              yRot=12.89999999999996,     zRot=-16.29999999999996},  
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=0.054,y= 0.001,z= -0.02499999999999, xRot=-20.00000000000004,              yRot=13.69999999999996,     zRot=-16.29999999999996}, 
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=0.037,y= -0.04999999999999,z= -0.02499999999999, xRot=-20.00000000000004,              yRot=13.69999999999996,     zRot=-16.29999999999996},   
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=0.032,y= -0.077,z= -0.03299999999999, xRot=-14.49999999999999,              yRot=0.00,     zRot=0.00},   
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=0.00,y= -0.085,z= -0.03299999999999, xRot=-14.49999999999999,              yRot=0.00,     zRot=0.00},   
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=-0.036,y= -0.077,z= -0.03599999999999, xRot=-14.49999999999999,              yRot=0.00,     zRot=0.00},  
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=-0.045,y= -0.073,z= -0.044, xRot=-22.39999999999998,              yRot=-1.6,     zRot=6.8},  
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=-0.045,y= -0.02699999999999,z= -0.049, xRot=-37.19999999999993,              yRot=-1.6,     zRot=34.39999999999994}, 
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=-0.056,y= -0.01399999999999,z= -0.039, xRot=-58.79999999999998,              yRot=-27.99999999999999,     zRot=-2.80000000000004},
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=-0.065,y= 0.013,z= -0.039, xRot=-75.60000000000002,              yRot=13.99999999999999,     zRot=10.39999999999995},      
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=-0.055,y= 0.003,z= -0.069, xRot=-90.00000000000006,              yRot=16.39999999999999,     zRot=4.39999999999995},  
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=0.03,y= -0.03,z= -0.03, xRot=0.00,              yRot=12.19999999999999,     zRot=74.6000000000001},  
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=0.03,y= -0.01,z= -0.009, xRot=-0.01,              yRot=25.19999999999999,     zRot=40.80000000000004},  
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=0.04699999999999,y= -0.02,z= -0.008, xRot=-10.79999999999999,              yRot=27.59999999999999,     zRot=40.80000000000004},  
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=0.057,y= 0.026,z= -0.035, xRot=-0.008,              yRot=10.70000000000001,     zRot=58.39999999999992},  
        {ObjectCode = "p_indianfan01x",        Attachment = "HairScale_B", x=0.054,y= 0.022,z= -0.057, xRot=-36.8,              yRot=24.00000000000001,     zRot=4.0},  
        {ObjectCode = "p_indianfan01x",        Attachment = "HairScale_B", x=0.051,y= 0.00999999999999,z= -0.02, xRot=-31.20000000000001,              yRot=27.20000000000001,     zRot=-3.2},  
        {ObjectCode = "p_indianfan01x",        Attachment = "HairScale_B", x=0.05,y= 0.04,z= -0.06, xRot=-66.0,              yRot=29.0,     zRot=-14.0},  
        {ObjectCode = "p_indianfan01x",        Attachment = "HairScale_B", x=0.053,y= 0.046,z= -0.05, xRot=-85.0,              yRot=16.0,     zRot=-21.0},  
        {ObjectCode = "p_indianfan01x",        Attachment = "HairScale_B", x=0.06,y= 0.05,z= -0.00999999999999, xRot=-55.80000000000008,              yRot=25.20000000000001,     zRot=-11.1}, 
        {ObjectCode = "p_indianfan01x",        Attachment = "HairScale_B", x=0.04,y= -0.04,z= -0.08,  xRot=-104.39999999999972,             yRot=38.40000000000005,     zRot=-18.9}, 
        {ObjectCode = "p_indianfan01x",        Attachment = "HairScale_B", x=0.06,y= 0.03,z= -0.04,  xRot=-70.20000000000005,             yRot=25.20000000000001,     zRot=-8.7},     
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=0.05,y= 0.01999999999999,z= -0.09,  xRot=-104.99999999999936,             yRot=0.00,     zRot=-14.70000000000001},    
        {ObjectCode = "p_hat_band_004",        Attachment = "HairScale_B", x=-0.003,y= 0.09399999999999,z= -0.069, xRot=-105.60000000000043,              yRot=0.79999999999999,     zRot=0.8},  
        {ObjectCode = "p_hat_band_004",        Attachment = "HairScale_B", x=-0.003,y= 0.09699999999999,z= -0.05199999999999, xRot=-105.60000000000043,              yRot=0.79999999999999,     zRot=0.8},  
        {ObjectCode = "p_hat_band_004",        Attachment = "HairScale_B", x=-0.003,y= 0.10099999999999,z= -0.03199999999999, xRot=-105.60000000000043,              yRot=0.79999999999999,     zRot=0.8}, 
        {ObjectCode = "p_hat_band_004",        Attachment = "HairScale_B", x=-0.003,y= 0.105,z= -0.01199999999999, xRot=-105.60000000000043,              yRot=0.79999999999999,     zRot=0.8}, 
        {ObjectCode = "p_hat_band_004",        Attachment = "HairScale_B", x=-0.003,y= 0.105,z= -0.01599999999999, xRot=-112.10000000000007,              yRot=0.79999999999999,     zRot=0.8}, 
        {ObjectCode = "p_indianrattle01x",        Attachment = "HairScale_B", x=-0.045,y= -0.054,z= 0.034, xRot=168.9000000000013,              yRot=3.9,     zRot=-72.09999999999998}, 
        {ObjectCode = "p_indianrattle01x",        Attachment = "HairScale_B", x=0.06499999999999,y= -0.04799999999999,z= 0.03, xRot=173.80000000000035,              yRot=0.39999999999999,     zRot=71.3999999999998}, 
        {ObjectCode = "s_cranefeathertrinket01x",        Attachment = "HairScale_B", x=0.08,y= -0.03,z= -0.07, xRot=197.9000000000006,              yRot=-2.99999999999998,     zRot=274.30000000000166}, 
        {ObjectCode = "s_cranefeathertrinket01x",        Attachment = "HairScale_B", x=-0.07,y= -0.04,z= -0.04, xRot=208.30000000000075,              yRot=-2.99999999999999,     zRot=80.49999999999966}, 
        {ObjectCode = "s_cranefeathertrinket01x",        Attachment = "HairScale_B", x=0.087,y= 0.023,z= -0.084, xRot=205.50000000000065,              yRot=-1.7,     zRot=295.60000000000036}, 
        {ObjectCode = "s_cranefeathertrinket01x",        Attachment = "HairScale_B", x=-0.08,y= 0.01,z= -0.06, xRot=200.00000000000068,              yRot=24.00000000000001,     zRot=60.79999999999991}, 
        {ObjectCode = "s_cranefeathertrinket01x",        Attachment = "HairScale_B", x=-0.01999999999999,y= 0.08,z= -0.11999999999999, xRot=-147.19999999999996,              yRot=35.2,     zRot=-4.79999999999999}, 
        {ObjectCode = "s_cranefeathertrinket01x",        Attachment = "HairScale_B", x=0.01,y= 0.08,z= -0.15, xRot=-154.40000000000006,              yRot=11.99999999999999,     zRot=-4.79999999999999}, 
        {ObjectCode = "p_cs_owlfeathertrinket",        Attachment = "HairScale_B", x=0.00,y= -0.09,z= 0.05, xRot=11.2,              yRot=179.2000000000004,     zRot=-3.99999999999999}, 
        {ObjectCode = "s_cateyetrinket01x_1",        Attachment = "HairScale_B", x=0.09,y= -0.00999999999999,z= -0.01999999999999, xRot=91.60000000000022,              yRot=4.8,     zRot=88.00000000000018}, 
        {ObjectCode = "s_cateyetrinket01x_1",        Attachment = "HairScale_B", x=-0.09,y= 0.01,z= -0.01999999999999, xRot=90.80000000000021,              yRot=-6.4,     zRot=-84.00000000000011}, 
    },
    ["ind_headdress5"] = {
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=-0.05,y= -0.03899999999999,z= -0.04499999999999, xRot=-27.30000000000015,              yRot=-17.39999999999998,     zRot=0.00},    
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=-0.039,y= -0.06899999999999,z= -0.02799999999999, xRot=-27.30000000000015,              yRot=-16.99999999999997,     zRot=0.00},    
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=-0.058,y= -0.02599999999999,z= -0.04499999999999, xRot=-48.00000000000044,              yRot=-17.39999999999998,     zRot=-0.5},  
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=-0.066,y= -0.00999999999999,z= -0.04499999999999, xRot=-65.80000000000057,              yRot=-17.39999999999998,     zRot=-0.5},  
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=-0.068,y= 0.013,z= -0.04999999999999, xRot=-85.29999999999946,              yRot=-17.39999999999998,     zRot=-0.5},  
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=0.048,y= 0.021,z= -0.078, xRot=-96.09999999999884,              yRot=-17.39999999999998,     zRot=-16.99999999999997},  
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=-0.062,y= 0.015,z= -0.087, xRot=-99.29999999999866,              yRot=-17.39999999999998,     zRot=-0.5},  
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=0.048,y= 0.021,z= -0.03399999999999, xRot=-83.39999999999957,              yRot=-17.39999999999998,     zRot=-16.29999999999996},  
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=0.054,y= 0.026,z= -0.03699999999999, xRot=-62.70000000000065,              yRot=9.39999999999998,     zRot=-16.29999999999996},  
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=0.057,y= 0.028,z= -0.02299999999999, xRot=-37.9000000000003,              yRot=12.89999999999996,     zRot=-16.29999999999996},  
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=0.054,y= 0.001,z= -0.02499999999999, xRot=-20.00000000000004,              yRot=13.69999999999996,     zRot=-16.29999999999996}, 
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=0.037,y= -0.04999999999999,z= -0.02499999999999, xRot=-20.00000000000004,              yRot=13.69999999999996,     zRot=-16.29999999999996},   
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=0.032,y= -0.077,z= -0.03299999999999, xRot=-14.49999999999999,              yRot=0.00,     zRot=0.00},   
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=0.00,y= -0.085,z= -0.03299999999999, xRot=-14.49999999999999,              yRot=0.00,     zRot=0.00},   
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=-0.036,y= -0.077,z= -0.03599999999999, xRot=-14.49999999999999,              yRot=0.00,     zRot=0.00},  
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=-0.045,y= -0.073,z= -0.044, xRot=-22.39999999999998,              yRot=-1.6,     zRot=6.8},  
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=-0.045,y= -0.02699999999999,z= -0.049, xRot=-37.19999999999993,              yRot=-1.6,     zRot=34.39999999999994}, 
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=-0.056,y= -0.01399999999999,z= -0.039, xRot=-58.79999999999998,              yRot=-27.99999999999999,     zRot=-2.80000000000004},
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=-0.065,y= 0.013,z= -0.039, xRot=-75.60000000000002,              yRot=13.99999999999999,     zRot=10.39999999999995},      
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=-0.055,y= 0.003,z= -0.069, xRot=-90.00000000000006,              yRot=16.39999999999999,     zRot=4.39999999999995},  
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=0.03,y= -0.03,z= -0.03, xRot=0.00,              yRot=12.19999999999999,     zRot=74.6000000000001},  
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=0.03,y= -0.01,z= -0.009, xRot=-0.01,              yRot=25.19999999999999,     zRot=40.80000000000004},  
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=0.04699999999999,y= -0.02,z= -0.008, xRot=-10.79999999999999,              yRot=27.59999999999999,     zRot=40.80000000000004},  
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=0.057,y= 0.026,z= -0.035, xRot=-0.008,              yRot=10.70000000000001,     zRot=58.39999999999992},  
        {ObjectCode = "p_indianfan01x",        Attachment = "HairScale_B", x=0.054,y= 0.022,z= -0.057, xRot=-36.8,              yRot=24.00000000000001,     zRot=4.0},  
        {ObjectCode = "p_indianfan01x",        Attachment = "HairScale_B", x=0.051,y= 0.00999999999999,z= -0.02, xRot=-31.20000000000001,              yRot=27.20000000000001,     zRot=-3.2},  
        {ObjectCode = "p_indianfan01x",        Attachment = "HairScale_B", x=0.05,y= 0.04,z= -0.06, xRot=-66.0,              yRot=29.0,     zRot=-14.0},  
        {ObjectCode = "p_indianfan01x",        Attachment = "HairScale_B", x=0.053,y= 0.046,z= -0.05, xRot=-85.0,              yRot=16.0,     zRot=-21.0},  
        {ObjectCode = "p_indianfan01x",        Attachment = "HairScale_B", x=0.06,y= 0.05,z= -0.00999999999999, xRot=-55.80000000000008,              yRot=25.20000000000001,     zRot=-11.1}, 
        {ObjectCode = "p_indianfan01x",        Attachment = "HairScale_B", x=0.04,y= -0.04,z= -0.08,  xRot=-104.39999999999972,             yRot=38.40000000000005,     zRot=-18.9}, 
        {ObjectCode = "p_indianfan01x",        Attachment = "HairScale_B", x=0.06,y= 0.03,z= -0.04,  xRot=-70.20000000000005,             yRot=25.20000000000001,     zRot=-8.7},     
        {ObjectCode = "p_indianfan02x",        Attachment = "HairScale_B", x=0.05,y= 0.01999999999999,z= -0.09,  xRot=-104.99999999999936,             yRot=0.00,     zRot=-14.70000000000001},    
        {ObjectCode = "p_hat_band_004",        Attachment = "HairScale_B", x=-0.003,y= 0.09399999999999,z= -0.069, xRot=-105.60000000000043,              yRot=0.79999999999999,     zRot=0.8},  
        {ObjectCode = "p_hat_band_004",        Attachment = "HairScale_B", x=-0.003,y= 0.09699999999999,z= -0.05199999999999, xRot=-105.60000000000043,              yRot=0.79999999999999,     zRot=0.8},  
        {ObjectCode = "p_hat_band_004",        Attachment = "HairScale_B", x=-0.003,y= 0.10099999999999,z= -0.03199999999999, xRot=-105.60000000000043,              yRot=0.79999999999999,     zRot=0.8}, 
        {ObjectCode = "p_hat_band_004",        Attachment = "HairScale_B", x=-0.003,y= 0.105,z= -0.01199999999999, xRot=-105.60000000000043,              yRot=0.79999999999999,     zRot=0.8}, 
        {ObjectCode = "p_hat_band_004",        Attachment = "HairScale_B", x=-0.003,y= 0.105,z= -0.01599999999999, xRot=-112.10000000000007,              yRot=0.79999999999999,     zRot=0.8}, 
        {ObjectCode = "p_hat_band_004",        Attachment = "HairScale_B", x=0.00,y= -0.106,z= 0.037, xRot=52.5,              yRot=0.00,     zRot=0.00}, 
        {ObjectCode = "p_hat_band_004",        Attachment = "HairScale_B", x=0.00,y= -0.12,z= -0.014, xRot=71.5,              yRot=0.00,     zRot=0.00}, 
        {ObjectCode = "p_hat_band_004",        Attachment = "HairScale_B", x=0.00,y= -0.117,z= 0.004, xRot=71.5,              yRot=0.00,     zRot=0.00}, 
        {ObjectCode = "p_hat_band_004",        Attachment = "HairScale_B", x=0.00,y= -0.111,z= 0.021, xRot=58.0,              yRot=0.00,     zRot=0.00}, 
        {ObjectCode = "p_indianrattle01x",        Attachment = "HairScale_B", x=-0.045,y= -0.054,z= 0.034, xRot=168.9000000000013,              yRot=3.9,     zRot=-72.09999999999998}, 
        {ObjectCode = "p_indianrattle01x",        Attachment = "HairScale_B", x=0.06499999999999,y= -0.04799999999999,z= 0.03, xRot=173.80000000000035,              yRot=0.39999999999999,     zRot=71.3999999999998}, 
        {ObjectCode = "s_cranefeathertrinket01x",        Attachment = "HairScale_B", x=0.08,y= -0.03,z= -0.07, xRot=197.9000000000006,              yRot=-2.99999999999998,     zRot=274.30000000000166}, 
        {ObjectCode = "s_cranefeathertrinket01x",        Attachment = "HairScale_B", x=-0.07,y= -0.04,z= -0.04, xRot=208.30000000000075,              yRot=-2.99999999999999,     zRot=80.49999999999966}, 
        {ObjectCode = "s_cranefeathertrinket01x",        Attachment = "HairScale_B", x=0.087,y= 0.023,z= -0.084, xRot=205.50000000000065,              yRot=-1.7,     zRot=295.60000000000036}, 
        {ObjectCode = "s_cranefeathertrinket01x",        Attachment = "HairScale_B", x=-0.08,y= 0.01,z= -0.06, xRot=200.00000000000068,              yRot=24.00000000000001,     zRot=60.79999999999991}, 
        {ObjectCode = "s_cranefeathertrinket01x",        Attachment = "HairScale_B", x=-0.01999999999999,y= 0.08,z= -0.11999999999999, xRot=-147.19999999999996,              yRot=35.2,     zRot=-4.79999999999999}, 
        {ObjectCode = "s_cranefeathertrinket01x",        Attachment = "HairScale_B", x=0.01,y= 0.08,z= -0.15, xRot=-154.40000000000006,              yRot=11.99999999999999,     zRot=-4.79999999999999}, 
        {ObjectCode = "p_cs_owlfeathertrinket",        Attachment = "HairScale_B", x=0.00,y= -0.09,z= 0.05, xRot=11.2,              yRot=179.2000000000004,     zRot=-3.99999999999999}, 
        {ObjectCode = "s_cateyetrinket01x_1",        Attachment = "HairScale_B", x=0.09,y= -0.00999999999999,z= -0.01999999999999, xRot=91.60000000000022,              yRot=4.8,     zRot=88.00000000000018}, 
        {ObjectCode = "s_cateyetrinket01x_1",        Attachment = "HairScale_B", x=-0.09,y= 0.01,z= -0.01999999999999, xRot=90.80000000000021,              yRot=-6.4,     zRot=-84.00000000000011}, 
        {ObjectCode = "s_masknative01x",        Attachment = "HairScale_B", x=-0.002,y= -0.099,z= -0.193, xRot=-8.5,              yRot=0.5,     zRot=-2.0}, 
    },
    ["ind_headdress6"] = {
        {ObjectCode = "themlohub_native_headdress01",        Attachment = "HairScale_B", x=0.00,y= -0.03,z= -0.05, xRot=0.00,              yRot=0.00,     zRot=93.0,}, 
    },
    ["ind_ns1"] = {
        {ObjectCode = "mlohub_shield01",           Attachment = "CP_Back",             x= -0.24,y= 0.00,z= -0.01999999999999,             xRot=96.0,                 yRot=-28.0,                      zRot=4.0},    
        {ObjectCode = "w_repeater_strap01",         Attachment = "CP_Chest",            x= -0.235,      y= -0.065,              z= -0.26 ,              xRot=112.0,                 yRot=3.0,                       zRot=41.0},
    },
    ["ind_ns2"] = {
        {ObjectCode = "mlohub_shield02",           Attachment = "CP_Back",             x= -0.24,y= 0.00,z= -0.01999999999999,             xRot=96.0,                 yRot=-28.0,                      zRot=4.0},    
        {ObjectCode = "w_repeater_strap01",         Attachment = "CP_Chest",            x= -0.235,      y= -0.065,              z= -0.26 ,              xRot=112.0,                 yRot=3.0,                       zRot=41.0}, 
    },
    ["ind_ns3"] = {
        {ObjectCode = "mlohub_shield03",           Attachment = "CP_Back",             x= -0.24,y= 0.00,z= -0.01999999999999,             xRot=96.0,                 yRot=-28.0,                      zRot=4.0},    
        {ObjectCode = "w_repeater_strap01",         Attachment = "CP_Chest",            x= -0.235,      y= -0.065,              z= -0.26 ,              xRot=112.0,                 yRot=3.0,                       zRot=41.0}, 
    },
    ["ind_ns4"] = {
        {ObjectCode = "mlohub_shield04",           Attachment = "CP_Back",             x= -0.24,y= 0.00,z= -0.01999999999999,             xRot=96.0,                 yRot=-28.0,                      zRot=4.0},    
        {ObjectCode = "w_repeater_strap01",         Attachment = "CP_Chest",            x= -0.235,      y= -0.065,              z= -0.26 ,              xRot=112.0,                 yRot=3.0,                       zRot=41.0}, 
    },
    ["ind_ns5"] = {
        {ObjectCode = "mlohub_shield05",           Attachment = "CP_Back",             x= -0.24,y= 0.00,z= -0.01999999999999,             xRot=96.0,                 yRot=-28.0,                      zRot=4.0},    
        {ObjectCode = "w_repeater_strap01",         Attachment = "CP_Chest",            x= -0.235,      y= -0.065,              z= -0.26 ,              xRot=112.0,                 yRot=3.0,                       zRot=41.0}, 
    },
    ["ind_Ns6"] = {
        {ObjectCode = "mlohub_shield06",           Attachment = "CP_Back",             x= -0.24,y= 0.00,z= -0.01999999999999,             xRot=96.0,                 yRot=-28.0,                      zRot=4.0},    
        {ObjectCode = "w_repeater_strap01",         Attachment = "CP_Chest",            x= -0.235,      y= -0.065,              z= -0.26 ,              xRot=112.0,                 yRot=3.0,                       zRot=41.0}, 
    },
    ["ind_ns7"] = {
        {ObjectCode = "mlohub_shield07",           Attachment = "CP_Back",             x= -0.24,y= 0.00,z= -0.01999999999999,             xRot=96.0,                 yRot=-28.0,                      zRot=4.0},    
        {ObjectCode = "w_repeater_strap01",         Attachment = "CP_Chest",            x= -0.235,      y= -0.065,              z= -0.26 ,              xRot=112.0,                 yRot=3.0,                       zRot=41.0}, 
    },
    ["ind_ns8"] = {
        {ObjectCode = "mlohub_shield01",           Attachment = "CP_R_UpperArm",             x= 0.18,y= -0.04,z= 0.03,             xRot=125.0,                 yRot=40.0,                      zRot=-53.0},    
        {ObjectCode = "s_ropehogtiehandssmall01x",         Attachment = "CP_R_ForeArm",            x= -0.12999999999999,y= 0.01,z= -0.02 ,              xRot=95.0,                 yRot=0.00,                       zRot=0.00}, 
        {ObjectCode = "s_ropehogtiehands01x",         Attachment = "CP_R_ForeArm",            x= -0.15,y= 0.00,z= -0.03 ,              xRot=0.00,                 yRot=33.0,                       zRot=0.00}, 
    },
    ["ind_ns9"] = {
        {ObjectCode = "mlohub_shield02",           Attachment = "CP_R_UpperArm",             x= 0.18,y= -0.04,z= 0.03,             xRot=125.0,                 yRot=40.0,                      zRot=-53.0},    
        {ObjectCode = "s_ropehogtiehandssmall01x",         Attachment = "CP_R_ForeArm",            x= -0.12999999999999,y= 0.01,z= -0.02 ,              xRot=95.0,                 yRot=0.00,                       zRot=0.00}, 
        {ObjectCode = "s_ropehogtiehands01x",         Attachment = "CP_R_ForeArm",            x= -0.15,y= 0.00,z= -0.03 ,              xRot=0.00,                 yRot=33.0,                       zRot=0.00}, 
    },
    ["ind_ns10"] = {
        {ObjectCode = "mlohub_shield03",           Attachment = "CP_R_UpperArm",             x= 0.18,y= -0.04,z= 0.03,             xRot=125.0,                 yRot=40.0,                      zRot=-53.0},    
        {ObjectCode = "s_ropehogtiehandssmall01x",         Attachment = "CP_R_ForeArm",            x= -0.12999999999999,y= 0.01,z= -0.02 ,              xRot=95.0,                 yRot=0.00,                       zRot=0.00}, 
        {ObjectCode = "s_ropehogtiehands01x",         Attachment = "CP_R_ForeArm",            x= -0.15,y= 0.00,z= -0.03 ,              xRot=0.00,                 yRot=33.0,                       zRot=0.00}, 
    },
    ["ind_ns11"] = {
        {ObjectCode = "mlohub_shield04",           Attachment = "CP_R_UpperArm",             x= 0.18,y= -0.04,z= 0.03,             xRot=125.0,                 yRot=40.0,                      zRot=-53.0},    
        {ObjectCode = "s_ropehogtiehandssmall01x",         Attachment = "CP_R_ForeArm",            x= -0.12999999999999,y= 0.01,z= -0.02 ,              xRot=95.0,                 yRot=0.00,                       zRot=0.00}, 
        {ObjectCode = "s_ropehogtiehands01x",         Attachment = "CP_R_ForeArm",            x= -0.15,y= 0.00,z= -0.03 ,              xRot=0.00,                 yRot=33.0,                       zRot=0.00}, 
    },
    ["ind_ns12"] = {
        {ObjectCode = "mlohub_shield05",           Attachment = "CP_R_UpperArm",             x= 0.18,y= -0.04,z= 0.03,             xRot=125.0,                 yRot=40.0,                      zRot=-53.0},    
        {ObjectCode = "s_ropehogtiehandssmall01x",         Attachment = "CP_R_ForeArm",            x= -0.12999999999999,y= 0.01,z= -0.02 ,              xRot=95.0,                 yRot=0.00,                       zRot=0.00}, 
        {ObjectCode = "s_ropehogtiehands01x",         Attachment = "CP_R_ForeArm",            x= -0.15,y= 0.00,z= -0.03 ,              xRot=0.00,                 yRot=33.0,                       zRot=0.00}, 
    },
    ["ind_ns13"] = {
        {ObjectCode = "mlohub_shield06",           Attachment = "CP_R_UpperArm",             x= 0.18,y= -0.04,z= 0.03,             xRot=125.0,                 yRot=40.0,                      zRot=-53.0},    
        {ObjectCode = "s_ropehogtiehandssmall01x",         Attachment = "CP_R_ForeArm",            x= -0.12999999999999,y= 0.01,z= -0.02 ,              xRot=95.0,                 yRot=0.00,                       zRot=0.00}, 
        {ObjectCode = "s_ropehogtiehands01x",         Attachment = "CP_R_ForeArm",            x= -0.15,y= 0.00,z= -0.03 ,              xRot=0.00,                 yRot=33.0,                       zRot=0.00}, 
    },
    ["ind_ns14"] = {
        {ObjectCode = "mlohub_shield07",           Attachment = "CP_R_UpperArm",             x= 0.18,y= -0.04,z= 0.03,             xRot=125.0,                 yRot=40.0,                      zRot=-53.0},    
        {ObjectCode = "s_ropehogtiehandssmall01x",         Attachment = "CP_R_ForeArm",            x= -0.12999999999999,y= 0.01,z= -0.02 ,              xRot=95.0,                 yRot=0.00,                       zRot=0.00}, 
        {ObjectCode = "s_ropehogtiehands01x",         Attachment = "CP_R_ForeArm",            x= -0.15,y= 0.00,z= -0.03 ,              xRot=0.00,                 yRot=33.0,                       zRot=0.00}, 
    },
    ["ind_feather1"] = {
        {ObjectCode = "p_cs_eaglefeather01x",  Attachment = "HairScale_B", x= 0.08,y= 0.03,z= -0.02,             xRot=-65.0, yRot=-18.0, zRot=-73.0}, -- Eagle Feathers
        {ObjectCode = "p_cs_eaglefeather01x",  Attachment = "HairScale_B", x=0.08, y= 0.05,z= -0.04,            xRot=-69.0, yRot=0.00,  zRot=-30.0}, 
    },
    ["ind_feather2"] = {
        {ObjectCode = "s_cs_heronfeather_04x",  Attachment = "HairScale_B", x= 0.08,y= 0.03,z= -0.02,             xRot=-65.0, yRot=-18.0, zRot=-73.0}, -- Heron Feathers
        {ObjectCode = "s_cs_heronfeather_04x",  Attachment = "HairScale_B", x=0.08, y= 0.05,z= -0.04,            xRot=-69.0, yRot=0.00,  zRot=-30.0}, 
    },
    ["ind_feather3"] = {
        {ObjectCode = "s_spoonbillfeather01x",  Attachment = "HairScale_B", x= 0.08,y= 0.03,z= -0.02,             xRot=-65.0, yRot=-18.0, zRot=-73.0}, -- Spoonbill Feathers
        {ObjectCode = "s_spoonbillfeather01x",  Attachment = "HairScale_B", x=0.08, y= 0.05,z= -0.04,            xRot=-69.0, yRot=0.00,  zRot=-30.0}, 
    },
    ["ind_feather4"] = {
        {ObjectCode = "s_cs_californiafeather_01x",  Attachment = "HairScale_B", x= 0.08,y= 0.03,z= -0.02,             xRot=-65.0, yRot=-18.0, zRot=-73.0}, -- Crow Feathers
        {ObjectCode = "s_cs_californiafeather_01x",  Attachment = "HairScale_B", x=0.08, y= 0.05,z= -0.04,            xRot=-69.0, yRot=0.00,  zRot=-30.0}, 
    },
    ["ind_feather5"] = {
        {ObjectCode = "s_cs_roseatefeather_04x",  Attachment = "HairScale_B", x= 0.08,y= 0.03,z= -0.02,             xRot=-65.0, yRot=-18.0, zRot=-73.0}, -- Roseate Feathers
        {ObjectCode = "s_cs_roseatefeather_04x",  Attachment = "HairScale_B", x=0.08, y= 0.05,z= -0.04,            xRot=-69.0, yRot=0.00,  zRot=-30.0}, 
    },
    ["ind_feather6"] = {
        {ObjectCode = "p_indiandream02x",  Attachment = "HairScale_B", x=0.01999999999999,y= 0.02,z= 0.07,             xRot=29.0, yRot=0.00, zRot=-33.0}, -- indian dream 2
    },
    ["ind_feather7"] = {
        {ObjectCode = "p_indiandream03x",  Attachment = "HairScale_B", x=0.01999999999999,y= 0.02,z= 0.07,             xRot=29.0, yRot=0.00, zRot=-33.0},  -- indian dream 3
    },
    ["ind_feather8"] = {
        {ObjectCode = "p_feather01x",  Attachment = "HairScale_B", x= 0.09,y= 0.05,z= -0.03,             xRot=0.00, yRot=153.0, zRot=0.00}, -- single feather
    },
    ["ind_cradle1"] = {
        {ObjectCode = "p_shoppeltbuffalo01x",        Attachment = "CP_Back", x= -0.13999999999999,y= 0.03,z= -0.04 ,                xRot=17.0,              yRot=-17.0,     zRot=3.0},
        {ObjectCode = "prop_stuntdoll_01",        Attachment = "CP_Back", x= -0.24,y= -0.00999999999999,z= 0.05,                xRot=59.0,              yRot=-5.0,     zRot=99.0},
        {ObjectCode = "p_cs_pelt_wolf",        Attachment = "CP_Back", x= -0.12999999999999,y= 0.12999999999999,z= -0.05,                xRot=2.0,              yRot=-18.0,     zRot=0.00},
        {ObjectCode = "p_cs_pelt_wolf",        Attachment = "CP_Back", x= -0.13999999999999,y= -0.09999999999999,z= -0.07,                xRot=0.00,              yRot=-21.0,     zRot=0.00},
        {ObjectCode = "mp006_p_dbstand01x",        Attachment = "CP_Back", x= -0.01999999999999,y= 0.01,z= -0.06,                xRot=8.0,              yRot=-6.0,     zRot=-90.0},
        {ObjectCode = "p_throwpillow_01x",        Attachment = "CP_Back", x=-0.19,y= 0.00,z= 0.11999999999999,                xRot=0.00,              yRot=-14.0,     zRot=0.00},
        {ObjectCode = "p_throwpillow_01x",        Attachment = "CP_Back", x=-0.37,y= 0.01,z= 0.07999999999999,                xRot=0.00,              yRot=0.00,     zRot=0.00},
    },
}

-------------------------fnative
-- EXTRA Webhooks / RANKING
-----------------------
Config.Webhooks = {
    ["trader"] 		= "https://discord.com/api/webhooks/1248299675400929290/sHnbVwQMuInW1YqyA2U_2KJKKKZCbostdPjAssvX8nl2DTZ_Hz5y8DEJZwGSTpquEcvU",
}