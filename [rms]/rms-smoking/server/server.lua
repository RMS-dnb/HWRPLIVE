local RSGCore = exports['rsg-core']:GetCoreObject()
lib.locale()

-- cigarette
RSGCore.Functions.CreateUseableItem('cigarette10', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'cigarette10', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
    
        Player.Functions.RemoveItem('cigarette10', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('cigarette9', 1)
        TriggerClientEvent('rex-smoking:client:cigarette', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('cigarette9', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'cigarette9', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('cigarette9', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('cigarette8', 1)
        TriggerClientEvent('rex-smoking:client:cigarette', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('cigarette8', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'cigarette8', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
    
        Player.Functions.RemoveItem('cigarette8', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('cigarette7', 1)
        TriggerClientEvent('rex-smoking:client:cigarette', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('cigarette7', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'cigarette7', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('cigarette7', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('cigarette6', 1)
        TriggerClientEvent('rex-smoking:client:cigarette', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('cigarette6', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'cigarette6', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('cigarette6', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('cigarette5', 1)
        TriggerClientEvent('rex-smoking:client:cigarette', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('cigarette5', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'cigarette5', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('cigarette5', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('cigarette4', 1)
        TriggerClientEvent('rex-smoking:client:cigarette', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('cigarette4', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'cigarette4', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('cigarette4', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('cigarette3', 1)
        TriggerClientEvent('rex-smoking:client:cigarette', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('cigarette3', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'cigarette3', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('cigarette3', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('cigarette2', 1)
        TriggerClientEvent('rex-smoking:client:cigarette', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('cigarette2', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'cigarette2', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('cigarette2', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('cigarette1', 1)
        TriggerClientEvent('rex-smoking:client:cigarette', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('cigarette1', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'cigarette1', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('cigarette1', 1)
        Player.Functions.RemoveItem('match', 1)
        TriggerClientEvent('rex-smoking:client:cigarette', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

-- cigarette prairie breeze
RSGCore.Functions.CreateUseableItem('prairie_breeze_pack', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'prairie_breeze_pack', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
    
        Player.Functions.RemoveItem('prairie_breeze_pack', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('prairie_breeze9', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('prairie_breeze9', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'prairie_breeze9', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('prairie_breeze9', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('prairie_breeze8', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('prairie_breeze8', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'prairie_breeze8', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
    
        Player.Functions.RemoveItem('prairie_breeze8', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('prairie_breeze7', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('prairie_breeze7', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'prairie_breeze7', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('prairie_breeze7', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('prairie_breeze6', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('prairie_breeze6', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'prairie_breeze6', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('prairie_breeze6', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('prairie_breeze5', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('prairie_breeze5', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'prairie_breeze5', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('prairie_breeze5', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('prairie_breeze4', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('prairie_breeze4', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'prairie_breeze4', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('prairie_breeze4', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('prairie_breeze3', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('prairie_breeze3', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'prairie_breeze3', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('prairie_breeze3', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('prairie_breeze2', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('prairie_breeze2', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'prairie_breeze2', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('prairie_breeze2', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('prairie_breeze1', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('prairie_breeze1', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'prairie_breeze1', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('prairie_breeze1', 1)
        Player.Functions.RemoveItem('match', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

-- cigarette Nyxs - Elysian Hotel
RSGCore.Functions.CreateUseableItem('nyxs_pack', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'nyxs_pack', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
    
        Player.Functions.RemoveItem('nyxs_pack', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('nyxs9', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('nyxs9', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'nyxs9', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('nyxs9', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('nyxs8', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('nyxs8', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'nyxs8', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
    
        Player.Functions.RemoveItem('nyxs8', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('nyxs7', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('nyxs7', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'nyxs7', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('nyxs7', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('nyxs6', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('nyxs6', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'nyxs6', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('nyxs6', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('nyxs5', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('nyxs5', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'nyxs5', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('nyxs5', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('nyxs4', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('nyxs4', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'nyxs4', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('nyxs4', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('nyxs3', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('nyxs3', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'nyxs3', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('nyxs3', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('nyxs2', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('nyxs2', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'nyxs2', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('nyxs2', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('nyxs1', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('nyxs1', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'nyxs1', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('nyxs1', 1)
        Player.Functions.RemoveItem('match', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

-- cigarette blood moon - Grave Rose
RSGCore.Functions.CreateUseableItem('blood_moon_pack', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'blood_moon_pack', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
    
        Player.Functions.RemoveItem('blood_moon_pack', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('blood_moon9', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('blood_moon9', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'blood_moon9', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('blood_moon9', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('blood_moon8', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('blood_moon8', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'blood_moon8', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
    
        Player.Functions.RemoveItem('blood_moon8', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('blood_moon7', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('blood_moon7', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'blood_moon7', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('blood_moon7', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('blood_moon6', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('blood_moon6', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'blood_moon6', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('blood_moon6', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('blood_moon5', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('blood_moon5', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'blood_moon5', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('blood_moon5', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('blood_moon4', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('blood_moon4', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'blood_moon4', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('blood_moon4', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('blood_moon3', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('blood_moon3', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'blood_moon3', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('blood_moon3', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('blood_moon2', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('blood_moon2', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'blood_moon2', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('blood_moon2', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('blood_moon1', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('blood_moon1', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'blood_moon1', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('blood_moon1', 1)
        Player.Functions.RemoveItem('match', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

-- cigarette golden leaf
RSGCore.Functions.CreateUseableItem('golden_leaf_pack', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'golden_leaf_pack', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
    
        Player.Functions.RemoveItem('golden_leaf_pack', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('golden_leaf9', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('golden_leaf9', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'golden_leaf9', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('golden_leaf9', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('golden_leaf8', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('golden_leaf8', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'golden_leaf8', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
    
        Player.Functions.RemoveItem('golden_leaf8', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('golden_leaf7', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('golden_leaf7', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'golden_leaf7', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('golden_leaf7', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('golden_leaf6', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('golden_leaf6', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'golden_leaf6', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('golden_leaf6', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('golden_leaf5', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('golden_leaf5', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'golden_leaf5', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('golden_leaf5', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('golden_leaf4', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('golden_leaf4', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'golden_leaf4', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('golden_leaf4', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('golden_leaf3', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('golden_leaf3', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'golden_leaf3', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('golden_leaf3', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('golden_leaf2', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('golden_leaf2', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'golden_leaf2', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('golden_leaf2', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('golden_leaf1', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('golden_leaf1', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'golden_leaf1', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('golden_leaf1', 1)
        Player.Functions.RemoveItem('match', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

-- cigarette mourning wing
RSGCore.Functions.CreateUseableItem('mourning_wing_pack', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'mourning_wing_pack', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
    
        Player.Functions.RemoveItem('mourning_wing_pack', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('mourning_wing9', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('mourning_wing9', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'mourning_wing9', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('mourning_wing9', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('mourning_wing8', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('mourning_wing8', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'mourning_wing8', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
    
        Player.Functions.RemoveItem('mourning_wing8', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('mourning_wing7', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('mourning_wing7', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'mourning_wing7', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('mourning_wing7', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('mourning_wing6', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('mourning_wing6', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'mourning_wing6', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('mourning_wing6', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('mourning_wing5', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('mourning_wing5', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'mourning_wing5', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('mourning_wing5', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('mourning_wing4', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('mourning_wing4', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'mourning_wing4', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('mourning_wing4', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('mourning_wing3', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('mourning_wing3', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'mourning_wing3', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('mourning_wing3', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('mourning_wing2', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('mourning_wing2', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'mourning_wing2', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('mourning_wing2', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('mourning_wing1', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('mourning_wing1', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'mourning_wing1', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('mourning_wing1', 1)
        Player.Functions.RemoveItem('match', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

-- cigarette mourning wing
RSGCore.Functions.CreateUseableItem('ashen_bloom_pack', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'ashen_bloom_pack', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
    
        Player.Functions.RemoveItem('ashen_bloom_pack', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('ashen_bloom9', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('ashen_bloom9', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'ashen_bloom9', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('ashen_bloom9', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('ashen_bloom8', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('ashen_bloom8', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'ashen_bloom8', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
    
        Player.Functions.RemoveItem('ashen_bloom8', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('ashen_bloom7', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('ashen_bloom7', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'ashen_bloom7', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('ashen_bloom7', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('ashen_bloom6', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('ashen_bloom6', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'ashen_bloom6', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('ashen_bloom6', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('ashen_bloom5', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('ashen_bloom5', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'ashen_bloom5', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('ashen_bloom5', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('ashen_bloom4', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('ashen_bloom4', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'ashen_bloom4', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('ashen_bloom4', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('ashen_bloom3', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('ashen_bloom3', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'ashen_bloom3', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('ashen_bloom3', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('ashen_bloom2', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('ashen_bloom2', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'ashen_bloom2', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('ashen_bloom2', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('ashen_bloom1', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('ashen_bloom1', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'ashen_bloom1', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('mourning_wing1', 1)
        Player.Functions.RemoveItem('match', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)


-- cigar iron horse
RSGCore.Functions.CreateUseableItem('iron_horse_cigar_box', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'iron_horse_cigar_box', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
    
        Player.Functions.RemoveItem('iron_horse_cigar_box', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('iron_horse_cigar9', 1)
        TriggerClientEvent('rex-smoking:client:cigar', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('iron_horse_cigar9', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'iron_horse_cigar9', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('iron_horse_cigar9', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('iron_horse_cigar8', 1)
        TriggerClientEvent('rex-smoking:client:cigar', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('iron_horse_cigar8', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'iron_horse_cigar8', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
    
        Player.Functions.RemoveItem('iron_horse_cigar8', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('iron_horse_cigar7', 1)
        TriggerClientEvent('rex-smoking:client:cigar', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('iron_horse_cigar7', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'iron_horse_cigar7', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('iron_horse_cigar7', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('iron_horse_cigar6', 1)
        TriggerClientEvent('rex-smoking:client:cigar', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('iron_horse_cigar6', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'iron_horse_cigar6', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('iron_horse_cigar6', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('iron_horse_cigar5', 1)
        TriggerClientEvent('rex-smoking:client:cigar', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('iron_horse_cigar5', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'iron_horse_cigar5', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('iron_horse_cigar5', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('iron_horse_cigar4', 1)
        TriggerClientEvent('rex-smoking:client:cigar', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('iron_horse_cigar4', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'iron_horse_cigar4', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('iron_horse_cigar4', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('iron_horse_cigar3', 1)
        TriggerClientEvent('rex-smoking:client:cigar', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('iron_horse_cigar3', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'iron_horse_cigar3', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('iron_horse_cigar3', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('iron_horse_cigar2', 1)
        TriggerClientEvent('rex-smoking:client:cigar', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('iron_horse_cigar2', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'iron_horse_cigar2', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('iron_horse_cigar2', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('iron_horse_cigar1', 1)
        TriggerClientEvent('rex-smoking:client:cigar', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('iron_horse_cigar1', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'iron_horse_cigar1', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('iron_horse_cigar1', 1)
        Player.Functions.RemoveItem('match', 1)
        TriggerClientEvent('rex-smoking:client:cigar', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

-- cigar Persephones Kiss
RSGCore.Functions.CreateUseableItem('persephones_kiss_cigar_box', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'persephones_kiss_cigar_box', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
    
        Player.Functions.RemoveItem('persephones_kiss_cigar_box', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('persephones_kiss_cigar9', 1)
        TriggerClientEvent('rex-smoking:client:cigar', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('persephones_kiss_cigar9', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'persephones_kiss_cigar9', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('persephones_kiss_cigar9', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('persephones_kiss_cigar8', 1)
        TriggerClientEvent('rex-smoking:client:cigar', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('persephones_kiss_cigar8', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'persephones_kiss_cigar8', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
    
        Player.Functions.RemoveItem('persephones_kiss_cigar8', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('persephones_kiss_cigar7', 1)
        TriggerClientEvent('rex-smoking:client:cigar', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('persephones_kiss_cigar7', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'persephones_kiss_cigar7', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('persephones_kiss_cigar7', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('persephones_kiss_cigar6', 1)
        TriggerClientEvent('rex-smoking:client:cigar', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('persephones_kiss_cigar6', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'persephones_kiss_cigar6', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('persephones_kiss_cigar6', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('persephones_kiss_cigar5', 1)
        TriggerClientEvent('rex-smoking:client:cigar', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('persephones_kiss_cigar5', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'persephones_kiss_cigar5', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('persephones_kiss_cigar5', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('persephones_kiss_cigar4', 1)
        TriggerClientEvent('rex-smoking:client:cigar', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('persephones_kiss_cigar4', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'persephones_kiss_cigar4', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('persephones_kiss_cigar4', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('persephones_kiss_cigar3', 1)
        TriggerClientEvent('rex-smoking:client:cigar', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('persephones_kiss_cigar3', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'persephones_kiss_cigar3', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('persephones_kiss_cigar3', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('persephones_kiss_cigar2', 1)
        TriggerClientEvent('rex-smoking:client:cigar', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('persephones_kiss_cigar2', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'persephones_kiss_cigar2', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('persephones_kiss_cigar2', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('persephones_kiss_cigar1', 1)
        TriggerClientEvent('rex-smoking:client:cigar', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('persephones_kiss_cigar1', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'persephones_kiss_cigar1', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('persephones_kiss_cigar1', 1)
        Player.Functions.RemoveItem('match', 1)
        TriggerClientEvent('rex-smoking:client:cigar', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

-- cigar Grave Leaf Gold
RSGCore.Functions.CreateUseableItem('graveleaf_gold_cigar_box', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'graveleaf_gold_cigar_box', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
    
        Player.Functions.RemoveItem('graveleaf_gold_cigar_box', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('graveleaf_gold_cigar9', 1)
        TriggerClientEvent('rex-smoking:client:cigar', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('graveleaf_gold_cigar9', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'graveleaf_gold_cigar9', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('graveleaf_gold_cigar9', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('graveleaf_gold_cigar8', 1)
        TriggerClientEvent('rex-smoking:client:cigar', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('graveleaf_gold_cigar8', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'graveleaf_gold_cigar8', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
    
        Player.Functions.RemoveItem('graveleaf_gold_cigar8', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('graveleaf_gold_cigar7', 1)
        TriggerClientEvent('rex-smoking:client:cigar', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('graveleaf_gold_cigar7', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'graveleaf_gold_cigar7', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('graveleaf_gold_cigar7', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('graveleaf_gold_cigar6', 1)
        TriggerClientEvent('rex-smoking:client:cigar', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('graveleaf_gold_cigar6', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'graveleaf_gold_cigar6', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('graveleaf_gold_cigar6', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('graveleaf_gold_cigar5', 1)
        TriggerClientEvent('rex-smoking:client:cigar', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('graveleaf_gold_cigar5', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'graveleaf_gold_cigar5', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('graveleaf_gold_cigar5', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('graveleaf_gold_cigar4', 1)
        TriggerClientEvent('rex-smoking:client:cigar', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('graveleaf_gold_cigar4', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'graveleaf_gold_cigar4', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('graveleaf_gold_cigar4', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('graveleaf_gold_cigar3', 1)
        TriggerClientEvent('rex-smoking:client:cigar', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('graveleaf_gold_cigar3', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'graveleaf_gold_cigar3', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('graveleaf_gold_cigar3', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('graveleaf_gold_cigar2', 1)
        TriggerClientEvent('rex-smoking:client:cigar', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('graveleaf_gold_cigar2', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'graveleaf_gold_cigar2', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('graveleaf_gold_cigar2', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('graveleaf_gold_cigar1', 1)
        TriggerClientEvent('rex-smoking:client:cigar', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('graveleaf_gold_cigar1', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'graveleaf_gold_cigar1', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('graveleaf_gold_cigar1', 1)
        Player.Functions.RemoveItem('match', 1)
        TriggerClientEvent('rex-smoking:client:cigar', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

-- cigar iron horse
RSGCore.Functions.CreateUseableItem('blackfeather_cigar_box', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'blackfeather_cigar_box', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
    
        Player.Functions.RemoveItem('blackfeather_cigar_box', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('blackfeather_cigar9', 1)
        TriggerClientEvent('rex-smoking:client:cigar', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('blackfeather_cigar9', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'blackfeather_cigar9', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('blackfeather_cigar9', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('blackfeather_cigar8', 1)
        TriggerClientEvent('rex-smoking:client:cigar', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('blackfeather_cigar8', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'blackfeather_cigar8', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
    
        Player.Functions.RemoveItem('blackfeather_cigar8', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('blackfeather_cigar7', 1)
        TriggerClientEvent('rex-smoking:client:cigar', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('blackfeather_cigar7', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'blackfeather_cigar7', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('blackfeather_cigar7', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('blackfeather_cigar6', 1)
        TriggerClientEvent('rex-smoking:client:cigar', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('blackfeather_cigar6', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'blackfeather_cigar6', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('blackfeather_cigar6', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('blackfeather_cigar5', 1)
        TriggerClientEvent('rex-smoking:client:cigar', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('blackfeather_cigar5', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'blackfeather_cigar5', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('blackfeather_cigar5', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('blackfeather_cigar4', 1)
        TriggerClientEvent('rex-smoking:client:cigar', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('blackfeather_cigar4', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'blackfeather_cigar4', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('blackfeather_cigar4', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('blackfeather_cigar3', 1)
        TriggerClientEvent('rex-smoking:client:cigar', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('blackfeather_cigar3', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'blackfeather_cigar3', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('blackfeather_cigar3', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('blackfeather_cigar2', 1)
        TriggerClientEvent('rex-smoking:client:cigar', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('blackfeather_cigar2', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'blackfeather_cigar2', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('blackfeather_cigar2', 1)
        Player.Functions.RemoveItem('match', 1)
        Player.Functions.AddItem('blackfeather_cigar1', 1)
        TriggerClientEvent('rex-smoking:client:cigar', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('blackfeather_cigar1', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'blackfeather_cigar1', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('blackfeather_cigar1', 1)
        Player.Functions.RemoveItem('match', 1)
        TriggerClientEvent('rex-smoking:client:cigar', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_2'), type = 'inform', duration = 3000 })
    end
end)
----------------------------
-- use cigar
----------------------------
RSGCore.Functions.CreateUseableItem('cigar', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'cigar', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('cigar', 1)
        Player.Functions.RemoveItem('match', 1)
        TriggerClientEvent('rex-smoking:client:cigar', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_3'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('iron_horse_cigar', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'iron_horse_cigar', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('iron_horse_cigar', 1)
        Player.Functions.RemoveItem('match', 1)
        TriggerClientEvent('rex-smoking:client:cigar', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_3'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('blackfeather_cigar', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'blackfeather_cigar', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('blackfeather_cigar', 1)
        Player.Functions.RemoveItem('match', 1)
        TriggerClientEvent('rex-smoking:client:cigar', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_3'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('graveleaf_gold_cigar', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'graveleaf_gold_cigar', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('graveleaf_gold_cigar', 1)
        Player.Functions.RemoveItem('match', 1)
        TriggerClientEvent('rex-smoking:client:cigar', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_3'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('persephones_kiss_cigar', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'persephones_kiss_cigar', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('persephones_kiss_cigar', 1)
        Player.Functions.RemoveItem('match', 1)
        TriggerClientEvent('rex-smoking:client:cigar', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_3'), type = 'inform', duration = 3000 })
    end
end)
----------------------------
-- use cigarette
----------------------------

RSGCore.Functions.CreateUseableItem('cigarette', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'cigarette', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('cigarette', 1)
        Player.Functions.RemoveItem('match', 1)
        TriggerClientEvent('rex-smoking:client:cigarette', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_3'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('prairie_breeze', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'prairie_breeze', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('prairie_breeze', 1)
        Player.Functions.RemoveItem('match', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_3'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('blood_moon', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'blood_moon', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('blood_moon', 1)
        Player.Functions.RemoveItem('match', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_3'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('nyxs', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'nyxs', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('nyxs', 1)
        Player.Functions.RemoveItem('match', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_3'), type = 'inform', duration = 3000 })
    end
end)


RSGCore.Functions.CreateUseableItem('golden_leaf', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'golden_leaf', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('golden_leaf', 1)
        Player.Functions.RemoveItem('match', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_3'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('mourning_wing', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'mourning_wing', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('mourning_wing', 1)
        Player.Functions.RemoveItem('match', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_3'), type = 'inform', duration = 3000 })
    end
end)

RSGCore.Functions.CreateUseableItem('ashen_bloom', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'ashen_bloom', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('ashen_bloom', 1)
        Player.Functions.RemoveItem('match', 1)
        TriggerClientEvent('rex-smoking:client:cigarettebusiness', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_3'), type = 'inform', duration = 3000 })
    end
end)

----------------------------
-- use joint
----------------------------

RSGCore.Functions.CreateUseableItem('weedjoint', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'weedjoint', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'match', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'zippo', 1)

    if hasItem1 and (hasItem2 or hasItem3) then
        Player.Functions.RemoveItem('weedjoint', 1)
        Player.Functions.RemoveItem('match', 1)
        TriggerClientEvent('rex-smoking:client:joint', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_3'), type = 'inform', duration = 3000 })
    end
end)

----------------------------
-- use pipe
----------------------------
RSGCore.Functions.CreateUseableItem('pipe', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'pipe', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'pipetobacco', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'match', 1)
    if hasItem1 and hasItem2 and hasItem3 then
        Player.Functions.RemoveItem('pipetobacco', 1)
        Player.Functions.RemoveItem('match', 1)
        TriggerClientEvent('rex-smoking:client:pipe', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_1'), type = 'inform', duration = 3000 })
    end
end)

----------------------------
-- use chewing tobacco
----------------------------
RSGCore.Functions.CreateUseableItem('chewingtobacco', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'chewingtobacco', 1)
    
    
    if hasItem1 then
        Player.Functions.RemoveItem('chewingtobacco', 1)
        TriggerClientEvent('rex-smoking:client:chewingtobacco', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_1'), type = 'inform', duration = 3000 })
    end
end)

----------------------------
-- use chewing gum
----------------------------
RSGCore.Functions.CreateUseableItem('cocainegum', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'cocainegum', 1)
    
    
    if hasItem1 then
        Player.Functions.RemoveItem('cocainegum', 1)
        TriggerClientEvent('rex-smoking:client:chewinggum', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_1'), type = 'inform', duration = 3000 })
    end
end)

----------------------------
-- Match Box
----------------------------
RSGCore.Functions.CreateUseableItem("matches", function(source, item)
    local Player = RSGCore.Functions.GetPlayer(source)
    if not Player then return end

    -- Remove 1 box of matches
    Player.Functions.RemoveItem("matches", 1)

    -- Give 5 single matches
    Player.Functions.AddItem("match", 5)

    -- Notify player
    TriggerClientEvent("ox_lib:notify", source, {
        title = "Matches",
        description = "You opened the box and received 5 matches.",
        type = "success"
    })
end)

----------------------
-- use peace pipe
----------------------------
RSGCore.Functions.CreateUseableItem('peacepipe', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'peacepipe', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'pipetobacco', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'match', 1)
    if hasItem1 and hasItem2 and hasItem3 then
        Player.Functions.RemoveItem('pipetobacco', 1)
        Player.Functions.RemoveItem('match', 1)
        TriggerClientEvent('rex-smoking:client:peacepipe', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_1'), type = 'inform', duration = 3000 })
    end
end)

----------------------
-- use opium pipe
----------------------------
RSGCore.Functions.CreateUseableItem('opiumpipe', function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local hasItem1 = RSGCore.Functions.HasItem(src, 'opiumpipe', 1)
    local hasItem2 = RSGCore.Functions.HasItem(src, 'opium', 1)
    local hasItem3 = RSGCore.Functions.HasItem(src, 'match', 1)
    if hasItem1 and hasItem2 and hasItem3 then
        Player.Functions.RemoveItem('opium', 1)
        Player.Functions.RemoveItem('match', 1)
        TriggerClientEvent('rex-smoking:client:opiumpipe', src)
    else
        TriggerClientEvent('ox_lib:notify', src, {title = locale('sv_lang_4'), type = 'inform', duration = 3000 })
    end
end)