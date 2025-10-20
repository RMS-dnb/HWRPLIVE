Config = {}

Config.PromptTarget			= true										-- Active Prompt when targeting, else break the loop. Useful if you use your own target system (rl_dance:send_request', player2_serverid)
Config.CustomEvent		    = false									    -- Active Event in Event.lua. Useful if you use your own notification system
Config.InviteMen			= false										-- Allow players to also invite a man
Config.StopPlayer2			= true										-- Allow player 2 to stop immediately the dance
Config.FinishPlayer2		= true										-- Allow player 2 to finish the dance
Config.RequestDistance      = 2.5										-- Max Distance(Meter) show prompt
Config.RequestAgain     	= 5											-- Time(Second) before send an invite again
Config.BreakDistance        = 3											-- The invitation will be closed if the distance is exceeded

Config.RequestTxt			= 'Invite to Dance'
Config.RequestKey			= 0x17D3BFF5								-- E

Config.ReceiveRequestName	= 'Someone invites you to dance'
Config.ReceiveRequestFormat = {x = 0.50, y = 0.25, l = 0.60, h = 0.60}
Config.ReceiveRequestColor  = {r =  255, g =  255, b =  255, a = 255}

Config.AcceptRequestName	= '~t6~Accept ~q~: [G]'
Config.AcceptRequestFormat  = {x = 0.45, y = 0.30, l = 0.60, h = 0.60}
Config.AcceptRequestColor   = {r =  255, g =  255, b =  255, a = 255}
Config.AcceptRequestKey		= 0x760A9C6F								-- G

Config.RefuseRequestName	= '~t8~Refuse ~q~: [R]'
Config.RefuseRequestFormat  = {x = 0.55, y = 0.30, l = 0.60, h = 0.60}
Config.RefuseRequestColor   = {r =  255, g =  255, b =  255, a = 255}
Config.RefuseRequestKey		= 0xE30CD707 								-- R

Config.RightSpinName 		= 'Right Spin'
Config.RightSpinKey			= 0xE30CD707								-- R

Config.LeftSpinName 		= 'Left Spin'
Config.LeftSpinKey 			= 0x17D3BFF5								-- E

Config.ReverseName 			= 'Reverse'
Config.ReverseKey 			= 0x6319DB71								-- UP

Config.AttractName 			= 'Attract'
Config.AttractKey 			= 0x05CA7C52								-- DOWN

Config.ComboName 			= 'Combo'
Config.ComboKey 			= 0x9720FCEE								-- T

Config.LeftRotName 			= 'Left Rot'
Config.LeftRotKey 			= 0xA65EBAB4								-- LEFT

Config.RightRotName 		= 'Right Rot'
Config.RightRotKey			= 0xDEB34313								-- RIGHT

Config.FinishName 			= 'Finish'
Config.FinishKey			= 0x8CC9CD42								-- X

Config.StopName 			= 'Stop'
Config.StopKey 				= 0xD27782E3								-- S