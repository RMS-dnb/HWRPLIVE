-- ent
local CURRENT_TRAIN = nil

-- pool
local blipTable = {}
local Peds = {} 
local trainTab = {}

-- random
local swap = 1
local hash = nil
local train = nil
local workData = nil
local workTrainId = nil

-- speed logic 
local maxSpeed = 0
local speedUnit = "Km/h"
local speedMult = 3.6

if Config.WorldLore.SpeedUnitsMPH then
	speedUnit = "MPH"
	speedMult = 2.23
end

if Config.job.managmentSystem then 
	Config.Work.forBossMoney = false 
end

-- upgrade and managment
local upgradeOverheat = 0
local statusDic = nil
local isHaveWork = false
local inputText = nil

-- Showcase
local coordsTeleportBack = nil
local buyTrainIndex = 1
local showcaseTrain = nil
local camShowcase = nil
local showcaseModel = nil
local cameraSet = 1 
local isRefreshing = false
local shouldResetTimer = false
local trainWagons = nil

-- fuel logick
local isSpeedLocked = false
local isDriveTrain = false 
local isOverheated = false
local fuelOnTrain = nil
local feedkey = false

-- delivery 
local hand = false
local boxInWagon = 0
local supplies = {}
local boxDelivery = 0
local blip = nil
local radiusBlip = nil

-- callback
local coal = nil
local water = nil
local control = true
local currentJob = nil
local job = nil
local license = nil
local bossMoney = nil

local isJob = false


--------------------------------------------
-- Function
--------------------------------------------

function playMoveAnim(animDict,animName)
    local ped = PlayerPedId()
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
        Citizen.Wait(0)
    end
    TaskPlayAnim(ped, animDict, animName, 4.0, 4.0, -1, 25, 0, false, false, false)
end

function playStandeAnim(animDict,animName,time)
    local ped = PlayerPedId()
    RequestAnimDict(animDict)
    while not HasAnimDictLoaded(animDict) do
        Citizen.Wait(0)
    end
    TaskPlayAnim(ped, animDict, animName, 4.0, 4.0, -1, 25, 0, false, false, false)
    Citizen.Wait(time)
    ClearPedTasks(ped)
end

function calculatePercentage(baseValue, percentage)
    local result = baseValue * (percentage / 100)
    return result
end

function SetAnim(animDict,animName,wait)
    Citizen.CreateThread(function()
        FreezeEntityPosition(PlayerPedId(),true)
        SetCurrentPedWeapon(PlayerPedId(), GetHashKey('WEAPON_UNARMED'), true)
        
        RequestAnimDict(animDict)
        while not HasAnimDictLoaded(animDict) do
            Citizen.Wait(0)
        end

        TaskPlayAnim(PlayerPedId(), animDict,animName, 3.0, 3.0, -1, 25, 0, false, false, false)
        Citizen.Wait(wait)
        FreezeEntityPosition(PlayerPedId(),false)
    end)
end

function StartParticleEffectOnPlayer(ent, ptfx_dictionary, ptfx_name)
	local current_ptfx_handle_id = nil
	local ptfx_offset_x = 0.0
	local ptfx_offset_y = 5.0
	local ptfx_offset_z = 0.0
	local ptfx_rot_x = 0.0
	local ptfx_rot_y = 0.0
	local ptfx_rot_z = 2.0
	local ptfx_scale = 1.0
	local ptfx_axis_x = 0
	local ptfx_axis_y = 0
	local ptfx_axis_z = 0
    local playerPed = ent
	StopParticleFxLooped(current_ptfx_handle_id, false)

	if not HasNamedPtfxAssetLoaded(ptfx_dictionary) then
        RequestNamedPtfxAsset(ptfx_dictionary)
        while not HasNamedPtfxAssetLoaded(ptfx_dictionary) do
            Citizen.Wait(0)
        end
    end

	UseParticleFxAsset(ptfx_dictionary)
    current_ptfx_handle_id = StartNetworkedParticleFxLoopedOnEntity(
        ptfx_name,
        playerPed,
        ptfx_offset_x,
        ptfx_offset_y,
        ptfx_offset_z,
        ptfx_rot_x,
        ptfx_rot_y,
        ptfx_rot_z,
        ptfx_scale,
        ptfx_axis_x,
        ptfx_axis_y,
        ptfx_axis_z
    )

	return current_ptfx_handle_id
end


--------------------------------------------
-- Train Switch 
--------------------------------------------

function SwitchCheck(LeftOrRight)
	local notif = true
	for k,v in pairs(Config.RailroadSwitch) do
		if #(GetEntityCoords(CURRENT_TRAIN) - v.coords) <= 120 then 

			local turn = 0

			if v.default == 0 and LeftOrRight == 'right' then 
				turn = 0
			elseif v.default == 1 and LeftOrRight == 'right' then 
				turn = 1
			elseif v.default == 1 and LeftOrRight == 'left' then 
				turn = 0
			elseif v.default == 0 and LeftOrRight == 'left' then 
				turn = 1
			end
			
			Citizen.InvokeNative(0xE6C5E2125EB210C1,v.Index,v.switch,turn)
			Citizen.InvokeNative(0x3ABFA128F5BF5A70,v.Index,v.switch,turn)
			notif = false
		end
	end

	if notif then 
		TriggerEvent('Notification:'..GetCurrentResourceName(), 'error', texts.notif.NoSwitch, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
	else 
		TriggerEvent('Notification:'..GetCurrentResourceName(), 'success', texts.notif.Swapped, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
	end
end

function CheckDistance()
	Citizen.CreateThread(function()
		Citizen.Wait(500)
		local coords = GetEntityCoords(CURRENT_TRAIN) - GetEntityForwardVector(CURRENT_TRAIN) 
		Citizen.Wait(200)
		local coords2 = GetEntityCoords(CURRENT_TRAIN)
		local distance = #(coords2 - coords)

		if distance > 1 and not IsVehicleStopped(CURRENT_TRAIN) then 
			statusDic = 'forward'
		elseif IsVehicleStopped(CURRENT_TRAIN) then 
			statusDic = 'halt'
		else
			statusDic = 'backwards'
		end
	end)
end


function SetProp(propName,bone,coords)
    local boneIndex = GetEntityBoneIndexByName(PlayerPedId(), bone)
    AttachEntityToEntity(propName, PlayerPedId(), boneIndex, x,y,z,xr,yr,zr, true, true, false, true, 1, true, false, false)
end

function grabBoxUp(_)
    hand = _
	control = true 
	DisableControl()
    local pos = GetEntityCoords(hand)
    Wait(100)
    TaskTurnPedToFaceEntity(PlayerPedId(),hand,500,1,1,1)
    Citizen.Wait(500)
    SetCurrentPedWeapon(PlayerPedId(), GetHashKey('WEAPON_UNARMED'), true)
    SetAnim("amb_work@world_human_box_pickup@1@male_a@stand_enter","enter_back_rf",2500)
    Citizen.Wait(2500)
    local boneIndex = GetEntityBoneIndexByName(PlayerPedId(), 'SKEL_R_Finger12')
    AttachEntityToEntity(hand, PlayerPedId(), boneIndex, 0.14, -0.19, 0.12, -210.0, -15.0, -5.0, true, true, false, true, 1, true, false, false)
    SetAnim("mech_carry_box","idle",0)
end

function deliveryTrainInteraction()
	if hand then
		local pcoords = GetEntityCoords(PlayerPedId())
		SetAnim('amb_work@world_human_box_put_down@2@male_a@walk_exit', 'exit_backright',1300)
		Citizen.Wait(700)
		SetEntityAsNoLongerNeeded(hand)
		DeleteEntity(hand)
		Citizen.Wait(500)
		boxInWagon = boxInWagon + 1
		ClearPedTasks(PlayerPedId())
		hand = false
		control = false
		TriggerEvent('Notification:'..GetCurrentResourceName(), 'inform',texts.notif.boxLoaded..' ['..boxInWagon..']', Config.Textures.alert[1], Config.Textures.alert[2], 2000)
	elseif not hand and boxInWagon >= 1 then
		control = true 
		DisableControl()
		boxInWagon = boxInWagon -1
		SetAnim("amb_work@world_human_box_pickup@3@male_a@base","base",1000)
		Citizen.Wait(500)
		SetAnim("mech_carry_box","idle",0)
		local coords = GetEntityCoords(PlayerPedId())
		hand = CreateObject("P_CRATE03X",coords, true, false, false)
		local boneIndex = GetEntityBoneIndexByName(PlayerPedId(), 'SKEL_R_Finger12')
		AttachEntityToEntity(hand, PlayerPedId(), boneIndex, 0.14, -0.19, 0.12, -210.0, -15.0, -5.0, true, true, false, true, 1, true, false, false)
		TriggerEvent('Notification:'..GetCurrentResourceName(), 'inform',texts.notif.boxUnloaded..' ['..boxInWagon..']', Config.Textures.alert[1], Config.Textures.alert[2], 2000)
	else 
		TriggerEvent('Notification:'..GetCurrentResourceName(), 'inform',texts.notif.noBoxInHand, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
	end 
end


function placeBox(coords)

	local deliveryPlace = coords
	local maxBox = Config.Work.BoxMaxNumber

	local spacing = 1.0
	local direction = 1
	local step = 1 
	
	local currentX = deliveryPlace.x
	local currentY = deliveryPlace.y
	
	local directions = {
		{1, 0}, 
		{0, 1},  
		{-1, 0}, 
		{0, -1}   
	}
	
	local directionIndex = 1
	
	for i = 1, maxBox do
		supplies[i] = CreateObject("P_CRATE03X", currentX, currentY, deliveryPlace.z, true, false, false)
		SetEntityHeading(supplies[i], deliveryPlace.w)
		PlaceObjectOnGroundProperly(supplies[i], true)
		currentX = currentX + directions[directionIndex][1] * spacing
		currentY = currentY + directions[directionIndex][2] * spacing
		if i % step == 0 then
			directionIndex = directionIndex % 4 + 1 
				if directionIndex == 1 or directionIndex == 3 then
				step = step + 1
			end
		end
	end	
end

function deliveryFinish()

	isHaveWork = false
	local netId = workTrainId
	local work = false
	local nameOfStatus = 'work'
	local statusValue = false
	TriggerServerEvent('d-labs-train:server:syncTrainManagment',netId,nameOfStatus,statusValue)
	RemoveBlip(radiusBlip)
	RemoveBlip(blip)

	if hand then
		SetEntityAsNoLongerNeeded(hand)
		DeleteEntity(hand)
		ClearPedTasks(PlayerPedId())
	end

	for k,v in pairs(supplies) do
		DeleteEntity(v)
	end

	hand = false
	boxInWagon = 0
	supplies = {}
	boxDelivery = 0
end

function deliveryPrompt()
	Citizen.CreateThread(function()
		while isHaveWork do
			local pcoords = GetEntityCoords(PlayerPedId())
			local t = 5 

			local SPoint = Config.TrainStations[workData.pos].SellPoint.coords
			local dist = #(pcoords-SPoint)

			if dist < 15.0 then
				t = 0
				Citizen.InvokeNative(0x2A32FAA57B937173, Config.Ring.marker, SPoint.x, SPoint.y, SPoint.z-0.95, 0, 0, 0, 0,0,0, Config.Ring.scale.x,Config.Ring.scale.y, Config.Ring.scale.z, Config.Ring.r,  Config.Ring.g, Config.Ring.b,  Config.Ring.a, 0, 0, 2, 0, 0, 0, 0)
			else
				t = 5000
			end

			if dist < Config.PromptDistance then 
				t = 0
				activePrompt(8)

				if pressPrompt(10) then

					if hand then
						local pcoords = GetEntityCoords(PlayerPedId())
						SetAnim('amb_work@world_human_box_put_down@2@male_a@walk_exit', 'exit_backright',1300)
						Citizen.Wait(700)
						SetEntityAsNoLongerNeeded(hand)
						DeleteEntity(hand)
						Citizen.Wait(500)
						ClearPedTasks(PlayerPedId())
						hand = false
						control = false
						Citizen.Wait(1*1000)
						boxDelivery = boxDelivery + 1 
						if Config.Work.paymentForBox then

							TriggerServerEvent('d-labs-trains:server:giveMoney',workData)
							TriggerEvent('Notification:'..GetCurrentResourceName(), 'success', texts.money .. ' '..workData.reward / Config.Work.BoxMaxNumber..' $', Config.Textures.alert[1], Config.Textures.alert[2], 2000)

							if boxDelivery == Config.Work.BoxMaxNumber then
								deliveryFinish()
							end
						else
							if boxDelivery == Config.Work.BoxMaxNumber then
								deliveryFinish()
								TriggerServerEvent('d-labs-trains:server:giveMoney',workData)
								TriggerEvent('Notification:'..GetCurrentResourceName(), 'success', texts.money .. ' '..workData.reward ..' $', Config.Textures.alert[1], Config.Textures.alert[2], 2000)
							else
								local boxRemains = Config.Work.BoxMaxNumber - boxDelivery
							end
						end
					else 
						TriggerEvent('Notification:'..GetCurrentResourceName(), 'error', texts.notif.noBoxInHand, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
					end
				end
			end
			Citizen.Wait(t)
		end
	end)
end

function jobBlipDelivery()
	blip = N_0x554d9d53f696d002(1774867085, Config.TrainStations[workData.pos].SellPoint.coords.x, Config.TrainStations[workData.pos].SellPoint.coords.y)
	SetBlipSprite(blip, -250506368, 1)
	SetBlipScale(blip, 1.0) 
	Citizen.InvokeNative(0x9CB1A1623062F402, blip, texts.EndTelegram)
	radiusBlip = N_0x45f13b7e0a15c880(1774867085, Config.TrainStations[workData.pos].SellPoint.coords.x, Config.TrainStations[workData.pos].SellPoint.coords.y, Config.TrainStations[workData.pos].SellPoint.coords.z, 150.0)  -- 50.0 je poloměr zóny
end

function deliverySetup(id)
	jobBlipDelivery()
	deliveryPrompt()
	placeBox(Config.TrainStations[id].SellPoint.spawnBox)

    while isHaveWork do 
        Citizen.Wait(0)
        local pedCoords = GetEntityCoords(PlayerPedId())
		local closestEntity = nil
		local closestDist = math.huge

		local distanceToShow = Config.PromptDistance

		for k,v in pairs(supplies) do       
			local coordsf = GetEntityCoords(v)
			local dist = #(pedCoords - coordsf) 
			
			if dist < closestDist then
				closestDist = dist
				closestEntity = v
			end
		end

		if closestEntity and closestDist < distanceToShow and hand == false then
			Citizen.InvokeNative(0x7DFB49BCDB73089A, closestEntity, true)

			activePrompt(10)

			if pressPrompt(12) then
				grabBoxUp(closestEntity)
				Citizen.Wait(2*1000)
			end

			for k,v in pairs(supplies) do
				if v ~= closestEntity then
					Citizen.InvokeNative(0x7DFB49BCDB73089A, v, false)
				end
			end
		else
			for k,v in pairs(supplies) do
				Citizen.InvokeNative(0x7DFB49BCDB73089A, v, false)
			end
			Citizen.Wait(2*1000)
		end
    end
end



RegisterNetEvent('d-labs-train:client:setupJobWork')
AddEventHandler('d-labs-train:client:setupJobWork', function(id)
	isHaveWork = true
	deliverySetup(id)
end)

RegisterNetEvent('d-labs-train:client:getTrains')
AddEventHandler('d-labs-train:client:getTrains', function(trains)
	MenuData.CloseAll()

	local elements = {}

	for _, train in ipairs(trains) do
		local dot = '🟢 '

		if train.status == 'inWorld' then 
			dot = '🟠 '
		end

		if train.status ~= 'onTow' then
			table.insert(elements, {label = dot..train.label, value = train, desc = texts.SelectTrainDesc.."<span style='font-size: large;'>"
				..'<br>'..texts.model..': '..train.model
				..'<br>'..texts.upgrade..': '..train.upgrade
			})
		end
	end

	if elements[1] then
		MenuData.Open('default', GetCurrentResourceName(), tostring(math.random(10000, 99999)), {
			title    = texts.TrainMenuTitle,
			align    = Config.HUD.menuPos,
			elements = elements,
		}, function(data, menu)
			TriggerServerEvent('d-labs-train:server:CheckTrain',data.current.value)
		
			menu.close()
		end, function(data, menu)
			menu.close()
		end)
	else
		TriggerEvent('Notification:'..GetCurrentResourceName(), 'error', texts.notif.noTrainInMenu, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
	end
end)

function openInput(placeholder)
	inputText = nil 

	SetNuiFocus(true, true)
	SendNUIMessage({
		action = "input",
		placeholderText = placeholder
	})

	while inputText == nil do
		Citizen.Wait(300)
	end

	if inputText ~= 'close' then
		return inputText
	else
		return false
	end
end

RegisterNetEvent('d-labs-train:client:getTrainsRename')
AddEventHandler('d-labs-train:client:getTrainsRename', function(trains)
	MenuData.CloseAll()

	local elements = {}

	for _, train in ipairs(trains) do
		local dot = '🟢 '

		if train.status == 'inWorld' then 
			dot = '🟠 '
		elseif train.status == 'onTow' then
			dot = '🔴 '
		end


		table.insert(elements, {label = dot..train.label, value = train, desc = texts.SelectTrainDesc.."<span style='font-size: large;'>"
			..'<br>'..texts.model..': '..train.model
			..'<br>'..texts.upgrade..': '..train.upgrade
		})

	end

	MenuData.Open('default', GetCurrentResourceName(), tostring(math.random(10000, 99999)), {
		title    = texts.TrainMenuTitle,
		align    = Config.HUD.menuPos,
		elements = elements,
	}, function(data, menu)

		menu.close()
		local placeholder = texts.nui.placeholder
		local text = openInput(placeholder)

		if text then
			TriggerServerEvent('d-labs-train:client:getTrainsRenameEdit',data.current.value,text)
		else 
			TriggerEvent('Notification:'..GetCurrentResourceName(), 'error', texts.notif.renameError, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
		end

			
	end, function(data, menu)
		menu.close()
	end)
end)

RegisterNUICallback('sendText', function(data, cb)
	inputText = data.text
	SetNuiFocus(false, false)
	cb('ok')
end)

RegisterNUICallback('closeNUI', function(data, cb)
	inputText = 'close'
	SetNuiFocus(false, false)
	cb('ok')
end)

RegisterNetEvent('d-labs-train:client:getTrainsSell')
AddEventHandler('d-labs-train:client:getTrainsSell', function(trains)
	MenuData.CloseAll()
	local elements = {}

	for _, train in ipairs(trains) do
		local dot = '🟢 '
		if train.status == 'inWorld' then 
			dot = '🟠 '
		elseif train.status == 'onTow' then
			dot = '🔴 '			
		end

		table.insert(elements, {label = dot..train.label, value = train, desc = texts.SelectTrainDesc.."<span style='font-size: large;'>"
			..'<br>'..texts.model..': '..train.model
			..'<br>'..texts.upgrade..': '..train.upgrade
			..'<br>'..texts.sellPrice..': '..calculatePercentage(train.price, Config.Economics.percentageSale)
		})
	end

	MenuData.Open('default', GetCurrentResourceName(), tostring(math.random(10000, 99999)), {
		title    = texts.TrainMenuTitle,
		align    = Config.HUD.menuPos,
		elements = elements,
	}, function(data, menu)
		TriggerServerEvent('d-labs-train:server:getTrainsSellDone',data.current.value)
		menu.close()
	end, function(data, menu)
		menu.close()
	end)
end)

function spawnHandcar()
	local hash = 0x3EDA466D
	
	local trainWagons = N_0x635423d55ca84fc8(hash)
	for wagonIndex = 0, trainWagons - 1 do
		local trainWagonModel = N_0x8df5f6a19f99f0d5(hash, wagonIndex)
		while not HasModelLoaded(trainWagonModel) do
			Citizen.InvokeNative(0xFA28FE3A6246FC30, trainWagonModel, 1)
			Citizen.Wait(0)
		end
	end

	local playerCoords = GetEntityCoords(PlayerPedId())
	local testTrain = N_0xc239dbd9a57d2a71(hash, playerCoords, 1, 0, 1, 0) 

	SetTrainCruiseSpeed(testTrain, 0.0)
	SetTrainSpeed(testTrain, 0.0)
	SetModelAsNoLongerNeeded(hash)

end

function nonManagmentTrainSpawn()

	MenuData.CloseAll()

	local elements = {}

	for _, train in ipairs(Config.Train) do


		table.insert(elements, {label = train.label, value = train, desc = texts.SelectTrainDesc.."<span style='font-size: large;'>"
			..'<br>'..texts.model..': '..train.maxSpeed
			..'<br>'..texts.model..': '..train.maxSpeed * speedMult
		})

	end

	MenuData.Open('default', GetCurrentResourceName(), tostring(math.random(10000, 99999)), {
		title    = texts.TrainMenuTitle,
		align    = Config.HUD.menuPos,
		elements = elements,
	}, function(data, menu)

		local hash = data.current.value.model
	
		local trainWagons = N_0x635423d55ca84fc8(hash)
		for wagonIndex = 0, trainWagons - 1 do
			local trainWagonModel = N_0x8df5f6a19f99f0d5(hash, wagonIndex)
			while not HasModelLoaded(trainWagonModel) do
				Citizen.InvokeNative(0xFA28FE3A6246FC30, trainWagonModel, 1)
				Citizen.Wait(0)
			end
		end
	
		local playerCoords = GetEntityCoords(PlayerPedId())
		local testTrain = N_0xc239dbd9a57d2a71(hash, playerCoords, 1, 0, 1, 0) 

		SetTrainCruiseSpeed(testTrain, 0.0)
		SetTrainSpeed(testTrain, 0.0)
		SetModelAsNoLongerNeeded(hash)
		SetNetworkIdExistsOnAllMachines(NetworkGetNetworkIdFromEntity(testTrain),true)
	
		local trainData = {
			hash = hash,
			idname = tostring(math.random(10000, 99999)),
			id = NetworkGetNetworkIdFromEntity(testTrain),
			upgrade = 0,
			damage = 0,
			label = data.current.value.label,
			price = 0,
			model = data.current.value.model,
			stash = data.current.value.model..'_'..license,
			status = "spawn"
		}
	
		TriggerServerEvent('d-labs-train:server:spawnTrain', NetworkGetNetworkIdFromEntity(testTrain), trainData)


		menu.close()		
	end, function(data, menu)
		menu.close()
	end)


end

function openFirstMenu(k)

	TriggerServerEvent('d-labs-train:server:job')

	job = nil

	while job == nil do
		Citizen.Wait(0)
	end

	if isJob then

		MenuData.CloseAll()

		local elements = {
			{label = texts.TurnAround, value = 'TurnAround', desc = texts.SelectTrainDesc},
			{label = texts.RemoveTrain, value = 'RemoveTrain', desc = texts.SelectTrainDesc},
			{label = texts.trainList, value = 'trainList', desc = texts.SelectTrainDesc}
		}

		if Config.job.managmentSystem then
			table.insert(elements, {label = texts.towLabel, value = 'town', desc = texts.SelectTrainDesc})
		end

		if Config.Work then
			table.insert(elements, {label = texts.MenuTelegram, value = 'sell', desc = texts.SelectTrainDesc})
		end

		if Config.Handcar then
			table.insert(elements, {label = texts.handcar, value = 'handcar', desc = texts.SelectTrainDesc})
		end

		MenuData.Open('default', GetCurrentResourceName(), tostring(math.random(10000, 99999)), {
			title    = texts.TrainMenuTitle,
			align    = Config.HUD.menuPos,
			elements = elements,
		}, function(data, menu)
			if data.current.value == 'TurnAround' then
				TrainSwap()
			elseif data.current.value == 'RemoveTrain' then
				TrainsDel()
			elseif data.current.value == 'sell' then
				TriggerServerEvent('d-labs-trains:server:sendTabel',k)
			elseif data.current.value == 'town' then
				TriggerServerEvent('d-labs-train:server:getTrainsTow')
			elseif data.current.value == 'handcar' then
				spawnHandcar()
			else
				if Config.job.managmentSystem then 
					TriggerServerEvent('d-labs-train:server:getTrains')
				else 
					nonManagmentTrainSpawn()
				end
			end
			
			menu.close()
		end, function(data, menu)
			menu.close()
		end)

	else
		TriggerEvent('Notification:'..GetCurrentResourceName(), 'error', texts.notif.noEmployee, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
	end
end


RegisterNetEvent('d-labs-train:client:getTrainsTow')
AddEventHandler('d-labs-train:client:getTrainsTow', function(trains)

	local elements = {}
	MenuData.CloseAll()

	for _, train in ipairs(trains) do
		table.insert(elements, {label = train.label, value = train, desc = texts.SelectTrainDesc.."<span style='font-size: large;'>"
			..'<br>'..texts.model..': '..train.model
		})	
	end

	MenuData.Open('default', GetCurrentResourceName(), tostring(math.random(10000, 99999)), {
		title    = texts.TrainMenuTitle,
		align    = Config.HUD.menuPos,
		elements = elements,
	}, function(data, menu)
		if data.current.value then
			TriggerServerEvent('d-labs-train:server:outOfTow',data.current.value)
		end
		
		menu.close()
	end, function(data, menu)
		menu.close()
	end)

end)

function GetPropToInteraction()
    local playerCoords = GetEntityCoords(PlayerPedId())
    local closestDistance = -1
    local closestTrain = nil
    local objects = GetGamePool('CVehicle')
	local lastTable = nil

    for _, entity in pairs(objects) do
        if IsThisModelATrain(GetEntityModel(entity)) or GetEntityModel(entity) == 1493442814 then
			if NetworkGetEntityIsNetworked(entity) then 
				if GetEntityModel(entity) == 1493442814 then 
					local entityCoords = GetEntityCoords(entity)
					local distance = #(playerCoords - entityCoords)

					if closestDistance == -1 or distance < closestDistance then
						closestDistance = distance
						closestTrain = entity
					end
				else
					for k, v in pairs(trainTab) do
						if v.id == NetworkGetNetworkIdFromEntity(entity) then 
							local entityCoords = GetEntityCoords(entity)
							local distance = #(playerCoords - entityCoords)

							if closestDistance == -1 or distance < closestDistance then
								closestDistance = distance
								closestTrain = entity
								lastTable = v
							end
						end
					end
				end
			end
        end
    end

	return closestTrain, lastTable
end


function DisableControl()
    Citizen.CreateThread(function()
        control = true 
        while control do
           	Citizen.Wait(0)
            Citizen.InvokeNative(0x2970929FD5F9FC89, PlayerId(), true)
            Citizen.InvokeNative(0xFE99B66D079CF6BC, 0, 0x07CE1E61, true) 
            Citizen.InvokeNative(0xFE99B66D079CF6BC, 0, 0xF84FA74F, true) 
            Citizen.InvokeNative(0xFE99B66D079CF6BC, 0, 0xAC4BD4F1, true) 
            Citizen.InvokeNative(0xFE99B66D079CF6BC, 0, 0x73846677, true)
            Citizen.InvokeNative(0xFE99B66D079CF6BC, 0, 0x0AF99998, true)
            Citizen.InvokeNative(0xFE99B66D079CF6BC, 0, 0xB2F377E8, true)
            Citizen.InvokeNative(0xFE99B66D079CF6BC, 0, 0xADEAF48C, true)
            Citizen.InvokeNative(0xFE99B66D079CF6BC, 0, 0xDB096B85, true)
            Citizen.InvokeNative(0xFE99B66D079CF6BC, 0, 0x8FFC75D6, true)
			Citizen.InvokeNative(0xFE99B66D079CF6BC, 0, 0xCEFD9220, true) 
        end
    end)
end

function TrainSwap()
	local nearbyTrain = GetPropToInteraction()

	if nearbyTrain then
		while not DoesEntityExist(nearbyTrain) do
			Citizen.Wait(10)
		end

		local netNearbyTrain = NetworkGetNetworkIdFromEntity(nearbyTrain)

		if netNearbyTrain ~= nearbyTrain then

			swap = Citizen.InvokeNative(0x3C9628A811CBD724,nearbyTrain)

			if swap == 1 then 
				swap = 0
			else
				swap = 1 
			end

			Citizen.Wait(200)

			for k,v in pairs(trainTab) do
				if v.id == netNearbyTrain then 
					local set = nearbyTrain 
					local idToNet = NetworkGetNetworkIdFromEntity(set)
					NetworkRequestControlOfEntity(set)
					Citizen.Wait(100)
					SetEntityAsMissionEntity(set,true,true)
					DeleteVehicle(set)
					SetModelAsNoLongerNeeded(set)

					local hash = v.data.hash
			
					local trainWagons = N_0x635423d55ca84fc8(hash)
					for wagonIndex = 0, trainWagons - 1 do
						trainWagonModel = N_0x8df5f6a19f99f0d5(hash, wagonIndex)
						while not HasModelLoaded(trainWagonModel) do
							Citizen.InvokeNative(0xFA28FE3A6246FC30, trainWagonModel, 1)
							Citizen.Wait(0)
						end
					end
				
					local train = N_0xc239dbd9a57d2a71(hash, GetEntityCoords(PlayerPedId()), swap, 0, 1, 0) -- 0 1 1 1 // Obracení vlaku // něco s vagonama // 
				
					SetTrainCruiseSpeed(train, 0.0)
					SetTrainSpeed(train, 0.0)
					SetModelAsNoLongerNeeded(train)
					SetModelAsNoLongerNeeded(train)
				
					Citizen.Wait(300)

					local nameOfStatus = 'id'
					local statusValue = NetworkGetNetworkIdFromEntity(train)
					TriggerServerEvent('d-labs-train:server:syncTrainManagment',idToNet,nameOfStatus,statusValue)

					break
				end
			end
		end
	else 
		TriggerEvent('Notification:'..GetCurrentResourceName(), 'error', texts.notif.noTrainFound, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
	end
end

function TrainsDel()
	local nearbyTrain = GetPropToInteraction()	
	if nearbyTrain then
		while not DoesEntityExist(nearbyTrain) do
			Citizen.Wait(10)
		end

		if GetEntityModel(nearbyTrain) == 1493442814 then
			NetworkRequestControlOfEntity(nearbyTrain)
			Citizen.Wait(100)
			SetEntityAsMissionEntity(nearbyTrain,true,true)
			DeleteVehicle(nearbyTrain)
			SetModelAsNoLongerNeeded(nearbyTrain)
		else
			local netNearbyTrain = NetworkGetNetworkIdFromEntity(nearbyTrain)
			if netNearbyTrain ~= nearbyTrain then
				Citizen.Wait(200)
				for k,v in pairs(trainTab) do
					if v.id == netNearbyTrain then 
						local set = nearbyTrain
						
						if v.work then
							TriggerEvent('Notification:'..GetCurrentResourceName(), 'error', texts.notif.deleteTrainWork, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
							deliveryFinish()
							TriggerServerEvent('d-labs-train:server:deleteTrain',netNearbyTrain)
						else 
							TriggerServerEvent('d-labs-train:server:deleteTrain',netNearbyTrain)
						end
						break
					end
				end
			end
		end
	else 
		TriggerEvent('Notification:'..GetCurrentResourceName(), 'error', texts.notif.noTrainFound, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
	end
end

RegisterNetEvent("d-labs-train:client:coal")
AddEventHandler("d-labs-train:client:coal", function(_coal)
	coal = _coal
end)

RegisterNetEvent("d-labs-train:client:job")
AddEventHandler("d-labs-train:client:job", function(_job)
	job = _job

	if not Config.job.name then
		isJob = true
	elseif type(Config.job.name) == "string" then
		isJob = job == Config.job.name
	elseif type(Config.job.name) == "table" then
		isJob = false
		for _, allowedJob in ipairs(Config.job.name) do
			if job == allowedJob then
				isJob = true
				break
			end
		end
	end
end)

RegisterNetEvent("d-labs-train:client:water")
AddEventHandler("d-labs-train:client:water", function(_water)
	water = _water
end)

RegisterNetEvent("d-labs-trains:client:sendTabel")
AddEventHandler("d-labs-trains:client:sendTabel", function(_elements,_)
	MenuData.CloseAll()

	local elements = {}
	local pcoords = GetEntityCoords(PlayerPedId())

	table.insert(elements, {label = texts.CancelMenu, value = 'CancelSell', desc = texts.SelectTrainDesc})     

	for k, v in pairs(_elements) do
		local New = Config.TrainStations[v.value.pos].SellPoint.coords
		local vec3 = vector3(New.x, New.y, New.z)
		local dist = #(pcoords - vec3) / 1000
		local NewReward = dist * Config.Work.distanceMultiplier + v.value.reward
	
		if Config.Work.distanceMultiplier == 1.0 or Config.Work.distanceMultiplier == false then
			NewReward = v.value.reward
		end
	
		local roundPrice = math.floor(NewReward * 100 + 0.5) / 100
	
		local tabsNew = {
			label = v.label .. ' [' .. string.format("%.2f", roundPrice) .. '$]',
			value = { reward = string.format("%.2f", roundPrice), pos = v.value.pos },
			desc = v.desc
		}

		local checkCoords = #(GetEntityCoords(PlayerPedId())-vec3)
		if checkCoords > 50 then
			table.insert(elements, tabsNew)
		end
	end
					

	MenuData.Open('default', GetCurrentResourceName(), tostring(math.random(10000, 99999)),
		{
			title    = texts.TrainMenuTitle,
			align    = Config.HUD.menuPos,
			elements = elements,
		},

		function(data, menu)
			if data.current.value == 'CancelSell' then
				if isHaveWork then
					deliveryFinish()
					TriggerEvent('Notification:'..GetCurrentResourceName(), 'error', texts.notif.workCancel, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
				else 
					TriggerEvent('Notification:'..GetCurrentResourceName(), 'error', texts.notif.noWorkCancel, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
				end
			else
				if not isHaveWork then
					local notif = false
					local ent = GetPropToInteraction()
					local net = NetworkGetNetworkIdFromEntity(ent)
					for k,v in pairs(trainTab) do
						if v.id == net and not v.work then 
							workTrainId = NetworkGetNetworkIdFromEntity(ent)
							workData = data.current.value
							TriggerServerEvent('d-labs-train:server:setupJobWork',net,true,ent,_)
							notif = true
							break 
						end 
					end 
					if not notif then
						TriggerEvent('Notification:'..GetCurrentResourceName(), 'error', texts.notif.deliveryError, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
					end
				else 
					TriggerEvent('Notification:'..GetCurrentResourceName(), 'error', texts.notif.workHaveError, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
				end
			end
			
			menu.close()
		end,
	

	function(data, menu)
		menu.close()
	end)

end)


function openDistanceEdit() 
	MenuData.CloseAll()
	local elements = {}

	for k,v in pairs(Config.TrainStations) do
		if v.timetable then
			table.insert(elements, {label = v.PosName, value = v.PosName, desc = texts.manageDesc})     
		end
	end


	MenuData.Open('default', GetCurrentResourceName(), tostring(math.random(10000, 99999)),
		{
			title    = texts.manageTimetable,
			align    = Config.HUD.menuPos,
			elements = elements,
		},

		function(data, menu)
			if data.current.value then
				TriggerServerEvent('d-labs-train:server:setTimetable',data.current.value)
			end

			menu.close()
		end,


	function(data, menu)
		menu.close()
	end)


end 

RegisterNetEvent("d-labs-train:client:openManagement")
AddEventHandler("d-labs-train:client:openManagement", function()
	openManagment()
end)

function trainMenuUpgrade(data)
	MenuData.CloseAll()

	local elements = {}

	local stage0Label = texts.stageZero
	if tonumber(data.upgrade) == 0 then
		stage0Label = stage0Label .. ' ' .. texts.activeStage
	end
	table.insert(elements, {label = stage0Label, value = 0, desc = texts.noUpgrade, price = 0})

	for i = 1, #Config.Upgrade do
		local upgrade = Config.Upgrade[i]
		local label = texts.stage .. ' ' .. i
		
		if data.upgrade and tonumber(data.upgrade) == i then
			label = label .. ' ' .. texts.activeStage
		end
		
		local upgradePrice = 0
		if upgrade.price then
			upgradePrice = upgrade.price
		elseif upgrade.percentPrice then
			upgradePrice = (upgrade.percentPrice / 100) * data.price
		end

		local desc = ''
		if upgrade.stash then
			desc = desc .. texts.stash.. ": " .. upgrade.stash.maxweight .. " | " .. texts.slots .. ': ' .. upgrade.stash.slots .. "<br>"
		end
		if upgrade.overheatingIncrease then
			desc = desc .. texts.overheatedReducing .. " " .. upgrade.overheatingIncrease .. "%<br>"
		end
		if upgrade.speedIncrease then
			desc = desc .. texts.speed.. " " .. upgrade.speedIncrease .. " "..speedUnit.."<br>"
		end
		desc = desc .. texts.price .. " " .. upgradePrice .. '$'

		table.insert(elements, {label = label, value = i, desc = desc, price = upgradePrice})
	end

	MenuData.Open('default', GetCurrentResourceName(), tostring(math.random(10000, 99999)), {
		title    = texts.TrainMenuTitle,
		align    = Config.HUD.menuPos,
		elements = elements,
	}, function(_, menu)
		local selectedUpgrade = tonumber(_.current.value)
		local selectedPrice = tonumber(_.current.price)

		if tonumber(data.upgrade) ~= selectedUpgrade then
			TriggerServerEvent('d-labs-train:server:buyUpgrade', data, selectedUpgrade, selectedPrice)
		else 
			TriggerEvent('Notification:'..GetCurrentResourceName(), 'error', texts.notif.upgradeError, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
		end

		menu.close()
	end, function(data, menu)
		menu.close()
	end)
end


RegisterNetEvent("d-labs-train:client:trainMenuUpgrade")
AddEventHandler("d-labs-train:client:trainMenuUpgrade", function(trains)
	MenuData.CloseAll()

	local elements = {}

	for _, train in ipairs(trains) do
		local dot = '🟢 '
		if train.status == 'inWorld' then 
			dot = '🟠 '
		elseif train.status == 'onTow' then
			dot = '🔴 '			
		end

		table.insert(elements, {label = dot..train.label, value = train, desc = texts.SelectTrainDesc.."<span style='font-size: large;'>"
			..'<br>'..texts.model..': '..train.model
			..'<br>'..texts.activeStage..': '..train.upgrade
		})
	end

	MenuData.Open('default', GetCurrentResourceName(), tostring(math.random(10000, 99999)), {
		title    = texts.TrainMenuTitle,
		align    = Config.HUD.menuPos,
		elements = elements,
	}, function(data, menu)
		trainMenuUpgrade(data.current.value)		
		menu.close()
	end, function(data, menu)
		menu.close()
	end)

end)


function openManagment()

	MenuData.CloseAll()

	local elements = {}

	if Config.editTimetable then
		table.insert(elements, {label = texts.timetable, value = 'timetable', desc = texts.manageDesc})     
	end

	bossMoney = nil 
	TriggerServerEvent('d-labs-train:server:getMoneyFromBoss')
	while bossMoney == nil do
		Citizen.Wait(0)
	end

	if Config.job.managmentSystem then
		table.insert(elements, {label = texts.renameTrain, value = 'rename', desc = texts.manageDesc})     
		table.insert(elements, {label = texts.sellTrain, value = 'sell', desc = texts.manageDesc})     
		table.insert(elements, {label = texts.buyTrain, value = 'buy', desc = texts.manageDesc})   
		table.insert(elements, {label = texts.upgradeTrain, value = 'upgrade', desc = texts.manageDesc})    
		table.insert(elements, {label = texts.bossMoney, value = 'boss', desc = texts.bossMoneyDesc..': '..bossMoney})  
	end


	MenuData.Open('default', GetCurrentResourceName(), tostring(math.random(10000, 99999)),
		{
			title    = texts.managmentTittle,
			align    = Config.HUD.menuPos,
			elements = elements,
		},

		function(data, menu)
			if data.current.value == 'timetable' then
				openDistanceEdit()
			elseif  data.current.value == 'rename' then 
				TriggerServerEvent('d-labs-train:server:getTrainsRename')
			elseif  data.current.value == 'sell' then 
				TriggerServerEvent('d-labs-train:server:getTrainsSell')
			elseif  data.current.value == 'buy' then 
				trainMenuBuy()
			elseif  data.current.value == 'upgrade' then 
				TriggerServerEvent('d-labs-train:server:trainMenuUpgrade')
			elseif  data.current.value == 'boss' then 
				TriggerServerEvent('d-labs-train:server:MoneyFromBossPay')
			end

			menu.close()
		end,


	function(data, menu)
		menu.close()
	end)
					
end

RegisterNetEvent("d-labs-train:client:spawnTrain")
AddEventHandler("d-labs-train:client:spawnTrain", function(_)
	trainTab = _
end)

RegisterNetEvent("d-labs-train:client:getMoneyFromBoss")
AddEventHandler("d-labs-train:client:getMoneyFromBoss", function(_)
	bossMoney = _
end)


-------------------------------------------------------------------------- STASH

function openAlltimetable()
	MenuData.CloseAll()
	local elements = {}

	for k,v in pairs(Config.TrainStations) do
		if v.timetable then
			table.insert(elements, {label = v.PosName, value = v.PosName, desc = texts.allTimetableDesc})     
		end
	end


	MenuData.Open('default', GetCurrentResourceName(), tostring(math.random(10000, 99999)),
		{
			title    = texts.allTimetable,
			align    = Config.HUD.menuPos,
			elements = elements,
		},

		function(data, menu)
			if data.current.value then
				TriggerServerEvent('d-labs-train:server:showTimetable',data.current.value)
			end

			menu.close()
		end,


	function(data, menu)
		menu.close()
	end)

end


function refreshTrain()
    Citizen.CreateThread(function()
        if not isRefreshing then
            isRefreshing = true
            while showcaseTrain do

				if cameraSet then
					Citizen.Wait(trainWagons * 5000)
				else 
					Citizen.Wait(trainWagons * 3000)
				end
                if shouldResetTimer then

                    shouldResetTimer = false 
					if cameraSet then
						Citizen.Wait(trainWagons * 5000)
					else 
						Citizen.Wait(trainWagons * 3000)
					end
                end
                if showcaseTrain then
                    spawnShowCaseTrain(showcaseModel)
                end
            end
            isRefreshing = false
        else
            shouldResetTimer = true
        end
    end)
end


function firstCamShow()
	Citizen.InvokeNative(0x9587913B9E772D29,PlayerPedId(),true)             
	camShowcase = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA",2758.2656, -882.4099, 46.6187, 0, 0, 0, GetGameplayCamFov())
	SetCamActive(camShowcase, true)
	PointCamAtEntity(camShowcase,showcaseTrain,0,0,0,true)
	RenderScriptCams(true, true,10,true, false)
end


function spawnShowCaseTrain(hash)
    if showcaseTrain then
		if cameraSet == 1 then 
			DoScreenFadeOut(300)
			Citizen.Wait(300)
		end		
		DeleteEntity(showcaseTrain)
		SetEntityAsNoLongerNeeded(showcaseTrain)
		SetModelAsNoLongerNeeded(showcaseTrain)
		SetMissionTrainAsNoLongerNeeded(showcaseTrain)
		Citizen.Wait(500)
    end

    trainWagons = N_0x635423d55ca84fc8(hash)
    for wagonIndex = 0, trainWagons - 1 do
        local trainWagonModel = N_0x8df5f6a19f99f0d5(hash, wagonIndex)
        Citizen.InvokeNative(0xFA28FE3A6246FC30, trainWagonModel, 1)
        while not HasModelLoaded(trainWagonModel) do
            Citizen.Wait(0)
        end
    end

    showcaseTrain = N_0xc239dbd9a57d2a71(hash, 2760.9844, -875.1736, 42.9378, true, false, false, false)

	if cameraSet == 1 then 
		firstCamShow(showcaseTrain)
		DoScreenFadeIn(500)
	end			

	refreshTrain()
end



function getHighestIndex(configTable)
    local maxIndex = nil
    for index, _ in pairs(configTable) do
        if maxIndex == nil or index > maxIndex then
            maxIndex = index
        end
    end
    return maxIndex
end

local highestIndex = getHighestIndex(Config.Train)
local lightsOn = false

function lights()
    CreateThread(function()
        if lightsOn then
			lightsOn = false
		else 
            lightsOn = true
			while lightsOn do 
				Citizen.Wait(0)
				local hour = GetClockHours()
				if hour >= 21 or hour <= 5 then
					DrawLightWithRange(2773.3801, -896.9308, 43.1383 + 10.0, 255, 255, 200, 100.0, 20.0)
					DrawLightWithRange(2762.7527, -906.9078, 43.0971 + 10.0, 255, 255, 200, 100.0, 20.0)
					DrawLightWithRange(2748.3616, -850.4081, 42.794 + 10.0, 255, 255, 200, 100.0, 20.0)
					DrawLightWithRange(2804.5786, -918.1633, 43.2818 + 10.0, 255, 255, 200, 100.0, 20.0)
				end
			end
        end
    end)
end

function trainMenuBuy()
	Citizen.CreateThread(function()
		TriggerServerEvent('d-labs-train:server:setBucket',true)
		DoScreenFadeOut(500)
		Citizen.Wait(500)
		lights()
		cameraSet = 1 
		buyTrainIndex = 1
		coordsTeleportBack = vector4(GetEntityCoords(PlayerPedId()),GetEntityHeading(PlayerPedId()))
		SetEntityVisible(PlayerPedId(),false)
		FreezeEntityPosition(PlayerPedId(),true)
		SetEntityCoords(PlayerPedId(), 2756.2993, -882.5991, 42.9502, 180.4442)

		showcaseModel = Config.Train[buyTrainIndex].model
		spawnShowCaseTrain(Config.Train[buyTrainIndex].model)

		firstCamShow(showcaseTrain)

		SetNuiFocus(true, true) 
		SendNUIMessage({
			buy = true,
			action = 'display',
			show = true,
			name = Config.Train[buyTrainIndex].label,
			price = Config.Train[buyTrainIndex].price,
			speed = Config.Train[buyTrainIndex].maxSpeed*speedMult..' '.. speedUnit,
			stash = Config.Train[buyTrainIndex].stash.maxweight,
			size = Config.Train[buyTrainIndex].stash.slots,
			id = buyTrainIndex,
		})

		DoScreenFadeIn(3000)

	end)
end

RegisterNUICallback('left', function(data, cb)

	if buyTrainIndex == 1 then 
		buyTrainIndex = highestIndex 
	else 
		buyTrainIndex = buyTrainIndex - 1 
	end

	showcaseModel = Config.Train[buyTrainIndex].model
	spawnShowCaseTrain(Config.Train[buyTrainIndex].model)

    SendNUIMessage({
        buy = true,
        action = 'updateTrainInfo',
		name = Config.Train[buyTrainIndex].label,
		price = Config.Train[buyTrainIndex].price,
		speed = Config.Train[buyTrainIndex].maxSpeed*speedMult..speedUnit,
		stash = Config.Train[buyTrainIndex].stash.maxweight,
		size = Config.Train[buyTrainIndex].stash.slots,
		id = buyTrainIndex,
    })
    cb('ok')
end)

RegisterNUICallback('right', function(data, cb)
	if buyTrainIndex == highestIndex  then 
		buyTrainIndex = 1
	else 
		buyTrainIndex = buyTrainIndex + 1 
	end

	showcaseModel = Config.Train[buyTrainIndex].model
	spawnShowCaseTrain(Config.Train[buyTrainIndex].model)

    SendNUIMessage({
        buy = true,
        action = 'updateTrainInfo',
		name = Config.Train[buyTrainIndex].label,
		price = Config.Train[buyTrainIndex].price,
		speed = Config.Train[buyTrainIndex].maxSpeed*speedMult..speedUnit,
		stash = Config.Train[buyTrainIndex].stash.maxweight,
		size = Config.Train[buyTrainIndex].stash.slots,
		id = buyTrainIndex,
    })
    cb('ok')
end)

RegisterNUICallback('exit', function(data, cb)
	DoScreenFadeOut(500)
	Citizen.Wait(500)

	if showcaseTrain then
		DeleteEntity(showcaseTrain)
		SetMissionTrainAsNoLongerNeeded(showcaseTrain)
    end

    SetNuiFocus(false, false)
	SetEntityCoordsAndHeading(PlayerPedId(),coordsTeleportBack.x,coordsTeleportBack.y,coordsTeleportBack.z-1.0,coordsTeleportBack.w)
	SetEntityVisible(PlayerPedId(),true)
	FreezeEntityPosition(PlayerPedId(),false)
	DeleteEntity(showcaseTrain)
	DestroyAllCams(true)
	TriggerServerEvent('d-labs-train:server:setBucket',false)

	isRefreshing = false
	showcaseTrain = nil
	camShowcase = nil
	showcaseModel = nil
	lights()
	DoScreenFadeIn(3000)
    cb('ok')
end)

RegisterNUICallback('buy', function(data, cb)
	TriggerServerEvent('d-labs-train:server:buyTrain',data)
	DoScreenFadeOut(500)
	Citizen.Wait(500)
    SetNuiFocus(false, false)
	SetEntityCoordsAndHeading(PlayerPedId(),coordsTeleportBack.x,coordsTeleportBack.y,coordsTeleportBack.z-1.0,coordsTeleportBack.w)
	SetEntityVisible(PlayerPedId(),true)
	FreezeEntityPosition(PlayerPedId(),false)
	DeleteEntity(showcaseTrain)
	DestroyAllCams(true)
	TriggerServerEvent('d-labs-train:server:setBucket',false)

	isRefreshing = false
	showcaseTrain = nil
	camShowcase = nil
	showcaseModel = nil
	lights()
	DoScreenFadeIn(3000)
end)

RegisterNUICallback('camera', function(data, cb)
	DoScreenFadeOut(300)
	Citizen.Wait(300)

	if cameraSet == 1 then 
		cameraSet = 2 
	elseif cameraSet == 2 then 
		cameraSet = 3
	elseif cameraSet == 3 then 
		cameraSet = 4
	else
		cameraSet = 1
	end

	DestroyAllCams(true)

	if cameraSet == 1 then
		firstCamShow()
	elseif cameraSet == 2 then
		Citizen.InvokeNative(0x9587913B9E772D29,PlayerPedId(),true)             
		camShowcase = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA",2770.9, -892.3342, 52.073, 0, 0, 0, GetGameplayCamFov())
		SetCamActive(camShowcase, true)
		PointCamAtCoord(camShowcase,2769.3464, -889.5151, 43.0558)
		RenderScriptCams(true, true,10,true, false)

	elseif cameraSet == 3 then
		Citizen.InvokeNative(0x9587913B9E772D29,PlayerPedId(),true)             
		camShowcase = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA",2834.9468, -942.2885, 68.1581, 0, 0, 0, GetGameplayCamFov())
		SetCamActive(camShowcase, true)
		PointCamAtCoord(camShowcase, 2773.2488, -891.0400, 43.0828)
		RenderScriptCams(true, true,10,true, false)
	elseif cameraSet == 4 then
		Citizen.InvokeNative(0x9587913B9E772D29,PlayerPedId(),true)             
		camShowcase = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA",2748.3994, -850.3374, 44.5, 0, 0, 0, GetGameplayCamFov())
		SetCamActive(camShowcase, true)
		PointCamAtCoord(camShowcase, 2743.4741, -840.5967, 44.5)
		RenderScriptCams(true, true,10,true, false)
	end

	DoScreenFadeIn(500)
	Citizen.Wait(500)

    cb('ok')
end)


RegisterNetEvent("d-labs-train:client:refreshJob")
AddEventHandler("d-labs-train:client:refreshJob", function(_)
	currentJob = _
end)

RegisterNUICallback('saveBoard', function(data, cb)
	TriggerServerEvent('d-labs-train:server:editTimetable',data)
    SetNuiFocus(false, false)
    cb('ok')
end)

RegisterNUICallback('closeBoard', function(data, cb)
    SetNuiFocus(false, false)
    cb('ok')
end)


RegisterNetEvent('d-labs-train:client:showTimetable', function(boardData,boardName)

	SendNUIMessage({
		action = 'open_board',
		mode = 'read',
		title = boardName,
		data = boardData
	})

	SetNuiFocus(true, true)

end)

RegisterNetEvent('d-labs-train:client:setTimetable', function(boardData,boardName)
	SendNUIMessage({
		action = 'open_board',
		mode = 'edit',
		title = boardName,
		data = boardData
	})

	SetNuiFocus(true, true)

end)


----------------------------------------------------------------------------
--  Functions
----------------------------------------------------------------------------



RegisterNetEvent("d-labs-train:client:syncTrainManagment")
AddEventHandler("d-labs-train:client:syncTrainManagment", function(_)
	trainTab = _
end)

RegisterNetEvent("d-labs-train:client:CheckTrain")
AddEventHandler("d-labs-train:client:CheckTrain", function(_,s)

	local hash = math.floor(tonumber(_.hash) + 0.5)
	SetRandomTrains(false)

	printDebug(hash)

	local trainWagons = N_0x635423d55ca84fc8(hash)
	for wagonIndex = 0, trainWagons - 1 do
		trainWagonModel = N_0x8df5f6a19f99f0d5(hash, wagonIndex)
		while not HasModelLoaded(trainWagonModel) do
			Citizen.InvokeNative(0xFA28FE3A6246FC30, trainWagonModel, 1)
			Citizen.Wait(0)
		end
	end

	local train = N_0xc239dbd9a57d2a71(hash, GetEntityCoords(PlayerPedId()), swap, 0, 1, 0) 

	printDebug(train)
	SetTrainCruiseSpeed(train, 0.0)
	SetTrainSpeed(train, 0.0)
	SetModelAsNoLongerNeeded(train)

	TriggerServerEvent('d-labs-train:server:spawnTrain',NetworkGetNetworkIdFromEntity(train),_)
end)

function moveKey()
	Citizen.CreateThread(function()
		while isDriveTrain do
			Citizen.Wait(0)
			if fuelOnTrain ~= true or isOverheated then
				if statusDic == 'forward' then
					Citizen.InvokeNative(0xFE99B66D079CF6BC, 0, 0x5B9FD4E2, true)
					Citizen.InvokeNative(0xFE99B66D079CF6BC, 0, 0xB9F544B0, true)
					Citizen.InvokeNative(0xFE99B66D079CF6BC, 0, 0xE99D2B05, true)
					Citizen.InvokeNative(0xFE99B66D079CF6BC, 0, 0xFF3626FC, true)

				elseif statusDic == 'backwards' then 
					Citizen.InvokeNative(0xFE99B66D079CF6BC, 0, 0x2D79D80A, true)
					Citizen.InvokeNative(0xFE99B66D079CF6BC, 0, 0x6E1F639B, true)
					Citizen.InvokeNative(0xFE99B66D079CF6BC, 0, 0xD1887B3F, true)
					Citizen.InvokeNative(0xFE99B66D079CF6BC, 0, 0xD648E48D, true)

				elseif statusDic == 'halt' then
					Citizen.InvokeNative(0xFE99B66D079CF6BC, 0, 0x2D79D80A, true)
					Citizen.InvokeNative(0xFE99B66D079CF6BC, 0, 0x6E1F639B, true)
					Citizen.InvokeNative(0xFE99B66D079CF6BC, 0, 0xD1887B3F, true)
					Citizen.InvokeNative(0xFE99B66D079CF6BC, 0, 0xD648E48D, true)

					Citizen.InvokeNative(0xFE99B66D079CF6BC, 0, 0x5B9FD4E2, true)
					Citizen.InvokeNative(0xFE99B66D079CF6BC, 0, 0xB9F544B0, true)
					Citizen.InvokeNative(0xFE99B66D079CF6BC, 0, 0xE99D2B05, true)
					Citizen.InvokeNative(0xFE99B66D079CF6BC, 0, 0xFF3626FC, true)
				end
			else
				Citizen.Wait(500)
			end

			if fuelOnTrain ~= true then
				if not feedkey then 
					feedkey = true
					tempPrompStatus(1, true)
				end

				if tempPrompPress(1) then 

					coal = nil
					TriggerServerEvent('d-labs-train:server:coal')
					while coal == nil do 
						Citizen.Wait(0)
					end
	
					if coal >= fuelOnTrain then 
						TriggerServerEvent('d-labs:server:removeItem',Config.Item.fuel,fuelOnTrain)
						tempPrompStatus(1, false)
						fuelOnTrain = true
						local ent = CURRENT_TRAIN
						local nameOfStatus = 'fuelOnTrain'
						local statusValue = true
						TriggerServerEvent('d-labs-train:server:syncTrainManagment',NetworkGetNetworkIdFromEntity(ent),nameOfStatus,statusValue)
						tempPrompStatus(2, true)
						Citizen.Wait(math.random(tonumber(Config.Economics.coalThrowingTime[1] * 1000), tonumber(Config.Economics.coalThrowingTime[2]) * 1000))
						feedkey = false
					else 						
						TriggerEvent('Notification:'..GetCurrentResourceName(), 'error', string.format(texts.notif.noFuel,fuelOnTrain), Config.Textures.alert[1], Config.Textures.alert[2], 2000)
					end
				end						
			end
		end
    end)
end


function checkFuel()
    Citizen.CreateThread(function()
        while isDriveTrain do
            Citizen.Wait(0)
            
            if ((IsControlPressed(1, 0xFF3626FC) and statusDic == 'forward') or (IsControlPressed(1, 0x2D79D80A) and statusDic == 'backwards')) and fuelOnTrain == true and not feedkey or isSpeedLocked then

				if not DEBUG.control then 
					local coalCount = math.random(Config.Economics.coalForThrowing[1], Config.Economics.coalForThrowing[2])
					TriggerServerEvent('d-labs-train:server:coal')
					while coal == nil do 
						Citizen.Wait(0)
					end

					if coal >= coalCount then 
						TriggerServerEvent('d-labs:server:removeItem',Config.Item.fuel,coalCount)
						TriggerEvent('Notification:'..GetCurrentResourceName(), 'inform', string.format(texts.notif.fuelRemove,coalCount), Config.Textures.alert[1], Config.Textures.alert[2], 2000)
						Citizen.Wait(math.random(tonumber(Config.Economics.coalThrowingTime[1] * 1000), tonumber(Config.Economics.coalThrowingTime[2]) * 1000))
					else					
						if fuelOnTrain == true then
							fuelOnTrain = coalCount
							local ent = CURRENT_TRAIN
							local nameOfStatus = 'fuelOnTrain'
							local statusValue = coalCount
							TriggerServerEvent('d-labs-train:server:syncTrainManagment',NetworkGetNetworkIdFromEntity(ent),nameOfStatus,statusValue)
							TriggerEvent('Notification:'..GetCurrentResourceName(), 'error', string.format(texts.notif.noFuel,coalCount), Config.Textures.alert[1], Config.Textures.alert[2], 2000)
							tempPrompStatus(2, false)
							tempPrompStatus(3, false)
						else 
							TriggerEvent('Notification:'..GetCurrentResourceName(), 'error', string.format(texts.notif.noFuel,fuelOnTrain), Config.Textures.alert[1], Config.Textures.alert[2], 2000)
						end
						Citizen.Wait(10*1000)
					end
					coal = nil
				end
			else
				Citizen.Wait(5*1000)
			end
        end
    end)
end

local lockSpeed = 0
local nuiOverheating = 0 

function MonitorOverheating()
    Citizen.CreateThread(function()
        while isDriveTrain do
            Citizen.Wait(1000)

            local speed = GetEntitySpeed(CURRENT_TRAIN) * speedMult	
            local maxSpeedMult = maxSpeed * speedMult
            local maxSpeedThreshold = maxSpeedMult * (Config.Economics.percentOverheat / 100)

			if speed > maxSpeedThreshold and not isOverheated then

				local chance = 0
				local pause = 0
				if Config.Economics.overheatingLogic == 'low' then 
					chance = 40
					pause = 4000
				elseif Config.Economics.overheatingLogic == 'medium' then 
					chance = 60
					pause = 3000
				elseif Config.Economics.overheatingLogic == 'high' then 
					chance = 80
					pause = 2000
				else
					pause = 1000
					chance = 100 
				end

				randomChance = math.random(1, 100)

				if (randomChance + upgradeOverheat) <= 95 then 
					randomChance = randomChance + upgradeOverheat
				else 
					randomChance = 95
				end

                if randomChance < chance and not DEBUG.control then
                    isOverheated = true
					local ent = CURRENT_TRAIN
                    local nameOfStatus = 'overheated'
                    local statusValue = StartParticleEffectOnPlayer(ent,"scr_train_robbery4","scr_trn4_train_const_smoke") -- true
                    TriggerServerEvent('d-labs-train:server:syncTrainManagment', NetworkGetNetworkIdFromEntity(ent), nameOfStatus, statusValue)
					TriggerEvent('Notification:'..GetCurrentResourceName(), 'error', texts.notif.overheat, Config.Textures.alert[1], Config.Textures.alert[2], 2000)

					if isSpeedLocked then
						isSpeedLocked = false
						tempPrompStatus(3, false)
						Citizen.Wait(100)
						tempPrompStatus(2, true)	
					end

                else
					Citizen.Wait(pause)
                end
            elseif isOverheated then
                Citizen.Wait(10*1000)
            end
        end
    end)
end

function StartManagTrain()

	tempPrompStatus(2, true)

	Citizen.CreateThread(function()
		while isDriveTrain do
			Wait(0)
			if GetEntitySpeed(CURRENT_TRAIN) >= 8 and not isSpeedLocked then
				if IsControlPressed(1, 0xFF3626FC) and fuelOnTrain == true then 
					local currentSpeed = GetEntitySpeed(CURRENT_TRAIN)
					if currentSpeed < 29 then 
						local newSpeed = currentSpeed + 0.01 
						SetTrainSpeed(CURRENT_TRAIN, newSpeed)
						SetTrainCruiseSpeed(CURRENT_TRAIN, newSpeed)
					end
				end
			end

			if IsControlPressed(1, 0xE30CD707) and not isSpeedLocked and not isOverheated and fuelOnTrain == true and statusDic == 'forward' then 
				isSpeedLocked = true
				lockSpeed = GetEntitySpeed(CURRENT_TRAIN)
				tempPrompStatus(2, false)
				Citizen.Wait(500)	
				tempPrompStatus(3, true)
			elseif IsControlPressed(1, 0xE30CD707) and isSpeedLocked and not isOverheated and fuelOnTrain == true and statusDic == 'forward' then 
				isSpeedLocked = false
				lockSpeed = GetEntitySpeed(CURRENT_TRAIN)		
				tempPrompStatus(3, false)
				Citizen.Wait(500)
				tempPrompStatus(2, true)				
			elseif (IsControlPressed(1, 0xFF3626FC) and isSpeedLocked) or (IsControlPressed(1, 0x2D79D80A) and isSpeedLocked) then 
				isSpeedLocked = false
				tempPrompStatus(3, false)
				Citizen.Wait(100)
				tempPrompStatus(2, true)	
			end
		end
	end)
end

function trainSwitch()
	CreateThread(function()
		while isDriveTrain do
			Citizen.Wait(0)

			if tempPrompPress(4) then
				SwitchCheck('left')
				Citizen.Wait(4000)
			end
			if tempPrompPress(5) then
				SwitchCheck('right')
				Citizen.Wait(4000)
			end

		end
	end)
end


function trainHandler(idname)

	CURRENT_TRAIN = GetVehiclePedIsIn(PlayerPedId(), false)

	for _, train in pairs(trainTab) do
		if train.id == NetworkGetNetworkIdFromEntity(CURRENT_TRAIN) then
			isOverheated = train.overheated
			fuelOnTrain = train.fuelOnTrain

			for _, k in pairs(Config.Train) do 
				if train.data.hash == k.model then

					maxSpeed = k.maxSpeed					
					upgradeOverheat = 0

					if tonumber(train.data.upgrade) >= 1 then 
						local upgradeSpeed = Config.Upgrade[tonumber(train.data.upgrade)].speedIncrease
						if upgradeSpeed ~= false  then
							maxSpeed = maxSpeed + upgradeSpeed
						end
						
						local upgradeHeating = Config.Upgrade[tonumber(train.data.upgrade)].overheatingIncrease
						if upgradeHeating ~= false  then
							upgradeOverheat = Config.Upgrade[tonumber(train.data.upgrade)].overheatingIncrease
						end
					end

					if Config.WorldLore.SpeedUnitsMPH then
						maxSpeed = maxSpeed / 2.23
					else
						maxSpeed = maxSpeed / 3.6
					end

					break
				end
			end

			break
		end
	end

	checkFuel()
	moveKey()
	StartManagTrain()
	MonitorOverheating()
	trainSwitch()

	tempPrompStatus(4, true)
	tempPrompStatus(5, true)

    CreateThread(function()
		while isDriveTrain do
			Citizen.Wait(0)
			if IsPedInAnyVehicle(PlayerPedId(), false) then
				CheckDistance()		
								
				Citizen.InvokeNative(0xE6C5E2125EB210C1,-1763976500,0,1)
				Citizen.InvokeNative(0x3ABFA128F5BF5A70,-1763976500,0,1)
				Citizen.InvokeNative(0xE6C5E2125EB210C1,-988268728,0,1)
				Citizen.InvokeNative(0x3ABFA128F5BF5A70,-988268728,0,1)
				Citizen.InvokeNative(0xE6C5E2125EB210C1,-988268728,1,1)
				Citizen.InvokeNative(0x3ABFA128F5BF5A70,-988268728,1,1)


				if fuelOnTrain == true and isSpeedLocked then
					SetTrainSpeed(CURRENT_TRAIN, lockSpeed )
					SetTrainCruiseSpeed(CURRENT_TRAIN,lockSpeed)	
				end	
				
				local speed = GetEntitySpeed(CURRENT_TRAIN) * speedMult
				local maxSpeedMult = maxSpeed * speedMult
				local maxSpeedThreshold = maxSpeedMult * (Config.Economics.percentOverheat / 100)	
				nuiOverheating = (speed / maxSpeedThreshold ) * 100

				if isOverheated then 
					nuiOverheating = 110
				end

				if not IsPauseMenuActive() then
					SendNUIMessage({showNUI = {speed = speed, pressure = nuiOverheating, text = speedUnit}})
					Citizen.Wait(Config.HUD.hudTick or 200)
				else
					SendNUIMessage({showNUI = false})
					Citizen.Wait(500)
				end
				
			else -- train out		
				isDriveTrain = false
				Citizen.Wait(100)

				tempPrompStatus(1, false)
				tempPrompStatus(2, false)
				tempPrompStatus(3, false)
				tempPrompStatus(4, false)
				tempPrompStatus(5, false)
				feedkey = false
				isSpeedLocked = false
				SendNUIMessage({showNUI = false})
			end
		end
    end)
end


----------------------------------------------------------------------------
--  sitting on the train
----------------------------------------------------------------------------

Config.Seat = {
	{"PROP_HUMAN_PIANO", ""},
	{"PROP_PLAYER_SEAT_CHAIR_GENERIC", ""},
	{"PROP_VEHICHLE_SEAT_PASSENGER_TRAIN_TG", ""},
	{"PROP_VEHICHLE_SEAT_PASSENGER_TRAM", ""},
	{"PROP_VEHICLE_SEAT_PASSENGER_TRAIN_TABLE", ""},
	{"PROP_HUMAN_SEAT_CHAIR_TABLE_FAN_WHORE", ""},
	{"PROP_HUMAN_SEAT_CHAIR_THEATER", ""},
	{"PROP_HUMAN_SEAT_CHAIR_TRAIN", ""},
	{"PROP_HUMAN_SEAT_CHAIR_WHITTLE", ""},
	{"PROP_HUMAN_SEAT_CRATE_CLEAN_BOOTS", ""},
}

Citizen.CreateThread(function()
	while true and Config.Sitting do 
		if IsPedInAnyTrain(PlayerPedId()) then 

			local elements = {}

			local DataStruct = DataView.ArrayBuffer(256 * 4)
			local is_data_exists = Citizen.InvokeNative(0x345EC3B7EBDE1CB5, GetEntityCoords(PlayerPedId()), 1.0, DataStruct:Buffer(), 10)

			if is_data_exists ~= false then
				for i = 1, is_data_exists, 1 do
					local scenario = DataStruct:GetInt32(8 * i)
					local hash = Citizen.InvokeNative(0xA92450B5AE687AAF, scenario)
					for c, v in pairs(Config.Seat) do
						if GetHashKey(v[1]) == hash then
							if v[2] == "" then
								elements[i] = {hash = scenario}
							else
								elements[i] = {hash = scenario}
							end
						end
					end
				end

				local label = CreateVarString(10, 'LITERAL_STRING',texts.promptActionDown)

				if IsPedUsingAnyScenario(PlayerPedId()) then
					label = CreateVarString(10, 'LITERAL_STRING',texts.promptActionUp)
				end

				if elements[1] ~= nil then

					-- HERE
					activePrompt(9)
					if pressPrompt(11) then
						if not IsPedUsingAnyScenario(PlayerPedId()) then
							TaskUseScenarioPoint(PlayerPedId(),elements[1].hash, "" , -1.0, true, false, 0, false, -1.0, true)
							Citizen.Wait(5000)
						else 
							ClearPedTasks(PlayerPedId())
							Citizen.Wait(5000)
						end
					end			
				end
			end	
			Citizen.Wait(5)		
		else 
			Citizen.Wait(5000)
		end
	end
end)


----------------------------------------------------------------------------
--  Permission to operate
----------------------------------------------------------------------------
local outOfTrains = true
local accessToDrive = false

function checkTrainAccess()
    if outOfTrains and Config.PermissionDrive and Config.job.name ~= false then

		TriggerServerEvent('d-labs-train:server:job')
		job = nil

		while job == nil do
			Citizen.Wait(0)
		end
	
		if isJob then
			accessToDrive = true
		else
			accessToDrive = false
		end
    else
        accessToDrive = true
    end
end

Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5)
        local playerId = PlayerPedId()
        if IsPedInAnyTrain(playerId) then
            if outOfTrains then
                checkTrainAccess()
                outOfTrains = false
            end

            if not accessToDrive then
                Citizen.InvokeNative(0xFE99B66D079CF6BC, 0, 0xFF3626FC, true) 
                Citizen.InvokeNative(0xFE99B66D079CF6BC, 0, 0x2D79D80A, true) 
            else
                manageTrain(playerId)
            end
        else
            outOfTrains = true
			accessToDrive = false
            currentJob = nil
            Citizen.Wait(2000)
        end
    end
end)

function manageTrain(playerId)
    if IsPedInAnyVehicle(playerId, false) then
        local vehicle = GetVehiclePedIsIn(playerId, false)
        local networkId = VehToNet(vehicle)
        local isTrainExists = false

        for k,v in pairs(trainTab) do
            if v.id == networkId then

				if not isDriveTrain then
					isDriveTrain = true
					isTrainExists = true
					trainHandler(v.data.idname)
				end
                break
            end
        end
    end
end


----------------------------------------------------------------------------
--  while to open Promp, 3D icon ect.
----------------------------------------------------------------------------
Citizen.Wait(500)

Citizen.CreateThread(function()
	while true do
		local pedCoords = GetEntityCoords(PlayerPedId())
		local t = 2000

		for k, v in pairs(Config.TrainStations) do
			local coordsStats = vector3(v.Pos.x,v.Pos.y,v.Pos.z)
			local dist = #(pedCoords-coordsStats)     
			if dist < Config.PromptDistance then 
				t = 5
				activePrompt(1)
				if pressPrompt(1) then 
					openFirstMenu(k)
				end
			end 
		end        

		for k,v in pairs(Config.TrainStations) do 
			if v.timetable then 
				local coords = vector3(v.timetable.x,v.timetable.y,v.timetable.z)
				local dist = #(coords - pedCoords)

				if dist < 5.5 then 
					Citizen.InvokeNative(0x2A32FAA57B937173, Config.Ring.marker, v.timetable.x,v.timetable.y,v.timetable.z-0.95, 0, 0, 0, 0,0,0, Config.Ring.scale.x,Config.Ring.scale.y, Config.Ring.scale.z, Config.Ring.r,  Config.Ring.g, Config.Ring.b,  Config.Ring.a, 0, 0, 2, 0, 0, 0, 0)
					t = 0
					if dist < Config.PromptDistance then 

						activePrompt(2)
						if pressPrompt(2) then
							TriggerServerEvent('d-labs-train:server:showTimetable', v.PosName)
							Citizen.Wait(3000)
						elseif pressPrompt(3) then
							TriggerServerEvent('d-labs-train:server:setTimetable', v.PosName)
							Citizen.Wait(3000)
						end
					end 
				end
			end
		end

		if Config.Managment then
			for k,v in pairs(Config.Managment) do
				local coords = vector3(v.x,v.y,v.z)
				local dist = #(coords - pedCoords)

				if dist < 5.5 then 
					t = 0
					Citizen.InvokeNative(0x2A32FAA57B937173, Config.Ring.marker, v.x, v.y, v.z-0.95, 0, 0, 0, 0,0,0, Config.Ring.scale.x,Config.Ring.scale.y, Config.Ring.scale.z, Config.Ring.r,  Config.Ring.g, Config.Ring.b,  Config.Ring.a, 0, 0, 2, 0, 0, 0, 0)
					if dist < Config.PromptDistance then 

						activePrompt(3)
						if pressPrompt(4) then
							TriggerServerEvent('d-labs-train:server:openManagement')
							Citizen.Wait(5000)
						end
					end 
				end
			end
		end
		
		if Config.allTimetable then 
			for k,v in pairs(Config.allTimetable) do 
				local coords = vector3(v.x,v.y,v.z)
				local dist = #(coords - pedCoords)

				if dist < 5.5 then 
					t = 0
					Citizen.InvokeNative(0x2A32FAA57B937173, Config.Ring.marker, v.x, v.y, v.z-0.95, 0, 0, 0, 0,0,0, Config.Ring.scale.x,Config.Ring.scale.y, Config.Ring.scale.z, Config.Ring.r,  Config.Ring.g, Config.Ring.b,  Config.Ring.a, 0, 0, 2, 0, 0, 0, 0)
					if dist < Config.PromptDistance then 

						activePrompt(5)
						if pressPrompt(6) then
							openAlltimetable()
							Citizen.Wait(3000)
						end
					end 
				end
			end
		end

		Citizen.Wait(t)
	end
end)

----------------------------------------------------------------------------
--  Notification
----------------------------------------------------------------------------


RegisterNetEvent('Notification:'..GetCurrentResourceName())
AddEventHandler('Notification:'..GetCurrentResourceName(), function(t1, t2, dict, txtr, timer)
	if not HasStreamedTextureDictLoaded(dict) then
		RequestStreamedTextureDict(dict, true) 
		while not HasStreamedTextureDictLoaded(dict) do
			Citizen.Wait(5)
		end
	end
	local parentResource = GetCurrentResourceName()
	if Config.Server.NotifCustom ~= true then
		if txtr ~= nil then
			exports[parentResource].LeftNot(0, tostring(t1), tostring(t2), tostring(dict), tostring(txtr), tonumber(timer))
		else
			local txtr = "tick"
			exports[parentResource].LeftNot(0, tostring(t1), tostring(t2), tostring(dict), tostring(txtr), tonumber(timer))
		end
	else 
		openCustomNotif(t1, t2, dict, txtr, timer)
	end
end)



----------------------------------------------------------------------------
--  onResourceStop
----------------------------------------------------------------------------


AddEventHandler("onResourceStop", function(resourceName)
	if resourceName == GetCurrentResourceName() then

		for _,ent in pairs(Peds) do
			DeleteEntity(ent)
			DeletePed(ent)
			SetEntityAsNoLongerNeeded(ent)

		end

		
		if DoesBlipExist(radiusBlip) then
			RemoveBlip(radiusBlip)
		end
		
		for k,v in pairs(supplies) do
			DeleteEntity(v)
		end
	
		if hand then 
			DeleteEntity(hand)
		end

		if Config.Server.MetaTarget then
			for id, _ in pairs(Config.TrainStations) do
				openDeleteTarget(id)
			end
		end
			
		for k,v in pairs(trainTab) do
			NetworkRequestControlOfEntity(v.id)
			local set = NetToVeh(v.id)
			SetEntityAsMissionEntity(set,true,true)
			DeleteVehicle(set)
			SetModelAsNoLongerNeeded(set)
		end
	
		for c,z in pairs(blipTable) do
			RemoveBlip(z)
		end
		
		SetAllJunctionsCleared()

		DestroyCam(cam, false)
		SetCamActive(cam, false)
		DestroyAllCams(true)

		BusyspinnerOff()
		RemoveBlip(blip)

		DoScreenFadeIn(1)

		MenuData.CloseAll()
		

	end
end)


----------------------------------------------------------------------------
--  Setup
----------------------------------------------------------------------------

for id, c in pairs(Config.TrainStations) do

	local model = GetHashKey(c.Model)
	RequestModel(model)
	while not HasModelLoaded(model) do
		Wait(0)
	end
	local ped = CreatePed(model, c.Pos.x,c.Pos.y,c.Pos.z-1.0,c.Pos[4] , false, true)
	Wait(1)
	SetBlockingOfNonTemporaryEvents(ped, true)
	SetPedCanPlayAmbientAnims(ped, true)
	SetPedCanRagdollFromPlayerImpact(ped, false)
	SetEntityInvincible(ped, true)
	SetPedFleeAttributes(ped, 0, false)
	FreezeEntityPosition(ped, true)
	NetworkSetEntityInvisibleToNetwork(ped, true)
	Citizen.InvokeNative(0x283978A15512B2FE, ped, true)

	table.insert(Peds, ped)

	if Config.Server.MetaTarget then
		local coords = c.Pos
		openSetupTarget(coords,id)
	end

	if c.blip ~= 0 and c.blip ~= false then
		Citizen.Wait(100)
		blipTable[id] = N_0x554d9d53f696d002(1664425300, c.Pos.x, c.Pos.y, c.Pos.z)
		SetBlipSprite(blipTable[id], c.blip.bliphash, 1)
		SetBlipScale(blipTable[id], 0.2)
		Citizen.InvokeNative(0x9CB1A1623062F402, blipTable[id], c.blip.name)
	end
end

----------------------------------------------------------------------------
--  debug
----------------------------------------------------------------------------

if DEBUG.control then
	RegisterCommand('tt', function(source, args, rawCommand)
		local hash = 0x3260CE89
	
		local trainWagons = N_0x635423d55ca84fc8(hash)
		for wagonIndex = 0, trainWagons - 1 do
			local trainWagonModel = N_0x8df5f6a19f99f0d5(hash, wagonIndex)
			while not HasModelLoaded(trainWagonModel) do
				Citizen.InvokeNative(0xFA28FE3A6246FC30, trainWagonModel, 1)
				Citizen.Wait(0)
			end
		end
	
		local playerCoords = GetEntityCoords(PlayerPedId())
		local testTrain = N_0xc239dbd9a57d2a71(hash, playerCoords, tonumber(args[1]) or 1, 0, 1, 0) 

		CURRENT_TRAIN = testTrain
		SetTrainCruiseSpeed(testTrain, 0.0)
		SetTrainSpeed(testTrain, 0.0)
		SetModelAsNoLongerNeeded(hash)
	
		local trainData = {
			hash = hash,
			idname = "gjP9zxRVWsjy2qt",
			id = 999,
			upgrade = 0,
			damage = 0,
			label = "Locomotive - Test",
			price = 200,
			model = "Locomotive",
			stash = "test_stash_1",
			status = "inGarage"
		}
	
		TriggerServerEvent('d-labs-train:server:spawnTrain', NetworkGetNetworkIdFromEntity(testTrain), trainData)
	end, false)

	local debugSpeed = false

	Citizen.CreateThread(function()
		while true do 
			Citizen.Wait(0)			
			if IsControlJustPressed(1,0x6319DB71) then
				debugSpeed = true
				while debugSpeed do 
					Citizen.Wait(200)
					SetTrainSpeed(CURRENT_TRAIN,29.5)
				end	
			end
		end
	end)

	Citizen.CreateThread(function()
		while true do 
			Citizen.Wait(0)
			if IsControlJustPressed(1,0x05CA7C52) then
				debugSpeed = false 
				Citizen.Wait(200)
				SetTrainSpeed(CURRENT_TRAIN,0)
			end
		end
	end)
end


function overheatScenario()

	ClearPedTasks(PlayerPedId())
	TaskStartScenarioInPlace(PlayerPedId(), `WORLD_HUMAN_BUCKET_POUR_LOW`, -1, true, false, false, false)
	Citizen.Wait(6*1000)
	ClearPedTasks(PlayerPedId())
	Citizen.Wait(4*1000)
	ClearPedTasksImmediately(PlayerPedId(),true,false)

	local playerPed = PlayerPedId()
	local attachedObjects = GetGamePool('CObject')
	for _, object in ipairs(attachedObjects) do
		if IsEntityAttachedToEntity(object, playerPed) then
			DeleteObject(object)
		end
	end
end

Citizen.CreateThread(function()
	while true do 
		local t = 2000

		local playerPed = PlayerPedId()
		local playerCoords = GetEntityCoords(playerPed)
		local trainEntity, v = GetPropToInteraction()
		
		if DoesEntityExist(trainEntity) and v then
			local frontCoords = GetOffsetFromEntityInWorldCoords(trainEntity, 0.0, 10.0, 0.0)				
			local distance = #(playerCoords - frontCoords)

			if v.overheated and distance <= 5.0 then
				activePrompt(4)
				t = 0
				
				if pressPrompt(5) then	
					if not Config.Item.cooling then
						overheatScenario()
						StopParticleFxLooped(v.overheated, false)						
						local ent = trainEntity
						local nameOfStatus = 'overheated'
						local statusValue = false
						TriggerServerEvent('d-labs-train:server:syncTrainManagment',NetworkGetNetworkIdFromEntity(ent),nameOfStatus,statusValue)
						TriggerEvent('Notification:'..GetCurrentResourceName(), 'success', texts.notif.cooling, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
					else 
						water = nil
						TriggerServerEvent('d-labs-train:server:water')
						while water == nil do 
							Citizen.Wait(0)
						end
						if water >= 1 then  
							TriggerServerEvent('d-labs:server:removeItem',Config.Item.cooling,1)	
							overheatScenario()
							StopParticleFxLooped(v.overheated, false)			
							local ent = trainEntity
							local nameOfStatus = 'overheated'
							local statusValue = false
							TriggerServerEvent('d-labs-train:server:syncTrainManagment',NetworkGetNetworkIdFromEntity(ent),nameOfStatus,statusValue)
							TriggerEvent('Notification:'..GetCurrentResourceName(), 'success', texts.notif.cooling, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
						else
							TriggerEvent('Notification:'..GetCurrentResourceName(), 'error', texts.notif.noCooling, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
						end
					end
				end
			end
		end


		Citizen.Wait(t)
	end
end)

function stashOpen(stashName,stashConfig)
	if Config.Framework == 'RSG' then
		if Config.Server.NewFramework == 'V1' then
			TriggerEvent("inventory:client:SetCurrentStash", stashName)
			Citizen.Wait(500)
			TriggerServerEvent('inventory:server:OpenInventory', "stash", stashName, stashConfig)
		else
			TriggerServerEvent("d-labs-train:server:rsgInv",stashName, stashConfig)
		end
	elseif Config.Framework == 'VORP' then
		local tempLockerCoords =  GetEntityCoords(PlayerPedId())
		TriggerServerEvent("d-labs-train:server:vorpInv", 'Train', stashName, stashConfig, tempLockerCoords)
	elseif Config.Framework == 'REDEMRP_2023' then
		TriggerEvent('redemrp_inventory:OpenStash', stashName, (stashConfig.maxweight or 1000.0),stashConfig.slots)
		Citizen.Wait(2000)
	elseif Config.Framework == 'QBR' then
		TriggerServerEvent('inventory:server:OpenInventory', "stash", stashName, {maxweight = stashConfig.maxweight, slots = stashConfig.slots})
		TriggerEvent("inventory:client:SetCurrentStash", stashName)
	else
		openStashCustom(stashName,stashConfig)
	end
end

RegisterNetEvent('d-labs-train:client:openStashOnJob')
AddEventHandler('d-labs-train:client:openStashOnJob', function(stashName,stashConfig)
	stashOpen(stashName,stashConfig)
end)

Citizen.CreateThread(function()
	while true do 
		local t = 2000
		local playerPed = PlayerPedId()
		local playerCoords = GetEntityCoords(playerPed)
		local trainEntity, v = GetPropToInteraction()
		if DoesEntityExist(trainEntity) and v then
			local frontCoords = GetOffsetFromEntityInWorldCoords(trainEntity, 0.0, -10.0, 0.0)				
			local distance = #(playerCoords - frontCoords)
			if distance <= 5.0 then					
				t = 0

				if not isHaveWork then
					activePrompt(6)	
				else
					activePrompt(7)		
				end

				if pressPrompt(7) or pressPrompt(9) then	

					local stashName = 'train_'..v.data.stash
					local stashConfig = nil

					for _, k in pairs(Config.Train) do
						if v.data.hash == k.model then									
							stashConfig = k.stash	

							if tonumber(v.data.upgrade) ~= 0 then
								if Config.Upgrade[tonumber(v.data.upgrade)].stash then 
									stashConfig = Config.Upgrade[tonumber(v.data.upgrade)].stash
								end
							end

							break
						end
					end

					if not Config.StashLockOnJob then
						stashOpen(stashName,stashConfig)
					else 
						TriggerServerEvent('d-labs-train:server:openStashOnJob',stashName,stashConfig)
					end

					Citizen.Wait(2*1000)
				end

				if pressPrompt(8) then
					deliveryTrainInteraction()
					Citizen.Wait(2*1000)
				end
			end
		end


		Citizen.Wait(t)
	end
end)

if not Config.job.managmentSystem then
	TriggerServerEvent('d-labs-train:server:getLicense')

	RegisterNetEvent('d-labs-train:client:getLicense')
	AddEventHandler('d-labs-train:client:getLicense', function(_)
		license = _
	end)
end

Citizen.Wait(1000)
SendNUIMessage({
	action = 'texts_send',
	inform = Config.WorldLore.year, 
	text = texts,
	hud = Config.HUD,
})

