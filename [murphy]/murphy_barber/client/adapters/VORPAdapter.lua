if Config.framework == 'vorp' then
    RegisterNetEvent('vorp:SelectedCharacter')
    AddEventHandler('vorp:SelectedCharacter', function()
        Wait(500)
        TriggerEvent("murphy_barber:loadbarberoverlay")
    end)

    RegisterNetEvent('vorp_core:Client:OnPlayerRevive')
    AddEventHandler('vorp_core:Client:OnPlayerRevive', function()
        Wait(500)
        TriggerEvent("murphy_barber:loadbarberoverlay")
    end)

    RegisterNetEvent('vorp_core:Client:OnPlayerRespawn')
    AddEventHandler('vorp_core:Client:OnPlayerRespawn', function()
        Wait(500)
        TriggerEvent("murphy_barber:loadbarberoverlay")
    end)
end
