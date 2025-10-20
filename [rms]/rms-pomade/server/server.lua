local RSGCore = exports['rsg-core']:GetCoreObject()

	RSGCore.Functions.CreateUseableItem('pomade', function(source, item)
		local Player = RSGCore.Functions.GetPlayer(source)
		if Player.Functions.RemoveItem(item.name, 1, item.slot) then
			TriggerClientEvent('rsg-pomade:usepomade', source, v)
		end
	end)


