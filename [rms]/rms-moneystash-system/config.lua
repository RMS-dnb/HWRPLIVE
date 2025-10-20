Config = {}


Config.Locations = {

	{coords = vector4(-223.76, 638.73, 113.12, 0.0 ), radius = 10.0, tier = "High", spawnAmount = 0} -- test spot val
	

}

-- Tier definitions for loot
Config.Tiers = {
    High = {
        Weapons = {
            'dollar'
        },
        AmmoBoxes = {
            'dollar'
        },
        Items = {
            'blood_dollar'
        }
    }
    
}



Config.SpawnInterval = 0 
Config.DropTimeout = 1800000  
Config.ZOffset = 0.0  
Config.DebugBlips = false 


Config.Weapons = {
    'dollar',
    'blood_dollar',
    
}

Config.AmmoBoxes = {
    'dollar',
    'blood_dollar',
    
    
}

Config.Items = {
    'dollar',
    'blood_dollar',
    
    
}


Config.PropMapping = {
    
    ['dollar'] = 'p_moneystack02x',
    ['cent'] = 'p_moneybaggen02x',
    --['bloodmoney'] = 'p_moneybaggen02x',   
}
