# Execute SQL File

Execute murphy_creator.sql and murphy_barber.sql in your database.



# REDEMRP Installation steps:
replace event for murphy_creator event,
replace this event,
```lua
RegisterNetEvent('redemrp_charselect:removeLoadingScreen', function()
    SendNUIMessage({
        loading = false
    })
    if not loadingscreenremoved then
        -- OpenCharacterMenu()
        loadingscreenremoved = true
    end
end)
```


# VORP Installation steps:
DEPENDENCIES: vorp_character
Replace this event in vorp_core\server\loadusers.lua
```lua
RegisterNetEvent('vorp:playerSpawn', function()
    local _source = source
    local identifier = GetPlayerIdentifierByType(_source, 'steam')

    if not identifier then
        return print("user cant load no identifier steam found")
    end

    local user = _users[identifier]
    if not user then
        return
    end

    user.Source(_source)
    TriggerClientEvent("murphy_creator:OpenCharSelect", _source)
    -- local numCharacters = user.Numofcharacters()

    -- if numCharacters <= 0 then
    --     return TriggerEvent("vorp_CreateNewCharacter", _source)
    -- else
    --     if tonumber(user._charperm) > 1 then
    --         return TriggerEvent("vorp_character:server:GoToSelectionMenu", _source)
    --     else
    --         return TriggerEvent("vorp_character:server:SpawnUniqueCharacter", _source)
    --     end
    -- end
end)
```

# RSG Installation steps:
DEPENDENCIES: rsg_appearance, rsg_core, rsg_creator
Edit this in resources\[framework]\rsg-multicharacter\client\main.lua
Line 7
```lua
CreateThread(function()
    while true do
        Wait(500)
        if NetworkIsSessionStarted() and PlayerPedId() ~= 0 and IsPedAPlayer(PlayerPedId()) then
            while not IsScreenFadedOut() and not IsScreenFadedIn() do
                Wait(100)
            end
            Wait(1000)
            TriggerServerEvent('murphy_creator:getCharacters')
            return
        end
    end
end)
```

# config.lua — Quick Configuration Guide

This file sets up the main options for your character creator resource.

---

## Config.framework

Specifies which framework to use.  
**Options:**  
- `'REDEMRP2k23'`
- `'rsg-core'`
- `'vorp'`

**Example:**
```lua
Config.framework = 'vorp'
```

## Config.murphy_clothing
Enable or disable integration with the murphy_clothing resource.

- true: Use murphy_clothing.
- false: Do not use murphy_clothing.
Example:
```lua
Config.murphy_clothing = true
```

## Config.MaxCharacterSlots
Sets the maximum number of character slots per permission group.

- base: Default slot count for all users.
- superadmin: Slot count for users with superadmin permission.
Example:
```lua
Config.MaxCharacterSlots = {
    base = 1,
    superadmin = 5,
}
```

# slots.lua — Quick Configuration Guide

This file manages character slot limits and ped model access permissions for your RedM character creator.

---

## Slots

Defines the maximum number of character slots available:

- **default**: The default slot limit for all users.
- **role**: Override the default for specific roles (e.g., `superadmin`, `admin`).
- **identifier**: Override both default and role for specific identifiers (e.g., Steam hex).

**Example:**
```lua
Slots = {
    default = 5,
    role = {
        superadmin = 5,
        admin = 5,
    },
    identifier = {
        ["steam:11000010c04648e"] = 5,
    }
}
```
## PedPermission
Controls access to ped models in the creator:

- default: Default access (true = allowed, false = denied).
- role: Override default for specific roles.
- identifier: Override both default and role for specific identifiers.
Example:
```lua
PedPermission = {
    default = true,
    role = {
        superadmin = true,
        admin = true,
    },
    identifier = {
        ["steam:11000010c04648e"] = true,
    }
}
```

# Configuration Guide — settings.lua

This file configures the character creation system for your RedM server. Below you will find explanations for each section and tips on how to customize them.

---

## 1. SpawnLocation

Defines the available spawn locations for new or existing characters.

- **id**: Unique identifier for the location.
- **name**: Display name of the location.
- **description**: Description shown in the UI.
- **coords**: Camera position (`vector3(x, y, z)`).
- **target**: Camera target point (`vector3(x, y, z)`).
- **fov**: Camera field of view (in degrees).
- **pedspawn**: Where the character will spawn (`vector3(x, y, z)`).
- **pedspawnheading**: Character heading (in degrees).

**Example:**
```lua
{
    id = 1,
    name = "Armadillo",
    description = "A dusty, battered town typical of the Wild West...",
    coords = vector3(-3646.41, -2619.23, -12.62),
    target = vector3(-3666.02, -2602.20, -12.79),
    fov = 70.0,
    pedspawn = vector3(-3647.277, -2618.289, -14.57223),
    pedspawnheading = 8.36,
}
```
Add or remove locations by copying or deleting entries in the SpawnLocation table.


## 2. HeightMax & HeightMin
Set the maximum and minimum allowed character height.
```lua
HeightMax = 1.05
HeightMin = 0.95
```

## 3. ExpressionsMaxValues
Defines the minimum and maximum values for each facial/body morph.
Edit these only if you want to restrict or expand customization options.

Example:
```lua
["Head_Width"] = {min = -1.0, max = 1.0},
```

## 4. ApparenceMenu
Configures the main appearance menu (height, body, waist, legs, upper).

- id: Unique identifier.
- name: Display name.
- totalAmount: Number of available options.
- selectorType: Type of selector (e.g., "slider").
- value: Default value.
Example:
```lua
{
    id = "height",
    name = "Height",
    totalAmount = 100,
    selectorType = "slider",
    value = 50
}
```

## 5. EditionElem
Defines the advanced face and body editing menu.

Each key (e.g., headshape, neck, brows, etc.) is a category.
- division: List of subcategories or sliders/matrices for each area.
- elements: Define sliders or matrices, their values, names, and ids.
- Example for neck width:
```lua
{
    id = "Neck_Width",
    type = "slider",
    leftValueName = "Narrow",
    rightValueName = "Wide",
    startValue = 50,
}
```
- Example for a matrix (2D slider):
```lua
{
    id = 1,
    type = "matrice",
    topValueName = "High",
    bottomValueName = "Low",
    leftValueName = "Narrow",
    rightValueName = "Wide",
    startPositionX = 0.5,
    startPositionY = 0.5,
    XHashes = "Jaw_Height",
    YHashes = "Jaw_Width"
}
```

## Tips
Add or remove spawn locations by editing the SpawnLocation table.
Adjust min/max values in ExpressionsMaxValues to control customization limits.
Add new categories in EditionElem for more detailed customization.
Follow the structure: Each entry must respect Lua syntax (commas, braces, etc.).

## Note
Changes take effect after restarting the script or server.
For new sliders or matrices, use the existing structure in EditionElem as a template.
Always make a backup before editing this file.