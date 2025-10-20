if Config.framework == 'rsg-core' then
    RegisterNetEvent('RSGCore:Client:OnPlayerLoaded')
    AddEventHandler('RSGCore:Client:OnPlayerLoaded', function()
        TriggerEvent("murphy_barber:loadbarberoverlay")
    end)

    RegisterNetEvent('rsg-medic:client:playerRevive')
    AddEventHandler('rsg-medic:client:playerRevive', function()
        TriggerEvent("murphy_barber:loadbarberoverlay")
    end)

    RegisterNetEvent('rsg-medic:client:adminRevive')
    AddEventHandler('rsg-medic:client:adminRevive', function()
        TriggerEvent("murphy_barber:loadbarberoverlay")
    end)
end
