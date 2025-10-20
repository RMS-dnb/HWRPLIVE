local RSGCore = exports['rsg-core']:GetCoreObject()
local options = {}
local jobaccess


------------------------------------------------------------------------------------------------------
-- weaponsmith : inspect and clean held weapon : command = /inspect
------------------------------------------------------------------------------------------------------

RegisterNetEvent('rsg-weaponsmith:client:inspectweapon', function()
    local retval, weaponHash = GetCurrentPedWeapon(PlayerPedId(), true, 0, true) 
    local interaction = "LONGARM_HOLD_ENTER"
    local act = joaat("LONGARM_CLEAN_ENTER")
    local object = GetObjectIndexFromEntityIndex(GetCurrentPedWeaponEntityIndex(PlayerPedId(),0))
    local cleaning = false 
    Citizen.InvokeNative(0xCB9401F918CB0F75, PlayerPedId(), "GENERIC_WEAPON_CLEAN_PROMPT_AVAILABLE", true, -1)
    if Citizen.InvokeNative(0xD955FEE4B87AFA07,weaponHash) then
        interaction = "SHORTARM_HOLD_ENTER"
        act = joaat("SHORTARM_CLEAN_ENTER")
    end
    if weaponHash ~= -1569615261 then
        TaskItemInteraction(PlayerPedId(), weaponHash, joaat(interaction), 0,0,0) 
        showstats()
        while not Citizen.InvokeNative(0xEC7E480FF8BD0BED,PlayerPedId()) do
            Wait(300)
        end          
        while Citizen.InvokeNative(0xEC7E480FF8BD0BED,PlayerPedId()) do
            Wait(1) 
            if IsDisabledControlJustReleased(0,3002300392) then
                ClearPedTasks(PlayerPedId(),1,1)
                Citizen.InvokeNative(0x4EB122210A90E2D8, -813354801)            
            end
            if IsDisabledControlJustReleased(0,3820983707) and not cleaning then
                cleaning = true 
                local Cloth= CreateObject(joaat('s_balledragcloth01x'), GetEntityCoords(PlayerPedId()), false, true, false, false, true)
                local PropId = joaat("CLOTH")
                Citizen.InvokeNative(0x72F52AA2D2B172CC,  PlayerPedId(), 1242464081, Cloth, PropId, act, 1, 0, -1.0)  
                Wait(9500) 
                ClearPedTasks(PlayerPedId(),1,1)
                Citizen.InvokeNative(0x4EB122210A90E2D8, -813354801)
                Citizen.InvokeNative(0xA7A57E89E965D839,object,0.0,0)
                Citizen.InvokeNative(0x812CE61DEBCAB948,object,0.0,0)
                break
            end
        end
        Citizen.InvokeNative(0x4EB122210A90E2D8, -813354801)    
    end
end)

function showstats()
    local _, weapon = GetCurrentPedWeapon(PlayerPedId(), true, 0, true) 
    if weapon then    
        local uiFlowBlock = RequestFlowBlock(joaat("PM_FLOW_WEAPON_INSPECT"))
        local uiContainer = DatabindingAddDataContainerFromPath("" , "ItemInspection")
        Citizen.InvokeNative(0x46DB71883EE9D5AF, uiContainer, "stats", getWeaponStats(weapon), PlayerPedId())
        DatabindingAddDataString(uiContainer, "tipText", 'Weapon Information')
        DatabindingAddDataHash(uiContainer, "itemLabel", weapon)
        DatabindingAddDataBool(uiContainer, "Visible", true)

        Citizen.InvokeNative(0x10A93C057B6BD944, uiFlowBlock)
        Citizen.InvokeNative(0x3B7519720C9DCB45, uiFlowBlock, 0)
        Citizen.InvokeNative(0x4C6F2C4B7A03A266, -813354801, uiFlowBlock)
    end
end

function getWeaponStats(weaponHash) 
    local emptyStruct = DataView.ArrayBuffer(256)
    local charStruct = DataView.ArrayBuffer(256)
    Citizen.InvokeNative(0x886DFD3E185C8A89, 1, emptyStruct:Buffer(), joaat("CHARACTER"), -1591664384, charStruct:Buffer())
        
    local unkStruct = DataView.ArrayBuffer(256)
    Citizen.InvokeNative(0x886DFD3E185C8A89, 1, charStruct:Buffer(), 923904168, -740156546, unkStruct:Buffer())

    local weaponStruct = DataView.ArrayBuffer(256)
    Citizen.InvokeNative(0x886DFD3E185C8A89, 1, unkStruct:Buffer(), weaponHash, -1591664384, weaponStruct:Buffer())
    return weaponStruct:Buffer()
end
