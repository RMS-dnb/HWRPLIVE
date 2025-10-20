- RSG-Core/client/loops.lua (Delete Code or Close)
```lua
CreateThread(function()
    while true do
        if LocalPlayer.state.isLoggedIn then
            if (RSGCore.PlayerData.metadata['hunger'] <= 0 or RSGCore.PlayerData.metadata['thirst'] <= 0) and not RSGCore.PlayerData.metadata['isdead'] then
                local ped = PlayerPedId()
                local currentHealth = GetEntityHealth(ped)
                local decreaseThreshold = math.random(5, 10)
                SetEntityHealth(ped, currentHealth - decreaseThreshold)
            end
        end
        Wait(RSGCore.Config.StatusInterval)
    end
end)
```

### change code rsg-core/server/events.lua
```lua
RegisterNetEvent('RSGCore:Server:SetMetaData', function(meta, data)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    if not Player then return end
    if meta == 'hunger' or meta == 'thirst' or meta == 'cleanliness' then
        if data > 100 then
            data = 100
        end
    end
    Player.Functions.SetMetaData(meta, data)
    TriggerClientEvent('fx-hud:client:UpdateNeeds', src, Player.PlayerData.metadata['hunger'], Player.PlayerData.metadata['thirst'])
end)

```
- RSG-Core/server/player.lua Change 
```lua
function self.Functions.AddMoney(moneytype, amount, reason, showhud)
        reason = reason or "unknown"
        if showhud == nil then showhud = true end
        moneytype = moneytype:lower()
        amount = tonumber(amount)
        if amount < 0 then
            return
        end
        if not self.PlayerData.money[moneytype] then
            return false
        end
        self.PlayerData.money[moneytype] = self.PlayerData.money[moneytype] + amount

        if not self.Offline then
            self.Functions.UpdatePlayerData()
            if amount > 100000 then
                TriggerEvent(
                    "rsg-log:server:CreateLog",
                    "playermoney",
                    "AddMoney",
                    "lightgreen",
                    "**"
                        .. GetPlayerName(self.PlayerData.source)
                        .. " (citizenid: "
                        .. self.PlayerData.citizenid
                        .. " | id: "
                        .. self.PlayerData.source
                        .. ")** $"
                        .. amount
                        .. " ("
                        .. moneytype
                        .. ") added, new "
                        .. moneytype
                        .. " balance: "
                        .. self.PlayerData.money[moneytype]
                        .. " reason: "
                        .. reason,
                    true
                )
            else
                TriggerEvent(
                    "rsg-log:server:CreateLog",
                    "playermoney",
                    "AddMoney",
                    "lightgreen",
                    "**"
                        .. GetPlayerName(self.PlayerData.source)
                        .. " (citizenid: "
                        .. self.PlayerData.citizenid
                        .. " | id: "
                        .. self.PlayerData.source
                        .. ")** $"
                        .. amount
                        .. " ("
                        .. moneytype
                        .. ") added, new "
                        .. moneytype
                        .. " balance: "
                        .. self.PlayerData.money[moneytype]
                        .. " reason: "
                        .. reason
                )
            end
            if showhud then TriggerClientEvent("hud:client:OnMoneyChange", self.PlayerData.source, moneytype, amount, false) end
            TriggerClientEvent("RSGCore:Client:OnMoneyChange", self.PlayerData.source, moneytype, amount, "add", reason)
            TriggerEvent("RSGCore:Server:OnMoneyChange", self.PlayerData.source, moneytype, amount, "add", reason)

            TriggerClientEvent('vorp:updateUi',self.PlayerData.source,json.encode({
                moneyquanty = self.PlayerData.money["cash"],
                goldquanty = self.PlayerData.money["bank"]
            }))
        end

        return true
    end

    function self.Functions.RemoveMoney(moneytype, amount, reason, showhud)
        reason = reason or "unknown"
        if showhud == nil then showhud = true end
        moneytype = moneytype:lower()
        amount = tonumber(amount)
        if amount < 0 then
            return
        end
        if not self.PlayerData.money[moneytype] then
            return false
        end
        for _, mtype in pairs(RSGCore.Config.Money.DontAllowMinus) do
            if mtype == moneytype then
                if (self.PlayerData.money[moneytype] - amount) < 0 then
                    return false
                end
            end
        end
        self.PlayerData.money[moneytype] = self.PlayerData.money[moneytype] - amount

        if not self.Offline then
            self.Functions.UpdatePlayerData()
            if amount > 100000 then
                TriggerEvent(
                    "rsg-log:server:CreateLog",
                    "playermoney",
                    "RemoveMoney",
                    "red",
                    "**"
                        .. GetPlayerName(self.PlayerData.source)
                        .. " (citizenid: "
                        .. self.PlayerData.citizenid
                        .. " | id: "
                        .. self.PlayerData.source
                        .. ")** $"
                        .. amount
                        .. " ("
                        .. moneytype
                        .. ") removed, new "
                        .. moneytype
                        .. " balance: "
                        .. self.PlayerData.money[moneytype]
                        .. " reason: "
                        .. reason,
                    true
                )
            else
                TriggerEvent(
                    "rsg-log:server:CreateLog",
                    "playermoney",
                    "RemoveMoney",
                    "red",
                    "**"
                        .. GetPlayerName(self.PlayerData.source)
                        .. " (citizenid: "
                        .. self.PlayerData.citizenid
                        .. " | id: "
                        .. self.PlayerData.source
                        .. ")** $"
                        .. amount
                        .. " ("
                        .. moneytype
                        .. ") removed, new "
                        .. moneytype
                        .. " balance: "
                        .. self.PlayerData.money[moneytype]
                        .. " reason: "
                        .. reason
                )
            end
            if showhud then TriggerClientEvent("hud:client:OnMoneyChange", self.PlayerData.source, moneytype, amount, true) end
            TriggerClientEvent("RSGCore:Client:OnMoneyChange", self.PlayerData.source, moneytype, amount, "remove", reason)
            TriggerEvent("RSGCore:Server:OnMoneyChange", self.PlayerData.source, moneytype, amount, "remove", reason)
            TriggerClientEvent('vorp:updateUi',self.PlayerData.source,json.encode({
                moneyquanty = self.PlayerData.money["cash"],
                goldquanty = self.PlayerData.money["bank"]
            }))
        end

        return true
    end

    function self.Functions.SetMoney(moneytype, amount, reason)
        reason = reason or "unknown"
        moneytype = moneytype:lower()
        amount = tonumber(amount)
        if amount < 0 then
            return false
        end
        if not self.PlayerData.money[moneytype] then
            return false
        end
        local difference = amount - self.PlayerData.money[moneytype]
        self.PlayerData.money[moneytype] = amount

        if not self.Offline then
            self.Functions.UpdatePlayerData()
            TriggerEvent(
                "rsg-log:server:CreateLog",
                "playermoney",
                "SetMoney",
                "green",
                "**"
                    .. GetPlayerName(self.PlayerData.source)
                    .. " (citizenid: "
                    .. self.PlayerData.citizenid
                    .. " | id: "
                    .. self.PlayerData.source
                    .. ")** $"
                    .. amount
                    .. " ("
                    .. moneytype
                    .. ") set, new "
                    .. moneytype
                    .. " balance: "
                    .. self.PlayerData.money[moneytype]
                    .. " reason: "
                    .. reason
            )
            TriggerClientEvent(
                "hud:client:OnMoneyChange",
                self.PlayerData.source,
                moneytype,
                math.abs(difference),
                difference < 0
            )
            TriggerClientEvent("RSGCore:Client:OnMoneyChange", self.PlayerData.source, moneytype, amount, "set", reason)
            TriggerEvent("RSGCore:Server:OnMoneyChange", self.PlayerData.source, moneytype, amount, "set", reason)
            TriggerClientEvent('vorp:updateUi',self.PlayerData.source,json.encode({
                moneyquanty = self.PlayerData.money["cash"],
                goldquanty = self.PlayerData.money["bank"]
            }))
        end

        return true
    end
```