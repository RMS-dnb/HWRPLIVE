Config = {}

-- settings
Config.EnableExtraMenu = false
Config.Keybind = 'F6'
Config.HoldToOpen = false

Config.MenuItems = {
    [1] = {
        id = 'horse',
        title = 'Horse',
        icon = 'horse-head',
        items = {
            {
                id = 'callhorse',
                title = 'Call Horse',
                icon = 'lightbulb',
                type = 'command',
                event = 'horse',
                shouldClose = true
            },
        },
    },
    [2] = {
        id = 'user',
        title = 'User',
        icon = 'user',
        items = {
            
                
            {
                id = 'jobs',
                title = 'Jobs',
                icon = 'circle-user',
                type = 'command',
                event = 'myjobs',
                shouldClose = true
            },
            {
                id = 'duty',
                title = 'Duty',
                icon = 'circle-user',
                type = 'command',
                event = 'duty',
                shouldClose = true
            },
            {
                id= 'adressbook',
                title = 'Address book',
                icon = 'address-book',
                type = 'client',
                event = 'bangdai-telegram:client:OpenAddressBook',
                shouldClose = true
            },
            {
                id = 'emotes',
                title = 'Emotes/Walkstyle',
                icon = 'circle-user',
                type = 'command',
                event = 'emotemenu',
                shouldClose = true
            },
            -- {
            --     id = 'pvptoggle',
            --     title = 'Toggle PVP on/off',
            --     icon = 'hand-holding-hand',
            --     type = 'client',
            --     event = 'rsg-essentials:client:pvpToggle',
            --     shouldClose = true
            -- },
            {
                id = 'hudmenu',
                title = 'Hud Settings',
                icon = 'hand-holding-hand',
                type = 'command',
                event = 'hudmenu',
                shouldClose = true
            },
            {
                id = 'bandana',
                title = 'Bandana',
                icon = 'hand-holding-hand',
                type = 'client',
                event = 'murphy_clothes:Equip-UnequipCategory", masks)',
                shouldClose = true
            },  
           
        },
    },
    
    [3] = {
         id = 'loadclothes',
         title = 'Fix Clothes',
         icon = 'recycle',
         type = 'command',
         event = 'loadclothes',
         shouldClose = true
    },
    [4] = {
         id = 'playerinfo',
         title = 'Your Info',
         icon = 'book',
         type = 'command',
         event = 'info',
         shouldClose = true
    },
    
    [5] = {
        id = 'map',
        title = 'Mark your Map',
        icon = 'map',
        type = 'command',
        event = "sharemap",
        shouldClose = true
    },
    
    
    
}

Config.JobInteractions = {
    ['medic'] = {
        
        {
            id = 'revivep',
            title = 'Tonic Revive',
            icon = 'user-doctor',
            type = 'client',
            event = 'rsg-medic:client:RevivePlayer',
            shouldClose = true
        },
        {
            id = 'activity',
            title = 'Medical Activity',
            icon = 'user-lock',
            type = 'command',
            event = 'medicactivitymenu',
            shouldClose = true
        },
        {
            id = 'createfine',
            title = 'Issue Bill',
            icon = 'user-doctor',
            type = 'command',
            event = 'createfine',
            shouldClose = true
        },
        {
            id = 'seefine',
            title = 'Outstanding Bills',
            icon = 'user-doctor',
            type = 'command',
            event = 'seefines',
            shouldClose = true
        },
        {
            id = 'treatwounds',
            title = 'Heal wounds',
            icon = 'bandage',
            type = 'client',
            event = 'rsg-medic:client:TreatWounds',
            shouldClose = true
        }
    },

    ['vtwilddoctor'] = {
        
        {
            id = 'revivep',
            title = 'Tonic Revive',
            icon = 'user-doctor',
            type = 'client',
            event = 'rsg-medic:client:RevivePlayer',
            shouldClose = true
        },
      
        
        {
            id = 'treatwounds',
            title = 'Heal wounds',
            icon = 'bandage',
            type = 'client',
            event = 'rsg-medic:client:TreatWounds',
            shouldClose = true
        }
    },

    ['rdwilddoctor'] = {
        
        {
            id = 'revivep',
            title = 'Tonic Revive',
            icon = 'user-doctor',
            type = 'client',
            event = 'rsg-medic:client:RevivePlayer',
            shouldClose = true
        },
      
        
        {
            id = 'treatwounds',
            title = 'Heal wounds',
            icon = 'bandage',
            type = 'client',
            event = 'rsg-medic:client:TreatWounds',
            shouldClose = true
        }
    },

    ['vhwilddoctor'] = {
        
        {
            id = 'revivep',
            title = 'Tonic Revive',
            icon = 'user-doctor',
            type = 'client',
            event = 'rsg-medic:client:RevivePlayer',
            shouldClose = true
        },
      
        
        {
            id = 'treatwounds',
            title = 'Heal wounds',
            icon = 'bandage',
            type = 'client',
            event = 'rsg-medic:client:TreatWounds',
            shouldClose = true
        }
    },
    ['wilddoctor'] = {
        
        {
            id = 'revivep',
            title = 'Tonic Revive',
            icon = 'user-doctor',
            type = 'client',
            event = 'rsg-medic:client:RevivePlayer',
            shouldClose = true
        },
      
        
        {
            id = 'treatwounds',
            title = 'Heal wounds',
            icon = 'bandage',
            type = 'client',
            event = 'rsg-medic:client:TreatWounds',
            shouldClose = true
        }
    },
    ['tipaniwilddoctor'] = {
        
        {
            id = 'revivep',
            title = 'Tonic Revive',
            icon = 'user-doctor',
            type = 'client',
            event = 'rsg-medic:client:RevivePlayer',
            shouldClose = true
        },
      
        
        {
            id = 'treatwounds',
            title = 'Heal wounds',
            icon = 'bandage',
            type = 'client',
            event = 'rsg-medic:client:TreatWounds',
            shouldClose = true
        }
    },

    ['sbprivatedoc'] = {
        
        {
            id = 'revivep',
            title = 'Tonic Revive',
            icon = 'user-doctor',
            type = 'client',
            event = 'rsg-medic:client:RevivePlayer',
            shouldClose = true
        },
      
        
        {
            id = 'treatwounds',
            title = 'Heal wounds',
            icon = 'bandage',
            type = 'client',
            event = 'rsg-medic:client:TreatWounds',
            shouldClose = true
        }
    },

    ['sdprivatedoc'] = {
        
        {
            id = 'revivep',
            title = 'Tonic Revive',
            icon = 'user-doctor',
            type = 'client',
            event = 'rsg-medic:client:RevivePlayer',
            shouldClose = true
        },
      
        
        {
            id = 'treatwounds',
            title = 'Heal wounds',
            icon = 'bandage',
            type = 'client',
            event = 'rsg-medic:client:TreatWounds',
            shouldClose = true
        }
    },


    ['taxi'] = {
        {
            id = 'toggletaxi',
            title = 'toggletaxi',
            icon = 'exclamation',
            type = 'command',
            event = 'taxi',
            shouldClose = true
        },
		{
            id = 'spawntaxi',
            title = 'spawntaxi',
            icon = 'exclamation',
            type = 'command',
            event = 'spawntaxi',
            shouldClose = true
        },
		{
            id = 'deletetaxi',
            title = 'deletetaxi',
            icon = 'exclamation',
            type = 'command',
            event = 'deletetaxi',
            shouldClose = true
        }
    },
    ['nhso'] = {
        -- {
        --     id = 'policebutton',
        --     title = 'Emergency Button',
        --     icon = 'exclamation',
        --     type = 'client',
        --     event = 'rsg-radialmenu:client:SendLawmanEmergencyAlert',
        --     shouldClose = true
        -- },
        -- {
        --     id = 'activity',
        --     title = 'Activity/Bounty',
        --     icon = 'user-lock',
        --     type = 'command',
        --     event = 'activitymenu',
        --     shouldClose = true
        -- },
        {
            id = 'handcuff',
            title = 'Cuff',
            icon = 'user-lock',
            type = 'client',
            event = 'rsg-lawman:client:cuffplayer',
            shouldClose = true
        },
        {
            id = 'escort',
            title = 'Escort',
            icon = 'user-group',
            type = 'client',
            event = 'rsg-lawman:client:escortplayer',
            shouldClose = true
        },
        -- {
        --     id = 'jailplayer',
        --     title = 'Jail',
        --     icon = 'user-lock',
        --     type = 'client',
        --     event = 'rsg-lawman:client:jailplayer',
        --     shouldClose = true
        -- },
        {
            id = 'lawbadge',
            title = 'Badge On/Off',
            icon = 'id-badge',
            type = 'command',
            event = 'lawbadge',
            shouldClose = true
        },
        {
            id = 'createfine',
            title = 'Issue Fine',
            icon = 'user-doctor',
            type = 'command',
            event = 'createfine',
            shouldClose = true
        },
        {
            id = 'seefine',
            title = 'Outstanding Fines',
            icon = 'user-doctor',
            type = 'command',
            event = 'seefines',
            shouldClose = true
        },
       
    },
    ['usms'] = {
        -- {
        --     id = 'policebutton',
        --     title = 'Emergency Button',
        --     icon = 'exclamation',
        --     type = 'client',
        --     event = 'rsg-radialmenu:client:SendLawmanEmergencyAlert',
        --     shouldClose = true
        -- },
        -- {
        --     id = 'activity',
        --     title = 'Activity/Bounty',
        --     icon = 'user-lock',
        --     type = 'command',
        --     event = 'activitymenu',
        --     shouldClose = true
        -- },
        {
            id = 'handcuff',
            title = 'Cuff',
            icon = 'user-lock',
            type = 'client',
            event = 'rsg-lawman:client:cuffplayer',
            shouldClose = true
        },
        {
            id = 'escort',
            title = 'Escort',
            icon = 'user-group',
            type = 'client',
            event = 'rsg-lawman:client:escortplayer',
            shouldClose = true
        },
        -- {
        --     id = 'jailplayer',
        --     title = 'Jail',
        --     icon = 'user-lock',
        --     type = 'client',
        --     event = 'rsg-lawman:client:jailplayer',
        --     shouldClose = true
        -- },
        {
            id = 'lawbadge',
            title = 'Badge On/Off',
            icon = 'id-badge',
            type = 'command',
            event = 'lawbadge',
            shouldClose = true
        },
        {
            id = 'createfine',
            title = 'Issue Fine',
            icon = 'user-doctor',
            type = 'command',
            event = 'createfine',
            shouldClose = true
        },
        {
            id = 'seefine',
            title = 'Outstanding Fines',
            icon = 'user-doctor',
            type = 'command',
            event = 'seefines',
            shouldClose = true
        },
    },
    ['doj'] = {
        -- {
        --     id = 'policebutton',
        --     title = 'Emergency Button',
        --     icon = 'exclamation',
        --     type = 'client',
        --     event = 'rsg-radialmenu:client:SendLawmanEmergencyAlert',
        --     shouldClose = true
        -- },
        -- {
        --     id = 'activity',
        --     title = 'Activity/Bounty',
        --     icon = 'user-lock',
        --     type = 'command',
        --     event = 'activitymenu',
        --     shouldClose = true
        -- },
        {
            id = 'handcuff',
            title = 'Cuff',
            icon = 'user-lock',
            type = 'client',
            event = 'rsg-lawman:client:cuffplayer',
            shouldClose = true
        },
        {
            id = 'escort',
            title = 'Escort',
            icon = 'user-group',
            type = 'client',
            event = 'rsg-lawman:client:escortplayer',
            shouldClose = true
        },
        -- {
        --     id = 'jailplayer',
        --     title = 'Jail',
        --     icon = 'user-lock',
        --     type = 'client',
        --     event = 'rsg-lawman:client:jailplayer',
        --     shouldClose = true
        -- },
        {
            id = 'lawbadge',
            title = 'Badge On/Off',
            icon = 'id-badge',
            type = 'command',
            event = 'lawbadge',
            shouldClose = true
        },
        {
            id = 'createfine',
            title = 'Issue Fine',
            icon = 'user-doctor',
            type = 'command',
            event = 'createfine',
            shouldClose = true
        },
        {
            id = 'seefine',
            title = 'Outstanding Fines',
            icon = 'user-doctor',
            type = 'command',
            event = 'seefines',
            shouldClose = true
        },
    },
    ['naso'] = {
        -- {
        --     id = 'policebutton',
        --     title = 'Emergency Button',
        --     icon = 'exclamation',
        --     type = 'client',
        --     event = 'rsg-radialmenu:client:SendLawmanEmergencyAlert',
        --     shouldClose = true
        -- },
        -- {
        --     id = 'activity',
        --     title = 'Activity/Bounty',
        --     icon = 'user-lock',
        --     type = 'command',
        --     event = 'activitymenu',
        --     shouldClose = true
        -- },
        {
            id = 'handcuff',
            title = 'Cuff',
            icon = 'user-lock',
            type = 'client',
            event = 'rsg-lawman:client:cuffplayer',
            shouldClose = true
        },
        {
            id = 'escort',
            title = 'Escort',
            icon = 'user-group',
            type = 'client',
            event = 'rsg-lawman:client:escortplayer',
            shouldClose = true
        },
        -- {
        --     id = 'jailplayer',
        --     title = 'Jail',
        --     icon = 'user-lock',
        --     type = 'client',
        --     event = 'rsg-lawman:client:jailplayer',
        --     shouldClose = true
        -- },
        {
            id = 'lawbadge',
            title = 'Badge On/Off',
            icon = 'id-badge',
            type = 'command',
            event = 'lawbadge',
            shouldClose = true
        },
        {
            id = 'createfine',
            title = 'Issue Fine',
            icon = 'user-doctor',
            type = 'command',
            event = 'createfine',
            shouldClose = true
        },
        {
            id = 'seefine',
            title = 'Outstanding Fines',
            icon = 'user-doctor',
            type = 'command',
            event = 'seefines',
            shouldClose = true
        },
    },
    ['lso'] = {
       
        -- {
        --     id = 'activity',
        --     title = 'Activity/Bounty',
        --     icon = 'user-lock',
        --     type = 'command',
        --     event = 'activitymenu',
        --     shouldClose = true
        -- },
        {
            id = 'handcuff',
            title = 'Cuff',
            icon = 'user-lock',
            type = 'client',
            event = 'rsg-lawman:client:cuffplayer',
            shouldClose = true
        },
        {
            id = 'escort',
            title = 'Escort',
            icon = 'user-group',
            type = 'client',
            event = 'rsg-lawman:client:escortplayer',
            shouldClose = true
        },
        -- {
        --     id = 'jailplayer',
        --     title = 'Jail',
        --     icon = 'user-lock',
        --     type = 'client',
        --     event = 'rsg-lawman:client:jailplayer',
        --     shouldClose = true
        -- },
        {
            id = 'lawbadge',
            title = 'Badge On/Off',
            icon = 'id-badge',
            type = 'command',
            event = 'lawbadge',
            shouldClose = true
        },
        {
            id = 'createfine',
            title = 'Issue Fine',
            icon = 'user-doctor',
            type = 'command',
            event = 'createfine',
            shouldClose = true
        },
        {
            id = 'seefine',
            title = 'Outstanding Fines',
            icon = 'user-doctor',
            type = 'command',
            event = 'seefines',
            shouldClose = true
        },

        
    },
}
