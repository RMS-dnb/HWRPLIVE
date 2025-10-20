-- Config = {}
-- Config.webhook = "https://discord.com/api/webhooks/1388272324213739591/cfPtnI3vpJZD3Fu0RQMPYFtQ4_aFbynjFgmF3mOdGLLSkB24p0_eMF5juJm1MP3S0SeN"
-- Config.Posters = {
--     [1] = {city = "Valentine", coords = vector3(-350.8114, 772.34259, 116.00059), name = "Valentine Board"},
--     [2] = {city = "Saint Denis", coords = vector3(2517.57, -1305.57, 48.99), name = "St Denis Board"},
--     [3] = {city = "Rhodes", coords = vector3(1353.39, -1304.75, 76.88), name = "Rhodes Board"},
--     [4] = {city = "Blackwater", coords = vector3(-767.10, -1260.70, 43.57), name = "Blackwater Board"},
--     [5] = {city = "Strawberry", coords = vector3( -1801.64, -357.93, 163.90), name = "Strawberry Board"},
--     [6] = {city = "Armadillo", coords = vector3(-3623.91, -2598.00, -13.78), name = "Armadillo Board"},
--     [7] = {city = "Tumbleweed", coords = vector3(-5524.84, -2926.51, -2.099), name = "Tumbleweed Board"},
--     [8] = {city = "Annesburg", coords = vector3(2913.78, 1305.90, 44.36), name = "Annesburg Board"},
--     [9] = {city = "BenedictPoint", coords = vector3(-5225.77, -3478.25, -20.55), name = "BenedictPoint Board"},
--     [10] = {city = "Emerald", coords = vector3(1519.02, 441.15, 90.68), name = "Emerald Board"},
--     [11] = {city = "Riggs", coords = vector3(-1092.02, -578.98, 82.409), name = "Riggs Board"},
--     [12] = {city = "Coltes", coords = vector3(-1328.002, 2439.821, 309.4015), name = "Coltes Board"},
--     [13] = {city = "VanHorn", coords = vector3(2982.78, 570.84, 44.60), name = "VanHorn Board"},
--     [14] = {city = "Wallace", coords = vector3(-1293.04, 397.05, 95.22), name = "Wallace Board"},
--     [15] = {city = "Grizzlies", coords = vector3(-1328.123, 2439.563, 309.382), name = "Grizzlies Board"},
--     [16] = {city = "Henningans", coords = vector3(-2497.699, -2414.672, 193.299), name = "Henningans Board"},
--     [17] = {city = "Mercer Station", coords = vector3(-2499.725, -5415.259, 60.597), name = "Mercer Station Board"},
--     [18] = {city = "Mercer", coords = vector3(-4369.871, -3077.455, -10.005), name = "Mercer Board"},
-- }

-- Config.Groups = {
--     ['mod'] = true,
--     ['admin'] = true,
--     ['god'] = true,
--     ['user'] = true
-- }

Config = {}

-- Separate webhook for each town
Config.webhooks = {
    -- New Hanover
    ["Valentine"] = "https://discord.com/api/webhooks/1392597787295612958/kE4aHs_FE8t-Fg0NWXN_C15hp20Ku9HLcbp3Kc68ghEdyr4IYEZzcTLWPwyKA8dxIXPT",
    ["Wallace"] = "https://discord.com/api/webhooks/1392597787295612958/kE4aHs_FE8t-Fg0NWXN_C15hp20Ku9HLcbp3Kc68ghEdyr4IYEZzcTLWPwyKA8dxIXPT",
    ["Strawberry"] = "https://discord.com/api/webhooks/1392597787295612958/kE4aHs_FE8t-Fg0NWXN_C15hp20Ku9HLcbp3Kc68ghEdyr4IYEZzcTLWPwyKA8dxIXPT",
    ["Emerald"] = "https://discord.com/api/webhooks/1392597787295612958/kE4aHs_FE8t-Fg0NWXN_C15hp20Ku9HLcbp3Kc68ghEdyr4IYEZzcTLWPwyKA8dxIXPT",
    ["Riggs"] = "https://discord.com/api/webhooks/1392597787295612958/kE4aHs_FE8t-Fg0NWXN_C15hp20Ku9HLcbp3Kc68ghEdyr4IYEZzcTLWPwyKA8dxIXPT",
    ["Grizzlies"] = "https://discord.com/api/webhooks/1392597787295612958/kE4aHs_FE8t-Fg0NWXN_C15hp20Ku9HLcbp3Kc68ghEdyr4IYEZzcTLWPwyKA8dxIXPT",
    ["Colter"] = "https://discord.com/api/webhooks/1392597787295612958/kE4aHs_FE8t-Fg0NWXN_C15hp20Ku9HLcbp3Kc68ghEdyr4IYEZzcTLWPwyKA8dxIXPT",

    -- Lemoyne
    ["Saint Denis"] = "https://discord.com/api/webhooks/1392597375888920667/1LIgDlA_Gg0QEhwO1XrKw3stfU2-vXGNubbJzKqkTv2CjCUA9w7f6mDpQ9GTw_xStd9V",
    ["Rhodes"] = "https://discord.com/api/webhooks/1392597375888920667/1LIgDlA_Gg0QEhwO1XrKw3stfU2-vXGNubbJzKqkTv2CjCUA9w7f6mDpQ9GTw_xStd9V",
    ["Van Horn"] = "https://discord.com/api/webhooks/1392597375888920667/1LIgDlA_Gg0QEhwO1XrKw3stfU2-vXGNubbJzKqkTv2CjCUA9w7f6mDpQ9GTw_xStd9V",
    ["Annesburg"] = "https://discord.com/api/webhooks/1392597375888920667/1LIgDlA_Gg0QEhwO1XrKw3stfU2-vXGNubbJzKqkTv2CjCUA9w7f6mDpQ9GTw_xStd9V",

    -- New Austin
    ["Blackwater"] = "https://discord.com/api/webhooks/1392596247591780393/iYWHv3age32HOeT547h0AxOoBIjpG6PS0GKR-ur9x94Pzi-w4-y8svXx4NFUfKglyGs1",
    ["Armadillo"] = "https://discord.com/api/webhooks/1392596247591780393/iYWHv3age32HOeT547h0AxOoBIjpG6PS0GKR-ur9x94Pzi-w4-y8svXx4NFUfKglyGs1",
    ["Tumbleweed"] = "https://discord.com/api/webhooks/1392596247591780393/iYWHv3age32HOeT547h0AxOoBIjpG6PS0GKR-ur9x94Pzi-w4-y8svXx4NFUfKglyGs1",
    ["Benedict Point"] = "https://discord.com/api/webhooks/1392596247591780393/iYWHv3age32HOeT547h0AxOoBIjpG6PS0GKR-ur9x94Pzi-w4-y8svXx4NFUfKglyGs1",
    ["Henningans"] = "https://discord.com/api/webhooks/1392596247591780393/iYWHv3age32HOeT547h0AxOoBIjpG6PS0GKR-ur9x94Pzi-w4-y8svXx4NFUfKglyGs1",
    ["Mercer Station"] = "https://discord.com/api/webhooks/1392596247591780393/iYWHv3age32HOeT547h0AxOoBIjpG6PS0GKR-ur9x94Pzi-w4-y8svXx4NFUfKglyGs1",

    --guarma
    ["Guarma"] = "https://discord.com/api/webhooks/1422379512796024955/_oQufj9iJTEW7lnWW8kcU3RGGHo_QhAufnzZYH15V_xfb7eylJ4zeojpC23ABPJErUjK",
}

-- Fallback webhook if specific town webhook is not found
Config.defaultWebhook = "https://discord.com/api/webhooks/1388272324213739591/cfPtnI3vpJZD3Fu0RQMPYFtQ4_aFbynjFgmF3mOdGLLSkB24p0_eMF5juJm1MP3S0SeN"

Config.Posters = {
    -- New Hanover
    [1] = {city = "Valentine", coords = vector3(-272.17, 804.92, 119.34), name = "Valentine Board"},
    [2] = {city = "Strawberry", coords = vector3( -1801.64, -357.93, 163.90), name = "Strawberry Board"},
    [3] = {city = "Emerald", coords = vector3(1519.02, 441.15, 90.68), name = "Emerald Board"},
    [4] = {city = "Wallace", coords = vector3(-1293.04, 397.05, 95.22), name = "Wallace Board"},
    [5] = {city = "Colter", coords = vector3(-1328.002, 2439.821, 309.4015), name = "Colter Board"},
    [6] = {city = "Grizzlies", coords = vector3(-1328.123, 2439.563, 309.382), name = "Grizzlies Board"},
    [7] = {city = "Riggs", coords = vector3(-1092.02, -578.98, 82.409), name = "Riggs Board"},

    -- Lemoyne
    [8] = {city = "Saint Denis", coords = vector3(2517.57, -1305.57, 48.99), name = "Saint Denis Board"},
    [9] = {city = "Rhodes", coords = vector3(1353.39, -1304.75, 76.88), name = "Rhodes Board"},
    [10] = {city = "Van Horn", coords = vector3(2982.78, 570.84, 44.60), name = "Van Horn Board"},
    [11] = {city = "Annesburg", coords = vector3(2913.78, 1305.90, 44.36), name = "Annesburg Board"},

    -- New Austin
    [12] = {city = "Blackwater", coords = vector3(-767.10, -1260.70, 43.57), name = "Blackwater Board"},
    [13] = {city = "Armadillo", coords = vector3(-3623.91, -2598.00, -13.78), name = "Armadillo Board"},
    [14] = {city = "Tumbleweed", coords = vector3(-5524.84, -2926.51, -2.099), name = "Tumbleweed Board"},
    [15] = {city = "Henningans", coords = vector3(-2497.699, -2414.672, 193.299), name = "Henningans Board"},
    [16] = {city = "Mercer Station", coords = vector3(-4369.871, -3077.455, -10.005), name = "Mercer Station Board"},
    [17] = {city = "Benedict Point", coords = vector3(-5225.77, -3478.25, -20.55), name = "Benedict Point Board"},

    --guarma
    [18] = {city = "Guarma", coords = vector3(1293.68, -6881.82, 44.12), name = "Guarma Board"},

}

Config.Groups = {
    ['mod'] = true,
    ['admin'] = true,
    ['god'] = true,
    ['user'] = true
}