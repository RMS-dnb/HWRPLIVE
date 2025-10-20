lib.locale()

CreateThread(function()
    if GetCurrentResourceName() ~= 'bangdai-telegram' then
        lib.print.error('This resource must be named "bangdai-telegram" to function correctly.')
        return StopResource(GetCurrentResourceName())
    end

    print('^bangdai-telegram^7: ^3Resource started successfully!^7')
end)

CreateThread(function()
    local success, error = pcall(function()
        local tables = {
            'bangdai_telegram_inbox',
            'bangdai_telegram_sent',
            'bangdai_telegram_contacts',
            'bangdai_telegram_user'
        }

        local oldTableExists = exports.oxmysql:executeSync('SHOW TABLES LIKE ?', { 'bangdai_telegrams' })
        
        for _, table in ipairs(tables) do
            local exists = exports.oxmysql:executeSync('SHOW TABLES LIKE ?', { table })
            if #exists == 0 then
                if table == 'bangdai_telegram_inbox' then
                    exports.oxmysql:execute([[
                        CREATE TABLE bangdai_telegram_inbox (
                            id INT AUTO_INCREMENT PRIMARY KEY,
                            sender VARCHAR(50) NOT NULL,
                            receiver VARCHAR(50) NOT NULL,
                            date VARCHAR(50) NOT NULL,
                            title VARCHAR(100) NOT NULL,
                            text TEXT NOT NULL,
                            open INT DEFAULT 0,
                            city VARCHAR(50) DEFAULT 'Valentine',
                            state VARCHAR(50) DEFAULT 'New Hanover'
                        )
                    ]])

                    if #oldTableExists > 0 then
                        print('^3Found old telegram table. Starting migration...^0')
                        
                        -- Migrate data from old table to new table
                        exports.oxmysql:execute([[
                            INSERT INTO bangdai_telegram_inbox 
                            (sender, receiver, date, title, text, open, city, state)
                            SELECT sender, receiver, date, title, text, open, 
                                   COALESCE(city, 'Valentine') as city, 
                                   COALESCE(state, 'New Hanover') as state
                            FROM bangdai_telegrams
                        ]])

                        -- After successful migration, backup old table and drop it
                        exports.oxmysql:execute([[
                            CREATE TABLE bangdai_telegrams_backup AS 
                            SELECT * FROM bangdai_telegrams
                        ]])
                        
                        exports.oxmysql:execute('DROP TABLE bangdai_telegrams')
                        
                        print('^2Successfully migrated data from bangdai_telegrams to bangdai_telegram_inbox^0')
                        print('^3Old table has been backed up as bangdai_telegrams_backup^0')
                    end
                elseif table == 'bangdai_telegram_sent' then
                    exports.oxmysql:execute([[
                        CREATE TABLE bangdai_telegram_sent (
                            id INT AUTO_INCREMENT PRIMARY KEY,
                            sender VARCHAR(50) NOT NULL,
                            sender_number VARCHAR(50) NOT NULL,
                            receiver VARCHAR(50) NOT NULL,
                            date VARCHAR(50) NOT NULL,
                            title VARCHAR(100) NOT NULL,
                            text TEXT NOT NULL,
                            city VARCHAR(50) DEFAULT 'Valentine',
                            state VARCHAR(50) DEFAULT 'New Hanover'
                        )
                    ]])
                elseif table == 'bangdai_telegram_contacts' then
                    exports.oxmysql:execute([[
                        CREATE TABLE bangdai_telegram_contacts (
                            id INT AUTO_INCREMENT PRIMARY KEY,
                            identifier VARCHAR(50) NOT NULL,
                            charid VARCHAR(50) NOT NULL,
                            name VARCHAR(50) NOT NULL,
                            number VARCHAR(50) NOT NULL
                        )
                    ]])
                elseif table == 'bangdai_telegram_user' then
                    exports.oxmysql:execute([[
                        CREATE TABLE bangdai_telegram_user (
                            id INT AUTO_INCREMENT PRIMARY KEY,
                            identifier VARCHAR(50) NOT NULL,
                            charid VARCHAR(50) NOT NULL,
                            telegram_number VARCHAR(50) NOT NULL UNIQUE,
                            created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
                            UNIQUE KEY unique_char (identifier, charid)
                        )
                    ]])
                end
                print('^2Created table: ' .. table .. '^0')
            end
        end
    end)

    if not success then
        print("^1Error checking/creating telegram tables: " .. tostring(error))
    end
end)

local function GetOrGenerateTelegramNumber(identifier)
    local result = exports.oxmysql:executeSync('SELECT * FROM bangdai_telegram_user WHERE identifier = ? AND charid = ?',
        {
            identifier.identifier,
            identifier.charid
        })

    if result and result[1] then
        return result[1].telegram_number
    end

    local newNumber
    local isUnique = false

    while not isUnique do
        newNumber = "TG-" .. GenerateTelegramNumber()
        local exists = exports.oxmysql:executeSync('SELECT 1 FROM bangdai_telegram_user WHERE telegram_number = ?', {
            newNumber
        })

        if not exists[1] then
            isUnique = true
        end
    end

    exports.oxmysql:insert('INSERT INTO bangdai_telegram_user (identifier, charid, telegram_number) VALUES (?, ?, ?)', {
        identifier.identifier,
        identifier.charid,
        newNumber
    })

    return newNumber
end

local function GetContactName(identifier, charid, telegramNumber)
    local result = exports.oxmysql:executeSync(
    'SELECT name FROM bangdai_telegram_contacts WHERE identifier = ? AND charid = ? AND number = ?', {
        identifier,
        charid,
        telegramNumber
    })
    return result and result[1] and result[1].name or nil
end

local function GetPlayerByIdentifier(identifier, charid)
    local players = GetPlayers()
    for _, playerId in ipairs(players) do
        local id = GetIdentifier(tonumber(playerId))
        if id and id.identifier == identifier and id.charid == charid then
            return tonumber(playerId)
        end
    end
    return nil
end

----------------------------------------
------------GLOBAL FUNCTION-------------
----------------------------------------

function CheckUnreadTelegrams(src)
    local identifier = GetIdentifier(src)
    if not identifier then
        if Config.debug then
            print("^3[Telegram Debug] No identifier found for source: " .. src .. "^0")
        end
        return 
    end

    local telegramNumber = GetOrGenerateTelegramNumber(identifier)
    if not telegramNumber then
        if Config.debug then
            print("^3[Telegram Debug] No telegram number found for source: " .. src .. "^0")
        end
        return
    end

    if Config.debug then
        print("^2[Telegram Debug] Checking unread telegrams for: " .. telegramNumber .. "^0")
    end

    local result = exports.oxmysql:executeSync([[
        SELECT t.*, c.name as contact_name
        FROM bangdai_telegram_inbox t
        LEFT JOIN bangdai_telegram_contacts c ON c.number = t.sender
            AND c.identifier = ? AND c.charid = ?
        WHERE t.receiver = ? AND t.open = 0
        ORDER BY t.date DESC
    ]], {
        identifier.identifier,
        identifier.charid,
        telegramNumber
    })

    if not result then
        if Config.debug then
            print("^1[Telegram Debug] Query failed for unread telegrams^0")
        end
        return
    end

    if #result == 0 then
        if Config.debug then
            print("^2[Telegram Debug] No unread telegrams found^0")
        end
        return 
    end

    if Config.debug then
        print("^2[Telegram Debug] Found " .. #result .. " unread telegrams^0")
    end

    local notifications = {}
    for _, telegram in ipairs(result) do
        local senderDisplay = telegram.contact_name or telegram.sender
        if not notifications[senderDisplay] then
            notifications[senderDisplay] = 1
        else
            notifications[senderDisplay] = notifications[senderDisplay] + 1
        end
    end

    for sender, count in pairs(notifications) do
        if Config.debug then
            print("^2[Telegram Debug] Sending notification: " .. count .. " telegrams from " .. sender .. "^0")
        end
        Notify(src, locale('Notify_Title'), locale('Unread_Telegrams_From', count, sender), 5000)
    end
end


----------------------------------------
----------END GLOBAL FUNCTION-----------
----------------------------------------

RegisterNetEvent("telegram:SendTelegram", function(data)
    local src = source
    local Player = GetPlayer(src)
    local PlayerData = GetPlayerData(src)
    if not Player or not PlayerData then return end

    local senderIdentifier = GetIdentifier(src)
    if not senderIdentifier then return end

    if not Config.AllowSendToSelf and data.sender == data.receiver then
        return Notify(src, locale('Notify_Title'), locale('Cant_Send_ToYou'), 5000)
    end

    local isLawReceiver = false
    local targetJob = nil
    
    for job, receiver in pairs(Config.LawReceiver) do
        if data.receiver == receiver then
            isLawReceiver = true
            targetJob = job
            break
        end
    end

    if isLawReceiver then
        if PlayerData.money < Config.Price then
            return Notify(src, locale('Notify_Title'), locale('Dont_Have_Money'), 5000)
        end

        local telegramNumber = GetOrGenerateTelegramNumber(senderIdentifier)
        local sentCount = 0
        
        local players = GetPlayers()
        for _, playerId in ipairs(players) do
            local targetPlayerData = GetPlayerData(tonumber(playerId))
            if targetPlayerData and targetPlayerData.job == targetJob then
                local targetIdentifier = GetIdentifier(tonumber(playerId))
                if targetIdentifier and targetIdentifier.telegram_number then
                    exports.oxmysql:insert('INSERT INTO bangdai_telegram_inbox (sender, receiver, date, title, text, city, state) VALUES (?, ?, ?, ?, ?, ?, ?)', 
                    { 
                        data.sender, 
                        targetIdentifier.telegram_number, 
                        data.date, 
                        data.title, 
                        data.text, 
                        data.city, 
                        data.state 
                    })
                    sentCount = sentCount + 1
                    
                    Notify(tonumber(playerId), locale('Notify_Title'), locale('Receive_Emergency_Telegram', data.sender), 5000)
                end
            end
        end

        exports.oxmysql:insert([[
            INSERT INTO bangdai_telegram_sent
            (sender, sender_number, receiver, date, title, text, city, state)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?)
        ]], {
            data.sender,
            telegramNumber,
            data.receiver,
            data.date,
            data.title,
            data.text,
            data.city,
            data.state
        })

        RemoveMoney(src, Config.Price)
        return Notify(src, locale('Notify_Title'), locale('Success_Send_Emergency', targetJob, sentCount), 5000)
    end

    if data.receiver == '*' then
        if Config.AuthorizedJobs.enable then
            local jobConfig = Config.AuthorizedJobs[PlayerData.job]
            
            if not jobConfig or not lib.table.contains(jobConfig.grades, PlayerData.grade) then
                return Notify(src, locale('Notify_Title'), locale('Not_Authorized'), 5000)
            end
        end

        if PlayerData.money < Config.Price then
            return Notify(src, locale('Notify_Title'), locale('Dont_Have_Money'), 5000)
        end

        local users = exports.oxmysql:executeSync('SELECT * FROM bangdai_telegram_user')
        local telegramNumber = GetOrGenerateTelegramNumber(senderIdentifier)
        local sentCount = 0

        for _, user in ipairs(users) do
            if user.telegram_number ~= data.sender then
                exports.oxmysql:insert('INSERT INTO bangdai_telegram_inbox (sender, receiver, date, title, text, city, state) VALUES (?, ?, ?, ?, ?, ?, ?)', { data.sender, user.telegram_number, data.date, data.title, data.text, data.city, data.state })
                sentCount = sentCount + 1

                local targetPlayer = GetPlayerByIdentifier(user.identifier, user.charid)
                if targetPlayer then
                    Notify(targetPlayer, locale('Notify_Title'), locale('Receive_Mass_Telegram', data.sender), 5000)
                end
            end
        end

        exports.oxmysql:insert([[
            INSERT INTO bangdai_telegram_sent
            (sender, sender_number, receiver, date, title, text, city, state)
            VALUES (?, ?, ?, ?, ?, ?, ?, ?)
        ]], {
            data.sender,
            telegramNumber,
            '*',
            data.date,
            data.title,
            data.text,
            data.city,
            data.state
        })

        RemoveMoney(src, Config.Price)
        return Notify(src, locale('Notify_Title'), locale('Success_Send_Mass', sentCount), 5000)
    end

    local receiverResult = exports.oxmysql:executeSync('SELECT * FROM bangdai_telegram_user WHERE telegram_number = ? COLLATE utf8mb4_bin',
        {
            data.receiver
        })

    if not receiverResult or #receiverResult == 0
        or not receiverResult[1].identifier 
        or not receiverResult[1].charid then
        return Notify(src, locale('Notify_Title'), locale('Invalid_Receiver'), 5000)
    end

    local targetIdentifier = receiverResult[1].identifier
    local targetCharId = receiverResult[1].charid

    local receiverContactName = GetContactName(senderIdentifier.identifier, senderIdentifier.charid, data.receiver)

    local senderContactName = GetContactName(targetIdentifier, targetCharId, data.sender)

    local telegramNumber = GetOrGenerateTelegramNumber(senderIdentifier)

    local targetSource = nil
    local players = GetPlayers()
    for _, playerId in ipairs(players) do
        local id = GetIdentifier(tonumber(playerId))
        if id and id.identifier == targetIdentifier then
            targetSource = tonumber(playerId)
            break
        end
    end

    if data.sender == nil or data.sender == '' or data.receiver == nil or data.receiver == '' or data.title == nil or data.title == '' or data.text == nil or data.text == '' then
        return Notify(src, locale('Notify_Title'), locale('FilL_First'), 5000)
    end

    if data.isBirdPost then
        local hasitem = HasRequiredItem(src, Config.Item.Paper.item)

        if hasitem then
            RemoveItem(src, Config.Item.Paper.item)

            exports.oxmysql:insert('INSERT INTO bangdai_telegram_inbox (sender, receiver, date, title, text, city, state) VALUES (?, ?, ?, ?, ?, ?, ?)',
                { data.sender, data.receiver, data.date, data.title, data.text, data.city, data.state })

            exports.oxmysql:insert([[
                INSERT INTO bangdai_telegram_sent
                (sender, sender_number, receiver, date, title, text, city, state)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?)
            ]], {
                data.sender,
                telegramNumber,
                data.receiver,
                data.date,
                data.title,
                data.text,
                data.city,
                data.state
            })
            if targetSource then
                local notificationText = senderContactName and
                    locale('Receive_Bird_Contact', senderContactName) or
                    locale('Receive_Bird_Number', data.sender)

                Notify(targetSource, locale('Notify_Title'), notificationText, 5000)
                TriggerClientEvent('bangdai-telegram:client:HandleTelegramDelivery', targetSource, data)
            end

            local receiverDisplayName = receiverContactName or data.receiver
            Notify(src, locale('Notify_Title'), locale('Success_Send_Bird', receiverDisplayName), 5000)
        else
            Notify(src, locale('Notify_Title'), locale('Dont_Have_Paper'), 5000)
        end
    else
        if PlayerData.money >= Config.Price then
            RemoveMoney(src, Config.Price, 'postmail')

            exports.oxmysql:insert(
                'INSERT INTO bangdai_telegram_inbox (sender, receiver, date, title, text, city, state) VALUES (?, ?, ?, ?, ?, ?, ?)',
                { data.sender, data.receiver, data.date, data.title, data.text, data.city, data.state })

            exports.oxmysql:insert([[
                INSERT INTO bangdai_telegram_sent
                (sender, sender_number, receiver, date, title, text, city, state)
                VALUES (?, ?, ?, ?, ?, ?, ?, ?)
            ]], {
                data.sender,
                telegramNumber,
                data.receiver,
                data.date,
                data.title,
                data.text,
                data.city,
                data.state
            })
            local receiverDisplayName = receiverContactName or data.receiver
            Notify(src, locale('Notify_Title'), locale('Success_Send_Telegram', receiverDisplayName), 5000)

            if targetSource then
                local senderDisplayName = senderContactName or data.sender
                Notify(targetSource, locale('Notify_Title'), locale('Receive_Telegram', senderDisplayName), 5000)
            end
        else
            Notify(src, locale('Notify_Title'), locale('Dont_Have_Money'), 5000)
        end
    end
end)

RegisterNetEvent("telegram:DeleteTelegram", function(data)
    local src = source
    local Player = GetPlayer(src)
    if not Player then return end

    if data.type == 'inbox' then
        exports.oxmysql:execute('DELETE FROM bangdai_telegram_inbox WHERE id = ?', { data.telegramId })
    else
        exports.oxmysql:execute('DELETE FROM bangdai_telegram_sent WHERE id = ?', { data.telegramId })
    end

    Notify(src, locale('Notify_Title'), locale('Success_Deleted_Telegram'), 5000)
end)

RegisterNetEvent("telegram:MarkAsRead", function(telegramId)
    local src = source
    local Player = GetPlayer(src)
    if not Player then return end

    exports.oxmysql:execute('UPDATE bangdai_telegram_inbox SET open = 1 WHERE id = ?', { telegramId })
end)

RegisterNetEvent("telegram:CreateContact", function(data)
    local src = source
    local Player = GetPlayer(src)
    if not Player then return end

    local identifier = GetIdentifier(src)
    if identifier then
        local success = exports.oxmysql:insert(
        'INSERT INTO bangdai_telegram_contacts (name, number, identifier, charid) VALUES (?, ?, ?, ?)',
            { data.name, data.number, identifier.identifier, identifier.charid })

        if success then
            Notify(src, locale('Notify_Title'), locale('Add_Success'), 5000)
        end
    end
end)

RegisterNetEvent("telegram:DeleteContact", function(contactId)
    local src = source
    local Player = GetPlayer(src)
    if not Player then return end

    local identifier = GetIdentifier(src)
    if identifier then
        local success = exports.oxmysql:execute(
        'DELETE FROM bangdai_telegram_contacts WHERE id = ? AND identifier = ? AND charid = ?',
            { contactId, identifier.identifier, identifier.charid })
        if success then
            Notify(src, locale('Succes_Deleted'), locale('Add_Success'), 5000)
        end
    end
end)

RegisterNetEvent('telegram:UpdateContact', function(data)
    local src = source
    local Player = GetPlayer(src)
    if not Player then return end

    local identifier = GetIdentifier(src)
    if identifier then
        local success = exports.oxmysql:execute(
            'UPDATE bangdai_telegram_contacts SET name = ? WHERE id = ? AND identifier = ? AND charid = ?',
            { data.name, data.id, identifier.identifier, identifier.charid }
        )

        if success then
            Notify(src, locale('Notify_Title'), locale('Edit_Success'), 5000)
        end
    end
end)

--callbacks

lib.callback.register('bangdai-telegram:server:GetPlayers', function(source)
    local src = source
    local Player = GetPlayer(src)
    if not Player then return nil end

    local identifier = GetIdentifier(src)
    if not identifier then return nil end

    local result = exports.oxmysql:executeSync(
    'SELECT * FROM bangdai_telegram_contacts WHERE identifier = ? AND charid = ? ORDER BY name ASC', {
        identifier.identifier,
        identifier.charid
    })

    return result
end)

lib.callback.register('bangdai-telegram:server:LoadUserData', function(source)
    local src = source
    local Player = GetPlayer(src)
    if not Player then return false end
    local identifier = GetIdentifier(src)
    if not identifier then return nil end

    local PlayerData = GetPlayerData(src)
    if not PlayerData then return nil end
    local telegramNumber = GetOrGenerateTelegramNumber(identifier)
    
    local telegrams = {}
    
    local inbox = exports.oxmysql:executeSync([[
        SELECT id, sender, receiver, date, title, text, open, city, state, 'inbox' as type
        FROM bangdai_telegram_inbox
        WHERE receiver = ?
    ]], { telegramNumber })

    local sent = exports.oxmysql:executeSync([[
        SELECT id, sender, sender_number, receiver, date, title, text, city, state, 'sent' as type
        FROM bangdai_telegram_sent
        WHERE sender_number = ?
    ]], { telegramNumber })

    for _, msg in ipairs(inbox) do
        msg.type = 'inbox'
        table.insert(telegrams, msg)
    end
    for _, msg in ipairs(sent) do
        msg.type = 'sent'
        table.insert(telegrams, msg)
    end

    local contacts = exports.oxmysql:executeSync(
        'SELECT * FROM bangdai_telegram_contacts WHERE identifier = ? AND charid = ?',
        { identifier.identifier, identifier.charid })

    return {
        telegrams = telegrams,
        contacts = contacts, 
        telegramno = telegramNumber,
        year = Config.CurrentYear,
        playerData = {
            job = PlayerData.job,
            grade = PlayerData.grade
        }
    }
end)

lib.callback.register('bangdai-telegram:server:RetrieveTelegram', function(source, data)
    local src = source
    local Player = GetPlayer(src)
    if not Player then return false end

    local info = {
        sender = data.sender,
        receiver = data.receiver,
        date = data.date,
        title = data.title,
        text = data.text,
        city = data.city,
        state = data.state,
        number = data.MyTelegram
    }

    local additem = AddItem(source, Config.Item.LetterToRead.item, info)

    if additem then
        if data.type == 'inbox' then
            exports.oxmysql:execute('DELETE FROM bangdai_telegram_inbox WHERE id = ?', { data.telegram })
        else
            exports.oxmysql:execute('DELETE FROM bangdai_telegram_sent WHERE id = ?', { data.telegram })
        end
        return true
    end

    return false
end)

lib.callback.register('bangdai-telegram:server:GetSenderNumber', function(source, data)
    local numberFromText = string.match(data.sender, "TG%-%w+")
    if numberFromText then
        return {
            success = true,
            senderNumber = numberFromText
        }
    end

    local function trim(s)
        return (s:gsub("^%s*(.-)%s*$", "%1"))
    end

    local cleanSenderName = trim(string.gsub(data.sender, "TG%-%w+", ""))

    local result = exports.oxmysql:executeSync([[
        SELECT telegram_number
        FROM bangdai_telegram_user u
        INNER JOIN bangdai_telegram_inbox t ON t.sender = u.telegram_number
        WHERE t.sender LIKE ?
        AND t.title = ?
        AND t.date = ?
        LIMIT 1
    ]], {
        '%' .. cleanSenderName .. '%',
        data.title,
        data.date
    })

    if result and result[1] then
        return {
            success = true,
            senderNumber = result[1].telegram_number
        }
    end

    return {
        success = false,
        senderNumber = nil,
        message = "Could not find sender's telegram number"
    }
end)

lib.callback.register('bangdai-telegram:CheckItem', function(source)
    return HasRequiredItem(source, Config.Item.Paper.item)
end)

lib.addCommand(Config.CommandShowTelegramNumber, {
    help = 'Show your telegram number',
}, function(source)
    local src = source
    local Player = GetPlayer(src)
    if not Player then return end

    local identifier = GetIdentifier(src)
    if not identifier then return end

    local result = exports.oxmysql:executeSync(
    'SELECT telegram_number FROM bangdai_telegram_user WHERE identifier = ? AND charid = ?', {
        identifier.identifier,
        identifier.charid
    })

    if result and result[1] then
        ShowTelegramNumber(src, result[1].telegram_number)
    else
        Notify(src, locale('Notify_Title'), locale('No_Telegram_Number'), 5000)
    end
end)

CreateThread(function()
    for k, v in pairs(Config.Item) do
        if v.item and v.type then
            CreateItem(v.item, v.type)
        end
    end
end)