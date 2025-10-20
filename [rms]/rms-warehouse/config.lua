Config = {}

---------------------------------
-- npc settings
---------------------------------
Config.DistanceSpawn = 20.0
Config.FadeIn = true

Config.Blip = {
    blipName = 'Warehouse', -- Config.Blip.blipName
    blipSprite = 'blip_ambient_crate', -- Config.Blip.blipSprite
    blipScale = 0.2 -- Config.Blip.blipScale
}

Config.Warehouse = {

    {
        title       = 'Van Horn Warehouse',
        storagename = 'vanstore',
        coords      = vector3(3004.46, 563.24, 44.5),
        maxweight   = 5000000,
        slots       = 100,
        showblip    = true,
        npccoords   = vector4(3004.46, 563.24, 44.5, 171.08),
        npcmodel    = `a_m_m_blwlaborer_01`,
        joblocked   = false, -- Set to false for public access
        allowedjobs = {} -- Empty table means no job restriction
    },
    {
        title       = 'Valentine Warehouse',
        storagename = 'valstore',
        coords      = vector3(-234.05, 748.56, 117.8),
        maxweight   = 5000000,
        slots       = 100,
        showblip    = true,
        npccoords   = vector4(-234.05, 748.56, 117.8, 198.16),
        npcmodel    = `a_m_m_blwlaborer_01`,
        joblocked   = false,
        allowedjobs = {}
    },
    {
        title       = 'Blackwater Warehouse',
        storagename = 'blkstore',
        coords      = vector3(-908.39, -1344.78, 45.61),
        maxweight   = 5000000,
        slots       = 100,
        showblip    = true,
        npccoords   = vector4(-908.39, -1344.78, 45.61, 188.58),
        npcmodel    = `a_m_m_blwlaborer_01`,
        joblocked   = false, -- Job locked warehouse
        allowedjobs = {}
    },
    {
        title       = 'StDenis Warehouse',
        storagename = 'denstore',
        coords      = vector3(2651.38, -1450.29, 47.76),
        maxweight   = 5000000,
        slots       = 100,
        showblip    = true,
        npccoords   = vector4(2651.38, -1450.29, 47.76, 269.64),
        npcmodel    = `a_m_m_blwlaborer_01`,
        joblocked   = false,
        allowedjobs = {}
    },
    {
        title       = 'Rhodes Warehouse',
        storagename = 'rhostore',
        coords      = vector3(1419.47, -1321.15, 78.43),
        maxweight   = 5000000,
        slots       = 100,
        showblip    = true,
        npccoords   = vector4(1419.47, -1321.15, 78.43, 7.31),
        npcmodel    = `a_m_m_blwlaborer_01`,
        joblocked   = false, -- Job locked warehouse
        allowedjobs = {}
    },
    {
        title       = 'Annesburg Warehouse',
        storagename = 'annstore',
        coords      = vector3(2933.57, 1418.11, 45.74),
        maxweight   = 5000000,
        slots       = 100,
        showblip    = true,
        npccoords   = vector4(2933.57, 1418.11, 45.74, 339.89),
        npcmodel    = `a_m_m_blwlaborer_01`,
        joblocked   = false,
        allowedjobs = {}
    },
    {
        title       = 'Strawberry Warehouse',
        storagename = 'strstore',
        coords      = vector3(-1771.27, -432.08, 155.36),
        maxweight   = 5000000,
        slots       = 100,
        showblip    = true,
        npccoords   = vector4(-1771.27, -432.08, 155.36, 73),
        npcmodel    = `a_m_m_blwlaborer_01`,
        joblocked   = false, -- Job locked warehouse
        allowedjobs = {}
    },
    {
        title       = 'Armadillo Warehouse',
        storagename = 'armstore',
        coords      = vector3(-3689.09, -2563.56, -13.51),
        maxweight   = 5000000,
        slots       = 100,
        showblip    = true,
        npccoords   = vector4(-3689.09, -2563.56, -13.51, 180.35),
        npcmodel    = `a_m_m_blwlaborer_01`,
        joblocked   = false,
        allowedjobs = {}
    },
    {
        title       = 'Tumbleweed Warehouse',
        storagename = 'tumstore',
        coords      = vector3(-5500.1, -2958.82, -0.64),
        maxweight   = 5000000,
        slots       = 100,
        showblip    = true,
        npccoords   = vector4(-5500.1, -2958.82, -0.64, 16.73),
        npcmodel    = `a_m_m_blwlaborer_01`,
        joblocked   = false,
        allowedjobs = {}
    },
    {
        title       = 'Thieves Landing Warehouse',
        storagename = 'thievesstore',
        coords      = vector3(-1409.09, -2343.56, 43.04),
        maxweight   = 5000000,
        slots       = 100,
        showblip    = true,
        npccoords   = vector4(-1409.09, -2343.56, 43.04, 333.97),
        npcmodel    = `a_m_m_blwlaborer_01`,
        joblocked   = false,
        allowedjobs = {}
    },
    {
        title       = 'Guarma Warehouse',
        storagename = 'guarmastore',
        coords      = vector3(1301.89, -6827.05, 43.98),
        maxweight   = 5000000,
        slots       = 100,
        showblip    = true,
        npccoords   = vector4(1301.89, -6827.05, 43.98, 165.68),
        npcmodel    = `a_m_m_blwlaborer_01`,
        joblocked   = false,
        allowedjobs = {}
    },

    ----wild doctors
    {
        title       = 'Thieves Landing Warehouse',
        storagename = 'thievestore',
        coords      = vector3(-1401.944, -2295.403, 43.54113),
        maxweight   = 5000000,
        slots       = 100,
        showblip    = false,
        npccoords   = vector4(-1401.8, -2296.3, 43.51, 274.85),
        npcmodel    = `cs_vampire`,
        joblocked   = true, -- Job locked warehouse
        allowedjobs = {'wilddoctor'} -- Only criminal jobs can access
    },
    {
        title       = 'Witches Cauldron',
        storagename = 'witchstore',
        coords      = vector3(1185.6793, 2035.9155, 323.82641),
        maxweight   = 5000000,
        slots       = 100,
        showblip    = false,
        npccoords   = vector4(1186.16, 2036.02, 323.79, 126.6),
        npcmodel    = `cs_vampire`,
        joblocked   = true, -- Job locked warehouse
        allowedjobs = {'wilddoctor'} -- Only criminal jobs can access
    },
    {
        title       = 'Shady Warehouse',
        storagename = 'shadystore',
        coords      = vector3(1818.4624, -1842.684, 29.969182),
        maxweight   = 5000000,
        slots       = 100,
        showblip    = false,
        npccoords   = vector4(1818.41, -1842.67, 29.96, 310.29),
        npcmodel    = `cs_vampire`,
        joblocked   = true, -- Job locked warehouse
        allowedjobs = {'wilddoctor'} -- Only criminal jobs can access
    },
    {
        title       = 'Wapiti Warehouse',
        storagename = 'wapitistore',
        coords      = vector3(412.31, 2240.08, 254.58),
        maxweight   = 5000000,
        slots       = 100,
        showblip    = false,
        npccoords   = vector4(413.15, 2240.47, 254.5, 199.63),
        npcmodel    = `msp_native1_males_01`,
        joblocked   = true, -- Job locked warehouse
        allowedjobs = {'native'} -- Only criminal jobs can access
    },

}