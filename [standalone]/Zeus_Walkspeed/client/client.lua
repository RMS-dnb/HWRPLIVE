local RSGCore = exports['rsg-core']:GetCoreObject()

-- ==============================
-- SPEED CONTROL SYSTEM
-- ==============================

local currentSpeed = nil
local isSpeedChanged = false

-- Normal Speed Handler
local function SetPlayerSpeed(speed)
    local playerPed = PlayerPedId()
    if speed then
        -- Sets walking speed multiplier
        SetPedMaxMoveBlendRatio(playerPed, speed)
    end
end

-- ==============================
-- MENU SYSTEM (RSG-MENU)
-- ==============================

local function WalkSpeedMenu()
    local walkSpeedMenu = {
        {
            header = "Change Walk Speed",
            txt = "Select a speed multiplier",
            isMenuHeader = true
        },
        { header = "Default Speed", txt = "Reset to normal", params = { event = "zeus_walkspeed:setSpeed", args = { speed = nil }}},
        { header = "Speed 0.2", txt = "Very Slow Walk", params = { event = "zeus_walkspeed:setSpeed", args = { speed = 0.2 }}},
        { header = "Speed 0.4", txt = "Slow Walk", params = { event = "zeus_walkspeed:setSpeed", args = { speed = 0.4 }}},
        { header = "Speed 0.6", txt = "Normal Walk", params = { event = "zeus_walkspeed:setSpeed", args = { speed = 0.6 }}},
        { header = "Speed 0.8", txt = "Fast Walk", params = { event = "zeus_walkspeed:setSpeed", args = { speed = 0.8 }}},
        { header = "Speed 1.0", txt = "Default (Normal)", params = { event = "zeus_walkspeed:setSpeed", args = { speed = 1.0 }}}
    }

    exports['rsg-menu']:openMenu(walkSpeedMenu)
end

-- ==============================
-- EVENT HANDLER
-- ==============================

RegisterNetEvent('zeus_walkspeed:setSpeed', function(data)
    local selectedSpeed = data.speed

    currentSpeed = selectedSpeed
    isSpeedChanged = true

    if currentSpeed then
        RSGCore.Functions.Notify("Walking speed set to: " .. tostring(currentSpeed), "success")
    else
        RSGCore.Functions.Notify("Walking speed reset to default", "success")
    end
end)

-- ==============================
-- MAIN CONTROL LOOP
-- ==============================

CreateThread(function()
    while true do
        Wait(0)
        if isSpeedChanged and currentSpeed then
            SetPlayerSpeed(currentSpeed)
        end
    end
end)

-- ==============================
-- COMMAND + KEYBIND
-- ==============================

RegisterCommand(Config.Command, function()
    if Config.OpenMenuWithCommand then
        WalkSpeedMenu()
    end
end, false)

CreateThread(function()
    while Config.OpenMenuWithKey do
        Wait(0)
        if IsControlJustPressed(0, Config.Key1) and IsControlJustPressed(0, Config.Key2) then
            WalkSpeedMenu()
        end
    end
end)


-- ==============================
-- COMMANDS
-- ==============================

-- Existing menu command
RegisterCommand(Config.Command, function()
    if Config.OpenMenuWithCommand then
        WalkSpeedMenu()
    end
end, false)

-- New /run command to reset walking speed
RegisterCommand("run", function()
    TriggerEvent("zeus_walkspeed:setSpeed", { speed = nil })
end, false)


-- ==============================
-- SPEED COMMANDS
-- ==============================

-- Very Slow Walk
RegisterCommand("walkslow", function()
    TriggerEvent("zeus_walkspeed:setSpeed", { speed = 0.2 })
end, false)

-- Slow Walk
RegisterCommand("walkslow2", function()
    TriggerEvent("zeus_walkspeed:setSpeed", { speed = 0.4 })
end, false)

-- Normal Walk
RegisterCommand("walknormal", function()
    TriggerEvent("zeus_walkspeed:setSpeed", { speed = 0.6 })
end, false)

-- Fast Walk
RegisterCommand("walkfast", function()
    TriggerEvent("zeus_walkspeed:setSpeed", { speed = 0.8 })
end, false)

-- Default Walk / Full Speed
RegisterCommand("walkdefault", function()
    TriggerEvent("zeus_walkspeed:setSpeed", { speed = nil })
end, false)

