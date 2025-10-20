
local RSGCore = exports['rsg-core']:GetCoreObject()

function CustomStashLogic(src, stash_id)
    -- Check if the player exists
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then 
        -- If the player is not found, return and avoid further processing
        print("Player not found!")
        return 
    end

    -- Define stash data (max weight, number of slots, label, etc.)
    local stashData = {
        label = "Camp Stash",
        maxweight = Config.StorageMaxWeight,
        slots = Config.StorageMaxSlots,
    }

    -- Open the inventory for the player (using the rsg-inventory system)
    exports['rsg-inventory']:OpenInventory(src, stash_id, stashData)

    -- Optional: Send notification or log the event
    RSGCore.Functions.Notify(src, "Opening your Camp Stash...", "success")
end


RSGCore.Commands.Add('removecamp', 'Remove a players camp by citizenid', {}, true, function(source, args)
    local citizenid = args[1]
    if not citizenid or citizenid == '' then
        lib.notify(source, {
            title = 'Camp',
            description = 'Usage: /removecamp (citizenID) ',
            type = 'error'
        })
        return
    end

    exports.oxmysql:execute('DELETE FROM ricx_camps WHERE charid = ?', { citizenid }, function(rowsChanged)
        if rowsChanged > 0 then
            lib.notify(source, {
                title = 'Camp',
                description = 'Successfully removed the camp for citizen ID: ' .. citizenid,
                type = 'success'
            })
        else
            lib.notify(source, {
                title = 'Camp',
                description = 'No camp found for citizen ID: ' .. citizenid,
                type = 'info'
            })
        end
    end)
end, "admin")


function GetCustomItemAmount(src, item)
	local count = 0 
	print(src, item)
	--add here your getitemcount to return
	return count 
end

function AddCustomItem(src, item, amount)
	print(src, item, amount)
	--add here your additem 
end

function RemoveCustomItem(src, item, amount)
	print(src, item, amount)
	--add here your removeitem 
end

function AddCustomMoney(src, value)
	print(src, value)
	--add here your custom addmoney
end

function RemoveCustomMoney(src, value)
	print(src, value)
	--add here your custom removemoney
end

function GetCustomPlayerData(src)
	local a = {}
	a.job = "" -- ADD HERE THE CORRECT PLAYER DATA
	a.identifier = "" -- ADD HERE THE CORRECT PLAYER DATA
	a.charid = 0 -- ADD HERE THE CORRECT PLAYER DATA
	a.name = "" -- ADD HERE THE CORRECT PLAYER DATA
	a.money = "" -- ADD HERE THE CORRECT PLAYER DATA
	return a 
end

function GetCustomPlayerInventory(src)
	local pitems = {}
	--change here to your custom inventory
	for i,v in pairs(Config.SupplyItems) do 
		local count = 0
		if count and count > 0 then 
			pitems[#pitems+1] = v
		end
	end
	return pitems
end

-- REGISTER camp_totem item usage to trigger event TriggerClientEvent("ricx_camps:place_totem", _source) from server side for source