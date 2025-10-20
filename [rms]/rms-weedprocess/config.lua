Config = Config or {}
Config.Plants = {}

---------------------------------
-- npc settings
---------------------------------
Config.DistanceSpawn = 20.0

Config.FadeIn = true



---------------------------------
-- npc locations
---------------------------------
Config.NPCLocations = {
    { 
        name = 'Swamp Herb Processor',
        workerid = 'worker1',
        coords = vector3(1869.71, 582.68, 113.86),
        npcmodel = `u_m_m_valgenstoreowner_01`,
        npccoords = vector4(1869.71, 582.68, 113.86, 42.01),
		jobtype = 'process'
    },
    
  
}

-- settings

Config.ProcessTime    = 3000



