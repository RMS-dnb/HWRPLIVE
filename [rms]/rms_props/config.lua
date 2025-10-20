Config = {}

Config.Props = {
	['umbrella'] = {
		model = 'p_parasol02x',
		bone = 'skel_r_hand',
		x = 0.07,
		y = -0.04,
		z = -0.02,
		pitch = -90.0,
		roll = 0.0,
		yaw = 0.0,
		animation = {
			dict = 'amb_rest_sit@prop_human_seat_bench@parasol@female_a@wip_base',
			name = 'wip_base',
			flag = 25
		}
	},
	['basket'] = {
		model = 'p_basket04x',
		bone = 'skel_r_hand',
		x = 0.26,
		y = -0.07,
		z = -0.21,
		pitch = 134.0,
		roll = -176.0,
		yaw = -124.0,
		animation = {
			dict = 'amb_wander@code_human_guard_wander@lazy@male_a@idles',
			name = 'idle_b',
			flag = 25
		}
	},
	['bottlebox'] = {
		model = 'p_bottlecrate01x',
		bone = 'PH_R_Hand',
		x = 0.00,
		y = 0.00,
		z = -0.02,
		pitch = 0.00,
		roll = 0.00,
		yaw = 0.00,
		animation = {
			dict = 'amb_wander@code_human_box_wander@male_a@base',
			name = 'base',
			flag = 25
		}
	},
	['boxammo'] = {
		model = 'p_cs_crateammo01x',
		bone = 'SKEL_L_Hand',
		x = 0.12,
		y = 0.08,
		z = 0.42,
		pitch = 280.0,
		roll = 180.0,
		yaw = 410.0,
		animation = {
			dict = 'mech_loco_m@character@arthur@carry@crate_tnt@idle',
			name = 'idle',
			flag = 25
		}
	},
	['newspapers'] = {
		model = 'p_newspaper01x',
		bone = 'SKEL_L_Finger00',
		x = 0.07,
		y = -0.02,
		z = 0.17,
		pitch = 86.0,
		roll = -164.0,
		yaw = 5.0,
		animation = {
			dict = 'amb_rest_lean@world_human_lean@barrel@read_newspaper@male_a@base',
			name = 'base',
			flag = 25
		}
	},
	['map'] = {
		model = 'mp001_mp_map01x',
		bone = 'XH_L_Hand00',
		x = -0.06,
		y = 0.12,
		z = 0.36,
		pitch = -10.0,
		roll = -120.0,
		yaw = -40.0,
		animation = {
			dict = 'mech_inspection@mini_map@base',
			name = 'hold',
			flag = 25
		}
	},
	['plank'] = {
		model = 'p_woodplank04x',
		bone = 'PH_L_Hand',
		x = 0.03,
		y = 0.11,
		z = 0.06,
		pitch = 86.0,
		roll = 0.0,
		yaw = 4.0,
		animation = {
			dict = 'mech_loco_m@character@dutch@carry@supplies@idle',
			name = 'idle',
			flag = 25
		}
	},
	['sandbag'] = {
		model = 'p_sandbags03x',
		bone = 'SKEL_L_Hand',
		x = 0.02,
		y = 0.13,
		z = 0.28,
		pitch = 2.0,
		roll = 139.0,
		yaw = 0.0,
		animation = {
			dict = 'mech_loco_m@generic@carry@ped@idle',
			name = 'idle',
			flag = 25
		}
	},
	['suitcase'] = {
		model = 'p_boxmedsuitcase01x',
		bone = 'PH_L_Hand',
		x = 0.01,
		y = 0.16,
		z = -0.1,
		pitch = 271.0,
		roll = 0.0,
		yaw = 173.0,
		animation = {
			dict = 'mech_loco_m@character@beau_gray@carry@suitcase@idle',
			name = 'idle',
			flag = 25
		}
	},
	['guitar'] = {
		model = 'p_guitar01x',
		bone = 'PH_R_Hand',
		x = 0.0,
		y = 0.0,
		z = 0.0,
		pitch = 0.0,
		roll = 0.0,
		yaw = 0.0,
		animation = {
			dict = 'amb_wander@code_human_guitar_wander@male_a@base',
			name = 'base',
			flag = 25
		}
	},
	['guitar2'] = {
		model = 'p_guitar01x',
		bone = 'PH_R_Hand',
		x = 0.0,
		y = 0.0,
		z = 0.0,
		pitch = 0.0,
		roll = 0.0,
		yaw = 0.0,
		animation = {
			dict = 'amb_misc@prop_human_seat_chair@guitar@male_a@idle_c',
			name = 'idle_h',
			flag = 25
		}
	},
	['guitar3'] = {
		model = 'p_guitar01x',
		bone = 'SKEL_Spine_Root',
		x = -0.1,
		y = -0.25,
		z = -0.17,
		pitch = 0.0,
		roll = 60.0,
		yaw = 0.0,
		animation = {
			dict = '',
			name = '',
			flag = 25
		}
	},
	['backpack'] = {
		model = 'p_ambpack01x',
		bone = 'SKEL_Spine_Root',
		x = -0.25,
		y = -0.25,
		z = -0.04,
		pitch = 0.0,
		roll = 90.0,
		yaw = 0.0,
		animation = {
			dict = '',
			name = '',
			flag = 25
		}
	},
	['medbox'] = {
		model = 'p_boxmedmedical01x',
		bone = 'PH_R_Hand',
		x = 0.0,
		y = 0.1,
		z = 0.0,
		pitch = 0.0,
		roll = 0.0,
		yaw = 0.0,
		animation = {
			dict = 'amb_wander@code_human_box_wander@male_a@base',
			name = 'base',
			flag = 25
		}
	},
	['toolbox'] = {
		model = 'p_boxlrgtool01x',
		bone = 'PH_R_Hand',
		x = 0.0,
		y = 0.1,
		z = 0.0,
		pitch = 0.0,
		roll = 0.0,
		yaw = 0.0,
		animation = {
			dict = 'amb_wander@code_human_box_wander@male_a@base',
			name = 'base',
			flag = 25
		}
	},
		['strongbox'] = {
		model = 'p_dis_strongboxsm01x',
		bone = 'PH_R_Hand',
		x = 0.0,
		y = 0.1,
		z = 0.0,
		pitch = 0.0,
		roll = 0.0,
		yaw = 0.0,
		animation = {
			dict = 'amb_wander@code_human_box_wander@male_a@base',
			name = 'base',
			flag = 25
		}
	},
	['dairybox'] = {
		model = 'p_boxlrgice01x',
		bone = 'PH_L_Hand',
		x = 0.0,
		y = 0.08,
		z = -0.24,
		pitch = 0.0,
		roll = 0.0,
		yaw = 0.0,
		animation = {
			dict = 'mech_loco_m@character@beau_gray@carry@suitcase@idle',
			name = 'idle',
			flag = 25
		}
	},
	['toolbox2'] = {
		model = 'p_boxlrgtool01x',
		bone = 'PH_L_Hand',
		x = 0.0,
		y = 0.07,
		z = -0.27,
		pitch = 0.0,
		roll = 0.0,
		yaw = 0.0,
		animation = {
			dict = 'mech_loco_m@character@beau_gray@carry@suitcase@idle',
			name = 'idle',
			flag = 25
		}
	},
	['medbag'] = {
		model = 'p_bag01x',
		bone = 'PH_L_Hand',
		x = 0.0,
		y = 0.07,
		z = -0.22,
		pitch = 0.0,
		roll = 0.0,
		yaw = 0.0,
		animation = {
			dict = 'mech_loco_m@character@beau_gray@carry@suitcase@idle',
			name = 'idle',
			flag = 25
		}
	},
	['medbag2'] = {
		model = 'p_cs_baganders01x',
		bone = 'PH_L_Hand',
		x = 0.0,
		y = 0.07,
		z = -0.22,
		pitch = 0.0,
		roll = 0.0,
		yaw = 0.0,
		animation = {
			dict = 'mech_loco_m@character@beau_gray@carry@suitcase@idle',
			name = 'idle',
			flag = 25
		}
	},
	['medbagunder'] = {
		model = 'p_bag01x',
		bone = 'PH_L_Hand',
		x = -0.0,
		y = 0.04,
		z = 0.01,
		pitch = 0.0,
		roll = 0.0,
		yaw = 180.0,
		animation = {
			dict = 'mech_pickup@camerabag@carried',
			name = 'grip_lt_arm',
			flag = 25
		}
	},
	['medbagunder2'] = {
		model = 'p_cs_baganders01x',
		bone = 'PH_L_Hand',
		x = -0.0,
		y = 0.04,
		z = 0.01,
		pitch = 0.0,
		roll = 0.0,
		yaw = 180.0,
		animation = {
			dict = 'mech_pickup@camerabag@carried',
			name = 'grip_lt_arm',
			flag = 25
		}
	},
	['louielemoyne'] = {
		model = 'p_cs_bagstrauss01x',
		bone = 'PH_L_Hand',
		x = 0.0,
		y = 0.07,
		z = -0.22,
		pitch = 0.0,
		roll = 0.0,
		yaw = 0.0,
		animation = {
			dict = 'mech_loco_m@character@beau_gray@carry@suitcase@idle',
			name = 'idle',
			flag = 25
		}
	},
	['luggage'] = {
		model = 's_penelopebag01x',
		bone = 'PH_L_Hand',
		x = 0.0,
		y = 0.05,
		z = -0.36,
		pitch = 0.0,
		roll = 0.0,
		yaw = 0.0,
		animation = {
			dict = 'mech_loco_m@character@beau_gray@carry@suitcase@idle',
			name = 'idle',
			flag = 25
		}
	},
	['moneybag'] = {
		model = 'p_moneybag02x',
		bone = 'PH_L_Hand',
		x = 0.10,
		y = -0.05,
		z = 0.02,
		pitch = 0.0,
		roll = 0.0,
		yaw = 90.0,
		animation = {
			dict = 'mech_pickup@camerabag@carried',
			name = 'grip_lt_arm',
			flag = 25
		}
	},
	['moneybag2'] = {
		model = 'p_sack_01x',
		bone = 'PH_L_Hand',
		x = 0.10,
		y = -0.05,
		z = 0.02,
		pitch = 0.0,
		roll = 0.0,
		yaw = 90.0,
		animation = {
			dict = 'mech_pickup@camerabag@carried',
			name = 'grip_lt_arm',
			flag = 25
		}
	},
	['pushbroom'] = {
		model = 'p_broom04x',
		bone = 'PH_R_Hand',
		x = 0.0,
		y = 0.0,
		z = 0.0,
		pitch = 0.0,
		roll = 0.0,
		yaw = 0.0,
		animation = {
			dict = 'amb_work@world_human_broom@working@male_b@base',
			name = 'base',
			flag = 25
		}
	},
	['strawbroom'] = {
		model = 'p_broom02x',
		bone = 'PH_R_Hand',
		x = 0.0,
		y = -0.03,
		z = 0.0,
		pitch = -3.0,
		roll = 0.0,
		yaw = 0.0,
		animation = {
			dict = 'amb_work@world_human_broom@working@female_b@idle_a',
			name = 'idle_b',
			flag = 25
		}
	},
	-- ['candlestick'] = {
	-- 	model = 'p_candlestick03x',
	-- 	bone = 'PH_L_Hand',
	-- 	x = 0.06,
	-- 	y = -0.08,
	-- 	z = -0.03,
	-- 	pitch = -42.0,
	-- 	roll = -16.0,
	-- 	yaw = -16.0,
	-- 	animation = {
	-- 		dict = 'mech_inspection@cigarette_card@base',
	-- 		name = 'hold',
	-- 		flag = 25
	-- 	}
	-- },
	-- ['torch'] = {
	-- 	model = 's_interact_torch',
	-- 	bone = 'PH_R_Hand',
	-- 	x = 0.04,
	-- 	y = 0.08,
	-- 	z = -0.02,
	-- 	pitch = -91.0,
	-- 	roll = 10.0,
	-- 	yaw = -10.0,
	-- 	animation = {
	-- 		dict = 'mech_doors@arms@torch',
	-- 		name = 'mainhand_idle',
	-- 		flag = 25
	-- 	}
	-- },
    ['haybale'] = {
        model = 'p_haybale01x',
        bone = 'OH_L_Hand',
        x = 0.21,
        y = -0.02,
        z = 0.37,
        pitch = 0.0,
        roll = -62.0,
        yaw = 0.0,
        animation = {
            dict = 'amb_wander@code_human_hay_bale_wander@male_a@base',
            name = 'base',
            flag = 25
        }
    },
	['pitchfork'] = {
		model = 'p_pitchfork01x',
		bone = 'PH_R_Hand',
		x = -0.04,
		y = -0.07,
		z = -0.03,
		pitch = -95.0,
		roll = -230.0,
		yaw = -38.0,
		animation = {
			dict = 'amb_work@world_human_pitch_hay@male_a@pitch@idle_a',
			name = 'idle_a',
			flag = 1
		}
	},
	['bookbox'] = {
		model = 'p_bookbox01x',
		bone = 'PH_R_Hand',
		x = -0.02,
		y = -0.04,
		z = 0.0,
		pitch = 0.0,
		roll = 0.0,
		yaw = -90.0,
		animation = {
			dict = 'amb_wander@code_human_box_wander@male_a@base',
			name = 'base',
			flag = 25
			}
	},
	['rake'] = {
		model = 'p_rake02x',
		bone = 'PH_R_Hand',
		x = 0.0,
		y = 0.0,
		z = 0.19,
		pitch = 0.0,
		roll = 0.0,
		yaw = 0.0,
		animation = {
			dict = 'amb_work@world_human_farmer_rake@male_a@idle_a',
			name = 'idle_a',
			flag = 1
		}
	},
	['feedbag'] = {
		model = 'p_feedbag01bx',
		bone = 'PH_L_Hand',
		x = 0.0,
		y = 0.0,
		z = 0.0,
		pitch = 0.0,
		roll = 0.0,
		yaw = 0.0,
		animation = {
			dict = 'amb_work@world_human_feed_chickens@female_a@base',
			name = 'base',
			flag = 1
		}
	},
	['mshine'] = {
		model = 'p_jug01x',
		bone = 'PH_R_Hand',
		x = 0.0,
		y = 0.0,
		z = 0.0,
		pitch = 0.0,
		roll = 0.0,
		yaw = 0.0,
		animation = {
			dict = 'script_re@moonshine_camp@male_b@pose1@look_react@active_look',
			name = 'active_look_front',
			flag = 25
		}
	},
	['kerosene'] = {
		model = 'p_kerosenecan02x',
		bone = 'PH_R_Hand',
		x = 0.0,
		y = 0.0,
		z = 0.021,
		pitch = 0.5,
		roll = 0.0,
		yaw = -18.0,
		animation = {
			dict = 'script_re@moonshine_camp@male_b@pose1@look_react@active_look',
			name = 'active_look_front',
			flag = 25
		}
	},
	['mdrink'] = {
		model = 'p_jug01bx',
		bone = 'PH_R_Hand',
		x = 0.0,
		y = 0.0,
		z = 0.0,
		pitch = 0.0,
		roll = 0.0,
		yaw = 0.0,
		animation = {
			dict = 'script_re@moonshine_camp@return_taste@trans',
			name = 'good_male_b',
			flag = 25
			}
	},
	['mix'] = {
		model = 'p_jug01x',
		bone = 'PH_R_Hand',
		x = 0.0,
		y = 0.0,
		z = 0.0,
		pitch = 0.0,
		roll = 0.0,
		yaw = 0.0,
		animation = {
			dict = 'script_re@moonshine_camp@male_b@pose1@base',
			name = 'base',
			flag = 25
			}
	},
	['mbox'] = {
		model = 'p_12moonshinecrate01',
		bone = 'PH_R_Hand',
		x = 0.0,
		y = 0.0,
		z = 0.0,
		pitch = 0.0,
		roll = 0.0,
		yaw = -87.0,
		animation = {
			dict = 'amb_wander@code_human_box_wander@male_a@base',
			name = 'base',
			flag = 25
			}
	},
	['crate'] = {
		model = 'p_crate03x',
		bone = 'PH_R_Hand',
		x = 0.0,
		y = 0.0,
		z = 0.0,
		pitch = 0.0,
		roll = 0.0,
		yaw = -87.0,
		animation = {
			dict = 'amb_wander@code_human_box_wander@male_a@base',
			name = 'base',
			flag = 25
			}
	},
	['toolcrate'] = {
		model = 'p_cratetools01x',
		bone = 'PH_R_Hand',
		x = -0.02,
		y = 0.0,
		z = 0.0,
		pitch = 0.0,
		roll = 0.0,
		yaw = -87.0,
		animation = {
			dict = 'amb_wander@code_human_box_wander@male_a@base',
			name = 'base',
			flag = 25
			}
	},
	['flowers'] = {
		model = 'p_pot_flowerarng01x',
		bone = 'PH_R_Hand',
		x = -0.04,
		y = 0.10,
		z = -0.02,
		pitch = 0.0,
		roll = 10.0,
		yaw = -90.0,
		animation = {
			dict = 'amb_wander@code_human_box_wander@male_a@base',
			name = 'base',
			flag = 25
			}
	},
	['drinktray'] = {
		model = 'p_cs_tray01x',
		bone = 'PH_R_Hand',
		x = -0.05,
		y = 0.08,
		z = -0.01,
		pitch = 0.0,
		roll = 15.0,
		yaw = -87.0,
		animation = {
			dict = 'amb_wander@code_human_box_wander@male_a@base',
			name = 'base',
			flag = 25
			}
	},
	['apples'] = {
		model = 'p_basketapple01x',
		bone = 'PH_R_Hand',
		x = -0.04,
		y = 0.10,
		z = -0.06,
		pitch = 0.0,
		roll = 15.0,
		yaw = -87.0,
		animation = {
			dict = 'amb_wander@code_human_box_wander@male_a@base',
			name = 'base',
			flag = 25
			}
	},
	['oranges'] = {
		model = 'p_basketorange01x',
		bone = 'PH_R_Hand',
		x = -0.04,
		y = 0.10,
		z = -0.06,
		pitch = 0.0,
		roll = 15.0,
		yaw = -87.0,
		animation = {
			dict = 'amb_wander@code_human_box_wander@male_a@base',
			name = 'base',
			flag = 25
			}
	},
	['laundry'] = {
		model = 'p_basketcloth01x',
		bone = 'PH_R_Hand',
		x = 0.03,
		y = 0.15,
		z = -0.12,
		pitch = 0.0,
		roll = 15.0,
		yaw = -90.0,
		animation = {
			dict = 'amb_wander@code_human_box_wander@male_a@base',
			name = 'base',
			flag = 25
			}
	},
	['bunbasket'] = {
		model = 'p_basket06cx',
		bone = 'PH_R_Hand',
		x = -0.04,
		y = 0.12,
		z = -0.12,
		pitch = 0.0,
		roll = 15.0,
		yaw = -90.0,
		animation = {
			dict = 'amb_wander@code_human_box_wander@male_a@base',
			name = 'base',
			flag = 25
			}
	},
	['medicine'] = {
		model = 'mp007_p_mp_tonicbox01x',
		bone = 'PH_R_Hand',
		x = -0.04,
		y = 0.16,
		z = -0.13,
		pitch = 15.0,
		roll = 0.0,
		yaw = -0.0,
		animation = {
			dict = 'amb_wander@code_human_box_wander@male_a@base',
			name = 'base',
			flag = 25
			}
	},
	['fishbowl'] = {
		model = 'p_basketfish01x',
		bone = 'PH_R_Hand',
		x = -0.04,
		y = 0.08,
		z = -0.04,
		pitch = 0.0,
		roll = 15.0,
		yaw = -87.0,
		animation = {
			dict = 'amb_wander@code_human_box_wander@male_a@base',
			name = 'base',
			flag = 25
			}
	},
	['fruittray'] = {
		model = 'p_platterfruit01x',
		bone = 'PH_R_Hand',
		x = -0.04,
		y = 0.08,
		z = -0.04,
		pitch = 0.0,
		roll = 15.0,
		yaw = -87.0,
		animation = {
			dict = 'amb_wander@code_human_box_wander@male_a@base',
			name = 'base',
			flag = 25
			}
	},
	['melontray'] = {
		model = 'p_platterfruit02x',
		bone = 'PH_R_Hand',
		x = -0.04,
		y = 0.08,
		z = -0.0,
		pitch = -15.5,
		roll = 0.0,
		yaw = -190.0,
		animation = {
			dict = 'amb_wander@code_human_box_wander@male_a@base',
			name = 'base',
			flag = 25
			}
	},
	['apptray1'] = {
		model = 'p_cs_hordervetray01x',
		bone = 'PH_R_Hand',
		x = -0.04,
		y = 0.08,
		z = -0.0,
		pitch = -16.5,
		roll = -2.3,
		yaw = -190.0,
		animation = {
			dict = 'amb_wander@code_human_box_wander@male_a@base',
			name = 'base',
			flag = 25
			}
	},
	['apptray2'] = {
		model = 'p_cs_hordervetray03x',
		bone = 'PH_R_Hand',
		x = -0.04,
		y = 0.08,
		z = -0.0,
		pitch = -16.5,
		roll = -2.3,
		yaw = -190.0,
		animation = {
			dict = 'amb_wander@code_human_box_wander@male_a@base',
			name = 'base',
			flag = 25
			}
	},
	['coffeetray'] = {
		model = 'p_teatraycombo01x',
		bone = 'PH_R_Hand',
		x = -0.06,
		y = -0.07,
		z = -0.035,
		pitch = -16.5,
		roll = -2.3,
		yaw = -185.0,
		animation = {
			dict = 'amb_wander@code_human_box_wander@male_a@base',
			name = 'base',
			flag = 25
			}
	},
	['stroller'] = {
		model = 'p_babystroller',
		bone = 'PH_R_Hand',
		x = -0.04,
		y = -0.42,
		z = -0.40,
		pitch = 15.0,
		roll = -0.0,
		yaw = -0.0,
		animation = {
			dict = 'amb_wander@code_human_box_wander@male_a@base',
			name = 'base',
			flag = 25
			}
	},
	['dishes'] = {
		model = 'p_basin_dirty_01x',
		bone = 'PH_R_Hand',
		x = -0.04,
		y = 0.08,
		z = -0.0,
		pitch = -16.5,
		roll = -2.3,
		yaw = -190.0,
		animation = {
			dict = 'amb_wander@code_human_box_wander@male_a@base',
			name = 'base',
			flag = 25
			}
	},
	['applebarrel'] = {
		model = 'p_barrelapples01x',
		bone = 'PH_R_Hand',
		x = -0.03,
		y = 0.22,
		z = -0.42,
		pitch = -16.5,
		roll = -2.3,
		yaw = -190.0,
		animation = {
			dict = 'amb_wander@code_human_box_wander@male_a@base',
			name = 'base',
			flag = 25
			}
	},
	['orangebarrel'] = {
		model = 'p_barreloranges01x',
		bone = 'PH_R_Hand',
		x = -0.03,
		y = 0.22,
		z = -0.42,
		pitch = -16.5,
		roll = -2.3,
		yaw = -190.0,
		animation = {
			dict = 'amb_wander@code_human_box_wander@male_a@base',
			name = 'base',
			flag = 25
			}
	},
	['pearbarrel'] = {
		model = 'p_barrelpears01x',
		bone = 'PH_R_Hand',
		x = -0.03,
		y = 0.08,
		z = -0.42,
		pitch = -16.5,
		roll = -2.3,
		yaw = -190.0,
		animation = {
			dict = 'amb_wander@code_human_box_wander@male_a@base',
			name = 'base',
			flag = 25
			}
	},
	['potatobarrel'] = {
		model = 'p_barrelpotatoes01x',
		bone = 'PH_R_Hand',
		x = -0.03,
		y = 0.08,
		z = -0.42,
		pitch = -16.5,
		roll = -2.3,
		yaw = -190.0,
		animation = {
			dict = 'amb_wander@code_human_box_wander@male_a@base',
			name = 'base',
			flag = 25
			}
	},
}
