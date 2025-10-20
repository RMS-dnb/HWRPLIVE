if Config.framework == 'vorp' then
    RegisterNetEvent('vorp:SelectedCharacter')
    AddEventHandler('vorp:SelectedCharacter', function()
        Callback.triggerServer('murphy_clothing:GetCurrentClothes', function(datatable, id)
            if IsPedMale(PlayerPedId()) then SelectedGender = "male" else SelectedGender = "female" end
            Wait(1000)
    if type(baseskin) ~= "table" then
        baseskin = {}
    end
    if not baseskin["bodies_upper"] or baseskin["bodies_upper"] == 0 then
        baseskin["bodies_upper"] = GetComponentEquiped(PlayerPedId(), "bodies_upper")
    end
    if not baseskin["bodies_lower"] or baseskin["bodies_lower"] == 0 then
        baseskin["bodies_lower"] = GetComponentEquiped(PlayerPedId(), "bodies_lower")
    end
            print(string.format("Base skin loaded: Upper Body = %s, Lower Body = %s", tostring(baseskin["bodies_upper"]), tostring(baseskin["bodies_lower"])))
            if datatable then
                local loadclothes = false
                for k, v in pairs(datatable) do
                    if v.model > 0 then
                        loadclothes = true
                        break
                    end
                end
                if loadclothes then
                    TriggerEvent("murphy_clothes:clotheitem",datatable, id)
                end
            end
        end)
    end)
    
        RegisterNetEvent('vorp_core:Client:OnPlayerRevive')
        AddEventHandler('vorp_core:Client:OnPlayerRevive', function ()
            Wait(500)
            Callback.triggerServer('murphy_clothing:GetCurrentClothes', function(datatable, id)
                if IsPedMale(PlayerPedId()) then SelectedGender = "male" else SelectedGender = "female" end
                if datatable then
                    local loadclothes = false
                    for k, v in pairs(datatable) do
                        if v.model > 0 then
                            loadclothes = true
                            break
                        end
                    end
                    if loadclothes then
                        TriggerEvent("murphy_clothes:clotheitem",datatable, id)
                    end
                end
            end)
        end)

        RegisterNetEvent('vorp_core:Client:OnPlayerRespawn')
        AddEventHandler('vorp_core:Client:OnPlayerRespawn', function ()
            Wait(500)
            Callback.triggerServer('murphy_clothing:GetCurrentClothes', function(datatable, id)
                if IsPedMale(PlayerPedId()) then SelectedGender = "male" else SelectedGender = "female" end
                if datatable then
                    local loadclothes = false
                    for k, v in pairs(datatable) do
                        if v.model > 0 then
                            loadclothes = true
                            break
                        end
                    end
                    if loadclothes then
                        TriggerEvent("murphy_clothes:clotheitem",datatable, id)
                    end
                end
            end)
        end)


        RegisterNetEvent("murphy_clothes:outfitchanged", function ()
            --- your corde
        end)
end