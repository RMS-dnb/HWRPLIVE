-- Main Discord Rich Presence Thread
Citizen.CreateThread(function()
    -- Initialize Discord App settings
    SetDiscordAppId(Config.Discord.DiscordAppID or Config.Discord["discord_id"])
    SetDiscordRichPresenceAsset(Config.Discord.AppBigAssetID or Config.Discord["discord_big_image"])
    SetDiscordRichPresenceAssetText(Config.Discord.AppBigAssetText)
    SetDiscordRichPresenceAssetSmall(Config.Discord.AppSmallAssetID or Config.Discord["discord_small_image"])
    SetDiscordRichPresenceAssetSmallText(Config.Discord.AppSmallAssetText)
    
    -- Set up action buttons
    SetDiscordRichPresenceAction(0, 
        Config.Discord.FirstButtonPlaceholder or "Discord", 
        Config.Discord.FirstButtonLink or Config.Discord["discord_joinurl"]
    )
    SetDiscordRichPresenceAction(1, 
        Config.Discord.SecondButtonPlaceholder or "Website", 
        Config.Discord.SecondButtonLink or Config.Discord["discord_connecturl"]
    )
    
    -- Game detection
    local isRDR = not TerraingridActivate
    
    -- Zone name function for RDR
    local function getZoneName(coords, type)
        local zoneHash = Citizen.InvokeNative(0x43AD8FC02B429D33, coords.x, coords.y, coords.z, type)
        return zoneNames[zoneHash]
    end
    
    -- Main loop
    while true do
        local playerPed = PlayerPedId()
        local playerName = GetPlayerName(PlayerId())
        local playerCoords = GetEntityCoords(playerPed)
        local health = GetEntityHealth(playerPed)
        
        -- Determine location based on game type
        local location
        if isRDR then
            -- Red Dead Redemption location logic
            local town = getZoneName(playerCoords, 1)
            local district = getZoneName(playerCoords, 10)
            local state = getZoneName(playerCoords, 0)
            
            if town then
                location = town
            elseif district then
                location = district
            elseif state then
                location = state
            else
                location = "Unknown"
            end
        else
            -- GTA location logic
            local zone = GetLabelText(GetNameOfZone(playerCoords))
            local street, crossing = GetStreetNameAtCoord(playerCoords.x, playerCoords.y, playerCoords.z)
            local streetName = GetStreetNameFromHashKey(street)
            local crossingName = GetStreetNameFromHashKey(crossing)
            local road
            
            if crossingName ~= "" then
                road = streetName .. " & " .. crossingName
            else
                road = streetName
            end
            
            location = road .. ", " .. zone
        end
        
        -- Set Rich Presence with location
        SetRichPresence(location)
        
        -- Update asset text with player name
        SetDiscordRichPresenceAssetText(playerName)
        
        -- Update small asset text with health
        SetDiscordRichPresenceAssetSmallText("Health: " .. health)
        
        -- Trigger server event for additional data (if needed)
        TriggerServerEvent('rsg-discord:getdata')
        
        -- Wait before next update
        Citizen.Wait(Config.Discord.UpdateEvery or 5000)
    end
end)

-- Event handler for server-side rich presence data
RegisterNetEvent("rsg-discord:receivedata", function(richPresenceString)
    -- Only use server data if provided, otherwise keep client-side location
    if richPresenceString and richPresenceString ~= "" then
        SetRichPresence(richPresenceString)
    end
end)