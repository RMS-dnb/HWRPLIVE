function openCustomNotif(t1, t2, dict, txtr, timer)
	print('Custom notif active' .. t1, t2, dict, txtr, timer)
end

function openStashCustom(stashId,stashInfo)
	local slots = stashInfo.stash.slots
	local maxweight = stashInfo.stash.maxweight
	print('openStashOpenCustom',stashId,slots,maxweight)

end

function openSetupTarget(coords, id)
    if Config.Framework == "RSG" then
        exports['rsg-target']:AddCircleZone(
            "train_" .. id,
            vector3(coords.x, coords.y, coords.z), 
            1.5,
            {
                name = "train_" .. id, 
                debugPoly = false, 
            },
            {
                options = {
                    {
                        label = texts.prompt.openMenu, 
                        targeticon = "fa-solid fa-train", 
                        action = function()
                            openFirstMenu(id) 
                        end,
                    },
                },
                distance = 2.5,
            }
        )
    end
end

function openDeleteTarget(id)
	if Config.Framework == "RSG" then
		local name = "train_" .. id
		exports['rsg-target']:RemoveZone(name)
	end
end