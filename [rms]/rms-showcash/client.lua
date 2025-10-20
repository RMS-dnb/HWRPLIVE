local RSGCore = exports['rsg-core']:GetCoreObject()
local nuiOpen = false
local lastType = nil
local closeTimer = nil

RegisterCommand("cash", function()
    if nuiOpen and lastType == "cash" then
        closeUI()
    else
        local PlayerData = RSGCore.Functions.GetPlayerData()
        local cash = PlayerData.money["cash"] or 0

        SendNUIMessage({
            type = "show_cash",
            cash = cash
        })

        nuiOpen = true
        lastType = "cash"
        SetNuiFocus(false, false)
        startAutoCloseTimer()
    end
end, false)

RegisterCommand("valentinebank", function()
    if nuiOpen and lastType == "valbank" then
        closeUI()
    else
        local PlayerData = RSGCore.Functions.GetPlayerData()
        local bank = PlayerData.money["valbank"] or 0

        SendNUIMessage({
            type = "show_bank",
            bank = bank
        })

        nuiOpen = true
        lastType = "valbank"
        SetNuiFocus(false, false)
        startAutoCloseTimer()
    end
end, false)

RegisterCommand("armadillobank", function()
    if nuiOpen and lastType == "armbank" then
        closeUI()
    else
        local PlayerData = RSGCore.Functions.GetPlayerData()
        local bank = PlayerData.money["armbank"] or 0

        SendNUIMessage({
            type = "show_bank",
            bank = bank
        })

        nuiOpen = true
        lastType = "armbank"
        SetNuiFocus(false, false)
        startAutoCloseTimer()
    end
end, false)

RegisterCommand("saintdbank", function()
    if nuiOpen and lastType == "bank" then
        closeUI()
    else
        local PlayerData = RSGCore.Functions.GetPlayerData()
        local bank = PlayerData.money["bank"] or 0

        SendNUIMessage({
            type = "show_bank",
            bank = bank
        })

        nuiOpen = true
        lastType = "bank"
        SetNuiFocus(false, false)
        startAutoCloseTimer()
    end
end, false)

RegisterCommand("rhodesbank", function()
    if nuiOpen and lastType == "rhobank" then
        closeUI()
    else
        local PlayerData = RSGCore.Functions.GetPlayerData()
        local bank = PlayerData.money["rhobank"] or 0

        SendNUIMessage({
            type = "show_bank",
            bank = bank
        })

        nuiOpen = true
        lastType = "rhobank"
        SetNuiFocus(false, false)
        startAutoCloseTimer()
    end
end, false)

RegisterCommand("blackwaterbank", function()
    if nuiOpen and lastType == "blkbank" then
        closeUI()
    else
        local PlayerData = RSGCore.Functions.GetPlayerData()
        local bank = PlayerData.money["blkbank"] or 0

        SendNUIMessage({
            type = "show_bank",
            bank = bank
        })

        nuiOpen = true
        lastType = "blkbank"
        SetNuiFocus(false, false)
        startAutoCloseTimer()
    end
end, false)

function startAutoCloseTimer()
    if closeTimer then
        -- Clear the previous timer (but note: SetTimeout cannot be cancelled in Lua!)
        closeTimer = nil
    end

    closeTimer = SetTimeout(5000, function()
        if nuiOpen then
            closeUI()
        end
    end)
end

function closeUI()
    SendNUIMessage({ type = "hide" })
    nuiOpen = false
    lastType = nil
    SetNuiFocus(false, false)

    -- Not strictly necessary, as SetTimeout can't be cancelled, but good to clean up
    closeTimer = nil
end