ContextualDataOn = false
function UpdateContextualDatas(value, category)
    if value then
        if value > 0 then 
            if overlays_info[category] then
                local tints = {
                    {tintId = 1, value = 1},
                    {tintId = 2, value = 1},
                    {tintId = 3, value = 1}
                }
                local variationAmount = 1
                if category == "eyeliners" then variationAmount = 15 end
                if category == "shadows" then variationAmount = 5 end
                if category == "lipsticks" then variationAmount = 7 end
                local data = {
                    variationAmount = variationAmount ,
                    variationValue = 1,
                    tints = tints,
                    contextual = "variation",
                    advanced = true,
                    advancedValues = {
                        {
                            valueName= "Opacity",
                            valueId= 1,
                            valueValue= 100,
                            maxValue= 100,
                            minValue= 0
                        }, 
                        {
                            valueName= "Palette",
                            valueId= 2,
                            valueValue= 1,
                            maxValue= 25,
                            minValue= 1
                        }
                    },
                    category = category,
                }
            
                SendNUIMessage(
                    {
                        type = "contextualDatas",
                        data = data
            
                    }
                )
            else
                local variationValue = 1
                if type(hairstyleCache[category].texture) == "table" then
                    variationValue = hairstyleCache[category].texture.palette or hairstyleCache[category].texture.model
                    
                else
                    variationValue = hairstyleCache[category].texture
                end
                local variationAmount = 1
                local tints = {}
                if MURPHY_ASSETS[SelectedGender][category][value].variants then
                    variationAmount = #MURPHY_ASSETS[SelectedGender][category][value].variants
                    tint0value = hairstyleCache[category].texture.tint0 or MURPHY_ASSETS[SelectedGender][category][value].variants[1].tint[1] or 1
                    tint1value = hairstyleCache[category].texture.tint1 or MURPHY_ASSETS[SelectedGender][category][value].variants[1].tint[2] or 1
                    tint2value = hairstyleCache[category].texture.tint2 or MURPHY_ASSETS[SelectedGender][category][value].variants[1].tint[3] or 1
                    tints = {
                        {tintId = 1, value = tint0value},
                        {tintId = 2, value = tint1value},
                        {tintId = 3, value = tint2value}
                    }
                else
                    variationAmount = #MURPHY_ASSETS[SelectedGender][category][value]
                    if type(hairstyleCache[category].texture) == "table" then 
                        tint0value = hairstyleCache[category].texture.tint0 or 1
                        tint1value = hairstyleCache[category].texture.tint1 or 1
                        tint2value = hairstyleCache[category].texture.tint2 or 1
                    else
                        tint0value = 1
                        tint1value = 1
                        tint2value = 1
                    end
                    tints = {
                        {tintId = 1, value = tint0value},
                        {tintId = 2, value = tint1value},
                        {tintId = 3, value = tint2value}
                    }
                end
                local data = {
                    variationAmount = variationAmount,
                    variationValue = variationValue or 1,
                    tints = tints,
                    contextual = "variation",
                    category = category,
                }
            
                SendNUIMessage(
                    {
                        type = "contextualDatas",
                        data = data
            
                    }
                )
            end
            if ContextualDataOn == false then
                ContextualDataOn = true
                PlaySound("SELECT", "HUD_PLAYER_MENU")
            end
        else
            PlaySound("BACK", "HUD_PLAYER_MENU")
            ContextualDataOn = false
            SendNUIMessage(
                {
                    type = "hidecontextualDatas",
        
                }
            )
        end


    end
end

OutfitPrice = 0
function CalculatePrice()
	local price = 0
    local outfitmodifier = OutfitPrice or 0
        for k,v in pairs(MURPHY_ASSETS[SelectedGender]) do
            if OldhairstyleCache[k].model then 
                if OldhairstyleCache[k].model ~= hairstyleCache[k].model then
                    if hairstyleCache[k].model > 0 then
                        if Config.Price[k] then
                            price = price + Config.Price[k]
                        else
                            price = price
                        end
                    end
                end
            else
                if hairstyleCache[k].model > 0 then
                    if Config.Price[k] then
                        price = price + Config.Price[k]
                    else
                        price = price
                    end
                end
            end
        end
        for k,v in pairs(overlay_all_layers) do
            for i, j in pairs(baseoverlay) do
                if v.name == j.name then
                    if v.visibility > 0 then
                        if Config.Price[v.name] then
                            price = price + Config.Price[v.name]
                        else
                            price = price
                        end
                    end
                end
            end
        end
        SendNUIMessage({
            type = "setOutfitPricet",
            price = price + outfitmodifier
        })

		return price + outfitmodifier
end
