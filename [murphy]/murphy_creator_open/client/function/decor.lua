DecorSettings = {
    interior = 78337,
    interior_sets = {
        "mp006_mshine_band2",
        -- "mp006_mshine_bar_benchAndFrame",
        -- "mp006_mshine_dressing_1",
        -- "mp006_mshine_hidden_door_open",
        -- "mp006_mshine_location1",
        -- "mp006_mshine_pic_02",
        -- "mp006_mshine_shelfwall1",
        -- "mp006_mshine_shelfwall2",
        -- "mp006_mshine_Still_02",
        -- "mp006_mshine_still_hatch",
        "mp006_mshine_theme_goth",
    },
    charselectcam = {
        coords = vector3(-2781.93, -3050.32, -11.65),
        target = vector3(-2781.13, -3053.62, -11.70),
        fov = 40.0,
    },
    pedslots = {
        [1] = {
            coords = vector3(-2780.148, -3058.581, -13.34043),
            heading = 0.0,
            scenariopoint = GetHashKey("PROP_HUMAN_SEAT_CHAIR_TABLE_DRINKING_MOONSHINE")
        },
        [2] = {
            coords = vector3(-2782.359, -3058.382, -13.34042),
            heading = -10.0,
            scenariopoint = GetHashKey("PROP_HUMAN_SEAT_CHAIR_TABLE_DRINKING_MOONSHINE")
        },
        [3] = {
            coords = vector3(-2779.928, -3055.968, -13.34043),
            heading = 95.82,
            scenario = GetHashKey("WORLD_HUMAN_SMOKE_NERVOUS_STRESSED")
        },
        [4] = {
            coords = vector3(-2780.274, -3053.504, -13.34042),
            heading = 41.82,
            scenario = GetHashKey("WORLD_HUMAN_LEAN_BACK_WALL_SMOKING"),
        },
        [5] = {
            coords = vector3(-2782.446, -3052.998, -13.34043),
            heading = 292.65,
            scenario = GetHashKey("WORLD_HUMAN_LEAN_WALL_LEFT"),
        },
        [6] = {
            coords =        vector3(-2784.195, -3061.677, -13.34044),
            heading = 337.10,
            scenario = GetHashKey("WORLD_HUMAN_BARTENDER_CLEAN_GLASS")
        },

    },
}


Citizen.CreateThread(function()
    for k, v in pairs(DecorSettings.interior_sets) do
        if not IsInteriorEntitySetActive(DecorSettings.interior, v) then
            ActivateInteriorEntitySet(DecorSettings.interior, v)
        end
    end
end)

AddEventHandler("onResourceStop", function(resource)
    if resource == GetCurrentResourceName() then
        for k, v in pairs(DecorSettings.interior_sets) do
            if IsInteriorEntitySetActive(DecorSettings.interior, v) then
                DeactivateInteriorEntitySet(DecorSettings.interior, v, true)
            end
        end
    end
end)
