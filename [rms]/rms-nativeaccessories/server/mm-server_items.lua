-- local RSGCore = exports['rsg-core']:GetCoreObject()

-- Citizen.CreateThread(function()
--     Citizen.Wait(2000)
--     if Config.UsableItems then
--         for k, item in pairs(Config.MultiItemSetList) do
--             RSGCore.Functions.CreateUseableItem(k, function(source, item)
--                 TriggerClientEvent('mm_native_headbands:AttachHeadbandTypeOnPlayerPed', source, item.name)
--                 --RSGCore.Functions.CloseMenu('inventory')
--             end)
--         end
--     end
-- end)

local RSGCore = exports['rsg-core']:GetCoreObject()



Citizen.CreateThread(function()
    Citizen.Wait(2000)
    if Config.UsableItems then
        for k, item in pairs(Config.MultiItemSetList) do
            RSGCore.Functions.CreateUseableItem(k, function(source, item)
                local Player = RSGCore.Functions.GetPlayer(source)
                
                -- Define allowed jobs (you can add more if needed)
                local allowedJobs = {"native", "tribalmember", "indigenous"} -- Add other job names as needed
                
                -- Check if player exists and has an allowed job
                local hasAllowedJob = false
                if Player and Player.PlayerData.job then
                    for _, jobName in pairs(allowedJobs) do
                        if Player.PlayerData.job.name == jobName then
                            hasAllowedJob = true
                            break
                        end
                    end
                end
                
                if hasAllowedJob then
                    TriggerClientEvent('mm_native_headbands:AttachHeadbandTypeOnPlayerPed', source, item.name)
                    --RSGCore.Functions.CloseMenu('inventory')
                else
                    -- Send notification to player that they don't have the right job
                    TriggerClientEvent("bln_notify:send", source, {
                        title = "~red~Access Denied~e~",
                        description = "You must be a Native to use this item!",
                        icon = "warning",
                        placement = "middle-right"
                    }, "ERROR")
                end
            end)
        end
    end
end)