local RSGCore = exports['rsg-core']:GetCoreObject()


for _, v in pairs(Config.PocketWatches) do
	RSGCore.Functions.CreateUseableItem(v.item, function(source, item)
		local Player = RSGCore.Functions.GetPlayer(source)
		TriggerClientEvent('rsg-pocketwatch:usewatch', source, v)
	end)
end

