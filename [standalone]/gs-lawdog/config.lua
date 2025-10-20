Config = Config or {}
Config.ItemName = "dogcaller" -- Item name for the dog
Config.SearchRangeDog = 100 -- Distance the dog can search for people
Config.SentBLockerChance = 50 -- 50% chance if they have a blocker it will not alert the dog
Config.SniffLoop = 90000 -- 90 Seconds for the dog to reach the player before the dog gives up
Config.SearchItems = { -- Items the dog can search for
    "moonshine",
    "weedjoint",
    "dryweed",
    "weed",
    
}

Config.DevMode = false -- Used to search yourself for testing please keep false on live server

Config.SentBlockers = { -- Items that throw off the dog
    'stringy',
    'bird'
}

Config.ApprovedJobs = { -- Jobs that can use the dog
    'usms',
    'naso',
    'nhso',
    'lso',
    'doj',
}

--Use command /end to remove the dog
Config.ControlKeys = {
    Attack = { key = 0x760A9C6F, label = "Attack" },        -- G
    Sniff =  { key = 0x8FFC75D6, label = "Sniff" },         -- SHIFT
    Sit =    { key = 0xDEB34313, label = "Sit" },           -- Right Arrow
    FindScent = { key = 0x6319DB71, label = "Find Scent" }, -- Up Arrow
    CallBack = { key = 0x05CA7C52, label = "Call Back" },   -- Down Arrow
    Carry =  { key = 0xDE794E3E, label = "Carry Dog" },     -- Q
    Follow = { key = 0xA65EBAB4, label = "Follow" },        -- Left Arrow
    ReturnDog  = { key = 0x156F7119, label = "Return Dog" }, -- Backspace
}

Config.AlertText = {
    DogTitle = "Dog",
    DogFound = "Smokey has found something!",
    DogNotFound = "Smokey has found nothing!",
    DogSents = "Smokey could not find any scents in the area.",
    DogReturn = "Smokey has returned to you.",
    DogLostInterest = "Dog has lost interest",
    Progressbar = "Smokey is searching...",
    ToFarAway = "You are too far away from the dog.",
    DropDog = "Drop Dog",
    CarryDog = "Carry Dog",
    ReturnDog = "Dog Returned",
    DialogTittle = "Pick a dog",
    DialogLabel = "Breed",
}

Config.DogTypes = {
    { model = 'A_C_DogAustralianSheperd_01', label = 'Australian shepherd' },
    { model = 'A_C_DogHusky_01', label = 'Siberian husky' },
    { model = 'A_C_DogAmericanFoxhound_01', label = 'American foxhound' },
    { model = 'A_C_DogCollie_01', label = 'Border collie' },
    { model = 'A_C_DogChesBayRetriever_01', label = 'Labrador retriever' },
    { model = 'A_C_DogBluetickCoonhound_01', label = 'Bluetick coonhound' },
    { model = 'A_C_DogHound_01', label = 'Bloodhound' },
}