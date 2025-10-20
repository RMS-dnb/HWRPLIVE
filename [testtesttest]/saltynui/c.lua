local ismuted = false

--- SaltyNUI Events ---
RegisterNetEvent('SaltyNUI:TsNotActive')
AddEventHandler('SaltyNUI:TsNotActive', function() 

	SendNUIMessage({action = "toggleWindow", value = "true"})
	ismuted = true

	
end)
RegisterNetEvent('SaltyNUI:TsActive')
AddEventHandler('SaltyNUI:TsActive', function() 

	SendNUIMessage({action = "toggleWindow", value = "false"})
	ismuted = false

	
end)


-- SaltyChat Events --- 
AddEventHandler('SaltyChat_SoundStateChanged', function(muted) 

if (muted) then

	SendNUIMessage({action = "toggleWindow", value = "true"})
	ismuted = true

	else
	ismuted = false
	SendNUIMessage({action = "toggleWindow", value = "false"})

	end
end)

--- Disable NUI after you got moved in TeamSpeak ---
AddEventHandler('SaltyChat_PluginStateChanged', function(PluginState) 
    if PluginState == 2 or PluginState == 3 then 
        SendNUIMessage({action = "toggleWindow", value = "false"})

    else
        SendNUIMessage({action = "toggleWindow", value = "true"})
    end
end)

--- Disable Movement if muted ---
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		local playerPed = PlayerPedId()

		if ismuted then
			FreezeEntityPosition(PlayerPedId(), true)

			
		else
			Citizen.Wait(500)
			FreezeEntityPosition(PlayerPedId(), false)
			
		end
	end
end)
