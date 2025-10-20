function Change(id, category, change_type, value)
    id = tonumber(id)
    local ped = CachePed
    local gender
    if IsPedMale(ped) then gender = "male" else gender = "female" end
    if id < 1 then
        if category == "cloaks" or category == "ponchos" or category == "capes" then
            local categories = { "cloaks", "ponchos", "capes" }
            for k, v in pairs(categories) do
                Citizen.InvokeNative(0xD710A5007C2AC539, ped, v, 0)
                Citizen.InvokeNative(0xD710A5007C2AC539, ped, GetHashKey(v), 0)
                local hexHash = v:match("0x[%x]+")
                local decimalHash = tonumber(hexHash)
                Citizen.InvokeNative(0xD710A5007C2AC539, ped, decimalHash, 0)
                Citizen.InvokeNative(0xD710A5007C2AC539, ped, hexHash, true)
                NativeUpdatePedVariation(ped)
            end
        elseif category == "beard" then
            Citizen.InvokeNative(0xD710A5007C2AC539, ped, 0xF8016BCA, 0)
            NativeUpdatePedVariation(ped)
        elseif category == "hair" then
            Citizen.InvokeNative(0xD710A5007C2AC539, ped, 0x864B03AE, 0)
            NativeUpdatePedVariation(ped)
        else
            Citizen.InvokeNative(0xD710A5007C2AC539, ped, category, 0)
            Citizen.InvokeNative(0xD710A5007C2AC539, ped, GetHashKey(category), 0)
            local hexHash = category:match("0x[%x]+")
            local decimalHash = tonumber(hexHash)
            Citizen.InvokeNative(0xD710A5007C2AC539, ped, decimalHash, 0)
            Citizen.InvokeNative(0xD710A5007C2AC539, ped, hexHash, true)
            NativeUpdatePedVariation(ped)
        end
        hairstyleCache[category].model = id
    else
        if change_type == "model" then
            hairstyleCache[category].model = id
            if MURPHY_ASSETS[gender][category][id].drawable then
                hairstyleCache[category].texture = {}
                local drawable = MURPHY_ASSETS[gender][category][id].drawable
                local albedo = MURPHY_ASSETS[gender][category][id].variants[1].albedo
                local normal = MURPHY_ASSETS[gender][category][id].variants[1].normal
                local material = MURPHY_ASSETS[gender][category][id].variants[1].material
                local palette = MURPHY_ASSETS[gender][category][id].variants[1].palette
                local tint0 = MURPHY_ASSETS[gender][category][id].variants[1].tint[1]
                local tint1 = MURPHY_ASSETS[gender][category][id].variants[1].tint[2]
                local tint2 = MURPHY_ASSETS[gender][category][id].variants[1].tint[3]
                hairstyleCache[category].texture.palette = 1
                hairstyleCache[category].texture.tint0 = tint0
                hairstyleCache[category].texture.tint1 = tint1
                hairstyleCache[category].texture.tint2 = tint2
                UpdateCustomhairstyle(ped, drawable, albedo, normal, material, palette, tint0, tint1, tint2)
            else
                hairstyleCache[category].texture = 1
                NativeSetPedComponentEnabled(ped, MURPHY_ASSETS[gender][category][id][1].hash, false, true,
                    true)
            end
        else
            if MURPHY_ASSETS[gender][category][hairstyleCache[category].model].drawable then
                drawable = MURPHY_ASSETS[gender][category][hairstyleCache[category].model].drawable
                if change_type ~= "variants" then
                    albedo = MURPHY_ASSETS[gender][category][hairstyleCache[category].model].variants
                        [hairstyleCache[category].texture.palette].albedo
                    normal = MURPHY_ASSETS[gender][category][hairstyleCache[category].model].variants
                        [hairstyleCache[category].texture.palette].normal
                    material = MURPHY_ASSETS[gender][category][hairstyleCache[category].model].variants
                        [hairstyleCache[category].texture.palette].material
                    palette = MURPHY_ASSETS[gender][category][hairstyleCache[category].model].variants
                        [hairstyleCache[category].texture.palette].palette
                end
                if change_type == "variants" then
                    albedo = MURPHY_ASSETS[gender][category][hairstyleCache[category].model].variants[value].albedo
                    normal = MURPHY_ASSETS[gender][category][hairstyleCache[category].model].variants[value].normal
                    material = MURPHY_ASSETS[gender][category][hairstyleCache[category].model].variants[value].material
                    palette = MURPHY_ASSETS[gender][category][hairstyleCache[category].model].variants[value].palette
                    tint0 = tonumber(MURPHY_ASSETS[gender][category][hairstyleCache[category].model].variants[value]
                        .tint0)
                    tint1 = tonumber(MURPHY_ASSETS[gender][category][hairstyleCache[category].model].variants[value]
                        .tint1)
                    tint2 = tonumber(MURPHY_ASSETS[gender][category][hairstyleCache[category].model].variants[value]
                        .tint2)

                    hairstyleCache[category].texture.palette = value
                    hairstyleCache[category].texture.tint0 = tint0 or 0
                    hairstyleCache[category].texture.tint1 = tint1 or 0
                    hairstyleCache[category].texture.tint2 = tint2 or 0
                elseif change_type == 1 then
                    hairstyleCache[category].texture.tint0 = value
                    tint0 = value
                    tint1 = hairstyleCache[category].texture.tint1
                    tint2 = hairstyleCache[category].texture.tint2
                elseif change_type == 2 then
                    hairstyleCache[category].texture.tint1 = value
                    tint0 = hairstyleCache[category].texture.tint0
                    tint1 = value
                    tint2 = hairstyleCache[category].texture.tint2
                elseif change_type == 3 then
                    hairstyleCache[category].texture.tint2 = value
                    tint0 = hairstyleCache[category].texture.tint0
                    tint1 = hairstyleCache[category].texture.tint1
                    tint2 = value
                end
                UpdateCustomhairstyle(ped, drawable, albedo, normal, material, palette, tint0, tint1, tint2)
            else
                local catHash


                if category == "beard" then
                    catHash = -134124598
                else
                    if type(category) ~= "number" then
                        catHash = joaat(category)
                    else
                        catHash = category
                    end
                end
                if change_type == "variants" then
                    hairstyleCache[category].texture = value
                    NativeSetPedComponentEnabled(ped,
                        MURPHY_ASSETS[gender][category][hairstyleCache[category].model][value].hash, false, true, true)
                elseif change_type == 1 then
                    if type(hairstyleCache[category].texture) == "table" then
                        while GetComponentIndexByCategory(ped, catHash) == -1 do Wait(0) end
                        local componentIndex = GetComponentIndexByCategory(ped, catHash)
                        local _, drawable, albedo, normal, material = GetMetaPedAssetGuids(ped, componentIndex)
                        local palette, tint0, tint1, tint2 = GetMetaPedAssetTint(ped, componentIndex)
                        hairstyleCache[category].texture.tint0 = value
                        tint0 = value
                        tint1 = hairstyleCache[category].texture.tint1
                        tint2 = hairstyleCache[category].texture.tint2
                        palette = `metaped_tint_hair`
                        UpdateCustomhairstyle(ped, drawable, albedo, normal, material, palette, tint0, tint1, tint2)
                    else
                        local model = hairstyleCache[category].texture
                        hairstyleCache[category].texture = {}
                        hairstyleCache[category].texture.model = model
                        while GetComponentIndexByCategory(ped, catHash) == -1 do Wait(0) end
                        local componentIndex = GetComponentIndexByCategory(ped, catHash)
                        local _, drawable, albedo, normal, material = GetMetaPedAssetGuids(ped, componentIndex)
                        local palette, tint0, tint1, tint2 = GetMetaPedAssetTint(ped, componentIndex)
                        tint0 = value
                        hairstyleCache[category].texture.tint0 = tint0
                        hairstyleCache[category].texture.tint1 = tint1
                        hairstyleCache[category].texture.tint2 = tint2
                        palette = `metaped_tint_hair`
                        UpdateCustomhairstyle(ped, drawable, albedo, normal, material, palette, tint0, tint1, tint2)
                    end
                elseif change_type == 2 then
                    if type(hairstyleCache[category].texture) == "table" then
                        while GetComponentIndexByCategory(ped, catHash) == -1 do Wait(0) end
                        local componentIndex = GetComponentIndexByCategory(ped, catHash)
                        local _, drawable, albedo, normal, material = GetMetaPedAssetGuids(ped, componentIndex)
                        local palette, tint0, tint1, tint2 = GetMetaPedAssetTint(ped, componentIndex)
                        hairstyleCache[category].texture.tint1 = value
                        tint0 = hairstyleCache[category].texture.tint0
                        tint1 = value
                        tint2 = hairstyleCache[category].texture.tint2
                        palette = `metaped_tint_hair`
                        UpdateCustomhairstyle(ped, drawable, albedo, normal, material, palette, tint0, tint1, tint2)
                    else
                        local model = hairstyleCache[category].texture
                        hairstyleCache[category].texture = {}
                        hairstyleCache[category].texture.model = model
                        while GetComponentIndexByCategory(ped, catHash) == -1 do Wait(0) end
                        local componentIndex = GetComponentIndexByCategory(ped, catHash)
                        local _, drawable, albedo, normal, material = GetMetaPedAssetGuids(ped, componentIndex)
                        local palette, tint0, tint1, tint2 = GetMetaPedAssetTint(ped, componentIndex)
                        tint1 = value
                        hairstyleCache[category].texture.tint0 = tint0
                        hairstyleCache[category].texture.tint1 = tint1
                        hairstyleCache[category].texture.tint2 = tint2
                        palette = `metaped_tint_hair`
                        UpdateCustomhairstyle(ped, drawable, albedo, normal, material, palette, tint0, tint1, tint2)
                    end
                elseif change_type == 3 then
                    if type(hairstyleCache[category].texture) == "table" then
                        while GetComponentIndexByCategory(ped, catHash) == -1 do Wait(0) end
                        local componentIndex = GetComponentIndexByCategory(ped, catHash)
                        local _, drawable, albedo, normal, material = GetMetaPedAssetGuids(ped, componentIndex)
                        local palette, tint0, tint1, tint2 = GetMetaPedAssetTint(ped, componentIndex)
                        hairstyleCache[category].texture.tint2 = value
                        tint0 = hairstyleCache[category].texture.tint0
                        tint1 = hairstyleCache[category].texture.tint1
                        tint2 = value
                        palette = `metaped_tint_hair`
                        UpdateCustomhairstyle(ped, drawable, albedo, normal, material, palette, tint0, tint1, tint2)
                    else
                        local model = hairstyleCache[category].texture
                        hairstyleCache[category].texture = {}
                        hairstyleCache[category].texture.model = model
                        while GetComponentIndexByCategory(ped, catHash) == -1 do Wait(0) end
                        local componentIndex = GetComponentIndexByCategory(ped, catHash)
                        local _, drawable, albedo, normal, material = GetMetaPedAssetGuids(ped, componentIndex)
                        local palette, tint0, tint1, tint2 = GetMetaPedAssetTint(ped, componentIndex)
                        tint2 = value
                        hairstyleCache[category].texture.tint0 = tint0
                        hairstyleCache[category].texture.tint1 = tint1
                        hairstyleCache[category].texture.tint2 = tint2
                        palette = `metaped_tint_hair`
                        UpdateCustomhairstyle(ped, drawable, albedo, normal, material, palette, tint0, tint1, tint2)
                    end
                end
            end
        end
    end
end


function UpdateCustomhairstyle(playerPed, drawable, albedo, normal, material, palette, tint0, tint1, tint2)
    while not NativeHasPedComponentLoaded(playerPed) do
        Wait(0)
    end
    local playerPed = playerPed
    local _drawable = tonumber(drawable)
    local _albedo = tonumber(albedo)
    local _normal = tonumber(normal)
    local _material = tonumber(material)
    local _palette = tonumber(palette)
    local _tint0 = tonumber(tint0)
    local _tint1 = tonumber(tint1)
    local _tint2 = tonumber(tint2)
    SetMetaPedTag(playerPed, _drawable, _albedo, _normal, _material, _palette, _tint0, _tint1, _tint2)
    UpdatePedVariation(playerPed)
end

function NativeUpdatePedVariation(ped)
    Citizen.InvokeNative(0x704C908E9C405136, ped)
    Citizen.InvokeNative(0xAAB86462966168CE, ped, true) -- UNKNOWN "Fixes outfit"- always paired with _UPDATE_PED_VARIATION
    Citizen.InvokeNative(0xCC8CA3E88256E58F, ped, false, true, true, true, false)
    while not NativeHasPedComponentLoaded(ped) do
        Wait(1)
    end
end

function GetComponentIndexByCategory(ped, category)
    local numComponents = GetNumComponentsInPed(ped)
    for i = 0, numComponents - 1, 1 do
        local componentCategory = GetCategoryOfComponentAtIndex(ped, i)
        if componentCategory == category then
            return i
        end
    end
end

function GetNumComponentsInPed(ped)
    return Citizen.InvokeNative(0x90403E8107B60E81, ped, Citizen.ResultAsInteger())
end

function NativeGetPedComponentCategory(isFemale, componentHash)
    return Citizen.InvokeNative(0x5FF9A878C3D115B8, componentHash, isFemale, true)
end

function NativeSetPedComponentEnabled(ped, componentHash, immediately, isMp)
    local categoryHash = NativeGetPedComponentCategory(not IsPedMale(ped), componentHash)
    NativeFixMeshIssues(ped, categoryHash)

    Citizen.InvokeNative(0xD3A7B003ED343FD9, ped, componentHash, immediately, isMp, true)
    NativeUpdatePedVariation(ped)
end

function NativeFixMeshIssues(ped, categoryHash)
    Citizen.InvokeNative(0x59BD177A1A48600A, ped, categoryHash)
end

function SetMetaPedTag(ped, drawable, albedo, normal, material, palette, tint0, tint1, tint2)
    Citizen.InvokeNative(0xBC6DF00D7A4A6819, ped, drawable, albedo, normal, material, palette, tint0, tint1, tint2)
end


function IsPedReadyToRender(ped)
    repeat Wait(0) until Citizen.InvokeNative(0xA0BC8FAED8CFEB3C, ped or PlayerPedId())
end


function SetCharExpression(ped, value, expression)
    Citizen.InvokeNative(0x5653AB26C82938CF, ped, value, expression)
end

function GetPedComponentCategoryByIndex(ped, componentIndex)
    return Citizen.InvokeNative(0xCCB97B51893C662F, ped, componentIndex)
end

function GetCategoryOfComponentAtIndex(ped, componentIndex)
    return Citizen.InvokeNative(0x9b90842304c938a7, ped, componentIndex, 0, Citizen.ResultAsInteger())
end
function CreatePed_2(modelHash, x, y, z, heading, isNetwork, thisScriptCheck, p7, p8)
	return Citizen.InvokeNative(0xD49F9B0955C367DE, modelHash, x, y, z, heading, isNetwork, thisScriptCheck, p7, p8)
end

function GetMetaPedAssetGuids(ped, index)
    return Citizen.InvokeNative(0xA9C28516A6DC9D56, ped, index, Citizen.PointerValueInt(), Citizen.PointerValueInt(), Citizen.PointerValueInt(), Citizen.PointerValueInt())
end

function GetMetaPedAssetTint(ped, index)
    return Citizen.InvokeNative(0xE7998FEC53A33BBE, ped, index, Citizen.PointerValueInt(), Citizen.PointerValueInt(), Citizen.PointerValueInt(), Citizen.PointerValueInt())
end

function UpdateCustomClothes(playerPed, drawable, albedo, normal, material, palette, tint0, tint1, tint2)
    while not NativeHasPedComponentLoaded(playerPed) do
        Wait(0)
    end
    local playerPed = playerPed
    local _drawable = drawable
    local _albedo = albedo
    local _normal = normal
    local _material = material
    local _palette = palette
    local _tint0 = tonumber(tint0)
    local _tint1 = tonumber(tint1)
    local _tint2 = tonumber(tint2)

    SetMetaPedTag(playerPed, _drawable, _albedo, _normal, _material, _palette, _tint0, _tint1, _tint2)
    UpdatePedVariation(playerPed)
end

function SetMetaPedTag(ped, drawable, albedo, normal, material, palette, tint0, tint1, tint2)
    Citizen.InvokeNative(0xBC6DF00D7A4A6819, ped, drawable, albedo, normal, material, palette, tint0, tint1, tint2)
end
function UpdatePedVariation(ped)
    Citizen.InvokeNative(0xAAB86462966168CE, ped, true) -- UNKNOWN "Fixes outfit"- always paired with _UPDATE_PED_VARIATION
    Citizen.InvokeNative(0xCC8CA3E88256E58F, ped, false, true, true, true, false) -- _UPDATE_PED_VARIATION
end




function GetCategoryNameByHash(gender, target)
    -- Vérifier les catégories connues dans pedTags


    for _, tagName in pairs(catlist[gender]) do
        local hash = joaat(tagName)
        if IsMetaPedUsingComponentCategory(ped, hash) then
            print(string.format("^3General equipped: ^7%s | ^6Hash: ^7%s", tagName, hash))
            if target == hash then
                return tagName
            end
        end
    end


    for _, tagName in ipairs(pedTags) do
        local hash = joaat(tagName)
        if IsMetaPedUsingComponentCategory(ped, hash) then
            print(string.format("^3Category equipped: ^7%s | ^6Hash: ^7%s", tagName, hash))
            if target == hash then
                return tagName
            end
        end
    end
    
    -- Vérifier les composants
    for _, componentName in ipairs(components) do
        local hash = joaat(componentName)
        if IsMetaPedUsingComponentCategory(ped, hash) then
            print(string.format("^3Component equipped: ^7%s | ^6Hash: ^7%s", componentName, hash))
            if target == hash then
                return componentName
            end
        end
    end
    
    -- Vérifier les catégories spéciales avec hash hexadécimal
    for _, tagName in ipairs(pedTags) do
        local hexHash = tagName:match("0x[%x]+")
        if hexHash then
            local decimalHash = tonumber(hexHash)
            if decimalHash and IsMetaPedUsingComponentCategory(ped, decimalHash) then
                local baseName = tagName
                print(string.format("^3Special category equipped: ^7%s | ^6Hash: ^7%s", baseName or tagName, decimalHash))
                if target == decimalHash then
                    return tagName
                end
            end
        end
    end


    return nil
end

function IsMetaPedUsingComponentCategory(ped, componentCategory)
    return Citizen.InvokeNative(0xFB4891BD7578CDC1, ped, componentCategory)
end


function CheckCategoryEquipped(ped)
    local equipped = {}
    for _, tagName in ipairs(pedTags) do
        local hash = joaat(tagName)
        if IsMetaPedUsingComponentCategory(ped, hash) then
            print(string.format("^3Category equipped: ^7%s | ^6Hash: ^7%s", tagName, hash))
            table.insert(equipped, hash)
        end
    end
    
    -- Vérifier les composants
    for _, componentName in ipairs(components) do
        local hash = joaat(componentName)
        if IsMetaPedUsingComponentCategory(ped, hash) then
            print(string.format("^3Component equipped: ^7%s | ^6Hash: ^7%s", componentName, hash))
            table.insert(equipped, hash)
        end
    end
    
    -- Vérifier les catégories spéciales avec hash hexadécimal
    for _, tagName in ipairs(pedTags) do
        local hexHash = tagName:match("0x[%x]+")
        if hexHash then
            local decimalHash = tonumber(hexHash)
            if decimalHash and IsMetaPedUsingComponentCategory(ped, decimalHash) then
                local baseName = tagName
                print(string.format("^3Special category equipped: ^7%s | ^6Hash: ^7%s", baseName or tagName, decimalHash))
                table.insert(equipped, decimalHash)
            end
        end
    end
    return equipped
end


function UpdateShopItemWearableState(ped, shopItemHash, wearableStateHash, isMultiplayer)
    Citizen.InvokeNative(0x66B957AAC2EAAEAB, ped, shopItemHash, wearableStateHash, 0, isMultiplayer, 1)
end

function NativeUpdatePedVariation(ped)
    Citizen.InvokeNative(0x704C908E9C405136, ped)
    Citizen.InvokeNative(0xAAB86462966168CE, ped, true) -- UNKNOWN "Fixes outfit"- always paired with _UPDATE_PED_VARIATION
    Citizen.InvokeNative(0xCC8CA3E88256E58F, ped, false, true, true, true, false)
    while not NativeHasPedComponentLoaded(ped) do
        Wait(1)
    end
end

function NativeHasPedComponentLoaded(ped)
    return Citizen.InvokeNative(0xA0BC8FAED8CFEB3C, ped)
end

function ApplyShopItemToPed(comp, ped)
    Citizen.InvokeNative(0xD3A7B003ED343FD9, ped or PlayerPedId(), comp, false, false, false)
    Citizen.InvokeNative(0xD3A7B003ED343FD9, ped or PlayerPedId(), comp, false, true, false)
end

function EquipMetaPedOutfit(hash, ped)
    Citizen.InvokeNative(0x1902C4CFCC5BE57C, ped or PlayerPedId(), hash)
end


RegisterNetEvent('RSG:logout', function()
    for k, v in pairs(charselectpeds) do
        if DoesEntityExist(v) then
            DeleteEntity(v)
        end
    end
    if NetworkIsSessionStarted() and PlayerPedId() ~= 0 and IsPedAPlayer(PlayerPedId()) then
        while not IsScreenFadedOut() and not IsScreenFadedIn() do
            Wait(100)
        end
        Wait(1000)
        TriggerServerEvent('murphy_creator:getCharacters')
        return
    end
end)