Config.Consumables = {
    ["bread"] = {
        prop = "p_biscuitsandwich01x",
        hunger = 5, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0,
        horseStamina = 0,
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        -- returnedItem = {name = "beer", count = 1}, -- or false
        returnedItem = false, -- or false
        usageLimit = 1, -- how many times it can be used
    },
    ["muffin"] = {
        prop = "p_biscuitsandwich01x",
        hunger = 8, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0,
        horseStamina = 0,
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        -- returnedItem = {name = "beer", count = 1}, -- or false
        returnedItem = false, -- or false
        usageLimit = 1, -- how many times it can be used
    },
    ["lemonade"] = {
        prop = "p_water01x",
        hunger = 0, 
        thirst = 20, 
        health = 0,
        stamina = 10, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["coffee"] = {
        prop = "p_mugCoffee01x",
        hunger = 0, 
        thirst = 10, 
        health = 0,
        stamina = 10, 
        stress = 0, 
        Alcohol = -15,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "coffe",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["applepie"] = {
        prop = "p_biscuitsandwich01x",
        hunger = 15, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0,
        horseStamina = 0,
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        -- returnedItem = {name = "beer", count = 1}, -- or false
        returnedItem = false, -- or false
        usageLimit = 1, -- how many times it can be used
    },
    ["wildberrypie"] = {
        prop = "p_biscuitsandwich01x",
        hunger = 15, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0,
        horseStamina = 0,
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        -- returnedItem = {name = "beer", count = 1}, -- or false
        returnedItem = false, -- or false
        usageLimit = 1, -- how many times it can be used
    },
    ["bun"] = {
        prop = "p_biscuitsandwich01x",
        hunger = 1, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0,
        horseStamina = 0,
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        -- returnedItem = {name = "beer", count = 1}, -- or false
        returnedItem = false, -- or false
        usageLimit = 1, -- how many times it can be used
    },
    
    ["chocolate"] = {
        prop = "s_chocolatebar01x",
        hunger = 5, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = -5, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["peanuts"] = {
        prop = "s_chocolatebar01x",
        hunger = 15, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = -5, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["popcorn"] = {
        prop = "s_chocolatebar01x",
        hunger = 15, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = -5, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["crayfishbites"] = {
        prop = "s_chocolatebar01x",
        hunger = 15, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = -5, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["consumable_medicine"] = {
        prop = "p_medicine01x",
        hunger = 0, 
        thirst = 15, 
        health = 60,
        stamina = 25, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["commanchestew"] = {
        prop = "s_cankidney01x",
        hunger = 25, 
        thirst = 10, 
        health = 0,
        stamina = 5, 
        stress = -5, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["fishstew"] = {
        prop = "s_cankidney01x",
        hunger = 15, 
        thirst = 5, 
        health = 0,
        stamina = 5, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "stew", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["gatorgumbo"] = {
        prop = "s_cankidney01x",
        hunger = 15, 
        thirst = 5, 
        health = 0,
        stamina = 5, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "stew", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["stew"] = {
        prop = "s_cankidney01x",
        hunger = 15, 
        thirst = 5, 
        health = 0,
        stamina = 5, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "stew", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["menwaagamig"] = {
        prop = "s_cankidney01x",
        hunger = 25, 
        thirst = 10, 
        health = 0,
        stamina = 5, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["pemmican"] = {
        prop = "p_water01x",
        hunger = 20, 
        thirst = 10, 
        health = 0,
        stamina = 5, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["warriorsstew"] = {
        prop = "s_cankidney01x",
        hunger = 20, 
        thirst = 10, 
        health = 0,
        stamina = 5, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["threesistersstew"] = {
        prop = "s_cankidney01x",
        hunger = 20, 
        thirst = 10, 
        health = 0,
        stamina = 10, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },

    --tosarai items
    ["grapedumpling"] = {
        prop = "grapedumplings",
        hunger = 60, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "dumplings", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["bisonstew"] = {
        prop = "s_cankidney01x",
        hunger = 60, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "stew", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["squashsoup"] = {
        prop = "s_cankidney01x",
        hunger = 40, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = -35,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "stew", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["applefrybread"] = {
        prop = "applefrybread",
        hunger = 40, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = -35,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["spikedpinole"] = {
        prop = "p_water01x",
        hunger = 0, 
        thirst = 20, 
        health = 0,
        stamina = 20, 
        stress = -20, 
        Alcohol = 25,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, --
        SetPedDrunkness = { --- or false or nil
            drunknessLevel = 0.25, -- SOBER = 0.0f, SLIGHTLY_DRUNK = 0.25f, MODERATELY_DRUNK = 0.5f, VERY_DRUNK = 1.0f
            duration = 120 --- Second
        },
--        ScreenEffect = {  --- or false or nil
--            effect = "PlayerDrunk01",
--            duration = 0 --- Second 
--        }
    },
    ["persimmon"] = {
        prop = "s_bit_bread06",
        hunger = 40, 
        thirst = 0, 
        health = 0,
        stamina = 5, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "persimmon", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    --
    ["seafoodstew"] = {
        prop = "s_cankidney01x",
        hunger = 15, 
        thirst = 5, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["gumbo"] = {
        prop = "s_cankidney01x",
        hunger = 15, 
        thirst = 5, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "stew", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["cheese"] = {
        prop = "p_pickup_cheese01x",
        hunger = 1, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["fruitcake"] = {
        prop = "s_bit_bread06",
        hunger = 5, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 5, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["chocolatecake"] = {
        prop = "s_chocolatebar01x",
        hunger = 15, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["cookie"] = {
        prop = "s_chocolatebar02x",
        hunger = 10, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["consumable_kidneybeans_can"] = {
        prop = "s_cankidney01x",
        hunger = 15, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "stew", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["fruitplate"] = {
        prop = "s_bit_bread06",
        hunger = 10, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "stew", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["lobster"] = {
        prop = "s_cankidney01x",
        hunger = 20, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["oyster"] = {
        prop = "s_cankidney01x",
        hunger = 10, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["steak"] = {
        prop = "s_cankidney01x",
        hunger = 15, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["venisonsteak"] = {
        prop = "s_cankidney01x",
        hunger = 15, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["elksteak"] = {
        prop = "s_cankidney01x",
        hunger = 15, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["hamburger"] = {
        prop = "burger",
        hunger = 20, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["fries"] = {
        prop = "p_biscuitsandwich01x",
        hunger = 20, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },

    
        -- Lenora Saloon
        ["steakeggs"] = {
            prop = "p_biscuitsandwich01x",
            hunger = 60, 
            thirst = 0, 
            health = 0,
            stamina = 0, 
            stress = 0, 
            Alcohol = 0,
            horseHealth = 0, -- Horse Health
            horseStamina = 0, -- Horse Stamina
            goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
            healthInnerCoreGold = 0.0,
            healthOuterCoreGold = 0.0,
            staminaInnerCoreGold = 0.0,
            staminaOuterCoreGold = 0.0,
            animation = "stew", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
            returnedItem = false, -- or false
            usageLimit = 1, -- 
        },
        ["biscuitsngravy"] = {
            prop = "p_biscuitsandwich01x",
            hunger = 40, 
            thirst = 0, 
            health = 0,
            stamina = 0, 
            stress = 0, 
            Alcohol = -35,
            horseHealth = 0, -- Horse Health
            horseStamina = 0, -- Horse Stamina
            goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
            healthInnerCoreGold = 0.0,
            healthOuterCoreGold = 0.0,
            staminaInnerCoreGold = 0.0,
            staminaOuterCoreGold = 0.0,
            animation = "stew", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
            returnedItem = false, -- or false
            usageLimit = 1, -- 
        },
        ["schmuddpie"] = {
            prop = "p_biscuitsandwich01x",
            hunger = 40, 
            thirst = 0, 
            health = 0,
            stamina = 0, 
            stress = 0, 
            Alcohol = -35,
            horseHealth = 0, -- Horse Health
            horseStamina = 0, -- Horse Stamina
            goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
            healthInnerCoreGold = 0.0,
            healthOuterCoreGold = 0.0,
            staminaInnerCoreGold = 0.0,
            staminaOuterCoreGold = 0.0,
            animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
            returnedItem = false, -- or false
            usageLimit = 1, -- 
        },
        ["chocolatemilk"] = {
            prop = "p_water01x",
            hunger = 0, 
            thirst = 60, 
            health = 0,
            stamina = 20, 
            stress = 0, 
            Alcohol = 0,
            horseHealth = 0, -- Horse Health
            horseStamina = 0, -- Horse Stamina
            goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
            healthInnerCoreGold = 0.0,
            healthOuterCoreGold = 0.0,
            staminaInnerCoreGold = 0.0,
            staminaOuterCoreGold = 0.0,
            animation = "drink",
            returnedItem = false, -- {name = "bottle",count = 1}
            usageLimit = 1, -- 
        },
        ["blushwhiskey"] = {
            prop = "p_mugCoffee01x",
            hunger = 0, 
            thirst = 20, 
            health = 0,
            stamina = 20, 
            stress = -20, 
            Alcohol = 25,
            horseHealth = 0, -- Horse Health
            horseStamina = 0, -- Horse Stamina
            goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
            healthInnerCoreGold = 0.0,
            healthOuterCoreGold = 0.0,
            staminaInnerCoreGold = 0.0,
            staminaOuterCoreGold = 0.0,
            animation = "coffe",
            returnedItem = false, -- {name = "bottle",count = 1}
            usageLimit = 1, --
            SetPedDrunkness = { --- or false or nil
                drunknessLevel = 0.25, -- SOBER = 0.0f, SLIGHTLY_DRUNK = 0.25f, MODERATELY_DRUNK = 0.5f, VERY_DRUNK = 1.0f
                duration = 120 --- Second
            },
--            ScreenEffect = {  --- or false or nil
--                effect = "PlayerDrunk01",
--                duration = 0 --- Second 
--            } 
        },
        -- Casino
        ["porkrinds"] = {
            prop = "p_biscuitsandwich01x",
            hunger = 40, 
            thirst = 0, 
            health = 0,
            stamina = 0, 
            stress = 0, 
            Alcohol = -35,
            horseHealth = 0, -- Horse Health
            horseStamina = 0, -- Horse Stamina
            goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
            healthInnerCoreGold = 0.0,
            healthOuterCoreGold = 0.0,
            staminaInnerCoreGold = 0.0,
            staminaOuterCoreGold = 0.0,
            animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
            returnedItem = false, -- or false
            usageLimit = 1, -- 
        },
        ["riverboatbrew"] = {
            prop = "p_bottleJD01x",
            hunger = 0, 
            thirst = 20, 
            health = 0,
            stamina = 20, 
            stress = -20, 
            Alcohol = 25,
            horseHealth = 0, -- Horse Health
            horseStamina = 0, -- Horse Stamina
            goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
            healthInnerCoreGold = 0.0,
            healthOuterCoreGold = 0.0,
            staminaInnerCoreGold = 0.0,
            staminaOuterCoreGold = 0.0,
            animation = "beer",
            returnedItem = false, -- {name = "bottle",count = 1}
            usageLimit = 1, --
            SetPedDrunkness = { --- or false or nil
                drunknessLevel = 0.25, -- SOBER = 0.0f, SLIGHTLY_DRUNK = 0.25f, MODERATELY_DRUNK = 0.5f, VERY_DRUNK = 1.0f
                duration = 120 --- Second
            },
--            ScreenEffect = {  --- or false or nil
--                effect = "PlayerDrunk01",
--                duration = 0 --- Second 
--            } 
        },
        ["rustwoodwhiskey"] = {
            prop = "p_bottleJD01x",
            hunger = 0, 
            thirst = 20, 
            health = 0,
            stamina = 20, 
            stress = -20, 
            Alcohol = 25,
            horseHealth = 0, -- Horse Health
            horseStamina = 0, -- Horse Stamina
            goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
            healthInnerCoreGold = 0.0,
            healthOuterCoreGold = 0.0,
            staminaInnerCoreGold = 0.0,
            staminaOuterCoreGold = 0.0,
            animation = "beer",
            returnedItem = false, -- {name = "bottle",count = 1}
            usageLimit = 1, --
            SetPedDrunkness = { --- or false or nil
                drunknessLevel = 0.25, -- SOBER = 0.0f, SLIGHTLY_DRUNK = 0.25f, MODERATELY_DRUNK = 0.5f, VERY_DRUNK = 1.0f
                duration = 120 --- Second
            },
--            ScreenEffect = {  --- or false or nil
--                effect = "PlayerDrunk01",
--                duration = 0 --- Second 
--            } 
        },


    -- Tom/Luther Saloon
    ["fishchips"] = {
        prop = "p_biscuitsandwich01x",
        hunger = 60, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "lutherfish", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["seafoodboil"] = {
        prop = "p_biscuitsandwich01x",
        hunger = 60, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "lutherfish", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["applecake"] = {
        prop = "luthercake",
        hunger = 40, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = -35,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "luthercake", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["honeytea"] = {
        prop = "honeytea",
        hunger = 0, 
        thirst = 60, 
        health = 0,
        stamina = 25, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "coffe", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["mintlemonade"] = {
        prop = "honeytea",
        hunger = 0, 
        thirst = 60, 
        health = 0,
        stamina = 25, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "coffe", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["pommartini"] = {
        prop = "luthermartini",
        hunger = 0, 
        thirst = 20, 
        health = 0,
        stamina = 20, 
        stress = -20, 
        Alcohol = 25,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "coffe",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
        SetPedDrunkness = { --- or false or nil
            drunknessLevel = 0.50, -- SOBER = 0.0f, SLIGHTLY_DRUNK = 0.25f, MODERATELY_DRUNK = 0.5f, VERY_DRUNK = 1.0f
            duration = 120 --- Second
        },
--        ScreenEffect = {  --- or false or nil
--            effect = "PlayerDrunk01",
--            duration = 0 --- Second 
--        }
    },
    ["grog"] = {
        prop = "p_bottleJD01x",
        hunger = 0, 
        thirst = 20, 
        health = 0,
        stamina = 20, 
        stress = -20, 
        Alcohol = 25,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "beer",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
        SetPedDrunkness = { --- or false or nil
            drunknessLevel = 0.5, -- SOBER = 0.0f, SLIGHTLY_DRUNK = 0.25f, MODERATELY_DRUNK = 0.5f, VERY_DRUNK = 1.0f
            duration = 120 --- Second
        },
--        ScreenEffect = {  --- or false or nil
--            effect = "PlayerDrunk01",
--            duration = 0 --- Second 
--        }
    },
    ["danioldfashioned"] = {
        prop = "p_bottleJD01x",
        hunger = 0, 
        thirst = 20, 
        health = 0,
        stamina = 20, 
        stress = -20, 
        Alcohol = 25,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "beer",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
        SetPedDrunkness = { --- or false or nil
            drunknessLevel = 0.5, -- SOBER = 0.0f, SLIGHTLY_DRUNK = 0.25f, MODERATELY_DRUNK = 0.5f, VERY_DRUNK = 1.0f
            duration = 120 --- Second
        },
--        ScreenEffect = {  --- or false or nil
--            effect = "PlayerDrunk01",
--            duration = 0 --- Second 
--        }
    },
    ["choccypommies"] = {
        prop = "s_chocolatebar01x",
        hunger = 15, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "eat", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["pitatzatziki"] = {
        prop = "p_biscuitsandwich01x",
        hunger = 15, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "stew", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["crabcakes"] = {
        prop = "p_biscuitsandwich01x",
        hunger = 30, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = -35,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "stew", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    -- Taste of Japan
    ["noodlesoup"] = {
        prop = "s_chocolatebar01x",
        hunger = 60, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "stew", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["nigiri"] = {
        prop = "s_chocolatebar01x",
        hunger = 40, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["sashimi"] = {
        prop = "p_biscuitsandwich01x",
        hunger = 40, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["matchatea"] = {
        prop = "p_water01x",
        hunger = 0, 
        thirst = 60, 
        health = 0,
        stamina = 25, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["rasberrysake"] = {
        prop = "p_water01x",
        hunger = 0, 
        thirst = 20, 
        health = 0,
        stamina = 25, 
        stress = 25, 
        Alcohol = 15,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
        SetPedDrunkness = { --- or false or nil
            drunknessLevel = 0.5, -- SOBER = 0.0f, SLIGHTLY_DRUNK = 0.25f, MODERATELY_DRUNK = 0.5f, VERY_DRUNK = 1.0f
            duration = 120 --- Second
        },
--        ScreenEffect = {  --- or false or nil
--            effect = "PlayerDrunk01",
--            duration = 0 --- Second 
--        }
    },

    -- Emerald Saloon
    ["nonnasbolognese"] = {
        prop = "p_biscuitsandwich01x",
        hunger = 60, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["garlicbread"] = {
        prop = "p_biscuitsandwich01x",
        hunger = 40, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["salcannoli"] = {
        prop = "p_biscuitsandwich01x",
        hunger = 40, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["cacciatorecappo"] = {
        prop = "p_water01x",
        hunger = 0, 
        thirst = 60, 
        health = 0,
        stamina = 25, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["salsangria"] = {
        prop = "p_water01x",
        hunger = 0, 
        thirst = 20, 
        health = 0,
        stamina = 25, 
        stress = 0, 
        Alcohol = 15,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
        SetPedDrunkness = { --- or false or nil
            drunknessLevel = 0.5, -- SOBER = 0.0f, SLIGHTLY_DRUNK = 0.25f, MODERATELY_DRUNK = 0.5f, VERY_DRUNK = 1.0f
            duration = 120 --- Second
        },
--        ScreenEffect = {  --- or false or nil
--            effect = "PlayerDrunk01",
--            duration = 0 --- Second 
--        }
    },

    -- Saint Denis Ice Cream Shop
        ["icecreamsundae"] = {
        prop = "sundae",
        hunger = 60, 
        thirst = 0, 
        health = 0,
        stamina = 5, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sundae", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["gummywhales"] = {
        prop = "bluewhales",
        hunger = 15, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "eat", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["bigsauceyballs"] = {
        prop = "cinbuns",
        hunger = 40, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = -35,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "cinbuns", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["brightonrootbeer"] = {
        prop = "bottletester",
        hunger = 0, 
        thirst = 50, 
        health = 0,
        stamina = 25, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["choccyshake"] = {
        prop = "chocshake",
        hunger = 10, 
        thirst = 30, 
        health = 0,
        stamina = 25, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "coffe",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
-- Rhodes Candy
    ["barbslolis"] = {
        prop = "s_chocolatebar01x",
        hunger = 15, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "eat", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["butterscotch"] = {
        prop = "s_chocolatebar01x",
        hunger = 15, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "eat", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["candyapple"] = {
        prop = "s_chocolatebar01x",
        hunger = 25, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "eat", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["chocolatebox"] = {
        prop = "s_chocolatebar01x",
        hunger = 15, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "eat", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["peppermintcoco"] = {
        prop = "p_mugCoffee01x",
        hunger = 0, 
        thirst = 60, 
        health = 0,
        stamina = 25, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "coffe", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    -- Blackwater Bakery
    ["pumpkinspicelatte"] = {
        prop = "p_mugCoffee01x",
        hunger = 0, 
        thirst = 60, 
        health = 0,
        stamina = 25, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "coffe", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["strawberrymilk"] = {
        prop = "p_water01x",
        hunger = 0, 
        thirst = 60, 
        health = 0,
        stamina = 20, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["macarons"] = {
        prop = "p_biscuitsandwich01x",
        hunger = 25, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "eat", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["midnightstrawberry"] = {
        prop = "s_chocolatebar01x",
        hunger = 25, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "stew", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["lecroissant"] = {
        prop = "p_biscuitsandwich01x",
        hunger = 40, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = -35,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    -- Rhodes Saloon
    ["buffalo_chicken"] = {
        prop = "p_biscuitsandwich01x",
        hunger = 60, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["poutine"] = {
        prop = "p_biscuitsandwich01x",
        hunger = 40, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = -35,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["bbq_burntends"] = {
        prop = "p_biscuitsandwich01x",
        hunger = 40, 
        thirst = 0, 
        health = 0,
        stamina = 5, 
        stress = 0, 
        Alcohol = -35,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["southern_sweettea"] = {
        prop = "p_water01x",
        hunger = 0, 
        thirst = 60, 
        health = 0,
        stamina = 20, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["maple_whiskey"] = {
        prop = "p_water01x",
        hunger = 0, 
        thirst = 20, 
        health = 0,
        stamina = 20, 
        stress = -20, 
        Alcohol = 25,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
        SetPedDrunkness = { --- or false or nil
            drunknessLevel = 1.0, -- SOBER = 0.0f, SLIGHTLY_DRUNK = 0.25f, MODERATELY_DRUNK = 0.5f, VERY_DRUNK = 1.0f
            duration = 120 --- Second
        },
--        ScreenEffect = {  --- or false or nil
--            effect = "PlayerDrunk01",
--            duration = 0 --- Second 
--        }
    },

    -- Bastille Saloon
    ["spaghetti_meatballs"] = {
        prop = "spaghetti",
        hunger = 60, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "spaghetti", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["classicpepperoni"] = {
        prop = "pslice_pepp",
        hunger = 40, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = -35,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["tiramisu"] = {
        prop = "tiramisu",
        hunger = 40, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = -35,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "tiramisu", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["italiansoda"] = {
        prop = "italiansoda",
        hunger = 0, 
        thirst = 60, 
        health = 0,
        stamina = 20, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "coffe",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["housewine"] = {
        prop = "p_water01x",
        hunger = 0, 
        thirst = 20, 
        health = 0,
        stamina = 20, 
        stress = -20, 
        Alcohol = 25,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
        SetPedDrunkness = { --- or false or nil
            drunknessLevel = 0.50, -- SOBER = 0.0f, SLIGHTLY_DRUNK = 0.25f, MODERATELY_DRUNK = 0.5f, VERY_DRUNK = 1.0f
            duration = 120 --- Second
        },
--        ScreenEffect = {  --- or false or nil
--            effect = "PlayerDrunk01",
--            duration = 0 --- Second 
--        }
    },

    -- Armadillo Saloon
    ["toogoodchili"] = {
        prop = "s_cankidney01x",
        hunger = 60, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "stew", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["depuyer"] = {
        prop = "p_biscuitsandwich01x",
        hunger = 40, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["trail_mix"] = {
        prop = "p_biscuitsandwich01x",
        hunger = 40, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["cactuswater"] = {
        prop = "p_water01x",
        hunger = 0, 
        thirst = 60, 
        health = 0,
        stamina = 20, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["rancheropunch"] = {
        prop = "p_water01x",
        hunger = 0, 
        thirst = 20, 
        health = 0,
        stamina = 20, 
        stress = -20, 
        Alcohol = 25,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
        SetPedDrunkness = { --- or false or nil
            drunknessLevel = 0.50, -- SOBER = 0.0f, SLIGHTLY_DRUNK = 0.25f, MODERATELY_DRUNK = 0.5f, VERY_DRUNK = 1.0f
            duration = 120 --- Second
        },
--        ScreenEffect = {  --- or false or nil
--            effect = "PlayerDrunk01",
--            duration = 0 --- Second 
--        }
    },


    -- Blackwater Saloon
    ["cowboydinner"] = {
        prop = "p_biscuitsandwich01x",
        hunger = 60, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["biscuitsgravy"] = {
        prop = "p_biscuitsandwich01x",
        hunger = 40, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["bakedmac"] = {
        prop = "p_biscuitsandwich01x",
        hunger = 40, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["pinklemonade"] = {
        prop = "p_water01x",
        hunger = 0, 
        thirst = 60, 
        health = 0,
        stamina = 20, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["ranchwater"] = {
        prop = "p_water01x",
        hunger = 0, 
        thirst = 20, 
        health = 0,
        stamina = 20, 
        stress = -20, 
        Alcohol = 25,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
        SetPedDrunkness = { --- or false or nil
            drunknessLevel = 0.50, -- SOBER = 0.0f, SLIGHTLY_DRUNK = 0.25f, MODERATELY_DRUNK = 0.5f, VERY_DRUNK = 1.0f
            duration = 120 --- Second
        },
--        ScreenEffect = {  --- or false or nil
--            effect = "PlayerDrunk01",
--            duration = 0 --- Second 
--        }
    },

    -- Valentine Saloon
    ["bullet_soup"] = {
        prop = "s_cankidney01x",
        hunger = 60, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },

    ["bannock"] = {
        prop = "p_biscuitsandwich01x",
        hunger = 40, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["raspberryhandpie"] = {
        prop = "p_biscuitsandwich01x",
        hunger = 40, 
        thirst = 0, 
        health = 0,
        stamina = 15, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "tenders", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },

    ["odoonibiinstea"] = {
        prop = "p_water01x",
        hunger = 0, 
        thirst = 60, 
        health = 0,
        stamina = 20, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["honeyedmiskwi"] = {
        prop = "p_water01x",
        hunger = 0, 
        thirst = 25, 
        health = 0,
        stamina = 25, 
        stress = -20, 
        Alcohol = 25,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
        SetPedDrunkness = { --- or false or nil
            drunknessLevel = 0.5, -- SOBER = 0.0f, SLIGHTLY_DRUNK = 0.25f, MODERATELY_DRUNK = 0.5f, VERY_DRUNK = 1.0f
            duration = 120 --- Second
        },
--        ScreenEffect = {  --- or false or nil
--            effect = "PlayerDrunk01",
--            duration = 0 --- Second 
--        }
    },
    -- Scarlet Lounge
    ["chickenfettuccine"] = {
        prop = "s_cankidney01x",
        hunger = 60, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = -35,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "stew", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },

    ["loadedsteakfries"] = {
        prop = "s_cankidney01x",
        hunger = 40, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = -35,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "stew", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["strawberrycheesecake"] = {
        prop = "p_biscuitsandwich01x",
        hunger = 40, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = -35,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },

    ["oceanbreeze"] = {
        prop = "p_water01x",
        hunger = 0, 
        thirst = 60, 
        health = 0,
        stamina = 20, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["corruptcocktail"] = {
        prop = "p_water01x",
        hunger = 0, 
        thirst = 20, 
        health = 0,
        stamina = 20, 
        stress = -20, 
        Alcohol = 25,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, --
        SetPedDrunkness = { --- or false or nil
            drunknessLevel = 0.25, -- SOBER = 0.0f, SLIGHTLY_DRUNK = 0.25f, MODERATELY_DRUNK = 0.5f, VERY_DRUNK = 1.0f
            duration = 60 --- Second
        },
       ScreenEffect = {  --- or false or nil
           effect = "PlayerDrunk01",
           duration = 15 --- Second 
       } 
    },
-- Tumbleweed Saloon
    ["chilliconcarne"] = {
        prop = "s_cankidney01x",
        hunger = 60, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = -35,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "stew", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },

    ["tamale"] = {
        prop = "s_cankidney01x",
        hunger = 40, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = -35,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "stew", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["taco"] = {
        prop = "p_biscuitsandwich01x",
        hunger = 40, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = -35,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },

    ["aguadelimon"] = {
        prop = "p_water01x",
        hunger = 0, 
        thirst = 60, 
        health = 0,
        stamina = 20, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["tequila"] = {
        prop = "p_water01x",
        hunger = 0, 
        thirst = 20, 
        health = 0,
        stamina = 20, 
        stress = -20, 
        Alcohol = 50,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, --
        SetPedDrunkness = { --- or false or nil
            drunknessLevel = 0.50, -- SOBER = 0.0f, SLIGHTLY_DRUNK = 0.25f, MODERATELY_DRUNK = 0.5f, VERY_DRUNK = 1.0f
            duration = 120 --- Second
        },
       ScreenEffect = {  --- or false or nil
           effect = "PlayerDrunk01",
           duration = 60 --- Second 
       } 
    },
    -- Thieve's Landing Saloon
    ["irishstew"] = {
        prop = "s_cankidney01x",
        hunger = 60, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "stew", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },

    ["potatosoup"] = {
        prop = "s_cankidney01x",
        hunger = 40, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = -35,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "stew", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["landingsalad"] = {
        prop = "s_cankidney01x",
        hunger = 40, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = -35,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "stew", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },

    ["newaustinicedtea"] = {
        prop = "p_water01x",
        hunger = 0, 
        thirst = 60, 
        health = 0,
        stamina = 20, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["doylestout"] = {
        prop = "p_water01x",
        hunger = 0, 
        thirst = 20, 
        health = 0,
        stamina = 20, 
        stress = -20, 
        Alcohol = 25,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, --
        SetPedDrunkness = { --- or false or nil
            drunknessLevel = 0.25, -- SOBER = 0.0f, SLIGHTLY_DRUNK = 0.25f, MODERATELY_DRUNK = 0.5f, VERY_DRUNK = 1.0f
            duration = 120 --- Second
        },
--        ScreenEffect = {  --- or false or nil
--            effect = "PlayerDrunk01",
--            duration = 0 --- Second 
--        } 
    },
-- Strawberry Saloon V2
    ["herbedvenison"] = {
        prop = "s_cankidney01x",
        hunger = 60, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = -50,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "stew", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },

    ["cheesychickendumpling"] = {
        prop = "s_cankidney01x",
        hunger = 40, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = -35,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "stew", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["strawberryshortcake"] = {
        prop = "p_biscuitsandwich01x",
        hunger = 40, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = -35,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },

    ["strawberryspritzer"] = {
        prop = "p_water01x",
        hunger = 0, 
        thirst = 60, 
        health = 0,
        stamina = 20, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["strawberryrhubarbwhiskey"] = {
        prop = "p_water01x",
        hunger = 0, 
        thirst = 20, 
        health = 0,
        stamina = 20, 
        stress = -20, 
        Alcohol = 25,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, --
        SetPedDrunkness = { --- or false or nil
            drunknessLevel = 0.25, -- SOBER = 0.0f, SLIGHTLY_DRUNK = 0.25f, MODERATELY_DRUNK = 0.5f, VERY_DRUNK = 1.0f
            duration = 120 --- Second
        },
--        ScreenEffect = {  --- or false or nil
--            effect = "PlayerDrunk01",
--            duration = 0 --- Second 
--        } 
    },
    -- Doyals Saloon
    ["ranchers_pie"] = {
        prop = "p_biscuitsandwich01x",
        hunger = 60, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },

    ["cowboyporkbeans"] = {
        prop = "beans",
        hunger = 40, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = -35,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "beans", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["cornedbeef_cabbage"] = {
        prop = "cornedbeef",
        hunger = 40, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = -35,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "cornedbeef", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },

    ["deadeyecola"] = {
        prop = "p_water01x",
        hunger = 0, 
        thirst = 60, 
        health = 0,
        stamina = 20, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["charlestonswampwater"] = {
        prop = "p_water01x",
        hunger = 0, 
        thirst = 20, 
        health = 0,
        stamina = 20, 
        stress = -20, 
        Alcohol = 25,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, --
        SetPedDrunkness = { --- or false or nil
            drunknessLevel = 0.25, -- SOBER = 0.0f, SLIGHTLY_DRUNK = 0.25f, MODERATELY_DRUNK = 0.5f, VERY_DRUNK = 1.0f
            duration = 120 --- Second
        },
--        ScreenEffect = {  --- or false or nil
--            effect = "PlayerDrunk01",
--            duration = 0 --- Second 
--        } 
    },
        -- Charlie Emerald
    ["meatloaf"] = {
        prop = "p_biscuitsandwich01x",
        hunger = 60, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "stew", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },

    ["brunswickstew"] = {
        prop = "p_biscuitsandwich01x",
        hunger = 40, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = -35,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "stew", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["hushpuppies"] = {
        prop = "p_biscuitsandwich01x",
        hunger = 40, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = -35,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },

    ["cherrysoda"] = {
        prop = "p_water01x",
        hunger = 0, 
        thirst = 60, 
        health = 0,
        stamina = 20, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["whiskeysour"] = {
        prop = "p_mugCoffee01x",
        hunger = 0, 
        thirst = 20, 
        health = 0,
        stamina = 20, 
        stress = -20, 
        Alcohol = 25,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "coffe",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, --
        SetPedDrunkness = { --- or false or nil
            drunknessLevel = 0.25, -- SOBER = 0.0f, SLIGHTLY_DRUNK = 0.25f, MODERATELY_DRUNK = 0.5f, VERY_DRUNK = 1.0f
            duration = 120 --- Second
        },
--        ScreenEffect = {  --- or false or nil
--            effect = "PlayerDrunk01",
--            duration = 0 --- Second 
--        } 
    },
    -- Frankie Rhodes
    ["farmerbrunch"] = {
        prop = "p_biscuitsandwich01x",
        hunger = 60, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "stew", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["loadedpotato"] = {
        prop = "p_biscuitsandwich01x",
        hunger = 40, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = -35,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "stew", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["gabagoolsandwich"] = {
        prop = "p_biscuitsandwich01x",
        hunger = 40, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = -35,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["fruitpunch"] = {
        prop = "p_water01x",
        hunger = 0, 
        thirst = 60, 
        health = 0,
        stamina = 20, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["jamboozle"] = {
        prop = "p_mugCoffee01x",
        hunger = 0, 
        thirst = 20, 
        health = 0,
        stamina = 20, 
        stress = -20, 
        Alcohol = 25,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "coffe",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, --
        SetPedDrunkness = { --- or false or nil
            drunknessLevel = 0.25, -- SOBER = 0.0f, SLIGHTLY_DRUNK = 0.25f, MODERATELY_DRUNK = 0.5f, VERY_DRUNK = 1.0f
            duration = 120 --- Second
        },
--        ScreenEffect = {  --- or false or nil
--            effect = "PlayerDrunk01",
--            duration = 0 --- Second 
--        } 
    },
    -- Hicks
        ["applepieshine"] = {
        prop = "p_water01x",
        hunger = 0, 
        thirst = 20, 
        health = 0,
        stamina = 20, 
        stress = -35, 
        Alcohol = 35,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, --
        SetPedDrunkness = { --- or false or nil
            drunknessLevel = 0.25, -- SOBER = 0.0f, SLIGHTLY_DRUNK = 0.25f, MODERATELY_DRUNK = 0.5f, VERY_DRUNK = 1.0f
            duration = 240 --- Second
        },
--        ScreenEffect = {  --- or false or nil
--            effect = "PlayerDrunk01",
--            duration = 0 --- Second 
--        } 
    },
        ["peachcobblershine"] = {
        prop = "p_water01x",
        hunger = 0, 
        thirst = 20, 
        health = 0,
        stamina = 20, 
        stress = -35, 
        Alcohol = 35,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, --
        SetPedDrunkness = { --- or false or nil
            drunknessLevel = 0.25, -- SOBER = 0.0f, SLIGHTLY_DRUNK = 0.25f, MODERATELY_DRUNK = 0.5f, VERY_DRUNK = 1.0f
            duration = 240 --- Second
        },
--        ScreenEffect = {  --- or false or nil
--            effect = "PlayerDrunk01",
--            duration = 0 --- Second 
--        } 
    },
        ["swamppunchshine"] = {
        prop = "p_water01x",
        hunger = 0, 
        thirst = 20, 
        health = 0,
        stamina = 20, 
        stress = -35, 
        Alcohol = 35,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, --
        SetPedDrunkness = { --- or false or nil
            drunknessLevel = 0.25, -- SOBER = 0.0f, SLIGHTLY_DRUNK = 0.25f, MODERATELY_DRUNK = 0.5f, VERY_DRUNK = 1.0f
            duration = 240 --- Second
        },
--        ScreenEffect = {  --- or false or nil
--            effect = "PlayerDrunk01",
--            duration = 0 --- Second 
--        } 
    },
    -- Guarma
    ["crawfishboil"] = {
        prop = "p_biscuitsandwich01x",
        hunger = 60, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "stew", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["chickenricebeans"] = {
        prop = "p_biscuitsandwich01x",
        hunger = 40, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = -35,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "stew", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["wingsnfries"] = {
        prop = "p_biscuitsandwich01x",
        hunger = 40, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = -35,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "stew", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["virginpinacolada"] = {
        prop = "p_water01x",
        hunger = 0, 
        thirst = 60, 
        health = 0,
        stamina = 20, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["hottea"] = {
        prop = "p_mugCoffee01x",
        hunger = 0, 
        thirst = 60, 
        health = 0,
        stamina = 20, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "coffe",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    -- Doyals Saloon
    ["potpie"] = {
        prop = "p_biscuitsandwich01x",
        hunger = 60, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },

    ["coddle"] = {
        prop = "p_biscuitsandwich01x",
        hunger = 40, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = -35,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "stew", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["pretzel"] = {
        prop = "p_biscuitsandwich01x",
        hunger = 40, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = -35,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["irishwhiskey"] = {
        prop = "p_water01x",
        hunger = 0, 
        thirst = 20, 
        health = 0,
        stamina = 20, 
        stress = -20, 
        Alcohol = 25,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, --
        SetPedDrunkness = { --- or false or nil
            drunknessLevel = 0.5, -- SOBER = 0.0f, SLIGHTLY_DRUNK = 0.25f, MODERATELY_DRUNK = 0.5f, VERY_DRUNK = 1.0f
            duration = 120 --- Second
        },
--        ScreenEffect = {  --- or false or nil
--            effect = "PlayerDrunk01",
--            duration = 0 --- Second 
--        } 
    },
    ["irishstout"] = {
        prop = "p_water01x",
        hunger = 0, 
        thirst = 20, 
        health = 0,
        stamina = 20, 
        stress = -20, 
        Alcohol = 25,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, --
        SetPedDrunkness = { --- or false or nil
            drunknessLevel = 0.5, -- SOBER = 0.0f, SLIGHTLY_DRUNK = 0.25f, MODERATELY_DRUNK = 0.5f, VERY_DRUNK = 1.0f
            duration = 120 --- Second
        },
--        ScreenEffect = {  --- or false or nil
--            effect = "PlayerDrunk01",
--            duration = 0 --- Second 
--        } 
    },

    --cinema


    --graverose
    ["fallenstar"] = {
        prop = "p_water01x",
        hunger = 0, 
        thirst = 20, 
        health = 0,
        stamina = 20, 
        stress = -20, 
        Alcohol = 100,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, --
        SetPedDrunkness = { --- or false or nil
            drunknessLevel = 1.0, -- SOBER = 0.0f, SLIGHTLY_DRUNK = 0.25f, MODERATELY_DRUNK = 0.5f, VERY_DRUNK = 1.0f
            duration = 120 --- Second
        },
--        ScreenEffect = {  --- or false or nil
--            effect = "PlayerDrunk01",
--            duration = 0 --- Second 
--        } 
        },
    ["moonmist"] = {
        prop = "p_water01x",
        hunger = 0, 
        thirst = 65, 
        health = 0,
        stamina = 25, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },

    ["deathrolldinner"] = {
        prop = "p_biscuitsandwich01x",
        hunger = 60, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "deathroll", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },

    ["broodandtusk"] = {
        prop = "p_biscuitsandwich01x",
        hunger = 40, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "gatoreggs", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["gravemelts"] = {
        prop = "s_chocolatebar01x",
        hunger = 15, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["velvetandvine"] = {
        prop = "s_chocolatebar01x",
        hunger = 15, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["tombstonetenders"] = {
        prop = "holchktend",
        hunger = 40, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = -35,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "tenders", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["mourningdew"] = {
        prop = "p_water01x",
        hunger = 0, 
        thirst = 60, 
        health = 0,
        stamina = 20, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["badomen"] = {
        prop = "p_water01x",
        hunger = 0, 
        thirst = 60, 
        health = 0,
        stamina = 20, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["bitterblossom"] = {
        prop = "p_water01x",
        hunger = 0, 
        thirst = 65, 
        health = 0,
        stamina = 25, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },

    ["bacon"] = {
        prop = "s_cankidney01x",
        hunger = 10, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["sausage"] = {
        prop = "s_cankidney01x",
        hunger = 20, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["chilliandcornbread"] = {
        prop = "s_cankidney01x",
        hunger = 20, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["sheperdspie"] = {
        prop = "s_cankidney01x",
        hunger = 15, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["steakandpotatoes"] = {
        prop = "s_cankidney01x",
        hunger = 20, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["piecrust"] = {
        prop = "s_bit_bread06",
        hunger = 5, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["water"] = {
        prop = "p_water01x",
        hunger = 0, 
        thirst = 10, 
        health = 0,
        stamina = 10, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    -- ["fullcanteen"] = {
    --     prop = "p_cs_canteen_hercule",
    --     hunger = 0, 
    --     thirst = 45, 
    --     health = 0,
    --     stamina = 25, 
    --     stress = 0, 
    --     Alcohol = 0,
    --     horseHealth = 0, -- Horse Health
    --     horseStamina = 0, -- Horse Stamina
    --     goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
    --     healthInnerCoreGold = 0.0,
    --     healthOuterCoreGold = 0.0,
    --     staminaInnerCoreGold = 0.0,
    --     staminaOuterCoreGold = 0.0,
    --     animation = "drink",
    --     usageLimit = 1, -- 
    --     returnedItem = {name = "emptycanteen",count = 1},
    -- },
    ["wildberryjuice"] = {
        prop = "p_water01x",
        hunger = 0, 
        thirst = 15, 
        health = 0,
        stamina = 10, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["gingerale"] = {
        prop = "p_water01x",
        hunger = 0, 
        thirst = 15, 
        health = 0,
        stamina = 5, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["lemonade"] = {
        prop = "p_water01x",
        hunger = 0, 
        thirst = 15, 
        health = 0,
        stamina = 5, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "drink",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["chamomiletea"] = {
        prop = "tosacup",
        hunger = 0, 
        thirst = 20, 
        health = 0,
        stamina = 10, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "coffe",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["yaupontea"] = {
        prop = "tosacup",
        hunger = 0, 
        thirst = 40, 
        health = 0,
        stamina = 25, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "coffe",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["curranttea"] = {
        prop = "tosacup",
        hunger = 0, 
        thirst = 50, 
        health = 0,
        stamina = 25, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "coffe",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["beer"] = {
        prop = "p_bottleJD01x",
        hunger = 0, 
        thirst = 2, 
        health = 0,
        stamina = 2, 
        stress = -5, 
        Alcohol = 10,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "beer",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
        SetPedDrunkness = { --- or false or nil
            drunknessLevel = 0.25, -- SOBER = 0.0f, SLIGHTLY_DRUNK = 0.25f, MODERATELY_DRUNK = 0.5f, VERY_DRUNK = 1.0f
            duration = 120 --- Second
        },
--        ScreenEffect = {  --- or false or nil
--            effect = "PlayerDrunk01",
--            duration = 60 --- Second 
--        }
    },
    ["liquor"] = {
        prop = "p_bottleJD01x",
        hunger = 0, 
        thirst = 2, 
        health = 0,
        stamina = 2,  
        stress = -5, 
        Alcohol = 10,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "beer",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
        SetPedDrunkness = { --- or false or nil
            drunknessLevel = 0.50, -- SOBER = 0.0f, SLIGHTLY_DRUNK = 0.25f, MODERATELY_DRUNK = 0.5f, VERY_DRUNK = 1.0f
            duration = 120 --- Second
        },
--        ScreenEffect = {  --- or false or nil
--            effect = "PlayerDrunk01",
--            duration = 0 --- Second 
--        }
    },
    ["gin"] = {
        prop = "p_bottleJD01x",
        hunger = 0, 
        thirst = 2, 
        health = 0,
        stamina = 2, 
        stress = -5, 
        Alcohol = 10,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "beer",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
        SetPedDrunkness = { --- or false or nil
            drunknessLevel = 0.50, -- SOBER = 0.0f, SLIGHTLY_DRUNK = 0.25f, MODERATELY_DRUNK = 0.5f, VERY_DRUNK = 1.0f
            duration = 120 --- Second
        },
--        ScreenEffect = {  --- or false or nil
--            effect = "PlayerDrunk01",
--            duration = 0 --- Second 
--        }
    },
    ["rum"] = {
        prop = "p_bottleJD01x",
        hunger = 0, 
        thirst = 2, 
        health = 0,
        stamina = 2, 
        stress = -5, 
        Alcohol = 10,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "beer",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
        SetPedDrunkness = { --- or false or nil
            drunknessLevel = 0.50, -- SOBER = 0.0f, SLIGHTLY_DRUNK = 0.25f, MODERATELY_DRUNK = 0.5f, VERY_DRUNK = 1.0f
            duration = 120 --- Second
        },
--        ScreenEffect = {  --- or false or nil
--            effect = "PlayerDrunk01",
--            duration = 0 --- Second 
--        }
    },
    ["vodka"] = {
        prop = "p_bottleJD01x",
        hunger = 0, 
        thirst = 2, 
        health = 0,
        stamina = 2, 
        stress = -5, 
        Alcohol = 10,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "beer",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
        SetPedDrunkness = { --- or false or nil
            drunknessLevel = 0.50, -- SOBER = 0.0f, SLIGHTLY_DRUNK = 0.25f, MODERATELY_DRUNK = 0.5f, VERY_DRUNK = 1.0f
            duration = 120 --- Second
        },
--        ScreenEffect = {  --- or false or nil
--            effect = "PlayerDrunk01",
--            duration = 0 --- Second 
--        }
    },
    ["wine"] = {
        prop = "p_bottleJD01x",
        hunger = 0, 
        thirst = 2, 
        health = 0,
        stamina = 2, 
        stress = -5, 
        Alcohol = 10,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "beer",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
        SetPedDrunkness = { --- or false or nil
            drunknessLevel = 0.50, -- SOBER = 0.0f, SLIGHTLY_DRUNK = 0.25f, MODERATELY_DRUNK = 0.5f, VERY_DRUNK = 1.0f
            duration = 120 --- Second
        },
--        ScreenEffect = {  --- or false or nil
--            effect = "PlayerDrunk01",
--            duration = 0 --- Second 
--        }
    },   
    ["whisky"] = {
        hunger = 0, 
        thirst = 10, 
        health = 0,
        stamina = 5.0, 
        stress = -20, 
        Alcohol = 25,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "whisky",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
        SetPedDrunkness = { --- or false or nil
            drunknessLevel = 0.50, -- SOBER = 0.0f, SLIGHTLY_DRUNK = 0.25f, MODERATELY_DRUNK = 0.5f, VERY_DRUNK = 1.0f
            duration = 120 --- Second
        },
--        ScreenEffect = {  --- or false or nil
--            effect = "PlayerDrunk01",
--            duration = 0 --- Second 
--        }
    },
    ["honeywhisky"] = {
        hunger = 0, 
        thirst = 10, 
        health = 0,
        stamina = 5, 
        stress = -20, 
        Alcohol = 25,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "whisky",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
        SetPedDrunkness = { --- or false or nil
            drunknessLevel = 0.50, -- SOBER = 0.0f, SLIGHTLY_DRUNK = 0.25f, MODERATELY_DRUNK = 0.5f, VERY_DRUNK = 1.0f
            duration = 120 --- Second
        },
--        ScreenEffect = {  --- or false or nil
--            effect = "PlayerDrunk01",
--            duration = 0 --- Second 
--        }
    },
    -- ["cigarette"] = {
    --     prop = "P_CIGARETTE01X",
    --     hunger = 0, 
    --     thirst = 0, 
    --     health = 0,
    --     stamina = 20.0, 
    --     stress = -50, 
    --     Alcohol = 0,
    --     horseHealth = 0, -- Horse Health
    --     horseStamina = 0, -- Horse Stamina
    --     goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
    --     healthInnerCoreGold = 0.0,
    --     healthOuterCoreGold = 0.0,
    --     staminaInnerCoreGold = 0.0,
    --     staminaOuterCoreGold = 0.0,
    --     animation = "cigaratte",
    --     returnedItem = false, -- {name = "bottle",count = 1}
    --     usageLimit = 1, -- 
    -- },
    -- ["cigar"] = {
    --     prop = "p_cigar01x",
    --     hunger = 0, 
    --     thirst = 0, 
    --     health = 0,
    --     stamina = 20.0, 
    --     stress = -50, 
    --     Alcohol = 0,
    --     horseHealth = 0, -- Horse Health
    --     horseStamina = 0, -- Horse Stamina
    --     goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
    --     healthInnerCoreGold = 0.0,
    --     healthOuterCoreGold = 0.0,
    --     staminaInnerCoreGold = 0.0,
    --     staminaOuterCoreGold = 0.0,
    --     animation = "cigar",
    --     returnedItem = false, -- {name = "bottle",count = 1}
    --     usageLimit = 1, -- 
    -- },
    -- ["pipe"] = {
    --     prop = "P_PIPE01X",
    --     hunger = 0, 
    --     thirst = 0, 
    --     health = 0,
    --     stamina = 20.0, 
    --     stress = -50, 
    --     Alcohol = 0,
    --     horseHealth = 0, -- at sağlığı
    --     horseStamina = 0, -- at staminası
    --     goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
    --     healthInnerCoreGold = 0.0,
    --     healthOuterCoreGold = 0.0,
    --     staminaInnerCoreGold = 0.0,
    --     staminaOuterCoreGold = 0.0,
    --     animation = "pipe",
    --     returnedItem = false, -- {name = "bottle",count = 1}
    --     usageLimit = 1, -- 
    -- },
    ["bandage"] = {
        prop = "p_cs_bandage01x",
        hunger = 0, 
        thirst = 0, 
        health = 100, --- max ped health 600
        stamina = 10.0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "bandage",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["herbalbandage"] = {
        prop = "p_cs_bandage01x",
        hunger = 0, 
        thirst = 0, 
        health = 350, --- max ped health 600
        stamina = 20.0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "bandage",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["improvisedbandage"] = {
        prop = "p_cs_bandage01x",
        hunger = 0, 
        thirst = 0, 
        health = 350, --- max ped health 600
        stamina = 20.0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "bandage",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["wildbandage"] = {
        prop = "p_cs_bandage01x",
        hunger = 0, 
        thirst = 0, 
        health = 100, --- max ped health 600
        stamina = 10, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "bandage",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["scentpouch"] = {
        prop = "p_cs_bandage01x",
        hunger = 0, 
        thirst = 0, 
        health = 0, --- max ped health 600
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "bandage",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["incense"] = {
        prop = "p_candle02x",
        hunger = 0, 
        thirst = 0, 
        health = 0, --- max ped health 600
        stamina = 0, 
        stress = -50,
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "incense",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1,
    },
    ["flyingointment"] = {
        prop = "s_horseointment01x",
        hunger = 0, 
        thirst = 0, 
        health = 0, --- max ped health 600
        stamina = 50, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "ointment",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1,
    },
    ["witchesbrew"] = {
        prop = "honeytea",
        hunger = 0, 
        thirst = 30, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "coffe",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, --
        ScreenEffect = {
            effect = "PlayerDrugsHalluc01",
            duration = 180
        }
    },
    ["shrooms"] = {
        prop = "p_cs_meatstewsmall01x",
        hunger = 5, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0,
        horseStamina = 0,
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        -- returnedItem = {name = "beer", count = 1}, -- or false
        returnedItem = false, -- or false
        usageLimit = 1, -- how many times it can be used
        ScreenEffect = {
            effect = "PlayerDrugsHalluc01",
            duration = 180
        }
    },
    ["midnighttea"] = {
        prop = "honeytea",
        hunger = 0, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0, -- Horse Health
        horseStamina = 0, -- Horse Stamina
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "coffe", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- 
    },
    ["calmingchew"] = {
        prop = "s_chocolatebar01x",
        hunger = 0, 
        thirst = 0, 
        health = 0,
        stamina = 0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 0,
        horseStamina = 0,
        goldCore = {"health", "stamina", "horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "sandwich", --- eat - stew - sandwich - water - drink - coffe - beer - whisky - cigarette
        returnedItem = false, -- or false
        usageLimit = 1, -- how many times it can be used
    },
-- horse things    
    ["consumable_haycube"] = {
        prop = "s_horsnack_haycube01x",
        hunger = 0, 
        thirst = 0, 
        health = 0, --- max ped health 600
        stamina = 0.0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 10, -- Horse Health
        horseStamina = 10, -- Horse Stamina
        goldCore = {"horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "horse",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["consumable_sugarcube"] = {
        prop = "s_horsnack_haycube01x",
        hunger = 0, 
        thirst = 0, 
        health = 0, --- max ped health 600
        stamina = 0.0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 10, -- Horse Health
        horseStamina = 10, -- Horse Stamina
        goldCore = {"horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "horse",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["carrot"] = {
        prop = "s_horsnack_haycube01x",
        hunger = 0, 
        thirst = 0, 
        health = 0, --- max ped health 600
        stamina = 0.0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 5, -- Horse Health
        horseStamina = 5, -- Horse Stamina
        goldCore = {"horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "horse",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["hay"] = {
        prop = "s_horsnack_haycube01x",
        hunger = 0, 
        thirst = 0, 
        health = 0, --- max ped health 600
        stamina = 0.0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = 5, -- Horse Health
        horseStamina = 5, -- Horse Stamina
        goldCore = {"horsehealth", "horsestamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "horse",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["adrenaline"] = {
        prop = "mp007_p_mp_syringe01x_1",
        hunger = 0, 
        thirst = 0, 
        health = 0,
        stamina = 100.0, 
        stress = 5, 
        Alcohol = 0,
        horseHealth = 0, -- at sağlığı
        horseStamina = 0, -- at staminası
        goldCore = { "health","stamina"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 0.0,
        healthOuterCoreGold = 0.0,
        staminaInnerCoreGold = 0.0,
        staminaOuterCoreGold = 0.0,
        animation = "inject",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
    ["horseadrenaline"] = {
        prop = "p_cs_syringe01x",
        hunger = 0, 
        thirst = 0, 
        health = 0,
        stamina = 0.0, 
        stress = 0, 
        Alcohol = 0,
        horseHealth = -20, -- at sağlığı
        horseStamina = 100, -- at staminası
        goldCore = {"horsestamina", "horsehealth"}, -- "health", "stamina", "horsehealth", "horsestamina"
        healthInnerCoreGold = 50.0,
        healthOuterCoreGold = 50.0,
        staminaInnerCoreGold = 50.0,
        staminaOuterCoreGold = 50.0,
        animation = "horseinject",
        returnedItem = false, -- {name = "bottle",count = 1}
        usageLimit = 1, -- 
    },
}

Config.Animations = {
    ["none"] = function(_, cb)
        cb(true) 
    end,
    ["bandage"] = function(propname, cb)
        FXLockInventory()
        local dict = "script_re@bear_trap"
        local anim = "bandage_loop_victim"
        local animtime = 5000
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            Citizen.Wait(100)
        end
        
        local prop = CreateObject(GetHashKey(propname), coords.x, coords.y, coords.z + 0.2, true, true, false, false, true)
        local boneIndex = GetEntityBoneIndexByName(ped, "skel_l_hand")
        AttachEntityToEntity(prop, ped, boneIndex, 0.11, 0.06, 0.05, 89.0, 0.0, 0.0, true, true, false, true, 1, true)
        
        TaskPlayAnim(ped, dict, anim, 8.0, -8.0, animtime, 1, 0, true, 0, false, 0, false)
        
        FXProgress(Locale("bandage"), animtime, function()
            Citizen.InvokeNative(0x4102732DF6B4005F, "RespawnPulseMP01", 0, true)
            soundEffect("Core_Fill_Up", "Consumption_Sounds")
            DeleteEntity(prop)
            ClearPedSecondaryTask(ped)
            SetTimeout(2000, function()
                AnimpostfxStopAll()
            end)
            FXUnlockInventory()
            cb(true)
        end, "innercircle", "#a37f48", '1vw')
    end,
    ["ointment"] = function(propname, cb)
        FXLockInventory()
        local dict = "mech_inventory@apply_lotion"
        local anim = "both_hands"
        local animtime = 5000
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            Citizen.Wait(100)
        end

        local prop = CreateObject(GetHashKey(propname), coords.x, coords.y, coords.z + 0.2, true, true, false, false, true)
        local boneIndex = GetEntityBoneIndexByName(ped, "skel_l_hand")
        AttachEntityToEntity(prop, ped, boneIndex, 0.11, 0.06, 0.05, 89.0, 0.0, 0.0, true, true, false, true, 1, true)
        
        TaskPlayAnim(ped, dict, anim, 8.0, -8.0, animtime, 1, 0, true, 0, false, 0, false)
        
        FXProgress(Locale("ointment"), animtime, function()
            Citizen.InvokeNative(0x4102732DF6B4005F, "RespawnPulseMP01", 0, true)
            soundEffect("Core_Fill_Up", "Consumption_Sounds")
            DeleteEntity(prop)
            ClearPedSecondaryTask(ped)
            SetTimeout(2000, function()
                AnimpostfxStopAll()
            end)
            FXUnlockInventory()
            cb(true)
        end, "innercircle", "#a37f48", '1vw')
    end,
    ["incense"] = function(propname, cb)
        FXLockInventory()
        local dict = "amb_misc@world_human_candle_light@male@base"
        local anim = "base"
        local animtime = 5000
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        
        RequestAnimDict(dict)
        while not HasAnimDictLoaded(dict) do
            Citizen.Wait(100)
        end

        local prop = CreateObject(GetHashKey(propname), coords.x, coords.y, coords.z + 0.2, true, true, false, false, true)
        local boneIndex = GetEntityBoneIndexByName(ped, "skel_l_hand")
        AttachEntityToEntity(prop, ped, boneIndex, 0.11, 0.06, 0.05, 89.0, 0.0, 0.0, true, true, false, true, 1, true)
        
        TaskPlayAnim(ped, dict, anim, 8.0, -8.0, animtime, 1, 0, true, 0, false, 0, false)
        
        FXProgress(Locale("incense"), animtime, function()
            Citizen.InvokeNative(0x4102732DF6B4005F, "RespawnPulseMP01", 0, true)
            soundEffect("Core_Fill_Up", "Consumption_Sounds")
            DeleteEntity(prop)
            ClearPedSecondaryTask(ped)
            SetTimeout(2000, function()
                AnimpostfxStopAll()
            end)
            FXUnlockInventory()
            cb(true)
        end, "innercircle", "#a37f48", '1vw')
    end,
    ["eat"] = function(propname, cb)
        FXLockInventory()
        local ped = PlayerPedId()
        local act = GetHashKey("EAT_CANNED_FOOD_CYLINDER@D8-2_H10-5_QUICK_LEFT")
        
        local obj = CreateObject(GetHashKey(propname), GetEntityCoords(ped), false, true, false, false, true)
        Citizen.InvokeNative(0x72F52AA2D2B172CC, ped, 1242464081, obj, 2120637577, act, 1, 0, -1.0)
        Citizen.CreateThread(function()
            while true do
                Citizen.Wait(500)
                local interact = IsPedRunningTaskItemInteraction(PlayerPedId())
                if interact == 0 then
                    DeleteEntity(obj)
                    soundEffect("Core_Fill_Up", "Consumption_Sounds")
                    Notify({text = Locale("usableitem"), type = "success", time = 4000})
                    FXUnlockInventory()       
                    cb(true)
                    return
                end
            end
        end)
    end,
    ["stew"] = function(propname, cb)
        FXLockInventory()
        animDone = false
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
    
        Citizen.InvokeNative(0xFCCC886EDE3C63EC, 2, 1)
        local bowl = CreateObject("p_bowl04x_stew", coords, true, true, true)
        local spoon = CreateObject("p_spoon01x", coords, true, true, true)
        Citizen.InvokeNative(0x669655FFB29EF1A9, bowl, 0, "Stew_Fill", 1.0)
        Citizen.InvokeNative(0xCAAF2BCCFEF37F77, bowl, 20)
        Citizen.InvokeNative(0xCAAF2BCCFEF37F77, spoon, 82)
    
        TaskItemInteraction_2(ped, 599184882, bowl, GetHashKey("p_bowl04x_stew_ph_l_hand"), -583731576, 3, 0, -1.0)
        TaskItemInteraction_2(ped, 599184882, spoon, GetHashKey("p_spoon01x_ph_r_hand"), -583731576, 3, 0, -1.0)
        Citizen.InvokeNative(0xB35370D5353995CB, ped, -583731576, 1.0)
    
        Citizen.CreateThread(function()
            local eatCounter = 0  
            local eatThreshold = 5 
            while not animDone do
                Citizen.Wait(500)
                local eat = Citizen.InvokeNative(0xBC864A70AD55E0C1, PlayerPedId(), GetHashKey("INPUT_CONTEXT_RT")) 
    
                if eat then
                    eatCounter = eatCounter + 1  
                    if eatCounter >= eatThreshold then
                        animDone = true
                        DeleteEntity(bowl)
                        DeleteEntity(spoon)
                        soundEffect("Core_Fill_Up", "Consumption_Sounds")
                        Notify({text=Locale("usableitem"), type="success", time=4000})
                        FXUnlockInventory()    
                        cb(true) 
                        return
                    end
                end
            end
            cb(false) 
        end)
    end,
    --custom props
    ["tenders"] = function(propname, cb)
    FXLockInventory()
    animDone = false
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    
    -- Request the custom model first
    RequestModel(GetHashKey("holchktend"))
    while not HasModelLoaded(GetHashKey("holchktend")) do
        Citizen.Wait(1)
    end
    
    -- Also request spoon model
    RequestModel(GetHashKey("p_spoon01x"))
    while not HasModelLoaded(GetHashKey("p_spoon01x")) do
        Citizen.Wait(1)
    end
    
    Citizen.InvokeNative(0xFCCC886EDE3C63EC, 2, 1)
    local bowl = CreateObject(GetHashKey("holchktend"), coords, true, true, true)
    local spoon = CreateObject(GetHashKey("p_spoon01x"), coords, true, true, true)
    
    -- Debug: Check if objects were created
    print("Bowl entity: " .. tostring(bowl))
    print("Spoon entity: " .. tostring(spoon))
    print("Bowl exists: " .. tostring(DoesEntityExist(bowl)))
    print("Spoon exists: " .. tostring(DoesEntityExist(spoon)))
    
    -- Apply stew fill effect (this might not work with custom props)
    Citizen.InvokeNative(0x669655FFB29EF1A9, bowl, 0, "Stew_Fill", 1.0)
    Citizen.InvokeNative(0xCAAF2BCCFEF37F77, bowl, 20)
    Citizen.InvokeNative(0xCAAF2BCCFEF37F77, spoon, 82)
    
    -- Try using the working attachment from p_bowl04x_stew instead
    TaskItemInteraction_2(ped, 599184882, bowl, GetHashKey("p_bowl04x_stew_ph_l_hand"), -583731576, 3, 0, -1.0)
    TaskItemInteraction_2(ped, 599184882, spoon, GetHashKey("p_spoon01x_ph_r_hand"), -583731576, 3, 0, -1.0)
    
    Citizen.InvokeNative(0xB35370D5353995CB, ped, -583731576, 1.0)
    
    Citizen.CreateThread(function()
        local eatCounter = 0
        local eatThreshold = 5
        
        while not animDone do
            Citizen.Wait(500)
            local eat = Citizen.InvokeNative(0xBC864A70AD55E0C1, PlayerPedId(), GetHashKey("INPUT_CONTEXT_RT"))
            
            if eat then
                eatCounter = eatCounter + 1
                
                if eatCounter >= eatThreshold then
                    animDone = true
                    DeleteEntity(bowl)
                    DeleteEntity(spoon)
                    soundEffect("Core_Fill_Up", "Consumption_Sounds")
                    Notify({text=Locale("usableitem"), type="success", time=4000})
                    FXUnlockInventory()
                    cb(true)
                    return
                end
            end
        end
        cb(false)
    end)
end,
 --custom props
    ["sundae"] = function(propname, cb)
    FXLockInventory()
    animDone = false
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    
    -- Request the custom model first
    RequestModel(GetHashKey("sundae"))
    while not HasModelLoaded(GetHashKey("sundae")) do
        Citizen.Wait(1)
    end
    
    -- Also request spoon model
    RequestModel(GetHashKey("p_spoon01x"))
    while not HasModelLoaded(GetHashKey("p_spoon01x")) do
        Citizen.Wait(1)
    end
    
    Citizen.InvokeNative(0xFCCC886EDE3C63EC, 2, 1)
    local bowl = CreateObject(GetHashKey("sundae"), coords, true, true, true)
    local spoon = CreateObject(GetHashKey("p_spoon01x"), coords, true, true, true)
    
    -- Debug: Check if objects were created
    print("Bowl entity: " .. tostring(bowl))
    print("Spoon entity: " .. tostring(spoon))
    print("Bowl exists: " .. tostring(DoesEntityExist(bowl)))
    print("Spoon exists: " .. tostring(DoesEntityExist(spoon)))
    
    -- Apply stew fill effect (this might not work with custom props)
    Citizen.InvokeNative(0x669655FFB29EF1A9, bowl, 0, "Stew_Fill", 1.0)
    Citizen.InvokeNative(0xCAAF2BCCFEF37F77, bowl, 20)
    Citizen.InvokeNative(0xCAAF2BCCFEF37F77, spoon, 82)
    
    -- Try using the working attachment from p_bowl04x_stew instead
    TaskItemInteraction_2(ped, 599184882, bowl, GetHashKey("p_bowl04x_stew_ph_l_hand"), -583731576, 3, 0, -1.0)
    TaskItemInteraction_2(ped, 599184882, spoon, GetHashKey("p_spoon01x_ph_r_hand"), -583731576, 3, 0, -1.0)
    
    Citizen.InvokeNative(0xB35370D5353995CB, ped, -583731576, 1.0)
    
    Citizen.CreateThread(function()
        local eatCounter = 0
        local eatThreshold = 5
        
        while not animDone do
            Citizen.Wait(500)
            local eat = Citizen.InvokeNative(0xBC864A70AD55E0C1, PlayerPedId(), GetHashKey("INPUT_CONTEXT_RT"))
            
            if eat then
                eatCounter = eatCounter + 1
                
                if eatCounter >= eatThreshold then
                    animDone = true
                    DeleteEntity(bowl)
                    DeleteEntity(spoon)
                    soundEffect("Core_Fill_Up", "Consumption_Sounds")
                    Notify({text=Locale("usableitem"), type="success", time=4000})
                    FXUnlockInventory()
                    cb(true)
                    return
                end
            end
        end
        cb(false)
    end)
end,
["cinbuns"] = function(propname, cb)
    FXLockInventory()
    animDone = false
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    
    -- Request the custom model first
    RequestModel(GetHashKey("cinbuns"))
    while not HasModelLoaded(GetHashKey("cinbuns")) do
        Citizen.Wait(1)
    end
    
    -- Also request spoon model
    RequestModel(GetHashKey("p_spoon01x"))
    while not HasModelLoaded(GetHashKey("p_spoon01x")) do
        Citizen.Wait(1)
    end
    
    Citizen.InvokeNative(0xFCCC886EDE3C63EC, 2, 1)
    local bowl = CreateObject(GetHashKey("cinbuns"), coords, true, true, true)
    local spoon = CreateObject(GetHashKey("p_spoon01x"), coords, true, true, true)
    
    -- Debug: Check if objects were created
    print("Bowl entity: " .. tostring(bowl))
    print("Spoon entity: " .. tostring(spoon))
    print("Bowl exists: " .. tostring(DoesEntityExist(bowl)))
    print("Spoon exists: " .. tostring(DoesEntityExist(spoon)))
    
    -- Apply stew fill effect (this might not work with custom props)
    Citizen.InvokeNative(0x669655FFB29EF1A9, bowl, 0, "Stew_Fill", 1.0)
    Citizen.InvokeNative(0xCAAF2BCCFEF37F77, bowl, 20)
    Citizen.InvokeNative(0xCAAF2BCCFEF37F77, spoon, 82)
    
    -- Try using the working attachment from p_bowl04x_stew instead
    TaskItemInteraction_2(ped, 599184882, bowl, GetHashKey("p_bowl04x_stew_ph_l_hand"), -583731576, 3, 0, -1.0)
    TaskItemInteraction_2(ped, 599184882, spoon, GetHashKey("p_spoon01x_ph_r_hand"), -583731576, 3, 0, -1.0)
    
    Citizen.InvokeNative(0xB35370D5353995CB, ped, -583731576, 1.0)
    
    Citizen.CreateThread(function()
        local eatCounter = 0
        local eatThreshold = 5
        
        while not animDone do
            Citizen.Wait(500)
            local eat = Citizen.InvokeNative(0xBC864A70AD55E0C1, PlayerPedId(), GetHashKey("INPUT_CONTEXT_RT"))
            
            if eat then
                eatCounter = eatCounter + 1
                
                if eatCounter >= eatThreshold then
                    animDone = true
                    DeleteEntity(bowl)
                    DeleteEntity(spoon)
                    soundEffect("Core_Fill_Up", "Consumption_Sounds")
                    Notify({text=Locale("usableitem"), type="success", time=4000})
                    FXUnlockInventory()
                    cb(true)
                    return
                end
            end
        end
        cb(false)
    end)
end,
["beans"] = function(propname, cb)
    FXLockInventory()
    animDone = false
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    
    -- Request the custom model first
    RequestModel(GetHashKey("beans"))
    while not HasModelLoaded(GetHashKey("beans")) do
        Citizen.Wait(1)
    end
    
    -- Also request spoon model
    RequestModel(GetHashKey("p_spoon01x"))
    while not HasModelLoaded(GetHashKey("p_spoon01x")) do
        Citizen.Wait(1)
    end
    
    Citizen.InvokeNative(0xFCCC886EDE3C63EC, 2, 1)
    local bowl = CreateObject(GetHashKey("beans"), coords, true, true, true)
    local spoon = CreateObject(GetHashKey("p_spoon01x"), coords, true, true, true)
    
    -- Debug: Check if objects were created
    print("Bowl entity: " .. tostring(bowl))
    print("Spoon entity: " .. tostring(spoon))
    print("Bowl exists: " .. tostring(DoesEntityExist(bowl)))
    print("Spoon exists: " .. tostring(DoesEntityExist(spoon)))
    
    -- Apply stew fill effect (this might not work with custom props)
    Citizen.InvokeNative(0x669655FFB29EF1A9, bowl, 0, "Stew_Fill", 1.0)
    Citizen.InvokeNative(0xCAAF2BCCFEF37F77, bowl, 20)
    Citizen.InvokeNative(0xCAAF2BCCFEF37F77, spoon, 82)
    
    -- Try using the working attachment from p_bowl04x_stew instead
    TaskItemInteraction_2(ped, 599184882, bowl, GetHashKey("p_bowl04x_stew_ph_l_hand"), -583731576, 3, 0, -1.0)
    TaskItemInteraction_2(ped, 599184882, spoon, GetHashKey("p_spoon01x_ph_r_hand"), -583731576, 3, 0, -1.0)
    
    Citizen.InvokeNative(0xB35370D5353995CB, ped, -583731576, 1.0)
    
    Citizen.CreateThread(function()
        local eatCounter = 0
        local eatThreshold = 5
        
        while not animDone do
            Citizen.Wait(500)
            local eat = Citizen.InvokeNative(0xBC864A70AD55E0C1, PlayerPedId(), GetHashKey("INPUT_CONTEXT_RT"))
            
            if eat then
                eatCounter = eatCounter + 1
                
                if eatCounter >= eatThreshold then
                    animDone = true
                    DeleteEntity(bowl)
                    DeleteEntity(spoon)
                    soundEffect("Core_Fill_Up", "Consumption_Sounds")
                    Notify({text=Locale("usableitem"), type="success", time=4000})
                    FXUnlockInventory()
                    cb(true)
                    return
                end
            end
        end
        cb(false)
    end)
end,
["cornedbeef"] = function(propname, cb)
    FXLockInventory()
    animDone = false
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    
    -- Request the custom model first
    RequestModel(GetHashKey("cornedbeef"))
    while not HasModelLoaded(GetHashKey("cornedbeef")) do
        Citizen.Wait(1)
    end
    
    -- Also request spoon model
    RequestModel(GetHashKey("p_spoon01x"))
    while not HasModelLoaded(GetHashKey("p_spoon01x")) do
        Citizen.Wait(1)
    end
    
    Citizen.InvokeNative(0xFCCC886EDE3C63EC, 2, 1)
    local bowl = CreateObject(GetHashKey("cornedbeef"), coords, true, true, true)
    local spoon = CreateObject(GetHashKey("p_spoon01x"), coords, true, true, true)
    
    -- Debug: Check if objects were created
    print("Bowl entity: " .. tostring(bowl))
    print("Spoon entity: " .. tostring(spoon))
    print("Bowl exists: " .. tostring(DoesEntityExist(bowl)))
    print("Spoon exists: " .. tostring(DoesEntityExist(spoon)))
    
    -- Apply stew fill effect (this might not work with custom props)
    Citizen.InvokeNative(0x669655FFB29EF1A9, bowl, 0, "Stew_Fill", 1.0)
    Citizen.InvokeNative(0xCAAF2BCCFEF37F77, bowl, 20)
    Citizen.InvokeNative(0xCAAF2BCCFEF37F77, spoon, 82)
    
    -- Try using the working attachment from p_bowl04x_stew instead
    TaskItemInteraction_2(ped, 599184882, bowl, GetHashKey("p_bowl04x_stew_ph_l_hand"), -583731576, 3, 0, -1.0)
    TaskItemInteraction_2(ped, 599184882, spoon, GetHashKey("p_spoon01x_ph_r_hand"), -583731576, 3, 0, -1.0)
    
    Citizen.InvokeNative(0xB35370D5353995CB, ped, -583731576, 1.0)
    
    Citizen.CreateThread(function()
        local eatCounter = 0
        local eatThreshold = 5
        
        while not animDone do
            Citizen.Wait(500)
            local eat = Citizen.InvokeNative(0xBC864A70AD55E0C1, PlayerPedId(), GetHashKey("INPUT_CONTEXT_RT"))
            
            if eat then
                eatCounter = eatCounter + 1
                
                if eatCounter >= eatThreshold then
                    animDone = true
                    DeleteEntity(bowl)
                    DeleteEntity(spoon)
                    soundEffect("Core_Fill_Up", "Consumption_Sounds")
                    Notify({text=Locale("usableitem"), type="success", time=4000})
                    FXUnlockInventory()
                    cb(true)
                    return
                end
            end
        end
        cb(false)
    end)
end,
["dumplings"] = function(propname, cb)
    FXLockInventory()
    animDone = false
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    
    -- Request the custom model first
    RequestModel(GetHashKey("grapedumplings"))
    while not HasModelLoaded(GetHashKey("grapedumplings")) do
        Citizen.Wait(1)
    end
    
    -- Also request spoon model
    RequestModel(GetHashKey("p_spoon01x"))
    while not HasModelLoaded(GetHashKey("p_spoon01x")) do
        Citizen.Wait(1)
    end
    
    Citizen.InvokeNative(0xFCCC886EDE3C63EC, 2, 1)
    local bowl = CreateObject(GetHashKey("grapedumplings"), coords, true, true, true)
    local spoon = CreateObject(GetHashKey("p_spoon01x"), coords, true, true, true)
    
    -- Debug: Check if objects were created
    print("Bowl entity: " .. tostring(bowl))
    print("Spoon entity: " .. tostring(spoon))
    print("Bowl exists: " .. tostring(DoesEntityExist(bowl)))
    print("Spoon exists: " .. tostring(DoesEntityExist(spoon)))
    
    -- Apply stew fill effect (this might not work with custom props)
    Citizen.InvokeNative(0x669655FFB29EF1A9, bowl, 0, "Stew_Fill", 1.0)
    Citizen.InvokeNative(0xCAAF2BCCFEF37F77, bowl, 20)
    Citizen.InvokeNative(0xCAAF2BCCFEF37F77, spoon, 82)
    
    -- Try using the working attachment from p_bowl04x_stew instead
    TaskItemInteraction_2(ped, 599184882, bowl, GetHashKey("p_bowl04x_stew_ph_l_hand"), -583731576, 3, 0, -1.0)
    TaskItemInteraction_2(ped, 599184882, spoon, GetHashKey("p_spoon01x_ph_r_hand"), -583731576, 3, 0, -1.0)
    
    Citizen.InvokeNative(0xB35370D5353995CB, ped, -583731576, 1.0)
    
    Citizen.CreateThread(function()
        local eatCounter = 0
        local eatThreshold = 5
        
        while not animDone do
            Citizen.Wait(500)
            local eat = Citizen.InvokeNative(0xBC864A70AD55E0C1, PlayerPedId(), GetHashKey("INPUT_CONTEXT_RT"))
            
            if eat then
                eatCounter = eatCounter + 1
                
                if eatCounter >= eatThreshold then
                    animDone = true
                    DeleteEntity(bowl)
                    DeleteEntity(spoon)
                    soundEffect("Core_Fill_Up", "Consumption_Sounds")
                    Notify({text=Locale("usableitem"), type="success", time=4000})
                    FXUnlockInventory()
                    cb(true)
                    return
                end
            end
        end
        cb(false)
    end)
end,
["persimmon"] = function(propname, cb)
    FXLockInventory()
    animDone = false
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    
    -- Request the custom model first
    RequestModel(GetHashKey("texpersimmon"))
    while not HasModelLoaded(GetHashKey("texpersimmon")) do
        Citizen.Wait(1)
    end
    
    -- Also request spoon model
    RequestModel(GetHashKey("p_spoon01x"))
    while not HasModelLoaded(GetHashKey("p_spoon01x")) do
        Citizen.Wait(1)
    end
    
    Citizen.InvokeNative(0xFCCC886EDE3C63EC, 2, 1)
    local bowl = CreateObject(GetHashKey("texpersimmon"), coords, true, true, true)
    local spoon = CreateObject(GetHashKey("p_spoon01x"), coords, true, true, true)
    
    -- Debug: Check if objects were created
    print("Bowl entity: " .. tostring(bowl))
    print("Spoon entity: " .. tostring(spoon))
    print("Bowl exists: " .. tostring(DoesEntityExist(bowl)))
    print("Spoon exists: " .. tostring(DoesEntityExist(spoon)))
    
    -- Apply stew fill effect (this might not work with custom props)
    Citizen.InvokeNative(0x669655FFB29EF1A9, bowl, 0, "Stew_Fill", 1.0)
    Citizen.InvokeNative(0xCAAF2BCCFEF37F77, bowl, 20)
    Citizen.InvokeNative(0xCAAF2BCCFEF37F77, spoon, 82)
    
    -- Try using the working attachment from p_bowl04x_stew instead
    TaskItemInteraction_2(ped, 599184882, bowl, GetHashKey("p_bowl04x_stew_ph_l_hand"), -583731576, 3, 0, -1.0)
    TaskItemInteraction_2(ped, 599184882, spoon, GetHashKey("p_spoon01x_ph_r_hand"), -583731576, 3, 0, -1.0)
    
    Citizen.InvokeNative(0xB35370D5353995CB, ped, -583731576, 1.0)
    
    Citizen.CreateThread(function()
        local eatCounter = 0
        local eatThreshold = 5
        
        while not animDone do
            Citizen.Wait(500)
            local eat = Citizen.InvokeNative(0xBC864A70AD55E0C1, PlayerPedId(), GetHashKey("INPUT_CONTEXT_RT"))
            
            if eat then
                eatCounter = eatCounter + 1
                
                if eatCounter >= eatThreshold then
                    animDone = true
                    DeleteEntity(bowl)
                    DeleteEntity(spoon)
                    soundEffect("Core_Fill_Up", "Consumption_Sounds")
                    Notify({text=Locale("usableitem"), type="success", time=4000})
                    FXUnlockInventory()
                    cb(true)
                    return
                end
            end
        end
        cb(false)
    end)
end,
["tiramisu"] = function(propname, cb)
    FXLockInventory()
    animDone = false
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    
    -- Request the custom model first
    RequestModel(GetHashKey("tiramisu"))
    while not HasModelLoaded(GetHashKey("tiramisu")) do
        Citizen.Wait(1)
    end
    
    -- Also request spoon model
    RequestModel(GetHashKey("p_spoon01x"))
    while not HasModelLoaded(GetHashKey("p_spoon01x")) do
        Citizen.Wait(1)
    end
    
    Citizen.InvokeNative(0xFCCC886EDE3C63EC, 2, 1)
    local bowl = CreateObject(GetHashKey("tiramisu"), coords, true, true, true)
    local spoon = CreateObject(GetHashKey("p_spoon01x"), coords, true, true, true)
    
    -- Debug: Check if objects were created
    print("Bowl entity: " .. tostring(bowl))
    print("Spoon entity: " .. tostring(spoon))
    print("Bowl exists: " .. tostring(DoesEntityExist(bowl)))
    print("Spoon exists: " .. tostring(DoesEntityExist(spoon)))
    
    -- Apply stew fill effect (this might not work with custom props)
    Citizen.InvokeNative(0x669655FFB29EF1A9, bowl, 0, "Stew_Fill", 1.0)
    Citizen.InvokeNative(0xCAAF2BCCFEF37F77, bowl, 20)
    Citizen.InvokeNative(0xCAAF2BCCFEF37F77, spoon, 82)
    
    -- Try using the working attachment from p_bowl04x_stew instead
    TaskItemInteraction_2(ped, 599184882, bowl, GetHashKey("p_bowl04x_stew_ph_l_hand"), -583731576, 3, 0, -1.0)
    TaskItemInteraction_2(ped, 599184882, spoon, GetHashKey("p_spoon01x_ph_r_hand"), -583731576, 3, 0, -1.0)
    
    Citizen.InvokeNative(0xB35370D5353995CB, ped, -583731576, 1.0)
    
    Citizen.CreateThread(function()
        local eatCounter = 0
        local eatThreshold = 5
        
        while not animDone do
            Citizen.Wait(500)
            local eat = Citizen.InvokeNative(0xBC864A70AD55E0C1, PlayerPedId(), GetHashKey("INPUT_CONTEXT_RT"))
            
            if eat then
                eatCounter = eatCounter + 1
                
                if eatCounter >= eatThreshold then
                    animDone = true
                    DeleteEntity(bowl)
                    DeleteEntity(spoon)
                    soundEffect("Core_Fill_Up", "Consumption_Sounds")
                    Notify({text=Locale("usableitem"), type="success", time=4000})
                    FXUnlockInventory()
                    cb(true)
                    return
                end
            end
        end
        cb(false)
    end)
end,
["lutherfish"] = function(propname, cb)
    FXLockInventory()
    animDone = false
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    
    -- Request the custom model first
    RequestModel(GetHashKey("lutherfish"))
    while not HasModelLoaded(GetHashKey("lutherfish")) do
        Citizen.Wait(1)
    end
    
    -- Also request spoon model
    RequestModel(GetHashKey("p_spoon01x"))
    while not HasModelLoaded(GetHashKey("p_spoon01x")) do
        Citizen.Wait(1)
    end
    
    Citizen.InvokeNative(0xFCCC886EDE3C63EC, 2, 1)
    local bowl = CreateObject(GetHashKey("lutherfish"), coords, true, true, true)
    local spoon = CreateObject(GetHashKey("p_spoon01x"), coords, true, true, true)
    
    -- Debug: Check if objects were created
    print("Bowl entity: " .. tostring(bowl))
    print("Spoon entity: " .. tostring(spoon))
    print("Bowl exists: " .. tostring(DoesEntityExist(bowl)))
    print("Spoon exists: " .. tostring(DoesEntityExist(spoon)))
    
    -- Apply stew fill effect (this might not work with custom props)
    Citizen.InvokeNative(0x669655FFB29EF1A9, bowl, 0, "Stew_Fill", 1.0)
    Citizen.InvokeNative(0xCAAF2BCCFEF37F77, bowl, 20)
    Citizen.InvokeNative(0xCAAF2BCCFEF37F77, spoon, 82)
    
    -- Try using the working attachment from p_bowl04x_stew instead
    TaskItemInteraction_2(ped, 599184882, bowl, GetHashKey("p_bowl04x_stew_ph_l_hand"), -583731576, 3, 0, -1.0)
    TaskItemInteraction_2(ped, 599184882, spoon, GetHashKey("p_spoon01x_ph_r_hand"), -583731576, 3, 0, -1.0)
    
    Citizen.InvokeNative(0xB35370D5353995CB, ped, -583731576, 1.0)
    
    Citizen.CreateThread(function()
        local eatCounter = 0
        local eatThreshold = 5
        
        while not animDone do
            Citizen.Wait(500)
            local eat = Citizen.InvokeNative(0xBC864A70AD55E0C1, PlayerPedId(), GetHashKey("INPUT_CONTEXT_RT"))
            
            if eat then
                eatCounter = eatCounter + 1
                
                if eatCounter >= eatThreshold then
                    animDone = true
                    DeleteEntity(bowl)
                    DeleteEntity(spoon)
                    soundEffect("Core_Fill_Up", "Consumption_Sounds")
                    Notify({text=Locale("usableitem"), type="success", time=4000})
                    FXUnlockInventory()
                    cb(true)
                    return
                end
            end
        end
        cb(false)
    end)
end,
["luthercake"] = function(propname, cb)
    FXLockInventory()
    animDone = false
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    
    -- Request the custom model first
    RequestModel(GetHashKey("luthercake"))
    while not HasModelLoaded(GetHashKey("luthercake")) do
        Citizen.Wait(1)
    end
    
    -- Also request spoon model
    RequestModel(GetHashKey("p_spoon01x"))
    while not HasModelLoaded(GetHashKey("p_spoon01x")) do
        Citizen.Wait(1)
    end
    
    Citizen.InvokeNative(0xFCCC886EDE3C63EC, 2, 1)
    local bowl = CreateObject(GetHashKey("luthercake"), coords, true, true, true)
    local spoon = CreateObject(GetHashKey("p_spoon01x"), coords, true, true, true)
    
    -- Debug: Check if objects were created
    print("Bowl entity: " .. tostring(bowl))
    print("Spoon entity: " .. tostring(spoon))
    print("Bowl exists: " .. tostring(DoesEntityExist(bowl)))
    print("Spoon exists: " .. tostring(DoesEntityExist(spoon)))
    
    -- Apply stew fill effect (this might not work with custom props)
    Citizen.InvokeNative(0x669655FFB29EF1A9, bowl, 0, "Stew_Fill", 1.0)
    Citizen.InvokeNative(0xCAAF2BCCFEF37F77, bowl, 20)
    Citizen.InvokeNative(0xCAAF2BCCFEF37F77, spoon, 82)
    
    -- Try using the working attachment from p_bowl04x_stew instead
    TaskItemInteraction_2(ped, 599184882, bowl, GetHashKey("p_bowl04x_stew_ph_l_hand"), -583731576, 3, 0, -1.0)
    TaskItemInteraction_2(ped, 599184882, spoon, GetHashKey("p_spoon01x_ph_r_hand"), -583731576, 3, 0, -1.0)
    
    Citizen.InvokeNative(0xB35370D5353995CB, ped, -583731576, 1.0)
    
    Citizen.CreateThread(function()
        local eatCounter = 0
        local eatThreshold = 5
        
        while not animDone do
            Citizen.Wait(500)
            local eat = Citizen.InvokeNative(0xBC864A70AD55E0C1, PlayerPedId(), GetHashKey("INPUT_CONTEXT_RT"))
            
            if eat then
                eatCounter = eatCounter + 1
                
                if eatCounter >= eatThreshold then
                    animDone = true
                    DeleteEntity(bowl)
                    DeleteEntity(spoon)
                    soundEffect("Core_Fill_Up", "Consumption_Sounds")
                    Notify({text=Locale("usableitem"), type="success", time=4000})
                    FXUnlockInventory()
                    cb(true)
                    return
                end
            end
        end
        cb(false)
    end)
end,
["gatoreggs"] = function(propname, cb)
    FXLockInventory()
    animDone = false
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    
    -- Request the custom model first
    RequestModel(GetHashKey("gatoreggs"))
    while not HasModelLoaded(GetHashKey("gatoreggs")) do
        Citizen.Wait(1)
    end
    
    -- Also request spoon model
    RequestModel(GetHashKey("p_spoon01x"))
    while not HasModelLoaded(GetHashKey("p_spoon01x")) do
        Citizen.Wait(1)
    end
    
    Citizen.InvokeNative(0xFCCC886EDE3C63EC, 2, 1)
    local bowl = CreateObject(GetHashKey("gatoreggs"), coords, true, true, true)
    local spoon = CreateObject(GetHashKey("p_spoon01x"), coords, true, true, true)
    
    -- Debug: Check if objects were created
    print("Bowl entity: " .. tostring(bowl))
    print("Spoon entity: " .. tostring(spoon))
    print("Bowl exists: " .. tostring(DoesEntityExist(bowl)))
    print("Spoon exists: " .. tostring(DoesEntityExist(spoon)))
    
    -- Apply stew fill effect (this might not work with custom props)
    Citizen.InvokeNative(0x669655FFB29EF1A9, bowl, 0, "Stew_Fill", 1.0)
    Citizen.InvokeNative(0xCAAF2BCCFEF37F77, bowl, 20)
    Citizen.InvokeNative(0xCAAF2BCCFEF37F77, spoon, 82)
    
    -- Try using the working attachment from p_bowl04x_stew instead
    TaskItemInteraction_2(ped, 599184882, bowl, GetHashKey("p_bowl04x_stew_ph_l_hand"), -583731576, 3, 0, -1.0)
    TaskItemInteraction_2(ped, 599184882, spoon, GetHashKey("p_spoon01x_ph_r_hand"), -583731576, 3, 0, -1.0)
    
    Citizen.InvokeNative(0xB35370D5353995CB, ped, -583731576, 1.0)
    
    Citizen.CreateThread(function()
        local eatCounter = 0
        local eatThreshold = 5
        
        while not animDone do
            Citizen.Wait(500)
            local eat = Citizen.InvokeNative(0xBC864A70AD55E0C1, PlayerPedId(), GetHashKey("INPUT_CONTEXT_RT"))
            
            if eat then
                eatCounter = eatCounter + 1
                
                if eatCounter >= eatThreshold then
                    animDone = true
                    DeleteEntity(bowl)
                    DeleteEntity(spoon)
                    soundEffect("Core_Fill_Up", "Consumption_Sounds")
                    Notify({text=Locale("usableitem"), type="success", time=4000})
                    FXUnlockInventory()
                    cb(true)
                    return
                end
            end
        end
        cb(false)
    end)
end,
["deathroll"] = function(propname, cb)
    FXLockInventory()
    animDone = false
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    
    -- Request the custom model first
    RequestModel(GetHashKey("deathroll"))
    while not HasModelLoaded(GetHashKey("deathroll")) do
        Citizen.Wait(1)
    end
    
    -- Also request spoon model
    RequestModel(GetHashKey("p_spoon01x"))
    while not HasModelLoaded(GetHashKey("p_spoon01x")) do
        Citizen.Wait(1)
    end
    
    Citizen.InvokeNative(0xFCCC886EDE3C63EC, 2, 1)
    local bowl = CreateObject(GetHashKey("deathroll"), coords, true, true, true)
    local spoon = CreateObject(GetHashKey("p_spoon01x"), coords, true, true, true)
    
    -- Debug: Check if objects were created
    print("Bowl entity: " .. tostring(bowl))
    print("Spoon entity: " .. tostring(spoon))
    print("Bowl exists: " .. tostring(DoesEntityExist(bowl)))
    print("Spoon exists: " .. tostring(DoesEntityExist(spoon)))
    
    -- Apply stew fill effect (this might not work with custom props)
    Citizen.InvokeNative(0x669655FFB29EF1A9, bowl, 0, "Stew_Fill", 1.0)
    Citizen.InvokeNative(0xCAAF2BCCFEF37F77, bowl, 20)
    Citizen.InvokeNative(0xCAAF2BCCFEF37F77, spoon, 82)
    
    -- Try using the working attachment from p_bowl04x_stew instead
    TaskItemInteraction_2(ped, 599184882, bowl, GetHashKey("p_bowl04x_stew_ph_l_hand"), -583731576, 3, 0, -1.0)
    TaskItemInteraction_2(ped, 599184882, spoon, GetHashKey("p_spoon01x_ph_r_hand"), -583731576, 3, 0, -1.0)
    
    Citizen.InvokeNative(0xB35370D5353995CB, ped, -583731576, 1.0)
    
    Citizen.CreateThread(function()
        local eatCounter = 0
        local eatThreshold = 5
        
        while not animDone do
            Citizen.Wait(500)
            local eat = Citizen.InvokeNative(0xBC864A70AD55E0C1, PlayerPedId(), GetHashKey("INPUT_CONTEXT_RT"))
            
            if eat then
                eatCounter = eatCounter + 1
                
                if eatCounter >= eatThreshold then
                    animDone = true
                    DeleteEntity(bowl)
                    DeleteEntity(spoon)
                    soundEffect("Core_Fill_Up", "Consumption_Sounds")
                    Notify({text=Locale("usableitem"), type="success", time=4000})
                    FXUnlockInventory()
                    cb(true)
                    return
                end
            end
        end
        cb(false)
    end)
end,
["spaghetti"] = function(propname, cb)
    FXLockInventory()
    animDone = false
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)
    
    -- Request the custom model first
    RequestModel(GetHashKey("spaghetti"))
    while not HasModelLoaded(GetHashKey("spaghetti")) do
        Citizen.Wait(1)
    end
    
    -- Also request spoon model
    RequestModel(GetHashKey("p_spoon01x"))
    while not HasModelLoaded(GetHashKey("p_spoon01x")) do
        Citizen.Wait(1)
    end
    
    Citizen.InvokeNative(0xFCCC886EDE3C63EC, 2, 1)
    local bowl = CreateObject(GetHashKey("spaghetti"), coords, true, true, true)
    local spoon = CreateObject(GetHashKey("p_spoon01x"), coords, true, true, true)
    
    -- Debug: Check if objects were created
    print("Bowl entity: " .. tostring(bowl))
    print("Spoon entity: " .. tostring(spoon))
    print("Bowl exists: " .. tostring(DoesEntityExist(bowl)))
    print("Spoon exists: " .. tostring(DoesEntityExist(spoon)))
    
    -- Apply stew fill effect (this might not work with custom props)
    Citizen.InvokeNative(0x669655FFB29EF1A9, bowl, 0, "Stew_Fill", 1.0)
    Citizen.InvokeNative(0xCAAF2BCCFEF37F77, bowl, 20)
    Citizen.InvokeNative(0xCAAF2BCCFEF37F77, spoon, 82)
    
    -- Try using the working attachment from p_bowl04x_stew instead
    TaskItemInteraction_2(ped, 599184882, bowl, GetHashKey("p_bowl04x_stew_ph_l_hand"), -583731576, 3, 0, -1.0)
    TaskItemInteraction_2(ped, 599184882, spoon, GetHashKey("p_spoon01x_ph_r_hand"), -583731576, 3, 0, -1.0)
    
    Citizen.InvokeNative(0xB35370D5353995CB, ped, -583731576, 1.0)
    
    Citizen.CreateThread(function()
        local eatCounter = 0
        local eatThreshold = 5
        
        while not animDone do
            Citizen.Wait(500)
            local eat = Citizen.InvokeNative(0xBC864A70AD55E0C1, PlayerPedId(), GetHashKey("INPUT_CONTEXT_RT"))
            
            if eat then
                eatCounter = eatCounter + 1
                
                if eatCounter >= eatThreshold then
                    animDone = true
                    DeleteEntity(bowl)
                    DeleteEntity(spoon)
                    soundEffect("Core_Fill_Up", "Consumption_Sounds")
                    Notify({text=Locale("usableitem"), type="success", time=4000})
                    FXUnlockInventory()
                    cb(true)
                    return
                end
            end
        end
        cb(false)
    end)
end,
    ["sandwich"] = function(propname, cb)
        FXLockInventory()
        animDone = false
        local Anims = {
            ["eat"] = {
                dict = "mech_inventory@eating@multi_bite@sphere_d8-2_sandwich",
                name = "quick_left_hand", 
                flag = 24,
                bone = "SKEL_L_Finger12",
            },
        }
        local animation = Anims["eat"]
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        local prop = CreateObject(propname, coords.x, coords.y, coords.z + 0.2, true, true, false, false, true)
        local boneIndex = GetEntityBoneIndexByName(ped, animation.bone)
    
        RequestAnimDict(animation.dict)
        while not HasAnimDictLoaded(animation.dict) do
            Citizen.Wait(10)
        end
    
        TaskPlayAnim(ped, animation.dict, animation.name, 8.0, -8.0, 5000, animation.flag, 0, false, false, false)
        AttachEntityToEntity(prop, ped, boneIndex, 0.02, 0.028, 0.001, 15.0, 175.0, 0.0, true, true, false, true, 1, true)
    
        Citizen.CreateThread(function()
            Citizen.Wait(5000) 
            DeleteEntity(prop)
            ClearPedSecondaryTask(ped)
            animDone = true
            soundEffect("Core_Fill_Up", "Consumption_Sounds")
            Notify({text=Locale("usableitem"), type="success", time=4000})
            FXUnlockInventory() 
            cb(true)
        end)
    end,
    ["shrooms"] = function(propname, cb)
        FXLockInventory()
        animDone = false
        local Anims = {
            ["eat"] = {
                dict = "mech_inventory@eating@multi_bite@sphere_d8-2_sandwich",
                name = "quick_left_hand", 
                flag = 24,
                bone = "SKEL_L_Finger12",
            },
        }
        local animation = Anims["eat"]
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        local prop = CreateObject(propname, coords.x, coords.y, coords.z + 0.2, true, true, false, false, true)
        local boneIndex = GetEntityBoneIndexByName(ped, animation.bone)
    
        RequestAnimDict(animation.dict)
        while not HasAnimDictLoaded(animation.dict) do
            Citizen.Wait(10)
        end
    
        TaskPlayAnim(ped, animation.dict, animation.name, 8.0, -8.0, 5000, animation.flag, 0, false, false, false)
        AttachEntityToEntity(prop, ped, boneIndex, 0.02, 0.028, 0.001, 15.0, 175.0, 0.0, true, true, false, true, 1, true)
    
        Citizen.CreateThread(function()
            Citizen.Wait(5000) 
            DeleteEntity(prop)
            ClearPedSecondaryTask(ped)
            animDone = true
            soundEffect("Core_Fill_Up", "Consumption_Sounds")
            Notify({text=Locale("usableitem"), type="success", time=4000})
            FXUnlockInventory() 
            cb(true)
        end)
    end,
    ["drink"] = function(propname, cb)
        FXLockInventory()
        local ped = PlayerPedId()
        local act = GetHashKey("DRINK_Bottle_Oval_L5-5W9-5H10_Neck_A6_B2-5_QUICK_RIGHT_HAND")
        
        local obj = CreateObject(GetHashKey(propname), GetEntityCoords(ped), false, true, false, false, true)
        Citizen.InvokeNative(0x72F52AA2D2B172CC, ped, 1242464081, obj, 2120637577, act, 1, 0, -1.0)
        
        Citizen.CreateThread(function()
            while true do
                Citizen.Wait(500)
                local interact = IsPedRunningTaskItemInteraction(PlayerPedId())
                if interact == 0 then
                    DeleteEntity(obj)
                    soundEffect("Core_Fill_Up", "Consumption_Sounds")
                    Notify({text = Locale("usableitem"), type = "success", time = 4000})
                    FXUnlockInventory()   
                    cb(true)
                    return
                end
            end
        end)
    end,
    
    ["coffe"] = function(propname, cb)
        FXLockInventory()
        animDone = false
        local ped = PlayerPedId()
        local prop = "p_mugCoffee01x"
        if propname then
            prop = propname
        end
    
        local propEntity = CreateObject(GetHashKey(prop), GetEntityCoords(ped), false, true, false, false, true)
        TaskItemInteraction_2(ped, -1199896558, propEntity, GetHashKey("p_mugCoffee01x_ph_r_hand"), GetHashKey("DRINK_COFFEE_HOLD"), 1, 0, -1.0)
    
        Citizen.CreateThread(function()
            while not animDone do
                Citizen.Wait(500)
                local interact = IsPedRunningTaskItemInteraction(PlayerPedId())
                if interact == 0 then
                    animDone = true
                    DeleteEntity(propEntity)
                    soundEffect("Core_Fill_Up", "Consumption_Sounds")
                    Notify({text=Locale("usableitem"), type="success", time=4000})
                    FXUnlockInventory()
                    cb(true) 
                    return
                end
            end
            cb(false) 
        end)
    end,
    
    ["champagne"] = function(propname, cb)
        FXLockInventory()
        animDone = false
        local ped = PlayerPedId()
        local prop = "P_GLASS001X"
        if propname then
            prop = propname
        end
    
        local propEntity = CreateObject(GetHashKey(prop), GetEntityCoords(ped), false, true, false, false, true)
        TaskItemInteraction_2(ped, -1199896558, propEntity, GetHashKey("P_GLASS001X_ph_r_hand"), GetHashKey("DRINK_CHAMPAGNE_HOLD"), 1, 0, -1.0)
    
        Citizen.CreateThread(function()
            while not animDone do
                Citizen.Wait(500)
                local interact = IsPedRunningTaskItemInteraction(PlayerPedId())
                if interact == 0 then
                    animDone = true
                    DeleteEntity(propEntity)
                    soundEffect("Core_Fill_Up", "Consumption_Sounds")
                    Notify({text=Locale("usableitem"), type="success", time=4000})
                    FXUnlockInventory()
                    cb(true) 
                    return
                end
            end
            cb(false) 
        end)
    end,
  
    ["beer"] = function(propname, cb)
        FXLockInventory()
        local ped = PlayerPedId()
        local prop = "p_bottleJD01x"
        if propname then
            prop = propname
        end
    
        local propEntity = CreateObject(GetHashKey(prop), GetEntityCoords(ped), false, false, 1, 1, 0)
        TaskItemInteraction_2(ped, 1737033966, propEntity, GetHashKey("p_bottleJD01x_ph_r_hand"), GetHashKey("DRINK_BOTTLE@Bottle_Cylinder_D1-3_H30-5_Neck_A13_B2-5_UNCORK"), true, 0, 0)
    
        Citizen.CreateThread(function()
            while true do
                Citizen.Wait(500)
                local interact = IsPedRunningTaskItemInteraction(PlayerPedId())
                if interact == 0 then
                    DeleteEntity(propEntity)
                    soundEffect("Core_Fill_Up", "Consumption_Sounds")
                    Notify({text=Locale("usableitem"), type="success", time=4000})
                    FXUnlockInventory() 
                    cb(true)
                    return
                end
            end
            cb(false) 
        end)
    end,
    ["whisky"] = function(propname, cb)
        FXLockInventory()
        local ped = PlayerPedId()
        Citizen.InvokeNative(0x524B54361229154F, ped, GetHashKey("WORLD_HUMAN_DRINK_FLASK"), 5000, true, false, false, false)
        Citizen.CreateThread(function()
            Citizen.Wait(5000)
            ClearPedSecondaryTask(ped)
            ClearPedTasks(ped)
            soundEffect("Core_Fill_Up", "Consumption_Sounds")
            Notify({text=Locale("usableitem"), type="success", time=4000})
            FXUnlockInventory()
            cb(true) 
        end)
    end,
    ["cigaratte"] = function(propname, cb)
        FXLockInventory()
        CigaretteEvent(propname)
        FXUnlockInventory()    
        cb(true)
    end,
    ["cigar"] = function(propname, cb)
        FXLockInventory()
        CigarEvent()
        FXUnlockInventory()   
        cb(true)
    end,
    ["pipe"] = function(propname, cb)
        FXLockInventory()
        PipeEvent()
        FXUnlockInventory()   
        cb(true)
    end,
    ["horse"] = function(propname, cb)
        FXLockInventory()
        local ped = PlayerPedId()
        Citizen.InvokeNative(0xCD181A959CFDD7F4, ped, GetMount(ped), GetHashKey("Interaction_Food"), propname, 1)
        SetTimeout(3000, function()
            FXUnlockInventory()   
            cb(true)
        end)
    end,
    ["inject"] = function(propname, cb)
        FXLockInventory()
        local ped = PlayerPedId()
        local prop = CreateObject(GetHashKey(propname), GetEntityCoords(ped), false, false, 1, 1, 0)
        TaskItemInteraction_2(ped, 1737033966, prop, GetHashKey("PrimaryItem"), GetHashKey("USE_STIMULANT_INJECTION_QUICK_LEFT_HAND"), true, 0, 0)
        Citizen.CreateThread(function()
            while true do
                Citizen.Wait(500)
                local interact = IsPedRunningTaskItemInteraction(PlayerPedId())
                if interact == 0 then
                    DeleteEntity(prop)
                    soundEffect("Core_Fill_Up", "Consumption_Sounds")
                    FXUnlockInventory()       
                    cb(true)
                    return
                end
            end
        end)
    end,
    ["horseinject"] = function(propname, cb)
        FXLockInventory()
        local ped = PlayerPedId()
        Citizen.InvokeNative(0xCD181A959CFDD7F4, ped, GetMount(ped), GetHashKey("Interaction_Injection_Quick"), GetHashKey(propname), 1)
        SetTimeout(3000, function()
            FXUnlockInventory()   
            cb(true)
        end)
    end,
}

Config.DoAnim = function(itemName, animName, cb)
    if not Config.Animations[animName] then
        print("Animation not found:", animName)
        return
    end
    
    Config.Animations[animName](Config.Consumables[itemName].prop, function(animState)
        if animState then
            cb(true) 
        else
            cb(false)
        end
    end)
end
