Config = {}

-- Settings
Config.Debug                    = false
Config.JobRequired              = 'medic'
Config.StorageMaxWeight         = 4000000
Config.StorageMaxSlots          = 48
Config.DeathTimer               = 500-- 300 = 5 mins / testing 60 = 1 min
Config.WipeInventoryOnRespawn   = false
Config.WipeCashOnRespawn        = false
Config.WipeBloodmoneyOnRespawn  = false
Config.MaxHealth                = 600
Config.MedicReviveTime          = 5000
Config.MedicTreatTime           = 5000
Config.AddGPSRoute              = true
Config.MedicCallDelay           = 360 -- delay in seconds before calling medic again
Config.BandageTime              = 10000
Config.BandageHealth            = 100
Config.ResetOutlawStatus        = false

-- Blip Settings
Config.Blip =
{
    blipName   = 'Medic', -- Config.Blip.blipName
    blipSprite = 'blip_shop_doctor', -- Config.Blip.blipSprite
    blipScale  = 0.2 -- Config.Blip.blipScale
}

-- Prompt Locations
Config.MedicJobLocations =
{
    {name = 'Saint Denis Medic', prompt = 'saintdmedic', coords = vector3(2731.25, -1226.89, 55.34 -0.8), showblip = true}, -- Saint Medic
    {name = 'Valentine Medic', prompt = 'valmedic', coords = vector3(-288.1316, 805.03735, 119.3858 -0.8), showblip = true}, -- Valentine
    {name = 'Blackwater Medic', prompt = 'blackwatermedic', coords = vector3(-785.6929, -1306.12, 43.8149 -0.8), showblip = true}, -- Blackwater
    {name = 'Armadillo Medic', prompt = 'armadillomedic', coords = vector3(-3737.73, -2640.13, -12.36 -0.8), showblip = true}, -- Armadillo
    {name = 'Fort Wallace Medic', prompt = 'fortwallacemedic', coords = vector3(310.96, 1494.33, 181.37), showblip = true}, -- Fort Wallace
}

-- Respawn Locations
Config.RespawnLocations =
{
    [1] = {coords = vector4(-242.69, 796.27, 121.16, 110.18)}, -- Valentine
    [2] = {coords = vector4(-733.28, -1242.97, 44.73, 87.64)}, -- Blackwater
    [3] = {coords = vector4(-1801.98, -366.95, 161.66, 236.04)}, -- Strawberry
    [4] = {coords = vector4(-3726.73, -2636.15, -13.72, 347.19)}, -- Armadillo
    [5] = {coords = vector4(-5436.5, -2930.96, 0.69, 182.25)}, -- Tumbleweed
    [6] = {coords = vector4(2725.33, -1067.42, 47.4, 168.42)}, -- Staint Denis
    [7] = {coords = vector4(1291.85, -1236.22, 80.93, 210.67)}, -- Rhodes
    [8] = {coords = vector4(3033.01, 433.82, 63.81, 65.9)}, -- Van Horn
    [9] = {coords = vector4(3016.71, 1345.64, 42.69, 67.85)}, -- Annesburg
    [10] = {coords = vector4(1384.9, -6936.57, 61.33, 145.13)} -- guarma
}

Config.MenuDoctors = {

    [1] = {
        job = 'strawprivatedoctor',
        label = 'Private Doctor',
        name = 'stprivatedoctor',
        StorageMaxWeight = 4000000,
        StorageMaxSlots = 48,
        coords = vec3(-1809.21, -433.61, 158.85),
        business = true,
    },
    [2] = {
        job = 'vhwilddoctor',
        label = 'Van Horn Wild Doctor',
        name = 'vhwilddoctor',
        StorageMaxWeight = 4000000,
        StorageMaxSlots = 48,
        coords = vec3(2788.64, 525.9, 71.68),
        business = false,
    },
    [3] = {
        job = 'vtwilddoctor',
        label = 'Valentine Wild Doctor',
        name = 'vtwilddoctor',
        StorageMaxWeight = 4000000,
        StorageMaxSlots = 48,
        coords = vec3(2523.31, 2286.21, 177.4),
        business = false,
    },
    [4] = {
        job = 'rdwilddoctor',
        label = 'Rhodes Wild Doctor',
        name = 'rdwilddoctor',
        StorageMaxWeight = 4000000,
        StorageMaxSlots = 48,
        coords = vec3(1304.7, -1309.89, 76.79),
        business = false,
    },
}