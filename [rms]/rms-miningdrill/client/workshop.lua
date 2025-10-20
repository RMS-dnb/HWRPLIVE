local RSGCore = exports['rsg-core']:GetCoreObject()
local campSpawned = false
lib.locale()

local spawnCamp = function()
    if campSpawned then
        Citizen.InvokeNative(0x58AC173A55D9D7B4, campSpawned)
        Wait(250)
    else
        local propsetName = "pg_mp_workshop03x"
        local propsetHash = GetHashKey(propsetName)

        Citizen.InvokeNative(0xF3DE57A46D5585E9, propsetHash)
        while not Citizen.InvokeNative(0x48A88FC684C55FDC, propsetHash) do
            Wait(50)
        end

        if Citizen.InvokeNative(0x48A88FC684C55FDC, propsetHash) then
            for k,v in pairs(Config.WorkshopTents) do
                campSpawned = Citizen.InvokeNative(
                    0x899C97A1CCE7D483,
                    propsetHash,
                    v.coords.x,
                    v.coords.y,
                    v.coords.z,
                    0,
                    v.coords.w,
                    1200.0,
                    false,
                    true
                )
            end
        end
        Citizen.InvokeNative(0xB1964A83B345B4AB, propsetHash)
    end
end

CreateThread(function()
    Wait(5000)
    spawnCamp()
end)

---------------------------------------------
-- target for use drill
---------------------------------------------
CreateThread(function()
    exports.ox_target:addModel(Config.RockDriller, {
        {
            name = 'rockdrill',
            icon = 'far fa-eye',
            label = locale('cl_lang_6'),
            onSelect = function()
                TriggerEvent('rex-mining:client:drillrocksinput')
            end,
            distance = 2.0
        }
    })
end)

---------------------------------------------
-- choose between rock / saltrock amount
---------------------------------------------
RegisterNetEvent('rex-mining:client:drillrocksinput', function()
    local input = lib.inputDialog('Drill Rocks', {
        { 
            type = 'select',
            default = 'rock',
            options = {
                { label = locale('cl_lang_7'),      value = 'rock' },
                { label = locale('cl_lang_8'), value = 'saltrock' }
            },
            required = true
        },
        { 
            type = 'input',
            label = locale('cl_lang_9'),
            required = true
        },
    })
    if not input then return end
    local hasItem = RSGCore.Functions.HasItem(input[1], tonumber(input[2]))
    if not hasItem then 
        lib.notify({ title = locale('cl_lang_10'), duration = 2000, type = 'error' }) 
        return
    end
    TriggerEvent('rex-mining:client:dodrilling', input[1], tonumber(input[2]))
end)

----------------------------------------------------
-- drill rocks function
----------------------------------------------------
local DrillingInProgress = false
local DrillingRemaining = 0

-- Main drilling function
local function DrillingRocks(item, amount)
    DrillingRemaining = amount
    DrillingInProgress = true


    CreateThread(function()
        while DrillingInProgress do
            Wait(0)
            if IsControlJustPressed(0, 0x8CC9CD42) then 
                DrillingInProgress = false
                DrillingRemaining = 0
            end
        end
    end)

    CreateThread(function()
        while DrillingRemaining > 0 and DrillingInProgress do
            LocalPlayer.state:set("inv_busy", true, true) 

            local success = lib.progressBar({
                duration = Config.DrillTime,
                position = 'bottom',
                useWhileDead = false,
                canCancel = true,
                disableControl = false,
                disable = {
                    move = true,
                    mouse = false,
                },
                label = locale('cl_lang_11'),
                anim = {
                    dict = 'mech_inventory@crafting@fallbacks',
                    clip = 'full_craft_and_stow',
                    flag = 27,
                },
            })

            if not success or not DrillingInProgress then
                lib.notify({
                    title = 'Rock Drill',
                    description = 'Drilling Cancelled',
                    type = 'error'
                })
                DrillingRemaining = 0
                break
            end

            DrillingRemaining -= 1
            TriggerServerEvent('rex-mining:server:finishdrilling', item)

            Wait(0)
        end

        DrillingInProgress = false
        LocalPlayer.state:set("inv_busy", false, true)
    end)
end

---------------------------------------------
-- drill them rocks
---------------------------------------------
RegisterNetEvent('rex-mining:client:dodrilling', function(item, amount)
    local hasItem = RSGCore.Functions.HasItem(item, amount)
    if hasItem then
        DrillingRocks(item, amount)
    else
        lib.notify({ title = locale('cl_lang_10'), duration = 2000, type = 'error' })
    end
end)
