--       ___          ___          ___
--      /\  \        /\  \        /\  \
--     /::\  \      /::\  \      /::\  \
--    /:/\:\  \    /:/\:\  \    /:/\ \  \
--   /::\~\:\__\  /:/  \:\  \  _\:\~\ \  \
--  /:/\:\ \:|__|/:/__/_\:\__\/\ \:\ \ \__\
--  \:\~\:\/:/  /\:\  /\ \/__/\:\ \:\ \/__/
--   \:\ \::/  /  \:\ \:\__\   \:\ \:\__\
--    \:\/:/  /    \:\/:/  /    \:\/:/  /
--     \::/__/      \::/  /      \::/  /
--      ‾‾           \/__/        \/__/

-- BGS Slot Machine
-- Author: Snapopotamus
-- © 2024
-- A slot machine game system for RedM servers.
-- Compatible with RSGCore and VORPCore.

---------------------------------------------------------------------------------------------

Config = {}

-- Will allow you to spawn the tables and machines by restarting the script. If on, tables and machines will not spawn on player login - script must be manually started.
-- Debug mode will also print the combinations of the slot wheels on played machines to the server console.
Config.Debug = false

-- Framework choice
Config.UseVORP = false
Config.UseVORPOldAsFuck = false
Config.UseRSG = false
Config.UseRedEM = false
Config.UseRPX = false
Config.UseCustomFramework = true

-- Will automatically unload and reload all the correct casino boat IPLs - set to off if you want to modify this manually.
Config.UseCasinoBoatIPL = true

-- Table config options (table model, chair model, table decoration model)
Config.TableModel = "p_table56x"
Config.ChairModel = "p_chair12x"
Config.TableDecorationModel = "p_pot_flowerarng05x"

--Prompt ranges
Config.PromptRangeChair = 1.2
Config.PromptRangeStanding = 0.8

-- Camera offset for slot machines
Config.CamOffset = vec3(0.279651, -0.296623, 0.083519)

-- Prompt language
Config.PromptLabel = "Slots"
Config.TablePrompt = "Play Slots"
Config.LeaveTablePrompt = "Leave"
Config.SpinPrompt = "Pull Lever"
Config.TablePromptKey = "INPUT_CONTEXT_Y"
Config.LeaveTablePromptKey = "INPUT_FRONTEND_LB"
Config.SpinPromptKey = "INPUT_CONTEXT_Y"

-- Notification language
Config.WinNotification = "You won $"
Config.LoseNotification = "Better luck next time!"
Config.NoMoneyNotification = "Not enough money!"

-- Where to spawn tables.
-- Tables contain 4 slot machines, 4 chairs, a table model, and a table decoration.
-- The last three are defined above.
-- Machines are offset for the current table model - if it does not match, the coords for the attached machines will probably be off.
-- Coords must be put in a table, like the example.
-- Job is the job ledger to deposit money to if the player wins, and is optional.
Config.Tables = {
	[1] = { vec3(2872.212158203125, -1404.6751708984375, 42.44523239135742), heading = 5.0, job = "casino" }
}

-- Where to spawn individual machines.
-- Machine coords must also be put in a table format like the below example, same as the table coords above.
-- To get machine coords, spawn a machine in spooner (spawn item by name, item name is slots_001), place it where you want, then get those coords.
-- Job is the job ledger to deposit money to if the player wins, and is optional.
Config.Machines = {
	[1] = { vector3(2866.83, -1397.73, 43.71), heading = 140.0, job = "casino" },
	[2] = { vector3(2864.38, -1400.73, 43.71), heading = -40.0, job = "casino" },
}

-- Price per spin, in dollars.
Config.SlotPrice = 1.0

-- Payouts/odds of hitting per spin combo, in dollars/percentage
Config.Payouts = {
	["TwoStars"] = {payout = 1.0, odds = 8.0},
	["TwoHearts"] = {payout = 1.0, odds = 8.0},
	["TwoBells"] = {payout = 1.0, odds = 8.0},
	["TwoDiamonds"] = {payout = 1.0, odds = 8.0},
	["TwoSpades"] = {payout = 1.0, odds = 8.0},
	["TwoHorseshoes"] = {payout = 2.0, odds = 5.0},
	["TwoHorseshoesOneStar"] = {payout = 4.0, odds = 2.5},
	["ThreeHorseshoes"] = {payout = 6.0, odds = 1.0},
	["ThreeSpades"] = {payout = 8.0, odds = 0.75},
	["ThreeDiamonds"] = {payout = 12.0, odds = 0.5},
	["ThreeHearts"] = {payout = 16.0, odds = 0.2},
	["ThreeStars"] = {payout = 18.0, odds = 0.1},
	["ThreeBells"] = {payout = 20.0, odds = 0.05}
}

----------------------------------------------########################################----------------------------------------------
----------------------------------------------########################################----------------------------------------------
----------------------------------------------=====CUSTOM FRAMEWORK FUNCTIONALITY=====----------------------------------------------
----------------------------------------------########################################----------------------------------------------
----------------------------------------------########################################----------------------------------------------
-- If you are not using a custom framework, leave these functions as they are.
-- Custom framework functions: only fill these out if you know what you're doing. If you are using a custom framework, you must fill these out and provide your own code.
-- Ledger functions are used to deposit and remove money from a job ledger, and will need to be filled out regardless of framework if you are using job ledger deposit/withdrawal.
-- These functions are called in the client.lua and server.lua files and are used to interact with your custom framework.
-- Support for these functions is provided IN A LIMITED CAPACITY.
----------------------------------------------########################################----------------------------------------------
-- Custom spawn event must call InitializeFunction as a parameter and within the function itself, as demostrated below.
-- This function should be whatever triggers in your framework when the player spawns, and will spawn the table and dealer.
-- This function is called when a player logs in - it will spawn the table and dealer for the player.
-- The InitializeAll and InitializeCasinoBoat functions ared passed as parameters - you do not need to add them yourself: simply use the parameters in your code.
-- InitializeCasinoBoat is optional and only used if Config.UseCasinoBoatIPL is set to true.
---------------------------------------------- SPAWN EVENT HOOK ----------------------------------------------
local RSGCore = exports['rsg-core']:GetCoreObject()

local function CustomFrameworkSpawnEvent(InitializeAll, InitializeCasinoBoat)
    RegisterNetEvent("RSGCore:Client:OnPlayerLoaded", function()
        if Config.UseCasinoBoatIPL then
            InitializeCasinoBoat()
        end
        InitializeAll()
    end)
    
    -- Also handle player spawn for cases where they're already loaded
    RegisterNetEvent("RSGCore:Client:OnPlayerSpawn", function()
        if Config.UseCasinoBoatIPL then
            InitializeCasinoBoat()
        end
        InitializeAll()
    end)
end

Config.CustomFrameworkSpawnEvent --------------------- SPAWN EVENT HOOK ----------------------------------------------

= CustomFrameworkSpawnEvent

---------------------------------------------- NOTIFICATION FUNCTION ----------------------------------------------
local function CustomFrameworkNotification(text, src)
    if src then
        -- Check if ox_lib is available, otherwise use RSG-Core's built-in notification
        if GetResourceState('ox_lib') == 'started' then
            TriggerClientEvent('ox_lib:notify', src, {
                title = "Notification",
                description = text,
                type = "inform",
                duration = 5000
            })
        else
            -- Fallback to RSG-Core notification system
            TriggerClientEvent('RSGCore:Notify', src, text, 'primary', 5000)
        end
    end
end

Config.CustomFrameworkNotification = CustomFrameworkNotification

---------------------------------------------- MONEY TYPE DEFINITION ----------------------------------------------
Config.CustomFrameworkMoneyType = 0

---------------------------------------------- CHECK PLAYER MONEY ----------------------------------------------
local function CustomFrameworkInventoryGetMoney(src, moneyType, amount)
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then 
        print(('[ERROR] Player not found for source: %s'):format(src))
        return false 
    end
    
    local money = Player.Functions.GetMoney("cash")
    if not money then
        print(('[ERROR] Could not get cash amount for player: %s'):format(src))
        return false
    end
    
    return money >= amount
end

Config.CustomFrameworkInventoryGetMoney = CustomFrameworkInventoryGetMoney

---------------------------------------------- GIVE PLAYER MONEY ----------------------------------------------
local function CustomFrameworkInventoryGiveMoney(src, moneyType, amount)
    local Player = RSGCore.Functions.GetPlayer(src)
    if amount <= 0 then return end
    if Player then
        Player.Functions.AddMoney("cash", amount)
        
       
        return true
    else
        print(('[ERROR] Could not give money - Player not found for source: %s'):format(src))
        return false
    end
end

Config.CustomFrameworkInventoryGiveMoney = CustomFrameworkInventoryGiveMoney

---------------------------------------------- REMOVE PLAYER MONEY ----------------------------------------------
local function CustomFrameworkInventoryRemoveMoney(src, moneyType, amount)
    local Player = RSGCore.Functions.GetPlayer(src)
    if Player then
        local currentMoney = Player.Functions.GetMoney("cash")
        if currentMoney >= amount then
            Player.Functions.RemoveMoney("cash", amount)
            
            -- Optional: Log the transaction
            print(('[Money] Removed $%s cash from player %s'):format(amount, src))
            
            -- Optional: Notify player
            if Config.CustomFrameworkNotification then
                Config.CustomFrameworkNotification(('You paid $%s'):format(amount), src)
            end
            
            return true
        else
            -- Optional: Notify player of insufficient funds
            if Config.CustomFrameworkNotification then
                Config.CustomFrameworkNotification('You don\'t have enough money', src)
            end
            print(('[ERROR] Player %s has insufficient funds. Has: $%s, Needs: $%s'):format(src, currentMoney, amount))
        end
    else
        print(('[ERROR] Could not remove money - Player not found for source: %s'):format(src))
    end
    return false
end

Config.CustomFrameworkInventoryRemoveMoney = CustomFrameworkInventoryRemoveMoney

---------------------------------------------- DEPOSIT TO JOB LEDGER ----------------------------------------------
local function CustomFrameworkLedgerDeposit(job, amount)
    -- Check if rsg-bossmenu or society system is available
    if GetResourceState('rsg-bossmenu') == 'started' then
        -- Use RSG bossmenu system
        exports['rsg-bossmenu']:AddMoney(job, amount)
    elseif GetResourceState('rsg-society') == 'started' then
        -- Use RSG society system if available
        exports['rsg-society']:AddMoney(job, amount)
    else
        -- Fallback - you can implement your own ledger system here
        -- This could be a database insert or file write
        
        
        -- Example: You could add to a custom database table
        -- MySQL.insert('INSERT INTO job_ledger (job, amount, type, timestamp) VALUES (?, ?, ?, ?)', {
        --     job, amount, 'deposit', os.time()
        -- })
    end
end

Config.CustomFrameworkLedgerDeposit = CustomFrameworkLedgerDeposit

---------------------------------------------- REMOVE FROM JOB LEDGER ----------------------------------------------
local function CustomFrameworkLedgerRemoval(job, amount)
    -- Check if rsg-bossmenu or society system is available
    if GetResourceState('rsg-bossmenu') == 'started' then
        -- Use RSG bossmenu system
        local success = exports['rsg-bossmenu']:RemoveMoney(job, amount)
        if success then
            return true
        else
            return false
        end
    elseif GetResourceState('rsg-society') == 'started' then
        -- Use RSG society system if available
        local success = exports['rsg-society']:RemoveMoney(job, amount)
        if success then
            
            return true
        else
            
            return false
        end
    else
        -- Fallback - you can implement your own ledger system here
        
        
        -- Example: You could check and update a custom database table
        -- local result = MySQL.scalar('SELECT balance FROM job_ledger WHERE job = ?', {job})
        -- if result and result >= amount then
        --     MySQL.update('UPDATE job_ledger SET balance = balance - ? WHERE job = ?', {amount, job})
        --     return true
        -- end
        return false
    end
end

Config.CustomFrameworkLedgerRemoval = CustomFrameworkLedgerRemoval

---------------------------------------------- ADDITIONAL RSG-CORE HELPERS ----------------------------------------------
-- Optional: Get player job function
local function CustomFrameworkGetPlayerJob(src)
    local Player = RSGCore.Functions.GetPlayer(src)
    if Player then
        return Player.PlayerData.job.name, Player.PlayerData.job.grade.level
    end
    return nil, nil
end

Config.CustomFrameworkGetPlayerJob = CustomFrameworkGetPlayerJob

-- Optional: Check if player has specific job
local function CustomFrameworkHasJob(src, jobName, minGrade)
    local Player = RSGCore.Functions.GetPlayer(src)
    if Player then
        local playerJob = Player.PlayerData.job
        if playerJob.name == jobName then
            if minGrade then
                return playerJob.grade.level >= minGrade
            end
            return true
        end
    end
    return false
end

Config.CustomFrameworkHasJob = CustomFrameworkHasJob