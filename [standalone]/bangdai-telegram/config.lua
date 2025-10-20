Config = {}

Config.keys = {
    OpenMenuPrompt = 0x5415BE48,
    RetrieveAndWrite = 0xC7B5340A,
    CancelBird = 0x760A9C6F,
}

Config.Item = {
    LetterToRead = { item = 'letter', type = 'read' },
    BirdPost = { item = 'birdpost', type = 'bird' },
    Paper = { item = 'paper' },
}

Config.CurrentYear = 1899
Config.Price = 0
Config.EnableContactRadial = true
Config.AllowSendToSelf = true
Config.EnableBirdPost = false
Config.CommandShowTelegramNumber = 'telegram'

Config.EnableTalkWhileOpen = {
    Enable = false,
    EnableKeys = { 0x4BC9DABB, 0x470DC190, 0x8F9F9E58, 0xE6F612E4 } -- this is default key hash for ptt
}

Config.Bird = {
    AttatchDistance = 1.5,
    BirdArrivalDelay = 20000,
    BirdTimeout = 180,
    BirdModel = 'a_c_pigeon',
    AutoResurrect = true,
    Threshold = 1500, --player must be not move in milisec to attach bird
    SpawnFar = 25,    -- how far birdspawn
    Scale = 2.0
}

Config.AuthorizedJobs = { -- authorizedjobs for send messages to all player
    enable = true,        -- this for enable job lock // eg: if false everyone can send messages to allplayer

    eastern = {           -- job name
        grades = { 7, 14 } -- job grades
    },
    western = {
        grades = { 7, 14 }
    },
}

Config.LawReceiver = {
    ['medic'] = 'helpmedic',
    ['police'] = 'law'
}

Config.Blip = {
    blipSprite = 'blip_post_office',
    blipScale = 0.2,
    blipname = 'Postal Office'
}

Config.Postal = {
    { name = 'VALENTINE',  state = 'HANOVER',   coords = vec3(-178.9489, 626.83941, 114.08961), showblip = true }, -- valentine
    { name = 'RHODES',     state = 'LEMOYNE',   coords = vec3(1225.57, -1293.87, 76.91),        showblip = true }, -- rhodes
    { name = 'SAINTDENIS', state = 'LEMOYNE',   coords = vec3(2731.55, -1402.37, 46.18),        showblip = true }, -- saintdenis
    { name = 'VANHORN',    state = 'HANOVER',   coords = vec3(2986.1557, 568.51599, 44.627922), showblip = true }, -- vanhorn
    { name = 'ANNESBURG',  state = 'HANOVER',   coords = vec3(2939.5173, 1288.5345, 44.652824), showblip = true }, -- annsburg
    { name = 'ARMADILLO',  state = 'AUSTIN',    coords = vec3(-3733.965, -2597.86, -12.92674),  showblip = true }, -- armadillo
    { name = 'TUMBLEWEED', state = 'AUSTIN',    coords = vector3(-5491.74, -2939.09, -0.41),  showblip = true }, -- tumbleweed
    { name = 'STRAWBERRY', state = 'ELIZABETH', coords = vec3(-1765.084, -384.1582, 157.74119), showblip = true }, -- strawberry
    { name = 'BLACKWATER', state = 'ELIZABETH', coords = vec3(-875.054, -1328.753, 43.958003),  showblip = true }, -- blackwater
    { name = 'EMERALD',    state = 'HANOVER',   coords = vector3(1521.99, 439.51, 90.73),  showblip = true }, -- Emerald
    { name = 'BACCHUS STATION',    state = 'HANOVER',   coords = vector3(579.16, 1677.97, 187.97),  showblip = true }, -- Bacchus
    { name = 'WALLACE STATION',    state = 'HANOVER',   coords = vector3(-1299.27, 401.96, 95.43),  showblip = true }, -- Wallace
    { name = 'RIGGS STATION',      state = 'HANOVER',   coords = vector3(-1094.3, -574.84, 82.46),  showblip = true }, -- Riggs
    { name = 'BENEDICT POINT',      state = 'AUSTIN',   coords = vector3(-5227.38, -3470.54, -20.52),  showblip = true }, -- Benedict
    { name = 'GUARMA',      state = 'GUARMA',   coords = vector3(1304.3, -6860.9, 43.39),  showblip = true }, -- Guarma
    { name = 'SISIKA',     state = 'HANOVER',    coords = vec3(3371.0158, -658.2863, 46.322036), showblip = true }, -- sisika
}
