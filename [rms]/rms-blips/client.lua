local initBlips = {}

Citizen.CreateThread(
	function()
		for _, data in pairs(BlipData.blips) do
			local blipId = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, data.x, data.y, data.z)
			SetBlipSprite(blipId, data.sprite, 1);
			if data.color then
				Citizen.InvokeNative(0x662D364ABF16DE2F, blipId, GetHashKey(data.color));
			else 
				Citizen.InvokeNative(0x662D364ABF16DE2F, blipId, GetHashKey(Config.colors.WHITE));
			end
			local varString = CreateVarString(10, 'LITERAL_STRING', data.name);
			Citizen.InvokeNative(0x9CB1A1623062F402, blipId, varString)
			table.insert(initBlips, blipId)
		end
	end
)

function TeleportAway(location)
	local playerPed = PlayerPedId()
	DoScreenFadeOut(2000)
	Wait(2000)

	SetEntityCoords(playerPed, location.x, location.y, location.z + 0.2, 1, 0, 0, 0)
	FreezeEntityPosition(playerPed, true)
	Wait(4000)
	DoScreenFadeIn(600)
	FreezeEntityPosition(playerPed, false)
end

Citizen.CreateThread(function()
    exports.ox_target:addBoxZone({
        name = 'safe_blip',
        coords = vec3(-2778.03, -3044.28, -8.5),
        size = vec3(2.0, 2.0, 2.0),
        debug = false,
        distance = 2.0,
        options = {
            {
                name = 'teleport_saint_denis',
                icon = 'fa-solid fa-map-marker-alt',
                label = 'Go to Saint Denis',
                onSelect = function()
                    local std = vec3(2715.82, -1432.82, 46.05)
                    TeleportAway(std)
                end,
            },
            {
                name = 'teleport_blackwater',
                icon = 'fa-solid fa-map-marker-alt',
                label = 'Go to Blackwater',
                onSelect = function()
                    local bw = vec3(-798.74, -1205.76, 44.14)
                    TeleportAway(bw)
                end,
            },
            {
                name = 'teleport_valentine',
                icon = 'fa-solid fa-map-marker-alt',
                label = 'Go to Valentine',
                onSelect = function()
                    local valen = vec3(-170.34, 625.64, 113.98)
                    TeleportAway(valen)
                end,
            },
            {
                name = 'teleport_armadillo',
                icon = 'fa-solid fa-map-marker-alt',
                label = 'Go to Armadillo',
                onSelect = function()
                    local arma = vec3(-3723.36, -2607.40, -12.97)
                    TeleportAway(arma)
                end,
            },
        }
    })
end)


AddEventHandler(
	"onResourceStop",
	function(resourceName)
		if resourceName == GetCurrentResourceName() then
			for _, blip in pairs(initBlips) do
				RemoveBlip(blip)
			end
		end
	end
)