local RSGCore = exports['rsg-core']:GetCoreObject()
local reportCooldowns = {}
local checkWantedPlayersThread = nil
local detectedPlayers = {} 
local IMMEDIATE_VICINITY = 5.0 
local COOLDOWN_TIME = 30000 

RegisterNetEvent('medics-tips:client:addActivityBlip')
AddEventHandler('medics-tips:client:addActivityBlip', function(data)
    local blip = Citizen.InvokeNative(0x45F13B7E0A15C880, 
        -1282792512, 
        data.coords.x, 
        data.coords.y, 
        data.coords.z, 
        100.0
    )
    
    Citizen.InvokeNative(0x662D364ABF16DE2A, blip, 0xFF0000FF)
    
    local blipName = string.format("%s - %s (%s)", data.location, data.activityType, data.timestamp or "Recent")
    print("[DEBUG] Blip name set to: " .. blipName) -- Debug blip name
    Citizen.InvokeNative(0x9CB1A1623062F402, blip, blipName)
    
    Citizen.CreateThread(function()
        Citizen.Wait(30000)
        if DoesBlipExist(blip) then
            RemoveBlip(blip)
        end
    end)
end)

RegisterNetEvent('medics-tips:client:removeActivityBlip')
AddEventHandler('medics-tips:client:removeActivityBlip', function(coords)
    local blip = GetBlipFromCoords(coords.x, coords.y, coords.z)
    if DoesBlipExist(blip) then
        RemoveBlip(blip)
    end
end)

function GetBlipFromCoords(x, y, z)
    local blip = Citizen.InvokeNative(0x554D9D53F696D002, -1282792512) -- GetFirstBlipInfoId equivalent (BLIP_STYLE_RADIUS)
    local targetCoords = vector3(x, y, z)
    
    while DoesBlipExist(blip) do
        local blipCoords = GetBlipCoords(blip)
        if #(targetCoords - blipCoords) < 1.0 then
           
            return blip
        end
        blip = Citizen.InvokeNative(0xA6F67BEC53379A42, -1282792512, blip) -- GetNextBlipInfoId equivalent
        if blip == 0 then -- Check for end of blip list
            break
        end
    end
    
    
    return nil
end


local function isLawmanOrBountyHunter()
    local PlayerData = RSGCore.Functions.GetPlayerData()
    
    return PlayerData.job and (Config.LawmenJobs[PlayerData.job.name] or PlayerData.job.name == "bountyhunter")
end

local function isLawman()
    local PlayerData = RSGCore.Functions.GetPlayerData()
    return PlayerData.job and Config.LawmenJobs[PlayerData.job.name]
end

local function formatTimestamp(timestamp)
    
    return timestamp or "Unknown time"
end

local function openCriminalActivityMenu()
    if not isLawman() then
        TriggerEvent('ox_lib:notify', { 
            title = 'Access Denied', 
            description = 'Only medics can access this menu.', 
            type = 'error' 
        })
        return
    end
    
    lib.callback('medics-tips:getActivities', false, function(activities)
        if not activities then
            
            return
        end
       
        
        local menuOptions = {}
        
        -- table.insert(menuOptions, {
        --     title = 'Add Wanted Player',
        --     icon = 'user-plus',
        --     onSelect = function()
        --         lib.callback('medics-tips:getOnlinePlayers', false, function(players)
        --             if not players or #players == 0 then
        --                 TriggerEvent('ox_lib:notify', { title = 'No Players', description = 'No other players online.', type = 'info' })
        --                 return
        --             end
                    
        --             local playerOptions = {}
        --             for _, player in ipairs(players) do
        --                 table.insert(playerOptions, {
        --                     title = player.charName,
        --                     description = 'Citizen ID: ' .. player.citizenid,
        --                     onSelect = function()
        --                         local input = lib.inputDialog('Warrant Details', {
        --                             {type = 'input', label = 'Crime', required = true},
        --                             {type = 'number', label = 'Bounty Amount ($)', required = true, min = 1}
        --                         })
        --                         if input then
        --                             TriggerServerEvent('medics-tips:server:addWantedPlayer', player.serverId, input[1], input[2])
        --                             TriggerEvent('ox_lib:notify', { title = 'Success', description = player.charName .. ' added to wanted list.', type = 'success' })
        --                         end
        --                     end
        --                 })
        --             end
                    
        --             lib.registerContext({
        --                 id = 'medic_player_menu',
        --                 title = 'Select Player to Add',
        --                 options = playerOptions
        --             })
        --             lib.showContext('medic_player_menu')
        --         end)
        --     end
        -- })
        
        if activities and #activities > 0 then
            for _, activity in ipairs(activities) do
                local location = activity.location or "Unknown Location"
                local formattedTime = activity.formattedTimestamp or "Recent" -- Use server-formatted timestamp
                local coords = activity.coords and json.decode(activity.coords) or nil
                
                table.insert(menuOptions, {
                    title = location,
                    description = ('%s\nReported: %s'):format(activity.activityType, formattedTime),
                    icon = 'exclamation-triangle',
                    onSelect = function()
                        local submenuOptions = {
                            {
                                title = 'Delete Report',
                                icon = 'trash',
                                onSelect = function()
                                    lib.callback('medics-tips:deleteActivity', false, function(success)
                                        if success then
                                            TriggerEvent('ox_lib:notify', { 
                                                title = 'Success', 
                                                description = 'Report deleted successfully.', 
                                                type = 'success' 
                                            })
                                            openCriminalActivityMenu()
                                        else
                                            TriggerEvent('ox_lib:notify', { 
                                                title = 'Error', 
                                                description = 'Failed to delete report.', 
                                                type = 'error' 
                                            })
                                        end
                                    end, activity.id)
                                end
                            }
                        }
                        
                        if coords then
                            table.insert(submenuOptions, {
                                title = 'Show on Map',
                                icon = 'map',
                                onSelect = function()
                                    local blipData = {
                                        coords = coords,
                                        location = location,
                                        activityType = activity.activityType,
                                        timestamp = formattedTime -- Use server-formatted timestamp
                                    }
                                    TriggerEvent('medics-tips:client:addActivityBlip', blipData)
                                    TriggerEvent('ox_lib:notify', { 
                                        title = 'Map Updated', 
                                        description = 'Activity location marked on your map for 30 seconds.', 
                                        type = 'info' 
                                    })
                                end
                            })
                        end
                        
                        lib.registerContext({
                            id = 'activity_submenu_' .. activity.id,
                            title = 'Civilian needs help in ' .. location,
                            options = submenuOptions
                        })
                        lib.showContext('activity_submenu_' .. activity.id)
                    end
                })
            end
        end
        
        lib.registerContext({
            id = 'medic_activity_menu',
            title = 'Medical Reports',
            options = menuOptions
        })
        lib.showContext('medic_activity_menu')
    end)
end


-- local function openBountyBoard()
--     if not isLawmanOrBountyHunter() then
--         TriggerEvent('ox_lib:notify', { title = 'Access Denied', description = 'Only lawmen and bounty hunters can access this menu.', type = 'error' })
--         return
--     end
    
--     lib.callback('medics-tips:getWantedPlayers', false, function(wantedPlayers)
--         if not wantedPlayers then
--             print("[BountyBoard] Error: getWantedPlayers returned nil")
--             TriggerEvent('ox_lib:notify', { title = 'Error', description = 'Failed to load bounty board.', type = 'error' })
--             return
--         end
        
--         if #wantedPlayers == 0 then
--             TriggerEvent('ox_lib:notify', { title = 'No Data', description = 'No wanted players currently.', type = 'info' })
--             return
--         end
        
--         local bountyOptions = {}
--         for _, wanted in ipairs(wantedPlayers) do
--             table.insert(bountyOptions, {
--                 title = wanted.charName or "Unknown",
--                 description = string.format('Crime: %s\nBounty: $%d\nAdded: %s', 
--                     wanted.crime or "Unknown",
--                     wanted.bounty or 0,
--                     formatTimestamp(wanted.timestamp)
--                 ),
--                 icon = 'skull-crossbones',
--                 onSelect = function()
--                     lib.registerContext({
--                         id = 'bounty_submenu_' .. (wanted.citizenid or "unknown"),
--                         title = 'Bounty: ' .. (wanted.charName or "Unknown"),
--                         options = {
--                             {
--                                 title = 'Remove Bounty',
--                                 icon = 'trash',
--                                 onSelect = function()
--                                     lib.callback('medics-tips:removeWantedPlayer', false, function(success)
--                                         if success then
--                                             TriggerEvent('ox_lib:notify', { title = 'Success', description = 'Bounty removed.', type = 'success' })
--                                             openBountyBoard()
--                                         else
--                                             TriggerEvent('ox_lib:notify', { title = 'Error', description = 'Failed to remove bounty. You are not a lawman.', type = 'error' })
--                                         end
--                                     end, wanted.citizenid)
--                                 end
--                             }
--                         }
--                     })
--                     lib.showContext('bounty_submenu_' .. (wanted.citizenid or "unknown"))
--                 end
--             })
--         end
        
--         lib.registerContext({
--             id = 'bounty_board_menu',
--             title = 'Bounty Board',
--             options = bountyOptions
--         })
--         lib.showContext('bounty_board_menu')
--     end)
-- end
-- local function openBountyBoard()
--     if not isLawmanOrBountyHunter() then
--         TriggerEvent('ox_lib:notify', { title = 'Access Denied', description = 'Only lawmen and bounty hunters can access this menu.', type = 'error' })
--         return
--     end
    
--     lib.callback('medics-tips:getWantedPlayers', false, function(wantedPlayers)
--         if not wantedPlayers then
--             print("[BountyBoard] Error: getWantedPlayers returned nil")
--             TriggerEvent('ox_lib:notify', { title = 'Error', description = 'Failed to load bounty board.', type = 'error' })
--             return
--         end
        
--         if #wantedPlayers == 0 then
--             TriggerEvent('ox_lib:notify', { title = 'No Data', description = 'No wanted players currently.', type = 'info' })
--             return
--         end
        
--         local bountyOptions = {}
--         for i, wanted in ipairs(wantedPlayers) do
--             table.insert(bountyOptions, {
--                 title = string.format("Wanted Criminal #%d", i),
--                 description = string.format('Crime: %s\nBounty: $%d\nAdded: %s', 
--                     wanted.crime or "Unknown",
--                     wanted.bounty or 0,
--                     formatTimestamp(wanted.timestamp)
--                 ),
--                 icon = 'skull-crossbones',
--                 onSelect = function()
--                     lib.registerContext({
--                         id = 'bounty_submenu_' .. (wanted.citizenid or "unknown"),
--                         title = string.format('Bounty: Criminal #%d', i),
--                         options = {
--                             {
--                                 title = 'Remove Bounty',
--                                 icon = 'trash',
--                                 onSelect = function()
--                                     lib.callback('medics-tips:removeWantedPlayer', false, function(success)
--                                         if success then
--                                             TriggerEvent('ox_lib:notify', { title = 'Success', description = 'Bounty removed.', type = 'success' })
--                                             openBountyBoard()
--                                         else
--                                             TriggerEvent('ox_lib:notify', { title = 'Error', description = 'Failed to remove bounty. You are not a lawman.', type = 'error' })
--                                         end
--                                     end, wanted.citizenid)
--                                 end
--                             }
--                         }
--                     })
--                     lib.showContext('bounty_submenu_' .. (wanted.citizenid or "unknown"))
--                 end
--             })
--         end
        
--         lib.registerContext({
--             id = 'bounty_board_menu',
--             title = 'Bounty Board',
--             options = bountyOptions
--         })
--         lib.showContext('bounty_board_menu')
--     end)
-- end



-- local function checkWantedPlayers()
--     if checkWantedPlayersThread then return end
    
--     checkWantedPlayersThread = Citizen.CreateThread(function()
--         print("checkWantedPlayers thread started")
--         while true do 
--             if not isLawmanOrBountyHunter() then
                
--                 detectedPlayers = {}
--                 Wait(5000) 
--             else
--                 local playerPed = PlayerPedId()
--                 local playerCoords = GetEntityCoords(playerPed)
--                 local nearbyPlayers = GetActivePlayers()
                
--                 lib.callback('medics-tips:getWantedPlayers', false, function(wantedPlayers)
--                     if wantedPlayers and #wantedPlayers > 0 then
--                         local currentTime = GetGameTimer()
                        
--                         for _, playerId in ipairs(nearbyPlayers) do
--                             local targetPed = GetPlayerPed(playerId)
--                             if DoesEntityExist(targetPed) and targetPed ~= playerPed then
--                                 local targetServerId = GetPlayerServerId(playerId)
--                                 local targetCoords = GetEntityCoords(targetPed)
--                                 local distance = #(playerCoords - targetCoords)
                                
                                
--                                 local isWanted = false
--                                 local wantedData = nil
--                                 for _, wanted in ipairs(wantedPlayers) do
--                                     if wanted.serverId and wanted.serverId == targetServerId then
--                                         isWanted = true
--                                         wantedData = wanted
--                                         break
--                                     end
--                                 end
                                
--                                 if isWanted and distance < 80.0 then
                                   
--                                     if distance <= IMMEDIATE_VICINITY then
                                        
--                                         if not detectedPlayers[targetServerId] or detectedPlayers[targetServerId].notifiedClose ~= true then
--                                             lib.notify({
--                                                 title = "Wanted Criminal Apprehended",
--                                                 description = string.format('You are with %s, wanted for: %s\nBounty: $%d', 
--                                                     wantedData.charName, 
--                                                     wantedData.crime, 
--                                                     wantedData.bounty
--                                                 ),
--                                                 type = "success",
--                                                 duration = 6000,
--                                                 position = 'top'
--                                             })
                                            
                                            
--                                             detectedPlayers[targetServerId] = detectedPlayers[targetServerId] or {}
--                                             detectedPlayers[targetServerId].lastNotify = currentTime
--                                             detectedPlayers[targetServerId].notifiedClose = true
--                                         end
--                                     else
                                        
--                                         local notificationInterval
--                                         if distance < 20.0 then
--                                             notificationInterval = 3000 
--                                         elseif distance < 40.0 then
--                                             notificationInterval = 6000 
--                                         else
--                                             notificationInterval = 12000 
--                                         end
                                        
                                        
--                                         if not detectedPlayers[targetServerId] then
--                                             detectedPlayers[targetServerId] = {
--                                                 lastNotify = 0,
--                                                 notifiedClose = false
--                                             }
--                                         end
                                        
                                        
--                                         if (currentTime - detectedPlayers[targetServerId].lastNotify) > notificationInterval then
                                            
--                                             if detectedPlayers[targetServerId].notifiedClose then
--                                                 detectedPlayers[targetServerId].notifiedClose = false
--                                             end
                                            
                                            
--                                             local notifyTitle = "Wanted Criminal Nearby"
--                                             local notifyType = "warning"
                                            
--                                             if distance < 20.0 then
--                                                 notifyTitle = "⚠️ WANTED CRIMINAL VERY CLOSE ⚠️"
--                                                 notifyType = "error" -- More urgent color
--                                             end
                                            
--                                             lib.notify({
--                                                 title = notifyTitle,
--                                                 description = string.format('%s - Wanted for: %s\nBounty: $%d\nDistance: ~%d meters', 
--                                                     wantedData.charName, 
--                                                     wantedData.crime, 
--                                                     wantedData.bounty,
--                                                     math.floor(distance)
--                                                 ),
--                                                 type = notifyType,
--                                                 duration = 6000,
--                                                 position = 'top'
--                                             })
                                            
                                            
--                                             detectedPlayers[targetServerId].lastNotify = currentTime
--                                         end
--                                     end
--                                 end
--                             end
--                         end
                        
                        
--                         for serverId, data in pairs(detectedPlayers) do
--                             local stillNearby = false
--                             for _, playerId in ipairs(nearbyPlayers) do
--                                 if GetPlayerServerId(playerId) == serverId then
--                                     local targetPed = GetPlayerPed(playerId)
--                                     local targetCoords = GetEntityCoords(targetPed)
--                                     local distance = #(playerCoords - targetCoords)
--                                     if distance < 80.0 then
--                                         stillNearby = true
--                                         break
--                                     end
--                                 end
--                             end
                            
--                             if not stillNearby then
--                                 detectedPlayers[serverId] = nil
--                             end
--                         end
--                     end
--                 end)
                
--                 Wait(2000) 
--             end
--         end
--     end)
-- end


-- RegisterNetEvent('medics-tips:client:notifyWanted')
-- AddEventHandler('medics-tips:client:notifyWanted', function(data)
--     if not isLawmanOrBountyHunter() then return end
--     lib.notify({
--         title = 'New Wanted Criminal',
--         description = string.format('%s is now wanted for: %s\nBounty: $%d', 
--             data.charName, 
--             data.crime, 
--             data.bounty
--         ),
--         type = 'warning',
--         duration = 10000,
--         position = 'top'
--     })
-- end)

-- RegisterNetEvent('medics-tips:client:notifyWanted')
-- AddEventHandler('medics-tips:client:notifyWanted', function(data)
--     if not isLawmanOrBountyHunter() then return end
--     lib.notify({
--         title = 'New Wanted Criminal',
--         description = string.format('A criminal is now wanted for: %s\nBounty: $%d', 
--             data.crime or "Unknown crime", 
--             data.bounty or 0
--         ),
--         type = 'warning',
--         duration = 10000,
--         position = 'top'
--     })
-- end)

-- RegisterCommand('reportinjury', function(source, args, rawCommand)
--     local playerPed = PlayerPedId()
--     local coords = GetEntityCoords(playerPed)
--     local currentTime = GetGameTimer()
    
   
--     local lastReportTime = reportCooldowns[source] or 0
--     if currentTime - lastReportTime < COOLDOWN_TIME then
--         local timeLeft = math.ceil((COOLDOWN_TIME - (currentTime - lastReportTime)) / 1000)
--         TriggerEvent('ox_lib:notify', {
--             title = 'Report Cooldown',
--             description = string.format('Please wait %d seconds before reporting again.', timeLeft),
--             type = 'error'
--         })
--         return
--     end
    
    
--     local input = lib.inputDialog('Report Medical Emergency', {
--         {type = 'input', label = 'Description (optional)', placeholder = 'What did you see?', required = false}
--     })
    
--     if not input then
       
--         TriggerEvent('ox_lib:notify', {
--             title = 'Report Cancelled',
--             description = 'Activity report was cancelled.',
--             type = 'info'
--         })
--         return
--     end
    
    
--     local description = input[1] and input[1] ~= "" and input[1] or "Medical emergency observed"
    
    
--     TriggerServerEvent('medics-tips:server:addCriminalActivity', description, nil, coords)
    
    
--     reportCooldowns[source] = currentTime
    
    
--     TriggerEvent('ox_lib:notify', {
--         title = 'Report Sent',
--         description = 'Medical emergency reported successfully.',
--         type = 'success',
--         duration = 5000
--     })
-- end, false)
-- Citizen.CreateThread(function()
--     Wait(5000) 
--     checkWantedPlayers()
-- end)

AddEventHandler('playerDropped', function()
    local src = source
    if reportCooldowns[src] then
        reportCooldowns[src] = nil
    end
end)

RegisterCommand('medicactivitymenu', function()
    openCriminalActivityMenu()
end, false)

-- 

AddEventHandler('RSGCore:Client:OnPlayerLoaded', function()
    
    Citizen.Wait(5000)
    
    
    --checkWantedPlayers()
    
end)

RegisterNetEvent('RSGCore:Client:OnJobUpdate')
AddEventHandler('RSGCore:Client:OnJobUpdate', function()
    detectedPlayers = {}
end)