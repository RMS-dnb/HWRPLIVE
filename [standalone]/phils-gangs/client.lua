local RSGCore = exports['rsg-core']:GetCoreObject()


RegisterNetEvent('rsg-gangs:client:storage', function(data)
    local stashName = 'gang_' .. data.gang_id
    local invWeight = Config.StashMaxWeight
    local invSlots = Config.StashMaxSlots
    TriggerServerEvent('rsg-gangs:server:openinventory', stashName, invWeight, invSlots)
end)


local function OpenGangMenu()
    RSGCore.Functions.TriggerCallback('rsg-gangs:server:getganginfo', function(gangInfo)
        local menuOptions = {}

        if not gangInfo.gang_id then
            table.insert(menuOptions, {
                title = 'Create Gang',
                description = 'Create a new gang. You need bloodmoney in the amount of $' .. Config.GangCreationCost,
                onSelect = function()
                    local input = lib.inputDialog('Create Gang', {
                        { type = 'input', label = 'Gang Name', required = true, min = 3, max = 20 }
                    })
                    if input and input[1] then
                        TriggerServerEvent('rsg-gangs:server:creategang', input[1])
                    end
                end
            })
        else
            -- table.insert(menuOptions, {
            --     title = 'Gang: ' .. gangInfo.gang_name,
            --     description = 'Current funds: $' .. gangInfo.funds,
            --     disabled = true
            -- })
            -- table.insert(menuOptions, {
            --     title = 'Open Stash',
            --     description = 'Access the gang stash',
            --     onSelect = function()
            --         TriggerEvent('rsg-gangs:client:storage', { gang_id = gangInfo.gang_id })
            --     end
            -- })
            -- table.insert(menuOptions, {
            --     title = 'Deposit Funds',
            --     description = 'Add money to gang funds',
            --     onSelect = function()
            --         local input = lib.inputDialog('Deposit Funds', {
            --             { type = 'number', label = 'Amount', required = true, min = 1 }
            --         })
            --         if input and input[1] then
            --             TriggerServerEvent('rsg-gangs:server:depositfunds', tonumber(input[1]))
            --         end
            --     end
            -- })
            -- View Members option (available to all gang members)
            table.insert(menuOptions, {
                title = 'View Members',
                description = 'See all gang members' .. (gangInfo.role == 'boss' and ' and kick if needed' or ''),
                onSelect = function()
                    RSGCore.Functions.TriggerCallback('rsg-gangs:server:getgangmembers', function(members)
                        if #members == 0 then
                            lib.notify({title = 'Gang Info', description = 'No members in the gang!', type = 'inform', duration = 5000 })
                            return
                        end

                        local memberOptions = {}
                        for _, member in ipairs(members) do
                            local isBoss = member.role == 'boss'
                            local isSelf = member.citizenid == gangInfo.citizenid
                            -- Format charinfo for display
                            local charInfoText = 'Unknown'
                            if member.charinfo then
                                local char = member.charinfo
                                charInfoText = (char.firstname or 'Unknown') .. ' ' .. (char.lastname or 'Unknown')
                                if char.gender then
                                    charInfoText = charInfoText .. ', Gender: ' .. char.gender
                                end
                                if char.birthdate then
                                    charInfoText = charInfoText .. ', Born: ' .. char.birthdate
                                end
                            end
                            table.insert(memberOptions, {
                                title = member.display_name .. ' (' .. member.role .. ')',
                                description = charInfoText .. (isBoss and '\nGang Boss' or (gangInfo.role == 'boss' and not isSelf and '\nSelect to kick this member' or '\nGang Member')),
                                disabled = gangInfo.role ~= 'boss' or isBoss or isSelf,
                                onSelect = function()
                                    if gangInfo.role ~= 'boss' or isBoss or isSelf then return end
                                    local confirm = lib.alertDialog({
                                        header = 'Kick Member',
                                        content = 'Are you sure you want to kick ' .. member.display_name .. ' from ' .. gangInfo.gang_name .. '?',
                                        centered = true,
                                        cancel = true
                                    })
                                    if confirm == 'confirm' then
                                        TriggerServerEvent('rsg-gangs:server:kickmember', member.citizenid)
                                    end
                                end
                            })
                        end

                        lib.registerContext({
                            id = 'view_members_menu',
                            title = 'Gang Members',
                            options = memberOptions
                        })
                        lib.showContext('view_members_menu')
                    end, gangInfo.gang_id)
                end
            })
            if gangInfo.role == 'boss' then
                table.insert(menuOptions, {
                    title = 'Add Member',
                    description = 'Invite a player to join the gang (Boss only)',
                    onSelect = function()
                        local input = lib.inputDialog('Add Gang Member', {
                            { type = 'input', label = 'Citizen ID', description = 'Enter the player\'s Citizen ID', required = true }
                        })
                        if input and input[1] then
                            TriggerServerEvent('rsg-gangs:server:addmember', input[1])
                        end
                    end
                })
                -- table.insert(menuOptions, {
                --     title = 'Withdraw Funds',
                --     description = 'Withdraw money from gang funds (Boss only)',
                --     onSelect = function()
                --         local input = lib.inputDialog('Withdraw Funds', {
                --             { type = 'number', label = 'Amount', required = true, min = 1 }
                --         })
                --         if input and input[1] then
                --             TriggerServerEvent('rsg-gangs:server:withdrawfunds', tonumber(input[1]))
                --         end
                --     end
                -- })
                table.insert(menuOptions, {
                    title = 'Set New Boss',
                    description = 'Promote a member to gang boss (Boss only)',
                    onSelect = function()
                        RSGCore.Functions.TriggerCallback('rsg-gangs:server:getgangmembers', function(members)
                            if #members == 0 then
                                lib.notify({title = 'Gang Error', description = 'No other members to promote! Use /setgangboss for manual assignment.', type = 'error', duration = 5000 })
                                return
                            end

                            local memberOptions = {}
                            for _, member in ipairs(members) do
                                if member.role ~= 'boss' then
                                    table.insert(memberOptions, {
                                        title = member.display_name .. ' (' .. member.role .. ')',
                                        description = 'Promote to boss',
                                        onSelect = function()
                                            local confirm = lib.alertDialog({
                                                header = 'Promote to Boss',
                                                content = 'Are you sure you want to make ' .. member.display_name .. ' the boss of ' .. gangInfo.gang_name .. '? You will become a leader.',
                                                centered = true,
                                                cancel = true
                                            })
                                            if confirm == 'confirm' then
                                                TriggerServerEvent('rsg-gangs:server:promotetoboss', member.citizenid)
                                            end
                                        end
                                    })
                                end
                            end

                            if #memberOptions == 0 then
                                lib.notify({title = 'Gang Error', description = 'No eligible members to promote!', type = 'error', duration = 5000 })
                                return
                            end

                            lib.registerContext({
                                id = 'promote_boss_menu',
                                title = 'Select New Boss',
                                options = memberOptions
                            })
                            lib.showContext('promote_boss_menu')
                        end, gangInfo.gang_id)
                    end
                })
                table.insert(menuOptions, {
                    title = 'Disband Gang',
                    description = 'Permanently delete the gang (Boss only)',
                    onSelect = function()
                        local confirm = lib.alertDialog({
                            header = 'Disband Gang',
                            content = 'Are you sure you want to disband ' .. gangInfo.gang_name .. '? This cannot be undone.',
                            centered = true,
                            cancel = true
                        })
                        if confirm == 'confirm' then
                            TriggerServerEvent('rsg-gangs:server:disbandgang')
                        end
                    end
                })
            end
        end

        lib.registerContext({
            id = 'gang_menu',
            title = 'Gang Management',
            options = menuOptions
        })
        lib.showContext('gang_menu')
    end)
end

RegisterCommand('gangmenu', function()
    OpenGangMenu()
end, false)




RegisterCommand('ganginfo', function()
    RSGCore.Functions.TriggerCallback('rsg-gangs:server:getallgangs', function(data)
        if data.playerGang.gang_id then
            local role = data.playerGang.role == 'boss' and 'Boss' or data.playerGang.role == 'leader' and 'Leader' or 'Member'
            TriggerEvent('ox_lib:notify', {
                title = 'Your Gang',
                description = 'Gang: ' .. data.playerGang.gang_name .. ' | Role: ' .. role,
                type = 'inform',
                duration = 5000
            })
        else
            TriggerEvent('ox_lib:notify', {
                title = 'No Gang',
                description = 'You are not in a gang.',
                type = 'inform',
                duration = 5000
            })
        end

        if #data.allGangs > 0 then
            local gangList = 'Active Gangs:\n'
            for _, gang in ipairs(data.allGangs) do
                gangList = gangList .. '- ' .. gang.gang_name .. ' (ID: ' .. gang.gang_id .. ')\n'
            end
            TriggerEvent('ox_lib:notify', {
                title = 'Gang List',
                description = gangList,
                type = 'inform',
                duration = 10000
            })
        else
            TriggerEvent('ox_lib:notify', {
                title = 'Gang List',
                description = 'No gangs exist.',
                type = 'inform',
                duration = 5000
            })
        end
    end)
end, false)