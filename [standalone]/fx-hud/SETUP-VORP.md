### vorp_core/config/config.lua
# change code
```lua
    HideUi                = true,      -- Shows or hides the overall UI.
    HideGold              = true,      -- Disables the Gold UI for all players.
    HideMoney             = true,      -- Disables the Money UI for all players.
    HideLevel             = true,      -- Disables the Level UI for all players.
    HideID                = true,      -- Disables the ID UI for all players.
    HideTokens            = true,      -- Disables the Token UI for all players.
    HidePVP               = true,      -- Disables the PVP UI for all players.
```
### vorp_core/config/commands.lua
# change code
# heal command replace
```lua
    heal = {
        webhook = "",
        custom = T.heal.custom,
        title = T.heal.title,
        commandName = "heal",
        label = T.heal.label,
        suggestion = {
            { name = T.heal.name, help = T.heal.help }
        },
        userCheck = true,
        groupAllowed = { "admin" },
        aceAllowed = 'vorpcore.healplayer.Command',
        callFunction = function(data)
            -- in here you can add your metabolism events
            TriggerClientEvent("fx-hud:client:ForceHeal", tonumber(data.args[1]))
            HealPlayers(data)
        end
    },
```

# revive command replace
```lua
    revive = {
        webhook = "",
        custom = T.revive.custom,
        title = T.revive.title,
        commandName = "revive",
        label = T.revive.label,
        suggestion = {
            { name = T.revive.name, help = T.revive.help }
        },
        userCheck = true,
        groupAllowed = { "admin" },
        aceAllowed = 'vorpcore.reviveplayer.Command',
        callFunction = function(data)
            RevivePlayer(data)
            TriggerClientEvent("fx-hud:client:ForceHeal", tonumber(data.args[1]))
        end
    },
```
