Config = {}

Config.SlowWhenAim = true
Config.SlowWhenHipFire = true
Config.HowSlow = 0.7 -- The speed modifier of how slow you want to be when aiming or shooting, 1.0 is normal walking speed.
Config.HowLongAfterAim = 350 -- The time in milliseconds that the player will be slowed down after aiming or shooting.
Config.HowLongAfterHipFire = 250 -- The time in milliseconds that the player will be slowed down after hip firing.
Config.HowLongAfter1stPerson = 100 -- The time in milliseconds that the player will be slowed down after strafing in first person.
Config.Controls = { -- These are the controls  when in first 
    0x7065027D,
    0xB4E465B4,
    0x08BD758C,
    0x4D8FB4C1,
    0x78114AB3,
    0xD27782E3,
    0xFDA83190,
}
Config.SlowWhenArmedWith = {
    ["Melee weapons"] = false,
    ["Firearms"] = true,
    ["Explosives"] = false,
    ["Bow weapons"] = false,
    ["Throwable weapons"] = false,
    ["All"] = false, -- Meaning even if unarmed if you hold down Right Mouse Button you will be slowed down
}