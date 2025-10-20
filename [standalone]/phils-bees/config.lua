Config = {}

Config.Lang = 'en'
Config.ApiaryItem = 'apiary_gk' -- Item to trigger barrel placement
Config.MaxApiaries = 5 -- Maximum number of barrels
Config.ApiaryRadius = 1 -- Radius for random spawn around player
Config.InteractDistance = 2.0 -- Distance for ox_target interaction
Config.BeeDistance = 10.0 -- Distance for bee particle effects

-- Materials needed for honey production
Config.Materials = {
    { item = 'apiary_bee_gk', amount = 1, label = 'Queen Bee' },
    

}

-- Production timer (in minutes)
Config.ProductionTime = 30 -- Time until honey is ready


Config.Apiaries = {
    { name = 'Barrel', hash = 1482434166, model = 'beehive' }
}


Config.BeeParticle = {
    group = 'core',
    name = 'ent_amb_insect_bee_swarm'
}


Config.Anim = {
    dict = 'amb_work@world_human_box_pickup@1@male_a@stand_exit_withprop',
    name = 'exit_front',
    duration = 2300,
    placingDict = 'amb_work@world_human_box_pickup@1@male_a@stand_exit_withprop',
    placingName = 'exit_front',
    placingDuration = 4000
}


Config.Rewards = {
    { item = 'apiary_honeycomb_gk', min = 6, max = 10, chance = 100 },
    
}


Config.Text = {
    collect = 'Collect honey',
    add_materials = 'Add Queen Bee',
    check_status = 'Check status',
    collected = 'Honey collected',
    empty = 'Beehive empty',
    beekeeper = 'Beekeeper',
    placed = 'You placed a barrel apiary!',
    no_materials = 'You need another queen bee!',
    materials_added = 'Materials added to makeshift beehive',
    not_ready = 'Honey is not ready yet',
    invalid_location = 'Cannot place beehive here',
    time_remaining = 'Time remaining: %s minutes'
}