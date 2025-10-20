Config = {}

Config.Text = {
    [1] = "Play Animation",
    [2] = "Song list",
    [3] = "Cancel",
    [4] = "Stop",
    [5] = "Select a song",
    [6] = "Confirm",
    [7] = "Decline",
	[8] = "Duration: ",
	[9] = "Custom link",
	[10] = "Enter the url",
	[11] = "Range",
}

Config.buttonHash = 0x760A9C6F
Config.buttonHash2 = 0x41AC83D1
Config.buttonHash3 = 0x7914A3DD
Config.webhook = "" -- log, put your discord webhood
Config.maxArea = 30 -- Maximum allowable range 
Config.MenuType = "redemrp" -- vorp / redemrp

Config.CustomImput = function(datos)
	local inputData = {
		title = Config.Text[9],
		desc = Config.Text[10],
		buttonparam1 = Config.Text[6],
		buttonparam2 = Config.Text[7]
	}					
	TriggerEvent("tp_inputs:getTextInput", inputData, function(link)
		if link == "DECLINE" then  return end
		if link == "" then  return end

		TriggerEvent("lumen_instrument:songListFirst",datos,link)
	end) 
end




Config.InstrumentData = { ----------------------Modify only the parameters that have a comment, the rest do not change. --------------------

	['trumpet'] = { 
        item = "yeast", -- item to use
        special = false, 
		props = {
			{
				model = 'p_trumpet01x',
				bone = 'SKEL_R_Hand',
				position = vector3(0.07, 0.0, -0.05),
				rotation = vector3(270.0, 10.0, -80.0)
			}
		},
		inactiveAnimation = {
            female = {
			    dict = 'amb_misc@world_human_trumpet@male_a@base',
			    name = 'base',
			    flag = 25
            },
            male = {
			    dict = 'amb_misc@world_human_trumpet@male_a@base',
			    name = 'base',
			    flag = 25
            },
		},
		activeAnimation = {
            female = {
			    dict = 'ai_gestures@instruments@trumpet@standing@140bpm',
			    name = 'upbeat_cen_002',
			    flag = 25
            },
            male = {
			    dict = 'ai_gestures@instruments@trumpet@standing@140bpm',
			    name = 'upbeat_cen_002',
			    flag = 25
            },
		},
		customLink = true, -- allows the use of custom links to the player
        songList = { -- pre-defined track list

			{label = "Music 1", url = "https://www.youtube.com/watch?v=JsNm2bYl7PQ"},
			{label = "Music 2", url = "https://www.youtube.com/watch?v=-wllulJyJa8"},


        }
	},

	['guitar'] = {
        item = "guitar",
        special = false,
		props = {
			{
				model = 'p_guitar01x',
				bone = 'skel_spine0',
				position = vector3(0.17, 0.35, -0.12),
				rotation = vector3(-18.0, -18.0, 180.0)
			}
		},
		inactiveAnimation = {
            female = {
			    dict = 'ai_gestures@instruments@guitar@seated@80bpm',
			    name = 'generic_01',
			    flag = 25
            },
            male = {
			    dict = 'ai_gestures@instruments@guitar@seated@80bpm',
			    name = 'generic_01',
			    flag = 25
            },
		},
		activeAnimation = {
            female = {
			    dict = 'ai_gestures@instruments@guitar@seated@120bpm',
			    name = 'upbeat_picking_fast_chords_rt_0_+1_03',
			    flag = 25
            },
            male = {
			    dict = 'ai_gestures@instruments@guitar@seated@120bpm',
			    name = 'upbeat_picking_fast_chords_rt_0_+1_03',
			    flag = 25
            },
		},
		customLink = true,
        songList = {
			{label = "Twilight", url = "https://www.youtube.com/watch?v=c1PACud9rTE"},
			{label = "Music 2", url = "https://www.youtube.com/watch?v=-wllulJyJa8"},

        }
	},

	['harmonica'] = {
        item = "harmonica",
        special = false,
		props = {
			{
				model = 'p_harmonica01x',
				bone = 'skel_l_hand',
				position = vector3(0.08, 0.03, 0.08),
				rotation = vector3(0.0, 90.0, 0.0)
			}
		},
		inactiveAnimation = {
			female = {
				dict = 'amb_misc@prop_human_seat_bench@harmonica@resting@female_a@base',
				name = 'base',
				flag = 25
			},
			male = {
				dict = 'amb_misc@prop_human_seat_bench@harmonica@resting@male_a@base',
				name = 'base',
				flag = 25
			},
		},
		activeAnimation = {
			female = {
				dict = 'ai_gestures@instruments@harmonica@seated@female@120bpm',
				name = 'spine_bwd_01',
				flag = 25
			},
			male = {
				dict = 'ai_gestures@instruments@harmonica@seated@120bpm',
				name = 'spine_bwd_01',
				flag = 25
			}
		},
		customLink = true,
        songList = {
			{label = "Music 1", url = "https://www.youtube.com/watch?v=JsNm2bYl7PQ"},
			{label = "Music 2", url = "https://www.youtube.com/watch?v=-wllulJyJa8"},

        }
        
	},
	['concertina'] = {
        item = "concertina",
        special = false,
		props = {
			{
				model = 'p_cs_concertina01x',
				bone = 'skel_r_hand',
				position = vector3(0.0, 0.0, 0.0),
				rotation = vector3(0.0, 270.0, 0.0)
			}
		},
		inactiveAnimation = {
            female = {
			    dict = 'amb_misc@prop_human_seat_bench@concertina@male_a@base',
			    name = 'base',
			    flag = 25
            },
            male = {
			    dict = 'amb_misc@prop_human_seat_bench@concertina@male_a@base',
			    name = 'base',
			    flag = 25
            },
		},
		activeAnimation = {
            female = {
			    dict = 'ai_gestures@instruments@concertina@seated@120bpm',
			    name = 'longs_med_01',
			    flag = 25
            },
            male = {
			    dict = 'ai_gestures@instruments@concertina@seated@120bpm',
			    name = 'longs_med_01',
			    flag = 25
            },
		},
		customLink = true,
        songList = {
			{label = "Music 1", url = "https://www.youtube.com/watch?v=JsNm2bYl7PQ"},
			{label = "Music 2", url = "https://www.youtube.com/watch?v=-wllulJyJa8"},

        }
	},
	['banjo'] = {
        item = "banjo",
        special = false,
		props = {
			{
				model = 'p_banjo01x',
				bone = 'skel_spine0',
				position = vector3(0.05, 0.25, -0.22),
				rotation = vector3(-4.0, -30.0, 180.0)
			}
		},
		inactiveAnimation = {
            female = {
			    dict = 'ai_gestures@instruments@banjo@seated@male@normal',
			    name = 'banjo_base',
			    flag = 25
            },
            male = {
			    dict = 'ai_gestures@instruments@banjo@seated@male@normal',
			    name = 'banjo_base',
			    flag = 25
            },
		},
		activeAnimation = {
            female = {
			    dict = 'ai_gestures@instruments@banjo@seated@120bpm',
			    name = 'spine_0_hand_0_01',
			    flag = 25
            },
            male = {
			    dict = 'ai_gestures@instruments@banjo@seated@120bpm',
			    name = 'spine_0_hand_0_01',
			    flag = 25
            },
		},
		customLink = true,
        songList = {
			{label = "5 Songs", url = "https://www.youtube.com/watch?v=HnJ4aUoEL8Q"},
			{label = "Music 2", url = "https://www.youtube.com/watch?v=-wllulJyJa8"},

        }
	},
	['fiddle'] = {
        item = "fiddle",
        special = true,
		props = {
			{
				model = 'p_fiddle01x',
				bone = 'skel_l_forearm',
				position = vector3(0.07, 0.33, 0.11),
				rotation = vector3(169.0, -73.0, -40.0)
			},
			{
				model = 'p_bow01x',
				bone = 'skel_r_hand',
				position = vector3(0.06, -0.08, -0.029),
				rotation = vector3(147, 270, 115)
			}
		},
		inactiveAnimation = {
            female = {
			    dict = 'ai_gestures@instruments@fiddle@standing@female@normal',
			    name = 'fiddle_base',
			    flag = 25
            },
            male = {
			    dict = 'ai_gestures@instruments@fiddle@standing@female@normal',
			    name = 'fiddle_base',
			    flag = 25
            },
		},
		activeAnimation = {
            female = {
			    dict = 'ai_gestures@instruments@fiddle@standing@female@normal',
			    name = 'fiddle_low_long_shorts_-1_01',
			    flag= 25
            },
            male = {
			    dict = 'ai_gestures@instruments@fiddle@standing@female@normal',
			    name = 'fiddle_low_long_shorts_-1_01',
			    flag= 25
            },
		},
		customLink = true,
        songList = {
			{label = "The Thorned Rose Knight", url = "https://www.youtube.com/watch?v=3fDw8MO7brQ"},
			{label = "Music 2", url = "https://www.youtube.com/watch?v=-wllulJyJa8"},

        }
	}
 
}

