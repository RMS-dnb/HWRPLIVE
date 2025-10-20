local RSGCore = exports['rsg-core']:GetCoreObject()
local DropProps = {}  -- Track props for cleanup


RegisterNetEvent('mack-moneystash:client:CreateDropProp')
AddEventHandler('mack-moneystash:client:CreateDropProp', function(dropId, coords, propModel)
    
    if DropProps[dropId] then
        
        TriggerEvent('mack-moneystash:client:RemoveDropProp', dropId)
    end

    RequestModel(GetHashKey(propModel))
    local attempts = 0
    while not HasModelLoaded(GetHashKey(propModel)) and attempts < 100 do
        Citizen.Wait(10)
        attempts = attempts + 1
    end
    if not HasModelLoaded(GetHashKey(propModel)) then
       
        propModel = 'p_ammobox01x'
        RequestModel(GetHashKey(propModel))
        while not HasModelLoaded(GetHashKey(propModel)) do
            Citizen.Wait(10)
        end
    end
    local prop = CreateObject(GetHashKey(propModel), coords.x, coords.y, coords.z, true, true, false)
    if not DoesEntityExist(prop) then
        
        return
    end
    PlaceObjectOnGroundProperly(prop)
    Citizen.Wait(500)  -- Increased wait to ensure object settles
    FreezeEntityPosition(prop, true)  -- Freeze the prop in place
   

   
    Citizen.InvokeNative(0x543DFE14BE720027, PlayerId(), prop, true)
	Citizen.InvokeNative(0x7DFB49BCDB73089A, PlayerId(), prop, true)	

   
    local particleAsset = "core"
    RequestNamedPtfxAsset(GetHashKey(particleAsset))
    local ptfxAttempts = 0
    while not HasNamedPtfxAssetLoaded(GetHashKey(particleAsset)) and ptfxAttempts < 100 do
        Citizen.Wait(10)
        ptfxAttempts = ptfxAttempts + 1
    end
    local particleEffect
    if HasNamedPtfxAssetLoaded(GetHashKey(particleAsset)) then
       
        UseParticleFxAsset(particleAsset)
        particleEffect = StartParticleFxLoopedOnEntity("ent_amb_campfire_embers", prop, 0.0, 0.0, 0.5, 0.0, 0.0, 0.0, 1.0, false, false, false)
        if not particleEffect then
            
        end
    else
        
    end

    SetModelAsNoLongerNeeded(GetHashKey(propModel))
    exports['rsg-target']:AddTargetEntity(prop, {
        options = {
            {
                label = 'Pick Up',
                icon = 'fas fa-box',
                action = function()
                    TriggerServerEvent('mack-moneystash:server:PickupDrop', dropId)
                    TriggerEvent('RSGCore:Notify', 'Attempting to pick up item...', 'primary')
                end
            }
        },
        distance = 2.0
    })

   
    DropProps[dropId] = { prop = prop, particleEffect = particleEffect }
   
end)


RegisterNetEvent('mack-moneystash:client:RemoveDropProp')
AddEventHandler('mack-moneystash:client:RemoveDropProp', function(dropId)
    if DropProps[dropId] then
        local propData = DropProps[dropId]
        local prop = propData.prop

        -- Check if entity exists before doing anything
        if DoesEntityExist(prop) then
            -- Remove network ownership/management
            Citizen.InvokeNative(0xDFC85C5199045026, PlayerId(), prop)
            Citizen.InvokeNative(0x7DFB49BCDB73089A, PlayerId(), prop, true)
            
            -- Stop particle effect if it exists
            if propData.particleEffect then
                StopParticleFxLooped(propData.particleEffect, false)
            end
            
            -- Remove target entity
            exports['rsg-target']:RemoveTargetEntity(prop)
            
            -- Delete the object
            DeleteObject(prop)
            SetEntityAsNoLongerNeeded(prop)
        else
            -- Entity doesn't exist, but still clean up particle effect and target
            if propData.particleEffect then
                StopParticleFxLooped(propData.particleEffect, false)
            end
            -- Note: Can't remove target entity if prop doesn't exist
        end
        
        -- Clear from tracking table
        DropProps[dropId] = nil
        
    else
        -- Drop ID not found in tracking table
        print(string.format("Warning: Attempted to remove drop prop with ID %s that doesn't exist", tostring(dropId)))
    end
end)

-- Proximity check for loot spawn trigger
Citizen.CreateThread(function()
    local lastRequest = {}  -- Track last request time per location
    while true do
        local ped = PlayerPedId()
        local pos = GetEntityCoords(ped)
        for i, loc in ipairs(Config.Locations) do
            local dist = #(pos - vector3(loc.coords.x, loc.coords.y, loc.coords.z))
            if dist < 20.0 then
                -- Only trigger if last request was more than 10 seconds ago
                if not lastRequest[i] or (GetGameTimer() - lastRequest[i]) > 10000 then
                    TriggerServerEvent('mack-moneystash:server:RequestSpawn', i)
                    lastRequest[i] = GetGameTimer()
                end
            end
        end
        Citizen.Wait(5000)  -- Check every 5 seconds to avoid performance issues
    end
end)