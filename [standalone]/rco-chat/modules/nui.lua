local function handleNuiMessage(data, focus)
    SendNUIMessage(data)
    if focus then
        SetNuiFocus(true, true)
    end
end

RegisterNUICallback('requestChannelConfig', function(data, cb)
    TriggerServerEvent('rco_chat:requestChannelConfig')
    if cb then cb('ok') end
end)

RegisterNUICallback('loaded', function(data, cb)
    TriggerServerEvent('chat:init')
    
    if cb then cb('ok') end
end)

AddEventHandler('onClientResourceStart', function(resName)
    if resName == GetCurrentResourceName() then
    end
end)

return handleNuiMessage
