local RSGCore = exports['rsg-core']:GetCoreObject()
local spawnedPeds = {}
lib.locale()

CreateThread(function()
    for k,v in pairs(Config.WeaponsmithLocations) do
        if not Config.EnableTarget then
            exports['rsg-core']:createPrompt(v.weaponsmithid, v.coords, RSGCore.Shared.Keybinds[Config.Keybind], locale('cl_lang_47'), {
                type = 'client',
                event = 'rex-weaponsmith:client:openweaponsmith',
                args = {v.weaponsmithid, v.jobaccess, v.name}
            })
        end
        if v.showblip == true then
            local PlayerWeaponsmithBlip = BlipAddForCoords(1664425300, v.coords)
            SetBlipSprite(PlayerWeaponsmithBlip, joaat(v.blipsprite), true)
            SetBlipScale(PlayerWeaponsmithBlip, v.blipscale)
            SetBlipName(PlayerWeaponsmithBlip, v.blipname)
        end
    end
end)

CreateThread(function()
    for k,v in pairs(Config.WeaponsmithLocations) do
        local coords = v.npccoords
        local newpoint = lib.points.new({
            coords = coords,
            distance = Config.DistanceSpawn,
            weaponsmithid = v.weaponsmithid,
            jobaccess = v.jobaccess,
            name = v.name,
            targetId = nil
        })
        
        newpoint.onEnter = function(self)
            if not self.targetId and Config.EnableTarget then
                -- Create target zone at the location instead of using a ped
                local targetOptions = {
                    {
                        name = 'location_weaponsmith_' .. k,
                        icon = 'far fa-eye',
                        label = locale('cl_lang_47'),
                        onSelect = function()
                            TriggerEvent('rex-weaponsmith:client:openweaponsmith', self.weaponsmithid, self.jobaccess, self.name)
                        end,
                        distance = 2.0
                    }
                }
                
                -- Add location-based target
                self.targetId = exports.ox_target:addBoxZone({
                    coords = vector3(self.coords.x, self.coords.y, self.coords.z),
                    size = vec3(2.0, 3.0, 2.0),
                    rotation = 0,
                    options = targetOptions,
                    drawSprite = false,  -- This disables the blue dot
                    debug = false
                })
            end
        end
        
        newpoint.onExit = function(self)
            if self.targetId then
                exports.ox_target:removeZone(self.targetId)
                self.targetId = nil
            end
        end
        
        spawnedPeds[k] = newpoint
    end
end)

-- cleanup
AddEventHandler("onResourceStop", function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    for k, v in pairs(spawnedPeds) do
        if v.targetId then
            exports.ox_target:removeZone(v.targetId)
        end
        spawnedPeds[k] = nil
    end
end)