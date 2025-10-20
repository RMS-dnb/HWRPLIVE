Config = {
    Core = 'rsg-core',  
}

Config.AuthJobs = { -- Make sure this list matches with server.lua WebHooks list
    ['medic'] = { -- Add Your Webhook In Server/main.lua
        Color = 3447003,  -- For Color Code go here : https://gist.github.com/thomasbnt/b6f455e2c7d743b796917fa3c205f812 and get INT Color Code
        LogTitle = 'Medic Duty Log',
        IconURL = 'https://cdn.discordapp.com/attachments/1026573811010785370/1028332420564537404/Paradise-LogoCircle.png',
    },
    ['privatedoctor'] = { -- Add Your Webhook In Server/main.lua
        Color = 15158332,  -- For Color Code go here : https://gist.github.com/thomasbnt/b6f455e2c7d743b796917fa3c205f812 and get INT Color Code
        LogTitle = 'Private Doctor Duty Log',
        IconURL = 'https://cdn.discordapp.com/attachments/1026573811010785370/1028332420564537404/Paradise-LogoCircle.png',
    },
    ['lso'] = { -- Add Your Webhook In Server/main.lua
        Color = 15158332,  -- For Color Code go here : https://gist.github.com/thomasbnt/b6f455e2c7d743b796917fa3c205f812 and get INT Color Code
        LogTitle = 'LSO Duty Log',
        IconURL = 'https://cdn.discordapp.com/attachments/1026573811010785370/1028332420564537404/Paradise-LogoCircle.png',
    },
    ['naso'] = { -- Add Your Webhook In Server/main.lua
        Color = 15158332,   -- For Color Code go here : https://gist.github.com/thomasbnt/b6f455e2c7d743b796917fa3c205f812 and get INT Color Code
        LogTitle = 'NASO Duty Log',
        IconURL = 'https://cdn.discordapp.com/attachments/1026573811010785370/1028332420564537404/Paradise-LogoCircle.png',
    },
    ['nhso'] = { -- Add Your Webhook In Server/main.lua
        Color = 15844367,  -- For Color Code go here : https://gist.github.com/thomasbnt/b6f455e2c7d743b796917fa3c205f812 and get INT Color Code
        LogTitle = 'NHSO Duty Log',
        IconURL = 'https://cdn.discordapp.com/attachments/1026573811010785370/1028332420564537404/Paradise-LogoCircle.png',
    },
    ['doj'] = {
        Color = 15158332,   -- For Color Code go here : https://gist.github.com/thomasbnt/b6f455e2c7d743b796917fa3c205f812 and get INT Color Code
        LogTitle = 'DOJ Log',
        IconURL = 'https://cdn.discordapp.com/attachments/1026573811010785370/1028332420564537404/Paradise-LogoCircle.png',
    },
    ['usms'] = {
        Color = 15158332,   -- For Color Code go here : https://gist.github.com/thomasbnt/b6f455e2c7d743b796917fa3c205f812 and get INT Color Code
        LogTitle = 'Marshal Duty Log',
        IconURL = 'https://cdn.discordapp.com/attachments/1026573811010785370/1028332420564537404/Paradise-LogoCircle.png',
    },
}

