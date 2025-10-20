local RSGCore = exports['rsg-core']:GetCoreObject()

------------------------------------------------
-- casino boat
------------------------------------------------
RequestImap(-614421509) -- boat shell
RequestImap(604920544)  -- upstairs interior
RequestImap(1382135686) -- main room interior
RequestImap(-1968130469) -- railings
RequestImap(-276259505) -- railings
------------------------------------------------

Citizen.CreateThread(function()
    local interior = GetInteriorAtCoords(3285.792, -1325.603, 43.08399)
    local isValid = IsValidInterior(interior)
    if isValid then
        if IsInteriorReady(interior) then
            if IsInteriorEntitySetActive(interior, "korrigan_props_default") then
                print("Riverboat Interior Already Active")
            else
                ActivateInteriorEntitySet(interior, "korrigan_props_poker")
                ActivateInteriorEntitySet(interior, "korrigan_props_default")
                print("Riverboat Interior Activated")
            end
        end
    end
end)


-- open all doors
Citizen.CreateThread(function()
    for k,v in pairs(Config.CasinoBoatDoors) do
        Citizen.InvokeNative(0xD99229FE93B46286,v,1,1,0,0,0,0)
        Citizen.InvokeNative(0x6BAB9442830C7F53,v,0)
    end
end)
