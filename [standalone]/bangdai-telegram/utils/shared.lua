lib.locale()

if IsDuplicityVersion() then
    function Notify(source, title, msg, dur)
        TriggerClientEvent('ox_lib:notify', source, {
            title = title,
            description = msg,
            type = type or 'inform',
            duration = dur or 5000
        })
    end

    function GenerateTelegramNumber()
        local chars = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"
        local number = ""
        
        for i = 1, 5 do
            local randIndex = math.random(1, #chars)
            number = number .. string.sub(chars, randIndex, randIndex)
        end
        
        return number
    end

    function ShowTelegramNumber(src, result)
        TriggerClientEvent("chat:addMessage", src, {
            type = locale('Notify_Title') ,
            typeColor = '#11008f',
            header = locale('Your_Telegram_Number'),
            args = { result }
        })
    end
else
    function Notify(title, msg, dur)
        lib.notify({
            title = title,
            description = msg,
            type = type or 'inform',
            duration = dur or 5000
        })
    end

    function PlayAnim(ped, dict,name)
        lib.requestAnimDict(dict, 10000)
        TaskPlayAnim(ped, dict, name, 1.0, 1.0, -1, 2, 0, true, 0, false, 0, false)
    end
end