if BlackJackConfig.Framework == "custom" then -- DONT TOUCH THIS LINE!
    local RSGCore = exports['rsg-core']:GetCoreObject() -- Get RSGCore object

    AddEventHandler("tm_blackjack:custom:getCharacterFromId", function(source, cb) -- DONT TOUCH THIS LINE!
        local _source = source
        local Player = RSGCore.Functions.GetPlayer(_source) -- Get Player from RSGCore

        if Player then
            local user = {}

            -- NAME
            user.getName = function()
                local first = Player.PlayerData.charinfo.firstname or ""
                local last = Player.PlayerData.charinfo.lastname or ""
                return tostring(first .. " " .. last)
            end

            user.getFirstname = function()
                return tostring(Player.PlayerData.charinfo.firstname or "")
            end

            -- MONEY
            user.getMoney = function(currency)
                currency = currency or "cash" -- Default to cash
                return Player.Functions.GetMoney(currency) or 0
            end

            user.removeMoney = function(amount, currency)
                currency = currency or "cash"
                return Player.Functions.RemoveMoney(currency, amount or 0, "blackjack-loss")
            end

            user.addMoney = function(amount, currency)
                currency = currency or "cash"
                return Player.Functions.AddMoney(currency, amount or 0, "blackjack-win")
            end

            -- INVENTORY
            user.getItemAmount = function(name)
                if not name then return 0 end
                local item = Player.Functions.GetItemByName(name)
                return item and item.amount or 0
            end

            user.removeItem = function(name, amount)
                if not name or not amount then return false end
                Player.Functions.RemoveItem(name, amount)
                TriggerClientEvent('inventory:client:ItemBox', _source, RSGCore.Shared.Items[name], "remove")
                return true
            end

            user.addItem = function(name, amount)
                if not name or not amount then return false end
                Player.Functions.AddItem(name, amount)
                TriggerClientEvent('inventory:client:ItemBox', _source, RSGCore.Shared.Items[name], "add")
                return true
            end

            -- JOB (optional if needed later)
            user.setJob = function(job, grade)
                Player.Functions.SetJob(job, grade or 0)
            end

            print("[DEBUG] Blackjack user object ready for:", GetPlayerName(_source))
            cb(user)
        else
            print("[ERROR] No player found for source:", _source)
            cb(nil)
        end
    end)
end
