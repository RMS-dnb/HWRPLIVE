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

-- BGS Craps
-- Author: Snapopotamus
-- © 2024
-- A craps game system for RedM servers.
-- Compatible with RSGCore and VORPCore.

---------------------------------------------------------------------------------------------

Config = {}
-- Will allow you to spawn the table by restarting the script. If on, table will not spawn on player login - script must be manually started.
Config.Debug = false

-- Framework choice
Config.UseVORP = false
Config.UseRSG = false
Config.UseRPX = false
Config.UseCustomFramework = true

-- Max bet allowed (per betting spot)
Config.MaxBet = 1000.0

-- Max amount that a base bet can be multiplied for an odds bet. For example, if a pass line bet is 10 dollars, a Config.MaxOddsBetMultiplier of 2 means the max pass line odds bet is 20 dollars. This applies to ALL odds bets.
Config.MaxOddsBetMultiplier = 5

-- Amount of time to wait for player bets (in seconds)
Config.BetCounter = 20
-- Amount of time to wait after dice roll (in seconds). Recommend not going lower than this.
Config.CooldownCounter = 6
-- Whether or not to use ground markers for table spots
Config.UseMarkers = false

-- Chip settings, name is item database name (if applicable), value is the amount of money the chip is worth, label is the name of the chip (if applicable), model is the prop model of the chip.
Config.Chips = {
	[1] = {name = "white_chip", value = 1, label = "White Chip", model = "prop_chip_white_x1"},
	[2] = {name = "red_chip", value = 5, label = "Red Chip", model = "prop_chip_red_x1"},
	[3] = {name = "blue_chip", value = 10, label = "Blue Chip", model = "prop_chip_blue_x1"},
	[4] = {name = "pink_chip", value = 20, label = "Pink Chip", model = "prop_chip_pink_x1"},
	[5] = {name = "black_chip", value = 50, label = "Black Chip", model = "prop_chip_black_x1"}
}

-- Whether or not to use chips instead of money
Config.UseChipsInsteadOfMoney = true

-- Where to spawn the tables, and what job is associated with each table.
-- The job will be used to determine the ledger that the money is taken from and given to, if applicable.
-- Defaults to Syn_Society ledger - to use a different ledger system, use the custom framework functions.
-- Dealer model is the model of dealer NPC at the table. Decorative only. Dealer anim info is the anim they will play. Delete it to not have them play an anim.
Config.Tables = {
	["Table1"] = {coords = vector3(2876.31, -1408.18, 42.37), job = "casino", dealerModel = "s_m_m_nbxriverboatdealers_01", dealerAnimInfo = {dict = "script_rc@for_my_art@ig@rc4@ig1_doorman_ushers", clip = "stand_idle03_doorman"}}
}

-- The rotation to apply to the table once it's spawned - only the z coordinate should be used!
Config.TableRotation = {
	["Table1"] = vec3(0, 0, 49.9999771118164)
}

Config.Language = {
	PromptLabel = "Craps",
	PlayPrompt = "Play",
	PlacePrompt = "Place Chip",
	RemovePrompt = "Remove Chip",
	RaisePrompt = "Raise Bet",
	LowerPrompt = "Lower Bet",
	ExitPrompt = "Cash Out",
	MaxBet = "Max bet reached",
	BettingLanguage = {
		Pass = "Pass",
		DontPass = "Don't Pass",
		ComeOut = "Come Out",
		DontComeOut = "Don't Come Out",
		Odds = "Odds",
		Place = "Place",
		Lay = "Lay",
		Field = "Field",
		BigSix = "Big Six",
		BigEight = "Big Eight",
		Any = "Any",
		Hard = "Hard",
		Craps = "Craps",
		Horn = "Horn",
		Bet = "Bet",
		Pays = "Pays",
		OddsBetMax = "Cannot bet more on odds!",
	},
	NotificationLanguage = {
		DiceLanded = "Dice landed on ",
		YouWon = "You won $",
		InChips = " in chips",
		InCash = " in cash",
		And = " and ",
		OutOfMoney = "You are out of money!",
		BetsOpen = "Bets are open!",
		BetsClosed = "Bets are closed!",
	}
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
local RSGCore = exports['rsg-core']:GetCoreObject()


local function CustomFrameworkSpawnEvent(InitializeAll)
    RegisterNetEvent("RSGCore:Client:OnPlayerLoaded", function()
        InitializeAll()
    end)
    
    -- Also handle player spawn for cases where they're already loaded
    RegisterNetEvent("RSGCore:Client:OnPlayerSpawn", function()
        InitializeAll()
    end)

    
end



Config.CustomFrameworkSpawnEvent = CustomFrameworkSpawnEvent
----------------------------------------------########################################----------------------------------------------
-- Custom notification function must take a source and text as parameters.
-- The text being passed is dependent on the circumstances, but will always be a string.
-- As this can be triggered both client side and server side, you must check for the src value to determine if it exists.
-- If it does, you must trigger the notification server side and pass the src. If it does not, you must trigger the notification client side.
-- See the example below for how to handle this.



local function CustomFrameworkNotification(text, src)
    if src then
        -- Server side notification
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
    else
        -- Client side notification
        if GetResourceState('ox_lib') == 'started' then
            exports.ox_lib:notify({
                title = "Notification",
                description = text,
                type = "inform",
                duration = 5000
            })
        else
            -- Fallback to RSG-Core notification system
            TriggerEvent('RSGCore:Notify', text, 'primary', 5000)
        end
    end
end
Config.CustomFrameworkNotification = CustomFrameworkNotification
----------------------------------------------########################################----------------------------------------------
-- Custom function to get the item count of a specific item from the player.
-- Item is the db name of the item.
-- This function is called when a player places a bet using chip mode - it will check if the player has the chip to place the bet.
-- The item and is passed as a parameter - you do not need to add it yourself: simply use the parameter in your code.
-- This function should return true if the player has the item, and false if they do not.
-- This can also be a HasItem check, if your framework provides that instead.
-- Ultimately, you simply need to check if the player has the item then return true or false based on that.
local function CustomFrameworkInventoryGetItemCount(src, item)
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then 
        print(('[ERROR] Player not found for source: %s'):format(src))
        return false 
    end
    
    local itemData = Player.Functions.GetItemByName(item)
    if itemData and itemData.amount then
        return itemData.amount > 0
    end
    
    return false
end
Config.CustomFrameworkInventoryGetItemCount = CustomFrameworkInventoryGetItemCount
----------------------------------------------########################################----------------------------------------------
-- Chip item and amount of the item to take from the player.
-- Item is the db name of the item, amount is the amount of the item to remove.
-- This function is called when a player places a bet - it will remove the chip item from the player's inventory.
-- The chip item and the amount are passed as parameters - you do not need to add them yourself: simply use the parameters in your code.
-- The amount will always be 1, as the item check is only for one chip, so only one chip is removed.
local function CustomFrameworkInventoryRemoveItem(src, item, amount)
    local Player = RSGCore.Functions.GetPlayer(src)
    if Player then
        local success = Player.Functions.RemoveItem(item, amount)
        if success then
            -- Optional: Log the transaction
            print(('[Item] Removed %s x%s from player %s'):format(item, amount, src))
            
            -- Optional: Notify player
            if Config.CustomFrameworkNotification then
                Config.CustomFrameworkNotification(('Removed %s x%s'):format(item, amount), src)
            end
            
            return true
        else
            print(('[ERROR] Failed to remove item %s x%s from player %s'):format(item, amount, src))
        end
    else
        print(('[ERROR] Could not remove item - Player not found for source: %s'):format(src))
    end
    return false
end
Config.CustomFrameworkInventoryRemoveItem = CustomFrameworkInventoryRemoveItem
----------------------------------------------########################################----------------------------------------------
-- Reward and amount of the item to give to the player.
-- Item is the db name of the item, amount is the amount of the item to give.
-- Same as above, the item and amount are passed as parameters - you do not need to add them yourself: simply use the parameters in your code.
local function CustomFrameworkInventoryGiveItem(src, item, amount)
    local Player = RSGCore.Functions.GetPlayer(src)
    if amount <= 0 then return end
    if Player then
        local success = Player.Functions.AddItem(item, amount)
        if success then
            -- Optional: Log the transaction
            print(('[Item] Added %s x%s to player %s'):format(item, amount, src))
           
            -- Optional: Notify player
            if Config.CustomFrameworkNotification then
                Config.CustomFrameworkNotification(('Received %s x%s'):format(item, amount), src)
            end
            
            return true
        else
            print(('[ERROR] Failed to add item %s x%s to player %s'):format(item, amount, src))
        end
    else
        print(('[ERROR] Could not give item - Player not found for source: %s'):format(src))
    end
    return false
end
Config.CustomFrameworkInventoryGiveItem = CustomFrameworkInventoryGiveItem

----------------------------------------------########################################----------------------------------------------
-- Money type that will be used in the custom framework (if applicable). What will be sent in "moneyType" parameter of the function Config.CustomFrameworkInventoryGiveMoney
-- Money type is always optional - it will be passed in the below functions as a param but is not necessary if you do not use different money types.
Config.CustomFrameworkMoneyType = 0

----------------------------------------------########################################----------------------------------------------
-- Money type is Config.CustomFrameworkMoneyType's value, amount is the amount of the money to give.
-- Both are passed as parameters - you do not need to add them yourself: simply use the parameters in your code.
-- This function is called when a player places a bet using monetary betting - it will check if the player has the money to place the bet.
-- It should return true or false based on whether or not the player has [amount] of [moneyType], as in the example below.
-- If you do not use a money type, you can ignore the moneyType parameter and simply check if the player has the amount of money.
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
----------------------------------------------########################################----------------------------------------------
-- Money type and amount of the money to give to the player.
-- Money type is Config.CustomFrameworkMoneyType's value, amount is the amount of the money to give.
-- Both are passed as parameters - you do not need to add them yourself: simply use the parameters in your code.
-- Money type is optional and can be ignored if you do not use a custom money type.
-- This function is called when a player wins a bet - it will give the player money if using monetary betting, or when it cannot award chips.
local function CustomFrameworkInventoryGiveMoney(src, moneyType, amount)
    local Player = RSGCore.Functions.GetPlayer(src)
    if amount <= 0 then return end
    if Player then

        Player.Functions.AddMoney("cash", amount)
        
        
        print(('[Money] Added $%s cash to player %s'):format(amount, src))
        
        -- Optional: Notify player
        if Config.CustomFrameworkNotification then
            Config.CustomFrameworkNotification(('You received $%s'):format(amount), src)
        end
        
        return true
    else
        print(('[ERROR] Could not give money - Player not found for source: %s'):format(src))
        return false
    end
end
Config.CustomFrameworkInventoryGiveMoney = CustomFrameworkInventoryGiveMoney
----------------------------------------------########################################----------------------------------------------
-- Money type and amount of the money to take from the player.
-- All the same as above applies here.
-- This function is called when a player places a bet - it will remove the money from the player's inventory if using monetary betting.
-- The money type and amount are passed as parameters - you do not need to add them yourself: simply use the parameters in your code.
-- Money type is optional and can be ignored if you do not use a custom money type.
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
----------------------------------------------########################################----------------------------------------------
-- Ledger and amount of the money to deposit to the ledger.
-- Job is the job ledger to deposit the money to, amount is the amount of the money to deposit.
-- This function is called when a player loses a bet - it will deposit the money to the job ledger.
-- The job and amount are passed as parameters - you do not need to add them yourself: simply use the parameters in your code.
local function CustomFrameworkLedgerDeposit(job, amount)
    -- Check if rsg-bossmenu or society system is available
    if GetResourceState('rsg-bossmenu') == 'started' then
        -- Use RSG bossmenu system
        exports['rsg-bossmenu']:AddMoney(job, amount)
        print(('[Ledger] Deposited $%s to %s society account'):format(amount, job))
    elseif GetResourceState('rsg-society') == 'started' then
        -- Use RSG society system if available
        exports['rsg-society']:AddMoney(job, amount)
        print(('[Ledger] Deposited $%s to %s society account'):format(amount, job))
    else
        -- Fallback - you can implement your own ledger system here
        -- This could be a database insert or file write
        print(('[Ledger] Deposit $%s to %s (No society system found - implement custom logic)'):format(amount, job))
        
        -- Example: You could add to a custom database table
        -- MySQL.insert('INSERT INTO job_ledger (job, amount, type, timestamp) VALUES (?, ?, ?, ?)', {
        --     job, amount, 'deposit', os.time()
        -- })
    end
end
Config.CustomFrameworkLedgerDeposit = CustomFrameworkLedgerDeposit
----------------------------------------------########################################----------------------------------------------
-- Ledger and amount of the money to remove from the ledger.
-- All the same as above applies here.
-- This function is called when a player wins a bet - it will remove the money from the job ledger.
-- The job and amount are passed as parameters - you do not need to add them yourself: simply use the parameters in your code.
local function CustomFrameworkLedgerRemoval(job, amount)
    -- Check if rsg-bossmenu or society system is available
    if GetResourceState('rsg-bossmenu') == 'started' then
        -- Use RSG bossmenu system
        local success = exports['rsg-bossmenu']:RemoveMoney(job, amount)
        if success then
            print(('[Ledger] Withdrew $%s from %s society account'):format(amount, job))
            return true
        else
            print(('[Ledger] Failed to withdraw $%s from %s - insufficient funds'):format(amount, job))
            return false
        end
    elseif GetResourceState('rsg-society') == 'started' then
        -- Use RSG society system if available
        local success = exports['rsg-society']:RemoveMoney(job, amount)
        if success then
            print(('[Ledger] Withdrew $%s from %s society account'):format(amount, job))
            return true
        else
            print(('[Ledger] Failed to withdraw $%s from %s - insufficient funds'):format(amount, job))
            return false
        end
    else
        -- Fallback - you can implement your own ledger system here
        print(('[Ledger] Withdraw $%s from %s (No society system found - implement custom logic)'):format(amount, job))
        
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
----------------------------------------------########################################----------------------------------------------