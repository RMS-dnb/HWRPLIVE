
local RSGCore = exports['rsg-core']:GetCoreObject()


function TeleportToCoords(coords)
    if type(coords) ~= "vector3" and type(coords) ~= "table" then
        print("^1Error: Invalid coordinates format^7")
        return false
    end
    
    local x, y, z
    if type(coords) == "vector3" then
        x, y, z = coords.x, coords.y, coords.z
    else
        x, y, z = coords.x or coords[1], coords.y or coords[2], coords.z or coords[3]
    end
    
    
    if not x or not y or not z or 
       type(x) ~= "number" or type(y) ~= "number" or type(z) ~= "number" then
        print("^1Error: Coordinates must be numbers^7")
        return false
    end
    
    
    local playerPed = PlayerPedId()
    SetEntityCoords(playerPed, x, y, z, false, false, false, false)
    return true
end



RegisterNetEvent('rsg-admin:client:showRestartMenu')
AddEventHandler('rsg-admin:client:showRestartMenu', function()
    
    local resources = {}
    local resourceCount = GetNumResources()
    
    for i = 0, resourceCount - 1 do
        local resourceName = GetResourceByFindIndex(i)
        if resourceName ~= nil then
            table.insert(resources, resourceName)
        end
    end
    
    
    table.sort(resources)
    
    
    local filteredResources = {}
    local commonPrefixes = {
        'rsg-', -- RSG Core resources
        'ox-',  -- ox_ resources
    }
    
    
    for _, resourceName in ipairs(resources) do
        for _, prefix in ipairs(commonPrefixes) do
            if string.find(resourceName, prefix) then
                table.insert(filteredResources, {
                    title = resourceName,
                    description = 'Restart this resource',
                    icon = 'refresh',
                    onSelect = function()
                        TriggerServerEvent('rsg-admin:server:restartResource', resourceName)
                    end
                })
                break
            end
        end
    end
    
    
    table.insert(filteredResources, 1, {
        title = 'Search Resources',
        description = 'Type to search for a specific resource',
        icon = 'magnifying-glass',
        onSelect = function()
            local input = exports['ox_lib']:inputDialog('Search Resources', {
                { type = 'input', label = 'Resource Name', placeholder = 'Enter resource name...' }
            })
            
            if input and input[1] and string.len(input[1]) > 0 then
                local searchTerm = string.lower(input[1])
                local searchResults = {}
                
                for _, resourceName in ipairs(resources) do
                    if string.find(string.lower(resourceName), searchTerm) then
                        table.insert(searchResults, {
                            title = resourceName,
                            description = 'Restart this resource',
                            icon = 'refresh',
                            onSelect = function()
                                TriggerServerEvent('rsg-admin:server:restartResource', resourceName)
                            end
                        })
                    end
                end
                
                if #searchResults > 0 then
                    -- Add back button
                    table.insert(searchResults, {
                        title = 'Back to Resource List',
                        description = 'Return to the filtered resource list',
                        icon = 'arrow-left',
                        onSelect = function()
                            exports['ox_lib']:showContext('restart_resource_menu')
                        end
                    })
                    
                    
                    exports['ox_lib']:registerContext({
                        id = 'search_results_menu',
                        title = 'Search Results',
                        options = searchResults
                    })
                    
                    exports['ox_lib']:showContext('search_results_menu')
                else
                    
                    exports['ox_lib']:notify({
                        title = 'No Results',
                        description = 'No resources matching "' .. input[1] .. '" found',
                        type = 'error'
                    })
                    
                    
                    exports['ox_lib']:showContext('restart_resource_menu')
                end
            else
                
                exports['ox_lib']:showContext('restart_resource_menu')
            end
        end
    })
    
    
    table.insert(filteredResources, {
        title = 'Cancel',
        description = 'Return to database menu',
        icon = 'x',
        onSelect = function()
            -- Trigger refresh of current view
            TriggerServerEvent('rsg-admin:server:getDbTables')
        end
    })
    
   
    exports['ox_lib']:registerContext({
        id = 'restart_resource_menu',
        title = 'Restart Resource',
        options = filteredResources
    })
    
    exports['ox_lib']:showContext('restart_resource_menu')
end)


RegisterNetEvent('rsg-admin:client:teleportToLocation')
AddEventHandler('rsg-admin:client:teleportToLocation', function(coordsData)
    print("^2Received teleport coordinates^7")
    
    
    local coords = nil
    
    
    if type(coordsData) == "vector3" then
        coords = coordsData
    
    elseif type(coordsData) == "table" and coordsData.x and coordsData.y and coordsData.z then
        coords = vector3(coordsData.x, coordsData.y, coordsData.z)
    
    elseif type(coordsData) == "string" then
       
        local success, decodedCoords = pcall(json.decode, coordsData)
        if success and decodedCoords then
            
            if decodedCoords.x and decodedCoords.y and decodedCoords.z then
                coords = vector3(decodedCoords.x, decodedCoords.y, decodedCoords.z)
            elseif decodedCoords[1] and decodedCoords[2] and decodedCoords[3] then
                coords = vector3(decodedCoords[1], decodedCoords[2], decodedCoords[3])
            end
        end
    end
    
    if coords then
        -- Execute teleport
        local success = TeleportToCoords(coords)
        if success then
            -- Show success notification
            exports['ox_lib']:notify({
                title = 'Teleported',
                description = 'Successfully teleported to location',
                type = 'success'
            })
        else
            -- Show error notification
            exports['ox_lib']:notify({
                title = 'Failed',
                description = 'Failed to teleport to location',
                type = 'error'
            })
        end
    else
        -- Show error notification
        exports['ox_lib']:notify({
            title = 'Invalid Coordinates',
            description = 'Could not parse coordinates data',
            type = 'error'
        })
    end
end)

RegisterNetEvent('rsg-admin:client:showTableMenu')
AddEventHandler('rsg-admin:client:showTableMenu', function(tableList)
    
    if not tableList or #tableList == 0 then
        print("^1Error: Table list is nil or empty^7")
        return
    end
    
    local tableOptions = {}
    
    
    table.insert(tableOptions, {
        title = 'Restart Resource',
        description = 'Restart a resource from the list',
        icon = 'refresh',
        iconColor = '#FFA500',
        onSelect = function()
            TriggerEvent('rsg-admin:client:showRestartMenu')
        end
    })
    
   
    table.sort(tableList)
    
   
    for i, tableName in ipairs(tableList) do
        table.insert(tableOptions, {
            title = tableName,
            description = 'View and manage entries in this table',
            icon = 'database',
            onSelect = function()
                -- Get player coordinates
                local playerCoords = GetEntityCoords(PlayerPedId())
                TriggerServerEvent('rsg-admin:server:getTableEntries', tableName, playerCoords)
            end
        })
    end
    
   
    table.insert(tableOptions, {
        title = 'Close Menu',
        description = 'Exit the database management system',
        icon = 'x'
    })
    
    
    
    
    exports['ox_lib']:registerContext({
        id = 'db_tables_menu',
        title = 'Database Tables',
        options = tableOptions
    })
    
    exports['ox_lib']:showContext('db_tables_menu')
end)

RegisterNetEvent('rsg-admin:client:showTableEntries')
AddEventHandler('rsg-admin:client:showTableEntries', function(tableName, idColumn, displayColumns, entries)
    
    if not tableName or not idColumn or not displayColumns or not entries then
       
        if not tableName then print("tableName is nil") end
        if not idColumn then print("idColumn is nil") end
        if not displayColumns then print("displayColumns is nil") end
        if not entries then print("entries is nil") end
        return
    end
    
    if #entries == 0 then
        print("^3Warning: No entries found in table " .. tableName .. "^7")
    end
    
    
    if #entries > 0 then
        print("^2Sample entry data:^7")
        for k, v in pairs(entries[1]) do
            if type(v) ~= "table" then
                print("  " .. k .. ": " .. tostring(v))
            else
                print("  " .. k .. ": [table]")
            end
        end
    end
    
    local entryOptions = {}
    
   
    for i, entry in ipairs(entries) do
        local entryId = entry[idColumn]
        
        
        if i <= 3 then
            print("^2Processing entry " .. i .. " (ID: " .. tostring(entryId) .. ")^7")
        end
        
        
        local displayInfo = ""
        local descriptionInfo = ""
        
       
        if entry.charinfo_display then
            displayInfo = tostring(entry.charinfo_display)
            if i <= 3 then
                print("^2Using charinfo_display for title: " .. displayInfo .. "^7")
            end
        end
        
       
        for j, column in ipairs(displayColumns) do
            local value = entry[column] or "N/A"
            
            if type(value) == "table" then
                value = json.encode(value)
            end
            
           
            if type(value) == "string" and string.len(value) > 30 then
                value = string.sub(value, 1, 27) .. "..."
            end
            
            
            if column == "charinfo_display" and displayInfo == tostring(value) then
                
            elseif displayInfo == "" and j == 1 and column ~= idColumn then
                
                displayInfo = tostring(value)
            else
                
                if column ~= idColumn then
                    if descriptionInfo ~= "" then
                        descriptionInfo = descriptionInfo .. " | "
                    end
                    descriptionInfo = descriptionInfo .. column .. ": " .. tostring(value)
                end
            end
        end
        
        
        if displayInfo == "" then
            displayInfo = "ID: " .. tostring(entryId)
        end
        
        
        if i <= 3 then
            print("^2Final display info: " .. displayInfo .. "^7")
            print("^2Description info: " .. descriptionInfo .. "^7")
        end
        
        
        local entrySubOptions = {
            {
				title = 'Delete Entry',
				description = 'Permanently delete this entry (ID: ' .. tostring(entryId) .. ')',
				icon = 'trash',
				iconColor = '#FF0000',
				onSelect = function()
					TriggerServerEvent('rsg-admin:server:deleteTableEntry', tableName, idColumn, entryId, false)
				end
			},
			{
				title = 'Delete Entry & Restart Resource',
				description = 'Delete entry and restart a resource',
				icon = 'rotate',
				iconColor = '#FFA500',
				onSelect = function()
					TriggerServerEvent('rsg-admin:server:deleteTableEntry', tableName, idColumn, entryId, true)
				end
			}
        }
        
       
        if entry.has_coords and entry.parsed_coords then
            table.insert(entrySubOptions, {
                title = 'Teleport',
                description = 'Teleport to this location',
                icon = 'location-dot',
                iconColor = '#00FF00',
                onSelect = function()
                    TriggerServerEvent('rsg-admin:server:teleportToTableEntry', tableName, entryId, entry.parsed_coords)
                end
            })
        end
        
        
        table.insert(entrySubOptions, {
            title = 'Cancel',
            description = 'Return to entries list',
            icon = 'arrow-left'
        })
        
        
        table.insert(entryOptions, {
            title = displayInfo,
            description = "ID: " .. tostring(entryId) .. (descriptionInfo ~= "" and " | " .. descriptionInfo or ""),
            icon = entry.has_coords and 'location-dot' or 'database',
            iconColor = entry.has_coords and '#00FF00' or '#FFFFFF',
            onSelect = function()
                
                exports['ox_lib']:registerContext({
                    id = 'entry_action_menu',
                    title = 'Entry Actions',
                    menu = 'table_entries_menu',
                    options = entrySubOptions
                })
                
                exports['ox_lib']:showContext('entry_action_menu')
            end
        })
    end
    
    
    table.insert(entryOptions, {
        title = 'Back to Tables',
        description = 'Return to database tables list',
        icon = 'arrow-left',
        onSelect = function()
            TriggerServerEvent('rsg-admin:server:getDbTables')
        end
    })
    
   
    
   
    exports['ox_lib']:registerContext({
        id = 'table_entries_menu',
        title = tableName .. ' Entries (' .. #entries .. ')',
        options = entryOptions
    })
    
    exports['ox_lib']:showContext('table_entries_menu')
end)

RegisterNetEvent('rsg-admin:client:getPlayerPosition')
AddEventHandler('rsg-admin:client:getPlayerPosition', function(radius)
    local playerCoords = GetEntityCoords(PlayerPedId())
    TriggerServerEvent('rsg-admin:server:checkProximity', playerCoords, radius)
end)


local activeBlips = {}

function ClearProximityBlips()
    
    for _, blip in ipairs(activeBlips) do
        RemoveBlip(blip)
    end
    activeBlips = {}
end

function CreateEntityBlips(entities)
   
    ClearProximityBlips()
    
    
    for _, entity in ipairs(entities) do
        local coords = entity.coords
        local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
        
        SetBlipSprite(blip, 1) -- Adjust sprite as needed
        SetBlipColour(blip, 47) -- Light blue
        SetBlipScale(blip, 0.8)
        SetBlipAsShortRange(blip, true)
        
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentString(entity.tableName .. ": " .. entity.name)
        EndTextCommandSetBlipName(blip)
        
        table.insert(activeBlips, blip)
    end
end


RegisterNetEvent('rsg-admin:client:showProximityResults')
AddEventHandler('rsg-admin:client:showProximityResults', function(entities, radius)
    
    ClearProximityBlips()
    
    
    if #entities > 0 then
        CreateEntityBlips(entities)
    end
    
    
    local tableGroups = {}
    for _, entity in ipairs(entities) do
        if not tableGroups[entity.tableName] then
            tableGroups[entity.tableName] = {
                count = 0,
                entities = {}
            }
        end
        
        tableGroups[entity.tableName].count = tableGroups[entity.tableName].count + 1
        table.insert(tableGroups[entity.tableName].entities, entity)
    end
    
    local menuOptions = {}
    
    
    table.insert(menuOptions, {
        title = 'Nearby Entities (' .. #entities .. ' found)',
        description = 'Showing entities within ' .. radius .. ' units',
        icon = 'radar',
        disabled = true
    })
    
    
    for tableName, group in pairs(tableGroups) do
        table.insert(menuOptions, {
            title = tableName .. ' (' .. group.count .. ')',
            description = 'View entities from this table',
            icon = 'table',
            menu = 'proximity_results_menu',
            onSelect = function()
                
                local entityOptions = {}
                
                for _, entity in ipairs(group.entities) do
                    table.insert(entityOptions, {
                        title = entity.name,
                        description = 'ID: ' .. entity.id .. ' | Distance: ' .. entity.distance,
                        icon = 'location-dot',
                        iconColor = '#00FF00',
                        onSelect = function()
                           
                            exports['ox_lib']:registerContext({
                                id = 'entity_action_menu',
                                title = 'Entity Actions',
                                menu = 'table_entities_menu',
                                options = {
                                    {
                                        title = 'Teleport to Entity',
                                        description = 'Teleport to this entity location',
                                        icon = 'location-dot',
                                        iconColor = '#00FF00',
                                        onSelect = function()
                                            TriggerServerEvent('rsg-admin:server:teleportToTableEntry', tableName, entity.id, entity.coords)
                                        end
                                    },
                                    {
                                        title = 'Delete Entity',
                                        description = 'Permanently delete this entity',
                                        icon = 'trash',
                                        iconColor = '#FF0000',
                                        onSelect = function()
                                            TriggerServerEvent('rsg-admin:server:deleteProximityEntity', tableName, entity.idColumn, entity.id, entity.coords)
                                        end
                                    },
                                    {
                                        title = 'Back',
                                        description = 'Return to entity list',
                                        icon = 'arrow-left'
                                    }
                                }
                            })
                            
                            exports['ox_lib']:showContext('entity_action_menu')
                        end
                    })
                end
                
                
                table.insert(entityOptions, {
                    title = 'Back to Tables',
                    description = 'Return to table groups',
                    icon = 'arrow-left',
                    menu = 'proximity_results_menu'
                })
                
                
                exports['ox_lib']:registerContext({
                    id = 'table_entities_menu',
                    title = tableName .. ' Entities',
                    menu = 'proximity_results_menu',
                    options = entityOptions
                })
                
                exports['ox_lib']:showContext('table_entities_menu')
            end
        })
    end
    
    
    table.insert(menuOptions, {
        title = 'Change Search Radius',
        description = 'Adjust the proximity search radius',
        icon = 'circle-dot',
        onSelect = function()
            local input = exports['ox_lib']:inputDialog('Set Search Radius', {
                { type = 'number', label = 'Radius', default = radius, min = 1, max = 100 }
            })
            
            if input and input[1] then
                local newRadius = math.max(1, math.min(100, tonumber(input[1]) or 10))
                TriggerEvent('rsg-admin:client:getPlayerPosition', newRadius)
            end
        end
    })
    
    
    table.insert(menuOptions, {
        title = 'Clear Visual Markers',
        description = 'Remove all entity markers from the map',
        icon = 'eye-slash',
        onSelect = function()
            ClearProximityBlips()
            exports['ox_lib']:showContext('proximity_results_menu')
        end
    })
    
   
    table.insert(menuOptions, {
        title = 'Back to Database',
        description = 'Return to database tables list',
        icon = 'database',
        onSelect = function()
            ClearProximityBlips()
            TriggerServerEvent('rsg-admin:server:getDbTables')
        end
    })
    
    
    exports['ox_lib']:registerContext({
        id = 'proximity_results_menu',
        title = 'Proximity Results',
        options = menuOptions
    })
    
    exports['ox_lib']:showContext('proximity_results_menu')
end)
