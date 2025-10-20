local TEXTS = Config.Texts
local TEXTURES = Config.Textures
local notifSettings = {}
-----------------------------------------------------------------------------------------------------
local notifSettings = {
	[1] = {
		TEXTS.CampTotem, TEXTS.TotemClose, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[2] = {
		TEXTS.CampTotem, TEXTS.CantDo, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[3] = {
		TEXTS.CampTotem, TEXTS.NeedMoreSupply, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[4] = {
		TEXTS.CampTotem, TEXTS.NoData, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[5] = {
		TEXTS.CampManage, TEXTS.WithdrawS, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[6] = {
		TEXTS.CampManage, TEXTS.WithdrawF, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[7] = {
		TEXTS.CampManage, TEXTS.DepositS, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[8] = {
		TEXTS.CampManage, TEXTS.NoMoney, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[9] = {
		TEXTS.CampManage, TEXTS.SupplyAdded, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[10] = {
		TEXTS.CampManage, TEXTS.NoSupply, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[11] = {
		TEXTS.CampManage, TEXTS.NoSupplyAtAll, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[12] = {
		TEXTS.CampManage, TEXTS.KickS, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[13] = {
		TEXTS.CampManage, TEXTS.NoMember, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[14] = {
		TEXTS.CampManage, TEXTS.NoCampMoney, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[15] = {
		TEXTS.CampManage, TEXTS.PropRemoved, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[16] = {
		TEXTS.CampManage, TEXTS.LockerPurchased, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[17] = {
		TEXTS.CampManage, TEXTS.NoCampMoney, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[18] = {
		TEXTS.CampManage, TEXTS.LockerUpdated, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[19] = {
		TEXTS.CampManage, TEXTS.AlreadyCampMember, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[20] = {
		TEXTS.CampManage, TEXTS.AlreadyInvited, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[21] = {
		TEXTS.CampManage, TEXTS.InviteSent, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[22] = {
		TEXTS.CampManage, TEXTS.NotPossible, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[23] = {
		TEXTS.CampInvite, TEXTS.InviteCanceled, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[24] = {
		TEXTS.CampInvite, TEXTS.InviteCanceled2, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[25] = {
		TEXTS.CampManage, TEXTS.NotMember, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[26] = {
		TEXTS.CampManage, TEXTS.PropAdded, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[27] = {
		TEXTS.CampManage, TEXTS.AnotherCampMember, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[28] = {
		TEXTS.CampInvite, TEXTS.InviteAccepted, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[29] = {
		TEXTS.CampInvite, TEXTS.InviteAccepted2, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[30] = {
		TEXTS.CampManage, TEXTS.CampDisbanded, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[31] = {
		TEXTS.CampManage, TEXTS.NameChanged, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[32] = {
		TEXTS.CampManage, TEXTS.CampLimitReached, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[33] = {
		TEXTS.CampInvite, TEXTS.NewInvite, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[34] = {
		TEXTS.CampTotem, TEXTS.NotAtTown, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[35] = {
		TEXTS.CampLocker, TEXTS.NotOwner, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[36] = {
		TEXTS.CampLocker, TEXTS.LockChanged, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[37] = {
		TEXTS.CampLocker, TEXTS.LockerLocked, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[38] = {
		TEXTS.CampLocker, TEXTS.Owner, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[39] = {
		TEXTS.CampLocker, TEXTS.CantDo, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[40] = {
		TEXTS.CampLocker, TEXTS.LockerOpen, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[41] = {
		TEXTS.CampLocker, TEXTS.NoLockpick, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[42] = {
		TEXTS.CampLocker, TEXTS.LockpickFail, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[43] = {
		TEXTS.CampLocker, TEXTS.LockpickSuccess, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[44] = {
		TEXTS.CampLocker, TEXTS.WaitLockpick, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[45] = {
		TEXTS.CampInvite, TEXTS.NotYourself, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[46] = {
		TEXTS.CampInvite, TEXTS.NoMembers, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[47] = {
		TEXTS.CampManage, TEXTS.ButcherUpdated, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[48] = {
		TEXTS.CampManage, TEXTS.ButcherPurchased, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[49] = {
		TEXTS.CampManage, TEXTS.CantAddModel, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[50] = {
		TEXTS.CampManage, TEXTS.NotHoldingCarcass, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[51] = {
		TEXTS.CampManage, "", TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[52] = {
		TEXTS.CampManage, TEXTS.FullButcher, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[53] = {
		TEXTS.CampManage, TEXTS.PropLimit, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[54] = {
		TEXTS.CampManage, TEXTS.AlreadyHaveWagon, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[55] = {
		TEXTS.CampManage, TEXTS.PurchasedWagon, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[56] = {
		TEXTS.CampManage, TEXTS.NotEnoughMeat, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[57] = {
		TEXTS.CampManage, TEXTS.TooFarWagon, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[58] = {
		TEXTS.CampManage, TEXTS.DeliveryFinished, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[59] = {
		TEXTS.CampManage, TEXTS.FailedDelivery, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[60] = {
		TEXTS.CampManage, TEXTS.PeltTablePurchased, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[61] = {
		TEXTS.CampManage, TEXTS.PeltTableUpdated, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[62] = {
		TEXTS.CampManage, TEXTS.CantAddModel2, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[63] = {
		TEXTS.CampManage, TEXTS.SupplyTablePurchased, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[64] = {
		TEXTS.CampManage, TEXTS.SupplyTableUpdated, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[65] = {
		TEXTS.CampManage, TEXTS.OthersClose, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[66] = {
		TEXTS.CampManage, TEXTS.MaxMemberReached, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[67] = {
		TEXTS.CampManage, TEXTS.CampFull, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[68] = {
		TEXTS.CampManage, (TEXTS.NotEnoughPelt or "Not Enough Pelt"), TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[69] = {
		TEXTS.CampManage, TEXTS.NoPeltHand, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[70] = {
		TEXTS.CampManage, TEXTS.NoSupplyAtAll, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[71] = {
		TEXTS.CampManage, (TEXTS.NoVehicle or "No Delivery Vehicle purchased!"), TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[72] = {
		TEXTS.CampManage, (TEXTS.PlaceCloser or "Place Butcher/Pelt Table closer to Flag!"), TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[73] = {
		TEXTS.CampManage, (TEXTS.NoMoneyItem or "No money at Camp, or you dont have the items!"), TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[74] = {
		TEXTS.CampManage, (TEXTS.DeliveryPropAdded or "Delivery Vehicle Prop was added already!"), TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[75] = {
		TEXTS.CampManage, (TEXTS.NoPeltInv or "No pelt in your inventory!"), TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	[76] = {
		TEXTS.CampManage, (TEXTS.NoPeltDelivery or "No pelt for delivery!"), TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
	--[[
	[] = {
		TEXTS.TEXT, TEXTS.Saved, TEXTURES.alert[1], TEXTURES.alert[2], 3000,
	},
]]
}

-----------------------------------------------------------------------------------------------------
function CallCampNotif(id, extra)
	local _id = tonumber(id)
	local title = notifSettings[_id][1]
	local text = notifSettings[_id][2]
	local dict = notifSettings[_id][3]
	local texture = notifSettings[_id][4]
	local timer = notifSettings[_id][5]

------------------EXTRA CODE START------------------
	if extra ~= nil then 						 --|
		if extra.title ~= nil then 				 --|
			title = extra.title					 --|
		end									 	 --|
		if extra.text ~= nil then 				 --|
			text = extra.text					 --|
		end										 --|
		if extra.dict ~= nil then 				 --|
			dict = extra.dict					 --|
		end										 --|
		if extra.texture ~= nil then 			 --|
			texture = extra.texture				 --|
		end										 --|
		if extra.timer ~= nil then 				 --|
			timer = extra.timer					 --|
		end										 --|
	end											 --|
------------------EXTRA CODE END------------------
	TriggerEvent("Notification:ricx_camps", title, text, dict, texture, timer)--change this to a different notification logic if you want
end
-----------------------------------------------------------------------------------------------------
RegisterNetEvent("ricx_camps:call_notif", function(id, extra)
	local _id = tonumber(id)
	CallCampNotif(_id, extra)
end)
-----------------------------------------------------------------------------------------------------
RegisterNetEvent("ricx_camps:lockpick_minigame", function(camp_id)
	print("HERE COMES YOUR MINIGAME")

	local a = math.random(1,2)
    if a == 2 then 
        TriggerServerEvent("ricx_camps:locker_lockpick", camp_id, 1)
    else
        TriggerServerEvent("ricx_camps:locker_lockpick", camp_id, 2)
    end
--EXAMPLE PS-UI FIVEM https://github.com/Project-Sloth/ps-ui
--[[ 
	exports['psr-ui']:Scrambler(function(success)
        if success then
            TriggerServerEvent("ricx_camps:locker_lockpick", camp_id, 1)
            print("success")
        else
            TriggerServerEvent("ricx_camps:locker_lockpick", camp_id, 2)
            print("fail")
        end
    end, "numeric", 30, 0)

]]

	--if rand is 1 then it will be fail, if rand 2 then success
	--for success: TriggerServerEvent("ricx_camps:locker_lockpick", camp_id, 1)
	--for fail: TriggerServerEvent("ricx_camps:locker_lockpick", camp_id, 2)
	--TriggerServerEvent("ricx_camps:locker_lockpick", camp_id, rand)
end)

--------------------------------------------------------------------------------------------------------------------------------------------
RegisterNetEvent('Notification:ricx_camps_itemreward', function(text, dict, icon, text_color, duration)
	if not HasStreamedTextureDictLoaded(dict) then
        RequestStreamedTextureDict(dict, true) 
        while not HasStreamedTextureDictLoaded(dict) do
            Citizen.Wait(5)
        end
    end
    exports.ricx_camps.RightNot(0, text, dict, icon, text_color, duration)
    SetStreamedTextureDictAsNoLongerNeeded(dict)
end)
--------------------------------------------------------------------------------------------------------------------------------------------

local restrictedZones = {
    { name = "Valentine", coords = vector3(-277.5, 804.2, 119.4), radius = 550.0 },
    { name = "Saint Denis", coords = vector3(2609.76, -1260.79, 52.66), radius = 650.0 },
    { name = "Blackwater", coords = vector3(-752.0, -1268.0, 44.0), radius = 550.0 },
    { name = "Rhodes", coords = vector3(1235.0, -1295.0, 76.9), radius = 550.0 },
    { name = "Strawberry", coords = vector3(-1722.0, -414.0, 154.8), radius = 550.0 },
    { name = "Armadillo", coords = vector3(-3621.0, -2610.0, -14.1), radius = 550.0 },
    { name = "Tumbleweed", coords = vector3(-5526.0, -2937.0, -2.0), radius = 550.0 },
    { name = "Annesburg", coords = vector3(2940.0, 1345.0, 44.8), radius = 550.0 },
    { name = "Van Horn", coords = vector3(2985.0, 570.0, 44.6), radius = 550.0 },
	{ name = "Guarma", coords = vector3(1286.16, -6862.7, 43.26), radius = 150.0 },
    { name = "Lagras", coords = vector3(1998.0, -1643.0, 42.1), radius = 550.0 },
	{ name = "Emerald Ranch", coords = vector3(1423.21, 350.22, 88.87), radius = 550.0 }
}

RegisterNetEvent("ricx_camps:check_totem_zone", function()
    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)

    for _, zone in pairs(restrictedZones) do
        local dist = #(playerCoords - zone.coords)
        if dist < zone.radius then
            lib.notify({ type = 'error', description = 'You cannot place a camp in or near ' .. zone.name .. '.' })
            return
        end
    end

    -- Safe to place totem
    TriggerEvent("ricx_camps:place_totem")
end)
