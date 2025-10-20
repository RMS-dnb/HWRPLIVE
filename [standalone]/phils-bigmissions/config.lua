Config = {}
---------------------------------
-- settings
---------------------------------
Config.DistanceSpawn = 20.0
Config.FadeIn = true
---------------------------------
-- texts
---------------------------------
Config.Texts = {
    npc_name = "Missions",
    target_label = "Talk to Stranger",
    dialogs = {
        initial = {
            title = "Strangers's Missions",
            message = "Hello! I have several jobs available. What kind of work interests you today?"
        },
        mission = {
            title = "%s", 
            message = "%s\nRequired Kills: %s\nProgress: %s" 
        },
        completed = {
            title = "%s",
            message = "You've eliminated all the %s! Ready to claim your reward?\nProgress: %s"
        },
        error = {
            title = "Mission Error",
            message = "You haven't eliminated all the required targets yet."
        },
        success = {
            title = "Mission Completed!",
            message = "Thank you for completing the job! Here's your reward."
        }
    },
    buttons = {
        select_bandits = "Clear Out Bandits ($25)",
        select_wolves = "Hunt Dangerous Wildlife ($30)",
        select_bears = "Eliminate Bear Threat ($15)",
        select_cougars = "Hunt Mountain Lions ($25)",
        select_gang_hideout = "Raid Gang Hideout ($25)",
        select_livestock = "Protect Livestock ($10)",
        select_back = "◄ Back to Menu",
        yes = "I'll take care of it",
        no = "Not right now",
        report = "I've eliminated them",
        come_back = "I'll come back later",
        thanks = "Thanks!"
    },
    notifications = {
        error = {
            title = "Error",
            missing_kills = "You haven't eliminated all the required targets."
        },
        success = {
            title = "Success!",
            completed = "You completed the %s mission and received $%s"
        }
    }
}
---------------------------------
-- npc locations
---------------------------------
Config.NPCLocations = {
    {
        name = 'Collector NPC',
        npcmodel = `loansharking_horsechase1_males_01`,
        npccoords = vector4(-953.54, -1332.15, 50.73, 103.94),
        showblip = true
    },
}
Config.Blip = {
    sprite = -164117130,
}
---------------------------------
-- missions
---------------------------------
Config.Missions = {
    bandits = {
        title = "Clear Out Bandits",
        name = "Clear Out Bandits",
        description = "A group of bandits has been harassing travelers on the nearby roads. I need you to eliminate them before they cause more trouble.",
        required_kills = {
            { npc = "bandit", amount = 10, label = "Bandits" }
        },
        npc_model = "loansharking_horsechase1_males_01",
        spawn_location = vector4(-1066.86, 449.54, 58.51, 190.64),
        reward = 25
    },
    wolves = {
        title = "Hunt Dangerous Wildlife",
        name = "Hunt Dangerous Wildlife",
        description = "Wolves have been attacking my supply routes and killing livestock. Please eliminate them to keep the area safe for travelers.",
        required_kills = {
            { npc = "wolf", amount = 3, label = "Wolves" }
        },
        npc_model = "A_C_Wolf",
        spawn_location = vector4(1078.91, 1425.83, 261.11, 136.74),
        reward = 30
    },
    bears = {
        title = "Eliminate Bear Threat",
        name = "Eliminate Bear Threat", 
        description = "A dangerous bear has been spotted near the settlement. It's already attacked two people. This is a high-priority elimination.",
        required_kills = {
            { npc = "bear", amount = 1, label = "Grizzly Bear" }
        },
        npc_model = "A_C_Bear_01",
        spawn_location = vector4(-1312.16, 1690.75, 327.13, 87.30),
        reward = 15
    },
    cougars = {
        title = "Hunt Mountain Lions",
        name = "Hunt Mountain Lions",
        description = "Mountain lions have been stalking hunters in the area. Take them out before someone gets seriously hurt.",
        required_kills = {
            { npc = "cougar", amount = 2, label = "Mountain Lions" }
        },
        npc_model = "A_C_Cougar_01",
        spawn_location = vector4(-2323.37, 590.07, 120.21, 85.28),
        reward = 25
    },
    gang_hideout = {
        title = "Raid Gang Hideout",
        name = "Raid Gang Hideout",
        description = "I've located a gang hideout where they're planning their next robbery. This is dangerous work - there are multiple armed criminals.",
        required_kills = {
            { npc = "gang_leader", amount = 4, label = "Gang Leader" },
            { npc = "gang_member", amount = 15, label = "Gang Members" }
        },
        npc_model = "mp_fm_stakeout_target_males_01", 
        spawn_location = vector4(-4236.42, -3490.36, 37.01, 229.26),
        reward = 100
    },
    livestock = {
        title = "Protect Livestock",
        name = "Protect Livestock",
        description = "Wild animals keep attacking the ranch livestock. Clear out the predators threatening the cattle and horses.",
        required_kills = {
            { npc = "wolf", amount = 2, label = "Wolves" },
            { npc = "cougar", amount = 1, label = "Mountain Lion" }
        },
        npc_model = "A_C_Wolf", -- Primary model, will spawn mixed
        spawn_location = vector4(-2400.45, -2405.31, 61.15, 92.82),
        reward = 10
    }
}