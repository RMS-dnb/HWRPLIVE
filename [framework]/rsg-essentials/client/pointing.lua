local RSGCore = exports['rsg-core']:GetCoreObject()
-- local pointing = false

-- CreateThread(function()
--     local keybind = RSGCore.Shared.Keybinds['L']
--     while true do
--         Wait(7)

--         if IsControlPressed(0, keybind) then
--             if not pointing then
--                 pointing = true
--                 RequestAnimDict('script_common@other@unapproved')
--                 while not HasAnimDictLoaded('script_common@other@unapproved') do
--                     Wait(100)
--                 end
--                 TaskPlayAnim(cache.ped, 'script_common@other@unapproved', 'loop_0', 1.0, -1.0, -1, 30, 0, true, 0, false, 0, false)
--             end
--             Wait(500)
--         else
--             if pointing then
--                 pointing = false
--                 ClearPedSecondaryTask(cache.ped)
--             end
--         end
--     end
-- end)

--Point by clicking L
Citizen.CreateThread(function() --POINTING SCRIPT
    while true do
        Wait(0)
        if (IsControlJustPressed(0,0x80F28E95))  then
            local ped = PlayerPedId()
            if ( DoesEntityExist( ped ) and not IsEntityDead( ped ) ) then
 
                RequestAnimDict( "ai_react@point@base" )
 
                while ( not HasAnimDictLoaded( "ai_react@point@base" ) ) do
                    Wait( 100 )
                end
 
                if IsEntityPlayingAnim(ped, "ai_react@point@base", "point_fwd", 3) then
                    ClearPedSecondaryTask(ped)
                else
                    TaskPlayAnim(ped, "ai_react@point@base", "point_fwd", 8.0, -8.0, 120000, 31, 0, true, 0, false, 0, false)
                end
            end
        end
    end
end)
