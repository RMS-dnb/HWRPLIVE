Config = {}


Config.framework = "rsg-core" --- "vorp" or "REDEMRP2k23" or "rsg-core"
Config.murphy_creator = true --- true if you use murphy_creator
Config.MenuCommand = "barbermenu" --- nil if you don't want a command to open the menu

Config.NativePrompt = true --- if you want to use a prompt to open the menu

Config.OverlayItem = "toilet" ---- Outfit item
Config.Overlayitems = {
    ["eyeliners"] = true,
    ["shadows"] = true,
    ["paintedmasks"] = true,
    ["blush"] = true,
    ["blush2"] = true,
    ["foundation"] = true,
    ["lipsticks"] = true,

    ["eyebrows"] = false,
    ["scars"] = false,
    ["scars2"] = false,
    ["scars3"] = false,
    ["acne"] = false,
    ["beardstabble"] = false,
    ["ageing"] = false,
    ["complex"] = false,
    ["disc"] = false,
    ["freckles"] = false,
    ["grime"] = false,
    ["hairstabble"] = false,
    ["moles"] = false,
    ["spots"] = false,

}


---- props to nil for Saint-Denis, Blackwater and Valentine Saloon, else please insert props information in order to make the menu works
--- three model possible: p_barberchair01x, p_barberchair02x, p_barberchair03x
Config.Shops = { 
    ["Saint-Denis Barber"] = {coords = vector3(2656.3066, -1181.0294, 53.2785), props = nil},
    ["Blackwater Barber"] = {coords = vector3(-815.4733, -1367.094, 42.75088), props = nil},
    ["Armadillo Barber"] = {coords = vector3(-3668.76, -2596.46, -13.58), props = nil},

    --["Rhodes Barber"] = {coords = vector3(1350.788, -1381.203, 83.28922), props = {model = "p_barberchair01x", rotation = {vector3(0.0, 0.0, 169.46511840820312)}}},
    ["Valentine Barber"] = {coords = vector3(-306.83, 813.54, 116.99), props = {model = "p_barberchair01x", rotation = {vector3(0.0, 0.0, -80.46511840820312)}}},
    --["Strawberry Barber"] = {coords = vector3(-1768.97, -373.48, 159.06), props = {model = "p_barberchair03x", rotation = {vector3(0.0, 0.0, 145.46511840820312)}}},
    ["Guarma Barber"] = {coords = vector3(1316.24, -6863.38, 49.73), props = nil},
}

Config.Price = {
    -- Male Head Categories
    ["hair"] = 1,
    ["hair_bonnet"] = 1,
    ["beard"] = 1,
    ["beards_complete"] = 1,
    ["beards_chin"] = 1,
    ["beards_mustache"] = 1,
    ["beards_chops"] = 1,

    ["eyeliners"] = 0.5,
    ["shadows"] = 0.5,
    ["paintedmasks"] = 0.5,
    ["blush"] = 0.5,
    ["blush2"] = 0.5,
    ["foundation"] = 0.5,
    ["lipsticks"] = 0.5,

    ["eyebrows"] = 0.5,
    ["scars"] = 0.5,
    ["scars2"] = 0.5,
    ["scars3"] = 0.5,
    ["acne"] = 0.5,
    ["beardstabble"] = 0.5,
    ["ageing"] = 0.5,
    ["complex"] = 0.5,
    ["disc"] = 0.5,
    ["freckles"] = 0.5,
    ["grime"] = 0.5,
    ["hairstabble"] = 0.5,
    ["moles"] = 0.5,
    ["spots"] = 0.5,
    
  
}