local RSGCore = exports['rsg-core']:GetCoreObject()

-- Door configuration
local doors = {
    {
        coords = vector3(2858.86279296875, -1194.91650390625, 47.9914436340332), -- Saint Denis Bookshelf
        model = GetHashKey("s_clothingcasedoor01x"),
        yawFrom = 94.99993896484375,
        yawTo = -174.60012817382812,
        isOpen = false,
        requiredItem = "skeleton_key",
        keyLabel = "Skeleton Key",
        name = "Open Booksehlf"
    },
    {
        coords = vector3(1326.0380859375, -1326.38330078125, 76.92235565185547), -- Rhodes Gunsmith
        model = GetHashKey("p_gunsmithtrapdoor01x"),
        rotation = {
            axis = "pitch", -- pitch for trapdoors
            from = 0.0,
            to = -89.89913177490234,
            fixed = 165.00001525878906 -- fixed yaw value
        },
        isOpen = false,
        requiredItem = "sawtooth_key",
        keyLabel = "Sawtooth Key",
        name = "Gunsmith Trapdoor"
    },
    {
        coords = vector3(-1790.7442626953125, -390.150390625, 159.28944396972656), --Strawberry General Store
        model = GetHashKey("p_trapdoor01x"),
        rotation = {
            axis = "pitch",
            from = 0.0,
            to = -90.0,
            fixed = 145.08792114257812
        },
        isOpen = false,
        keyLabel = "General Store",
        requiredItem = "forged_key",
        keyLabel = "Forged Key",
        name = "General Store Trapdoor"
    },
    {
        coords = vector3(1259.873779296875, -406.4928283691406, 96.62239837646484), -- Eris Field Ranch
        model = GetHashKey("p_gunsmithtrapdoor01x"),
        rotation = {
            axis = "pitch",
            from = 0.0,
            to = -90.0,
            fixed = 4.99995708465576
        },
        isOpen = false,
        requiredItem = "mansion_key",
        keyLabel = "Mansion Key",
        name = "Eris Field Trapdoor"
    }
}

-- Create prompts for each door
local doorPrompts = {}

-- Animation dictionary
local animDict = "mech_pickup@loot@cash_register@open"
local animName = "enter_short"

-- Function to load animation dictionary
function loadAnimDict(dict)
    while not HasAnimDictLoaded(dict) do
        RequestAnimDict(dict)
        Citizen.Wait(5)
    end
end

-- Create all prompts
local function CreateAllPrompts()
    for i, door in ipairs(doors) do
        local promptGroup = GetRandomIntInRange(0, 0xffffff)
        
        local prompt = Citizen.InvokeNative(0x04F97DE45A519419)
        PromptSetControlAction(prompt, 0xD8F73058) -- U key
        PromptSetText(prompt, CreateVarString(10, 'LITERAL_STRING', 'Use Key'))
        PromptSetEnabled(prompt, true)
        PromptSetVisible(prompt, true)
        PromptSetHoldMode(prompt, true)
        PromptSetGroup(prompt, promptGroup)
        PromptRegisterEnd(prompt)
        
        doorPrompts[i] = {
            prompt = prompt,
            group = promptGroup
        }
    end
end

-- Smooth rotation function
local function smoothRotate(entity, fromAngle, toAngle, setter)
    local delta = toAngle - fromAngle
    if delta > 180.0 then delta = delta - 360.0
    elseif delta < -180.0 then delta = delta + 360.0
    end
    
    local duration = 2000
    local t0 = GetGameTimer()
    
    Citizen.CreateThread(function()
        while true do
            local elapsed = GetGameTimer() - t0
            local t = math.min(elapsed / duration, 1.0)
            local angle = fromAngle + delta * t
            setter(entity, angle)
            if t >= 1.0 then break end
            Wait(0)
        end
    end)
end

-- Function to rotate door/trapdoor
local function RotateDoor(doorIndex)
    local door = doors[doorIndex]
    local ent = GetClosestObjectOfType(door.coords.x, door.coords.y, door.coords.z, 1.0, door.model, false, false, false)
    
    if ent == 0 then return end
    
    if door.rotation then -- Trapdoor
        local from, to = door.rotation.from, door.rotation.to
        if door.isOpen then from, to = door.rotation.to, door.rotation.from end
        
        if door.rotation.axis == "pitch" then
            smoothRotate(ent, from, to, function(e, a) 
                SetEntityRotation(e, a, 0.0, door.rotation.fixed, 2, true) 
            end)
        end
    else -- Regular door
        local from, to = door.yawFrom, door.yawTo
        if door.isOpen then from, to = door.yawTo, door.yawFrom end
        
        smoothRotate(ent, from, to, function(e, a) 
            SetEntityHeading(e, a) 
        end)
    end
    
    door.isOpen = not door.isOpen
    
    -- Play sound effect
    local soundId = GetSoundId()
    if door.isOpen then
        PlaySoundFrontend(soundId, "DOOR_OPEN", "RDRO_Poker_Sounds", true, 0, false)
    else
        PlaySoundFrontend(soundId, "DOOR_CLOSE", "RDRO_Poker_Sounds", true, 0, false)
    end
    ReleaseSoundId(soundId)
end

-- Check if player has the required key
local function HasRequiredKey(itemName)
    local hasItem = RSGCore.Functions.HasItem(itemName)
    return hasItem
end

-- Citizen thread for interaction
Citizen.CreateThread(function()
    CreateAllPrompts()
    
    while true do
        local sleep = 500
        local playerPed = PlayerPedId()
        local pos = GetEntityCoords(playerPed)
        local nearDoor = false
        
        for i, door in ipairs(doors) do
            local distance = #(pos - door.coords)
            
            if distance < 2.5 then
                nearDoor = true
                sleep = 0
                
                -- Show prompt
                PromptSetActiveGroupThisFrame(doorPrompts[i].group, CreateVarString(10, 'LITERAL_STRING', door.name))
                
                if PromptHasHoldModeCompleted(doorPrompts[i].prompt) then
                    -- Check if player has the key
                    if HasRequiredKey(door.requiredItem) then
                        -- Play animation
                        -- Play animation
loadAnimDict(animDict)
TaskPlayAnim(playerPed, animDict, animName, 8.0, 3.0, 1000, 1, 0, false, false, false)

Wait(1000)

-- Remove the key (server side)
TriggerServerEvent("RSGDoors:server:removeKey", door.requiredItem)

-- Open door for everyone
TriggerServerEvent("RSGDoors:server:syncDoor", i)

-- Notify player
RSGCore.Functions.Notify("Using " .. door.keyLabel .. " to open " .. door.name, "success")

                        
                        Wait(2000)
                    else
                        -- Notification for missing key
                        RSGCore.Functions.Notify("You need a " .. door.keyLabel .. " to open this", "error")
                        Wait(1000)
                    end
                end
            end
        end
        
        if not nearDoor and sleep < 500 then
            sleep = 500
        end
        
        Citizen.Wait(sleep)
    end
end)

-- Register network events
RegisterNetEvent("RSGDoors:client:rotateDoor")
AddEventHandler("RSGDoors:client:rotateDoor", function(doorIndex)
    RotateDoor(doorIndex)
end)

-- Debug command to list all required keys (for admins)
RegisterCommand("doorkeys", function()
    local playerData = RSGCore.Functions.GetPlayerData()
    
    if playerData.charinfo and playerData.charinfo.job and (playerData.charinfo.job == "admin" or playerData.charinfo.job == "developer") then
        RSGCore.Functions.Notify("Required keys:", "primary")
        for i, door in ipairs(doors) do
            RSGCore.Functions.Notify(door.name .. ": " .. door.requiredItem, "primary")
        end
    else
        RSGCore.Functions.Notify("You don't have permission to use this command", "error")
    end
end, false)