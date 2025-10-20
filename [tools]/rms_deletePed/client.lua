 Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(5000)
        local peds = {}
        local it, ped = FindFirstPed()
        if ped then table.insert(peds, ped) end
        while true do
            local ok, ped = FindNextPed(it)
            if ok and ped then 
                table.insert(peds, ped) 
            else
                EndFindPed(it)
                break
            end
        end
            for k, _ped in ipairs(peds) do
                for i, v in ipairs(Config.confrem_ped) do 
                if GetHashKey(Config.confrem_ped[i][1]) == GetEntityModel(_ped) then
                    local coords_ped = GetEntityCoords(_ped)
                    if (GetDistanceBetweenCoords(Config.coord_del['CD_1'].x, Config.coord_del['CD_1'].y, Config.coord_del['CD_1'].z, coords_ped.x, coords_ped.y, coords_ped.z, true) <= Config.coord_del['CDel']) then
                        DeleteEntity(_ped)
                    end
                end 
            end
        end
    end
end)

 
Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(5000)
        local peds = {}
        local it, ped = FindFirstPed()
        if ped then table.insert(peds, ped) end
        while true do
            local ok, ped = FindNextPed(it)
            if ok and ped then 
                table.insert(peds, ped) 
            else
                EndFindPed(it)
                break
            end
        end
            for k, _ped in ipairs(peds) do
                for i, v in ipairs(Config.confrem_ped) do 
                if GetHashKey(Config.confrem_ped[i][1]) == GetEntityModel(_ped) then
                    local coords_ped = GetEntityCoords(_ped)
                    if (GetDistanceBetweenCoords(Config.coord_del['CD_2'].x, Config.coord_del['CD_2'].y, Config.coord_del['CD_2'].z, coords_ped.x, coords_ped.y, coords_ped.z, true) <= Config.coord_del['CDel2']) then
                        DeleteEntity(_ped)
                    end
                end 
            end
        end
    end
end)


Citizen.CreateThread(function()
    while true do 
        Citizen.Wait(5000)
        local peds = {}
        local it, ped = FindFirstPed()
        if ped then table.insert(peds, ped) end
        while true do
            local ok, ped = FindNextPed(it)
            if ok and ped then 
                table.insert(peds, ped) 
            else
                EndFindPed(it)
                break
            end
        end
            for k, _ped in ipairs(peds) do
                for i, v in ipairs(Config.confrem_ped) do 
                if GetHashKey(Config.confrem_ped[i][1]) == GetEntityModel(_ped) then
                    local coords_ped = GetEntityCoords(_ped)
                    if (GetDistanceBetweenCoords(Config.coord_del['CD_3'].x, Config.coord_del['CD_3'].y, Config.coord_del['CD_3'].z, coords_ped.x, coords_ped.y, coords_ped.z, true) <= Config.coord_del['CDel3']) then
                        DeleteEntity(_ped)
                    end
                end 
            end
        end
    end
end)
