local useDebug = Config.Debug

RegisterNetEvent('cw-crafting:server:craftItem', function(recipe, item, craftingAmount)
    local src = source
    local craftingAmount = tonumber(craftingAmount) -- safeguard craftingamount cause why not
    if useDebug then 
        print('Crafting', recipe, craftingAmount)
        print('item', json.encode(item))

    end

    local success = false
    
    if hasAllMaterials(src, item.materials, craftingAmount, item.keepMaterials) then
        for material, amount in pairs(item.materials) do
            if not item.keepMaterials or not item.keepMaterials[material] then 
                if useDebug then print('Removing', material, ' for crafting') end
                removeItem(src, material, amount*craftingAmount)
            else
                if useDebug then print('skipping removal of', material, 'as its marked as keep') end
            end

            
        end
        if item.toItems ~= nil then
            for toMat, toAmount in pairs(item.toItems) do
                addItem(src, toMat, toAmount*craftingAmount, item.metadata)
            end
            success = true
        else
            print('^1Recipe is not created correctly: Missing toItems^0', recipe)
        end
    else
        TriggerClientEvent('cw-crafting:client:notify', src, 'You are lacking some of the items to craft this', 'error') -- also possible exploit, if you wanna kick someone add it after this
    end
    
end)

lib.callback.register('cw-crafting:getPlayerJobName', function(source)
    local Player = RSGCore.Functions.GetPlayer(source)
    if Player and Player.PlayerData.job then
        return Player.PlayerData.job.name
    end
    return nil
end)

lib.callback.register('cw-crafting:getPlayerJobType', function(source)
    local Player = RSGCore.Functions.GetPlayer(source)
    if Player and Player.PlayerData.job then
        return Player.PlayerData.job.type
    end
    return nil
end)

lib.callback.register('cw-crafting:getPlayerJobLevel', function(source)
    local Player = RSGCore.Functions.GetPlayer(source)
    if Player and Player.PlayerData.job and Player.PlayerData.job.grade then
        return Player.PlayerData.job.grade.level
    end
    return nil
end)




