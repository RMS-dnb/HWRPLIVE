Config = {}

Config.MinimumDistance = 2.0 -- Minimum distance required to enable prompts for digging and picking up reward item

Config.Timeout = 2           -- Timeout (in minutes)

Config.ShowUsedNodePrompt = true    -- Show greyed out prompt on used nodes

-- Pre-spawned plants to check for. Leave blank to not have any prompts spawn on world objects.
Config.Plants = {
    
}

-- Default locations. Feel free to add more, just follow the existing template. Leave blank to not have any plants or prompts spawn.
Config.Locations = {
    -- Fully customized node (spawns in custom objects via coords)
    -- {
    --     name = "Tobacco Plant",                     -- Area name
    --     reward = "Indian_Tobbaco",                  -- Reward item database name
    --     plantModel = "s_indiantobacco01x",          -- Plant model to spawn (optional!)
    --     coords = vector3(2018.05, -880.44, 42.54),  -- Coordinates for plant model object
    --     timeout = 1,                                -- Custom timeout per node (optional, in minutes!)
    --     minReward = 1,                              -- Minimum reward per plant (optional, defaults to 1!)
    --     maxReward = 3                                -- Maximum reward per plant (optional, defaults to 1!)
    -- },
    -- Partially customized node (uses coords to create prompt, preferrably near existing world objects)
    -- Orchard Near Saint Denis --
    {
        name = "Orange",                        -- Area name
        reward = "orange",                           -- Reward item database name
        coords = vector3(2009.33, -882.96, 42.96)    -- Coordinates for dirt mounds/reward item objects
    },
    {
        name = "Orange",                        
        reward = "orange",                           
        coords = vector3(1999.68, -883.71, 42.91)
    },
    {
        name = "Orange",                        
        reward = "orange",                           
        coords = vector3(1989.15, -882.77, 42.36)
    },
    {
        name = "Orange",                        
        reward = "orange",                           
        coords = vector3(1981.92, -882.38, 42.4)
    },
    {
        name = "Orange",                        
        reward = "orange",                           
        coords = vector3(1971.59, -876.93, 42.03)
    },
    {
        name = "Orange",                        
        reward = "orange",                           
        coords = vector3(1981.15, -875.14, 42.45)
    },
    {
        name = "Orange",                        
        reward = "orange",                           
        coords = vector3(1987.82, -873.35, 42.68)
    },
    {
        name = "Orange",                        
        reward = "orange",                           
        coords = vector3(1999.6, -873.65, 42.42)
    },
    {
        name = "Orange",                        
        reward = "orange",                           
        coords = vector3(2009.29, -872.42, 42.34)
    },
    {
        name = "Orange",                        
        reward = "orange",                           
        coords = vector3(2018.73, -873.18, 42.77)
    },
    {
        name = "Orange",                        
        reward = "orange",                           
        coords = vector3(2036.01, -864.92, 42.6)
    },
    {
        name = "Orange",                        
        reward = "orange",                           
        coords = vector3(2027.38, -865.86, 42.56)
    },
    {
        name = "Orange",                        
        reward = "orange",                           
        coords = vector3(2018.2, -865.97, 42.6)
    },
    {
        name = "Orange",                        
        reward = "orange",                           
        coords = vector3(1960.38, -856.78, 42.12)
    },
    {
        name = "Orange",                        
        reward = "orange",                           
        coords = vector3(2008.23, -865.35, 42.86)
    },
    {
        name = "Orange",                        
        reward = "orange",                           
        coords = vector3(1999.31, -865.48, 42.89)
    },
    {
        name = "Orange",                        
        reward = "orange",                           
        coords = vector3(1989.77, -864.45, 42.47)
    },
    {
        name = "Orange",                        
        reward = "orange",                           
        coords = vector3(1979.89, -866.82, 41.85)
    },
    {
        name = "Orange",                        
        reward = "orange",                           
        coords = vector3(1970.7, -866.3, 41.55)
    },
    {
        name = "Orange",                        
        reward = "orange",                           
        coords = vector3(1962.55, -866.43, 41.71)
    },
    {
        name = "Orange",                        
        reward = "orange",                           
        coords = vector3(1970.33, -858.09, 41.96)
    },
    {
        name = "Apple",                       
        reward = "apple",                         
        coords = vector3(1979.69, -856.79, 41.93)
    },
    {
        name = "Apple",                       
        reward = "apple",                         
        coords = vector3(1987.9, -855.47, 42.38)
    },
    {
        name = "Apple",                       
        reward = "apple",                         
        coords = vector3(1997.71, -855.62, 42.69)
    },
    {
        name = "Apple",                       
        reward = "apple",                         
        coords = vector3(2007.12, -854.76, 42.8)
    },
    {
        name = "Apple",                       
        reward = "apple",                         
        coords = vector3(2017.02, -853.6, 42.81)
    },
    {
        name = "Apple",                       
        reward = "apple",                         
        coords = vector3(2026.87, -855.13, 42.57)
    },
    {
        name = "Apple",                       
        reward = "apple",                         
        coords = vector3(2036.59, -854.72, 42.4)
    },
    {
        name = "Apple",                       
        reward = "apple",                         
        coords = vector3(2036.57, -845.5, 42.8)
    },
    {
        name = "Apple",                       
        reward = "apple",                         
        coords = vector3(2027.04, -845.69, 43.03)
    },
    {
        name = "Apple",                       
        reward = "apple",                         
        coords = vector3(2017.53, -844.59, 43.14)
    },
    {
        name = "Apple",                       
        reward = "apple",                         
        coords = vector3(2007.35, -845.59, 42.92)
    },
    {
        name = "Apple",                       
        reward = "apple",                         
        coords = vector3(1998.93, -845.95, 42.65)
    },
    {
        name = "Lemon",                        
        reward = "lemon",                           
        coords = vector3(1988.51, -846.2, 42.32)
    },
    {
        name = "Lemon",                        
        reward = "lemon",                           
        coords = vector3(1979.88, -847.81, 42.1)
    },
    {
        name = "Lemon",                        
        reward = "lemon",                           
        coords = vector3(1970.52, -849.38, 41.86)
    },
    {
        name = "Lemon",                        
        reward = "lemon",                           
        coords = vector3(1961.45, -848.45, 41.9)
    },
    {
        name = "Lemon",                        
        reward = "lemon",                           
        coords = vector3(1987.28, -837.99, 42.13)
    },
    {
        name = "Lemon",                        
        reward = "lemon",                           
        coords = vector3(1996.8, -837.54, 42.28)
    },
    {
        name = "Lemon",                        
        reward = "lemon",                           
        coords = vector3(2006.63, -836.59, 42.44)
    },
    {
        name = "Lemon",                        
        reward = "lemon",                           
        coords = vector3(2016.89, -836.21, 42.86)
    },
    {
        name = "Lemon",                        
        reward = "lemon",                           
        coords = vector3(2026.19, -835.05, 42.73)
    },
    {
        name = "Lemon",                        
        reward = "lemon",                           
        coords = vector3(2035.89, -835.05, 42.55)
    },
    {
        name = "Lemon",                        
        reward = "lemon",                           
        coords = vector3(2027.24, -826.91, 42.32)
    },
    {
        name = "Lemon",                        
        reward = "lemon",                           
        coords = vector3(2007.3, -826.9, 42.26)
    },
    {
        name = "Lemon",                        
        reward = "lemon",                           
        coords = vector3(2017.68, -827.99, 42.33)
    },

    {
        name = "Pineapple",
        reward = "pineapple",
        coords = vector3(1602.71, -7059.18, 90.95)
        },
        {
        name = "Pineapple",
        reward = "pineapple",
        coords = vector3(1606.43, -7064.67, 91.37)
        },
        {
        name = "Pineapple",
        reward = "pineapple",
        coords = vector3(1612.25, -7069.61, 92.51)
        },
        {
        name = "Pineapple",
        reward = "pineapple",
        coords = vector3(1609.75, -7051.38, 91.57)
        },
        {
        name = "Pineapple",
        reward = "pineapple",
        coords = vector3(1595.95, -7059.87, 91.02)
        },
        {
        name = "Pineapple",
        reward = "pineapple",
        coords = vector3(1597.21, -7052.1, 91.16)
        },
        {
        name = "Pineapple",
        reward = "pineapple",
        coords = vector3(1584.8, -7055.42, 89.74)
        },
        {
        name = "Pineapple",
        reward = "pineapple",
        coords = vector3(1577.12, -7056.62, 87.71)
        },
        {
        name = "Pineapple",
        reward = "pineapple",
        coords = vector3(1573.79, -7069.76, 86.85)
        },
        {
        name = "Pineapple",
        reward = "pineapple",
        coords = vector3(1578.74, -7075.48, 87.52)
        },
        {
        name = "Pineapple",
        reward = "pineapple",
        coords = vector3(1590.5, -7086.58, 88.73)
        },
        {
        name = "Pineapple",
        reward = "pineapple",
        coords = vector3(1598.62, -7086.82, 89.42)
        },
        {
        name = "Pineapple",
        reward = "pineapple",
        coords = vector3(1618.21, -7078.77, 91.91)
        },
        {
        name = "Coconut",
        reward = "coconut",
        coords = vector3(948.94, -7146.96, 66.53)
        },
        {
        name = "Coconut",
        reward = "coconut",
        coords = vector3(940.07, -7173.8, 68.83)
        },
        {
        name = "Coconut",
        reward = "coconut",
        coords = vector3(919.83, -7171.03, 68.2)
        },
        {
        name = "Coconut",
        reward = "coconut",
        coords = vector3(918.17, -7162.04, 66.57)
        },
        {
        name = "Coconut",
        reward = "coconut",
        coords = vector3(916.72, -7158.16, 66.47)
        },
        {
        name = "Coconut",
        reward = "coconut",
        coords = vector3(920.68, -7148.56, 66.43)
        },
        {
        name = "Coconut",
        reward = "coconut",
        coords = vector3(918.66, -7144.79, 66.41)
        },
        {
        name = "Coconut",
        reward = "coconut",
        coords = vector3(922.85, -7139.45, 66.42)
        },
        {
        name = "Coconut",
        reward = "coconut",
        coords = vector3(927.28, -7142.15, 66.44)
        },
        {
        name = "Coconut",
        reward = "coconut",
        coords = vector3(931.4, -7141.83, 66.45)
        },
        {
        name = "Coconut",
        reward = "coconut",
        coords = vector3(934.73, -7139.07, 66.45)
        },
        {
        name = "Coconut",
        reward = "coconut",
        coords = vector3(937.65, -7138.94, 66.46)
        },
        {
        name = "Coconut",
        reward = "coconut",
        coords = vector3(941.16, -7133.7, 66.45)
        },

    -- Guarma --  
    {
        name = "Kiwi",                       
        reward = "kiwi",                         
        coords = vector3(1031.87, -7018.32, 42.59)
        },
        {
        name = "Kiwi",                       
        reward = "kiwi",                         
        coords = vector3(1026.74, -7028.01, 45.49)
        },
        {
        name = "Kiwi",                       
        reward = "kiwi",                         
        coords = vector3(1017.3, -7019.05, 44.4)
        },
        {
        name = "Kiwi",                       
        reward = "kiwi",                         
        coords = vector3(1015.97, -7023.11, 45.31)
        },
        {
        name = "Kiwi",                       
        reward = "kiwi",                         
        coords = vector3(1007.39, -7023.73, 46.25)
        },
        {
        name = "Kiwi",                       
        reward = "kiwi",                         
        coords = vector3(1003.51, -7026.2, 46.9)
        },
        {
        name = "Kiwi",                       
        reward = "kiwi",                         
        coords = vector3(1001.54, -7012.98, 44.94)
        },
        {name = "Kiwi",
        reward = "kiwi",
        coords = vector3(1031.06, -6993.24, 42.05)
        },
        {
        name = "Kiwi",
        reward = "kiwi",
        coords = vector3(1036.89, -6998.2, 42.12)
        },
        {
        name = "Kiwi",
        reward = "kiwi",
        coords = vector3(1029.44, -6998.01, 42.25)
        },
        {
        name = "Kiwi",
        reward = "kiwi",
        coords = vector3(1032.17, -7003.99, 42.48)
        },
        {
        name = "Kiwi",
        reward = "kiwi",
        coords = vector3(1036.22, -7006.3, 42.49)
        },
        {
        name = "Kiwi",
        reward = "kiwi",
        coords = vector3(1031.7, -7009.67, 42.65)
        },
        {
        name = "Kiwi",
        reward = "kiwi",
        coords = vector3(1035.65, -7009.94, 42.6)
        },
        {
        name = "Kiwi",
        reward = "kiwi",
        coords = vector3(1034.89, -7016.04, 42.63)
        },
    -- Braithwaite Orchard --
    {
        name = "Cherries",                       
        reward = "cherries",                         
        coords = vector3(1051.53, -1731.91, 46.81)
    },
    {
        name = "Cherries",                       
        reward = "cherries",                         
        coords = vector3(1050.98, -1741.04, 46.73)
    },
    {
        name = "Cherries",                       
        reward = "cherries",                         
        coords = vector3(1052.01, -1749.82, 46.81)
    },
    {
        name = "Cherries",                       
        reward = "cherries",                         
        coords = vector3(1051.53, -1758.96, 46.85)
    },
    {
        name = "Cherries",                       
        reward = "cherries",                         
        coords = vector3(1050.71, -1768.72, 46.87)
    },
    {
        name = "Cherries",                       
        reward = "cherries",                         
        coords = vector3(1051.72, -1778.53, 47.1)
    },
    {
        name = "Cherries",                       
        reward = "cherries",                         
        coords = vector3(1059.81, -1797.46, 48.32)
    },
    {
        name = "Cherries",                       
        reward = "cherries",                         
        coords = vector3(1059.52, -1788.41, 47.96)
    },
    {
        name = "Cherries",                       
        reward = "cherries",                         
        coords = vector3(1060.63, -1779.88, 47.77)
    },
    {
        name = "Cherries",                       
        reward = "cherries",                         
        coords = vector3(1059.94, -1769.92, 47.47)
    },
    {
        name = "Cherries",                       
        reward = "cherries",                         
        coords = vector3(1061.08, -1759.55, 47.42)
    },
    {
        name = "Cherries",                       
        reward = "cherries",                         
        coords = vector3(1060.7, -1750.92, 47.33)
    },
    {
        name = "Cherries",                       
        reward = "cherries",                         
        coords = vector3(1059.99, -1741.61, 47.22)
    },
    {
        name = "Cherries",                       
        reward = "cherries",                         
        coords = vector3(1059.63, -1733.98, 47.18)
    },
    {
        name = "Cherries",                       
        reward = "cherries",                         
        coords = vector3(1057.89, -1723.74, 47.22)
    },
    {
        name = "Peach",                        
        reward = "peach",                           
        coords = vector3(1069.0, -1713.32, 48.32)
    },
    {
        name = "Peach",                        
        reward = "peach",                           
        coords = vector3(1068.46, -1721.85, 48.2)
    },
    {
        name = "Peach",                        
        reward = "peach",                           
        coords = vector3(1069.36, -1731.84, 48.18)
    },
    {
        name = "Peach",                        
        reward = "peach",                           
        coords = vector3(1070.92, -1740.19, 48.28)
    },
    {
        name = "Peach",                        
        reward = "peach",                           
        coords = vector3(1069.19, -1748.79, 48.08)
    },
    {
        name = "Peach",                        
        reward = "peach",                           
        coords = vector3(1070.34, -1759.5, 48.21)
    },
    {
        name = "Peach",                        
        reward = "peach",                           
        coords = vector3(1068.87, -1767.7, 48.13)
    },
    {
        name = "Peach",                        
        reward = "peach",                           
        coords = vector3(1068.94, -1777.57, 48.32)
    },
    {
        name = "Peach",                        
        reward = "peach",                           
        coords = vector3(1068.3, -1786.75, 48.56)
    },
    {
        name = "Peach",                        
        reward = "peach",                           
        coords = vector3(1068.7, -1796.17, 48.91)
    },
    {
        name = "Peach",                        
        reward = "peach",                           
        coords = vector3(1069.08, -1806.43, 49.04)
    },
    {
        name = "Peach",                        
        reward = "peach",                           
        coords = vector3(1078.13, -1807.23, 48.87)
    },
    {
        name = "Peach",                        
        reward = "peach",                           
        coords = vector3(1077.29, -1797.22, 49.11)
    },
    {
        name = "Peach",                        
        reward = "peach",                           
        coords = vector3(1079.04, -1788.33, 49.21)
    },
    {
        name = "Peach",                        
        reward = "peach",                           
        coords = vector3(1078.82, -1778.4, 49.26)
    },
    {
        name = "Peach",                        
        reward = "peach",                           
        coords = vector3(1078.22, -1769.87, 49.06)
    },
    {
        name = "Peach",                        
        reward = "peach",                           
        coords = vector3(1078.52, -1759.52, 49.0)
    },
    {
        name = "Peach",                        
        reward = "peach",                           
        coords = vector3(1079.14, -1816.25, 48.57)
    },
    {
        name = "Plum",                        
        reward = "plum",                           
        coords = vector3(1088.54, -1816.66, 47.6)
    },
    {
        name = "Plum",                        
        reward = "plum",                           
        coords = vector3(1088.29, -1806.62, 48.18)
    },
    {
        name = "Plum",                        
        reward = "plum",                           
        coords = vector3(1088.46, -1797.53, 48.54)
    },
    {
        name = "Plum",                        
        reward = "plum",                           
        coords = vector3(1088.21, -1787.97, 48.92)
    },
    {
        name = "Plum",                        
        reward = "plum",                           
        coords = vector3(1087.5, -1778.22, 49.15)
    },
    {
        name = "Plum",                        
        reward = "plum",                           
        coords = vector3(1087.88, -1768.41, 49.37)
    },
    {
        name = "Plum",                        
        reward = "plum",                           
        coords = vector3(1087.74, -1759.34, 49.45)
    },
    {
        name = "Plum",                        
        reward = "plum",                           
        coords = vector3(1087.48, -1749.55, 49.61)
    },
    {
        name = "Plum",                        
        reward = "plum",                           
        coords = vector3(1086.87, -1740.6, 49.84)
    },
    {
        name = "Plum",                        
        reward = "plum",                           
        coords = vector3(1086.41, -1732.88, 49.92)
    },
    {
        name = "Plum",                        
        reward = "plum",                           
        coords = vector3(1078.05, -1749.62, 48.98)
    },
    {
        name = "Plum",                        
        reward = "plum",                           
        coords = vector3(1078.71, -1742.08, 49.0)
    },
    {
        name = "Plum",                        
        reward = "plum",                           
        coords = vector3(1079.07, -1732.6, 49.27)
    },
    {
        name = "Plum",                        
        reward = "plum",                           
        coords = vector3(1077.9, -1723.14, 49.25)
    },
    {
        name = "Plum",                        
        reward = "plum",                           
        coords = vector3(1078.42, -1712.51, 49.35)
    },
    {
        name = "Plum",                        
        reward = "plum",                           
        coords = vector3(1087.0, -1722.88, 50.05)
    },
-------- Caligas ------
    {
    name = "Apple",                       
    reward = "apple",                         
    coords = vector3(1768.56, -1322.75, 43.82)
    },
    {
    name = "Apple",                       
    reward = "apple",                         
    coords = vector3(1765.59, -1314.21, 44.08)
    },
    {
    name = "Apple",                       
    reward = "apple",                         
    coords = vector3(1758.56, -1318.52, 44.23)
    },
    {
    name = "Apple",                       
    reward = "apple",                         
    coords = vector3(1761.63, -1325.03, 44.35)
    },
-- New Austin --  
    {
    name = "Pomegranate",                       
    reward = "pomegranate",                         
    coords = vector3(-1880.71, -2883.58, 5.73)
    },
    {
    name = "Pomegranate",                       
    reward = "pomegranate",                         
    coords = vector3(-1884.44, -2878.74, 6.91)
    },
    {
    name = "Pomegranate",                       
    reward = "pomegranate",                         
    coords = vector3(-1889.85, -2893.41, 5.06)
    },
    {
    name = "Pomegranate",                       
    reward = "pomegranate",                         
    coords = vector3(-1873.78, -2867.67, 7.27)
    },
    {
    name = "Pomegranate",                       
    reward = "pomegranate",                         
    coords = vector3(-1880.34, -2904.55, 2.91)
    },
    {
    name = "Pomegranate",                       
    reward = "pomegranate",                         
    coords = vector3(-1878.61, -2911.52, 1.67)
    },
    {
    name = "Pomegranate",                       
    reward = "pomegranate",                         
    coords = vector3(-1849.66, -2909.5, 1.3)
    },
    {
    name = "Pomegranate",                       
    reward = "pomegranate",                         
    coords = vector3(-1843.01, -2915.64, -0.3)
    },
    {
    name = "Pomegranate",                       
    reward = "pomegranate",                         
    coords = vector3(-1835.26, -2910.55, -0.64)
    },
    {
    name = "Pomegranate",                       
    reward = "pomegranate",                         
    coords = vector3(-1858.68, -2929.49, 0.55)
    },
    {
    name = "Pomegranate",                       
    reward = "pomegranate",                         
    coords = vector3(-1861.47, -2930.21, 0.01)
    },
    {
    name = "Pomegranate",                       
    reward = "pomegranate",                         
    coords = vector3(-1851.81, -2935.91, -0.03)
    },
    {
    name = "Pomegranate",                       
    reward = "pomegranate",                         
    coords = vector3(-1814.44, -2928.42, -3.41)
    },
    {
    name = "Pomegranate",                       
    reward = "pomegranate",                         
    coords = vector3(-1810.06, -2923.83, -2.6)
    },
    {
    name = "Pomegranate",                       
    reward = "pomegranate",                         
    coords = vector3(-1805.22, -2931.87, -3.76)
    },
    {
    name = "Pomegranate",                       
    reward = "pomegranate",                         
    coords = vector3(-1801.92, -2930.8, -3.12)
    },
    {
    name = "Pomegranate",                       
    reward = "pomegranate",                         
    coords = vector3(-1798.22, -2924.63, -2.1)
    },
    {
    name = "Pomegranate",                       
    reward = "pomegranate",                         
    coords = vector3(-1788.74, -2918.15, -1.25)
    },
    {
    name = "Pomegranate",                       
    reward = "pomegranate",                         
    coords = vector3(-1808.41, -2893.67, -0.16)
    },
    {
    name = "Pomegranate",                       
    reward = "pomegranate",                         
    coords = vector3(-1806.87, -2889.02, 0.3)
    },
    {
    name = "Pomegranate",                       
    reward = "pomegranate",                         
    coords = vector3(-1812.18, -2858.02, 4.68)
    },
    {
    name = "Prickly Pear",                       
    reward = "prickly_pear",                         
    coords = vector3(-3550.18, -3298.2, 8.08)
    },
    {
    name = "Prickly Pear",                       
    reward = "prickly_pear",                         
    coords = vector3(-3536.51, -3268.21, 6.93)
    },
    {
    name = "Prickly Pear",                       
    reward = "prickly_pear",                         
    coords = vector3(-3414.68, -3336.18, 9.56)
    },
    {
    name = "Prickly Pear",                       
    reward = "prickly_pear",                         
    coords = vector3(-3413.51, -3332.25, 8.44)
    },
    {
    name = "Prickly Pear",                       
    reward = "prickly_pear",                         
    coords = vector3(-3411.11, -3329.6, 7.64)
    },
    {
    name = "Prickly Pear",                       
    reward = "prickly_pear",                         
    coords = vector3(-3406.86, -3332.42, 8.02)
    },
    {
    name = "Prickly Pear",                       
    reward = "prickly_pear",                         
    coords = vector3(-3409.97, -3337.12, 9.43)
    },
    {
    name = "Prickly Pear",                       
    reward = "prickly_pear",                         
    coords = vector3(-3407.34, -3340.19, 9.99)
    },
    {
    name = "Prickly Pear",                       
    reward = "prickly_pear",                         
    coords = vector3(-3399.74, -3336.4, 8.47)
    },
    {
    name = "Prickly Pear",                       
    reward = "prickly_pear",                         
    coords = vector3(-3396.74, -3334.01, 7.72)
    },
    {
    name = "Prickly Pear",                       
    reward = "prickly_pear",                         
    coords = vector3(-3398.63, -3328.56, 6.55)
    },
    {
    name = "Prickly Pear",                       
    reward = "prickly_pear",                         
    coords = vector3(-3392.12, -3327.5, 6.01)
    },
    {
    name = "Prickly Pear",                       
    reward = "prickly_pear",                         
    coords = vector3(-3386.19, -3331.29, 6.53)
    },
    {
    name = "Prickly Pear",                       
    reward = "prickly_pear",                         
    coords = vector3(-3385.27, -3338.87, 7.97)
    },
    {
    name = "Prickly Pear",                       
    reward = "prickly_pear",                         
    coords = vector3(-3387.87, -3348.15, 10.38)
    },
    {
    name = "Prickly Pear",                       
    reward = "prickly_pear",                         
    coords = vector3(-3392.47, -3356.01, 13.38)
    },
    {
    name = "Prickly Pear",                       
    reward = "prickly_pear",                         
    coords = vector3(-3396.35, -3362.77, 15.98)
    },
    {
    name = "Cactus Pulp",                       
    reward = "cactuspulp",                         
    coords = vector3(-4396.89, -2914.92, -17.04)
    },
    {
    name = "Cactus Pulp",                       
    reward = "cactuspulp",                         
    coords = vector3(-4391.82, -2906.49, -16.47)
    },
    {
    name = "Cactus Pulp",                       
    reward = "cactuspulp",                         
    coords = vector3(-4388.34, -2896.9, -16.02)
    },
    {
    name = "Cactus Pulp",                       
    reward = "cactuspulp",                         
    coords = vector3(-4410.99, -2879.43, -15.61)
    },
    {
    name = "Cactus Pulp",                       
    reward = "cactuspulp",                         
    coords = vector3(-4415.4, -2872.45, -15.56)
    },
    {
    name = "Cactus Pulp",                       
    reward = "cactuspulp",                         
    coords = vector3(-4443.47, -2869.69, -15.03)
    },
    {
    name = "Cactus Pulp",                       
    reward = "cactuspulp",                         
    coords = vector3(-4455.7, -2899.37, -16.02)
    },
    {
    name = "Cactus Pulp",                       
    reward = "cactuspulp",                         
    coords = vector3(-4449.63, -2911.12, -16.08)
    },
    {
    name = "Cactus Pulp",                       
    reward = "cactuspulp",                         
    coords = vector3(-4476.29, -2913.32, -15.32)
    },
    {
    name = "Cactus Pulp",                       
    reward = "cactuspulp",                         
    coords = vector3(-4479.06, -2952.29, -17.99)
    },
    {
    name = "Cactus Pulp",                       
    reward = "cactuspulp",                         
    coords = vector3(-4473.82, -2968.11, -16.6)
    },
    {
    name = "Cactus Pulp",                       
    reward = "cactuspulp",                         
    coords = vector3(-4477.29, -2980.81, -16.83)
    },
    {
    name = "Cactus Pulp",                       
    reward = "cactuspulp",                         
    coords = vector3(-4484.34, -2992.42, -16.26)
    },
    {
    name = "Cactus Pulp",                       
    reward = "cactuspulp",                         
    coords = vector3(-4475.2, -3001.44, -16.68)
    },
    {
    name = "Cactus Pulp",                       
    reward = "cactuspulp",                         
    coords = vector3(-4460.9, -3015.01, -16.18)
    },
    {
    name = "Cactus Pulp",                       
    reward = "cactuspulp",                         
    coords = vector3(-4421.08, -3019.12, -14.94)
    },
    {
        name = "Wormwood",                        
        reward = "wormwood",                           
        coords = vector3(2337.7, -29.34, 42.8)
    },
    {
        name = "Wormwood",                        
        reward = "wormwood",                           
        coords = vector3(2328.7, -34.25, 43.56)
    },
    {
        name = "Wormwood",                        
        reward = "wormwood",                           
        coords = vector3(2320.46, -32.18, 44.56)
    },
    {
        name = "Wormwood",                        
        reward = "wormwood",                           
        coords = vector3(2317.4, -38.13, 45.38)
    },
    {
        name = "Wormwood",                        
        reward = "wormwood",                           
        coords = vector3(2310.78, -40.17, 46.07)
    },
    {
        name = "Wormwood",                        
        reward = "wormwood",                           
        coords = vector3(2307.63, -46.47, 45.79)
    },
    {
        name = "Wormwood",                        
        reward = "wormwood",                           
        coords = vector3(2294.31, -33.22, 48.12)
    },
    {
        name = "Wormwood",                        
        reward = "wormwood",                           
        coords = vector3(2280.2, -20.06, 49.01)
    },
    {
        name = "Wormwood",                        
        reward = "wormwood",                           
        coords = vector3(2284.64, -10.31, 48.27)
    },
    {
        name = "Anise",                        
        reward = "anise",                           
        coords = vector3(1314.15, -2142.38, 55.59)
    },
    {
        name = "Anise",                        
        reward = "anise",                           
        coords = vector3(1310.82, -2145.85, 56.05)
    },
    {
        name = "Anise",                        
        reward = "anise",                           
        coords = vector3(1309.63, -2140.78, 56.26)
    },
    {
        name = "Anise",                        
        reward = "anise",                           
        coords = vector3(1301.93, -2137.16, 56.83)
    },
    {
        name = "Anise",                        
        reward = "anise",                           
        coords = vector3(1302.8, -2142.08, 57.26)
    },
    {
        name = "Anise",                        
        reward = "anise",                           
        coords = vector3(1302.3, -2147.59, 57.18)
    },
    {
        name = "Anise",                        
        reward = "anise",                           
        coords = vector3(1297.12, -2146.48, 58.04)
    },
    {
        name = "Anise",                        
        reward = "anise",                           
        coords = vector3(1290.73, -2149.91, 58.78)
    },
    {
        name = "Anise",                        
        reward = "anise",                           
        coords = vector3(1305.46, -2153.18, 56.32)
    },
    {
        name = "Fennel",                        
        reward = "fennel",                           
        coords = vector3(87.54, 531.21, 156.18)
    },
    {
        name = "Fennel",                        
        reward = "fennel",                           
        coords = vector3(98.85, 528.13, 156.8)
    },
    {
        name = "Fennel",                        
        reward = "fennel",                           
        coords = vector3(103.76, 528.34, 156.24)
    },
    {
        name = "Fennel",                        
        reward = "fennel",                           
        coords = vector3(106.49, 523.83, 156.26)
    },
    {
        name = "Fennel",                        
        reward = "fennel",                           
        coords = vector3(112.26, 521.57, 155.33)
    },
    {
        name = "Fennel",                        
        reward = "fennel",                           
        coords = vector3(94.68, 514.42, 158.16)
    },
    {
        name = "Fennel",                        
        reward = "fennel",                           
        coords = vector3(93.83, 496.24, 159.49)
    },
    {
        name = "Fennel",                        
        reward = "fennel",                           
        coords = vector3(94.79, 488.88, 159.74)
    },
    {
        name = "Fennel",                        
        reward = "fennel",                           
        coords = vector3(98.51, 482.56, 159.86)
    },
    {
        name = "Fennel",                        
        reward = "fennel",                           
        coords = vector3(104.04, 481.16, 159.8)
    },
    {
        name = "Fennel",                        
        reward = "fennel",                           
        coords = vector3(109.9, 481.82, 158.92)
    },
    --Strawberries
    {
        name = "Strawberry",
        reward = "strawberry",
        coords = vector3(-1729.37, -678, 151.15)
    },
    {
        name = "Strawberry",
        reward = "strawberry",
        coords = vector3(-1726.9, -675.85, 151.52)
    },
    {
        name = "Strawberry",
        reward = "strawberry",
        coords = vector3(-1723.2, -674.89, 152.16)
    },
    {
        name = "Strawberry",
        reward = "strawberry",
        coords = vector3(-1722.97, -681.07, 152.23)
    },
    {
        name = "Strawberry",
        reward = "strawberry",
        coords = vector3(-1728.27, -682.98, 151.24)
    },
    {
        name = "Strawberry",
        reward = "strawberry",
        coords = vector3(-1726.01, -683.68, 151.58)
    },
    {
        name = "Strawberry",
        reward = "strawberry",
        coords = vector3(-1722.94, -686.14, 151.94)
    },
    {
        name = "Strawberry",
        reward = "strawberry",
        coords = vector3(-1723.53, -689.92, 151.41)
    },
    {
        name = "Strawberry",
        reward = "strawberry",
        coords = vector3(-1717.27, -687.93, 152.94)
    },
    {
        name = "Strawberry",
        reward = "strawberry",
        coords = vector3(-1710.28, -681.94, 154.01)
    },
    {
        name = "Strawberry",
        reward = "strawberry",
        coords = vector3(-1706.74, -681, 153.66)
    },
    {
        name = "Strawberry",
        reward = "strawberry",
        coords = vector3(-1701.99, -684.92, 152.8)
    },
    {
        name = "Strawberry",
        reward = "strawberry",
        coords = vector3(-1698.56, -686.35, 152.19)
    },
    {
        name = "Strawberry",
        reward = "strawberry",
        coords = vector3(-1699.33, -688.77, 152.13)
    },
}

-- Language text for prompts
Config.Language = {
    PromptText = "Pick",
    PromptGroupName = "Plants"
}

-- Control actions for prompts
--Config.ControlAction = 0x6D1319BE -- R key
Config.ControlAction = 0x760A9C6F -- G key
