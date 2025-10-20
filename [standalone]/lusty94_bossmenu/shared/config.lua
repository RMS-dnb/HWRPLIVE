Config = {}


--
--██╗░░░░░██╗░░░██╗░██████╗████████╗██╗░░░██╗░█████╗░░░██╗██╗
--██║░░░░░██║░░░██║██╔════╝╚══██╔══╝╚██╗░██╔╝██╔══██╗░██╔╝██║
--██║░░░░░██║░░░██║╚█████╗░░░░██║░░░░╚████╔╝░╚██████║██╔╝░██║
--██║░░░░░██║░░░██║░╚═══██╗░░░██║░░░░░╚██╔╝░░░╚═══██║███████║
--███████╗╚██████╔╝██████╔╝░░░██║░░░░░░██║░░░░█████╔╝╚════██║
--╚══════╝░╚═════╝░╚═════╝░░░░╚═╝░░░░░░╚═╝░░░░╚════╝░░░░░░╚═╝


-- Thank you for downloading this script!

-- Below you can change multiple options to suit your server needs.

-- Extensive documentation detailing this script and how to confiure it correclty can be found here: https://lusty94-scripts.gitbook.io/documentation/free/boss-menu

Config.CoreSettings = {
    Debug = {
        Prints = false, -- sends debug prints to f8 console and txadmin server console
        Zones = false, -- debug circle zones for menu locations
    },
    Target = { -- target type - support for rsg-target and ox_target  
        Type = 'ox',      
        --EDIT CLIENT/BOSSMENU_CLIENT.LUA TO ADD YOUR OWN TARGET SUPPORT
        --use 'qb' for rsg-target
        --use 'ox' for ox_target
        --use 'custom' for custom target
    },
    Notify = { -- notification type - support for rsg-core notify okokNotify, mythic_notify, ox_lib notify and qs-notify (experimental not tested)
        --EDIT CLIENT/BOSSMENU_CLIENT.LUA & SERVER/BOSSMENU_SERVER.LUA TO ADD YOUR OWN NOTIFY SUPPORT
        Type = 'ox',
        --use 'qb' for default rsg-core notify
        --use 'okok' for okokNotify
        --use 'mythic' for mythic_notify
        --use 'ox' for ox_lib notify
        --use 'qs' for qs-notify (experimental not tested) (qs-interface)  -- some logic might need adjusting
        --use 'custom' for custom notifications
    },
    Inventory = { -- inventory type - support for rsg-inventory ox_inventory - (THIS IS ONLY USED FOR THE CASH DEPOSIT)
        --EDIT CLIENT/BOSSMENU_CLIENT.LUA & SERVER/BOSSMENU_SERVER.LUA TO ADD YOUR OWN INVENTORY SUPPORT
        Type = 'qb',
        --use 'qb' for rsg-inventory
        --use 'ox' for ox_inventory
        --use 'custom' for custom inventory
    },
    Clothing = {
        Type = 'qb' -- clothing type, support for rsg-clothing and illenium-appearance
        -- EDIT CLIENT/BOSSMENU_CLIENT.LUA TO ADD YOUR OWN CLOTHING SUPPORT
        --use 'qb' for rsg-clothing
        --use 'illenium' for illenium-appearance
        --use 'custom' for your own clothing script
    },
    Banking = { -- support for rsg-banking, okokBanking and renewed-banking
        -- EDIT SERVER/BOSSMENU_SERVER.LUA TO ADD YOUR OWN BANKING SUPPORT
        CashSymbol = '£', -- cash symbol used in your server
        Type = 'qb',
        --use 'qb' for rsg-banking
        --use 'okok' for okokBanking
        --use 'renewed' for renewed-banking
        -- use 'custom' for custom banking
    },
    Unemployed = { -- when firing an employee what is their default unemployed job name and rank this must be in your jobs.lua
        Name = 'unemployed', -- job name in jobs.lua
    },
}


--define boss menu locations
Config.Locations = {

    ['valhorsetrainer'] = { -- the key is the job name
        coords = vector3(-363.57, 791.55, 116.18), -- target zone coords
        image = 'https://files.fivemerr.com/images/dc8acb3f-4065-4ed5-a431-8610d99f979b.png', -- job image url
        blip = {
            enabled = false, -- enable blip for management menu
            id = 60, -- blip id
            colour = 3, -- blip colour
            scale = 0.7, -- blip scale
            title = 'Job Management', -- blip title
        },
        stash = {
            enabled = true, -- enable boss stash for this job
            slots = 64, -- stash slots
            weight = 10000000, -- stash weight
        },
    },
    ['bwhorsetrainer'] = { -- the key is the job name
        coords = vector3(-878.94, -1368.13, 43.61), -- target zone coords
        image = 'https://files.fivemerr.com/images/dc8acb3f-4065-4ed5-a431-8610d99f979b.png', -- job image url
        blip = {
            enabled = true, -- enable blip for management menu
            id = 61, -- blip id
            colour = 2, -- blip colour
            scale = 0.7, -- blip scale
            title = 'Job Management', -- blip title
        },
        stash = {
            enabled = true, -- enable boss stash for this job
            slots = 64, -- stash slots
            weight = 10000000, -- stash weight
        },
    },
    ['strawhorsetrainer'] = { -- the key is the job name
        coords = vector3(-1826.77, -555.66, 156), -- target zone coords
        image = 'https://files.fivemerr.com/images/dc8acb3f-4065-4ed5-a431-8610d99f979b.png', -- job image url
        blip = {
            enabled = true, -- enable blip for management menu
            id = 72, -- blip id
            colour = 5, -- blip colour
            scale = 0.7, -- blip scale
            title = 'Job Management', -- blip title
        },
        stash = {
            enabled = true, -- enable boss stash for this job
            slots = 64, -- stash slots
            weight = 10000000, -- stash weight
        },
    },
    ['armahorsetrainer'] = { -- the key is the job name
        coords = vector3(-3700.24, -2574.26, -13.71), -- target zone coords
        image = 'https://files.fivemerr.com/images/dc8acb3f-4065-4ed5-a431-8610d99f979b.png', -- job image url
        blip = {
            enabled = true, -- enable blip for management menu
            id = 40, -- blip id
            colour = 5, -- blip colour
            scale = 0.7, -- blip scale
            title = 'Job Management', -- blip title
        },
    },
    ['emeraldhorsetrainer'] = { -- the key is the job name
        coords = vector3(1407.2, 269.76, 89.58), -- target zone coords
        image = 'https://files.fivemerr.com/images/dc8acb3f-4065-4ed5-a431-8610d99f979b.png', -- job image url
        blip = {
            enabled = true, -- enable blip for management menu
            id = 40, -- blip id
            colour = 5, -- blip colour
            scale = 0.7, -- blip scale
            title = 'Job Management', -- blip title
        },
        stash = {
            enabled = true, -- enable boss stash for this job
            slots = 64, -- stash slots
            weight = 10000000, -- stash weight
        },
    },
    ['vhhorsetrainer'] = { -- the key is the job name
        coords = vector3(2967.31, 792.39, 51.4), -- target zone coords
        image = 'https://files.fivemerr.com/images/dc8acb3f-4065-4ed5-a431-8610d99f979b.png', -- job image url
        blip = {
            enabled = true, -- enable blip for management menu
            id = 40, -- blip id
            colour = 5, -- blip colour
            scale = 0.7, -- blip scale
            title = 'Job Management', -- blip title
        },
        stash = {
            enabled = true, -- enable boss stash for this job
            slots = 64, -- stash slots
            weight = 10000000, -- stash weight
        },
    },
    ['sdhorsetrainer'] = { -- the key is the job name
        coords = vector3(2513.63, -1459.56, 46.31), -- target zone coords
        image = 'https://files.fivemerr.com/images/dc8acb3f-4065-4ed5-a431-8610d99f979b.png', -- job image url
        blip = {
            enabled = true, -- enable blip for management menu
            id = 40, -- blip id
            colour = 5, -- blip colour
            scale = 0.7, -- blip scale
            title = 'Job Management', -- blip title
        },
        stash = {
            enabled = true, -- enable boss stash for this job
            slots = 64, -- stash slots
            weight = 10000000, -- stash weight
        },
    },
    ['rhodeshorsetrainer'] = { -- the key is the job name
        coords = vector3(1428.92, -1293.03, 77.82), -- target zone coords
        image = 'https://files.fivemerr.com/images/dc8acb3f-4065-4ed5-a431-8610d99f979b.png', -- job image url
        blip = {
            enabled = true, -- enable blip for management menu
            id = 40, -- blip id
            colour = 5, -- blip colour
            scale = 0.7, -- blip scale
            title = 'Job Management', -- blip title
        },
        stash = {
            enabled = true, -- enable boss stash for this job
            slots = 64, -- stash slots
            weight = 10000000, -- stash weight
        },
    },
    ['tumhorsetrainer'] = { -- the key is the job name
        coords = vector3(-5513.82, -3040.08, -2.34), -- target zone coords
        image = 'https://files.fivemerr.com/images/dc8acb3f-4065-4ed5-a431-8610d99f979b.png', -- job image url
        blip = {
            enabled = true, -- enable blip for management menu
            id = 40, -- blip id
            colour = 5, -- blip colour
            scale = 0.7, -- blip scale
            title = 'Job Management', -- blip title
        },
        stash = {
            enabled = true, -- enable boss stash for this job
            slots = 64, -- stash slots
            weight = 10000000, -- stash weight
        },
    },
    ['vhpawnshop'] = { -- the key is the job name
        coords = vector3(3023.2, 565.71, 44.76), -- target zone coords
        image = 'https://files.fivemerr.com/images/dc8acb3f-4065-4ed5-a431-8610d99f979b.png', -- job image url
        blip = {
            enabled = true, -- enable blip for management menu
            id = 40, -- blip id
            colour = 5, -- blip colour
            scale = 0.7, -- blip scale
            title = 'Job Management', -- blip title
        },
        stash = {
            enabled = true, -- enable boss stash for this job
            slots = 64, -- stash slots
            weight = 10000000, -- stash weight
        },
    },
    ['twpawnshop'] = { -- the key is the job name
        coords = vector3(-5508.35,-2912.59,1.7), -- target zone coords
        image = 'https://files.fivemerr.com/images/dc8acb3f-4065-4ed5-a431-8610d99f979b.png', -- job image url
        blip = {
            enabled = true, -- enable blip for management menu
            id = 40, -- blip id
            colour = 5, -- blip colour
            scale = 0.7, -- blip scale
            title = 'Job Management', -- blip title
        },
        stash = {
            enabled = true, -- enable boss stash for this job
            slots = 64, -- stash slots
            weight = 10000000, -- stash weight
        },
    },
    ['valherbalist'] = { -- the key is the job name
        coords = vector3(1183.84, 2034.23, 323.97), -- target zone coords
        image = 'https://files.fivemerr.com/images/dc8acb3f-4065-4ed5-a431-8610d99f979b.png', -- job image url
        blip = {
            enabled = true, -- enable blip for management menu
            id = 40, -- blip id
            colour = 5, -- blip colour
            scale = 0.7, -- blip scale
            title = 'Job Management', -- blip title
        },
        stash = {
            enabled = true, -- enable boss stash for this job
            slots = 64, -- stash slots
            weight = 10000000, -- stash weight
        },
    },
    -- ['emeraldhorsetrainer'] = { -- the key is the job name
    --     coords = vector3(1428.92, -1293.03, 77.82), -- target zone coords
    --     image = 'https://files.fivemerr.com/images/dc8acb3f-4065-4ed5-a431-8610d99f979b.png', -- job image url
    --     blip = {
    --         enabled = true, -- enable blip for management menu
    --         id = 40, -- blip id
    --         colour = 5, -- blip colour
    --         scale = 0.7, -- blip scale
    --         title = 'Job Management', -- blip title
    --     },
    --     stash = {
    --         enabled = true, -- enable boss stash for this job
    --         slots = 64, -- stash slots
    --         weight = 10000000, -- stash weight
    --     },
    -- },

    ----------------------
    -- Saloon Locations --
    ----------------------


    --['rhosaloon'] = { -- the key is the job name
    --    coords = vector3(1338.35, -1375.27, 80.48), -- target zone coords
    --    image = 'https://files.fivemerr.com/images/a412aab9-85f8-4982-b33a-e20bdc1dd4d8.png', -- job image url
    --    blip = {
    --        enabled = false, -- enable blip for management menu
    --        id = 40, -- blip id
    --        colour = 5, -- blip colour
    --        scale = 0.7, -- blip scale
    --        title = 'Job Management', -- blip title
    --    },
    --    stash = {
    --        enabled = true, -- enable boss stash for this job
    --        slots = 64, -- stash slots
    --        weight = 10000000, -- stash weight
    --    },
    --},
    --['armsaloon'] = { -- the key is the job name
    --    coords = vector3(-3698.51, -2596.11, -13.32), -- target zone coords
    --    image = 'https://files.fivemerr.com/images/a412aab9-85f8-4982-b33a-e20bdc1dd4d8.png', -- job image url
    --    blip = {
    --        enabled = false, -- enable blip for management menu
    --        id = 40, -- blip id
    --        colour = 5, -- blip colour
    --        scale = 0.7, -- blip scale
    --        title = 'Job Management', -- blip title
    --    },
    --    stash = {
    --        enabled = true, -- enable boss stash for this job
    --        slots = 64, -- stash slots
    --        weight = 10000000, -- stash weight
    --    },
    --},
    --['bassaloon'] = { -- the key is the job name
    --    coords = vector3(2640.07, -1222.93, 53.38), -- target zone coords
    --    image = 'https://files.fivemerr.com/images/a412aab9-85f8-4982-b33a-e20bdc1dd4d8.png', -- job image url
    --    blip = {
    --        enabled = false, -- enable blip for management menu
    --        id = 40, -- blip id
    --        colour = 5, -- blip colour
    --        scale = 0.7, -- blip scale
    --        title = 'Job Management', -- blip title
    --    },
    --    stash = {
    --        enabled = true, -- enable boss stash for this job
    --        slots = 64, -- stash slots
    --        weight = 10000000, -- stash weight
    --    },
    --},
    --['blasaloon'] = { -- the key is the job name
    --    coords = vector3(-817.7, -1321.01, 43.67), -- target zone coords
    --    image = 'https://files.fivemerr.com/images/a412aab9-85f8-4982-b33a-e20bdc1dd4d8.png', -- job image url
    --    blip = {
    --        enabled = false, -- enable blip for management menu
    --        id = 40, -- blip id
    --        colour = 5, -- blip colour
    --        scale = 0.7, -- blip scale
    --        title = 'Job Management', -- blip title
    --    },
    --    stash = {
    --        enabled = true, -- enable boss stash for this job
    --        slots = 64, -- stash slots
    --        weight = 10000000, -- stash weight
    --    },
    --},
    --['emeraldsaloon'] = { -- the key is the job name
    --    coords = vector3(1451.38, 373.25, 89.89), -- target zone coords
    --    image = 'https://files.fivemerr.com/images/fd20e257-93e9-4654-8da3-385386f5a8eb.png', -- job image url
    --    blip = {
    --        enabled = false, -- enable blip for management menu
    --        id = 40, -- blip id
    --        colour = 5, -- blip colour
    --        scale = 0.7, -- blip scale
    --        title = 'Job Management', -- blip title
    --    },
    --    stash = {
    --        enabled = true, -- enable boss stash for this job
    --        slots = 64, -- stash slots
    --        weight = 10000000, -- stash weight
    --    },
    --},
--
    --['valsaloon'] = { -- the key is the job name
    --    coords = vector3(-313.41, 804.8, 118.98), -- target zone coords
    --    image = 'https://files.fivemerr.com/images/fd20e257-93e9-4654-8da3-385386f5a8eb.png', -- job image url
    --    blip = {
    --        enabled = false, -- enable blip for management menu
    --        id = 40, -- blip id
    --        colour = 5, -- blip colour
    --        scale = 0.7, -- blip scale
    --        title = 'Job Management', -- blip title
    --    },
    --    stash = {
    --        enabled = true, -- enable boss stash for this job
    --        slots = 64, -- stash slots
    --        weight = 10000000, -- stash weight
    --    },
    --},
--
    --['sdicecream'] = { -- the key is the job name                                   -- Saint Denis Ice Cream Shop
    --    coords = vector3(2675.74, -1155.04, 50.94), -- target zone coords
    --    image = 'https://files.fivemerr.com/images/fd20e257-93e9-4654-8da3-385386f5a8eb.png', -- job image url
    --    blip = {
    --        enabled = false, -- enable blip for management menu
    --        id = 40, -- blip id
    --        colour = 5, -- blip colour
    --        scale = 0.7, -- blip scale
    --        title = 'Job Management', -- blip title
    --    },
    --    stash = {
    --        enabled = true, -- enable boss stash for this job
    --        slots = 64, -- stash slots
    --        weight = 10000000, -- stash weight
    --    },
    --},
--
    --['graverose'] = { -- the key is the job name
    --    coords = vector3(2713.94, -1289.17, 60.34), -- target zone coords
    --    image = 'https://files.fivemerr.com/images/fd20e257-93e9-4654-8da3-385386f5a8eb.png', -- job image url
    --    blip = {
    --        enabled = false, -- enable blip for management menu
    --        id = 40, -- blip id
    --        colour = 5, -- blip colour
    --        scale = 0.7, -- blip scale
    --        title = 'Job Management', -- blip title
    --    },
    --    stash = {
    --        enabled = true, -- enable boss stash for this job
    --        slots = 64, -- stash slots
    --        weight = 10000000, -- stash weight
    --    },
    --},
    --['armbakery'] = { -- the key is the job name
    --    coords = vector3(-3736.84, -2547.19, -13.04), -- target zone coords
    --    image = 'https://files.fivemerr.com/images/fd20e257-93e9-4654-8da3-385386f5a8eb.png', -- job image url
    --    blip = {
    --        enabled = false, -- enable blip for management menu
    --        id = 40, -- blip id
    --        colour = 5, -- blip colour
    --        scale = 0.7, -- blip scale
    --        title = 'Job Management', -- blip title
    --    },
    --    stash = {
    --        enabled = true, -- enable boss stash for this job
    --        slots = 64, -- stash slots
    --        weight = 10000000, -- stash weight
    --    },
    --},
    ----------------------
    ------ Doctors -------
    ----------------------


    ['vhwilddoctor'] = { -- the key is the job name
        coords = vector3(2788.64, 525.9, 71.68), -- target zone coords
        image = 'https://files.fivemerr.com/images/fd20e257-93e9-4654-8da3-385386f5a8eb.png', -- job image url
        blip = {
            enabled = false, -- enable blip for management menu
            id = 40, -- blip id
            colour = 5, -- blip colour
            scale = 0.7, -- blip scale
            title = 'Job Management', -- blip title
        },
        stash = {
            enabled = true, -- enable boss stash for this job
            slots = 64, -- stash slots
            weight = 10000000, -- stash weight
        },
    },
    ['vtwilddoctor'] = { -- the key is the job name
        coords = vector3(743.92, 1822.44, 238.66), -- target zone coords
        image = 'https://files.fivemerr.com/images/fd20e257-93e9-4654-8da3-385386f5a8eb.png', -- job image url
        blip = {
            enabled = false, -- enable blip for management menu
            id = 40, -- blip id
            colour = 5, -- blip colour
            scale = 0.7, -- blip scale
            title = 'Job Management', -- blip title
        },
        stash = {
            enabled = true, -- enable boss stash for this job
            slots = 64, -- stash slots
            weight = 10000000, -- stash weight
        },
    },
    ['rdwilddoctor'] = { -- the key is the job name
        coords = vector3(1304.7, -1309.89, 76.79), -- target zone coords
        image = 'https://files.fivemerr.com/images/fd20e257-93e9-4654-8da3-385386f5a8eb.png', -- job image url
        blip = {
            enabled = false, -- enable blip for management menu
            id = 40, -- blip id
            colour = 5, -- blip colour
            scale = 0.7, -- blip scale
            title = 'Job Management', -- blip title
        },
        stash = {
            enabled = true, -- enable boss stash for this job
            slots = 64, -- stash slots
            weight = 10000000, -- stash weight
        },
    },
    ['strawprivatedoctor'] = { -- the key is the job name
        coords = vector3(-1809.21, -433.61, 158.85), -- target zone coords
        image = 'https://files.fivemerr.com/images/fd20e257-93e9-4654-8da3-385386f5a8eb.png', -- job image url
        blip = {
            enabled = false, -- enable blip for management menu
            id = 40, -- blip id
            colour = 5, -- blip colour
            scale = 0.7, -- blip scale
            title = 'Job Management', -- blip title
        },
        stash = {
            enabled = true, -- enable boss stash for this job
            slots = 64, -- stash slots
            weight = 10000000, -- stash weight
        },
    },
    ['tipaniwilddoctor'] = { -- the key is the job name
        coords = vector3(381.06, 2445.36, 304.39), -- target zone coords
        image = 'https://files.fivemerr.com/images/fd20e257-93e9-4654-8da3-385386f5a8eb.png', -- job image url
        blip = {
            enabled = false, -- enable blip for management menu
            id = 40, -- blip id
            colour = 5, -- blip colour
            scale = 0.7, -- blip scale
            title = 'Job Management', -- blip title
        },
        stash = {
            enabled = true, -- enable boss stash for this job
            slots = 64, -- stash slots
            weight = 10000000, -- stash weight
        },
    },
    ['comwilddoctor'] = { -- the key is the job name
        coords = vector3(-2829.72, -2732.71, 81.16), -- target zone coords
        image = 'https://files.fivemerr.com/images/fd20e257-93e9-4654-8da3-385386f5a8eb.png', -- job image url
        blip = {
            enabled = false, -- enable blip for management menu
            id = 40, -- blip id
            colour = 5, -- blip colour
            scale = 0.7, -- blip scale
            title = 'Job Management', -- blip title
        },
        stash = {
            enabled = true, -- enable boss stash for this job
            slots = 64, -- stash slots
            weight = 10000000, -- stash weight
        },
    },
    ['twwilddoctor'] = { -- the key is the job name
        coords = vector3(-5209.54, -2098.78, 12.59), -- target zone coords
        image = 'https://files.fivemerr.com/images/fd20e257-93e9-4654-8da3-385386f5a8eb.png', -- job image url
        blip = {
            enabled = false, -- enable blip for management menu
            id = 40, -- blip id
            colour = 5, -- blip colour
            scale = 0.7, -- blip scale
            title = 'Job Management', -- blip title
        },
        stash = {
            enabled = true, -- enable boss stash for this job
            slots = 64, -- stash slots
            weight = 10000000, -- stash weight
        },
    },
    ['sdprivatedoctor'] = { -- the key is the job name
        coords = vector3(2493.7, -1089.71, 55.51), -- target zone coords
        image = 'https://files.fivemerr.com/images/fd20e257-93e9-4654-8da3-385386f5a8eb.png', -- job image url
        blip = {
            enabled = false, -- enable blip for management menu
            id = 40, -- blip id
            colour = 5, -- blip colour
            scale = 0.7, -- blip scale
            title = 'Job Management', -- blip title
        },
        stash = {
            enabled = true, -- enable boss stash for this job
            slots = 64, -- stash slots
            weight = 10000000, -- stash weight
        },
    },

    ---cinema
    ['cinema'] = { -- the key is the job name
        coords = vector3(2550.78, -1284.34, 49.23), -- target zone coords
        image = 'https://files.fivemerr.com/images/fd20e257-93e9-4654-8da3-385386f5a8eb.png', -- job image url
        blip = {
            enabled = false, -- enable blip for management menu
            id = 40, -- blip id
            colour = 5, -- blip colour
            scale = 0.7, -- blip scale
            title = 'Job Management', -- blip title
        },
        stash = {
            enabled = true, -- enable boss stash for this job
            slots = 64, -- stash slots
            weight = 10000000, -- stash weight
        },
    },
        ---mixologists
    ['bluemixologist'] = { -- the key is the job name
        coords = vector3(2500.09, -419.47, 44.41), -- target zone coords
        image = 'https://files.fivemerr.com/images/fd20e257-93e9-4654-8da3-385386f5a8eb.png', -- job image url
        blip = {
            enabled = false, -- enable blip for management menu
            id = 40, -- blip id
            colour = 5, -- blip colour
            scale = 0.7, -- blip scale
            title = 'Job Management', -- blip title
        },
        stash = {
            enabled = true, -- enable boss stash for this job
            slots = 64, -- stash slots
            weight = 10000000, -- stash weight
        },
    },

    ----------------------
    ---- Undertakers -----
    ----------------------

    -- ['stdundertaker'] = { -- the key is the job name                                     -- Saint Denis Undertaker
    --     coords = vector3(2764.83, -1121.07, 56.74), -- target zone coords
    --     image = 'https://files.fivemerr.com/images/fd20e257-93e9-4654-8da3-385386f5a8eb.png', -- job image url
    --     blip = {
    --         enabled = false, -- enable blip for management menu
    --         id = 40, -- blip id
    --         colour = 5, -- blip colour
    --         scale = 0.7, -- blip scale
    --         title = 'Job Management', -- blip title
    --     },
    --     stash = {
    --         enabled = true, -- enable boss stash for this job
    --         slots = 64, -- stash slots
    --         weight = 10000000, -- stash weight
    --     },
    -- },



    -- ['medic'] = { -- the key is the job name
    --     coords = vector3(-288.1316, 805.03735, 119.3858), -- target zone coords
    --     image = 'https://files.fivemerr.com/images/dc8acb3f-4065-4ed5-a431-8610d99f979b.png', -- job image url
    --     blip = {
    --         enabled = false, -- enable blip for management menu
    --         id = 40, -- blip id
    --         colour = 5, -- blip colour
    --         scale = 0.7, -- blip scale
    --         title = 'Job Management', -- blip title
    --     },
    --     stash = {
    --         enabled = true, -- enable boss stash for this job
    --         slots = 64, -- stash slots
    --         weight = 10000000, -- stash weight
    --     },
    -- },
    -- ['medic'] = { -- the key is the job name
    --     coords = vector3(-785.6929, -1306.12, 43.8149), -- target zone coords
    --     image = 'https://files.fivemerr.com/images/dc8acb3f-4065-4ed5-a431-8610d99f979b.png', -- job image url
    --     blip = {
    --         enabled = false, -- enable blip for management menu
    --         id = 40, -- blip id
    --         colour = 5, -- blip colour
    --         scale = 0.7, -- blip scale
    --         title = 'Job Management', -- blip title
    --     },
    --     stash = {
    --         enabled = true, -- enable boss stash for this job
    --         slots = 64, -- stash slots
    --         weight = 10000000, -- stash weight
    --     },
    -- },
    -- ['medic'] = { -- the key is the job name
    --     coords = vector3(-3650.829, -2646.701, -13.459), -- target zone coords
    --     image = 'https://files.fivemerr.com/images/dc8acb3f-4065-4ed5-a431-8610d99f979b.png', -- job image url
    --     blip = {
    --         enabled = false, -- enable blip for management menu
    --         id = 40, -- blip id
    --         colour = 5, -- blip colour
    --         scale = 0.7, -- blip scale
    --         title = 'Job Management', -- blip title
    --     },
    --     stash = {
    --         enabled = true, -- enable boss stash for this job
    --         slots = 64, -- stash slots
    --         weight = 10000000, -- stash weight
    --     },
    -- },
    --add more jobs as required
}



Config.Language = {
    Notifications = {
        Busy = 'You are already doing something!',
        Cancelled = 'Action cancelled!',
        NoAccess = 'You dont have access to this!',
        TooFar = 'You are too far away to do that!',
        OnlyEmployee = 'No other employees are online!',
        NoOneOnline = 'There are no online employees for you to do that!',
        NoOneNear = 'There is no one nearby!',
        AlreadyEmployed = 'The person you are trying to employ already works here!',
        OfferReceived = 'You have received a job offer!',
        OfferSent = 'Job offer sent!',
        OfferAccepted = 'You accepted the job offer for: ',
        OfferAcceptedHirer = 'They accepted the job offer!',
        OfferDeclined = 'The offer was declined!',
        RankChanged = 'Your rank has changed!',
        RankChangedHirer = 'Rank changed successfully!',
        Fired = 'You have been fired!',
        FiredHirer = 'Employee has been fired!',
        InvalidAmount = 'You have entered an invalid amount!',
        NoCash = 'You dont have any cash to deposit!',
        Deposit = 'You have successfully deposited: ',
        NotEmployedHere = 'This person is not employed here!',
        DeclinedOffer = 'You declined the job offer!',
        InvalidMessage = 'Invalid message',
        AlreadyReplied = 'You have already replied to this message!',
        NoReplies = 'You dont have any replies!',
        InvalidGrade = 'You have selected an invalid grade for this job!',
        MessageSent = 'Your message has been sent!',
        ReplySent = 'Your reply has been sent!',
        MessageCleared = 'This message has been deleted!',
        MessagesCleared = 'All messages have been deleted!',
        ReplyCleared = 'This reply has been deleted!',
        RepliesCleared = 'Replies have been deleted!',
        DeleteError = 'You can only delete your own messages!',
    }
}