local RSGCore = exports['rsg-core']:GetCoreObject()
lib.locale()


lib.callback.register('y0-treasure:server:CheckTreasure', function(src, data)
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return false end

    local meta = Player.PlayerData.metadata
    print(json.encode(meta))
    local treasures = meta.treasure or {}

    local treasure = treasures[data.name]

    if treasure and treasure.done then
        return false
    else
        return true
    end
end)


RegisterNetEvent('y0-treasure:server:StartTreasure', function(data)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end

    local meta = Player.PlayerData.metadata or {}
    local treasures = meta.treasure or {}

    treasures[data.name] = {
        name = data.name,
        done = false,
        started = os.time()
    }

    Player.Functions.SetMetaData('treasure', treasures)
end)

RegisterNetEvent('y0-treasure:server:CompleteTreasure', function(data)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end

    local meta = Player.PlayerData.metadata or {}
    local treasures = meta.treasure or {}

    local treasureData = treasures[data.name]
    if not treasureData then return end

    Player.Functions.AddItem(data.reward, data.amount)

    treasureData.done = true
    treasures[data.name] = treasureData

    Player.Functions.SetMetaData('treasure', treasures)
end)

