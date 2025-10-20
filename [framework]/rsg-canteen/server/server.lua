local RSGCore = exports['rsg-core']:GetCoreObject()

-----------------------------------------------------------------------
-- version checker
-----------------------------------------------------------------------
local function versionCheckPrint(_type, log)
    local color = _type == 'success' and '^2' or '^1'

    print(('^5['..GetCurrentResourceName()..']%s %s^7'):format(color, log))
end

local function CheckVersion()
    PerformHttpRequest('https://raw.githubusercontent.com/Rexshack-RedM/rsg-canteen/main/version.txt', function(err, text, headers)
        local currentVersion = GetResourceMetadata(GetCurrentResourceName(), 'version')

        if not text then 
            versionCheckPrint('error', 'Currently unable to run a version check.')
            return 
        end

        --versionCheckPrint('success', ('Current Version: %s'):format(currentVersion))
        --versionCheckPrint('success', ('Latest Version: %s'):format(text))
        
        if text == currentVersion then
            versionCheckPrint('success', 'You are running the latest version.')
        else
            versionCheckPrint('error', ('You are currently running an outdated version, please update to version %s'):format(text))
        end
    end)
end

-----------------------------------------------------------------------

-- use canteen 100
RSGCore.Functions.CreateUseableItem("canteen100", function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    TriggerClientEvent('rsg-canteen:client:drink', src, Config.DrinkAmount)
    Player.Functions.RemoveItem('canteen100', 1)
    Player.Functions.AddItem('canteen75', 1)
end)

-- use canteen 75
RSGCore.Functions.CreateUseableItem("canteen75", function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    TriggerClientEvent('rsg-canteen:client:drink', src, Config.DrinkAmount)
    Player.Functions.RemoveItem('canteen75', 1)
    Player.Functions.AddItem('canteen50', 1)
end)

-- use canteen 50
RSGCore.Functions.CreateUseableItem("canteen50", function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    TriggerClientEvent('rsg-canteen:client:drink', src, Config.DrinkAmount)
    Player.Functions.RemoveItem('canteen50', 1)
    Player.Functions.AddItem('canteen25', 1)
end)

-- use canteen 25
RSGCore.Functions.CreateUseableItem("canteen25", function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    TriggerClientEvent('rsg-canteen:client:drink', src, Config.DrinkAmount)
    Player.Functions.RemoveItem('canteen25', 1)
    Player.Functions.AddItem('canteen0', 1)
end)

-- use canteen 0 - error or fillup
RSGCore.Functions.CreateUseableItem("canteen0", function(source, item)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    TriggerClientEvent('rsg-canteen:client:fillupcanteen', src)
end)

-- remove empty give full canteen
RegisterServerEvent('rsg-canteen:server:givefullcanteen')
AddEventHandler('rsg-canteen:server:givefullcanteen', function()
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    Player.Functions.RemoveItem('canteen0', 1)
    TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items['canteen0'], "remove")
    Player.Functions.AddItem('canteendirty', 1)
    TriggerClientEvent("inventory:client:ItemBox", src, RSGCore.Shared.Items['canteendirty'], "add")
end)

--------------------------------------------------------------------------------------------------
-- start version check
--------------------------------------------------------------------------------------------------
CheckVersion()
