
Config = {}	
Config.Text = {
[1] = "Use",
[2] = "Volume",
[3] = "Duration",
[4] = "Set Song",
[5] = "Change Song",
[6] = "Duration",
[7] = "Pause / Resume",
[8] = "Cancel",
[9] = "Information",
[10] = "Phonograph",
[11] = "You don't have enough money, you need $",
[12] = "Price: $",
[13] = "Custom link",
[14] = "Confirm",
[15] = "Decline",
[16] = "Insert a custom song",
[17] = "Song List",
[18] = "Current Volume: ",
[19] = "The list of allowed jobs is empty",
[20] = "Your job doesn't allow you to turn on the phonograph",
[21] = "You don't have the job necessary to play custom songs",
}


Config.ImageUrl = {
   ["Play"] = "https://raw.githubusercontent.com/ghostrecom/lumenworks/main/image/music/play-button.png",
   ["ChangeSong"] = "https://raw.githubusercontent.com/ghostrecom/lumenworks/main/image/music/change.png",
   ["Volume"] = "https://raw.githubusercontent.com/ghostrecom/lumenworks/main/image/music/volume.png",
   ["PauseResume"] = "https://raw.githubusercontent.com/ghostrecom/lumenworks/main/image/music/pause.png",
   ["Cancel"] = "https://raw.githubusercontent.com/ghostrecom/lumenworks/main/image/music/stop.png",
   ["Information"] = "https://raw.githubusercontent.com/ghostrecom/lumenworks/main/image/music/info.png",
}

Config.button = "INPUT_INTERACT_ANIMAL"
Config.menuPosition = "top-right" --top-right / top-left / top-center
Config.defaultVolume = 0.1 --Default volume when a song starts. The values range from 0.1 to 1.0
Config.webhook = "https://discord.com/api/webhooks/1243785411432546304/0UtMHTeg3Uz0fyCyUlKVqC77GNGAsAiDC4Wgde1iQr-3Rr8fRtpRKgqbeZR3OtVwrdem"

Config.moneyIconImage = "https://raw.githubusercontent.com/ghostrecom/lumenworks/main/image/music/money.png"

Config.dataPhonographProp = { --This table allows the code to react to nearby props with the model you indicate in the models variable, ideal for servers where custom props can be added in houses, stores etc.).

   {
      code = "PropLocal",
      price = 0,
      model = GetHashKey("p_phonograph01x"),
      distanceSound = 12,
      usableOnlyForSpecificsJobs = {
         active = true,
         joblist = {},
      },
      freejobs = {"jobrole"},
      customLinkOptions = {
         active = false,
         joblist = {},
      },
      priceSong = {
         active = false,
         quantity = 1,

      },
      songlist = {
      --    { link = "https://www.youtube.com/watch?v=2MdqdMT59L0", text = "Hello My Baby" },
      --    { link = "https://cdn.discordapp.com/attachments/1086301231103881267/1099352409865732116/Irish_Rovers_-_Whiskey_in_the_Jar_lyrics.mp3", text = "Whiskey in the Ja" },
      --    { link = "https://raw.githubusercontent.com/ghostrecom/musica/main/Down_The_Hill.mp3", text = "Down The Hill" },
      }
   },


}




Config.dataPhonograph = {

   ["Scarlet Lounge's Phonograph"] =

   {
      code = "sd1",
      coords = vector3(2638.383544921875, -1228.212158203125, 53.46800231933594),
      createprop = true,
      coordsProp = vector3(2638.383544921875, -1228.212158203125, 53.46800231933594),
      heading = -53.86562728881836,
      distanceSound = 12,
      usableOnlyForSpecificsJobs = {
         active = true,
         joblist = {bassaloon},
      },
      freejobs = {"bassaloon"},
      customLinkOptions = {
         active = false,
         joblist = {},
      },
      priceSong = {
         active = false,
         quantity = .25,

      },
      songlist = {
         { link = "https://www.youtube.com/watch?v=be2ZHZuiC18", text = "Tarantella Napolitana" },
         { link = "https://www.youtube.com/watch?v=ruWlagKvuK0", text = "Maria Mari" },
         { link = "https://www.youtube.com/watch?v=8B6jOUzBKYc", text = "Malaguena" },
         { link = "https://www.youtube.com/watch?v=6jWsIpAbo-8", text = "Volare" },
         { link = "https://www.youtube.com/watch?v=nPT_ZDiuN7s", text = "Grandpa Smoke" },
         { link = "https://www.youtube.com/watch?v=WzOhfmwvFs0", text = "Godfather's Jazz" },
         { link = "https://www.youtube.com/watch?v=2fhA2WM1FpY", text = "Peccato Mortale" },
         { link = "https://www.youtube.com/watch?v=ZHV_Hc2Wbrw", text = "Just Business, Darling" },
      --    { link = "https://www.youtube.com/watch?v=2MdqdMT59L0", text = "Hello My Baby" },
      --    { link = "https://cdn.discordapp.com/attachments/1086301231103881267/1099352409865732116/Irish_Rovers_-_Whiskey_in_the_Jar_lyrics.mp3", text = "Whiskey in the Ja" },
      --    { link = "https://raw.githubusercontent.com/ghostrecom/musica/main/Down_The_Hill.mp3", text = "Down The Hill" },
         

      }
   },
   
   ["Red Rhodes Phonograph"] =

   {
      code = "rh1",
      coords = vector3(1341.5064697265625, -1373.4000244140625, 80.52064514160156),
      createprop = true,
      coordsProp = vector3(1341.5064697265625, -1373.4000244140625, 80.52064514160156),
      heading = 113.9057388305664,
      distanceSound = 12,
      usableOnlyForSpecificsJobs = {
         active = true,
         joblist = {rhosaloon},
      },
      freejobs = {"rhosaloon"},
      customLinkOptions = {
         active = false,
         joblist = {},
      },
      priceSong = {
         active = false,
         quantity = .25,

      },
      songlist = {
         { link = "https://www.youtube.com/watch?v=KgIMeV3XsD4", text = "Goober Peas" },
         { link = "https://www.youtube.com/watch?v=m_MQIdAH1GY", text = "Lorena" },
         { link = "https://www.youtube.com/watch?v=_-UFTpiqUts", text = "Cattle Call" },
         { link = "https://www.youtube.com/watch?v=7h1DhpHhh9A", text = "Blue Yodel No. 7" },
         { link = "https://www.youtube.com/watch?v=0Ch-Gg7QiNA", text = "My Man's A Jolly Railroad Man" },
         { link = "https://www.youtube.com/watch?v=RMQ881XJzf8", text = "Roll Along, Kentucky Moon" },
         { link = "https://www.youtube.com/watch?v=QL-k8_4C-4g", text = "The Last Round-Up" },
         { link = "https://www.youtube.com/watch?v=G2BUbPrE07g", text = "Old Faithful" },
         { link = "https://www.youtube.com/watch?v=FoOA0TnRHbM", text = "Nobody's Darlin' But Mine" },
         { link = "https://www.youtube.com/watch?v=w1AzrOEiRlM", text = "Right Or Wrong" },
         { link = "https://www.youtube.com/watch?v=EiOTsLTAeaw", text = "Hi-Yo, Silver" },
         { link = "https://www.youtube.com/watch?v=Z0j-9zQpKhg", text = "It Makes No Difference Now" },
         { link = "https://www.youtube.com/watch?v=f1fynRYYTKw", text = "That's What I Like 'Bout the South" },
         { link = "https://www.youtube.com/watch?v=Hy3EMwu8vz8", text = "Cumberland Gap" },
      --    { link = "https://www.youtube.com/watch?v=2MdqdMT59L0", text = "Hello My Baby" },
      --    { link = "https://cdn.discordapp.com/attachments/1086301231103881267/1099352409865732116/Irish_Rovers_-_Whiskey_in_the_Jar_lyrics.mp3", text = "Whiskey in the Ja" },
      --    { link = "https://raw.githubusercontent.com/ghostrecom/musica/main/Down_The_Hill.mp3", text = "Down The Hill" },
         
      }
   },

   ["Phonograph Valentine 1"] =

   {
      code = "vl1",
      coords = vector3(-312.0470275878906, 804.1403198242188, 119.03215789794922),
      createprop = true,
      coordsProp = vector3(-312.0470275878906, 804.1403198242188, 119.03215789794922),
      heading = 69.76074981689453,
      distanceSound = 12,
      usableOnlyForSpecificsJobs = {
         active = true,
         joblist = {valsaloon},
      },
      freejobs = {"valsaloon"},
      customLinkOptions = {
         active = false,
         joblist = {},
      },
      priceSong = {
         active = false,
         quantity = .25,

      },
      songlist = {
         { link = "https://www.youtube.com/watch?v=-7BNQja4h5M", text = "Blue Mountain Horn" },
         { link = "https://www.youtube.com/watch?v=14iyVNMqiGc", text = "Tear Drop Waltz" },
         { link = "https://www.youtube.com/watch?v=7BuXZEax7ro", text = "Big John Mcneil" },
         { link = "https://www.youtube.com/watch?v=dpgrXUJ7vSk", text = "Reginald's Waltz" },
         { link = "https://www.youtube.com/watch?v=ihFEr3fqRgU", text = "St. Anne's Reel" },
         { link = "https://www.youtube.com/watch?v=_YeF97019Z8", text = "Red River Jig" },
         { link = "https://www.youtube.com/watch?v=3mmUzKxfX4w", text = "Les Michif" },
      --    { link = "https://www.youtube.com/watch?v=2MdqdMT59L0", text = "Hello My Baby" },
      --    { link = "https://cdn.discordapp.com/attachments/1086301231103881267/1099352409865732116/Irish_Rovers_-_Whiskey_in_the_Jar_lyrics.mp3", text = "Whiskey in the Ja" },
      --    { link = "https://raw.githubusercontent.com/ghostrecom/musica/main/Down_The_Hill.mp3", text = "Down The Hill" },
         
      }
   },

   ["Phonograph Valentine 2"] =

   {
      code = "vl2",
      coords = vector3(-239.79734802246094, 768.635009765625, 118.12718963623047),
      createprop = true,
      coordsProp = vector3(-239.79734802246094, 768.635009765625, 118.12718963623047),
      heading = -69.48497772216797,
      distanceSound = 12,
      usableOnlyForSpecificsJobs = {
         active = true,
         joblist = {},
      },
      freejobs = {"jobrole"},
      customLinkOptions = {
         active = false,
         joblist = {},
      },
      priceSong = {
         active = false,
         quantity = 1,

      },
      songlist = {
      --    { link = "https://www.youtube.com/watch?v=2MdqdMT59L0", text = "Hello My Baby" },
      --    { link = "https://cdn.discordapp.com/attachments/1086301231103881267/1099352409865732116/Irish_Rovers_-_Whiskey_in_the_Jar_lyrics.mp3", text = "Whiskey in the Ja" },
      --    { link = "https://raw.githubusercontent.com/ghostrecom/musica/main/Down_The_Hill.mp3", text = "Down The Hill" },
         
      }
   },


   
    ["Phonograph Strawberry 1"] =

      {
         code = "st1",
         coords = vector3(-1774.6983642578125, -374.58001708984375, 160.0860595703125),
         createprop = true,
         coordsProp = vector3(-1774.6983642578125, -374.58001708984375, 160.0860595703125),
         heading = -130.9980010986328,
         distanceSound = 12,
         usableOnlyForSpecificsJobs = {
            active = true,
            joblist = {strawsaloon},
         },
         freejobs = {"strawsaloon"},
         customLinkOptions = {
         active = false,
         joblist = {},
         },
         priceSong = {
            active = false,
            quantity = .25,
   
         },
         songlist = {
            { link = "https://www.youtube.com/watch?v=CIuH9afdRvs", text = "The Night Pat Murphy Died" },
            { link = "https://www.youtube.com/watch?v=deY8jH9zw6M", text = "The Rocky Road to Dublin" },
            { link = "https://www.youtube.com/watch?v=KAO7vs_Q9is", text = "El Paso" },
            { link = "https://www.youtube.com/watch?v=lLV5GVWnVqs", text = "The Cruel Wars" },
      --    { link = "https://www.youtube.com/watch?v=2MdqdMT59L0", text = "Hello My Baby" },
      --    { link = "https://cdn.discordapp.com/attachments/1086301231103881267/1099352409865732116/Irish_Rovers_-_Whiskey_in_the_Jar_lyrics.mp3", text = "Whiskey in the Ja" },
      --    { link = "https://raw.githubusercontent.com/ghostrecom/musica/main/Down_The_Hill.mp3", text = "Down The Hill" },
         
         }
      }, 
   --[[   ["Phonograph Strawberry 2"] =

      {
         code = "st2",
         coords = vector3(-1816.8074951171875, -424.5182800292969, 159.8580780029297),
         createprop = false,  
         coordsProp = nil,
         heading = nil,
         distanceSound = 12,
         usableOnlyForSpecificsJobs = {
            active = false,
            joblist = {},
         },
   
         customLinkOptions = {
            active = true,
            joblist = {},
         },
         priceSong = {
            active = false,
            quantity = 1,
   
         },
         songlist = {
         { link = "https://www.youtube.com/watch?v=2MdqdMT59L0", text = "Hello My Baby" },
         { link = "https://www.youtube.com/watch?v=oipaN3Ucx64", text = "Hello Ma Baby" },
         { link = "https://www.youtube.com/watch?v=y3PlpUrjkfk", text = "Saint Denis" },
         { link = "https://www.youtube.com/watch?v=-iZ-etwGt84", text = "Buffalo Gals" },
         { link = "https://www.youtube.com/watch?v=VvFWfeMMx0E", text = "Feminist Songs" },
         { link = "https://www.youtube.com/watch?v=YbhDniKtuVQ", text = "Little Joe the Wrangler" },
         { link = "https://www.youtube.com/watch?v=irGUpwRvQqs", text = "Cielito Lindo" },
         { link = "https://www.youtube.com/watch?v=KzCq8c2HbhY", text = "Moonlight bay" },
         { link = "https://www.youtube.com/watch?v=eIsduCQ7ByE", text = "When Irish Eyes are Smiling" },
         { link = "https://cdn.discordapp.com/attachments/1086301231103881267/1099352409865732116/Irish_Rovers_-_Whiskey_in_the_Jar_lyrics.mp3", text = "Whiskey in the Ja" },
         { link = "https://www.youtube.com/watch?v=1O2DXzxCwrg", text = "I Didn't Raise my Boy to be a Soldier" },
         { link = "https://cdn.discordapp.com/attachments/1086301231103881267/1099352447513788477/Drunken_Sailer_-_Irish_Rovers.mp3", text = "Drunken Sailor" },
         { link = "https://cdn.discordapp.com/attachments/1086301231103881267/1099352530615554200/The_Yellow_Rose_of_Texas_-_The_Confederate_Army.mp3", text = "The Yellow Rose of Texas" },
         { link = "https://www.youtube.com/watch?v=ff58W_m2ipk", text = "Dixie's Land" },
         { link = "https://raw.githubusercontent.com/ghostrecom/musica/main/Down_The_Hill.mp3", text = "Down The Hill" },
         { link = "https://raw.githubusercontent.com/ghostrecom/musica/main/The_Foxhunters.mp3", text = "The Foxhunters" },
         { link = "https://raw.githubusercontent.com/ghostrecom/musica/main/The_Rakes_Of_Kildare_The_Horses_Leotard.mp3", text = "The Rakes Of Kildare The Horses Leotard" },
         
         }
      },  --]]

      ["Phonograph Armadillo 1"] =

      {
         code = "ar1",
         coords = vector3(-3700.5821, -2592.0108, -12.9276),
         createprop = true,
         coordsProp = vector3(-3700.97998046875, -2591.234130859375, -13.27522087097168),
         heading = -70.00000762939453,
         distanceSound = 12,
         usableOnlyForSpecificsJobs = {
         active = true,
         joblist = {armsaloon},
         },
         freejobs = {"armsaloon"},
         customLinkOptions = {
         active = false,
         joblist = {},
         },
         priceSong = {
            active = false,
            quantity = 1,
   
         },
         songlist = {
            { link = "https://www.youtube.com/watch?v=s_nBSSXiG9w", text = "Maple Leaf Rag" },
            { link = "https://www.youtube.com/watch?v=zSQYJCEDrcg", text = "Poker d'assi" },
            { link = "https://www.youtube.com/watch?v=m0hlzE4MaZQ", text = "The Band Played On" },
            { link = "https://www.youtube.com/watch?v=69AGX3M_enY", text = "The Streets of Cairo" },
            { link = "https://www.youtube.com/watch?v=EanT30-NBc0", text = "A Hot Time in the Old Town Tonight" },
      --    { link = "https://www.youtube.com/watch?v=2MdqdMT59L0", text = "Hello My Baby" },
      --    { link = "https://cdn.discordapp.com/attachments/1086301231103881267/1099352409865732116/Irish_Rovers_-_Whiskey_in_the_Jar_lyrics.mp3", text = "Whiskey in the Ja" },
      --    { link = "https://raw.githubusercontent.com/ghostrecom/musica/main/Down_The_Hill.mp3", text = "Down The Hill" },
            
         }
      },

      ["Phonograph Tumbleweed 1"] =

      {
         code = "tb1",
         coords = vector3(-5519.57275390625, -2908.536376953125, -1.70224165916442),
         createprop = true,
         coordsProp = vector3(-5519.73, -2908.06, -1.753),
         heading = -70.00000762939453,
         distanceSound = 12,
         usableOnlyForSpecificsJobs = {
         active = true,
         joblist = {},
         },
         freejobs = {"jobrole"},
         customLinkOptions = {
         active = false,
         joblist = {},
         },
         priceSong = {
            active = false,
            quantity = 1,
   
         },
         songlist = {
      --    { link = "https://www.youtube.com/watch?v=2MdqdMT59L0", text = "Hello My Baby" },
      --    { link = "https://cdn.discordapp.com/attachments/1086301231103881267/1099352409865732116/Irish_Rovers_-_Whiskey_in_the_Jar_lyrics.mp3", text = "Whiskey in the Ja" },
      --    { link = "https://raw.githubusercontent.com/ghostrecom/musica/main/Down_The_Hill.mp3", text = "Down The Hill" },
            
         }
      },

      ["Phonograph Blackwater 1"] =

      {
         code = "bw1",
         coords = vector3(-816.8788452148438, -1317.4736328125, 43.72878646850586),
         coordsProp = vector3(-816.8788452148438, -1317.4736328125, 43.72878646850586),
         createprop = true,
         heading = 70.00000762939453,
         distanceSound = 12,
         usableOnlyForSpecificsJobs = {
         active = true,
         joblist = {},
         },
         freejobs = {"jobrole"},
         customLinkOptions = {
         active = false,
         joblist = {},
         },
         priceSong = {
            active = false,
            quantity = 1,
   
         },
         songlist = {
      --    { link = "https://www.youtube.com/watch?v=2MdqdMT59L0", text = "Hello My Baby" },
      --    { link = "https://cdn.discordapp.com/attachments/1086301231103881267/1099352409865732116/Irish_Rovers_-_Whiskey_in_the_Jar_lyrics.mp3", text = "Whiskey in the Ja" },
      --    { link = "https://raw.githubusercontent.com/ghostrecom/musica/main/Down_The_Hill.mp3", text = "Down The Hill" },
            
         }
      },

      ["Van Horn Phonograph"] =

      {
         code = "vh1",
         coords = vector3(2946.259765625, 526.9096069335938, 43.72878646850586),
         coordsProp = vector3(2946.259765625, 526.9096069335938, 43.72878646850586),
         createprop = true,
         heading = 70.00000762939453,
         distanceSound = 10,
         usableOnlyForSpecificsJobs = {
         active = true,
         joblist = {oldsaloon},
         },
         freejobs = {"oldsaloon"},
         customLinkOptions = {
         active = false,
         joblist = {},
         },
         priceSong = {
            active = false,
            quantity = 1,
   
         },
         songlist = {
            { link = "https://www.youtube.com/watch?v=opMFlvW8dZU", text = "Edo Period" },
            { link = "https://www.youtube.com/watch?v=MzgMBrtrFc4", text = "Japanese Ambiance" },
            { link = "https://www.youtube.com/watch?v=KVxs9AxJo9M", text = "Music of a Restuarant" },
            { link = "https://www.youtube.com/watch?v=rzDnHiT_-ao", text = "Japanese Journey" },
            { link = "https://www.youtube.com/watch?v=qpYyAtEEAck", text = "Itsumo Nandodemo" },
      --    { link = "https://www.youtube.com/watch?v=2MdqdMT59L0", text = "Hello My Baby" },
      --    { link = "https://cdn.discordapp.com/attachments/1086301231103881267/1099352409865732116/Irish_Rovers_-_Whiskey_in_the_Jar_lyrics.mp3", text = "Whiskey in the Ja" },
      --    { link = "https://raw.githubusercontent.com/ghostrecom/musica/main/Down_The_Hill.mp3", text = "Down The Hill" },
            
         }
      },

      ["Casino Phonograph"] =

      {
         code = "casino1",
         coords = vector3(3289.805908203125, -1305.033935546875, 42.9437141418457),
         coordsProp = vector3(3289.805908203125, -1305.033935546875, 42.9437141418457),
         createprop = true,
         heading = 0.00000762939453,
         distanceSound = 12,
         usableOnlyForSpecificsJobs = {
         active = true,
         joblist = {casino},
         },
         freejobs = {"casino"},
         customLinkOptions = {
         active = false,
         joblist = {},
         },
         priceSong = {
            active = false,
            quantity = .25,
   
         },
         songlist = {
            { link = "https://youtu.be/XnP4DhhNrFw?si=PqK1TlwCWlUAmTD3", text = "The Entertainer" },
            { link = "https://youtu.be/JKjti3ni4Eo?si=z6tnPNe7oBc8znxr", text = "When The Saints Go Marching In" },
            { link = "https://youtu.be/kjQSpPKUCzA?si=gXKSM4EhyoJbT5_h", text = "Easy Winners" },
            { link = "https://youtu.be/1LTW4A3UmK8?si=s61Dzaet_iw3Yp2i", text = "Maple Leaf Rag" },
            { link = "https://youtu.be/5omp051t3rs?si=4Q7LGzCgigUF7FtZ", text = "Waiting for the Robert E. Lee" },
      --    { link = "https://www.youtube.com/watch?v=2MdqdMT59L0", text = "Hello My Baby" },
      --    { link = "https://cdn.discordapp.com/attachments/1086301231103881267/1099352409865732116/Irish_Rovers_-_Whiskey_in_the_Jar_lyrics.mp3", text = "Whiskey in the Ja" },
      --    { link = "https://raw.githubusercontent.com/ghostrecom/musica/main/Down_The_Hill.mp3", text = "Down The Hill" },
            
         }
      },

      ["Tartarus Phonograph"] =

      {
         code = "tartarus",
         coords = vector3(2927.484619140625, 527.9884033203125, 38.14228057861328),
         coordsProp = vector3(2927.484619140625, 527.9884033203125, 38.14228057861328),
         createprop = true,
         heading = -171.16156005859375,
         distanceSound = 8,
         usableOnlyForSpecificsJobs = {
            active = true,
            joblist = {elysian},
         },
         freejobs = {"elysian"},
         customLinkOptions = {
         active = false,
         joblist = {},
         },
         priceSong = {
            active = false,
            quantity = .25,
   
         },
         songlist = {
            { link = "https://www.youtube.com/watch?v=CrIqo8pNU-Y", text = "The Milkmaid" },
            { link = "https://www.youtube.com/watch?v=laY4TcWEbSA", text = "Santiana" },
            { link = "https://www.youtube.com/watch?v=gvzY1L6lmZc", text = "Tennessee Waltz" },
            { link = "https://www.youtube.com/watch?v=hET8FVdrzhA", text = "Leave Her Johnny" },
            { link = "https://www.youtube.com/watch?v=WVkD4lgXTEU", text = "Bones in the Ocean" },
            { link = "https://www.youtube.com/watch?v=EijPtv2k9xY", text = "Banks Of Newfoundland" },
            { link = "https://www.youtube.com/watch?v=UNVFEt5vkWc", text = "Wellerman" },
            { link = "https://www.youtube.com/watch?v=I3wzlHYzsg8", text = "Spanish Ladies" },
            { link = "https://www.youtube.com/watch?v=P7TuLmyWA5k", text = "The Grey Funnel Line" },
            { link = "https://www.youtube.com/watch?v=MhKphHOW_Og", text = "Drunken Sailor" },
            { link = "https://www.youtube.com/watch?v=lVkBTFdNV30", text = "The Curse" },
            { link = "https://www.youtube.com/watch?v=QUHa5OfzoOM", text = "Woodpile" },
            { link = "https://www.youtube.com/watch?v=BOuyzwxDXWA", text = "Old Maui" },
            { link = "https://www.youtube.com/watch?v=AanBN8iQ9Ig", text = "Randy Dandy-O" },
            { link = "https://www.youtube.com/watch?v=BioadMiSRx4", text = "The Captain's Daughter" },
            { link = "https://www.youtube.com/watch?v=oFGrxvG2l-o", text = "Men I've Known and Killed" },
            { link = "https://www.youtube.com/watch?v=B-wOUdFZmnw", text = "Retirement Song" },
            { link = "https://www.youtube.com/watch?v=cfDp8BjR1w4", text = "The Banks of the Lee" },
            { link = "https://www.youtube.com/watch?v=WoPSBg_JzdI", text = "Crossing The Bar" },
            { link = "https://www.youtube.com/watch?v=UlPs5T27QIs", text = "Blow The Man Down" },
            { link = "https://www.youtube.com/watch?v=uSGpI9ybK9c", text = "Sugar In The Hold" },
            { link = "https://www.youtube.com/watch?v=u2ey2tt09vY", text = "The Auld Triangle" },
            { link = "https://www.youtube.com/watch?v=fJDpLuGJabQ", text = "The Parting Glass" },
            { link = "https://www.youtube.com/watch?v=k6rkHBYqQm4", text = "A Drop of Nelson's Blood" },
            { link = "https://www.youtube.com/watch?v=mpB7Cr4-zjg", text = "Fish in the Sea" },
            { link = "https://www.youtube.com/watch?v=xAiZ0CZOlvc", text = "Hard Times Come Again No More" },
            { link = "https://www.youtube.com/watch?v=MfwTF4KqzUQ", text = "Hanging Johnny" },
            { link = "https://www.youtube.com/watch?v=ZWMSnro18b0", text = "Barrett's Privateers" },
            { link = "https://www.youtube.com/watch?v=UKMHBC0XrKc", text = "Bonny Ship The Diamond" },
            { link = "https://www.youtube.com/watch?v=c_tCnxAjEWA", text = "Here's A Health to the Company" },
            { link = "https://www.youtube.com/watch?v=TdYRJBIvUHw", text = "Shanties Record" },
      --    { link = "https://www.youtube.com/watch?v=2MdqdMT59L0", text = "Hello My Baby" },
      --    { link = "https://cdn.discordapp.com/attachments/1086301231103881267/1099352409865732116/Irish_Rovers_-_Whiskey_in_the_Jar_lyrics.mp3", text = "Whiskey in the Ja" },
      --    { link = "https://raw.githubusercontent.com/ghostrecom/musica/main/Down_The_Hill.mp3", text = "Down The Hill" },
            
         }
      },
      
      ["Grave Rose Phonograph"] =

      {
         code = "graverose",
         coords = vector3(2714.516357421875, -1288.3011474609375, 60.39429473876953),
         coordsProp = vector3(2714.516357421875, -1288.3011474609375, 60.39429473876953),
         createprop = true,
         heading = 67.23905944824219,
         distanceSound = 8,
         usableOnlyForSpecificsJobs = {
            active = true,
            joblist = {graverose},
         },
         freejobs = {"graverose"},
         customLinkOptions = {
         active = false,
         joblist = {},
         },
         priceSong = {
            active = false,
            quantity = .25,
   
         },
         songlist = {
            { link = "https://www.youtube.com/watch?v=gLD-WKMVYhE", text = "Dark Lounge" },
            { link = "https://www.youtube.com/watch?v=m5kHx1itU8c", text = "Chocolate Jesus" },
            { link = "https://www.youtube.com/watch?v=Z2jyXep0Dgs", text = "Mississippi Noir" },
            { link = "https://www.youtube.com/watch?v=iLYB9pvww2M", text = "Hell" },
            { link = "https://www.youtube.com/watch?v=Hc5_S7z5RJk", text = "Black Swamp Village" },
            { link = "https://www.youtube.com/watch?v=S5IEt63qOSI", text = "Save My Soul" },
            { link = "https://www.youtube.com/watch?v=JlmsK59ncHs", text = "The Love Me Or Die" },
            { link = "https://www.youtube.com/watch?v=6qKtdT-7wsE", text = "Alone Tonight" },
      --    { link = "https://www.youtube.com/watch?v=2MdqdMT59L0", text = "Hello My Baby" },
      --    { link = "https://cdn.discordapp.com/attachments/1086301231103881267/1099352409865732116/Irish_Rovers_-_Whiskey_in_the_Jar_lyrics.mp3", text = "Whiskey in the Ja" },
      --    { link = "https://raw.githubusercontent.com/ghostrecom/musica/main/Down_The_Hill.mp3", text = "Down The Hill" },
         }
      },

      ["Party Phonograph"] =

      {
         code = "highsociety",
         coords = vector3(2402.699462890625, -1059.104248046875, 44.14646530151367),
         coordsProp = vector3(2402.699462890625, -1059.104248046875, 44.14646530151367),
         createprop = true,
         heading = -177.41525268554688,
         distanceSound = 8,
         usableOnlyForSpecificsJobs = {
            active = true,
            joblist = {},
         },
         freejobs = {},
         customLinkOptions = {
         active = false,
         joblist = {},
         },
         priceSong = {
            active = false,
            quantity = 0,
   
         },
         songlist = {
            { link = "https://www.youtube.com/watch?v=FaxTRX9oAV4", text = "Waltz" },
            { link = "https://www.youtube.com/watch?v=XpE69gax5Nw", text = "Royal Ball" },
            { link = "https://www.youtube.com/watch?v=OV9tJJ4m6ig", text = "Classical Ball" },
            { link = "https://www.youtube.com/watch?v=vjEUIlH9zMw", text = "European Ball" },
      --    { link = "https://www.youtube.com/watch?v=2MdqdMT59L0", text = "Hello My Baby" },
      --    { link = "https://cdn.discordapp.com/attachments/1086301231103881267/1099352409865732116/Irish_Rovers_-_Whiskey_in_the_Jar_lyrics.mp3", text = "Whiskey in the Ja" },
      --    { link = "https://raw.githubusercontent.com/ghostrecom/musica/main/Down_The_Hill.mp3", text = "Down The Hill" },
         }
      },

      ["St. Denis Undertaker Phonograph"] =

      {
         code = "stdundertaker",
         coords = vector3(2759.05, -1120.5, 48.67),
         coordsProp = vector3(2758.800048828125, -1120.968505859375, 49.54654312133789),
         createprop = true,
         heading = 103.89270782470703,
         distanceSound = 8,
         usableOnlyForSpecificsJobs = {
            active = true,
            joblist = {undertaker},
         },
         freejobs = {"undertaker"},
         customLinkOptions = {
         active = false,
         joblist = {},
         },
         priceSong = {
            active = false,
            quantity = .25,
   
         },
         songlist = {
            { link = "https://www.youtube.com/watch?v=jWO876jxLRU", text = "O Brother" },
            { link = "https://www.youtube.com/watch?v=QJv-kLNTk8g", text = "Sounds of Australia" },
      --    { link = "https://www.youtube.com/watch?v=2MdqdMT59L0", text = "Hello My Baby" },
      --    { link = "https://cdn.discordapp.com/attachments/1086301231103881267/1099352409865732116/Irish_Rovers_-_Whiskey_in_the_Jar_lyrics.mp3", text = "Whiskey in the Ja" },
      --    { link = "https://raw.githubusercontent.com/ghostrecom/musica/main/Down_The_Hill.mp3", text = "Down The Hill" },
         }
      },

 --[[  ["Phonograph iglesia Valentine"] =

      {
         code = "vlIglesia",
         coords = vector3(-229.336, 798.3546, 82.021),
         coordsProp = vector3(-229.88467407226562, 798.0745239257812, 81.55174255371094),
         createprop = true,
         heading = 139.32518005371094,
         distanceSound = 12,
         usableOnlyForSpecificsJobs = {
            active = false,
            joblist = {},
         },
   
         customLinkOptions = {
            active = true,
            joblist = {},
         },
         priceSong = {
            active = false,
            quantity = 1,
   
         },
         songlist = {
            { link = "https://www.youtube.com/watch?v=KzCq8c2HbhY", text = "Moonlight bay" },
            { link = "https://www.youtube.com/watch?v=eIsduCQ7ByE", text = "When Irish Eyes are Smiling" },
            { link = "https://www.youtube.com/watch?v=XVM-tFAdADg", text = "It's A Long Way To Tipperary" },
            { link = "https://www.youtube.com/watch?v=1O2DXzxCwrg", text = "I Didn't Raise my Boy to be a Soldier" },
            { link = "https://www.youtube.com/watch?v=T4lrdawmUg8", text = "The Darktown Strutter's Ball" },
            { link = "https://www.youtube.com/watch?v=lvXocq1c4dc", text = "Danny Boy" },
            { link = "https://www.youtube.com/watch?v=ff58W_m2ipk", text = "Dixie's Land" },
            { link = "https://raw.githubusercontent.com/ghostrecom/musica/main/Down_The_Hill.mp3", text = "Down The Hill" },
            { link = "https://raw.githubusercontent.com/ghostrecom/musica/main/The_Foxhunters.mp3", text = "The Foxhunters" },
            { link = "https://raw.githubusercontent.com/ghostrecom/musica/main/The_Rakes_Of_Kildare_The_Horses_Leotard.mp3", text = "The Rakes Of Kildare The Horses Leotard" },
            
         }
      },--]]

   --[[   ["Phonograph Licorista Tall Trees"] =

      {
         code = "tt1",
         coords = vector3(-1852.0594482421875, -1739.6951904296875, 85.66460418701172),
         createprop = true,
         coordsProp = vector3(-1852.0594482421875, -1739.6951904296875, 85.66460418701172),
         heading = -70.00000762939453,
         distanceSound = 12,
         usableOnlyForSpecificsJobs = {
         active = true,
         joblist = {},
         },

         customLinkOptions = {
         active = false,
         joblist = {},
         },
         priceSong = {
            active = false,
            quantity = 1,
   
         },
         songlist = {
            { link = "https://www.youtube.com/watch?v=2MdqdMT59L0", text = "Hello My Baby" },
            { link = "https://www.youtube.com/watch?v=y3PlpUrjkfk", text = "Saint Denis" },
            { link = "https://www.youtube.com/watch?v=-iZ-etwGt84", text = "Buffalo Gals" },
            { link = "https://www.youtube.com/watch?v=VvFWfeMMx0E", text = "Feminist Songs" },
            { link = "https://www.youtube.com/watch?v=YbhDniKtuVQ", text = "Little Joe the Wrangler" },
            { link = "https://www.youtube.com/watch?v=irGUpwRvQqs", text = "Cielito Lindo" },
            { link = "https://www.youtube.com/watch?v=KzCq8c2HbhY", text = "Moonlight bay" },
            { link = "https://www.youtube.com/watch?v=eIsduCQ7ByE", text = "When Irish Eyes are Smiling" },
            { link = "https://cdn.discordapp.com/attachments/1086301231103881267/1099352409865732116/Irish_Rovers_-_Whiskey_in_the_Jar_lyrics.mp3", text = "Whiskey in the Ja" },
            { link = "https://www.youtube.com/watch?v=1O2DXzxCwrg", text = "I Didn't Raise my Boy to be a Soldier" },
            { link = "https://cdn.discordapp.com/attachments/1086301231103881267/1099352447513788477/Drunken_Sailer_-_Irish_Rovers.mp3", text = "Drunken Sailor" },
            { link = "https://cdn.discordapp.com/attachments/1086301231103881267/1099352530615554200/The_Yellow_Rose_of_Texas_-_The_Confederate_Army.mp3", text = "The Yellow Rose of Texas" },
            { link = "https://www.youtube.com/watch?v=ff58W_m2ipk", text = "Dixie's Land" },
            { link = "https://raw.githubusercontent.com/ghostrecom/musica/main/Down_The_Hill.mp3", text = "Down The Hill" },
            { link = "https://raw.githubusercontent.com/ghostrecom/musica/main/The_Foxhunters.mp3", text = "The Foxhunters" },
            { link = "https://raw.githubusercontent.com/ghostrecom/musica/main/The_Rakes_Of_Kildare_The_Horses_Leotard.mp3", text = "The Rakes Of Kildare The Horses Leotard" },
            
         }
      },--]]

   --[[]   ["Phonograph Licorista New Austin"] =

      {
         code = "na1",
         coords = vector3(-2786.2451171875, -3059.28271484375, -12.29083442687988),
         createprop = true,
         coordsProp = vector3(-2786.2451171875, -3059.28271484375, -12.29083442687988),
         heading = 156.00022888183594,
         distanceSound = 12,
        usableOnlyForSpecificsJobs = {
         active = true,
         joblist = {},
         },

         customLinkOptions = {
         active = false,
         joblist = {},
         },
         priceSong = {
            active = false,
            quantity = 1,
   
         },
         songlist = {
            { link = "https://www.youtube.com/watch?v=2MdqdMT59L0", text = "Hello My Baby" },
            { link = "https://www.youtube.com/watch?v=y3PlpUrjkfk", text = "Saint Denis" },
            { link = "https://www.youtube.com/watch?v=-iZ-etwGt84", text = "Buffalo Gals" },
            { link = "https://www.youtube.com/watch?v=VvFWfeMMx0E", text = "Feminist Songs" },
            { link = "https://www.youtube.com/watch?v=YbhDniKtuVQ", text = "Little Joe the Wrangler" },
            { link = "https://www.youtube.com/watch?v=irGUpwRvQqs", text = "Cielito Lindo" },
            { link = "https://www.youtube.com/watch?v=KzCq8c2HbhY", text = "Moonlight bay" },
            { link = "https://www.youtube.com/watch?v=eIsduCQ7ByE", text = "When Irish Eyes are Smiling" },
            { link = "https://cdn.discordapp.com/attachments/1086301231103881267/1099352409865732116/Irish_Rovers_-_Whiskey_in_the_Jar_lyrics.mp3", text = "Whiskey in the Ja" },
            { link = "https://www.youtube.com/watch?v=1O2DXzxCwrg", text = "I Didn't Raise my Boy to be a Soldier" },
            { link = "https://cdn.discordapp.com/attachments/1086301231103881267/1099352447513788477/Drunken_Sailer_-_Irish_Rovers.mp3", text = "Drunken Sailor" },
            { link = "https://cdn.discordapp.com/attachments/1086301231103881267/1099352530615554200/The_Yellow_Rose_of_Texas_-_The_Confederate_Army.mp3", text = "The Yellow Rose of Texas" },
            { link = "https://www.youtube.com/watch?v=ff58W_m2ipk", text = "Dixie's Land" },
            { link = "https://raw.githubusercontent.com/ghostrecom/musica/main/Down_The_Hill.mp3", text = "Down The Hill" },
            { link = "https://raw.githubusercontent.com/ghostrecom/musica/main/The_Foxhunters.mp3", text = "The Foxhunters" },
            { link = "https://raw.githubusercontent.com/ghostrecom/musica/main/The_Rakes_Of_Kildare_The_Horses_Leotard.mp3", text = "The Rakes Of Kildare The Horses Leotard" },
            
         }
      }, --]]

   --[[   ["Phonograph Thieves Landing"] =

      {
         code = "tl1",
         coords = vector3(-1398.4024658203125, -2321.318115234375, 43.10505676269531),
         createprop = true,
         coordsProp = vector3(-1398.4024658203125, -2321.318115234375, 43.10505676269531),
         heading = -178.0002,
         distanceSound = 12,
         usableOnlyForSpecificsJobs = {
         active = true,
         joblist = {},
         },

         customLinkOptions = {
         active = false,
         joblist = {},
         },
         priceSong = {
            active = false,
            quantity = 1,
   
         },
         songlist = {
            { link = "https://www.youtube.com/watch?v=2MdqdMT59L0", text = "Hello My Baby" },
            { link = "https://www.youtube.com/watch?v=y3PlpUrjkfk", text = "Saint Denis" },
            { link = "https://www.youtube.com/watch?v=-iZ-etwGt84", text = "Buffalo Gals" },
            { link = "https://www.youtube.com/watch?v=VvFWfeMMx0E", text = "Feminist Songs" },
            { link = "https://www.youtube.com/watch?v=YbhDniKtuVQ", text = "Little Joe the Wrangler" },
            { link = "https://www.youtube.com/watch?v=irGUpwRvQqs", text = "Cielito Lindo" },
            { link = "https://www.youtube.com/watch?v=KzCq8c2HbhY", text = "Moonlight bay" },
            { link = "https://www.youtube.com/watch?v=eIsduCQ7ByE", text = "When Irish Eyes are Smiling" },
            { link = "https://cdn.discordapp.com/attachments/1086301231103881267/1099352409865732116/Irish_Rovers_-_Whiskey_in_the_Jar_lyrics.mp3", text = "Whiskey in the Ja" },
            { link = "https://www.youtube.com/watch?v=1O2DXzxCwrg", text = "I Didn't Raise my Boy to be a Soldier" },
            { link = "https://cdn.discordapp.com/attachments/1086301231103881267/1099352447513788477/Drunken_Sailer_-_Irish_Rovers.mp3", text = "Drunken Sailor" },
            { link = "https://cdn.discordapp.com/attachments/1086301231103881267/1099352530615554200/The_Yellow_Rose_of_Texas_-_The_Confederate_Army.mp3", text = "The Yellow Rose of Texas" },
            { link = "https://www.youtube.com/watch?v=ff58W_m2ipk", text = "Dixie's Land" },
            { link = "https://raw.githubusercontent.com/ghostrecom/musica/main/Down_The_Hill.mp3", text = "Down The Hill" },
            { link = "https://raw.githubusercontent.com/ghostrecom/musica/main/The_Foxhunters.mp3", text = "The Foxhunters" },
            { link = "https://raw.githubusercontent.com/ghostrecom/musica/main/The_Rakes_Of_Kildare_The_Horses_Leotard.mp3", text = "The Rakes Of Kildare The Horses Leotard" },
            
         }
      },--]]

   --[[   ["Phonograph Rathskeller"] =

      {
         code = "rk1",
         coords = vector3(-5198.861328125, -2104.5439453125, 12.57439231872558),
         createprop = true,
         coordsProp = vector3(-5198.861328125, -2104.5439453125, 12.57439231872558),
         heading = -77.59,
         distanceSound = 12,
         usableOnlyForSpecificsJobs = {
         active = true,
         joblist = {},
         },

         customLinkOptions = {
         active = false,
         joblist = {},
         },
         priceSong = {
            active = false,
            quantity = 1,
   
         },
         songlist = {
            { link = "https://www.youtube.com/watch?v=2MdqdMT59L0", text = "Hello My Baby" },
            { link = "https://www.youtube.com/watch?v=y3PlpUrjkfk", text = "Saint Denis" },
            { link = "https://www.youtube.com/watch?v=-iZ-etwGt84", text = "Buffalo Gals" },
            { link = "https://www.youtube.com/watch?v=VvFWfeMMx0E", text = "Feminist Songs" },
            { link = "https://www.youtube.com/watch?v=YbhDniKtuVQ", text = "Little Joe the Wrangler" },
            { link = "https://www.youtube.com/watch?v=irGUpwRvQqs", text = "Cielito Lindo" },
            { link = "https://www.youtube.com/watch?v=KzCq8c2HbhY", text = "Moonlight bay" },
            { link = "https://www.youtube.com/watch?v=eIsduCQ7ByE", text = "When Irish Eyes are Smiling" },
            { link = "https://cdn.discordapp.com/attachments/1086301231103881267/1099352409865732116/Irish_Rovers_-_Whiskey_in_the_Jar_lyrics.mp3", text = "Whiskey in the Ja" },
            { link = "https://www.youtube.com/watch?v=1O2DXzxCwrg", text = "I Didn't Raise my Boy to be a Soldier" },
            { link = "https://cdn.discordapp.com/attachments/1086301231103881267/1099352447513788477/Drunken_Sailer_-_Irish_Rovers.mp3", text = "Drunken Sailor" },
            { link = "https://cdn.discordapp.com/attachments/1086301231103881267/1099352530615554200/The_Yellow_Rose_of_Texas_-_The_Confederate_Army.mp3", text = "The Yellow Rose of Texas" },
            { link = "https://www.youtube.com/watch?v=ff58W_m2ipk", text = "Dixie's Land" },
            { link = "https://raw.githubusercontent.com/ghostrecom/musica/main/Down_The_Hill.mp3", text = "Down The Hill" },
            { link = "https://raw.githubusercontent.com/ghostrecom/musica/main/The_Foxhunters.mp3", text = "The Foxhunters" },
            { link = "https://raw.githubusercontent.com/ghostrecom/musica/main/The_Rakes_Of_Kildare_The_Horses_Leotard.mp3", text = "The Rakes Of Kildare The Horses Leotard" },
         --   
         }
      },--]]
      
 }




   






   
