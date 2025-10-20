local RSGCore = exports['rsg-core']:GetCoreObject()

-- Functions
local identifierUsed = GetConvar('es_identifierUsed', 'steam')
local foundResources = {}

-- generate horseid
local function GenerateHorseid()
    local UniqueFound = false
    local horseid = nil
    while not UniqueFound do
        horseid = tostring(RSGCore.Shared.RandomStr(3) .. RSGCore.Shared.RandomInt(3)):upper()
        local result = MySQL.prepare.await('SELECT COUNT(*) as count FROM player_horses WHERE horseid = ?', { horseid })
        if result == 0 then
            UniqueFound = true
        end
    end
    return horseid
end
-- Functions

-- local function GiveStarterItems(source)
--     local Player = RSGCore.Functions.GetPlayer(source)
    
--     -- Ensure the player is valid
--     if Player then
--         -- Add starter item directly using ox_inventory export
--         exports.ox_inventory:AddItem(source, 'bread', 1)

--     else
--         print("Player not found for source: " .. tostring(source))
--     end
-- end

-- give starter items
local function GiveStarterItems(source)
    local Player = RSGCore.Functions.GetPlayer(source)
    for k, v in pairs(RSGCore.Shared.StarterItems) do
        Player.Functions.AddItem(v.item, v.amount)
    end
    if Config.StarterHorse then
        local horseid = GenerateHorseid()
        local horsesex = {'male', 'female'}
        local randomSex = math.random(1, #horsesex)
        local randomHorseSex = horsesex[randomSex]
        MySQL.insert('INSERT INTO player_horses(stable, citizenid, horseid, name, horse, gender, active, born) VALUES(@stable, @citizenid, @horseid, @name, @horse, @gender, @active, @born)', {
            ['@stable'] = Config.StarterHorseStable,
            ['@citizenid'] = Player.PlayerData.citizenid,
            ['@horseid'] = horseid,
            ['@name'] = Config.StarterHorseName,
            ['@horse'] = Config.StarterHorseModel,
            ['@gender'] = randomHorseSex,
            ['@active'] = true,
            ['@born'] = os.time()
        })
    end
end




RegisterNetEvent('rsg-multicharacter:server:disconnect', function(source)
    DropPlayer(source, "You have disconnected from RSG RedM")
end)

RegisterNetEvent('rsg-multicharacter:server:loadUserData', function(cData, skindata)
    local src = source
    if RSGCore.Player.Login(src, cData.citizenid) then
        print('^2[rsg-core]^7 '..GetPlayerName(src)..' (Citizen ID: '..cData.citizenid..') has succesfully loaded!')
        RSGCore.Commands.Refresh(src)
        TriggerClientEvent("rsg-multicharacter:client:closeNUI", src)
        if not skindata then
            TriggerClientEvent('rsg-spawn:client:setupSpawnUI', src, cData, false)
        else
            TriggerClientEvent('rsg-appearance:client:OpenCreator', src, false, true)
        end
        TriggerEvent('rsg-log:server:CreateLog', 'joinleave', 'Player Joined Server', 'green', '**' .. GetPlayerName(src) .. '** joined the server..')
    end
end)

RegisterNetEvent('rsg-multicharacter:server:createCharacter', function(data)
    local newData = {}
    local src = source
    newData.cid = data.cid
    newData.charinfo = data
    if RSGCore.Player.Login(src, false, newData) then
        RSGCore.ShowSuccess(GetCurrentResourceName(), GetPlayerName(src)..' has succesfully loaded!')
        RSGCore.Commands.Refresh(src)
        Wait(25000) 
        GiveStarterItems(src)
    end
end)

-- RegisterNetEvent('rsg-multicharacter:server:deleteCharacter', function(citizenid)
--     MySQL.update('DELETE FROM playerskins WHERE citizenid = ?', {citizenid})
--     RSGCore.Player.DeleteCharacter(source, citizenid)
-- end)

RegisterNetEvent('rsg-multicharacter:server:deleteCharacter', function(citizenid)
    local license = RSGCore.Functions.GetIdentifier(src, 'license')
    local result = MySQL.scalar.await('SELECT license FROM players where citizenid = ?', { citizenid })

    -- Check to make sure the license matches to the character that is being deleted
    if license == result then
        -- Delete character's skin from database
        MySQL.update('DELETE FROM playerskins WHERE citizenid = ?', {citizenid})
    
        -- Add logging before deleting the character
        local src = source
        local Player = RSGCore.Functions.GetPlayer(src)
    
        -- Log the character deletion
        TriggerEvent('rsg-log:server:CreateLog', 'characters', 'Character Deleted', 'red', string.format('%s (%s) deleted character with citizenid: %s', GetPlayerName(src), src, citizenid))
    
        -- Delete the character
        RSGCore.Player.DeleteCharacter(src, citizenid)
    else
        DropPlayer(source, 'You have been kicked for explotation. Trying to delete a character that does not belong to you!')
        -- Log that someone tried to delete a character that wasn't their character
        TriggerEvent('rsg-log:server:CreateLog', 'characters', 'Character Deletion Attempt', 'red', string.format('%s (%s) attempted to delete character with citizenid: %s', license, src, citizenid))
    end
end)

-- Callbacks

RSGCore.Functions.CreateCallback("rsg-multicharacter:server:setupCharacters", function(source, cb)
    local license = RSGCore.Functions.GetIdentifier(source, 'license')
    local plyChars = {}
    MySQL.Async.fetchAll('SELECT * FROM players WHERE license = @license', {['@license'] = license}, function(result)
        for i = 1, (#result), 1 do
            result[i].charinfo = json.decode(result[i].charinfo)
            result[i].money = json.decode(result[i].money)
            result[i].job = json.decode(result[i].job)
            plyChars[#plyChars+1] = result[i]
        end
        cb(plyChars)
    end)
end)

RSGCore.Functions.CreateCallback("rsg-multicharacter:server:GetNumberOfCharacters", function(source, cb)
    local license = RSGCore.Functions.GetIdentifier(source, 'license')
    local numOfChars = 0
    if next(Config.PlayersNumberOfCharacters) then
        for i, v in pairs(Config.PlayersNumberOfCharacters) do
            if v.license == license then
                numOfChars = v.numberOfChars
                break
            else
                numOfChars = Config.DefaultNumberOfCharacters
            end
        end
    else
        numOfChars = Config.DefaultNumberOfCharacters
    end
    cb(numOfChars)
end)

RSGCore.Functions.CreateCallback("rsg-multicharacter:server:getAppearance", function(source, cb, citizenid)
    MySQL.Async.fetchAll('SELECT * FROM playerskins WHERE citizenid = ?', { citizenid}, function(result)
        if result ~= nil and #result > 0 then
            local skinData = json.decode(result[1].skin)
            local clothesData = json.decode(result[1].clothes)
            result[1].skin = skinData
            result[1].clothes = clothesData
            cb(result[1])
        else
            cb(nil)
        end
    end)
end)

-- RSGCore.Commands.Add("logout", "Logout of Character (Admin Only)", {}, false, function(source)
--     RSGCore.Player.Logout(source)
--     TriggerClientEvent('rsg-multicharacter:client:chooseChar', source)
-- end, 'admin')

RSGCore.Commands.Add("closeNUI", "Close Multi NUI", {}, false, function(source)
    TriggerClientEvent('rsg-multicharacter:client:closeNUI', source)
end, 'user')
