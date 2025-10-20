Config = {}

Config.Core = "RSGCore"

Config.CoreFolderName = "rsg-core" 

--If source is 'web', then pageName should be the entire URL of the image 
--path. ex, https://upload.wikimedia.org/wikipedia/commons/b/b5/800x600_Wallpaper_Blue_Sky.png

-- Config.Books = {
--     ['oldwatch'] = {
--         ['pages'] = {
--             { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
--             { pageName = "1", type = 'hard', source = 'local' }, --Inside Front Cover
--             { pageName = "2", type = 'normal', source = 'local' }, --Page 2
--             { pageName = "3", type = 'normal', source = 'local' }, --Page 2
--             { pageName = "4", type = 'normal', source = 'local' }, --Page 3
--             { pageName = "5", type = 'normal', source = 'local' }, --Page 3
--             { pageName = "6", type = 'hard', source = 'local' }, --Inside Rear Cover
--             { pageName = "backcover", type = 'hard', source = 'local' }, --Rear Cover
--         },
      
--         ['size'] = {
--             ['width'] = 800, --page image width
--             ['height'] = 600, --page image height
--     },
        
--     },

-- }

Config.Books = {
    ['gentlemansguide'] = {
        ['pages'] = {
            { pageName = "1", type = 'hard', source = 'local' }, --Front Cover
            { pageName = "2", type = 'hard', source = 'local' }, --Inside Front Cover
            { pageName = "3", type = 'normal', source = 'local' }, --Page 2
            { pageName = "4", type = 'normal', source = 'local' }, --Page 2
            { pageName = "5", type = 'normal', source = 'local' }, --Page 3
            { pageName = "6", type = 'normal', source = 'local' }, --Page 3
            { pageName = "7", type = 'normal', source = 'local' }, --Page 5
            { pageName = "8", type = 'normal', source = 'local' }, --Inside Rear Cover
            { pageName = "9", type = 'normal', source = 'local' }, --Inside Rear Cover
            { pageName = "10", type = 'normal', source = 'local' }, --Inside Rear Cover
            { pageName = "11", type = 'normal', source = 'local' }, --Inside Rear Cover
            { pageName = "12", type = 'normal', source = 'local' }, --Inside Rear Cover
            { pageName = "13", type = 'normal', source = 'local' }, --Inside Rear Cover
            { pageName = "14", type = 'normal', source = 'local' }, --Inside Rear Cover
            { pageName = "15", type = 'hard', source = 'local'}, --Inside Rear Cover
        },
    
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
        },
    },
    ['book1'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
            { pageName = "1", type = 'hard', source = 'local' }, --Inside Front Cover
            { pageName = "2", type = 'normal', source = 'local' }, --Page 2
            { pageName = "3", type = 'normal', source = 'local' }, --Page 2
            { pageName = "4", type = 'normal', source = 'local' }, --Page 3
            { pageName = "5", type = 'normal', source = 'local' }, --Page 3
            { pageName = "6", type = 'normal', source = 'local' }, --Page 5
            { pageName = "7", type = 'normal', source = 'local' }, --Inside Rear Cover
            { pageName = "8", type = 'normal', source = 'local' }, --Inside Rear Cover
            { pageName = "9", type = 'normal', source = 'local' }, --Inside Rear Cover
            { pageName = "10", type = 'normal', source = 'local' }, --Inside Rear Cover
            { pageName = "11", type = 'normal', source = 'local' }, --Inside Rear Cover
            { pageName = "12", type = 'normal', source = 'local' }, --Inside Rear Cover
            { pageName = "13", type = 'normal', source = 'local' }, --Inside Rear Cover
            { pageName = "14", type = 'normal', source = 'local' }, --Inside Rear Cover
            { pageName = "15", type = 'normal', source = 'local' }, --Inside Rear Cover
            { pageName = "16", type = 'hard', source = 'local' }, --Inside Rear Cover
            { pageName = "backcover", type = 'hard', source = 'local' }, --Rear Cover
        },
      
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
    },
        
    },
    ['book2'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
            { pageName = "1", type = 'hard', source = 'local' }, --Inside Front Cover
            { pageName = "2", type = 'normal', source = 'local' }, --Page 2
            { pageName = "3", type = 'normal', source = 'local' }, --Page 2
            { pageName = "4", type = 'normal', source = 'local' }, --Page 3
            { pageName = "5", type = 'normal', source = 'local' }, --Page 3
            { pageName = "6", type = 'normal', source = 'local' }, --Page 5
            { pageName = "7", type = 'normal', source = 'local' }, --Inside Rear Cover
            { pageName = "8", type = 'normal', source = 'local' }, --Inside Rear Cover
            { pageName = "9", type = 'normal', source = 'local' }, --Inside Rear Cover
            { pageName = "10", type = 'normal', source = 'local' }, --Inside Rear Cover
            { pageName = "11", type = 'normal', source = 'local' }, --Inside Rear Cover
            { pageName = "12", type = 'normal', source = 'local' }, --Inside Rear Cover
            { pageName = "13", type = 'normal', source = 'local' }, --Inside Rear Cover
            { pageName = "14", type = 'normal', source = 'local' }, --Inside Rear Cover
            { pageName = "15", type = 'normal', source = 'local' }, --Inside Rear Cover
            { pageName = "16", type = 'normal', source = 'local' }, --Inside Rear Cover
            { pageName = "17", type = 'normal', source = 'local' }, --Inside Rear Cover
            { pageName = "18", type = 'normal', source = 'local' }, --Inside Rear Cover
            { pageName = "19", type = 'normal', source = 'local' }, --Inside Rear Cover
            { pageName = "20", type = 'hard', source = 'local' }, --Inside Rear Cover
            { pageName = "backcover", type = 'hard', source = 'local' }, --Rear Cover
        },
      
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
    },
        
    },

   

    ['sonsletter'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
            
        },
      
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
    },
        
    },

    ['lighthousesketch'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
           
        },
      
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
    },
        
    },
    
    
    ['oldsketch'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
           
        },
      
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
    },
        
    },
    ['treesketch'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
           
        },
      
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
    },
        
    },
    ['madman'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
           
        },
      
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
    },
        
    },

    ['crumpledposter'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
           
        },
      
        ['size'] = {
            ['width'] = 446, --page image width
            ['height'] = 794, --page image height
    },
        
    },
    ['minerletter'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
           
        },
      
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
    },
        
    },
    ['stampcollection'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
           
        },
      
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
        },   
    },
    ['marshallsletter'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
           
        },
      
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
        },   
    },
    ['womanphoto'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
           
        },
      
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
        },   
    },
    ['scornful'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
           
        },
      
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
        },   
    },
    ['campaignflyer'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
           
        },
      
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
        },   
    },
    ['goldenlady1'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
           
        },
      
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
        },   
    },
    ['goldenlady2'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
           
        },
      
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
        },   
    },
    ['goldenlady3'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
           
        },
      
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
        },   
    },
    ['goldenlady4'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
           
        },
      
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
        },   
    },
    ['goldenlady5'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
           
        },
      
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
        },   
    },
    ['defacedgoldenlady5'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
           
        },
      
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
        },   
    },
    ['defacedcampaignflyer'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
           
        },
      
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
        },   
    },
    ['clubcard'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
           
        },
      
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
        },   
    },
    ['tornpaper'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
           
        },
      
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
        },   
    },
    ['tornart'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
           
        },
      
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
        },   
    },
    ['stainedcard'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
           
        },
      
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
        },   
    },
    ['tradingcard1'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
           
        },
      
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
        },   
    },
    ['tradingcard2'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
           
        },
      
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
        },   
    },
    ['tradingcard3'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
           
        },
      
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
        },   
    },
    ['tradingcard4'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
           
        },
      
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
        },   
    },
    ['tradingcard5'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
           
        },
      
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
        },   
    },
    ['tradingcard6'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
           
        },
      
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
        },   
    },
    ['tradingcard7'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
           
        },
      
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
        },   
    },
    ['tradingcard8'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
           
        },
      
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
        },   
    },
    ['tradingcard9'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
           
        },
      
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
        },   
    },
    ['tradingcard10'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
           
        },
      
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
        },   
    },
    ['tradingcard11'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
           
        },
      
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
        },   
    },
    ['tradingcard12'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
           
        },
      
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
        },   
    },
    ['tradingcard13'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
           
        },
      
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
        },   
    },
    ['tradingcard14'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
           
        },
      
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
        },   
    },
    ['tradingcard15'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
           
        },
      
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
        },   
    },
    ['tradingcard16'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
           
        },
      
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
        },   
    },
    ['tradingcard17'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
           
        },
      
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
        },   
    },
    ['coloredfruits'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
           
        },
      
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
        },   
    },
    ['tornpaper2'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
           
        },
      
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
        },   
    },
    ['sketchbook'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
           
        },
      
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
        },   
    },
     ['politeplea'] = {
        ['pages'] = {
            { pageName = "cover", type = 'hard', source = 'local' }, --Front Cover
           
        },
      
        ['size'] = {
            ['width'] = 800, --page image width
            ['height'] = 600, --page image height
        },   
    },
    
}

