function OpenAddMoney(src,amount)  
    -- Player = XXX
    print('OpenAddMoney.. '..src..' '..itemName..' '..amount)


end

function OpenRemoveItem(src,itemName,amount)
    -- Player = XXX
    print('OpenRemoveItem .. '..src..' '..itemName..' '..amount)


end

function OpenAddItem(src,itemName,amount)
    print('OpenAddItem .. '..src..' '..itemName..' '..amount)
    -- Player = XXX


end

function OpenGetJob(_)
    local src = _
    local tabJob = false
    print('OpenGetJob .. '..src)

    -- local Player = -- XX

    -- local a = Player.PlayerData.job.name
    -- local b = Player.PlayerData.job.grade.level

    tabJob = {name = a, grade = b}

    return tabJob
end

function OpenGetItem(_,_itemName)
    local src = _
    print('OpenGetItem .. '..src..' '..itemName)

    -- local Player = -- XX
    -- local itemName = -- XX

    if itemName == nil then 
        itemCount = 0
    else 
        itemCount = itemName.amount
    end


    return itemCount
end


function OpenGetLabelItem(_)
    local item = _
    print('CustomGetLabelItem .. '..item)

    return -- item.label
end