Config = {}

-- General toggles
Config.debug = false

-- Streaming/performance
Config.StreamRadius = 120.0          -- radius to load client-side props
Config.DespawnRadius = 140.0         -- hysteresis: remove when beyond this range
Config.StreamCheckIntervalMs = 1500  -- how often to reevaluate streaming

-- Removal
Config.RemoveCommand = 'pickup'   -- client command name to remove nearby prop
Config.RemoveRadius = 2.5             -- max distance to target a prop for removal
Config.AllowOwnerOnlyRemoval = true   -- only owner can remove and get item back

-- Global limit across all placeables per player
Config.MaxItemsPerPlayer = 10

-- Placeable item definitions
-- Add entries: key is an identifier string you choose, used internally.
-- item: framework inventory item name to use
-- prop: model name (hash key) to spawn
-- maxPerPlayer: limit per character
Config.Placeables = {
    camp_chair = {
        item = 'camp_chair',
        prop = 'p_chair_10x',
        maxPerPlayer = 1
    },
    small_crate = {
        item = 'smallcrate',
        prop = 'p_crate03x',
        maxPerPlayer = 1
    },

    standingtorch = {
        item = 'standingtorch',
        prop = 'p_torchpostalwayson01x',
        maxPerPlayer = 1
    },
    simpletable = {
        item = 'simpletable',
        prop = 'p_table11x',
        maxPerPlayer = 1
    },
    pauperstable = {
        item = 'pauperstable',
        prop = 'p_cratetablemil01x',
        maxPerPlayer = 1
    },
    fancybench = {
        item = 'fancybench',
        prop = 'p_benchbear01x',
        maxPerPlayer = 1
    },
    fancychair = {
        item = 'fancychair',
        prop = 'p_chaircomfy11x',
        maxPerPlayer = 1
    },
    privatesign = {
        item = 'privatesign',
        prop = 'p_bra_cal_sgn_tress4a',
        maxPerPlayer = 1
    },
    barrel = {
        item = 'barrel',
        prop = 'p_winebarrel01x',
        maxPerPlayer = 1
    },
    shootingtarget = {
        item = 'shootingtarget',
        prop = 'p_target02x',
        maxPerPlayer = 1
    },
    archerytarget = {
        item = 'archerytarget',
        prop = 'p_targetarchery01x',
        maxPerPlayer = 1
    },
    weaponcrate = {
        item = 'weaponcrate',
        prop = 's_descrateweapons01x',
        maxPerPlayer = 1
    }
}


-- Gizmo defaults (can be overridden per use when calling the export)
Config.Gizmo = {
    EnableCam = true,
    MaxDistance = 30,
    MaxCamDistance = 40,
    MinY = -40,
    MaxY = 40,
    MovementSpeed = 0.15
}
