local RSGCore = exports['rsg-core']:GetCoreObject()--------------------------
-- save inventory items
--------------------------
RegisterNetEvent('rsg-prison:server:SaveJailItems', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    if not Player.PlayerData.metadata['jailitems'] or not next(Player.PlayerData.metadata['jailitems']) then
        Player.Functions.SetMetaData('jailitems', Player.PlayerData.items)
        
        Wait(2000)
        Player.Functions.ClearInventory()
        Wait(2000)
        Player.Functions.AddMoney('cash', 10)
    end
end)

--------------------------
-- give back inventory items
--------------------------
RegisterNetEvent('rsg-prison:server:GiveJailItems', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    Wait(1000)
    Player.Functions.ClearInventory()
    for _, v in pairs(Player.PlayerData.metadata['jailitems']) do
        Player.Functions.AddItem(v.name, v.amount, false, v.info)
    end
    Wait(1000)
    Player.Functions.SetMetaData('jailitems', {})
end)