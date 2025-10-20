RSGShared = RSGShared or {}
RSGShared.ForceJobDefaultDutyAtLogin = false -- true: Force duty state to jobdefaultDuty | false: set duty state from database last saved
RSGShared.Jobs = {

    unemployed = {
        label = 'Civilian',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Freelancer', payment = 0 },
        },
    },
    native = {
        label = 'Native American',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Native', payment = 0 },
        },
    },
    nativecraftsman = {
        label = 'Native American Craftsman',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Craftsman', payment = 0 },
        },
    },
    comcraftsman = {
        label = 'Comanche Craftsman',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Craftsman', isboss = true, payment = 0 },
        },
    },
    twnativecraftsman = {
        label = 'Tumbleweed Native Craftsman',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Craftsman', isboss = true, payment = 0 },
        },
    },
    casino = {
        label = 'Casino',
        
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Bouncer', payment = 0 },
            ['1'] = { name = 'Bartender', payment = 0 },
            ['2'] = { name = 'Manager', isboss = true, payment = 0 },
            ['3'] = { name = 'Owner', isboss = true, payment = 0 },
        },
    },
    ranch1 = {
        label = 'MacFarlane Ranch',
        defaultDuty = false,
        offDutyPay = false,
        type = 'ranch',
        grades = {
            ['0'] = { name = 'Trainee', payment = 0 },
            ['1'] = { name = 'Rancher', payment = 0 },
            ['2'] = { name = 'Boss', isboss = true, payment = 0 },
        },
    },
    ranch2 = {
        label = 'Beechers Hope Ranch',
        defaultDuty = false,
        offDutyPay = false,
        type = 'ranch',
        grades = {
            ['0'] = { name = 'Trainee', payment = 0 },
            ['1'] = { name = 'Rancher', payment = 0 },
            ['2'] = { name = 'Boss', isboss = true, payment = 0 },
        },
    },
    ranch3 = {
        label = 'OilFields Ranch',
        defaultDuty = false,
        offDutyPay = false,
        type = 'ranch',
        grades = {
            ['0'] = { name = 'Trainee', payment = 0 },
            ['1'] = { name = 'Rancher', payment = 0 },
            ['2'] = { name = 'Boss', isboss = true, payment = 0 },
        },
    },
    ranch4 = {
        label = 'Kamassa Ranch',
        defaultDuty = false,
        offDutyPay = false,
        type = 'ranch',
        grades = {
            ['0'] = { name = 'Trainee', payment = 0 },
            ['1'] = { name = 'Rancher', payment = 0 },
            ['2'] = { name = 'Boss', isboss = true, payment = 0 },
        },
    },
    ranch5 = {
        label = 'Emerald Ranch',
        defaultDuty = false,
        offDutyPay = false,
        type = 'ranch',
        grades = {
            ['0'] = { name = 'Trainee', payment = 0 },
            ['1'] = { name = 'Rancher', payment = 0 },
            ['2'] = { name = 'Boss', isboss = true, payment = 0 },
        },
    },
    ranch6 = {
        label = 'Hanging Dog Ranch',
        defaultDuty = false,
        offDutyPay = false,
        type = 'ranch',
        grades = {
            ['0'] = { name = 'Trainee', payment = 0 },
            ['1'] = { name = 'Rancher', payment = 0 },
            ['2'] = { name = 'Boss', isboss = true, payment = 0 },
        },
    },
    ranch7 = {
        label = 'Rathskellar Ranch',
        defaultDuty = false,
        offDutyPay = false,
        type = 'ranch',
        grades = {
            ['0'] = { name = 'Trainee', payment = 0 },
            ['1'] = { name = 'Rancher', payment = 0 },
            ['2'] = { name = 'Boss', isboss = true, payment = 0 },
        },
    },
    taxi = {
        label = 'taxi',
        defaultDuty = true,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'taxi', isboss = true, payment = 0 },
            
        },
    },
    fightclub = {
        label = 'The Fight Club',
        type = 'saloon',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Bouncer', payment = 0 },
            ['1'] = { name = 'Bartender', payment = 0 },
            ['2'] = { name = 'Manager', isboss = true, payment = 0 },
            ['3'] = { name = 'Owner', isboss = true, payment = 0 },
        },
    },
    oilworker = {
        label = 'Oil Worker',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Greenhorn', payment = 0 },
            ['1'] = { name = 'Labourer', payment = 0 },
            ['2'] = { name = 'Manager', isboss = true, payment = 0 },
            ['3'] = { name = 'Owner', isboss = true, payment =  0},
        },
    },
    vhpawnshop = {
        label = 'Van Horn Pawnshop',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Worker', payment = 0 },
            ['1'] = { name = 'Manager', isboss = true, payment = 0 },
            
        },
    },
    twpawnshop = {
        label = 'Tumbleweed Pawnshop',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Worker', payment = 0 },
            ['1'] = { name = 'Manager', isboss = true, payment = 0 },
            
        },
    },
    -- vallaw = {
    --     label = 'Valentine Law Enforcement',
    --     type = 'leo',
    --     defaultDuty = false,
    --     offDutyPay = false,
    --     grades = {
    --         ['0'] = { name = 'AssistantDeputy', payment = 4 },
    --         ['1'] = { name = 'Deputy', payment = 7 },
    --         ['2'] = { name = 'SeniorDeputy', payment = 9 },
    --         ['3'] = { name = 'Sergeant', payment = 9 },
    --         ['4'] = { name = 'Lieutenant', payment = 10 },
    --         ['5'] = { name = 'Captain', payment = 12 },
    --         ['6'] = { name = 'Undersheriff', payment = 14 },
    --         ['7'] = { name = 'Sheriff', isboss = true, payment = 16 }, 
    --     },
    -- },
    -- rholaw = {
    --     label = 'Rhodes Law Enforcement',
    --     type = 'leo',
    --     defaultDuty = false,
    --     offDutyPay = false,
    --     grades = {
    --         ['0'] = { name = 'AssistantDeputy', payment = 4 },
    --         ['1'] = { name = 'Deputy', payment = 7 },
    --         ['2'] = { name = 'SeniorDeputy', payment = 9 },
    --         ['3'] = { name = 'Sergeant', payment = 9 },
    --         ['4'] = { name = 'Lieutenant', payment = 10 },
    --         ['5'] = { name = 'Captain', payment = 12 },
    --         ['6'] = { name = 'Undersheriff', payment = 14 },
    --         ['7'] = { name = 'Sheriff', isboss = true, payment = 16 },
    --     },
    -- },
    -- blklaw = {
    --     label = 'Blackwater Law Enforcement',
    --     type = 'leo',
    --     defaultDuty = false,
    --     offDutyPay = false,
    --     grades = {
    --         ['0'] = { name = 'AssistantDeputy', payment = 4 },
    --         ['1'] = { name = 'Deputy', payment = 7 },
    --         ['2'] = { name = 'SeniorDeputy', payment = 9 },
    --         ['3'] = { name = 'Sergeant', payment = 9 },
    --         ['4'] = { name = 'Lieutenant', payment = 10 },
    --         ['5'] = { name = 'Captain', payment = 12 },
    --         ['6'] = { name = 'Undersheriff', payment = 14 },
    --         ['7'] = { name = 'Sheriff', isboss = true, payment = 16 },
    --     },
    -- },
    -- strlaw = {
    --     label = 'Strawberry Law Enforcement',
    --     type = 'leo',
    --     defaultDuty = false,
    --     offDutyPay = false,
    --     grades = {
    --         ['0'] = { name = 'AssistantDeputy', payment = 4 },
    --         ['1'] = { name = 'Deputy', payment = 7 },
    --         ['2'] = { name = 'SeniorDeputy', payment = 9 },
    --         ['3'] = { name = 'Sergeant', payment = 9 },
    --         ['4'] = { name = 'Lieutenant', payment = 10 },
    --         ['5'] = { name = 'Captain', payment = 12 },
    --         ['6'] = { name = 'Undersheriff', payment = 14 },
    --         ['7'] = { name = 'Sheriff', isboss = true, payment = 16 },
    --     },
    -- },
    -- stdenlaw = {
    --     label = 'Saint Denis Law Enforcement',
    --     type = 'leo',
    --     defaultDuty = false,
    --     offDutyPay = false,
    --     grades = {
    --         ['0'] = { name = 'AssistantDeputy', payment = 4 },
    --         ['1'] = { name = 'Deputy', payment = 7 },
    --         ['2'] = { name = 'SeniorDeputy', payment = 9 },
    --         ['3'] = { name = 'Sergeant', payment = 9 },
    --         ['4'] = { name = 'Lieutenant', payment = 10 },
    --         ['5'] = { name = 'Captain', payment = 12 },
    --         ['6'] = { name = 'Undersheriff', payment = 14 },
    --         ['7'] = { name = 'Sheriff', isboss = true, payment = 16 },
    --     },
    -- },
    medic = {
        label = 'Medic',
        type = 'medic',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Trainee', payment = 6 },
            ['1'] = { name = 'Junior', payment = 6 },
            ['2'] = { name = 'Doctor',  payment = 8 },
            ['3'] = { name = 'Senior Doctor', isboss = true, payment = 8 },
            ['4'] = { name = 'Assistant Head', isboss = true, payment = 9 },
            ['5'] = { name = 'Head Doctor', isboss = true, payment = 9 },
            ['6'] = { name = 'Medical Director', isboss = true, payment = 9 },
        },
    },
    wilddoctor = {
        label = 'Wild Doctor',
        type = 'wildmedic',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Trainee', payment = 0 },
            ['1'] = { name = 'Junior', payment = 0 },
            ['2'] = { name = 'Wild Doctor',  payment = 0 },
            ['3'] = { name = 'Shaman', isboss = true, payment = 0 },
        },
    },
    vhwilddoctor = {
        label = 'Van Horn Wild Doctor',
        type = 'wilddoctor',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Trainee', payment = 0 },
            ['1'] = { name = 'Assistant', payment = 0 },
            ['2'] = { name = 'Wild Doctor', isboss = true, payment = 0 },
        },
    },
    vtwilddoctor = {
        label = 'Valentine Wild Doctor',
        type = 'wilddoctor',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Trainee', payment = 0 },
            ['1'] = { name = 'Assistant', payment = 0 },
            ['2'] = { name = 'Wild Doctor', isboss = true, payment = 0 },
        },
    },
    rdwilddoctor = {
        label = 'Rhodes Wild Doctor',
        type = 'wilddoctor',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Trainee', payment = 0 },
            ['1'] = { name = 'Assistant', payment = 0 },
            ['2'] = { name = 'Wild Doctor', isboss = true, payment = 0 },
        },
    },
    tipaniwilddoctor = {
        label = 'Tipani Medicine Person',
        type = 'wilddoctor',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Medicine Person', isboss = true, payment = 0 },
        },
    },
    comwilddoctor = {
        label = 'Comanche Medicine Person',
        type = 'wilddoctor',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Medicine Person', isboss = true, payment = 0 },
        },
    },
    twwilddoctor = {
        label = 'Tumbleweed Medicine Person',
        type = 'wilddoctor',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Medicine Person', isboss = true, payment = 0 },
        },
    },
    privatedoctor = {
        label = 'Private Doctor',
        type = 'privatedoctor',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Nurse', payment = 0 },
            ['1'] = { name = 'Doctor', payment = 0 },
            ['2'] = { name = 'Head Practitioner',  payment = 0 },
            
        },
    },
    strawprivatedoctor = {
        label = 'Private Doctor',
        type = 'privatedoctor',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Trainee', payment = 0 },
            ['1'] = { name = 'Assistant', payment = 0 },
            ['2'] = { name = 'Private Doctor',  payment = 0 },
            ['3'] = { name = 'Head of Clinic', isboss = true, payment = 0 },
            
        },
    },
    sdprivatedoctor = {
        label = 'Private Doctor',
        type = 'privatedoctor',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Trainee', payment = 0 },
            ['1'] = { name = 'Assistant', payment = 0 },
            ['2'] = { name = 'Private Doctor',  payment = 0 },
            ['3'] = { name = 'Head of Clinic', isboss = true, payment = 0 },
            
        },
    },
    valgunsmith = {
        label = 'Valentine Gunsmith',
        type = 'gunsmith',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 0 },
            ['1'] = { name = 'Gunsmith', payment = 0 },
            ['2'] = { name = 'Master Gunsmith', isboss = true, payment = 0 },
        },
    },
    vangunsmith = {
        label = 'Van Horn Gunsmith',
        type = 'gunsmith',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 0 },
            ['1'] = { name = 'Gunsmith', payment = 0 },
            ['2'] = { name = 'Master Gunsmith', isboss = true, payment = 0 },
        },
    },
    rhogunsmith = {
        label = 'Rhodes Gunsmith',
        type = 'gunsmith',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 0 },
            ['1'] = { name = 'Gunsmith', payment = 0 },
            ['2'] = { name = 'Master Gunsmith', isboss = true, payment = 0 },
        },
    },
    stdgunsmith = {
        label = 'StDenis Gunsmith',
        type = 'gunsmith',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 0 },
            ['1'] = { name = 'Gunsmith', payment = 0 },
            ['2'] = { name = 'Master Gunsmith', isboss = true, payment = 0 },
        },
    },
    tumgunsmith = {
        label = 'Tumbleweed Gunsmith',
        type = 'gunsmith',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 0 },
            ['1'] = { name = 'Gunsmith', payment = 0 },
            ['2'] = { name = 'Master Gunsmith', isboss = true, payment = 0 },
        },
    },
    anngunsmith = {
        label = 'Annesburg Gunsmith',
        type = 'gunsmith',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 0 },
            ['1'] = { name = 'Gunsmith', payment = 0 },
            ['2'] = { name = 'Master Gunsmith', isboss = true, payment = 0 },
        },
    },
    blkgunsmith = {
        label = 'Blackwater Gunsmith',
        type = 'gunsmith',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 0 },
            ['1'] = { name = 'Gunsmith', payment = 0 },
            ['2'] = { name = 'Master Gunsmith', isboss = true, payment = 0 },
        },
    },
    strawgunsmith = {
        label = 'Strawberry Gunsmith',
        type = 'gunsmith',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 0 },
            ['1'] = { name = 'Gunsmith', payment = 0 },
            ['2'] = { name = 'Master Gunsmith', isboss = true, payment = 0 },
        },
    },
    armagunsmith = {
        label = 'Armadillo Gunsmith',
        type = 'gunsmith',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 0 },
            ['1'] = { name = 'Gunsmith', payment = 0 },
            ['2'] = { name = 'Master Gunsmith', isboss = true, payment = 0 },
        },
    },
    armsaloon = {
        label = 'Armadillo Saloon',
        type = 'saloon',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 0 },
            ['1'] = { name = 'Tender', payment = 0 },
            ['2'] = { name = 'Manager', isboss = true, payment = 0 },
        },
    },
    elysian = {
        label = 'Elysian Hotel',
        type = 'saloon',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Bellhop', payment = 0 },
            ['1'] = { name = 'Desk Clerk', payment = 0 },
            ['2'] = { name = 'Manager', isboss = true, payment = 0 },
        },
    },
    annessaloon = {
        label = 'Annesburg Saloon',
        type = 'saloon',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 0 },
            ['1'] = { name = 'Tender', payment = 0 },
            ['2'] = { name = 'Manager', isboss = true, payment = 0 },
        },
    },
    strawsaloon = {
        label = 'Strawberry Saloon',
        type = 'saloon',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 0 },
            ['1'] = { name = 'Tender', payment = 0 },
            ['2'] = { name = 'Manager', isboss = true, payment = 0 },
        },
    },
    valblacksmith = {
        label = 'Valentine Blacksmith',
        type = 'blacksmith',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 0 },
            ['1'] = { name = 'Blacksmith', payment = 0 },
            ['2'] = { name = 'Master Blacksmith', isboss = true, payment = 0 },
        },
    },
    emerblacksmith = {
        label = 'Emerald Blacksmith',
        type = 'blacksmith',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 0 },
            ['1'] = { name = 'Blacksmith', payment = 0 },
            ['2'] = { name = 'Master Blacksmith', isboss = true, payment = 0 },
        },
    },
    blkblacksmith  = {
        label = 'Blackwater Blacksmith',
        type = 'blacksmith',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 0 },
            ['1'] = { name = 'Blacksmith', payment = 0 },
            ['2'] = { name = 'Master Blacksmith', isboss = true, payment = 0 },
        },
    },
    vanblacksmith = {
        label = 'Van-Horn Blacksmith',
        type = 'blacksmith',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 0 },
            ['1'] = { name = 'Blacksmith', payment = 0 },
            ['2'] = { name = 'Master Blacksmith', isboss = true, payment = 0 },
        },
    },
    stdblacksmith = {
        label = 'StDenis Blacksmith',
        type = 'blacksmith',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 0 },
            ['1'] = { name = 'Blacksmith', payment = 0 },
            ['2'] = { name = 'Master Blacksmith', isboss = true, payment = 0 },
        },
    },
    rhoblacksmith = {
        label = 'Rhodes Blacksmith',
        type = 'blacksmith',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 0 },
            ['1'] = { name = 'Blacksmith', payment = 0 },
            ['2'] = { name = 'Master Blacksmith', isboss = true, payment = 0 },
        },
    },

    armablacksmith = {
        label = 'Armadillo Blacksmith',
        type = 'blacksmith',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 0 },
            ['1'] = { name = 'Blacksmith', payment = 0 },
            ['2'] = { name = 'Master Blacksmith', isboss = true, payment = 0 },
        },
    },
    tumblacksmith = {
        label = 'Tumbleweed Blacksmith',
        type = 'blacksmith',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 0 },
            ['1'] = { name = 'Blacksmith', payment = 0 },
            ['2'] = { name = 'Master Blacksmith', isboss = true, payment = 0 },
        },
    },
    strblacksmith = {
        label = 'Strawberry Blacksmith',
        type = 'blacksmith',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 0 },
            ['1'] = { name = 'Blacksmith', payment = 0 },
            ['2'] = { name = 'Master Blacksmith', isboss = true, payment = 0 },
        },
    },
    macblacksmith = {
        label = 'MacFarlane Blacksmith',
        type = 'blacksmith',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 0 },
            ['1'] = { name = 'Blacksmith', payment = 0 },
            ['2'] = { name = 'Master Blacksmith', isboss = true, payment = 0 },
        },
    },
    valsaloon = {
        label = 'Valentine Saloon',
        type = 'saloon',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 0 },
            ['1'] = { name = 'Tender', payment = 0 },
            ['2'] = { name = 'Manager', isboss = true, payment = 0 },
        },
    },
    emeraldsaloon = {
        label = 'Emerald Saloon Saloon',
        type = 'saloon',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 0 },
            ['1'] = { name = 'Tender', payment = 0 },
            ['2'] = { name = 'Manager', isboss = true, payment = 0 },
        },
    },
    sdicecream = {
        label = 'Saint Denis Ice Cream Shop',
        type = 'saloon',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 0 },
            ['1'] = { name = 'Tender', payment = 0 },
            ['2'] = { name = 'Manager', isboss = true, payment = 0 },
        },
    },
    valcandy = {
        label = 'Valentine Candy Shop',
        type = 'saloon',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 0 },
            ['1'] = { name = 'Tender', payment = 0 },
            ['2'] = { name = 'Manager', isboss = true, payment = 0 },
        },
    },
    blasaloon = {
        label = 'Blackwater Saloon',
        type = 'saloon',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 0 },
            ['1'] = { name = 'Tender', payment = 0 },
            ['2'] = { name = 'Manager', isboss = true, payment = 0 },
        },
    },
    rhosaloon = {
        label = 'Rhodes Saloon',
        type = 'saloon',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 0 },
            ['1'] = { name = 'Tender', payment = 0 },
            ['2'] = { name = 'Manager', isboss = true, payment = 0 },
        },
    },
    doysaloon = {
        label = 'Doyles Tavern',
        type = 'saloon',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 0 },
            ['1'] = { name = 'Tender', payment = 0 },
            ['2'] = { name = 'Manager', isboss = true, payment = 0 },
        },
    },
    bassaloon = {
        label = 'Bastille Saloon',
        type = 'saloon',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 0 },
            ['1'] = { name = 'Tender', payment = 0 },
            ['2'] = { name = 'Manager', isboss = true, payment = 0 },
        },
    },
    tlsaloon = {
        label = 'The Landing Pub', --Thieve's Landing Saloon
        type = 'saloon',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 0 },
            ['1'] = { name = 'Tender', payment = 0 },
            ['2'] = { name = 'Manager', isboss = true, payment = 0 },
        },
    },
    oldsaloon = {
        label = 'Old Light Saloon',
        type = 'saloon',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 0 },
            ['1'] = { name = 'Tender', payment = 0 },
            ['2'] = { name = 'Manager', isboss = true, payment = 0 },
        },
    },
    tumsaloon = {
        label = 'Tumbleweed Saloon',
        type = 'saloon',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 0 },
            ['1'] = { name = 'Tender', payment = 0 },
            ['2'] = { name = 'Manager', isboss = true, payment = 0 },
        },
    },
    guarmasaloon = {
        label = 'Guarma Saloon',
        type = 'saloon',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 0 },
            ['1'] = { name = 'Tender', payment = 0 },
            ['2'] = { name = 'Manager', isboss = true, payment = 0 },
        },
    },
    bluemixologist = {
        label = 'Bluewater Marsh Mixologist',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Mixologist', isboss = true, payment = 0 },
        },
    },
    armbakery = {
        label = 'Armadillo Bakery',
        type = 'saloon',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 0 },
            ['1'] = { name = 'Tender', payment = 0 },
            ['2'] = { name = 'Manager', isboss = true, payment = 0 },
        },
    },
    cinema = {
        label = 'Projectionist',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Projectionist', payment =  0 },
        },
    },
    bwtobacco = {
        label = 'Blackwater Tobacco Co',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 0 },
            ['1'] = { name = 'Tender', payment = 0 },
            ['2'] = { name = 'Manager', isboss = true, payment = 0 },
        },
    },
    rhotobacco = {
        label = 'Rhodes Tobacco Co',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 0 },
            ['1'] = { name = 'Tender', payment = 0 },
            ['2'] = { name = 'Manager', isboss = true, payment = 0 },
        },
    },
    govenor1 = {
        label = 'Govenor New Hanover',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Govenor', payment = 0 },
        },
    },
    govenor2 = {
        label = 'Govenor West Elizabeth',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Govenor', payment = 0 },
        },
    },
    govenor3 = {
        label = 'Govenor New Austin',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Govenor', payment = 0 },
        },
    },
    govenor4 = {
        label = 'Govenor Ambarino',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Govenor', payment = 0 },
        },
    },
    govenor5 = {
        label = 'Govenor Lemoyne',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Govenor', payment = 0 },
        },
    },
    horsetrainer = {
        label = 'Trainer',
        type = 'horsetrainer',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 0 },
            ['1'] = { name = 'Tender', payment = 0 },
            ['2'] = { name = 'Manager', isboss = true, payment = 0 },
        },
    },

    valhorsetrainer = {
        label = 'Valentine Trainer',
        type = 'horsetrainer',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 0 },
            ['1'] = { name = 'Trainer', payment = 0 },
            ['2'] = { name = 'Manager', isboss = true, payment = 0 },
        },
    },
    strawhorsetrainer = {
        label = 'Strawberry Trainer',
        type = 'horsetrainer',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 0 },
            ['1'] = { name = 'Tender', payment = 0 },
            ['2'] = { name = 'Manager', isboss = true, payment = 0 },
        },
    },

    bwhorsetrainer = {
            label = 'Blackwater Trainer',
            type = 'horsetrainer',
            defaultDuty = false,
            offDutyPay = false,
            grades = {
                ['0'] = { name = 'Recruit', payment = 0 },
                ['1'] = { name = 'Trainer', payment = 0 },
                ['2'] = { name = 'Manager', isboss = true, payment = 0 },
            },
        },

    emeraldhorsetrainer = {
            label = 'Emerald Ranch Trainer',
            type = 'horsetrainer',
            defaultDuty = false,
            offDutyPay = false,
            grades = {
                ['0'] = { name = 'Recruit', payment = 0 },
                ['1'] = { name = 'Trainer', payment = 0 },
                ['2'] = { name = 'Manager', isboss = true, payment = 0 },
            },
        },

    armahorsetrainer = {
                label = 'Armadillo Trainer',
                type = 'horsetrainer',
                defaultDuty = false,
                offDutyPay = false,
                grades = {
                    ['0'] = { name = 'Recruit', payment = 0 },
                    ['1'] = { name = 'Trainer', payment = 0 },
                    ['2'] = { name = 'Manager', isboss = true, payment = 0 },
                },
            },

    rhodeshorsetrainer = {
            label = 'Rhodes Trainer',
            type = 'horsetrainer',
            defaultDuty = false,
            offDutyPay = false,
            grades = {
                ['0'] = { name = 'Recruit', payment = 0 },
                ['1'] = { name = 'Trainer', payment = 0 },
                ['2'] = { name = 'Manager', isboss = true, payment = 0 },
            },
        },
        macfarlaneshorsetrainer = {
            label = 'Macfarlanes Trainer',
            type = 'horsetrainer',
            defaultDuty = false,
            offDutyPay = false,
            grades = {
                ['0'] = { name = 'Recruit', payment = 0 },
                ['1'] = { name = 'Trainer', payment = 0 },
                ['2'] = { name = 'Manager', isboss = true, payment = 0 },
            },
        },
        wapitihorsetrainer = {
            label = 'Wapiti Trainer',
            type = 'horsetrainer',
            defaultDuty = false,
            offDutyPay = false,
            grades = {
                ['0'] = { name = 'Recruit', payment = 0 },
                ['1'] = { name = 'Trainer', payment = 0 },
                ['2'] = { name = 'Manager', isboss = true, payment = 0 },
            },
        },
    sdhorsetrainer = {
            label = 'Saint Denis Trainer',
            type = 'horsetrainer',
            defaultDuty = false,
            offDutyPay = false,
            grades = {
                ['0'] = { name = 'Recruit', payment = 0 },
                ['1'] = { name = 'Trainer', payment = 0 },
                ['2'] = { name = 'Manager', isboss = true, payment = 0 },
            },
        },

    vhhorsetrainer = {
            label = 'Van Horn Trainer',
            type = 'horsetrainer',
            defaultDuty = false,
            offDutyPay = false,
            grades = {
                ['0'] = { name = 'Recruit', payment = 0 },
                ['1'] = { name = 'Trainer', payment = 0 },
                ['2'] = { name = 'Manager', isboss = true, payment = 0 },
            },
        },
    tumhorsetrainer = {
            label = 'Tumbleweed Trainer',
            type = 'horsetrainer',
            defaultDuty = false,
            offDutyPay = false,
            grades = {
                ['0'] = { name = 'Recruit', payment = 0 },
                ['1'] = { name = 'Trainer', payment = 0 },
                ['2'] = { name = 'Manager', isboss = true, payment = 0 },
            },
        },
    oil_factory = {
        label = 'Oil Worker',
        type = 'oil_factory',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 0 },
            ['1'] = { name = 'Tender', payment = 0 },
            ['2'] = { name = 'Manager', isboss = true, payment = 0 },
        },
    },
    train = {
        label = 'Train',
        type = 'train',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment =  1 },
            ['1'] = { name = 'Tender', payment = 1 },
            ['2'] = { name = 'Manager', isboss = true, payment = 1 },
        },
    },
     -------speakeasy
     lemoynese = {
        label = 'Lemoyne Speakeasy',
        type = 'speakeasy',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 0 },
            ['1'] = { name = 'Staff', payment = 0 },
            ['2'] = { name = 'Sales', payment = 0 },
            ['3'] = { name = 'Brewer', payment = 0 },
            ['4'] = { name = 'Manager', isboss = true, payment = 0 },
        },
    },
    cattailse = {
        label = 'Cattail Pond Speakeasy',
        type = 'speakeasy',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 0 },
            ['1'] = { name = 'Staff', payment = 0 },
            ['2'] = { name = 'Sales', payment = 0 },
            ['3'] = { name = 'Brewer', payment = 0 },
            ['4'] = { name = 'Manager', isboss = true, payment = 0 },
        },
    },
    newaustinse = {
        label = 'New Austin Speakeasy',
        type = 'speakeasy',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 0 },
            ['1'] = { name = 'Staff', payment = 0 },
            ['2'] = { name = 'Sales', payment = 0 },
            ['3'] = { name = 'Brewer', payment = 0 },
            ['4'] = { name = 'Manager', isboss = true, payment = 0 },
        },
    },
    hanoverse = {
        label = 'Hanover Speakeasy',
        type = 'speakeasy',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 0 },
            ['1'] = { name = 'Staff', payment = 0 },
            ['2'] = { name = 'Sales', payment = 0 },
            ['3'] = { name = 'Brewer', payment = 0 },
            ['4'] = { name = 'Manager', isboss = true, payment = 0 },
        },
    },
    manzanitase = {
        label = 'Manzanita Post Speakeasy',
        type = 'speakeasy',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Recruit', payment = 0 },
            ['1'] = { name = 'Staff', payment = 0 },
            ['2'] = { name = 'Sales', payment = 0 },
            ['3'] = { name = 'Brewer', payment = 0 },
            ['4'] = { name = 'Manager', isboss = true, payment = 0 },
        },
    },
    graverose = {
        label = 'The Grave Rose',
        type = 'saloon',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'security', payment = 0 },
            ['1'] = { name = 'bartender', payment = 0 },
            ['2'] = { name = 'generalmanager', payment = 0 },
            ['3'] = { name = 'Owner', isboss = true, payment = 0 },
        },
    },


    ----law
    usms = {
        label = 'United States Marshal Service',
        type = 'leo',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'deputymarshal', payment = 7 },
            ['1'] = { name = 'usmarshal', payment = 7 },
            ['2'] = { name = 'deputydirectorusms', isboss = true, payment = 7 },
            ['3'] = { name = 'directorusms', isboss = true, payment = 8 },
            ['4'] = { name = 'chiefjustice', isboss = true, payment = 8 },
        },
    },
    naso = {
        label = 'Western Rangers Office',
        type = 'leo',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'AssistantDeputy', payment = 6 },
            ['1'] = { name = 'Deputy', payment = 7 },
            ['2'] = { name = 'Corporal', payment = 7},
            ['3'] = { name = 'Sergeant', payment = 7 },
            ['4'] = { name = 'Lieutenant', isboss = true, payment = 8 },
            ['5'] = { name = 'Captain', isboss = true, payment = 9 },
            ['6'] = { name = 'Undersheriff', isboss = true, payment = 9 },
            ['7'] = { name = 'Sheriff', isboss = true, payment = 9 },
        },
    },
    nhso = {
        label = 'Eastern Sheriffs Office',
        type = 'leo',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'AssistantDeputy', payment = 6 },
            ['1'] = { name = 'Deputy', payment = 7 },
            ['2'] = { name = 'Corporal', payment = 7 },
            ['3'] = { name = 'Sergeant', payment = 7 },
            ['4'] = { name = 'Lieutenant', isboss = true, payment = 8 },
            ['5'] = { name = 'Captain', isboss = true, payment = 9 },
            ['6'] = { name = 'Undersheriff', isboss = true, payment = 9 },
            ['7'] = { name = 'Sheriff', isboss = true, payment = 9 },
        },
    },
    lso = {
        label = 'Lemoyne Sheriffs Office',
        type = 'leo',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'AssistantDeputy', payment = 6 },
            ['1'] = { name = 'Deputy', payment = 7 },
            ['2'] = { name = 'Corporal', payment = 7 },
            ['3'] = { name = 'Sergeant', payment = 7 },
            ['4'] = { name = 'Lieutenant', isboss = true, payment = 8 },
            ['5'] = { name = 'Captain', isboss = true, payment = 9 },
            ['6'] = { name = 'Undersheriff', isboss = true, payment = 9 },
            ['7'] = { name = 'Sheriff', isboss = true, payment = 9 },
        },
    },
    doj = {
        label = 'Department of Justice',
        type = 'leo',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'courtclerk', isboss = true, payment = 7 },
            ['1'] = { name = 'assistantdistrictattorney', payment = 7 },
            ['2'] = { name = 'districtattorney', payment = 7 },
            ['3'] = { name = 'attorneygeneral', isboss = true, payment = 8 },
            ['4'] = { name = 'districtjudge', payment = 8 },
            ['5'] = { name = 'chiefjustice', isboss = true, payment = 8 },
        },
    },
    lawyer = {
        label = 'Law Firm',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'paralegal', payment = 2 },
            ['1'] = { name = 'Private Attorney', payment = 2 },
        },
    },

    reporter = {
        label = 'Reporter',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Junior Reporter', payment = 2 },
            ['1'] = { name = 'Senior Reporter', payment = 2 },
        },
    },

    undertaker = {
        label = 'Undertaker',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Undertaker', payment = 0 },
            ['1'] = { name = 'Undertaker Boss', payment = 0 },
        },
    },

    stdundertaker = {                                               -- Saint Denis Under Taker
        label = 'Undertaker',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Undertaker', payment = 0 },
            ['1'] = { name = 'Undertaker Boss', payment = 0 },
        },
    },
    
    valherbalist = {                                               -- Val Herbalist
        label = 'Herbalist',
        defaultDuty = false,
        offDutyPay = false,
        grades = {
            ['0'] = { name = 'Apprentice', payment = 0 },
            ['1'] = { name = 'Master Herbalist', isboss = true, payment = 0 },
        },
    },


}
