--       ___          ___          ___
--      /\  \        /\  \        /\  \
--     /::\  \      /::\  \      /::\  \
--    /:/\:\  \    /:/\:\  \    /:/\ \  \
--   /::\~\:\__\  /:/  \:\  \  _\:\~\ \  \
--  /:/\:\ \:|__|/:/__/_\:\__\/\ \:\ \ \__\
--  \:\~\:\/:/  /\:\  /\ \/__/\:\ \:\ \/__/
--   \:\ \::/  /  \:\ \:\__\   \:\ \:\__\
--    \:\/:/  /    \:\/:/  /    \:\/:/  /
--     \::/  /      \::/  /      \::/  /
--      \/__/        \/__/        \/__/

-- BGS Chess
-- Author: Snapopotamus
-- © 2024
-- A chess game system for RedM servers.
-- Compatible with RSGCore and VORPCore.

---------------------------------------------------------------------------------------------

Config = {}

-- Will allow you to spawn the tables by restarting the script.
Config.Debug = true

-- Framework choice
Config.UseVORP = false
Config.UseRSG = false
Config.UseRedEM = false
Config.UseCustomFramework = true

-- Table config options (table model, chair model, table decoration model)
Config.TableModel = "p_table47x"
Config.ChairModel = "s_chair04x"

-- Marker color and opacity for valid moves
Config.MarkerRed = 60
Config.MarkerGreen = 179
Config.MarkerBlue = 113
Config.MarkerOpacity = 255

-- Prompt/notification language options
Config.Language = {
	-- Piece names
	["Pawn"] = "Pawn",
	["Rook"] = "Rook",
	["Knight"] = "Knight",
	["Bishop"] = "Bishop",
	["Queen"] = "Queen",
	["King"] = "King",

	-- Prompt labels
	PromptLabel = "Chess",
	CastlePromptLabel = "King Castles with Rook",
	PromotePromptLabel = "Promote to",

	-- Prompt texts
	TablePromptText = "Play Chess",
	StartPromptText = "Start",
	LeaveTablePromptText = "Leave",
	SelectPromptText = "Select",
	PlacePromptText = "Place",
	CancelPromptText = "Cancel",
	ConfirmPromptText = "Confirm",
	PromoteSwapPromptText = "Switch Piece",
	CamChangePromptText = "Camera",
	ToText = "to",

	-- Notifications
	GameStarted = "Game started",
	GameEnded = "Game over",
	PlayerLeftSub = "Other player left",
	Check = "Check",
	Checkmate = "Checkmate",
	CheckSub = "Your opponent is in check",
	InCheckSub = "You are in check",
	Winner = "You win",
	Loser = "You lose",
}

Config.PromptKeys = {
    Table = "INPUT_MULTIPLAYER_INFO",      -- Z key
    Start = "INPUT_MULTIPLAYER_INFO",      -- Z key
    LeaveTable = "INPUT_FRONTEND_LB",      -- (leave as is unless you want to change it)
    SelectPlace = "INPUT_CONTEXT_RT",
    Cancel = "INPUT_CONTEXT_LT",
    Promote = "INPUT_CURSOR_SCROLL_DOWN",
    CamChange = "INPUT_NEXT_CAMERA",
}


-- Where to spawn tables.
-- Coords MUST be put in a table, like the examples below.
Config.TableCoords = {
	[1] = { coords = vec3(2543.88, -1202.40, 52.30006408691406) },
	[2] = { coords = vec3(2544.025390625, -1205.9697265625, 52.31028366088867) },
	[3] = { coords = vector3(2884.82, -1410.93, 42.35) },
	[4] = { coords = vector3(2880.55, -1416.04, 42.35) },
	[5] = { coords = vector3(2701.2, -1291.42, 48.62) },
	[6] = { coords = vector3(3339.57, -687.37, 42.97) },
	[7] = { coords = vector3(1340.87, -1379.62, 79.49) },
	[8] = { coords = vector3(-303.96, 804.67, 117.99) },
	[9] = { coords = vector3(-811.09, -1324.75, 42.69) },
	[10] = { coords = vector3(-736.41, -1249.31, 43.74) },
	[11] = { coords = vector3(-738.79, -1249.95, 43.74) },
	[12] = { coords = vector3(-3705.11, -2591.73, -14.31) },
	[13] = { coords = vector3(-5513.04, -2912.54, -2.74) },
	[14] = { coords = vector3(2919.66, 532.64, 37.09) },
	[15] = { coords = vector3(2949.23, 544.68, 43.73) },

}

-- Rotation for the tables that are spawned. Should match the indexes above.
-- ONLY THE Z AXIS IS USED, other axes will cause issues with piece placement.
Config.TableRotation = {
	[1] = vec3(0, 0, 0),
	[2] = vec3(0, 0, 45),
	[3] = vec3(0, 0, -40),
	[4] = vec3(0, 0, -40),
	[5] = vec3(0, 0, 25),
	[6] = vec3(0, 0, 25),
	[7] = vec3(0, 0, -15),
	[8] = vec3(0, 0, -75),
	[9] = vec3(0, 0, -85),
	[10] = vec3(0, 0, -85),
	[11] = vec3(0, 0, -85),
	[12] = vec3(0, 0, -25),
	[13] = vec3(0, 0, -55),
	[14] = vec3(0, 0, -95),
	[15] = vec3(0, 0, -95),
}

----------------------------------------------########################################----------------------------------------------
----------------------------------------------########################################----------------------------------------------
----------------------------------------------=====CUSTOM FRAMEWORK FUNCTIONALITY=====----------------------------------------------
----------------------------------------------########################################----------------------------------------------
----------------------------------------------########################################----------------------------------------------
-- If you are not using a custom framework, leave these functions as they are.
-- Custom framework functions: only fill these out if you know what you're doing. If you are using a custom framework, you must fill these out and provide your own code.
-- These functions are called in the client.lua and server.lua files and are used to interact with your custom framework.
-- Support for these functions is provided IN A LIMITED CAPACITY.
----------------------------------------------########################################----------------------------------------------
-- Custom spawn event must call InitializeChessBoards within the function itself, as demostrated below.
-- This function should be whatever event triggers in your framework when the player spawns, and will spawn the chess tables.
local RSGCore = exports['rsg-core']:GetCoreObject()

local function CustomFrameworkSpawnEvent(InitializeChessBoards)
    RegisterNetEvent("RSGCore:Client:OnPlayerLoaded", function()
        InitializeChessBoards()
    end)
end

Config.CustomFrameworkSpawnEvent = CustomFrameworkSpawnEvent
