Config = {}

-- Animation/Visual Effects for Knockout and Recovery
-- These are the animpostfx hashes, do not change it if you don't know what you're doing
-- CHANGE AT YOUR OWN RISK
Config.Effects = {
    KnockoutEffect = "OJDominoBlur",      -- Initial effect played during knockout
    TransitionEffect = "CameraTransitionFlash",    -- Effect for screen transition during knockout
    BlinkEffect = "CamTransitionBlinkSlow",        -- Blink effect for wake up
    WakeupEffect = "PlayerWakeUpKnockout"          -- Effect played when waking up
}

-- Knockout Settings
Config.KnockoutHealthThreshold = 30 -- Player health must be below or equal to this value to trigger knockout, 0 - 1000
Config.KnockoutTime = 10000           -- !! Must be increments of 500 !! Time in milliseconds that the player stays knocked out (15 seconds in this case)
Config.HealthPercentageAfterKnockout = 0.20 -- Health percentage to be set after knockout (40% of max health) 

Config.KnockoutRagdollType = 0 -- Type of ragdoll that will apply when the player is knocked out (1 the player tries to stay on his feet, 0 player falls down, Works better at 0)
Config.DrunkEffect = true -- If true, player wakes up while stumbling and drunk like.


Config.Hideui = true -- If true, hide ui while knocked out, toggle off if it interferes with your other scripts.
Config.HideuiAndDrunkTime = 8000 -- !! Must be increments of 500 !! Time in milliseconds that the player stays knocked out (15 seconds in this case)


Config.MeleeDamageModifierToggle = false -- If true, it allows for damage modifying
Config.MeleeDamageModifier = { -- If Config.DamageModifierToggle is set to true, you can alter every player's melee damage, it allows for shorter more interesting fights
    ["WEAPON_UNARMED"]      = 2.5,
    ["WEAPON_MELEE_HAMMER"] = 2.0,
}
-- Don't change the one below if you don't face any issues of inconsistency
Config.ModifierTime = 30000 -- How often the modifier is applied, in milliseconds (30 seconds) 

-- Disable Controls when player is knocked out, add to it if you want to disable more controls
Config.disableControls = true
Config.disableControlsWhileStillWakingUp = false -- If true, controls will be disabled while the player is still waking up
Config.disabledControls = { 
    0xB2F377E8, -- Attack / F
    0x07CE1E61, -- Melee Attack 1 / LMB
    0xF84FA74F, -- MOUSE2 / RMB
    0xCEE12B50, -- MOUSE3 / MMB / capslock
    0x8FFC75D6, -- Shift
    0xD9D0E1C0, -- SPACE (Jump)
    0xF3830D8E, -- J
    0x80F28E95, -- L
    0xDB096B85, -- CTRL
    0x3C0A40F2, -- Melee Block
    0xCF8A4ECA, -- ALT
    0x6D0D35E2, -- Reload
    0x7DA48D2A, -- X
    0xD8F73058, -- U
    0xC1989F95, -- I
    0x27D1C284, -- R
    0x171910DC, -- This and the ones below it are all tab
    0x171910DC, 
    0x85D24405,
    0xE6360A8E,
    0xB238FE0B,
    0xAC4BD4F1,
    0x938D4071,
    0x1C826362,
    0x4FD1C57B,
    0xE2B557A3,
    0x4CC0E2FE, -- This and the ones below it are all B
    0x5966D52A,
    0xD3ECF82F,
    0xEED15F18,
}