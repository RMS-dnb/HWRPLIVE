RegisterNetEvent("RL_Dance:Get_Custom_Request")
AddEventHandler("RL_Dance:Get_Custom_Request", function(PlayerIdSendRequest, PlayerIdGetRequest)

	print('Custom Request Event')

	-- if player accept dance use TriggerServerEvent('rl_dance:accept_request', PlayerIdSendRequest, PlayerIdGetRequest)
	-- Config.AcceptRequestKey
	-- Config.RefuseRequestKey
end)