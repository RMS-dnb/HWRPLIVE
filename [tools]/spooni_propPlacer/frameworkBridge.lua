-- frameworkBridge.lua
-- require this file from both client.lua and server.lua

Bridge = {}
Bridge.isServer = IsDuplicityVersion()
Bridge.isClient = not Bridge.isServer

--debug print funtion 
function Bridge.Debug(...)
    if Config.debug then
        print(...)
    end
end

-- Optional override in a config.lua:
-- Config = Config or {}
-- Config.Framework = 'vorp' / 'rsg' / 'custom'
function Bridge.detectFramework()
    if Config and Config.Framework then
        Bridge.framework = Config.Framework:lower()
    elseif GetResourceState('vorp_core') == 'started' then
        Bridge.framework = 'vorp'
    elseif GetResourceState('rsg-core') == 'started' then
        Bridge.framework = 'rsg'
    else
        Bridge.framework = 'custom'
    end
    Bridge.Debug("Framework detected: " .. Bridge.framework)
    Bridge.Debug("Is Server: ", Bridge.isServer)
end
Bridge.detectFramework()

-- preload framework exports/objects
if Bridge.framework == 'vorp' then
    Bridge.VorpCore = exports.vorp_core:GetCore()
elseif Bridge.framework == 'rsg' then
    Bridge.RSGCore = exports['rsg-core']:GetCoreObject()
end

-- unified data fetch
-- returns { identifier=string, charid=number, money=number, job=string, … }
function Bridge.getPlayerData(src)
    Bridge.Debug("[Bridge] getPlayerData called")
    if Bridge.framework == 'vorp' then
        if Bridge.isServer then
            local user = Bridge.VorpCore.getUser(src)
            local char = user.getUsedCharacter
            if char then
                return {
                    identifier = char.identifier,
                    charid     = char.charIdentifier,
                    name       = char.firstname .. ' ' .. char.lastname,
                    money      = char.money,
                    job        = char.job
                }
            else
                return nil
            end
        else
            local char = LocalPlayer.state.Character
            if char then
                return {
                    charid     = char.CharId,
                    name       = char.FirstName .. ' ' .. char.LastName,
                    money      = char.Money,
                    job        = char.Job
                }
            else
                return nil
            end
        end
    elseif Bridge.framework == 'rsg' then
        if Bridge.isServer then
            local ply = Bridge.RSGCore.Functions.GetPlayer(src)
            local pd  = ply.PlayerData
            if pd then
                return {
                    identifier = pd.license,
                    citizenid  = pd.citizenid,
                    charid     = pd.citizenid,
                    name       = pd.charinfo and pd.charinfo.firstname .. ' ' .. pd.charinfo.lastname or 'Unknown',
                    money      = pd.money and pd.money.cash or 0,
                    job        = pd.job and pd.job.name or 'unemployed'
                }
            else
                return nil
            end
        else
            local ply = Bridge.RSGCore.Functions.GetPlayerData()
            if ply then
                return {
                    charid     = ply.citizenid,
                    citizenid  = ply.citizenid,
                    name       = ply.charinfo and ply.charinfo.firstname .. ' ' .. ply.charinfo.lastname or 'Unknown',
                    money      = ply.money and ply.money.cash or 0,
                    job        = ply.job and ply.job.name or 'unemployed'
                }
            else
                return nil
            end
        end
    else
        -- custom or unsupported
        return {}
    end
end

function Bridge.setJob(src, job)
    if Bridge.framework == 'vorp' then
        Bridge.VorpCore.getUser(src).getUsedCharacter.setJob(job)
    elseif Bridge.framework == 'rsg' then
        Bridge.RSGCore.Functions.GetPlayer(src).PlayerData.job.name = job
    end
end

function Bridge.giveItem(src, item, amount)
    if Bridge.framework == 'vorp' then
        if GetResourceState('vorp_inventory') == 'started' then
            pcall(function() exports.vorp_inventory:addItem(src, item, amount) end)
        end
    elseif Bridge.framework == 'rsg' then
        local ok, err = pcall(function()
            local player = Bridge.RSGCore.Functions.GetPlayer(src)
            if player and player.Functions and player.Functions.AddItem then
                player.Functions.AddItem(item, amount)
            end
        end)
        if not ok then Bridge.Debug('[Bridge] giveItem error: ', err) end
    end
end

function Bridge.removeItem(src, item, amount)
    if not item or item == '' then
        Bridge.Debug('[Bridge] removeItem called with empty item name; skipping')
        return
    end
    if Bridge.framework == 'vorp' then
        if GetResourceState('vorp_inventory') == 'started' then
            -- VORP commonly uses subItem to decrement item count
            pcall(function()
                if exports.vorp_inventory.subItem then
                    exports.vorp_inventory:subItem(src, item, amount)
                else
                    exports.vorp_inventory:removeItem(src, item, amount)
                end
            end)
        end
    elseif Bridge.framework == 'rsg' then
        local ok, err = pcall(function()
            local player = Bridge.RSGCore.Functions.GetPlayer(src)
            if player and player.Functions and player.Functions.RemoveItem then
                player.Functions.RemoveItem(item, amount)
            end
        end)
        if not ok then Bridge.Debug('[Bridge] removeItem error: ', err) end
    end
end

function Bridge.giveWeapon(src, weapon, ammo)
    if Bridge.framework == 'vorp' then
        exports.vorp_inventory:createWeapon(src, weapon, {}, {}, {}, function(success)
            if not success then
                print(('^3[WARNING] Failed to add weapon: %s^7'):format(weapon))
            end
        end)
    elseif Bridge.framework == 'rsg' then
        Bridge.RSGCore.Functions.GetPlayer(src).PlayerData.Functions.AddWeapon(weapon, ammo)
    end
end

function Bridge.giveMoney(src, amount)
    if Bridge.framework == 'vorp' then
        Bridge.VorpCore.getUser(src).getUsedCharacter.addCurrency(0, amount)
    elseif Bridge.framework == 'rsg' then
        Bridge.RSGCore.Functions.GetPlayer(src).PlayerData.money.cash = amount
    end
end

function Bridge.removeMoney(src, amount)
    if Bridge.framework == 'vorp' then
        Bridge.VorpCore.getUser(src).getUsedCharacter.removeCurrency(0, amount)
    elseif Bridge.framework == 'rsg' then
        Bridge.RSGCore.Functions.GetPlayer(src).PlayerData.money.cash = amount
    end
end

function Bridge.notify(title, text, dict, icon, duration, color, src)
    Bridge.Debug("[Bridge] notify called")
    if Bridge.isClient then
        if Bridge.framework == 'vorp' then
            Bridge.VorpCore.NotifyLeft(title, text, dict, icon, duration, color)
        elseif Bridge.framework == 'rsg' then
            local notifyType = 'inform'
            if color == 'COLOR_RED' then
                notifyType = 'error'
            elseif color == 'COLOR_GREEN' then
                notifyType = 'success'
            end
            local notifyData = {description = text, duration = duration, type = notifyType }
            TriggerClientEvent('ox_lib:notify', notifyData)
        end
    else
        if Bridge.framework == 'vorp' then
            Bridge.VorpCore.NotifyLeft(src,title, text, dict, icon, duration, color)
        elseif Bridge.framework == 'rsg' then
            local notifyType = 'inform'
            if color == 'COLOR_RED' then
                notifyType = 'error'
            elseif color == 'COLOR_GREEN' then
                notifyType = 'success'
            end
            local notifyData = {description = text, duration = duration, type = notifyType }
            TriggerClientEvent('ox_lib:notify', src, notifyData)
        end
    end
    
end

-- sugar for just the character ID
function Bridge.getCharacterId(src)
    Bridge.Debug("[Bridge] getCharacterId called")
    local d = Bridge.getPlayerData(src)
    if Bridge.framework == 'rsg' then
        return d and d.citizenid
    end
    return d and d.charid
end

function Bridge.getCharacterJob(src)
    Bridge.Debug("[Bridge] getCharacterJob called")
    local d = Bridge.getPlayerData(src)
    return d and d.job
end

function Bridge.getCharacterMoney(src)
    Bridge.Debug("[Bridge] getCharacterMoney called")
    local d = Bridge.getPlayerData(src)
    return d and d.money
end

function Bridge.getCharacterIdentifier(src)
    Bridge.Debug("[Bridge] getCharacterIdentifier called")
    local d = Bridge.getPlayerData(src)
    return d and d.charid
end

function Bridge.getCharacterName(src)
    Bridge.Debug("[Bridge] getCharacterName called")
    local d = Bridge.getPlayerData(src)
    return d and d.name
end



--oxmysql queries
function Bridge.executeQuery(query, params)
    return MySQL.query.await(query, params)
end

function Bridge.updateQuery(query, params)
    return MySQL.update.await(query, params)
end

function Bridge.insertQuery(query, params)
    return MySQL.insert.await(query, params)
end




-------------
-- PROMPTS --
-------------

prompts = {}
promptGroups = {}

function IsPromptCompleted(group,key)
	if not promptGroups[group].prompts[tostring(key)] then
		return false
	end
	if UiPromptHasHoldMode(promptGroups[group].prompts[tostring(key)]) then
	  if PromptHasHoldModeCompleted(promptGroups[group].prompts[tostring(key)]) then
		UiPromptSetEnabled(promptGroups[group].prompts[tostring(key)], false)
		Citizen.CreateThread(function()
		  local group = group
		  local key = key
		  while IsDisabledControlPressed(0,key) do
			Wait(0)
		  end
		  UiPromptSetEnabled(promptGroups[group].prompts[tostring(key)], true)
		end)
		return true
	  end
	else
	  if IsControlJustPressed(0,key) then
		return true
	  end
	end
	return false
end
  
function CreatePromptButton(group, str, key, holdTime, secondkey)
	if (promptGroups[group] == nil) then
	  promptGroups[group] = {
		group = GetRandomIntInRange(0, 0xffffff),
		prompts = {}
	  }
	end
	promptGroups[group].prompts[tostring(key)] = PromptRegisterBegin()
	PromptSetControlAction(promptGroups[group].prompts[tostring(key)], key)
	if secondkey then
		PromptSetControlAction(promptGroups[group].prompts[tostring(key)], secondkey)
		DebugPrint("Second Key registered: "..secondkey)
	end
	str = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetText(promptGroups[group].prompts[tostring(key)], str)
	PromptSetEnabled(promptGroups[group].prompts[tostring(key)], true)
	PromptSetVisible(promptGroups[group].prompts[tostring(key)], true)
	if holdTime then
	  PromptSetHoldMode(promptGroups[group].prompts[tostring(key)], holdTime)
	end
	PromptSetGroup(promptGroups[group].prompts[tostring(key)], promptGroups[group].group)
	PromptRegisterEnd(promptGroups[group].prompts[tostring(key)])
end

  --function to delete prompt button out of group and delete group if empty
function DeletePromptButton(group, key)
	if (promptGroups[group] ~= nil) then
	  if (promptGroups[group].prompts[tostring(key)] ~= nil) then
		PromptDelete(promptGroups[group].prompts[tostring(key)])
		promptGroups[group].prompts[tostring(key)] = nil
	  end
	  if (next(promptGroups[group].prompts) == nil) then
		promptGroups[group] = nil
	  end
	end
end
  
 function DisplayPrompt(group,str)
	local promptName  = CreateVarString(10, 'LITERAL_STRING', str)
	PromptSetActiveGroupThisFrame(promptGroups[group].group, promptName)
 end

 function UiPromptHasHoldMode(...)
	return Citizen.InvokeNative(0xB60C9F9ED47ABB76, ...)
 end
 
 function UiPromptDisablePromptTypeThisFrame(...)
	return Citizen.InvokeNative(0xFC094EF26DD153FA,...)
 end
 
 function UiPromptSetVisible(...)
  return Citizen.InvokeNative(0x71215ACCFDE075EE,...)
 end
 
 function UiPromptIsActive(...)
  return Citizen.InvokeNative(0x546E342E01DE71CF,...)
 end
 
function UiPromptIsEnabled(...)
  return Citizen.InvokeNative(0x0D00EDDFB58B7F28,...)
end
  
function SetPromptVisible(group,key,value)
	UiPromptSetVisible(promptGroups[group].prompts[key],value)
end

function UiPromptSetEnabled(...)
	return Citizen.InvokeNative(0x8A0FB4D03A630D21,...)
end


----------------
-- END PROMPTS --
----------------




-------------------------
-- Extra Bridge helpers --
-------------------------

-- Register a usable item so that using it will trigger the provided callback
-- cb(source, itemName)
function Bridge.registerUsableItem(itemName, cb)
    if not Bridge.isServer then return end
    if Bridge.framework == 'vorp' then
        if GetResourceState('vorp_inventory') == 'started' then
            local ok, err = pcall(function()
                local res = (GetCurrentResourceName and GetCurrentResourceName()) or 'propPlacer'
                exports.vorp_inventory:registerUsableItem(itemName, function(data)
                    -- data: {source, id, label, name, metadata, ...}
                    local src = (data and data.source) or source
                    local usedName = (data and data.name) or itemName
                    cb(src, usedName)
                end, res)
            end)
            if not ok then Bridge.Debug('[Bridge] registerUsableItem vorp error: ', err) end
        end
    elseif Bridge.framework == 'rsg' then
        local ok, err = pcall(function()
            if Bridge.RSGCore and Bridge.RSGCore.Functions and Bridge.RSGCore.Functions.CreateUseableItem then
                Bridge.RSGCore.Functions.CreateUseableItem(itemName, function(src, item)
                    local usedName = (item and item.name) or itemName
                    cb(src, usedName)
                end)
            end
        end)
        if not ok then Bridge.Debug('[Bridge] registerUsableItem rsg error: ', err) end
    else
        Bridge.Debug('[Bridge] registerUsableItem skipped for custom framework: ', itemName)
    end
end

-- Attempt to close the player's inventory UI
function Bridge.closeInventory(src)
    if not Bridge.isServer then return end
    if Bridge.framework == 'vorp' then
        TriggerClientEvent('vorp_inventory:CloseInv', src)
    elseif Bridge.framework == 'rsg' then
        TriggerClientEvent('rsg-inventory:client:close', src)
    else
        TriggerClientEvent('propPlacer:client:closeInventory', src)
    end
end

-- Check player has an item in their inventory (best-effort)
function Bridge.hasItem(src, itemName, amount)
    amount = amount or 1
    local itemCount = 0
    if Bridge.framework == 'vorp' then
        exports.vorp_inventory:getItemCount(src, function(result)
            itemCount = result
        end, itemName)
    elseif Bridge.framework == 'rsg' then
        local player = Bridge.RSGCore.Functions.GetPlayer(src)
        local itemData = player.Functions.GetItemByName(itemName)
            if itemData then
                itemCount = itemData.count or itemData.amount
            else
                itemCount = 0
            end
    end
    if itemCount >= amount then
        return true
    else
        return false
    end
end


