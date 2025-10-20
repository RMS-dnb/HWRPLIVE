Config = {}

Config.LawmenNeeded = 0 -- Global default (optional fallback)

Config.StoreRobberies = {
    ['Oil'] = {
        label = 'Rob Oil Armoir',
        object = 'p_armoir07x',
        robTime = 480000,
        cooldown = 1000000,
        coords = vector4(493.28, 674.69, 121.05, 67.24),
        itemNeeded = {item = 'lockpick', amount = 1},
        rewardAmount = {min = 450, max = 500},
        lawmenNeeded = 4, -- Specific requirement for this location
        allowedLawJobs = {'nhso', 'usms'}, -- Jobs that count as law for this location
        rewardItems = {
            {item = "catch_container", itemLabel = "Catch Container", count = 1, chance = 70},
            {item = "forged_key", itemLabel = "Forged Key", count = 1, chance = 20},
            {item = "brokenkey", itemLabel = "Broken Key", count = 2, chance = 30},
            {item = "brokendetonator", itemLabel = "Broken Detonator", count = 2, chance = 60},
        },
        animations = {
        ['player'] = {  
                male = {
                    dict = "script_ca@carust@02@ig@ig1_rustlerslockpickingconv01",
                    cond = "convo_lockpick_smhthug_01",
                },
                female = {
                    dict = "script_ca@carust@02@ig@ig1_rustlerslockpickingconv01",
                    cond = "convo_lockpick_smhthug_01",
                },
            }
        },
    },
    ['Blackwater'] = {
        label = 'Rob Blackwater Cityhall',
        object = 's_vault_sml_r_val01x_high',
        robTime = 5000,
        cooldown = 1000000, 
        coords = vector4(-788.54, -1195.88, 47.47, 169.34),
        itemNeeded = {item = 'lockpick', amount = 1},
        rewardAmount = {min = 450, max = 550},
        lawmenNeeded = 4, -- Different requirement for this location
        allowedLawJobs = {'usms', 'naso'}, -- Different allowed jobs
        rewardItems = {
            {item = "forged_key", itemLabel = "Forged Key", count = 1, chance = 20},
            {item = "ornatekey", itemLabel = "Ornate Key", count = 2, chance = 80},
            {item = "brokenkey", itemLabel = "Broken Key", count = 2, chance = 70},
            {item = "bankletter", itemLabel = "Bank Letter", count = 1, chance = 65},
        },
        animations = {
        ['player'] = {  
                male = {
                    dict = "script_ca@carust@02@ig@ig1_rustlerslockpickingconv01",
                    cond = "convo_lockpick_smhthug_01",
                },
                female = {
                    dict = "script_ca@carust@02@ig@ig1_rustlerslockpickingconv01",
                    cond = "convo_lockpick_smhthug_01",
                },
            }
        },
    },
    ['Valentine'] = {
        label = 'Rob Valentine General Store',
        object = 'p_register03x',
        robTime = 780000,
        cooldown = 800000,
        coords = vector4(-324.28, 804.24, 117.89, 278.05),
        itemNeeded = {item = 'lockpick', amount = 1},
        rewardAmount = {min = 450, max = 550},
        lawmenNeeded = 4, -- Another different requirement
        allowedLawJobs = {'nhso', 'usms'}, -- Different allowed jobs
        rewardItems = {
            {item = "forged_key", itemLabel = "Forged Key", count = 1, chance = 20},
            {item = "ornatekey", itemLabel = "Ornate Key", count = 2, chance = 80},
            {item = "brokenkey", itemLabel = "Broken Key", count = 2, chance = 70},
            {item = "bankletter", itemLabel = "Bank Letter", count = 1, chance = 65},
        },
        animations = {
        ['player'] = {  
                male = {
                    dict = "script_ca@carust@02@ig@ig1_rustlerslockpickingconv01",
                    cond = "convo_lockpick_smhthug_01",
                },
                female = {
                    dict = "script_ca@carust@02@ig@ig1_rustlerslockpickingconv01",
                    cond = "convo_lockpick_smhthug_01",
                },
            }
        },
    },

    ['Strawberry'] = {
        label = 'Rob Strawberry General Store',
        object = 'p_register03x',
        robTime = 780000,
        cooldown = 800000,
        coords = vector4(-1789.26, -387.4, 160.34, 64.56),
        itemNeeded = {item = 'lockpick', amount = 1},
        rewardAmount = {min = 450, max = 550},
        lawmenNeeded = 4, -- Another different requirement
        allowedLawJobs = {'usms', 'naso'}, -- Different allowed jobs
        rewardItems = {
            {item = "forged_key", itemLabel = "Forged Key", count = 1, chance = 20},
            {item = "ornatekey", itemLabel = "Ornate Key", count = 2, chance = 80},
            {item = "brokenkey", itemLabel = "Broken Key", count = 2, chance = 70},
            {item = "bankletter", itemLabel = "Bank Letter", count = 1, chance = 65},
        },
        animations = {
        ['player'] = {  
                male = {
                    dict = "script_ca@carust@02@ig@ig1_rustlerslockpickingconv01",
                    cond = "convo_lockpick_smhthug_01",
                },
                female = {
                    dict = "script_ca@carust@02@ig@ig1_rustlerslockpickingconv01",
                    cond = "convo_lockpick_smhthug_01",
                },
            }
        },
    },

    ['Blackwatershop'] = {
        label = 'Rob Blackwater General Store',
        object = 'p_register03x',
        robTime = 780000,
        cooldown = 800000,
        coords = vector4(-785.29, -1323.85, 43.89, 5.88),
        itemNeeded = {item = 'lockpick', amount = 1},
        rewardAmount = {min = 450, max = 550},
        lawmenNeeded = 4, -- Another different requirement
        allowedLawJobs = {'usms', 'naso'}, -- Different allowed jobs
        rewardItems = {
            {item = "forged_key", itemLabel = "Forged Key", count = 1, chance = 20},
            {item = "ornatekey", itemLabel = "Ornate Key", count = 2, chance = 80},
            {item = "brokenkey", itemLabel = "Broken Key", count = 2, chance = 70},
            {item = "bankletter", itemLabel = "Bank Letter", count = 1, chance = 65},
        },
        animations = {
        ['player'] = {  
                male = {
                    dict = "script_ca@carust@02@ig@ig1_rustlerslockpickingconv01",
                    cond = "convo_lockpick_smhthug_01",
                },
                female = {
                    dict = "script_ca@carust@02@ig@ig1_rustlerslockpickingconv01",
                    cond = "convo_lockpick_smhthug_01",
                },
            }
        },
    },

    ['Rhodesshop'] = {
        label = 'Rob Rhodes General Store',
        object = 'p_register05x',
        robTime = 780000,
        cooldown = 800000,
        coords = vector4(1328.43, -1292.87, 77.03, 147.28),
        itemNeeded = {item = 'lockpick', amount = 1},
        rewardAmount = {min = 450, max = 550},
        lawmenNeeded = 4, -- Another different requirement
        allowedLawJobs = {'usms', 'nhso'}, -- Different allowed jobs
        rewardItems = {
            {item = "forged_key", itemLabel = "Forged Key", count = 1, chance = 20},
            {item = "ornatekey", itemLabel = "Ornate Key", count = 2, chance = 80},
            {item = "brokenkey", itemLabel = "Broken Key", count = 2, chance = 70},
            {item = "bankletter", itemLabel = "Bank Letter", count = 1, chance = 65},
        },
        animations = {
        ['player'] = {  
                male = {
                    dict = "script_ca@carust@02@ig@ig1_rustlerslockpickingconv01",
                    cond = "convo_lockpick_smhthug_01",
                },
                female = {
                    dict = "script_ca@carust@02@ig@ig1_rustlerslockpickingconv01",
                    cond = "convo_lockpick_smhthug_01",
                },
            }
        },
    },
    ['Rhodesbank'] = {
        label = 'Rob Rhodes General Store',
        object = 'p_desk09bx',
        robTime = 780000,
        cooldown = 800000,
        coords = vector4(1288.06, -1309.43, 77.07, 309.64),
        itemNeeded = {item = 'lockpick', amount = 1},
        rewardAmount = {min = 150, max = 250},
        lawmenNeeded = 4, -- Another different requirement
        allowedLawJobs = {'usms', 'nhso'}, -- Different allowed jobs
        rewardItems = {
            {item = "bankletter", itemLabel = "Bank Letter", count = 1, chance = 80},
            {item = "ornatekey", itemLabel = "Ornate Key", count = 2, chance = 80},
            {item = "brokenkey", itemLabel = "Broken Key", count = 2, chance = 70},
        },
        animations = {
        ['player'] = {  
                male = {
                    dict = "script_ca@carust@02@ig@ig1_rustlerslockpickingconv01",
                    cond = "convo_lockpick_smhthug_01",
                },
                female = {
                    dict = "script_ca@carust@02@ig@ig1_rustlerslockpickingconv01",
                    cond = "convo_lockpick_smhthug_01",
                },
            }
        },
    },

    ['Saintdenis'] = {
        label = 'Rob St Denis General Store',
        object = 'p_register03x',
        robTime = 780000,
        cooldown = 800000,
        coords = vector4(2826.33, -1318.8, 46.76, 127.78),
        itemNeeded = {item = 'lockpick', amount = 1},
        rewardAmount = {min = 450, max = 550},
        lawmenNeeded = 4, -- Another different requirement
        allowedLawJobs = {'usms', 'nhso'}, -- Different allowed jobs
        rewardItems = {
            {item = "forged_key", itemLabel = "Forged Key", count = 1, chance = 20},
            {item = "ornatekey", itemLabel = "Ornate Key", count = 2, chance = 80},
            {item = "brokenkey", itemLabel = "Broken Key", count = 2, chance = 70},
            {item = "bankletter", itemLabel = "Bank Letter", count = 1, chance = 65},
        },
        animations = {
        ['player'] = {  
                male = {
                    dict = "script_ca@carust@02@ig@ig1_rustlerslockpickingconv01",
                    cond = "convo_lockpick_smhthug_01",
                },
                female = {
                    dict = "script_ca@carust@02@ig@ig1_rustlerslockpickingconv01",
                    cond = "convo_lockpick_smhthug_01",
                },
            }
        },
    },

    ['Saintdenisbank'] = {
        label = 'Rob Drawer',
        object = 'p_desk09x',
        robTime = 780000,
        cooldown = 800000,
        coords = vector4(2650.58, -1305.37, 52.27, 55.13),
        itemNeeded = {item = 'lockpick', amount = 1},
        rewardAmount = {min = 150, max = 250},
        lawmenNeeded = 4, -- Another different requirement
        allowedLawJobs = {'usms', 'nhso'}, -- Different allowed jobs
        rewardItems = {
            {item = "bankletter", itemLabel = "Bank Letter", count = 1, chance = 80},
            {item = "ornatekey", itemLabel = "Ornate Key", count = 2, chance = 80},
            
        },
        animations = {
        ['player'] = {  
                male = {
                    dict = "script_ca@carust@02@ig@ig1_rustlerslockpickingconv01",
                    cond = "convo_lockpick_smhthug_01",
                },
                female = {
                    dict = "script_ca@carust@02@ig@ig1_rustlerslockpickingconv01",
                    cond = "convo_lockpick_smhthug_01",
                },
            }
        },
    },

    ['Vanhorn'] = {
        label = 'Rob Van Horn General Store',
        object = 'p_register08x',
        robTime = 780000,
        cooldown = 800000,
        coords = vector4(3026.99, 560.95, 44.73, 77.09),
        itemNeeded = {item = 'lockpick', amount = 1},
        rewardAmount = {min = 350, max = 450},
        lawmenNeeded = 4, -- Another different requirement
        allowedLawJobs = {'usms', 'nhso'}, -- Different allowed jobs
        rewardItems = {
            {item = "forged_key", itemLabel = "Forged Key", count = 1, chance = 20},
            {item = "ornatekey", itemLabel = "Ornate Key", count = 2, chance = 80},
            {item = "brokenkey", itemLabel = "Broken Key", count = 2, chance = 70},
            {item = "bankletter", itemLabel = "Bank Letter", count = 1, chance = 65},
        },
        animations = {
        ['player'] = {  
                male = {
                    dict = "script_ca@carust@02@ig@ig1_rustlerslockpickingconv01",
                    cond = "convo_lockpick_smhthug_01",
                },
                female = {
                    dict = "script_ca@carust@02@ig@ig1_rustlerslockpickingconv01",
                    cond = "convo_lockpick_smhthug_01",
                },
            }
        },
    },

    ['Wallace'] = {
        label = 'Rob Wallace General Store',
        object = 'p_register03x',
        robTime = 780000,
        cooldown = 800000,
        coords = vector4(3026.99, 560.95, 44.73, 77.09),
        itemNeeded = {item = 'lockpick', amount = 1},
        rewardAmount = {min = 350, max = 450},
        lawmenNeeded = 4, -- Another different requirement
        allowedLawJobs = {'usms', 'nhso'}, -- Different allowed jobs
        rewardItems = {
            {item = "forged_key", itemLabel = "Forged Key", count = 1, chance = 20},
            {item = "ornatekey", itemLabel = "Ornate Key", count = 2, chance = 80},
            {item = "brokenkey", itemLabel = "Broken Key", count = 2, chance = 70},
            {item = "bankletter", itemLabel = "Bank Letter", count = 1, chance = 65},
        },
        animations = {
        ['player'] = {  
                male = {
                    dict = "script_ca@carust@02@ig@ig1_rustlerslockpickingconv01",
                    cond = "convo_lockpick_smhthug_01",
                },
                female = {
                    dict = "script_ca@carust@02@ig@ig1_rustlerslockpickingconv01",
                    cond = "convo_lockpick_smhthug_01",
                },
            }
        },
    },
    ['Rigs'] = {
        label = 'Rob Riggs Postal Office',
        object = 'p_journal_open01x',
        robTime = 780000,
        cooldown = 800000,
        coords = vector4(-1093.87, -577.04, 82.42, 43.88),
        itemNeeded = {item = 'lockpick', amount = 1},
        rewardAmount = {min = 350, max = 450},
        lawmenNeeded = 4, -- Another different requirement
        allowedLawJobs = {'usms', 'naso'}, -- Different allowed jobs
        rewardItems = {
            {item = "forged_key", itemLabel = "Forged Key", count = 1, chance = 20},
            {item = "ornatekey", itemLabel = "Ornate Key", count = 2, chance = 80},
            {item = "brokenkey", itemLabel = "Broken Key", count = 2, chance = 70},
            {item = "bankletter", itemLabel = "Bank Letter", count = 1, chance = 65},
        },
        animations = {
        ['player'] = {  
                male = {
                    dict = "script_ca@carust@02@ig@ig1_rustlerslockpickingconv01",
                    cond = "convo_lockpick_smhthug_01",
                },
                female = {
                    dict = "script_ca@carust@02@ig@ig1_rustlerslockpickingconv01",
                    cond = "convo_lockpick_smhthug_01",
                },
            }
        },
    },



    ['Annesburg'] = {
        label = 'Rob Annesburg General Store',
        object = 'p_register08x',
        robTime = 780000,
        cooldown = 800000,
        coords = vector4(2925.54, 1366.82, 45.19, 159.45),
        itemNeeded = {item = 'lockpick', amount = 1},
        rewardAmount = {min = 350, max = 450},
        lawmenNeeded = 4, -- Another different requirement
        allowedLawJobs = {'usms', 'nhso'}, -- Different allowed jobs
        rewardItems = {
            {item = "forged_key", itemLabel = "Forged Key", count = 1, chance = 20},
            {item = "ornatekey", itemLabel = "Ornate Key", count = 2, chance = 80},
            {item = "brokenkey", itemLabel = "Broken Key", count = 2, chance = 70},
            {item = "bankletter", itemLabel = "Bank Letter", count = 1, chance = 65},
        },
        animations = {
        ['player'] = {  
                male = {
                    dict = "script_ca@carust@02@ig@ig1_rustlerslockpickingconv01",
                    cond = "convo_lockpick_smhthug_01",
                },
                female = {
                    dict = "script_ca@carust@02@ig@ig1_rustlerslockpickingconv01",
                    cond = "convo_lockpick_smhthug_01",
                },
            }
        },
    },

    ['Tumbleweed'] = {
        label = 'Rob Tumbleweed General Store',
        object = 'p_register03x',
        robTime = 780000,
        cooldown = 800000,
        coords = vector4(-5487.75, -2938.39, -0.38, 307.86),
        itemNeeded = {item = 'lockpick', amount = 1},
        rewardAmount = {min = 350, max = 450},
        lawmenNeeded = 4, -- Another different requirement
        allowedLawJobs = {'usms', 'naso'}, -- Different allowed jobs
        rewardItems = {
            {item = "forged_key", itemLabel = "Forged Key", count = 1, chance = 20},
            {item = "ornatekey", itemLabel = "Ornate Key", count = 2, chance = 80},
            {item = "brokenkey", itemLabel = "Broken Key", count = 2, chance = 70},
            {item = "bankletter", itemLabel = "Bank Letter", count = 1, chance = 65},
        },
        animations = {
        ['player'] = {  
                male = {
                    dict = "script_ca@carust@02@ig@ig1_rustlerslockpickingconv01",
                    cond = "convo_lockpick_smhthug_01",
                },
                female = {
                    dict = "script_ca@carust@02@ig@ig1_rustlerslockpickingconv01",
                    cond = "convo_lockpick_smhthug_01",
                },
            }
        },
    },

    ['Armadillo'] = {
        label = 'Rob Armadillo General Store',
        object = 'p_register08x',
        robTime = 780000,
        cooldown = 800000,
        coords = vector4(-3685.51, -2622.82, -13.42, 74.68),
        itemNeeded = {item = 'lockpick', amount = 1},
        rewardAmount = {min = 400, max = 500},
        lawmenNeeded = 4, -- Another different requirement
        allowedLawJobs = {'usms', 'naso'}, -- Different allowed jobs
        rewardItems = {
            {item = "forged_key", itemLabel = "Forged Key", count = 1, chance = 20},
            {item = "ornatekey", itemLabel = "Ornate Key", count = 2, chance = 80},
            {item = "brokenkey", itemLabel = "Broken Key", count = 2, chance = 70},
            {item = "bankletter", itemLabel = "Bank Letter", count = 1, chance = 65},
        },
        animations = {
        ['player'] = {  
                male = {
                    dict = "script_ca@carust@02@ig@ig1_rustlerslockpickingconv01",
                    cond = "convo_lockpick_smhthug_01",
                },
                female = {
                    dict = "script_ca@carust@02@ig@ig1_rustlerslockpickingconv01",
                    cond = "convo_lockpick_smhthug_01",
                },
            }
        },
    },
}