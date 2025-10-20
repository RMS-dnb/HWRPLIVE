if not Config.EnableContactRadial then return end

lib.locale()

local function OpenAddressbook()
    local options = {
        {
            title = locale('View_PostBox'),
            icon = 'fa-solid fa-book',
            onSelect = ViewAddressBook
        },
        {
            title = locale('Add_New_Postbox'),
            icon = 'fa-solid fa-circle-plus',
            iconColor = 'green',
            onSelect = AddPersonMenu
        },
        {
            title = locale('Remove_PostBox'),
            icon = 'fa-solid fa-trash',
            iconColor = 'red',
            onSelect = RemovePersonMenu
        },
    }
    
    lib.registerContext({
        id = 'addressbook_menu',
        title = locale('Address_Book'),
        options = options
    })
    lib.showContext('addressbook_menu')
end

RegisterNetEvent('bangdai-telegram:client:OpenAddressBook', OpenAddressbook)
exports('OpenAddressbook', OpenAddressbook)

function AddPersonMenu()
    local input = lib.inputDialog(locale('Title_Input'), {
        { type = 'input', label = locale('Label_Input'), required = true, placeholder = locale('PlaceHolderName') },
        { type = 'input', label = locale('Label_Input_Number'), required = true, placeholder = locale('PlaceHolderNumber') },
    })
    
    if not input then return end

    local name, cid = input[1], input[2]
    if name and cid and name:len() > 0 and cid:len() > 0 then
        TriggerServerEvent('telegram:CreateContact', {
            name = name,
            number = cid
        })
    else
        Notify(locale('Notify_Title'), locale('Invalid_input'), 5000)
    end
end

function ViewAddressBook()
    local players = lib.callback.await('bangdai-telegram:server:GetPlayers', false)
    
    if not players or #players == 0 then
        Notify(locale('Notify_Title'), locale('Empty_Book'), 5000)
        return
    end

    local options = {}
    for i = 1, #players do
        local player = players[i]
        options[#options + 1] = {
            title = player.name,
            description = "P.O : " .. player.number,
            icon = 'fa-solid fa-user',
            onSelect = function()
                lib.setClipboard(player.number)
                Notify(locale('Notify_Title'), locale('Success_Copy'), 5000)
            end,
        }
    end

    -- Add back button
    options[#options + 1] = {
        title = locale('Title_Back'),
        icon = 'fa-solid fa-angle-left',
        onSelect = OpenAddressbook
    }

    lib.registerContext({
        id = 'addressbook_view',
        title = locale('Address_Book'),
        options = options
    })
    lib.showContext('addressbook_view')
end

function RemovePersonMenu()
    local players = lib.callback.await('bangdai-telegram:server:GetPlayers', false)
    
    if not players or #players == 0 then
        Notify(locale('Notify_Title'), locale('Empty_Book'), 5000)
        return
    end

    local options = {}
    for i = 1, #players do
        local player = players[i]
        options[#options + 1] = {
            value = player.id,
            label = ('%s (%s)'):format(player.name, player.number)
        }
    end

    local input = lib.inputDialog(locale('Title_Input_Remove'), {
        { 
            type = 'select', 
            label = locale('Input_Select_Remove'),
            options = options, 
            required = true
        }
    })
    
    if not input then return end

    local contactId = input[1]
    if contactId then
        TriggerServerEvent('telegram:DeleteContact', contactId)
    end
end