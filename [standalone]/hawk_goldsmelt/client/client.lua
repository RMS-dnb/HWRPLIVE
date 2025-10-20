local keyGroup = GetRandomIntInRange(0, 0xffffff)
local PickupPrompt
local SmeltPrompt
local IS_SMELT = false
local RSGCore = exports['rsg-core']:GetCoreObject()

function SmeltPrompt()
    Citizen.CreateThread(function()
        local str ="Smelt"
        SmeltPrompt = Citizen.InvokeNative(0x04F97DE45A519419)
        PromptSetControlAction(SmeltPrompt, Config.keysmelt)
        string = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(SmeltPrompt, string)
        PromptSetEnabled(SmeltPrompt, true)
        PromptSetVisible(SmeltPrompt, true)
        PromptSetHoldMode(SmeltPrompt, true)
        PromptSetGroup(SmeltPrompt, keyGroup)
        PromptRegisterEnd(SmeltPrompt)
    end)
end

function PickupPrompt()
    Citizen.CreateThread(function()
        local str ="Pickup"
        PickupPrompt = Citizen.InvokeNative(0x04F97DE45A519419)
        PromptSetControlAction(PickupPrompt, Config.keypickup) 
        string = CreateVarString(10, 'LITERAL_STRING', str)
        PromptSetText(PickupPrompt, string)
        PromptSetEnabled(PickupPrompt, true)
        PromptSetVisible(PickupPrompt, true)
        PromptSetHoldMode(PickupPrompt, true)
        PromptSetGroup(PickupPrompt, keyGroup)
        PromptRegisterEnd(PickupPrompt)
        
    end)
end

Citizen.CreateThread(function()
    SmeltPrompt()
    PickupPrompt()
    while true do
        Wait(4)
        if furnaceProp and DoesEntityExist(furnaceProp) then
            local ped = PlayerPedId()
            local pedCoords = GetEntityCoords(ped)
            local furnaceCoords = GetEntityCoords(furnaceProp)
            local dist = #(pedCoords - furnaceCoords)

            if dist < 10 then 
                    local OnFoot = IsPedOnFoot(ped)
                    local Alive = not IsPedDeadOrDying(ped, true)
                if dist < 1.5 and OnFoot and Alive and not IS_SMELT then
                    local srt = CreateVarString(10, 'LITERAL_STRING',"Furnace")
                    PromptSetActiveGroupThisFrame(keyGroup, srt) 

                    if PromptHasHoldModeCompleted(SmeltPrompt) then
                        Wait(100)
                        -- Replace VORP callback with RSGCore callback
                        RSGCore.Functions.TriggerCallback("hawk_goldsmelt:checkitems", function(hasItems)
                            if hasItems then
                                CanStartFireEffect = true
                                IS_SMELT = true
                                ------------------------ notify ------------------------
                                RSGCore.Functions.Notify('Start melting.', 'primary')
                                --------------------------------------------------------     
                                startanim("amb_camp@prop_camp_butcher@working@rabbit@female_a@meat_drop@base", "base", -1)
                                camera(1.4, 3.2)
                                Wait(1000)
                                SpawnGoldChunksOnFurnace(Config.itemsgoldamount)
                                startanim("amb_camp@world_camp_fire_tend_sit@add_logs@male_a@idle_b", "idle_d", -1)
                                cameraLerp(1.4, 3.2, 3.0, 2.2, 500)
                                Wait(500)
                                StartFireEffect(0.5, false)
                                OpenSmeltMiniGameUI()
                            else
                                ------------------------ notify ------------------------
                                RSGCore.Functions.Notify('You do not have enough gold nuggets to smelt.', 'error')    
                                --------------------------------------------------------   
                            end
                        end, Config.itemsgoldamount)
                    end
                       
                    if PromptHasHoldModeCompleted(PickupPrompt) then
                        IS_SMELT = false
                        Wait(100)
                        startanim("script_common@mth_generic_enters@squat@in_place", "enter_rf", 2000)
                        Wait(1500)
                        RemoveAll()
                        TriggerServerEvent('hawk_goldsmelt:additem_furnace')
                        ------------------------ notify ------------------------
                        RSGCore.Functions.Notify('Pickup furnace', 'primary')  
                        --------------------------------------------------------   
                    end
                end
            end
        end
    end
end)

RegisterNetEvent('hawk_goldsmelt:placefurnace')
AddEventHandler('hawk_goldsmelt:placefurnace', function()
    
    if Config.CheckZoneSmelt then
        if not isPlayerInSmeltZone() then
            ------------------------ notify ------------------------
            RSGCore.Functions.Notify('You must be in a smelting area to place the furnace.', 'error')
            --------------------------------------------------------
            return
        end
    end

    if furnaceProp and DoesEntityExist(furnaceProp) then
        ------------------------ notify ------------------------
        RSGCore.Functions.Notify('You already placed a furnace.', 'error')
        --------------------------------------------------------
        return
    end

    local ped = PlayerPedId()
    local forwardOffset = 0.9 
    local coords = GetEntityCoords(ped)
    local heading = GetEntityHeading(ped)

    local forwardCoords = GetOffsetFromEntityInWorldCoords(ped, 0.0, forwardOffset, 0.0)
    local model = GetHashKey("gold_smelt")
    RequestModel(model)
    while not HasModelLoaded(model) do Wait(10) end
    TriggerServerEvent('hawk_goldsmelt:removeitem_furnace')
    ------------------------ notify ------------------------
    RSGCore.Functions.Notify('Placed a furnace.', 'primary')
    --------------------------------------------------------
    startanim("script_common@mth_generic_enters@squat@in_place", "enter_rf", 2000)
    Wait(1500)
    furnaceProp = CreateObject(model, forwardCoords.x, forwardCoords.y, forwardCoords.z, true, true, false)
    SetEntityHeading(furnaceProp, heading + 90)
    PlaceObjectOnGroundProperly(furnaceProp)
    FreezeEntityPosition(furnaceProp, true)

end)

RegisterNUICallback("adjustFire", function(data, cb)
   
    local action = data.action

    if action == "increase" then
        StartFireEffect(0.8, true)
    elseif action == "reset" then
        StartFireEffect(0.5, true)
    end

    cb({}) 
end)

RegisterNUICallback("closeSmeltUI", function(data, cb)
    CanStartFireEffect = false
    SetNuiFocus(false, false)

    if data.success == false then
        ------------------------ notify ------------------------
        RSGCore.Functions.Notify('Smelting failed!', 'error')
        --------------------------------------------------------
        ExplodeSmelter()
        Wait(200)
        RemoveAll()

    else
        ------------------------ notify ------------------------
        RSGCore.Functions.Notify('Successfully smelted gold!', 'success')
        --------------------------------------------------------
        Remove_AftercloseSmeltUI()
        TriggerServerEvent("hawk_goldsmelt:additems")
    end

    RenderScriptCams(false, true, 500, true, true)
    DestroyAllCams(true)
    cb({})
    IS_SMELT = false
end)

RegisterNUICallback("closeUI", function(data, cb)
    CanStartFireEffect = false
    ------------------------ notify ------------------------
    RSGCore.Functions.Notify('Cancel smelt', 'error')
    --------------------------------------------------------
    TriggerServerEvent("hawk_goldsmelt:returnitems")

    Remove_AftercloseSmeltUI()
    RenderScriptCams(false, true, 500, true, true)
    DestroyAllCams(true)
    SetNuiFocus(false, false)
    cb({})
    IS_SMELT = false
end)

function RemoveProp()
    if furnaceProp then
        if DoesEntityExist(furnaceProp) then
            DeleteObject(furnaceProp)
        end
        furnaceProp = nil
    end
    if goldChunks then 
        for _, gold in ipairs(goldChunks) do
            if DoesEntityExist(gold) then DeleteObject(gold) end
        end
        goldChunks = {}
    end
end

AddEventHandler('onResourceStop', function(resourceName)
	if (GetCurrentResourceName() ~= resourceName) then
	  return
	end
    RemoveAll()
end)