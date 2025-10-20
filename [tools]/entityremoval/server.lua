
local RSGCore = exports['rsg-core']:GetCoreObject()
local permissions = {
    ['adminremove'] = 'admin' 
}


function DetectCoordinates(entry)
   
    local coordsColumns = {
        "coords", "coordinates", "location", "position", "xyz", "pos"
    }
    
    
    for _, colName in ipairs(coordsColumns) do
        if entry[colName] then
            return entry[colName]
        end
    end
    
    
    if entry.x and entry.y and entry.z then
        return {x = entry.x, y = entry.y, z = entry.z}
    end
    
    
    for colName, value in pairs(entry) do
       
        if type(value) == "string" and string.match(value, "[%{%[].-[%}%]]") then
            local success, decodedValue = pcall(json.decode, value)
            if success and decodedValue then
                
                if decodedValue.x and decodedValue.y and decodedValue.z then
                    return decodedValue
                
                elseif type(decodedValue) == "table" and #decodedValue >= 3 then
                    return {x = decodedValue[1], y = decodedValue[2], z = decodedValue[3]}
                end
            end
        end
    end
    
    return nil
end


RSGCore.Commands.Add('dcremove', 'Remove database entries (Admin Only)', {}, false, function(source)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    local firstname = Player.PlayerData.charinfo.firstname
    local lastname = Player.PlayerData.charinfo.lastname
    local citizenid = Player.PlayerData.citizenid
    
    if RSGCore.Functions.HasPermission(src, permissions['adminremove']) or IsPlayerAceAllowed(src, 'command') then
       
        TriggerEvent('rsg-admin:server:getDbTables', src)
    else
        
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Access Denied',
            description = 'You do not have permission to use this command',
            type = 'error'
        })
    end
end)


RegisterNetEvent('rsg-admin:server:getDbTables')
AddEventHandler('rsg-admin:server:getDbTables', function(targetSrc)
    local src = targetSrc or source
    local Player = RSGCore.Functions.GetPlayer(src)
    
    
    if not (RSGCore.Functions.HasPermission(src, permissions['adminremove']) or IsPlayerAceAllowed(src, 'command')) then
        return
    end
    
    
    MySQL.Async.fetchAll('SHOW TABLES', {}, function(tables)
        if tables and #tables > 0 then
            local tableList = {}
            
            for i = 1, #tables do
                
                local tableName = tables[i][next(tables[i])]
                table.insert(tableList, tableName)
            end
            
            
            TriggerClientEvent('rsg-admin:client:showTableMenu', src, tableList)
        else
            TriggerClientEvent('ox_lib:notify', src, {
                title = 'Database Error',
                description = 'No database tables found',
                type = 'error'
            })
        end
    end)
end)


RegisterNetEvent('rsg-admin:server:getTableEntries')
AddEventHandler('rsg-admin:server:getTableEntries', function(tableName, playerCoords)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    
    
    if not (RSGCore.Functions.HasPermission(src, permissions['adminremove']) or IsPlayerAceAllowed(src, 'command')) then
        return
    end
    
    
    
   
    MySQL.Async.fetchAll("SHOW KEYS FROM " .. tableName .. " WHERE Key_name = 'PRIMARY'", {}, function(primaryKey)
        local idColumn = "id" -- Default id column name
        
        if primaryKey and #primaryKey > 0 then
            idColumn = primaryKey[1].Column_name
        end
        
        
        
        
        MySQL.Async.fetchAll("SELECT * FROM " .. tableName .. " LIMIT 1", {}, function(sampleData)
            
            if not sampleData or #sampleData == 0 then
                print("^3No sample data found, getting columns from table structure^7")
                MySQL.Async.fetchAll("DESCRIBE " .. tableName, {}, function(tableInfo)
                    local displayColumns = {}
                    local hasCharInfo = false
                    
                    
                    for _, column in ipairs(tableInfo) do
                        if column.Field == "charinfo" then
                            hasCharInfo = true
                            print("^2Found charinfo column in table structure^7")
                        end
                    end
                    
                   
                    if hasCharInfo then
                        table.insert(displayColumns, "charinfo")
                    end
                    
                    
                    local maxColumns = 8
                    
                    
                    for _, column in ipairs(tableInfo) do
                        local columnName = column.Field
                        if columnName ~= "charinfo" and (
                           columnName == idColumn or
                           columnName:lower():find("name") or 
                           columnName:lower():find("title") or 
                           columnName:lower():find("citizenid") or
                           columnName:lower():find("description") or 
                           columnName:lower():find("coords") or 
                           columnName:lower():find("location") or
                          
                           columnName:lower():find("type") or
                           columnName:lower():find("state") or
                           columnName:lower():find("status") or
                           columnName:lower():find("model")) then
                            table.insert(displayColumns, columnName)
                        end
                        
                        
                        if #displayColumns >= maxColumns then
                            break
                        end
                    end
                    
                   
                    if #displayColumns == 0 and #tableInfo > 0 then
                        for i = 1, math.min(maxColumns, #tableInfo) do
                            table.insert(displayColumns, tableInfo[i].Field)
                        end
                    end
                    
                    
                    
                    
                    MySQL.Async.fetchAll("SELECT * FROM " .. tableName .. " LIMIT 100", {}, function(results)
                        processAndSendResults(src, tableName, idColumn, displayColumns, results, hasCharInfo)
                    end)
                end)
            else
                
                local displayColumns = {}
                local allColumns = {}
                local hasCharInfo = false
                
                
                local maxColumns = 8
                
                
                for columnName, _ in pairs(sampleData[1]) do
                    table.insert(allColumns, columnName)
                    if columnName == "charinfo" then
                        hasCharInfo = true
                        print("^2Found charinfo column in sample data^7")
                    end
                end
                
               
                if hasCharInfo then
                    table.insert(displayColumns, "charinfo")
                end
                
                
                for _, columnName in ipairs(allColumns) do
                    if columnName ~= "charinfo" and (
                       columnName == idColumn or
                       columnName:lower():find("name") or 
                       columnName:lower():find("title") or 
                       columnName:lower():find("citizenid") or
                       columnName:lower():find("description") or
                       -- Additional column types that might be useful
                       columnName:lower():find("coords") or
                       columnName:lower():find("location") or
                       columnName:lower():find("type") or
                       columnName:lower():find("state") or
                       columnName:lower():find("status") or
                       columnName:lower():find("model")) then
                        table.insert(displayColumns, columnName)
                    end
                    
                   
                    if #displayColumns >= maxColumns then
                        break
                    end
                end
                
                
                if #displayColumns < maxColumns then
                    for _, columnName in ipairs(allColumns) do
                        if not table.contains(displayColumns, columnName) then
                            table.insert(displayColumns, columnName)
                        end
                        
                        if #displayColumns >= maxColumns then
                            break
                        end
                    end
                end
                
                
                
               
                MySQL.Async.fetchAll("SELECT * FROM " .. tableName .. " LIMIT 100", {}, function(results)
                    processAndSendResults(src, tableName, idColumn, displayColumns, results, hasCharInfo)
                end)
            end
        end)
    end)
end)


function processAndSendResults(src, tableName, idColumn, displayColumns, results, hasCharInfo)
    if not results or #results == 0 then
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'No Data',
            description = 'No entries found in table ' .. tableName,
            type = 'error'
        })
        return
    end
    
    
    
    
    if hasCharInfo then
       
        for i, entry in ipairs(results) do
            if entry.charinfo and type(entry.charinfo) == "string" then
                
                local success, decodedInfo = pcall(json.decode, entry.charinfo)
                if success and decodedInfo then
                    
                    local charInfoStr = ""
                    
                   
                    if decodedInfo.firstname and decodedInfo.lastname then
                        charInfoStr = decodedInfo.firstname .. " " .. decodedInfo.lastname
                    end
                    
                    
                    if charInfoStr ~= "" then
                        entry.charinfo_display = charInfoStr
                    else
                       
                        local fields = {}
                        for k, v in pairs(decodedInfo) do
                            if type(v) ~= "table" and k ~= "account" and k ~= "phone" then
                                table.insert(fields, k .. ": " .. tostring(v))
                            end
                        end
                        
                        if #fields > 0 then
                            entry.charinfo_display = table.concat(fields, ", ")
                        else
                            entry.charinfo_display = "Character Data"
                        end
                    end
                    
                    
                    if i <= 3 then
                        print("^2Entry " .. i .. " charinfo_display: " .. entry.charinfo_display .. "^7")
                    end
                else
                    
                    entry.charinfo_display = "Invalid Character Info"
                end
            else
                entry.charinfo_display = "No Character Info"
            end
        end
        
        
        for i, column in ipairs(displayColumns) do
            if column == "charinfo" then
                displayColumns[i] = "charinfo_display"
                break
            end
        end
    end
    
   
    for i, entry in ipairs(results) do
        
        local coordsData = DetectCoordinates(entry)
        if coordsData then
            
            entry.has_coords = true
            
            entry.parsed_coords = coordsData
            
            if i <= 3 and coordsData then
                print("^2Entry " .. i .. " has coordinates - adding teleport option^7")
            end
        end
    end
    
    
    TriggerClientEvent('rsg-admin:client:showTableEntries', src, tableName, idColumn, displayColumns, results)
end


RegisterNetEvent('rsg-admin:server:teleportToTableEntry')
AddEventHandler('rsg-admin:server:teleportToTableEntry', function(tableName, entryId, coords)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    
   
    if not (RSGCore.Functions.HasPermission(src, permissions['adminremove']) or IsPlayerAceAllowed(src, 'command')) then
        return
    end
    
    
    local firstname = Player.PlayerData.charinfo.firstname
    local lastname = Player.PlayerData.charinfo.lastname
    local citizenid = Player.PlayerData.citizenid
    
    
    TriggerClientEvent('rsg-admin:client:teleportToLocation', src, coords)
end)


function table.contains(table, element)
    for _, value in pairs(table) do
        if value == element then
            return true
        end
    end
    return false
end

RegisterNetEvent('rsg-admin:server:deleteTableEntry')
AddEventHandler('rsg-admin:server:deleteTableEntry', function(tableName, idColumn, entryId, restartResource)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    
    
    if not (RSGCore.Functions.HasPermission(src, permissions['adminremove']) or IsPlayerAceAllowed(src, 'command')) then
        return
    end
    
    local firstname = Player.PlayerData.charinfo.firstname
    local lastname = Player.PlayerData.charinfo.lastname
    local citizenid = Player.PlayerData.citizenid
    
    
    MySQL.Async.execute('DELETE FROM ' .. tableName .. ' WHERE ' .. idColumn .. ' = ?', {entryId}, function(rowsChanged)
        if rowsChanged > 0 then
            TriggerClientEvent('ox_lib:notify', src, {
                title = 'Success',
                description = 'Entry deleted successfully',
                type = 'success'
            })
            
            
            if restartResource then
                TriggerClientEvent('rsg-admin:client:showRestartMenu', src)
            else
                
                MySQL.Async.fetchAll("SELECT * FROM " .. tableName .. " LIMIT 100", {}, function(results)
                    
                    MySQL.Async.fetchAll("DESCRIBE " .. tableName, {}, function(tableInfo)
                        local displayColumns = {}
                        local hasCharInfo = false
                        
                        
                        for _, column in ipairs(tableInfo) do
                            if column.Field == "charinfo" then
                                hasCharInfo = true
                                table.insert(displayColumns, "charinfo")
                                break
                            end
                        end
                        
                        
                        local maxColumns = 8
                        
                        
                        for _, column in ipairs(tableInfo) do
                            local columnName = column.Field
                            if columnName ~= "charinfo" and (
                               columnName == idColumn or
                               columnName:lower():find("name") or 
                               columnName:lower():find("title") or 
                               columnName:lower():find("citizenid") or
                               columnName:lower():find("description") or 
                               columnName:lower():find("coords") or 
                               columnName:lower():find("location") or
                               -- Additional column types that might be useful
                               columnName:lower():find("type") or
                               columnName:lower():find("state") or
                               columnName:lower():find("status") or
                               columnName:lower():find("model")) then
                                table.insert(displayColumns, columnName)
                            end
                            
                            
                            if #displayColumns >= maxColumns then
                                break
                            end
                        end
                        
                        
                        processAndSendResults(src, tableName, idColumn, displayColumns, results, hasCharInfo)
                    end)
                end)
            end
        else
            TriggerClientEvent('ox_lib:notify', src, {
                title = 'Error',
                description = 'Failed to delete entry',
                type = 'error'
            })
        end
    end)
end)

RegisterNetEvent('rsg-admin:server:restartResource')
AddEventHandler('rsg-admin:server:restartResource', function(resourceName)
    local src = source
    local Player = RSGCore.Functions.GetPlayer(src)
    
    
    if not (RSGCore.Functions.HasPermission(src, permissions['adminremove']) or IsPlayerAceAllowed(src, 'command')) then
        return
    end
    
    
    local firstname = Player.PlayerData.charinfo.firstname
    local lastname = Player.PlayerData.charinfo.lastname
    local citizenid = Player.PlayerData.citizenid
    
    
    if GetResourceState(resourceName) == "missing" then
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Resource Error',
            description = 'Resource ' .. resourceName .. ' does not exist',
            type = 'error'
        })
        return
    end
    
    
    TriggerClientEvent('ox_lib:notify', src, {
        title = 'Restarting Resource',
        description = 'Restarting ' .. resourceName .. '...',
        type = 'info'
    })
    
    
    StopResource(resourceName)
    
    
    Citizen.SetTimeout(1000, function()
      
        StartResource(resourceName)
        
       
        TriggerClientEvent('ox_lib:notify', src, {
            title = 'Success',
            description = 'Resource ' .. resourceName .. ' restarted',
            type = 'success'
        })
        
        
    end)
end)

