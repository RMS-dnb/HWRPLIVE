local RSGCore = exports['rsg-core']:GetCoreObject()
local playerSpawn = false
local altPressCount = 0
local preZoneTexture = nil
local preTown = nil

function StartScript()
	local threadId = Citizen.CreateThread(function()
		while true do
			Citizen.Wait(3000)
			if not playerSpawn then
				Citizen.InvokeNative(0x87ED52AE40EA1A52, threadId)
                return
            end
			if Config.ShowAll then
				ShowHandlingZones(false)
			else				
				ShowZonesTowns()
			end
		end
	end)
end

function ShowZonesTowns()
	local playerCoords = GetEntityCoords(cache.ped)
	local newTown = GetMapZoneAtCoords(playerCoords, 1)
	if newTown == 0 then --если города нет чекаем поселения
		newTown = GetMapZoneAtCoords(playerCoords, 12)
	end
	if newTown ~= 0 then
		if preTown ~= newTown then
			local zoneTexture = getZoneData(newTown)
			--if zoneTexture ~= nil or zoneTexture ~= "" then
			if zoneTexture and zoneTexture ~= "" then
				nativeAlertTop(zoneTexture)
				preTown = newTown
			end
		end
	else --если 0 то мы выехали из города или поселения
		preTown = nil
	end
end

function getZoneData(hash)
	if hash ~= 0 then
		local sd = Config.ZoneTextures[hash]
		if sd then
			return sd.zoneTexture
		else
			print('No Zone data for:', hash)
			return nil
		end
	else
		print("No hash")
		return nil
	end
end

function formatTime(time) 
	if time < 10 then
		time = '0'..time
	end
	return time
end

function getIGTime()
	-- Get Time for game
	local hour =  GetClockHours()
	local ap = 'am'

	if hour > 12 then
		hour = hour  - 12
		ap = 'pm'
	elseif hour == 0 then
		hour = hour + 12
		ap = 'am'
	elseif hour == 12 then
		ap = 'pm'
	end
	if Config.hourFormat24 then
		return formatTime(GetClockHours()) ..":" .. formatTime(GetClockMinutes())	
	else
		--return formatTime(hour) ..":" .. formatTime(GetClockMinutes()) ..":" .. formatTime(GetClockSeconds()) .. ap
		return formatTime(hour) ..":" .. formatTime(GetClockMinutes()) .. ap
	end
end

function getIGWindSpeed()
	-- Get Temperatures
	local metric = ShouldUseMetricTemperature();
	local windSpeed
	local windSpeedUnit
	if metric then
		windSpeed = math.floor(GetWindSpeed())
		windSpeedUnit = 'kph'
	else
		windSpeed = math.floor(GetWindSpeed() * 0.621371)
		windSpeedUnit = 'mph'
	end

	-- TODO: Figure out how to get the heading from the wind direction
	-- local wx, wy, wz = table.unpack(GetWindDirection())

	return string.format('%d °%s', windSpeed, windSpeedUnit)
end

function getIGTemp()
	local coords = GetEntityCoords(cache.ped)
	
	local temperature
	local temperatureUnit
	local windSpeed
	local windSpeedUnit
	local colorTemp = "COLOR_WHITE"
	--if metric then
	if Config.TempFormatCelsius then
		temperature = math.floor(GetTemperatureAtCoords(coords))
		temperatureUnit = 'C'
		color = temperature > 0 and "COLOR_YELLOWSTRONG" or "COLOR_BLUE"


		windSpeed = math.floor(GetWindSpeed())
		windSpeedUnit = 'kph'
	else
		temperature = math.floor(GetTemperatureAtCoords(coords) * 9/5 + 32)
		temperatureUnit = 'F'
		color = temperature > 32 and "COLOR_YELLOWSTRONG" or "COLOR_BLUE"

		windSpeed = math.floor(GetWindSpeed() * 0.621371)
		windSpeedUnit = 'mph'
	end

	--local wx, wy, wz = table.unpack(GetWindDirection())

	--return string.format('%d °%s', temperature, temperatureUnit)
	return temperature, temperatureUnit, color
end

RegisterCommand("zoneinfo", function(source, args, rawCommand) -- Debug COMMAND
	local coords = GetEntityCoords(cache.ped)
	
	print('print', GetMapZoneAtCoords(coords, 12))
	print('town', GetMapZoneAtCoords(coords, 1))
	print('written', GetMapZoneAtCoords(coords, 13))
	if GetMapZoneAtCoords(coords, 11) ~= GetWaterMapZoneAtCoords(coords) and GetMapZoneAtCoords(coords, 11) ~= 0 then
		print('unk', GetMapZoneAtCoords(coords, 11))
	else
		print('waterZone', GetWaterMapZoneAtCoords(coords))	
	end
	print('district', GetMapZoneAtCoords(coords, 10))
	print('state', GetMapZoneAtCoords(coords, 0))
	
	
	
	
	--print('waterZone', GetWaterMapZoneAtCoords(coords))	
	--print('lake', GetMapZoneAtCoords(coords, 2))
	--print('river', GetMapZoneAtCoords(coords, 3))
	--print('swamp', GetMapZoneAtCoords(coords, 5))
	--print('ocean', GetMapZoneAtCoords(coords, 6))
	--print('creek', GetMapZoneAtCoords(coords, 7))
	--print('pond', GetMapZoneAtCoords(coords, 8))
	--print('unk', GetMapZoneAtCoords(coords, 11))
	

	--ShowHandlingZones()

end)


--Двойное нажатие на ALT
function GetGameTimer()
	return Citizen.InvokeNative(0x4F67E8ECA7D3F667, Citizen.ResultAsInteger())
end

local isAltPressed = false
local isFirstPress = false
local lastAltPressTime = 0
local doubleTapThreshold = 300

function StartHandingScript()
	local threadId = Citizen.CreateThread(function()
		while true do
			Citizen.Wait(0)
			if not playerSpawn then
				Citizen.InvokeNative(0x87ED52AE40EA1A52, threadId)
                return
            end
			
			-- Отслеживание нажатия клавиши ALT
			if IsControlPressed(0, 0x580C4473) then
				if not isAltPressed then
					isAltPressed = true
					local currentTime = GetGameTimer()
					if currentTime - lastAltPressTime <= doubleTapThreshold then
						characterselected = true
						--alertUI()
						ShowHandlingZones(true)
						--print("Double tap ALT")
					else
						-- Первое нажатие
						isFirstPress = true
					end
					lastAltPressTime = currentTime
				elseif isFirstPress then
					-- Ожидание второго нажатия
					local currentTime = GetGameTimer()
					if currentTime - lastAltPressTime > doubleTapThreshold then
						isFirstPress = false
					end
				end
			else
				isAltPressed = false
				isFirstPress = false
			end
		end
	end)
end

function ShowHandlingZones(hand)
	local zoneTexture = nil
	local playerCoords = GetEntityCoords(cache.ped)
	local zone = 0
	
	if playerSpawn == true then
		zoneTexture = GetSpecialLandmarkName(GetIndex(playerCoords));
		if zoneTexture == nil or zoneTexture == "" then
			local zoneTypes = {12, 1, 13, 11, 10, 0}
			for _, zoneType in ipairs(zoneTypes) do
                zone = GetMapZoneAtCoords(playerCoords, zoneType)

                if zone ~= 0 then
                    -- Если зона найдена, проверяем воду для типов 11
                    if zoneType == 11 then
                        local tempWaterzone = GetWaterMapZoneAtCoords(playerCoords)
                        if zone == tempWaterzone then
							zone = tempWaterzone
						end
                    end
                    break -- Если зона найдена, прерываем цикл
                end
            end
			
			if zone ~= 0 then
				zoneTexture = getZoneData(zone)
			else
				print("ERROR: No zone")
				return
			end
		end

		if (zoneTexture ~= preZoneTexture and hand == false) or (zoneTexture ~= nil and hand) then
			nativeAlertTop(zoneTexture)
			preZoneTexture = zoneTexture
			--print("zone = " .. zone)
		end
	end
end

function nativeAlertTop(zoneTexture) 
	local time = getIGTime()
	local temperature, temperatureUnit, color = getIGTemp()
	local stringTemp = temperature .. " °" .. temperatureUnit
	-- local wind = getIGWindSpeed()

	if zoneTexture then
		ShowLocationNotification(time .. '  |  ~' .. color .. '~' .. stringTemp, zoneTexture, Config.NotifyTime)
	end
end

function GetIndex(playerCoords)
    for index = 0, 50 do
        if CheckConditions(playerCoords, index) then
            return index
        end
    end
    return -1
end

function CheckConditions(playerCoords, index)
    local uParam1, uParam2, uParam3 = GetValues(index)
    if CheckDistance(playerCoords, uParam1, uParam2.x, uParam2.y, uParam3) then
        return true
    end
    return false
end

function GetValues(index)
	local uParam1 = vector3(0.0, 0.0, 0.0)
	local uParam2 = vector3(0.0, 0.0, 0.0)
	local uParam3 = 0.0

    if index == 0 then
        uParam1 = vector3(-1616.769, 1260.714, 205.33)
        uParam2 = vector3(150.0, 150.0, 184.0)
        uParam3 = 0.0
    elseif index == 1 then
        uParam1 = vector3(-5837.918, -3738.832, -20.6)
        uParam2 = vector3(40.0, 35.0, 70.0)
        uParam3 = 45.0
    elseif index == 2 then
        uParam1 = vector3(-4160.689, -2836.915, -13.674)
        uParam2 = vector3(43.0, 197.0, 70.0)
        uParam3 = 38.0
    elseif index == 3 then
        uParam1 = vector3(-4359.861, -3083.375, -13.674)
        uParam2 = vector3(30.0, 30.0, 70.0)
        uParam3 = 0.0
    elseif index == 4 then
        uParam1 = vector3(-4446.777, -2689.265, -13.674)
        uParam2 = vector3(30.0, 30.0, 70.0)
        uParam3 = 0.0
    elseif index == 5 then
        uParam1 = vector3(-4415.84, -2199.774, 22.356)
        uParam2 = vector3(13.0, 21.0, 47.0)
        uParam3 = 34.0
    elseif index == 6 then
        uParam1 = vector3(-5554.764, -2395.945, 7.172)
        uParam2 = vector3(21.0, 21.0, 47.0)
        uParam3 = 0.0
    elseif index == 7 then
        uParam1 = vector3(-3447.267, -2257.723, 7.172)
        uParam2 = vector3(40.0, 23.0, 47.0)
        uParam3 = 0.0
    elseif index == 8 then
        uParam1 = vector3(-1425.852, -2676.848, 73.224)
        uParam2 = vector3(40.0, 25.0, 47.0)
        uParam3 = 26.0
    elseif index == 9 then
        uParam1 = vector3(-3829.438, -3009.26, -13.674)
        uParam2 = vector3(39.0, 54.0, 70.0)
        uParam3 = -46.0
    elseif index == 10 then
        uParam1 = vector3(-4696.308, -3302.809, -13.674)
        uParam2 = vector3(104.0, 57.0, 70.0)
        uParam3 = 0.0
    elseif index == 11 then
        uParam1 = vector3(-5064.707, -3139.862, -13.674)
        uParam2 = vector3(23.0, 26.0, 70.0)
        uParam3 = 43.0
    elseif index == 12 then
        uParam1 = vector3(-1631.875, -2856.089, -1.645)
        uParam2 = vector3(149.0, 65.0, 154.0)
        uParam3 = 39.0
    elseif index == 13 then
        uParam1 = vector3(-347.889, -131.72, -1.645)
        uParam2 = vector3(52.0, 40.0, 154.0)
        uParam3 = 0.0
    elseif index == 14 then
        uParam1 = vector3(-2126.5, 88.317, 139.179)
        uParam2 = vector3(334.0, 171.0, 277.0)
        uParam3 = -45.0
    elseif index == 15 then
        uParam1 = vector3(1574.061, 1121.954, 201.6)
        uParam2 = vector3(147.0, 194.0, 201.0)
        uParam3 = 0.0
    elseif index == 16 then
        uParam1 = vector3(-2741.641, -2375.761, 31.492)
        uParam2 = vector3(86.0, 61.0, 50.0)
        uParam3 = 11.0
    elseif index == 17 then
        uParam1 = vector3(1773.323, -5976.334, 71.662)
        uParam2 = vector3(34.0, 34.0, 100.0)
        uParam3 = -124.0
    elseif index == 18 then
        uParam1 = vector3(-2022.258, -3039.913, 25.0)
        uParam2 = vector3(25.0, 25.0, 45.0)
        uParam3 = 0.0
    elseif index == 19 then
        uParam1 = vector3(1394.172, -647.735, 72.455)
        uParam2 = vector3(19.0, 18.0, 100.0)
        uParam3 = 40.0
    elseif index == 20 then
        uParam1 = vector3(-242.336, 1624.373, 212.894)
        uParam2 = vector3(98.0, 52.0, 120.0)
        uParam3 = 51.0
    elseif index == 21 then
        uParam1 = vector3(-3543.512, -3032.038, -13.674)
        uParam2 = vector3(40.0, 40.0, 70.0)
        uParam3 = 0.0
    elseif index == 22 then
        uParam1 = vector3(-4348.655, -2427.582, -13.674)
        uParam2 = vector3(40.0, 40.0, 70.0)
        uParam3 = 0.0
    elseif index == 23 then
        uParam1 = vector3(-391.586, 922.337, 137.604)
        uParam2 = vector3(31.0, 30.0, 40.0)
        uParam3 = 0.0
    elseif index == 24 then
        uParam1 = vector3(-2656.999, 153.667, 189.043)
        uParam2 = vector3(177.0, 126.0, 102.0)
        uParam3 = 52.0
    elseif index == 25 then
        uParam1 = vector3(156.109, 425.799, 120.0)
        uParam2 = vector3(249.0, 112.0, 120.0)
        uParam3 = -36.0
    elseif index == 26 then
        uParam1 = vector3(-5868.5, -2752.441, -13.674)
        uParam2 = vector3(40.0, 40.0, 70.0)
        uParam3 = 0.0
    elseif index == 27 then
        uParam1 = vector3(898.505, -335.252, 48.403)
        uParam2 = vector3(56.0, 152.0, 70.0)
        uParam3 = -36.0
    elseif index == 28 then
        uParam1 = vector3(-889.947, -171.356, 90.537)
        uParam2 = vector3(180.0, 95.0, 100.0)
        uParam3 = 29.0
    elseif index == 29 then
        uParam1 = vector3(571.454, 1968.615, 122.93)
        uParam2 = vector3(32.0, 49.0, 140.0)
        uParam3 = 0.0
    elseif index == 30 then
        uParam1 = vector3(-2769.681, -3210.99, 25.0)
        uParam2 = vector3(25.0, 25.0, 45.0)
        uParam3 = 0.0
    elseif index == 31 then
        uParam1 = vector3(-5409.034, -3657.266, -14.496)
        uParam2 = vector3(36.0, 30.0, 30.0)
        uParam3 = -24.0
    elseif index == 32 then
        uParam1 = vector3(2453.293, 290.68, 69.615)
        uParam2 = vector3(35.0, 42.0, 19.0)
        uParam3 = -4.0
    elseif index == 33 then
        uParam1 = vector3(-643.042, 278.359, 95.5)
        uParam2 = vector3(70.0, 67.0, 65.0)
        uParam3 = -109.0
    elseif index == 34 then
        uParam1 = vector3(-118.339, -24.853, 96.907)
        uParam2 = vector3(84.0, 69.0, 37.0)
        uParam3 = 0.0
    elseif index == 35 then
        uParam1 = vector3(-2863.456, -2723.259, 93.195)
        uParam2 = vector3(196.0, 157.0, 85.0)
        uParam3 = -18.0
    elseif index == 36 then
        uParam1 = vector3(-3484.814, -3466.383, -0.849)
        uParam2 = vector3(12.0, 12.0, 70.0)
        uParam3 = 0.0
    elseif index == 37 then
        uParam1 = vector3(-3620.875, -3575.926, -0.849)
        uParam2 = vector3(126.0, 86.0, 70.0)
        uParam3 = -6.0
    elseif index == 38 then
        uParam1 = vector3(-1382.32, -1400.969, 56.092)
        uParam2 = vector3(22.0, 32.0, 86.0)
        uParam3 = 0.0
    elseif index == 39 then
        uParam1 = vector3(-713.105, -538.091, 59.42)
        uParam2 = vector3(160.0, 22.0, 100.0)
        uParam3 = 26.0
    elseif index == 40 then
        uParam1 = vector3(1083.588, -693.478, 48.403)
        uParam2 = vector3(45.0, 46.0, 70.0)
        uParam3 = 0.0
    elseif index == 41 then
        uParam1 = vector3(-956.489, 2175.227, 307.401)
        uParam2 = vector3(28.0, 23.0, 100.0)
        uParam3 = 0.0
    elseif index == 42 then
        uParam1 = vector3(1457.354, -1576.261, 95.401)
        uParam2 = vector3(28.0, 23.0, 100.0)
        uParam3 = 0.0
    elseif index == 43 then
        uParam1 = vector3(348.488, -669.098, 95.0)
        uParam2 = vector3(28.0, 23.0, 100.0)
        uParam3 = 0.0
    elseif index == 44 then
        uParam1 = vector3(2008.052, 617.155, 95.0)
        uParam2 = vector3(28.0, 23.0, 100.0)
        uParam3 = 0.0
    elseif index == 45 then
        uParam1 = vector3(2099.835, -283.012, 42.0)
        uParam2 = vector3(21.0, 29.0, 49.0)
        uParam3 = 52.0
    elseif index == 46 then
        uParam1 = vector3(-1759.31, -224.369, 168.0)
        uParam2 = vector3(21.0, 29.0, 116.0)
        uParam3 = 56.0
    elseif index == 47 then
        uParam1 = vector3(2142.39, -1284.068, 85.0)
        uParam2 = vector3(40.0, 71.0, 116.0)
        uParam3 = 70.0
    elseif index == 48 then
        uParam1 = vector3(2309.119, -343.031, 85.0)
        uParam2 = vector3(15.0, 15.0, 116.0)
        uParam3 = 0.0
    elseif index == 49 then
        uParam1 = vector3(-1815.147, -2405.116, 71.0)
        uParam2 = vector3(25.0, 25.0, 50.0)
        uParam3 = 0.0
    elseif index == 50 then
        uParam1 = vector3(-2269.232, -1145.787, 214.0)
        uParam2 = vector3(37.0, 33.0, 68.0)
        uParam3 = 0.0
    end

    return uParam1, uParam2, uParam3
end

function CheckDistance(playerCoords, vParam3, X, Y, uParam3)
	local vVar0 = playerCoords - vParam3
	local sVar3 = {}
	sVar3.x = (vVar0.x * math.cos(uParam3)) + (vVar0.y * math.sin(uParam3))
	sVar3.y = (vVar0.x * math.sin(uParam3)) - (vVar0.y * math.cos(uParam3))
	local fVar6 = sVar3.x * sVar3.x / (X * X) + sVar3.y * sVar3.y / (Y * Y)
	return fVar6 <= 1.0
end

function GetSpecialLandmarkName(iParam0)
    if iParam0 == 0 then
        return "LANDMARK_MOUNT_HAGEN"
    elseif iParam0 == 1 then
        return "LANDMARK_SCRATCHING_POST"
    elseif iParam0 == 2 then
        return "LANDMARK_JORGES_GAP"
    elseif iParam0 == 3 then
        return "LANDMARK_MERCER_STATION"
    elseif iParam0 == 4 then
        return "LANDMARK_ODDFELLOWS_REST"
    elseif iParam0 == 5 then
        return "LANDMARK_RATTLESNAKE_HOLLOW"
    elseif iParam0 == 6 then
        return "LANDMARK_SILENT_STEAD"
    elseif iParam0 == 7 then
        return "LANDMARK_THE_HANGING_ROCK"
    elseif iParam0 == 8 then
        return "LANDMARK_THE_OLD_BACCHUS_PLACE"
    elseif iParam0 == 9 then
        return "LANDMARK_TWO_CROWS"
    elseif iParam0 == 10 then
        return "LANDMARK_REPENTANCE"
    elseif iParam0 == 11 then
        return "LANDMARK_BENEDICT_PASS"
    elseif iParam0 == 12 then
        return "WATER_MANTECA_FALLS"
    elseif iParam0 == 13 then
        return "SETTLEMENT_LIMPANY"
    elseif iParam0 == 14 then
        return "WATER_MOUNT_SHANN"
    elseif iParam0 == 15 then
        return "LANDMARK_THREE_SISTERS"
    elseif iParam0 == 16 then
        return "HIDEOUT_PIKES_BASIN"
    elseif iParam0 == 17 then
        return "SETTLEMENT_EL_NIDO"
    elseif iParam0 == 18 then
        return "LANDMARK_BRITTLEBUSH_TRAWL"
    elseif iParam0 == 19 then
        return "LANDMARK_ERIS_FIELD"
    elseif iParam0 == 20 then
        return "LANDMARK_GRANITE_PASS"
    elseif iParam0 == 21 then
        return "LANDMARK_VENTERS_PLACE"
    elseif iParam0 == 22 then
        return "LANDMARK_PLEASANCE_HOUSE"
    elseif iParam0 == 23 then
        return "HOMESTEAD_CHADWICK_FARM"
    elseif iParam0 == 24 then
        return "LANDMARK_BLACK_BONE_FOREST"
    elseif iParam0 == 25 then
        return "LANDMARK_CITADEL_ROCK"
    elseif iParam0 == 26 then
        return "LANDMARK_CUEVA_SECA"
    elseif iParam0 == 27 then
        return "LANDMARK_DEWBERRY_CREEK"
    elseif iParam0 == 28 then
        return "LANDMARK_DIABLO_RIDGE"
    elseif iParam0 == 29 then
        return "LANDMARK_DONNER_FALLS"
    elseif iParam0 == 31 then
        return "HIDEOUT_SOLOMONS_FOLLY"
    elseif iParam0 == 32 then
        return "LANDMARK_FORT_BRENNAND"
    elseif iParam0 == 33 then
        return "LANDMARK_CALIBANS_SEAT"
    elseif iParam0 == 34 then
        return "HIDEOUT_HORSESHOE_OVERLOOK"
    elseif iParam0 == 35 then
        return "LANDMARK_MESCALERO"
    elseif iParam0 == 36 then
        return "LANDMARK_RIO_DEL_LOBO_HOUSE"
    elseif iParam0 == 37 then
        return "LANDMARK_RIO_DEL_LOBO_ROCK"
    elseif iParam0 == 38 then
        return "LANDMARK_BROKEN_TREE"
    elseif iParam0 == 39 then
        return "LANDMARK_BARDS_CROSSING"
    elseif iParam0 == 40 then
        return "LANDMARK_FACE_ROCK"
    elseif iParam0 == 50 then
        return "LANDMARK_NEKOTI_ROCK"
    elseif iParam0 >= 41 and iParam0 <= 49 then
        return ""
    end
    return ""
end

function ShowLocationNotification(text, location, duration)
    local string1 = CreateVarString(10, "LITERAL_STRING", location)
    local string2 = CreateVarString(10, "LITERAL_STRING", text)
    local struct1 = DataView.ArrayBuffer(8*7)
    local struct2 = DataView.ArrayBuffer(8*5)
    struct1:SetInt32(8*0,duration)
    struct2:SetInt64(8*1,bigInt(string1))
    struct2:SetInt64(8*2,bigInt(string2))

    Citizen.InvokeNative(0xD05590C1AB38F068,struct1:Buffer(),struct2:Buffer(),0,1)
end

function bigInt(text)
    local string1 =  DataView.ArrayBuffer(16)
    string1:SetInt64(0,text)
    return string1:GetInt64(0)
end

exports('getZoneData', function()
	local zoneTexture = nil
	local playerCoords = GetEntityCoords(cache.ped)
	local zone = 0
	--zoneTexture = GetSpecialLandmarkName(GetIndex(playerCoords));
	if zoneTexture == nil or zoneTexture == "" then
		--print
		if zone == 0 then
			zone = GetMapZoneAtCoords(playerCoords, 12)
		end
		--town
		if zone == 0 then
			zone = GetMapZoneAtCoords(playerCoords, 1)
		end
		--writen
		if zone == 0 then
			zone = GetMapZoneAtCoords(playerCoords, 13)
		end
		--unk or water
		if zone == 0 then
			local tempUnk = GetMapZoneAtCoords(playerCoords, 11)
			local tempWaterzone = GetWaterMapZoneAtCoords(playerCoords)
			if tempUnk ~= 0 and tempUnk ~= tempWaterzone then
				zone = tempUnk
			else
				zone = tempWaterzone
			end
		end
		
		if zone ~= 0 then
			zoneTexture = getZoneData(zone)
		end
		
		if zoneTexture == nil or zoneTexture == "" then
			--district
			zone = GetMapZoneAtCoords(playerCoords, 10)
			--state
			if zone == 0 then
				zone = GetMapZoneAtCoords(playerCoords, 0)
			end
			
			if zone ~= 0 then
				zoneTexture = getZoneData(zone)
			end
		end
	end
	
	return zone
end)

AddEventHandler('onResourceStart', function(resource)
	if resource == GetCurrentResourceName() then
		if not playerSpawn then
			TriggerEvent('RSGCore:Client:OnPlayerLoaded')
		end
	end
end)

AddEventHandler('RSGCore:Client:OnPlayerLoaded', function()	
	Wait(1000)
	playerSpawn = true
	StartScript()
	StartHandingScript()
end)

RegisterNetEvent('RSGCore:Client:OnPlayerUnload')
AddEventHandler('RSGCore:Client:OnPlayerUnload', function()
    playerSpawn = false
	preTown = nil
	preZoneTexture = nil
end)