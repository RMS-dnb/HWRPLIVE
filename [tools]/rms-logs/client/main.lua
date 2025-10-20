local RSGCore = exports[Config.Core]:GetCoreObject()

RegisterNetEvent("RSGCore:Client:OnPlayerLoaded", function()
    local PlayerData = RSGCore.Functions.GetPlayerData()
    local PlayerJob = PlayerData.job
    local PlayerJobName = PlayerJob.name
    local PlayerDuty = PlayerJob.onduty
    TriggerServerEvent("kael-dutylog:server:userjoined", PlayerJobName, PlayerDuty)
end)

RegisterNetEvent("RSGCore:Client:SetDuty", function(Duty)
    local PlayerData = RSGCore.Functions.GetPlayerData()
    local PlayerJob = PlayerData.job
    local PlayerJobName = PlayerJob.name
    if Duty then
        TriggerServerEvent("kael-dutylog:server:onDuty", PlayerJobName, Duty)
    else
        TriggerServerEvent("kael-dutylog:server:offDuty", PlayerJobName, Duty)
    end
end)

AddEventHandler('onResourceStart', function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return false end
    local PlayerData = RSGCore.Functions.GetPlayerData()
    local PlayerJob = PlayerData.job
    local PlayerJobName = PlayerJob.name
    local PlayerDuty = PlayerJob.onduty
    TriggerServerEvent("kael-dutylog:server:userjoined", PlayerJobName, PlayerDuty)
end)