display = false
local blipEntries = {}
local MenuGroup = GetRandomIntInRange(0, 0xffffff)

local currentLocation = {
    city = nil,
    state = nil
}

lib.locale()

local function registerNetEvent(event, fn)
    RegisterNetEvent(event, function(...)
        if source ~= '' then fn(...) end
    end)
end

local DisableAllControlActions = DisableAllControlActions
function Enablekey()
    while display do
        Wait(0)
        DisableAllControlActions(0)
        for i = 1, #Config.EnableTalkWhileOpen.EnableKeys do
            EnableControlAction(0, Config.EnableTalkWhileOpen.EnableKeys[i], true)
        end
    end
end

local function CloseNUI()
    display = false
    SendNUIMessage({ action = "Close" })
    Wait(700)
    SetNuiFocus(false, false)
    if Config.EnableTalkWhileOpen.Enable then
        SetNuiFocusKeepInput(false)
    end
    currentLocation.city = nil
    currentLocation.state = nil
end

RegisterCommand('keluar', function()
    CloseNUI()
end, false)

local function OpenTelegram(city, state)
    display = true
    currentLocation.city = city
    currentLocation.state = state
    
    local data = lib.callback.await('bangdai-telegram:server:LoadUserData')
    if data then
        SetNuiFocus(true, true)
        if Config.EnableTalkWhileOpen.Enable then
            SetNuiFocusKeepInput(true)
            CreateThread(Enablekey)
        end
        SendNUIMessage({
            action = "Open",
            telegrams = data.telegrams,
            contacts = data.contacts,
            MyTelegram = data.telegramno,
            year = data.year,
            leftText = currentLocation.city,
            rightText = currentLocation.state,
            playerData = data.playerData,
            authorizedJobs = Config.AuthorizedJobs
        })
    end
end
exports('OpenTelegram', OpenTelegram)

registerNetEvent('bangdai-telegram:client:view', function (data)
    display = true
    SetNuiFocus(true, true)
    if Config.EnableTalkWhileOpen.Enable then
        SetNuiFocusKeepInput(true)
        CreateThread(Enablekey)
    end
    SendNUIMessage({
        action = "ViewItem",
        MyTelegram = data.number,
        sender = data.sender,
        receiver = data.receiver,
        date = data.date,
        title = data.title,
        text = data.text,
        leftText = data.city,
        rightText = data.state
    })
end)

-- NUI Callbacks
RegisterNUICallback('Close', function(data, cb)
    CloseNUI()
    
    if UdahManggil then
        Wait(600)
        BukaBirdLetter(data.name)
    end
    
    cb('ok')
end)

RegisterNUICallback('SendTelegram', function(data, cb)

    CloseNUI()
    
    if data.isBirdPost then
        ClearTaskPed()
    end
    
    TriggerServerEvent("telegram:SendTelegram", data)
    cb(true)
end)

RegisterNUICallback('DeleteTelegram', function(data, cb)
    TriggerServerEvent("telegram:DeleteTelegram", {
        telegramId = data.telegramId,
        type = data.type
    })
    cb(true)
end)

RegisterNUICallback('OpenTelegram', function(data, cb)
    TriggerServerEvent("telegram:MarkAsRead", data.telegram)
    cb('ok')
end)

RegisterNUICallback('Reload', function(data, cb)
    if currentLocation.city and currentLocation.state then
        OpenTelegram(currentLocation.city, currentLocation.state)
    end
    cb('ok')
end)

RegisterNUICallback('CreateContact', function(data, cb)
    TriggerServerEvent("telegram:CreateContact", data)
    cb(true)
end)

RegisterNUICallback('UpdateContact', function(data, cb)
    TriggerServerEvent('telegram:UpdateContact', data)
    cb(true)
end)

RegisterNUICallback('DeleteContact', function(data, cb)
    TriggerServerEvent("telegram:DeleteContact", data.id)
    cb('ok')
end)

RegisterNUICallback('RetrieveTelegram', function(data, cb)
    local success = lib.callback.await('bangdai-telegram:server:RetrieveTelegram', false, data)
    cb(success)
end)

RegisterNUICallback('AnswerTelegram', function(data, cb)
    local response = lib.callback.await('bangdai-telegram:server:GetSenderNumber', false, data)
    cb(response)
end)

CreateThread(function()
    for k, v in pairs(Config.Postal) do
        if not v.showblip then return end
        local Postal = Citizen.InvokeNative(0x554D9D53F696D002, 1664425300, v.coords)
        SetBlipSprite(Postal, GetHashKey(Config.Blip.blipSprite), true)
        SetBlipScale(Postal, Config.Blip.blipScale)
        Citizen.InvokeNative(0x9CB1A1623062F402, Postal, Config.Blip.blipname)
        blipEntries[#blipEntries + 1] = {type = "BLIP", handle = Postal}
    end
end)

local function StartMainPrompts()
    local str = locale('Open_Prompt_Label')
    MenuPrompt = PromptRegisterBegin()
    PromptSetControlAction(MenuPrompt, Config.keys.OpenMenuPrompt)
    str = CreateVarString(10, 'LITERAL_STRING', str)
    PromptSetText(MenuPrompt, str)
    PromptSetEnabled(MenuPrompt, true)
    PromptSetVisible(MenuPrompt, true)
    PromptSetHoldMode(MenuPrompt, 500)
    PromptSetGroup(MenuPrompt, MenuGroup)
    PromptRegisterEnd(MenuPrompt)
end

CreateThread(function()
    StartMainPrompts()
    while true do
        Wait(5)
        local sleep = true
        local coords = GetEntityCoords(cache.ped)
        for k, v in pairs(Config.Postal) do
            local dist = #(coords - v.coords)
            if dist < 2.0 then
                sleep = false
                local PromptGroup = CreateVarString(10, 'LITERAL_STRING', locale('Postal_Office'))
                PromptSetActiveGroupThisFrame(MenuGroup, PromptGroup)
                if PromptHasHoldModeCompleted(MenuPrompt) then
                    if not display then
                        OpenTelegram(v.name, v.state)
                        break
                    end
                end
            end
        end
        if sleep then
            Wait(1500)
        end
    end
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        for _, entry in ipairs(blipEntries) do
            if entry.type == "BLIP" then
                RemoveBlip(entry.handle)
            end
        end

        Citizen.InvokeNative(0x00EDE88D4D13CF59, MenuGroup) -- UiPromptDelete
    end
end)