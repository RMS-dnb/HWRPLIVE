-- TURBOMODUS BLACKJACK v2
-- FOR MORE INFO, READ THE DOCS via https://turbomodus.gitbook.io/turbomodus-script-stash
BlackJackConfig = {}
-- FRAMEWORK
BlackJackConfig.Framework = "vorp"
-- DISCORD WEBHOOK (disable = "" or = nil or = false)
BlackJackConfig.WebhookUrl = ""
BlackJackConfig.WebhookAvatarUrl = ""
BlackJackConfig.WebhookLogs = {
    TableStarted            = true,
    TableEnded              = true,
    TableWinLooseHandling   = true,
    PlayerJoin              = true,
    PlayerLeft              = true,
    PlayerRebuy             = true,
    PlayerPlacedBet         = true,
}
-- SEND DEBUG INFOS TO KIBOOK LOGMANAGER (resource needs to be available)
BlackJackConfig.Logmanager = false
-- SEND DEBUG INFOS INTO LIVE SERVER CONSOLE
BlackJackConfig.Console = true
-- LATENT SERVER EVENTS
BlackJackConfig.UseLatentClientEvents = false
BlackJackConfig.Bps = 1000000
-- DO NOT CHANGE THESE
BlackJackConfig.Decks = 1
BlackJackConfig.Cards = {2,3,4,5,6,7,8,9, 10,"J","Q","K","A"}
BlackJackConfig.Suits = {"♦","♤","♥","♧"}
-- END DO NOT CHANGE THESE
-- PROMPTS
BlackJackConfig.Start       = "Blackjack spielen"   BlackJackConfig.StartKey            = 0xEB2AC491    --R
BlackJackConfig.Info        = "Regeln"              BlackJackConfig.InfoKey             = 0x1ECA87D4    --Q
BlackJackConfig.Hit         = "Karte"               BlackJackConfig.HitKey              = 0xD596CFB0    --F
BlackJackConfig.Stand       = "Halten"              BlackJackConfig.StandKey            = 0x760A9C6F    --G
BlackJackConfig.DoubleDown  = "Verdoppeln"          BlackJackConfig.DoubleDownKey       = 0x17BEC168    --E 
BlackJackConfig.Split       = "Aufteilen"           BlackJackConfig.SplitKey            = 0x84543902    --H
BlackJackConfig.Surrender   = "Aufgeben"            BlackJackConfig.SurrenderKey        = 0x156F7119    --Backspace
BlackJackConfig.Rebuy       = "Neu einkaufen"       BlackJackConfig.RebuyKey            = 0xEB2AC491    --R
BlackJackConfig.Bet         = "Betrag"              BlackJackConfig.BetUKey             = 0x6319DB71    --ARROW UP
                                                    BlackJackConfig.BetDKey             = 0x05CA7C52    --ARROW DOWN
                                                    BlackJackConfig.IncreaseModifierKey = 0x7C0162C0    --SHIFT
BlackJackConfig.LockBet     = "Setzen"              BlackJackConfig.LockBetKey          = 0xC7B5340A    --ENTER
-- FINETUNING
BlackJackConfig.IncreaseModifierStep = 10.0 -- gets multiplied to BetStep when pressing IncreaseModifierKey
BlackJackConfig.BetStep = 0.05
BlackJackConfig.MinBet = 0.05
BlackJackConfig.Radius = 2.15
BlackJackConfig.MaxPlayersPerTable = 4
BlackJackConfig.TipTime = 3500
BlackJackConfig.ActionTimer = 120
BlackJackConfig.UsePlayerName = true -- decide if the player name or the server id with a prefix should be displayed / Prefix setup with the"NoPlayerNamePrefix" parameter below
BlackJackConfig.NoPlayerNamePrefix = "Spieler"
-- AUDIO
BlackJackConfig.UseDealerSpeech = true
BlackJackConfig.BetAmountSounds = true
-- RULE TEXT
local tencards = "<img src='nui://tm_blackjack/html/img/cards/playing_cards_01/hearts_10.png' style='height: 48px'/><img src='nui://tm_blackjack/html/img/cards/playing_cards_01/hearts_j.png' style='height: 48px'/><img src='nui://tm_blackjack/html/img/cards/playing_cards_01/hearts_q.png' style='height: 48px'/><img src='nui://tm_blackjack/html/img/cards/playing_cards_01/hearts_k.png' style='height: 48px'/>"
local acecards = "<img src='nui://tm_blackjack/html/img/cards/playing_cards_01/hearts_a.png' style='height: 48px'/>"
local numcards = "<img src='nui://tm_blackjack/html/img/cards/playing_cards_01/hearts_2.png' style='height: 48px'/><img src='nui://tm_blackjack/html/img/cards/playing_cards_01/hearts_3.png' style='height: 48px'/><img src='nui://tm_blackjack/html/img/cards/playing_cards_01/hearts_4.png' style='height: 48px'/><img src='nui://tm_blackjack/html/img/cards/playing_cards_01/hearts_5.png' style='height: 48px'/><img src='nui://tm_blackjack/html/img/cards/playing_cards_01/hearts_6.png' style='height: 48px'/><img src='nui://tm_blackjack/html/img/cards/playing_cards_01/hearts_7.png' style='height: 48px'/><img src='nui://tm_blackjack/html/img/cards/playing_cards_01/hearts_8.png' style='height: 48px'/><img src='nui://tm_blackjack/html/img/cards/playing_cards_01/hearts_9.png' style='height: 48px'/>"
BlackJackConfig.Rules = "Bei Blackjack bekommt jeder Spieler und auch der Dealer zwei Karten ausgeteilt.<br/><br/>"..
                        "Das Ziel ist es, dass die Summe deiner Karten zusammen so nah wie möglich an 21 kommen ohne darüber zu gelangen (Bust)."..
                        "<hr style='border:0px;border-top:2px solid #0a0a0a!important;border-bottom:2px solid #2a2a2a!important;margin-left:-11px!important;margin-right:-11px!important'/>"..
                        "<div style='padding-bottom:20px;height:150px;'>Kartenwerte:<br/>"..
                        "<div style='float:left;width:30%;height:50px;line-height:50px;text-align:left'>11 oder 1</div><div style='float:right;width:70%;text-align:right'>"..acecards.."</div>"..
                        "<div style='float:left;width:30%;height:50px;line-height:50px;text-align:left'>10</div><div style='float:right;width:70%;text-align:right'>"..tencards.."</div>"..
                        "<div style='float:left;width:30%;height:50px;line-height:50px;text-align:left'>Zahlenwert</div><div style='float:right;width:70%;text-align:right'>"..numcards.."</div>"..
                        "</div><hr style='border:0px;border-top:2px solid #0a0a0a!important;border-bottom:2px solid #2a2a2a!important;margin-left:-11px!important;margin-right:-11px!important'/>"..
                        "Wenn du zufrieden mit der Summe deiner Karten bist, kannst du halten. <br/>"..
                        "Wenn du noch näher an 21 herangehen möchtest, kannst du eine weitere Karte verlangen oder deinen Einsatz verdoppeln und dafür nur eine einzige weitere Karte bekommen.<br/>"..
                        "Bekommst du zu Beginn zwei Karten vom selben Wert, kannst du deine Hand einmal aufteilen. Dies ist nur möglich, wenn du denselben Einsatz wie zu Beginn der Runde auch für die zweite Hand setzt.<br/>"..
                        "Du spielst dann separat mit beiden Händen, die auch separat gewertet werden. Ein erneutes aufteilen ist nicht mehr möglich.<br/><br/>"
BlackJackConfig.MaxBet = "Maximaleinsatz pro Runde ist an diesem Tisch sind $%.2f."
BlackJackConfig.RulesOkay = "Okay"
-- GENERAL, NOTIFICATION AND PROMPT TEXTS
BlackJackConfig.Title = "Blackjack"
BlackJackConfig.MoneySymbol = "$"
BlackJackConfig.IncreaseModifierTip = "~t8~Um deine Wette schneller zu ändern, drücke ~INPUT_FRONTEND_Y~ , während du deine Wette mit ~INPUT_FRONTEND_UP~ ~INPUT_FRONTEND_DOWN~ einstellst!~q~"
BlackJackConfig.ActionReminder = "~t8~Mach einen Zug, oder du wirst vom Tisch verwiesen und verlierst dein gesetztes Geld!~q~" 
BlackJackConfig.ActionKick = "~t8~Du wurdest vom Tisch verwiesen...~q~"
BlackJackConfig.CantJoinTable = "~t8~Es läuft schon ein Spiel oder es ist kein Sitzplatz mehr frei am Tisch!~q~" 
BlackJackConfig.NoBuyInMoney = "~t8~Leider hast du nicht genug Bargeld bei dir, um am Tisch Platz zu nehmen!~q~"
BlackJackConfig.NoReBuyMoney = "~t8~Leider hast du nicht genug Bargeld bei dir.~q~"
BlackJackConfig.DealerBJackCheck = "Der Croupier prüft, ob er einen Blackjack hat..."
BlackJackConfig.DealerBJackWin = "Der Dealer hat auf anhieb einen Blackjack!"
BlackJackConfig.DealerBJackNone = "Der Dealer hat keinen Blackjack.\nDas Spiel kann beginnen."
BlackJackConfig.DrawResult = "~t8~%s:~q~ %2d"
BlackJackConfig.StartMoney = "\n~t2~Startgeld: ~q~"
BlackJackConfig.TakeAction = "~t8~Wähle eine Aktion aus~q~"
BlackJackConfig.PlaceBet = "~t8~Mache deinen Einsatz~q~"
BlackJackConfig.Croupier = "Croupier"
BlackJackConfig.Tie = "Unentschieden. Du bekommst deinen Einsatz zurück."
BlackJackConfig.Loose = "Du hast verloren!"
BlackJackConfig.Win32 = "Du hast einen ~t8~Blackjack~q~ mit deinen ersten beiden Karten. Gewinnauszahlung ist ~t8~3:2~q~ !"
BlackJackConfig.Win = "Du hast gewonnen!"
BlackJackConfig.Splitted = "Kartenstapel wurde aufgeteult. Du bedienst nun zwei Hände!\nWeitere ~t2~$%s~q~ gesetzt!"
BlackJackConfig.SplitNotPossible = "Du hast zu wenig Geld im Pot, um den Einsatz für die zweite Hand zu zahlen!"
BlackJackConfig.Hand = "~t2~Hand %s~q~" 
-- PLAYER STATES (NUI):
-- Don't remove the ${} values in Strings! HTML tags possible.
BlackJackConfig.PlayerStates = {
    waiting = "Warten…",
    inputBet = "Einsatz ausstehend…",
    betPlaced = "$${money} gesetzt",
    inputSelf = "Du bist dran…",
    inputOther = "${name} ist am Zug…",
    doubleDown = "Verdoppelt auf $${money}",
    bust = "Bust",
    hit = "Karte…",
    stand = "Gehalten",
    split = "Split",
    blackjack = "<span class='redtext'>Blackjack!</span>",
    waitOnPlayer = "Warten auf Spieler…",
    waitOnCards = "Warten auf Karten…",
    tie = "Unentschieden…",
    loose = "Verliert $${money}",
    win = "Gewinnt $${money}"
}
--[[ EXPERIMENTAL AREA
These can be used with the "custom" framework setting to provide
extra functionalities which need more information from a player than their name or money amount.
]]
-----------USE ITEM FOR TABLE ACCESS-------------
BlackJackConfig.ItemUsed = "Du hast ein Ticket benutzt und das Anté auf den Tisch gelegt."
BlackJackConfig.ItemNeeded = "Für diesen Tisch benötigen Sie ein Ticket vom Barkeeper."
-- add "buyInItem" property on a table config below to use and define the item name which should get checked. EXAMPLE:
-- buyInItem = "ticket"
-- add "buyInItemText" property on a table config below to define the text which is shown in the prompt. EXAMPLE:
-- buyInItemText = "You need a ticket to play!"
-------------------------------------------------
-- END OF EXPERIMENTAL AREA --

-- TABLE DATA
BlackJackConfig.Locations = {
    ["Rhodes"] = {
        -- blip settings
        showBlip = 35,
        blipSprite = 595820042,
        blipLocation = {x = 1338.58, y = -1372.52, z = 83.29, h = 0.0},
        -- npc settings
        npcModel = "s_m_m_rhddealer_01",
        npcVariant = 1,
        npcLod = 30,
        -- use the dealer chair for coodinates and heading
        npcCoords = {x = 1338.6427001953125, y = -1372.0277099609375, z = 83.29087829589844, h = 79.99996948242188},
        -- prompt settings
        Name = "Croupier",
        promptLocation = {x = 1339.09, y = -1372.07, z = 84.29, h = 354.05}, 
        -- individual table settings
        allowSplitting = true,
        buyIn = 4.0,
        maxBet = 2.0,
        dealerVoice = 2,
        -- Deck style for NUI. goes along with "props > deck" model below. 
        -- Check https://github.com/femga/rdr3_discoveries/tree/master/useful_info_from_rpfs/textures/ui_minigames/cards for downloadable card deck images
        deckStyle = 1,
      --  buyInItem = "theatre_ticket", --experimental. only compatible with "custom" framework setting as you need to return player inventory data!
      --  buyInItemText = "~t2~VIP Ticket benötigt!~q~", --experimental. only compatible with "custom" framework setting as you need to return player inventory data!
        -- seat settings
        seats = {
            -- these seats reflect the x/y/z/h position/heading of a chair object
            [1] = {x= 1339.874755859375,  y= -1370.9993896484375, z= 83.29087829589844, h= -32.49999618530273},
            [2] = {x= 1340.4522705078125, y= -1371.791259765625,  z= 83.29087829589844, h= -77.50001525878906},
            [3] = {x= 1340.2833251953125, y= -1372.7874755859375, z= 83.29087829589844, h= -122.49999237060547},
            [4] = {x= 1339.4761962890625, y= -1373.3804931640625, z= 83.29087829589844, h= -167.50009155273438}
        },
        -- prop settings
        props = {
            -- spawn objects on table. "deck" is used to get attached to the dealer.
            -- z-axis of deck gets used for the height of spawning card objects on the table
            ["caddy"] = {model= "p_blackjackcaddy01x", x= 1339.1068115234375,  y= -1372.5799560546875, z= 84.09647369384766, h= 66.0},
            ["deck"]  = {model= "p_cardssplit01x_rho", x= 1339.218994140625,   y= -1372.2493896484375, z= 84.09620666503906, h= -100.0}
        }
    },
    ["Blackwater"] = {
        showBlip = 35,
        blipSprite = 595820042,
        blipLocation = {x = -813.19, y = -1324.86, z = 47.61, h =0.0},
        npcModel = "s_m_m_blwdealer_01",
        npcVariant = 0,
        npcLod = 30,
        npcCoords = {x = -813.32080078125, y= -1323.307373046875, z= 46.88676452636719, h = 0.43521171808242},
        Name = "Croupier",
        promptLocation = {x = -813.3, y = -1323.96, z = 46.99, h = 0.0},
        allowSplitting = true,
        deckStyle = 1,
        buyIn = 4.0,
        maxBet = 2.0,
        dealerVoice = 3,
        seats = {
            [1] = {x= -812.0680541992188, y= -1324.3626708984375, z= 46.88676452636719, h= -109.96983337402344},
            [2] = {x= -812.7495727539062, y= -1325.0770263671875, z= 46.88676452636719, h= -154.96978759765625},
            [3] = {x= -813.7754516601562, y= -1325.104248046875,  z= 46.88676452636719, h= 160.0301513671875},
            [4] = {x= -814.5158081054688, y= -1324.4141845703125, z= 46.88676452636719, h= 116.47948455810547}
        },
        props = {
            ["caddy"] = {model= "p_blackjackcaddy01x", x= -813.7301635742188, y= -1323.9019775390625, z= 47.68981170654297, h= -26.0},
            ["deck"]  = {model= "p_cardssplit01x_bla", x= -813.4765625, y= -1323.95751953125, z= 47.68949127197265, h= 0.0}
        }
    },
    ["VanHorn"] = {
        showBlip = 35,
        blipSprite = 595820042,
        blipLocation = {x = 2937.99, y = 520.55, z = 45.06, h = 199.69},
        npcModel = "s_m_m_vhtdealer_01",
        npcVariant = 2,
        npcLod = 30,
        npcCoords = {x = 2937.872802734375, y = 520.0958251953125, z = 44.35330963134765, h = 127.10999298095703},
        Name = "Croupier",
        promptLocation = {x = 2938.28, y = 520.42, z = 45.33, h = 199.69}, 
        allowSplitting = true,
        deckStyle = 1,
        buyIn = 3.0,
        maxBet = 2.0,
        dealerVoice = 1,
        seats = {
            [1] = {x= 2937.935791015625, y= 521.6824951171875, z= 44.35330963134765, h= 16.70525550842285}, 
            [2] = {x= 2938.86328125,     y= 521.4798583984375, z= 44.35330963134765, h= -28.29470443725586}, 
            [3] = {x= 2939.517822265625, y= 520.7635498046875, z= 44.35330963134765, h= -73.29473876953125}, 
            [4] = {x= 2939.415771484375, y= 519.7772216796875, z= 44.35330963134765, h= -116.845458984375} 
        },
        props = {
            ["caddy"] = {model= "p_blackjackcaddy01x", x= 2938.521484375, y= 520.1231079101562, z= 45.14105606079101, h= 112.5},
            ["deck"]  = {model= "p_cardssplit01x_van", x= 2938.424072265625, y= 520.2999267578125, z= 45.15, h= 128.0}
        }
    }
}
-- Wrapper event names. Only used when BlackJackConfig.Framework is set to "custom"
Wrapper = {}
Wrapper.objectiveEvent = "myFrameWork:Objective"
Wrapper.TipEvent       = "myFrameWork:Tip"
Wrapper.HudOverride    = "myFrameWork:OverrideHUD"
Wrapper.getCharFromId  = "tm_blackjack:custom:getCharacterFromId" -- calls wrapper function from compatibility.lua