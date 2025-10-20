
local text = Config.Texts
local debug = Config.Debug
local prompt = Config.Prompts 
local bbl = Config.oilUnits

local framework = Config.Framework

data = {}
local RSGCore
local qc

local QBRItems

if framework == "RSG" then 
    qc = "rsg-core"
    RSGCore = exports[qc]:GetCoreObject()
    RSGItems = RSGCore.Shared.Items
end

if framework == "QBR" then 
    QBRItems = exports['qbr-core']:GetItems() 
end


    
local isBusy = false

Config.Textures = {
    cross = {"scoretimer_textures", "scoretimer_generic_cross"},
    locked = {"menu_textures","stamp_locked_rank"},
    tick = {"scoretimer_textures","scoretimer_generic_tick"},
    money = {"inventory_items", "money_moneystack"},
    alert = {"menu_textures", "menu_icon_alert"},
}

MenuData = {}
TriggerEvent("redemrp_menu_base:getData",function(call)
    MenuData = call
end)

local CustomLabel = nil
local Peds = {}
local activeVehicle = nil

local PromptKey 
local PromptKey2
local PromptKey3
local PromptKey4
local PromptKey5
local PromptKey6
local PromptKey7
local PromptKey8
local PromptKey9
local PromptKey10

local PromptGroup = GetRandomIntInRange(0, 0xffffff)
local PromptGroup2 = GetRandomIntInRange(0, 0xffffff)
local PromptGroup3 = GetRandomIntInRange(0, 0xffffff)
local PromptGroup4 = GetRandomIntInRange(0, 0xffffff)
local PromptGroup5 = GetRandomIntInRange(0, 0xffffff)
local PromptGroup6 = GetRandomIntInRange(0, 0xffffff)
local PromptGroup8 = GetRandomIntInRange(0, 0xffffff)
local PromptGroup9 = GetRandomIntInRange(0, 0xffffff)
local PromptGroup10 = GetRandomIntInRange(0, 0xffffff)

local prompts = {}
local Peds = {}

local wagonOut = false

local handOil = 0 
local maxHandOil = Config.job['MaxOilHand']
local wagonOil = 0
local maxWagonOil = Config.job['MaxOilWagon']

local activeProp = nil 

local StorageWag = false

local moneyJob = nil
local lastWagon = nil
local lastCity = nil
local moneyPlusDistance = nil
local lastCraft = nil
local lastCraftPos = nil

local show = false
local blip = nil

local deliveryOpen = false

local str = text.promptBoss
PromptKey = PromptRegisterBegin()
PromptSetControlAction(PromptKey, prompt.OpenMenu)
str = CreateVarString(10, 'LITERAL_STRING', str)
PromptSetText(PromptKey, str)
PromptSetEnabled(PromptKey, 1)
PromptSetVisible(PromptKey, 1)
PromptSetStandardMode(PromptKey,1)
PromptSetGroup(PromptKey, PromptGroup)
Citizen.InvokeNative(0xC5F428EE08FA7F2C,PromptKey,true)
PromptRegisterEnd(PromptKey)
prompts[#prompts+1] = PromptKey

local str2 = text.wagon
PromptKey2 = PromptRegisterBegin()
PromptSetControlAction(PromptKey2, prompt.wagon)
str2 = CreateVarString(10, 'LITERAL_STRING', str2)
PromptSetText(PromptKey2, str2)
PromptSetEnabled(PromptKey2, 1)
PromptSetVisible(PromptKey2, 1)
PromptSetStandardMode(PromptKey2,1)
PromptSetGroup(PromptKey2, PromptGroup2)
Citizen.InvokeNative(0xC5F428EE08FA7F2C,PromptKey2,true)
PromptRegisterEnd(PromptKey2)
prompts[#prompts+1] = PromptKey2

local str3 = text.promptContainer
PromptKey3 = PromptRegisterBegin()
PromptSetControlAction(PromptKey3, prompt.Container)
str3 = CreateVarString(10, 'LITERAL_STRING', str3)
PromptSetText(PromptKey3, str3)
PromptSetEnabled(PromptKey3, 1)
PromptSetVisible(PromptKey3, 1)
PromptSetStandardMode(PromptKey3,1)
PromptSetGroup(PromptKey3, PromptGroup3)
Citizen.InvokeNative(0xC5F428EE08FA7F2C,PromptKey3,true)
PromptRegisterEnd(PromptKey3)
prompts[#prompts+1] = PromptKey3

local str4 = text.promptOilWell
PromptKey4 = PromptRegisterBegin()
PromptSetControlAction(PromptKey4, prompt.OilWell)
str4 = CreateVarString(10, 'LITERAL_STRING', str4)
PromptSetText(PromptKey4, str4)
PromptSetEnabled(PromptKey4, 1)
PromptSetVisible(PromptKey4, 1)
PromptSetStandardMode(PromptKey4,1)
PromptSetGroup(PromptKey4, PromptGroup4)
Citizen.InvokeNative(0xC5F428EE08FA7F2C,PromptKey4,true)
PromptRegisterEnd(PromptKey4)
prompts[#prompts+1] = PromptKey4

if not Config.disableManagementSystem.active then
    local str5 = text.promptStats
    PromptKey5 = PromptRegisterBegin()
    PromptSetControlAction(PromptKey5, prompt.ShowStatus)
    str5 = CreateVarString(10, 'LITERAL_STRING', str5)
    PromptSetText(PromptKey5, str5)
    PromptSetEnabled(PromptKey5, 1)
    PromptSetVisible(PromptKey5, 1)
    PromptSetStandardMode(PromptKey5,1)
    PromptSetGroup(PromptKey5, PromptGroup3)
    Citizen.InvokeNative(0xC5F428EE08FA7F2C,PromptKey5,true)
    PromptRegisterEnd(PromptKey5)
    prompts[#prompts+1] = PromptKey5
end

local str6 = text.oilIn
PromptKey6 = PromptRegisterBegin()
PromptSetControlAction(PromptKey6, prompt.wagonAdd)
str6 = CreateVarString(10, 'LITERAL_STRING', str6)
PromptSetText(PromptKey6, str6)
PromptSetEnabled(PromptKey6, 1)
PromptSetVisible(PromptKey6, 1)
PromptSetStandardMode(PromptKey6,1)
PromptSetGroup(PromptKey6, PromptGroup6)
Citizen.InvokeNative(0xC5F428EE08FA7F2C,PromptKey6,true)
PromptRegisterEnd(PromptKey6)
prompts[#prompts+1] = PromptKey6

local str7 = text.oilOut
PromptKey7 = PromptRegisterBegin()
PromptSetControlAction(PromptKey7, prompt.WagonRemove)
str7 = CreateVarString(10, 'LITERAL_STRING', str7)
PromptSetText(PromptKey7, str7)
PromptSetEnabled(PromptKey7, 1)
PromptSetVisible(PromptKey7, 1)
PromptSetStandardMode(PromptKey7,1)
PromptSetGroup(PromptKey7, PromptGroup6)
Citizen.InvokeNative(0xC5F428EE08FA7F2C,PromptKey7,true)
PromptRegisterEnd(PromptKey7)
prompts[#prompts+1] = PromptKey7

local str8 = text.promptJob
PromptKey8 = PromptRegisterBegin()
PromptSetControlAction(PromptKey8, prompt.jobMenu)
str8 = CreateVarString(10, 'LITERAL_STRING', str8)
PromptSetText(PromptKey8, str8)
PromptSetEnabled(PromptKey8, 1)
PromptSetVisible(PromptKey8, 1)
PromptSetStandardMode(PromptKey8,1)
PromptSetGroup(PromptKey8, PromptGroup8)
Citizen.InvokeNative(0xC5F428EE08FA7F2C,PromptKey8,true)
PromptRegisterEnd(PromptKey8)
prompts[#prompts+1] = PromptKey8

local str9 = text.promptJobFinish
PromptKey9 = PromptRegisterBegin()
PromptSetControlAction(PromptKey9, prompt.jobFinish)
str9 = CreateVarString(10, 'LITERAL_STRING', str9)
PromptSetText(PromptKey9, str9)
PromptSetEnabled(PromptKey9, 1)
PromptSetVisible(PromptKey9, 1)
PromptSetStandardMode(PromptKey9,1)
PromptSetGroup(PromptKey9, PromptGroup9)
Citizen.InvokeNative(0xC5F428EE08FA7F2C,PromptKey9,true)
PromptRegisterEnd(PromptKey9)
prompts[#prompts+1] = PromptKey9

local str10 = text.promptCraft
PromptKey10 = PromptRegisterBegin()
PromptSetControlAction(PromptKey10, prompt.craft)
str10 = CreateVarString(10, 'LITERAL_STRING', str10)
PromptSetText(PromptKey10, str10)
PromptSetEnabled(PromptKey10, 1)
PromptSetVisible(PromptKey10, 1)
PromptSetStandardMode(PromptKey10,1)
PromptSetGroup(PromptKey10, PromptGroup10)
Citizen.InvokeNative(0xC5F428EE08FA7F2C,PromptKey10,true)
PromptRegisterEnd(PromptKey10)
prompts[#prompts+1] = PromptKey10

--------------- MAIN

function GoTo(pos)
    TaskGoToCoordAnyMeans(PlayerPedId(), pos.x, pos.y, pos.z, 1.0, 0.0, false, 0.0)
    while GetScriptTaskStatus(PlayerPedId(), 0x93399E79) ~= 8 do
        Citizen.Wait(0)
    end
    if pos.w ~= nil then
        Citizen.Wait(500)
        SetEntityHeading(PlayerPedId(),pos.w)
        Citizen.Wait(500)
    end
end

RegisterNetEvent('d-labs:client:showStats')
AddEventHandler('d-labs:client:showStats', function(_,_n)
    local name = _n
    local max = Config.oilContainer[name].max

    TriggerEvent("Notification:d_labs_oil", 'inform', text.showOil..' '.._..'/'..max..' '..bbl, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
end)


RegisterNetEvent('d-labs:client:updateContainer')
AddEventHandler('d-labs:client:updateContainer', function(_,label,point)

    if _ == '1' then
        GoTo(Config.oilContainer[label].coords[point])
        local wait = 4000
        SetAnim('amb_work@world_human_repair@high@oilcan@male_b@idle_c','idle_h',wait)
        Citizen.Wait(wait)        

        if Config.disableManagementSystem.moneyForOil then            
            TriggerEvent("Notification:d_labs_oil", 'inform', text.reffile..handOil..' '..bbl.. ' / +'..handOil*Config.disableManagementSystem.moneyForOil..'$', Config.Textures.alert[1], Config.Textures.alert[2], 2000)
        else 
            TriggerEvent("Notification:d_labs_oil", 'inform', text.reffile..handOil..' '..bbl, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
        end
        handOil = 0 
    elseif _ == '2' then
        TriggerEvent("Notification:d_labs_oil", 'inform', text.lock, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
    else 
        TriggerEvent("Notification:d_labs_oil", 'error', text.lock, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
    end

    bucketCheck()

end)

local jobName = nil
local jobGrade = nil

RegisterNetEvent('d-labs:client:isJob')
AddEventHandler('d-labs:client:isJob', function(_)
    local job = _
    jobName = job.name
    jobGrade = job.grade
end)

function isJob()
    jobName = nil 

    TriggerServerEvent('d-labs:server:isJob')

    while jobName == nil do 
        Citizen.Wait(10)
    end

    if Config.job['jobName'] == jobName or Config.job['jobName'] == false then 
        return true
    else 
        TriggerEvent("Notification:d_labs_oil", 'error', text.notifNoJob, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
        return false
    end
end

function isBoss()

    jobGrade = nil 

    TriggerServerEvent('d-labs:server:isJob')
    while jobGrade == nil do 
        Citizen.Wait(10)
    end

    if (Config.job['bossGrade'] <= jobGrade and Config.job['bossjob'] == jobName) or Config.job['bossjob'] == false then 
        return true
    else 
        TriggerEvent("Notification:d_labs_oil", 'error', text.notifNoJob, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
        return false
    end


end

function setBlip(_,_n)
    local coords = _
    local name = _n
    RemoveBlip(blip)

    blip = N_0x554d9d53f696d002(1247852480, coords.x, coords.y, coords.z)
    SetBlipSprite(blip, -1236018085, 1)
    SetBlipScale(blip, 0.2)
    Citizen.InvokeNative(0x9CB1A1623062F402, blip, name)
end

function OpenSetting(_)
    local name = _

    MenuData.CloseAll()

    local elements = {}

    if name == 'fuel_type' then 

        for k,v in pairs(Config.FuelItem) do
            table.insert(elements, { label = text.add..k, value = {add = true, name = k, index = v}, desc = text.menuAddFuelDesc })
        end
        name = text.fuel

    else

        table.insert(elements, { label = text.menuRafin, value = 'refined', desc = text.menuRafinDesc})
        table.insert(elements, { label = text.menuLock, value = 'lock', desc = text.menuLockDesc})  
        table.insert(elements, { label = text.menuClear, value = 'off', desc = text.menuClearDesc })  

    end

    MenuData.Open('default', GetCurrentResourceName(), 'd_labs_oil_2',
        {
            title    = name,
            align    = Config.MenuPos,
            elements = elements,
        },

        function(data, menu)


            if data.current.value == 'lock' then
                TriggerServerEvent('d-labs:server:setLock',name)
            elseif data.current.value == 'refined' then
                TriggerServerEvent('d-labs:server:refined',name)
            elseif data.current.value == 'off' then
                TriggerServerEvent('d-labs:server:clear',name)
            elseif data.current.value.add then
                TriggerServerEvent('d-labs:server:addFuel',data.current.value)
            end

            menu.close()
            isBusy = false
        end,
    

    function(data, menu)
        menu.close()
    end)

end

function OpenBank(amount)


    MenuData.CloseAll()

    local elements = {}

    table.insert(elements, { label = text.status..' - $'..amount, value = 'status' })
    table.insert(elements, { label = text.withdraw, value = 'withdraw', desc = text.menuMoneyDesc })


    MenuData.Open('default', GetCurrentResourceName(), 'd_labs_oil_bank',
        {
            title    = text.menuTitleBank,
            align    = Config.MenuPos,
            elements = elements,
        },

        function(data, menu)
            if data.current.value == 'status' then

            elseif data.current.value == 'withdraw' or data.current.value == 'deposit' then
                TriggerServerEvent('d-labs:server:MoneyBank',data.current.value) 
                menu.close()
            end
        end,
    

    function(data, menu)
        menu.close()
    end)


end

RegisterNetEvent('d-labs:client:containerStats')
AddEventHandler('d-labs:client:containerStats', function(tab)

    MenuData.CloseAll()

    local elements = {}
    local money = nil
    local fuel = nil

    for k, v in pairs(tab) do
        if Config.oilContainer[v.label] then
            local percent = (tonumber(v.container) / Config.oilContainer[v.label].max) * 100
            local varLabel = nil
            local des = nil
            -- <br>
            if tonumber(v.open) == 1 then
                varLabel = '🟩 '..v.label..' ('..percent.. '%)'
                des = v.container..' '..Config.oilUnits..'<br>' 
            else 
                varLabel = '🟥 '..v.label..' ('..percent.. '%)'
                des = v.container..' '..Config.oilUnits..'<br>' 
            end    

            if tonumber(v.refined) == 1 then
                des = des..text.typeOfOil..' '..text.refined
            else
                des = des..text.typeOfOil..' '..text.notRefined
            end

            table.insert(elements, { label = varLabel, value = v.label, desc = des or text.menuLockDesc })
        end

        if v.type == 'money' then
            money = v.container
        elseif v.type == 'fuel' then
            fuel = v.container
        end
    end

    if money ~= nil then
        table.insert(elements, { label = text.bank..' - '..money..'$', value = 'money_type', desc = text.menuMoneyDesc })
    end

    if fuel ~= nil then
        table.insert(elements, { label = text.fuel..' - '..fuel..' '..Config.oilUnits, value = 'fuel_type', desc = text.menuAddFuelDesc})
    end

    
    MenuData.Open('default', GetCurrentResourceName(), 'd_labs_oil',
        {
            title    = text.menuTitleManagement,
            align    = Config.MenuPos,
            elements = elements,
        },

        function(data, menu)

            if data.current.value ~= 'money_type' then
                OpenSetting(data.current.value)
            else 
                OpenBank(money)
            end
            
            menu.close()
            isBusy = false
        end,
    

    function(data, menu)
        menu.close()
        isBusy = false
    end)




end)


RegisterNetEvent('d-labs:client:craftItem')
AddEventHandler('d-labs:client:craftItem', function(done,craftingTime)
    if done then
        local craftingTime = craftingTime or 10
        GoTo(lastCraftPos)
        FreezeEntityPosition(PlayerPedId(),true)
        local wait = craftingTime * 1000
        SetAnim('amb_work@world_human_repair@high@oilcan@male_b@idle_c','idle_h',wait)
        Citizen.Wait(wait)  
        TriggerEvent("Notification:d_labs_oil", 'inform', text.craftDone, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
        FreezeEntityPosition(PlayerPedId(),false)
    end 
    isBusy = false
end)

function dt(table, nb)
    if nb == nil then
        nb = 0
    end

    if type(table) == 'table' then
        local s = ''
        for i = 1, nb + 1, 1 do
            s = s .. "    "
        end

        s = '{\n'
        for k,v in pairs(table) do
            if type(k) ~= 'number' then k = '"'..k..'"' end
            for i = 1, nb, 1 do
                s = s .. "    "
            end
            s = s .. '['..k..'] = ' .. dt(v, nb + 1) .. ',\n'
        end

        for i = 1, nb, 1 do
            s = s .. "    "
        end

        return s .. '}'
    else
        return tostring(table)
    end
end

RegisterNetEvent('d-labs:client:craftCheck')
AddEventHandler('d-labs:client:craftCheck', function(tab,_craftTab,craftingTime)
    MenuData.CloseAll()

    local elements = {}
    local craftTab = _craftTab

    if tab[1] == nil then
        table.insert(elements, { label = text.menuNoContainer, value = {tab = tab, label = nil} })
    else
        for k, v in pairs(tab) do
            table.insert(elements, { label = v.label..' [ '..v.container..' ]', value = v.label, desc = text.menuCraftSelectDesc }) 
        end
    end

        MenuData.Open('default', GetCurrentResourceName(), 'd_labs_oil_job_craft2',
        {
            title    = text.menuTitleManagement,
            align    = Config.MenuPos,
            elements = elements,
        },

        function(data, menu)

            if data.current.label ~= text.menuNoContainer then
                TriggerServerEvent('d-labs:server:craftItem',data.current.value,craftTab,craftingTime)
            else 
                isBusy = false
            end

            menu.close()
        end,
            

    function(data, menu)
        menu.close()
        isBusy = false
    end)


end)

RegisterNUICallback("d-labs:nuiclose", function(index)
    SetNuiFocus(false, false)

    if index.turnOff then
        local number = math.random(Config.oilAdd.min,Config.oilAdd.max) 
       
        if handOil + number > maxHandOil then 
            handOil = maxHandOil
            TriggerEvent("Notification:d_labs_oil", 'inform', text.addToHand..handOil..' '..bbl..' ('..text.max..')', Config.Textures.alert[1], Config.Textures.alert[2], 2000)
        else 
            TriggerEvent("Notification:d_labs_oil", 'success', text.addToHand..handOil+number..' '..bbl..' [+'..number..']', Config.Textures.alert[1], Config.Textures.alert[2], 2000)
            handOil = handOil + number
        end
    end
    bucketCheck()
end)


function checkPed()

    if IsEntityDead(PlayerPedId()) then 
        TriggerEvent("Notification:d_labs_oil", 'error', 'TEST1', Config.Textures.alert[1], Config.Textures.alert[2], 2000)
        return false 
    end

    return true
end

function SetPermanentProp(propName,bone,coords)

    DeleteEntity(activeProp)

    local x, y, z = table.unpack(GetEntityCoords(PlayerPedId(), true))
    propHash = GetHashKey(propName)

    RequestModel(propHash)
    while not HasModelLoaded(propHash) do
        Citizen.Wait(0)
    end

    activeProp = CreateObject(propHash, x, y, z, true, false, false)
    local boneIndex = GetEntityBoneIndexByName(PlayerPedId(), bone)
    local x,y,z,xr,yr,zr = coords[1],coords[2],coords[3],coords[4],coords[5],coords[6]

    AttachEntityToEntity(activeProp, PlayerPedId(), boneIndex, x,y,z,xr,yr,zr, true, true, false, true, 1, true, false, false)
    SetModelAsNoLongerNeeded(propHash)
end

local control = false
function DisableControl()
    Citizen.CreateThread(function()
        if control == false then
            control = true
            while activeProp ~= nil do
                Citizen.Wait(0)
                checkPed()

                Citizen.InvokeNative(0x2970929FD5F9FC89, PlayerId(), true)
                Citizen.InvokeNative(0xFE99B66D079CF6BC, 0, 0x07CE1E61, true) 
                Citizen.InvokeNative(0xFE99B66D079CF6BC, 0, 0xF84FA74F, true) 
                Citizen.InvokeNative(0xFE99B66D079CF6BC, 0, 0xAC4BD4F1, true) 
                Citizen.InvokeNative(0xFE99B66D079CF6BC, 0, 0x73846677, true)
                Citizen.InvokeNative(0xFE99B66D079CF6BC, 0, 0x0AF99998, true)
                Citizen.InvokeNative(0xFE99B66D079CF6BC, 0, 0xB2F377E8, true)
                Citizen.InvokeNative(0xFE99B66D079CF6BC, 0, 0xADEAF48C, true)
                Citizen.InvokeNative(0xFE99B66D079CF6BC, 0, 0xDB096B85, true)
                Citizen.InvokeNative(0xFE99B66D079CF6BC, 0, 0x8FFC75D6, true)

                if Config.boardingProtection then
                    Citizen.InvokeNative(0xFE99B66D079CF6BC, 0, 0xCEFD9220, true) 
                end

                Citizen.InvokeNative(0xFE99B66D079CF6BC, 0, 0xD9D0E1C0, true)
                Citizen.InvokeNative(0xFE99B66D079CF6BC, 0, 0x938D4071, true) 
                Citizen.InvokeNative(0xFE99B66D079CF6BC, 0, 0xB238FE0B, true) 
            end

            control = false
        end
    end)
end

function bucketCheck()
    if handOil >= 1 and activeProp == nil then 
        local _coords = {0.13, -0.19, -0.12, -75.0, 20.0, 0.0}   
        
        if IsPedMale(PlayerPedId()) then
            SetPermanentProp('p_oilcan02x','MH_R_PalmCrease',_coords)
        else
            _coords = {0.22, -0.24, -0.16, -75.0, 20.0, 0.0}   
            SetPermanentProp('p_oilcan02x','OH_R_Hand',_coords)
        end               

        SetAnim("mech_loco_m@generic@carry@bag_anders@right@idle", "idle",-1,31)
        DisableControl()
    elseif handOil == 0 then
        DeleteEntity(activeProp) 
        activeProp = nil        
    end
end

function SetAnim(animDict,animName,wait,flag)
    Citizen.CreateThread(function()
        ClearPedTasks(PlayerPedId())
        SetCurrentPedWeapon(PlayerPedId(), GetHashKey('WEAPON_UNARMED'), true)
        
        RequestAnimDict(animDict)
        while not HasAnimDictLoaded(animDict) do
            Citizen.Wait(0)
        end

        local flag = flag or 1

        TaskPlayAnim(PlayerPedId(), animDict,animName, 8.0, -8.0, -1, flag, 0, false, false, false) --- 4.0 / 4.0
        if wait ~= -1 then 
            Citizen.Wait(wait)
            ClearPedTasks(PlayerPedId())
        end
    end)
end

function takeOil()
    if Config.disableMinigame then
        SetAnim('amb_work@world_human_repair@high@oilcan@male_b@idle_c','idle_h',3000)
        Citizen.Wait(3000)
        local number = math.random(Config.oilAdd.min,Config.oilAdd.max) 
    
        if handOil + number > maxHandOil then 
            handOil = maxHandOil
            TriggerEvent("Notification:d_labs_oil", 'inform', text.addToHand..handOil..' '..bbl..' ('..text.max..')', Config.Textures.alert[1], Config.Textures.alert[2], 2000)
        else 
            TriggerEvent("Notification:d_labs_oil", 'success', text.addToHand..handOil+number..' '..bbl..' [+'..number..']', Config.Textures.alert[1], Config.Textures.alert[2], 2000)
            handOil = handOil + number
        end
        ClearPedTasksImmediately(PlayerPedId())
        bucketCheck()
    else
        if handOil ~= maxHandOil then
            SendNUIMessage({action = "show"})
            SetNuiFocus(true,true)
        else
            TriggerEvent("Notification:d_labs_oil", 'error', text.notifMaxOil, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
        end
    end
end


function AddOil(here,point)   
    if handOil ~= 0 then
        if not Config.disableManagementSystem.active then
            TriggerServerEvent('d-labs:server:updateContainer',here,handOil,true,point)
        else 
            GoTo(Config.oilContainer[here].coords[point])
            local wait = 4000
            SetAnim('amb_work@world_human_repair@high@oilcan@male_b@idle_c','idle_h',wait)
            Citizen.Wait(wait)     
            TriggerEvent("Notification:d_labs_oil", 'inform', text.reffile..handOil..' '..bbl.. ' / +'..handOil*Config.disableManagementSystem.moneyForOil..'$', Config.Textures.alert[1], Config.Textures.alert[2], 2000)
            if Config.disableManagementSystem.moneyForOil then
                TriggerServerEvent('d-labs:server:addMoneyJob',handOil*Config.disableManagementSystem.moneyForOil)
            end
            handOil = 0 
            bucketCheck()
        end
    else 
        TriggerEvent("Notification:d_labs_oil", 'error', text.noOil, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
    end
end

function StorageWagon()
    Citizen.CreateThread(function()
        StorageWag = true 
        while StorageWag do

            Citizen.Wait(5)
            if DoesEntityExist(activeVehicle) then 

                if GetEntityHealth(activeVehicle) == 0 then  
                    wagonOil = 0
                    StorageWag = false
                    TriggerEvent("Notification:d_labs_oil", 'error', text.notifWagonDamage, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
                end
                

                local wagonCoords = GetEntityCoords(activeVehicle) - GetEntityForwardVector(activeVehicle)*3
                local playerCoords = GetEntityCoords(PlayerPedId())
                local dist = #(wagonCoords-playerCoords)

                
                if dist < 1.5 then 
                    local label = CreateVarString(10, 'LITERAL_STRING', text.wagon..wagonOil..'/'..maxWagonOil)
                    PromptSetActiveGroupThisFrame(PromptGroup6, label)
                    if Citizen.InvokeNative(0xC92AC953F0A982AE,PromptKey6) then
                        addToWagonOil()
                        Citizen.Wait(1000)
                    end 

                    if Citizen.InvokeNative(0xC92AC953F0A982AE,PromptKey7) then
                        removeToWagonOil()
                        Citizen.Wait(1000)
                    end 

                end
            else 
                DelWagon()
            end
        end 
    end)
end


function removeToWagonOil()

    local pcoords = GetEntityCoords(PlayerPedId())
    local wagonCoords = GetEntityCoords(activeVehicle)-GetEntityForwardVector(activeVehicle)*2.2
    GoTo(wagonCoords)
    TaskTurnPedToFaceEntity(PlayerPedId(),activeVehicle,-1)
    Citizen.Wait(1000)

    FreezeEntityPosition(PlayerPedId(),true)
    local wait = 4000
    SetAnim('amb_work@world_human_repair@high@oilcan@male_b@idle_c','idle_h',wait)
    local coords = {0.0,0.0,0.0,0.0,0.0,0.0,}
    Citizen.Wait(wait)        
    FreezeEntityPosition(PlayerPedId(),false)

    local add = maxHandOil - handOil

    if add < wagonOil then 
        handOil = handOil + add
        wagonOil = wagonOil - add
        TriggerEvent("Notification:d_labs_oil", 'success', text.addToHand..handOil..' '..bbl..' ('..text.max..')', Config.Textures.alert[1], Config.Textures.alert[2], 2000)
    elseif wagonOil == 0 then 
        TriggerEvent("Notification:d_labs_oil", 'error', text.notifEmpty, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
    else
        handOil = handOil + wagonOil
        TriggerEvent("Notification:d_labs_oil", 'success', text.addToHand..handOil..' '..bbl..' [+'..wagonOil..']', Config.Textures.alert[1], Config.Textures.alert[2], 2000)
        wagonOil = 0
    end

    bucketCheck()
end



function addToWagonOil()

    if handOil >= 1 then

        local pcoords = GetEntityCoords(PlayerPedId())
        local wagonCoords = GetEntityCoords(activeVehicle)-GetEntityForwardVector(activeVehicle)*2.2
        GoTo(wagonCoords)
        TaskTurnPedToFaceEntity(PlayerPedId(),activeVehicle,-1)
        Citizen.Wait(1000)

        FreezeEntityPosition(PlayerPedId(),true)
        local wait = 4000
        SetAnim('amb_work@world_human_repair@high@oilcan@male_b@idle_c','idle_h',wait)
        Citizen.Wait(wait)        
        FreezeEntityPosition(PlayerPedId(),false)

        if handOil + wagonOil < maxWagonOil then 
            wagonOil = wagonOil + handOil
            TriggerEvent("Notification:d_labs_oil", 'success', text.notifWagonAdd..wagonOil..' '..bbl..' [+'..handOil..']', Config.Textures.alert[1], Config.Textures.alert[2], 2000)
            handOil = 0
        elseif wagonOil == maxWagonOil then 
            TriggerEvent("Notification:d_labs_oil", 'error', text.notifWagonMax, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
        else
            local a = maxWagonOil - wagonOil
            handOil = handOil - a
            wagonOil = maxWagonOil
            TriggerEvent("Notification:d_labs_oil", 'success', text.notifWagonAdd..wagonOil..' '..bbl..' ('..text.notifWagonMax..')', Config.Textures.alert[1], Config.Textures.alert[2], 2000)
        end
        bucketCheck()

    else 
        TriggerEvent("Notification:d_labs_oil", 'error', text.noOil, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
    end


end

function DelWagon()
    DeleteEntity(activeVehicle)
    wagonOil = 0
    StorageWag = false
end 

function SpawnWagon(wagCoords)

    local hash = GetHashKey('OILWAGON01X') 
    local ped = PlayerPedId()
    RequestModel(hash,0)
    while not HasModelLoaded(hash) do
        RequestModel(hash,0)
        Wait(0)
    end

    activeVehicle = CreateVehicle(hash,wagCoords.x,wagCoords.y,wagCoords.z,wagCoords.w,true,false)
    while not DoesEntityExist(activeVehicle) do
        Wait(0)
    end
    SetVehicleOnGroundProperly(activeVehicle,0)
    SetEntityAsMissionEntity(activeVehicle, false, false)
    SetEntityVisible(activeVehicle,true)
    SetModelAsNoLongerNeeded(hash)
end

function setJobFinal() 
    DeleteEntity(activeVehicle)

    TriggerServerEvent('d-labs:server:addMoneyJob',moneyJob)

    TriggerEvent("Notification:d_labs_oil", 'success', text.notifAddMoney..' [+'..moneyJob..']', Config.Textures.alert[1], Config.Textures.alert[2], 2000)
    local index = Config.delivery[lastCity]
    ClearGpsMultiRoute(index.x,index.y,index.z)
    RemoveBlip(blip)
    moneyJob = nil
end


function MakeJob()
    SpawnWagon(lastWagon)
    local index = Config.delivery[lastCity].coords
    local color = GetHashKey("COLOR_YELLOW")
    StartGpsMultiRoute(color, true, true) 
	AddPointToGpsMultiRoute(index.x,index.y,index.z)
	SetGpsMultiRouteRender(true)

    setBlip(index,text.deliveryBlip)

    TriggerServerEvent('d-labs:server:setMenuStatus',false)

    Citizen.CreateThread(function()
        local final = true
        while moneyJob ~= nil do
            Citizen.Wait(5)      
            local pedCoords = GetEntityCoords(PlayerPedId())
            local coordsStats = vector3(index.x,index.y,index.z)
            local dist = #(pedCoords-coordsStats)     
            if dist < 20 then 
                --Citizen.InvokeNative(0x2A32FAA57B937173, 0x94FDAE17, index.x, index.y, index.z-0.96, 0, 0, 0, 0, 0, 0, 5.0, 5.0, 1.0, 126, 0, 0, 80, 0, 0, 2, 0, 0, 0, 0)
                if dist < 2.5 then 
                    local label = CreateVarString(10, 'LITERAL_STRING',text.promptJobFinishDesc)
                    PromptSetActiveGroupThisFrame(PromptGroup9, label)
                    if Citizen.InvokeNative(0xC92AC953F0A982AE,PromptKey9) then
                        local distWagon = #(pedCoords-GetEntityCoords(activeVehicle))     
                        if distWagon < 15 then
                            setJobFinal()
                            final = false
                        else 
                            TriggerEvent("Notification:d_labs_oil", 'error', text.wagonAway, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
                        end
                        Citizen.Wait(2000)
                    end 
                end 
            end  

            if DoesEntityExist(activeVehicle) then 
                if GetEntityHealth(activeVehicle) == 0 and final then  
                    local index = Config.delivery[lastCity]
                    ClearGpsMultiRoute(index.x,index.y,index.z)
                    moneyJob = nil
                    RemoveBlip(blip)

                    Citizen.Wait(1000)
                    TriggerEvent("Notification:d_labs_oil", 'error', text.wagonDestroyed, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
                end
            end
        end
    end)
end

function setupStandardJob(_value)
    lastCity = _value.k
    moneyJob = Config.disableManagementSystem.moneyForDelivery + _value.money
    MakeJob()
end

function SetupJob(_value)
    local value = _value.tab
    local name = _value.label
    local container = 0 
        
    MenuData.CloseAll()

    for k,v in pairs(value) do
        if v.label == name then
            container  = v.container 
        end
    end

    local percento = tonumber(container) / 100 
    local priceFor = tonumber(container) / 100 * Config.PriceForGalon
    local elements = {}

    if container < 25 then
        table.insert(elements, { label = text.deliveryLow..' - '..(percento*100)..' ['..(priceFor*100)+moneyPlusDistance..'$]', value = {prc = percento*100, money = (priceFor*100)+moneyPlusDistance} , desc = text.menuDeliveryDesc  })
    elseif container < 50 then
        table.insert(elements, { label = text.deliveryLow..' - '..(percento*50)..' ['..(priceFor*50)+moneyPlusDistance..'$]', value = {prc = percento*50, money = (priceFor*50)+moneyPlusDistance}, desc = text.menuDeliveryDesc })
        table.insert(elements, { label = text.deliveryMedium..' - '..(percento*100)..' ['..(priceFor*100)+moneyPlusDistance..'$]', value ={prc = percento*100, money = (priceFor*100)+moneyPlusDistance}, desc = text.menuDeliveryDesc })
    else
        table.insert(elements, { label = text.deliveryLow..' - '..(percento*10)..' ['..(priceFor*10)+moneyPlusDistance..'$]', value = {prc = percento*10, money = (priceFor*10)+moneyPlusDistance} , desc = text.menuDeliveryDesc })
        table.insert(elements, { label = text.deliveryMedium..' - '..(percento*25)..' ['..(priceFor*25)+moneyPlusDistance..'$]', value ={prc = percento*25, money = (priceFor*25)+moneyPlusDistance}, desc = text.menuDeliveryDesc })
        table.insert(elements, { label = text.deliveryHigh..' - '..(percento*50)..' ['..(priceFor*50)+moneyPlusDistance..'$]', value = {prc = percento*50, money = (priceFor*50)+moneyPlusDistance}, desc = text.menuDeliveryDesc })
    end

    MenuData.Open('default', GetCurrentResourceName(), 'd_labs_oil_job_3',
        {
            title    = name,
            align    = Config.MenuPos,
            elements = elements,
        },

        function(data, menu)
            moneyJob = data.current.value.money
            TriggerServerEvent('d-labs:server:deleteContainer',data.current.value,name)
            MakeJob()
            menu.close()
        end,

    function(data, menu)
        menu.close()
        TriggerServerEvent('d-labs:server:setMenuStatus',false)
    end) 

end

RegisterNetEvent('d-labs:client:jobSetup')
AddEventHandler('d-labs:client:jobSetup', function(tab)
    MenuData.CloseAll()
    local elements = {}

    if tab[1] == nil then
        table.insert(elements, { label = text.menuNoContainer, value = {tab = tab,label = nil}, desc = text.menuDeliverySelectDesc })
    else
        for k, v in pairs(tab) do 
            table.insert(elements, { label = v.label..' [ '..v.container..' ]', value = {tab = tab,label = v.label}, desc = text.menuDeliverySelectDesc }) 
        end
    end

        MenuData.Open('default', GetCurrentResourceName(), 'd_labs_oil_job_2',
        {
            title    = text.menuTitleManagement,
            align    = Config.MenuPos,
            elements = elements,
        },

        function(data, menu)
            if data.current.label ~= text.menuNoContainer then 
                SetupJob(data.current.value)
                menu.close()
            end
        end,
            

    function(data, menu)
        menu.close()
        TriggerServerEvent('d-labs:server:setMenuStatus',false)
    end)


end)

RegisterNetEvent('d-labs:client:setMenuStatus')
AddEventHandler('d-labs:client:setMenuStatus', function(status)
    deliveryOpen = status
end)

function openJobMenu()
    if not deliveryOpen then
        TriggerServerEvent('d-labs:server:setMenuStatus',true)

        MenuData.CloseAll()

        local elements = {}

        for k, v in pairs(Config.delivery) do 
            if v.distanceMultiplier == 1.0 then 
                table.insert(elements, { label = k, value = {k = k, money = 0}, desc = 'for job' })
            else
                if v.distanceMultiplier < 1.0 then
                    local sign = '-'

                    local pcoords = GetEntityCoords(PlayerPedId())
                    local New = v.coords
                    local vec3 = vector3(New.x, New.y, New.z)
                    local dist = #(pcoords - vec3) / 1000
            
                    local NewReward = dist * v.distanceMultiplier
                    local roundPrice = math.floor(NewReward * 100 + 0.5) / 100
            
                    table.insert(elements, { label = k .. ' [' .. sign .. roundPrice .. '$]', value = {k = k, money = -roundPrice}, desc = text.menuDeliveryLocationDesc })
                                
                else       
                    local sign = '+'
                    
                    local pcoords = GetEntityCoords(PlayerPedId())
                    local New = v.coords
                    local vec3 = vector3(New.x, New.y, New.z)
                    local dist = #(pcoords - vec3) / 1000
            
                    local NewReward = dist * v.distanceMultiplier
                    local roundPrice = math.floor(NewReward * 100 + 0.5) / 100
            
                    table.insert(elements, { label = k .. ' [' .. sign .. roundPrice .. '$]', value = {k = k, money = roundPrice}, desc = text.menuDeliveryLocationDesc })
                end
            end
        end
        
        
        MenuData.Open('default', GetCurrentResourceName(), 'd_labs_oil_job',
            {
                title    = text.menuTitleManagement,
                align    = Config.MenuPos,
                elements = elements,
            },

            function(data, menu)
                lastCity = data.current.value.k
                moneyPlusDistance = data.current.value.money
                if Config.disableManagementSystem.moneyForDelivery then                      
                    setupStandardJob(data.current.value)
                else 
                    TriggerServerEvent('d-labs:server:jobSetup',data.current.value.k)
                end
            

                menu.close()
            end,
        

        function(data, menu)
            menu.close()
            TriggerServerEvent('d-labs:server:setMenuStatus',false)
        end)

    else 
        TriggerEvent("Notification:d_labs_oil", 'error', text.notifMenuUse, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
    end
end 

function doCraft()

    MenuData.CloseAll()

    local elements = {}

    local craftingTime = 10

    for c,b in pairs(Config.craftingItem) do 
        local add = text.recipe..'<br>'
        local nameCraft = c
        local craftingTime = b.craftingTime


        if not b.oilCost then 
            b.oilCost = 0            
        end

        if Config.disableManagementSystem.active then
            b.oilCost = 0  
        end

        if b.oilCost >= 1  then 
            add = text.recipe..'<br>'..text.oil..' '..b.oilCost..' '..Config.oilUnits..'<br>'
        elseif not b.ingredients and b.oilCost <= 0 then
            add = text.free
        end
            
        ---------------- Item label ---------------- 

        if framework == 'RSG' then 
            if b.ingredients ~= false then
                for k,v in pairs(b.ingredients) do
                    local amount = v.amount
                    if RSGCore.Shared.Items[v.item] then 
                        add = add..' x'..amount..' '..RSGCore.Shared.Items[v.item].label ..'<br>'
                    else 
                        print(v.item..' - not found')
                        add = add..' x'..amount..' '..v.item..'<br>'
                    end
                end
            end

            if RSGCore.Shared.Items[nameCraft] then
                nameCraft = RSGCore.Shared.Items[nameCraft].label
            else 
                print(nameCraft..' - not found')
                nameCraft = nameCraft
            end

        elseif framework == "VORP" then 
            if b.ingredients ~= false then
                for k,v in pairs(b.ingredients) do
                    local amount = v.amount

                    CustomLabel = nil                
                    TriggerServerEvent('d-labs:server:getCustomLabel',v.item)
                    while CustomLabel == nil do
                        Citizen.Wait(0)
                    end
                    
                    add = add..' x'..amount..' '..CustomLabel..'<br>'
                end
            end

            CustomLabel = nil
            TriggerServerEvent('d-labs:server:getCustomLabel',c)
            while CustomLabel == nil do
                Citizen.Wait(0)
            end
            nameCraft = CustomLabel


        elseif framework == "REDEMRP_2023" then 
            if b.ingredients ~= false then
                for k,v in pairs(b.ingredients) do
                    local amount = v.amount

                    CustomLabel = nil                
                    TriggerServerEvent('d-labs:server:getCustomLabel',v.item)
                    while CustomLabel == nil do
                        Citizen.Wait(0)
                    end
                    
                    add = add..' x'..amount..' '..CustomLabel..'<br>'
                end
            end

            CustomLabel = nil
            TriggerServerEvent('d-labs:server:getCustomLabel',c)
            while CustomLabel == nil do
                Citizen.Wait(0)
            end
            nameCraft = CustomLabel

        elseif framework == "QBR" then 
            
            if b.ingredients ~= false then
                for k,v in pairs(b.ingredients) do
                    local amount = v.amount
                    if QBRItems[v.item] then 
                        add = add..' x'..amount..' '..QBRItems[v.item].label ..'<br>'
                    else 
                        print(v.item..' - not found')
                        add = add..' x'..amount..' '..v.item..'<br>'
                    end
                end
            end

            if QBRItems[nameCraft] then
                nameCraft = QBRItems[nameCraft].label
            else 
                print(nameCraft..' - not found')
                nameCraft = nameCraft
            end
            

        else 
            if b.ingredients then
                for k,v in pairs(b.ingredients) do
                    local amount = v.amount
                    add = add..' x'..amount..' '..v.item..'<br>'
                end
            end
        end

        if b.ingredients ~= false then
            table.insert(elements, { label = nameCraft, value = {ing = b.ingredients,oil = b.oilCost,item = c}, desc = add })
        else 
            table.insert(elements, { label = nameCraft, value = {ing = false,oil = b.oilCost,item = c}, desc = add })
        end
    end
    

    MenuData.Open('default', GetCurrentResourceName(), 'd_labs_oil_job_craft',
        {
            title    = text.menuTitleCraft,
            align    = Config.MenuPos,
            elements = elements,
        },

        function(data, menu)
            if data.current.value.oil >= 1 then
                TriggerServerEvent('d-labs:server:craftCheck',data.current.value,craftingTime)
            else 
                TriggerServerEvent('d-labs:server:craftItem',false,data.current.value, craftingTime)
            end
          
            menu.close()
        end,
    

    function(data, menu)
        menu.close()
        isBusy = false
    end)
end



Citizen.CreateThread(function()
    while true do 
        local pedCoords = GetEntityCoords(PlayerPedId())
        show = false

        if not Config.disableManagementSystem.active then
            for k,v in pairs(Config.management) do 
                local dist = #(pedCoords-v)            
                if dist < 15 then 
                    show = true
                    --Citizen.InvokeNative(0x2A32FAA57B937173, 0x94FDAE17, v.x, v.y, v.z-1.1, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.3, 126, 0, 0, 125, 0, 0, 2, 0, 0, 0, 0)
                    if dist < 2.5 and isBusy == false then 
                        local label  = CreateVarString(10, 'LITERAL_STRING', text.promptBossDesc)
                        PromptSetActiveGroupThisFrame(PromptGroup, label)
                        if Citizen.InvokeNative(0xC92AC953F0A982AE,PromptKey) then
                            if isJob() and isBoss() then

                                isBusy = true
                                TriggerServerEvent('d-labs:server:containerStats')

                            end
                            Citizen.Wait(2000)
                        end 
                    end 
                end          
            end
        end
   
        for k,v in pairs(Config.wagon) do 
            local dist = #(pedCoords-v.menuCoords)            
            if dist < 15 then 
                show = true
                --Citizen.InvokeNative(0x2A32FAA57B937173, 0x94FDAE17, v.menuCoords.x, v.menuCoords.y, v.menuCoords.z-1.1, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.3, 150, 0, 0, 125, 0, 0, 2, 0, 0, 0, 0)
                if dist < 2.5 and isBusy == false then 
                    local label  = CreateVarString(10, 'LITERAL_STRING', text.wagonOut)

                    if wagonOut then 
                        label  = CreateVarString(10, 'LITERAL_STRING', text.wagonIn)
                    end

                    PromptSetActiveGroupThisFrame(PromptGroup2, label)
                    if Citizen.InvokeNative(0xC92AC953F0A982AE,PromptKey2) then
                        if isJob() then
                            if wagonOut == false then 
                                if moneyJob == nil then
                                    wagonOut = true 
                                    TriggerEvent("Notification:d_labs_oil", 'success', text.wagonSpawned, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
                                    local index = k
                                    local wagCoords = Config.wagon[index].wagon
                                    SpawnWagon(wagCoords)
                                    StorageWagon()
                                else 
                                    TriggerEvent("Notification:d_labs_oil", 'error', text.jobActive, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
                                end
                            else 
                                wagonOut = false
                                TriggerEvent("Notification:d_labs_oil", 'success', text.wagonDeSpawned, Config.Textures.alert[1], Config.Textures.alert[2], 2000)
                                DelWagon()
                            end
                        end
                        Citizen.Wait(2000)
                    end 
                end 
            end        
        end

        for k,v in pairs(Config.oilContainer) do
            local name = k 
            for k,v in pairs(v.coords) do
                local coordsf = vector3(v.x,v.y,v.z)
                local dist = #(pedCoords-coordsf)              
                if dist < 15 then 
                    show = true
                    --Citizen.InvokeNative(0x2A32FAA57B937173, 0x94FDAE17, coordsf.x,coordsf.y, coordsf.z-1.1, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.3, 126, 0, 0, 125, 0, 0, 2, 0, 0, 0, 0)
                    if dist < 2.5 and isBusy == false then 
                        local label  = CreateVarString(10, 'LITERAL_STRING', text.promptContainerDesc..' - '..name)
                        PromptSetActiveGroupThisFrame(PromptGroup3, label)
                        
                        if Citizen.InvokeNative(0xC92AC953F0A982AE,PromptKey3) then
                            if isJob() then
                                AddOil(name,k)
                                Citizen.Wait(2000)
                            end
                        end 

                        if not Config.disableManagementSystem.active then
                            if Citizen.InvokeNative(0xC92AC953F0A982AE,PromptKey5) then
                                if isJob() then
                                    TriggerServerEvent('d-labs:server:showStats',name)
                                    Citizen.Wait(2000)
                                end
                            end 
                        end
                    end 
                end        
            end
        end

        for k,v in pairs(Config.oilWell) do 
            local coordsStats = vector3(v.x,v.y,v.z)
            local dist = #(pedCoords-coordsStats)      
            if dist < 15 then 
                show = true
                --Citizen.InvokeNative(0x2A32FAA57B937173, 0x94FDAE17, v.x, v.y, v.z-1.1, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.3, 126, 0, 0, 125, 0, 0, 2, 0, 0, 0, 0)
                if dist < 2.5 and isBusy == false then 
                    local label = CreateVarString(10, 'LITERAL_STRING', text.promptOilWellDesc)
                    PromptSetActiveGroupThisFrame(PromptGroup4, label)
                    if Citizen.InvokeNative(0xC92AC953F0A982AE,PromptKey4) then
                        if isJob() then
                            takeOil()
                            Citizen.Wait(2000)
                        end
                    end 
                end 
            end        
        end

        if Peds[1] ~= nil then 
            for k,v in pairs(Peds) do
                local coordsf = GetEntityCoords(v.ped)
                local dist = #(pedCoords-coordsf) 
                if dist < 2.5 and moneyJob == nil then 
                    show = true
                    local label  = CreateVarString(10, 'LITERAL_STRING', text.promptJobDesc)
                    PromptSetActiveGroupThisFrame(PromptGroup8, label)
                    if Citizen.InvokeNative(0xC92AC953F0A982AE,PromptKey8) then
                        if isJob() then
                            lastWagon = v.wagon
                            openJobMenu()
                        end
                    end 
                end       
            end
        end

        if Config.Crafting then
            for k,v in pairs(Config.craftingSpot) do 
                local coordsStats = vector3(v.x,v.y,v.z)
                local dist = #(pedCoords-coordsStats)     
                if dist < 15 then 
                    show = true
                    --Citizen.InvokeNative(0x2A32FAA57B937173, 0x94FDAE17, v.x, v.y, v.z-1.1, 0, 0, 0, 0, 0, 0, 1.0, 1.0, 0.3, 126, 0, 0, 125, 0, 0, 2, 0, 0, 0, 0)
                    if dist < 1.5 and isBusy == false then 
                        local label = CreateVarString(10, 'LITERAL_STRING',text.promptCraftDesc)
                        PromptSetActiveGroupThisFrame(PromptGroup10, label)
                        if Citizen.InvokeNative(0xC92AC953F0A982AE,PromptKey10) then
                            if isJob() then
                                doCraft()
                                lastCraftPos = v
                                isBusy = true
                                Citizen.Wait(2000)
                            end
                        end 
                    end 
                end        
            end
        end

        if not show then
            Citizen.Wait(2000)
        else 
            Citizen.Wait(0)
        end
    end
end)


Config.NpcTable = {
    [1] = 's_m_m_cornwallguard_01',
}


Citizen.CreateThread(function()
    if Config.NpcClear then
        while true do 
            local clearPos = vector3(480.7610, 678.6547, 127.4082)
            local dist = #(GetEntityCoords(PlayerPedId()) - clearPos)     
            if dist < 200 then                
                local pedPool = GetGamePool('CPed')

                for k,v in pairs(Config.NpcTable) do
                    for i = 1, #pedPool do
                        local distance = #(GetEntityCoords(pedPool[i]) - clearPos)
                        if distance < 200 and GetHashKey(v) == GetEntityModel(pedPool[i]) and pedPool[i] ~= PlayerPedId() then
                            DeleteEntity(pedPool[i])
                        end
                    end
                end
            end
            Citizen.Wait(10000)
        end
    end
end)

Citizen.CreateThread(function()
    for k,v in pairs(Config.deliveryMenu) do

        model = GetHashKey(v.model)
		RequestModel(model)
		while not HasModelLoaded(model) do
			Wait(0)
		end
        
		local ped = CreatePed(model, v.pos.x,v.pos.y,v.pos.z-1.05,v.pos.w , false, true)
		Wait(1)
		SetBlockingOfNonTemporaryEvents(ped, true)
		SetPedCanPlayAmbientAnims(ped, true)
		SetPedCanRagdollFromPlayerImpact(ped, false)
		SetEntityInvincible(ped, true)
		SetPedFleeAttributes(ped, 0, false)
		FreezeEntityPosition(ped, true)
		NetworkSetEntityInvisibleToNetwork(ped, true)
		Citizen.InvokeNative(0x283978A15512B2FE, ped, true)

        table.insert(Peds, {ped = ped, wagon = v.wagon})
    end 
end)


------------- onResourceStop

AddEventHandler('onResourceStop', function(resName)
    if resName ~= GetCurrentResourceName() then return end

    for _,ent in pairs(Peds) do
        DeleteEntity(ent.ped)
        DeletePed(ent.ped)
        SetEntityAsNoLongerNeeded(ent.ped)
    end

    if lastCity ~= nil then
        local index = Config.delivery[lastCity]
        ClearGpsMultiRoute(index.x,index.y,index.z)
    end

    DeleteEntity(activeVehicle)
    DeleteEntity(activeProp)
    ClearPedTasks(PlayerPedId())

    RemoveBlip(blip)

    MenuData.CloseAll()

    for i,v in pairs(prompts) do 
        PromptDelete(v)
    end

end)


RegisterNetEvent('d-labs:server:getCustomLabel')
AddEventHandler('d-labs:server:getCustomLabel', function(_)
    CustomLabel = _
end)



------------- Notification

RegisterNetEvent('Notification:d_labs_oil')
AddEventHandler('Notification:d_labs_oil', function(t1, t2, dict, txtr, timer)
	if not HasStreamedTextureDictLoaded(dict) then
		RequestStreamedTextureDict(dict, true) 
		while not HasStreamedTextureDictLoaded(dict) do
			Citizen.Wait(5)
		end
	end
	local parentResource = GetCurrentResourceName()
	if Config.Server.NotifCustom ~= true then
		if txtr ~= nil then
			exports[parentResource].LeftNot(0, tostring(t1), tostring(t2), tostring(dict), tostring(txtr), tonumber(timer))
		else
			local txtr = "tick"
			exports[parentResource].LeftNot(0, tostring(t1), tostring(t2), tostring(dict), tostring(txtr), tonumber(timer))
		end
	else 
		openCustomNotif(t1, t2, dict, txtr, timer)
	end
end)


if Config.Debug then
    RegisterCommand('addoil', function(source, args)
        local argsOne = args[1]
        local argsTwo = tonumber(args[2])
        local argsTree = args[3]

        if argsTree == nil then 
            argsTree = true
        else 
            argsTree = false
        end

        handOil = tonumber(args[1])

        bucketCheck()

    end)
end


