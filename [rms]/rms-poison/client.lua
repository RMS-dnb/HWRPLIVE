-- local RSGCore = exports['rsg-core']:GetCoreObject()

-- local PoisonSystem = {
--     stages = {
--         {level = 20, description = "Difficulty breathing"},
--         {level = 40, description = "Limbs failing"},
--         {level = 60, description = "Severe muscle weakness"},
--         {level = 80, description = "Critical condition"}
--     },
    
--     config = {
--         progressInterval = 10000,
--         runningPenalty = 5,
--         maxPoisonLevel = 100
--     },

--     state = {
--         isPoisoned = false,
--         poisonLevel = 0,
--         antidoteUsed = false,
--         processedStages = {}
--     }
-- }

-- function PoisonSystem:Initialize()
--     Citizen.CreateThread(function()
--         while true do
--             Citizen.Wait(self.config.progressInterval)
--             self:ProcessPoisonProgression()
--         end
--     end)
-- end

-- function PoisonSystem:IncreasePoisonLevel(amount)
--     if not self.state.isPoisoned then return end
    
--     self.state.poisonLevel = self.state.poisonLevel + (amount or 1)
--     if self.state.poisonLevel > self.config.maxPoisonLevel then
--         self.state.poisonLevel = self.config.maxPoisonLevel
--     end
-- end

-- function PoisonSystem:ProcessPoisonProgression()
--     if not self.state.isPoisoned or self.state.antidoteUsed then return end

--     local ped = PlayerPedId()
    
--     self:IncreasePoisonLevel()
    
--     if IsPedRunning(ped) then
--         self:IncreasePoisonLevel(self.config.runningPenalty)
--     end

--     for _, stage in ipairs(self.stages) do
--         if self.state.poisonLevel >= stage.level and not self.state.processedStages[stage.level] then
--             self:TriggerStageEffect(stage, ped)
--             self.state.processedStages[stage.level] = true
--         end
--     end

--     if self.state.poisonLevel >= self.config.maxPoisonLevel then
--         self:EndPoisonEffect(true)
--     end
-- end

-- function PoisonSystem:TriggerStageEffect(stage, ped)
--     TriggerEvent('rNotify:NotifyLeft', stage.description, "Seek Help", "generic_textures", "tick", 10000)
    
--     if stage.level == 20 then
--         RequestAnimDict("amb_misc@world_human_coughing@male_c@wip_base")
--         TaskPlayAnim(ped, "amb_misc@world_human_coughing@male_c@wip_base", "wip_base", 8.0, -8.0, 60000, 0, 0, true, 0, false, 0, false)
--         SetPedToRagdoll(ped, 10000, 10000, 0, 0, 0, 0)
--     elseif stage.level == 40 then
--         AnimpostfxPlay("PoisonDartPassOut")
--         DoScreenFadeOut(2000)
--         Wait(3000)
--         TaskStartScenarioInPlace(ped, GetHashKey('WORLD_HUMAN_SLEEP_GROUND_ARM'), -1, false, "test", 0, false)
--         DoScreenFadeIn(5000)
--     elseif stage.level == 60 then
--         SetPedToRagdoll(ped, 15000, 15000, 0, 0, 0, 0)
--     elseif stage.level == 80 then
--         local pl = Citizen.InvokeNative(0x217E9DC48139933D)
--         local fatal_ped = Citizen.InvokeNative(0x275F255ED201B937, pl)
--         Citizen.InvokeNative(0x697157CED63F18D4, fatal_ped, 500000, false, true, true)
--     end
-- end

-- function PoisonSystem:TriggerPoison()
--     self.state.isPoisoned = true
--     self.state.poisonLevel = 0
--     self.state.processedStages = {}
--     AnimpostfxPlay("ODR3_Injured01Loop")
--     --TriggerEvent('rNotify:ShowSimpleCenterText', "Venomous Bite Detected - Seek Treatment", 10000)
-- end

-- function loadAnimDict(dict)
--     RequestAnimDict(dict)
--     while not HasAnimDictLoaded(dict) do
--         Citizen.Wait(10)
--     end
--     return dict
-- end

-- function PoisonSystem:UseAntidote()
--     local ped = PlayerPedId()
    
--     if isBusy then return end
--     isBusy = true
--     LocalPlayer.state:set("inv_busy", true, true)
--     SetCurrentPedWeapon(ped, GetHashKey("weapon_unarmed"))
    
--     local pcoords = GetEntityCoords(ped)
--     local itemInHand = CreateObject(GetHashKey("p_bottleJD01x"), pcoords.x, pcoords.y, pcoords.z, true, false, false)
--     AttachEntityToEntity(itemInHand, ped, GetEntityBoneIndexByName(ped, "PH_R_HAND"), 0.00, 0.00, 0.04, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
    
--     if not IsPedOnMount(ped) and not IsPedInAnyVehicle(ped) and not IsPedUsingAnyScenario(ped) then
--         local dict = loadAnimDict('mech_inventory@drinking@bottle_cylinder_d1-3_h30-5_neck_a13_b2-5')
--         TaskPlayAnim(ped, dict, 'uncork', 5.0, 5.0, -1, 31, false, false, false)
--         Wait(500)
--         TaskPlayAnim(ped, dict, 'chug_a', 5.0, 5.0, -1, 31, false, false, false)
--         Wait(5000)
--         ClearPedTasks(ped)
--     elseif IsPedOnMount(ped) or IsPedUsingAnyScenario(ped) then
--         --TaskItemInteraction_2(ped, 1737033966, itemInHand, GetHashKey("p_bottleJD01x_ph_r_hand"), GetHashKey("DRINK_Bottle_Cylinder_d1-55_H18_Neck_A8_B1-8_QUICK_RIGHT_HAND"), true, 0, 0)
--         Citizen.InvokeNative(0x2208438012482A1A, ped, true, true)
--         Wait(4000)
--     end
    
--     DeleteObject(itemInHand)
    
--     self.state.antidoteUsed = true
--     self:EndPoisonEffect()
    
--     LocalPlayer.state:set("inv_busy", false, true)
--     isBusy = false
-- end

-- function PoisonSystem:EndPoisonEffect(fatal)
--     local ped = PlayerPedId()
--     AnimpostfxStop("ODR3_Injured01Loop")
    
--     self.state.isPoisoned = false
--     self.state.poisonLevel = 0
--     self.state.antidoteUsed = false
--     self.state.processedStages = {}

--     if fatal then
--         SetEntityHealth(ped, 0)
--     end
-- end

-- Citizen.CreateThread(function()
--     PoisonSystem:Initialize()
    
--     while true do
--         Citizen.Wait(0)
--         local size = GetNumberOfEvents(0)
        
--         if size > 0 then
--             for i = 0, size - 1 do
--                 local eventAtIndex = GetEventAtIndex(0, i)
                
--                 if eventAtIndex == GetHashKey("EVENT_ENTITY_DAMAGED") then
--                     local eventData = DataView.ArrayBuffer(128)
--                     if Citizen.InvokeNative(0x57EC5FA4D4D6AFCA, 0, i, eventData:Buffer(), 9) then
--                         local targetPed = eventData:GetInt32(0)
                        
--                         local ammo = eventData:GetInt32(24)
--                         local isPoisonWeapon = ammo == GetHashKey("AMMO_THROWING_KNIVES_POISON") or 
--                                                ammo == GetHashKey("AMMO_ARROW_POISON")
                        
--                         local snake = eventData:GetInt32(8)
--                         local isSnakeBite = false
                        
--                         if snake then
--                             local model = GetEntityModel(snake)
--                             for _, snakeConfig in pairs(Config.Snakes) do
--                                 if model == GetHashKey(snakeConfig.model) then
--                                     isSnakeBite = true
--                                     break
--                                 end
--                             end
--                         end
                        
--                         if targetPed == PlayerPedId() and (isPoisonWeapon or isSnakeBite) then
--                             PoisonSystem:TriggerPoison()
--                         end
--                     end
--                 end
--             end
--         end
--     end
-- end)

-- RegisterNetEvent('RMS_Poison:UseAntidote')
-- AddEventHandler('RMS_Poison:UseAntidote', function()
--     PoisonSystem:UseAntidote()
-- end)

local RSGCore = exports['rsg-core']:GetCoreObject()

local PoisonSystem = {
    stages = {
        {level = 20, description = "Difficulty breathing", duration = 60000},
        {level = 40, description = "Limbs failing", duration = 45000},
        {level = 60, description = "Severe muscle weakness", duration = 30000},
        {level = 80, description = "Critical condition", duration = 15000}
    },
    
    config = {
        progressInterval = 10000,
        runningPenalty = 5,
        maxPoisonLevel = 100,
        baseProgressRate = 1,
        staminaDrainMultiplier = 1.5,
        healthDrainRate = 2
    },

    state = {
        isPoisoned = false,
        poisonLevel = 0,
        antidoteUsed = false,
        processedStages = {},
        poisonStartTime = 0,
        lastStaminaDrain = 0
    },

    -- Add different poison types
    poisonTypes = {
        ["snake"] = {multiplier = 1.0, description = "Venomous bite"},
        ["arrow"] = {multiplier = 1.2, description = "Poison arrow wound"},
        ["knife"] = {multiplier = 0.8, description = "Poisoned blade cut"}
    }
}

-- Add error handling and validation
function PoisonSystem:ValidateState()
    if self.state.poisonLevel < 0 then
        self.state.poisonLevel = 0
    elseif self.state.poisonLevel > self.config.maxPoisonLevel then
        self.state.poisonLevel = self.config.maxPoisonLevel
    end
end

function PoisonSystem:Initialize()
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(self.config.progressInterval)
            if self.state.isPoisoned then
                self:ProcessPoisonProgression()
            end
        end
    end)
    
    -- Add stamina drain thread
    Citizen.CreateThread(function()
        while true do
            Citizen.Wait(1000)
            if self.state.isPoisoned then
                self:DrainStamina()
            end
        end
    end)
end

function PoisonSystem:IncreasePoisonLevel(amount, poisonType)
    if not self.state.isPoisoned then return end
    
    local multiplier = 1.0
    if poisonType and self.poisonTypes[poisonType] then
        multiplier = self.poisonTypes[poisonType].multiplier
    end
    
    local adjustedAmount = (amount or self.config.baseProgressRate) * multiplier
    self.state.poisonLevel = self.state.poisonLevel + adjustedAmount
    
    self:ValidateState()
    
    -- Trigger client event for UI updates
    TriggerEvent('poison:updateLevel', self.state.poisonLevel)
end

function PoisonSystem:DrainStamina()
    if not self.state.isPoisoned then return end
    
    local ped = PlayerPedId()
    local currentStamina = GetPedStaminaNormalized(ped)
    local drainAmount = (self.state.poisonLevel / 100) * self.config.staminaDrainMultiplier
    
    -- Gradually reduce max stamina
    local newStamina = math.max(0, currentStamina - (drainAmount / 100))
    RestorePedStamina(ped, -drainAmount)
end

function PoisonSystem:ProcessPoisonProgression()
    if not self.state.isPoisoned or self.state.antidoteUsed then return end

    local ped = PlayerPedId()
    
    -- Check if player is in a safe zone (hospitals, doctors, etc.)
    if self:IsInSafeZone() then
        return -- Pause progression in safe zones
    end
    
    self:IncreasePoisonLevel()
    
    -- Increase penalty for running
    if IsPedRunning(ped) then
        self:IncreasePoisonLevel(self.config.runningPenalty)
    end
    
    -- Add health drain for severe stages
    if self.state.poisonLevel >= 60 then
        local currentHealth = GetEntityHealth(ped)
        local healthDrain = math.floor(self.config.healthDrainRate * (self.state.poisonLevel / 100))
        SetEntityHealth(ped, math.max(1, currentHealth - healthDrain))
    end

    -- Process stage effects
    for _, stage in ipairs(self.stages) do
        if self.state.poisonLevel >= stage.level and not self.state.processedStages[stage.level] then
            self:TriggerStageEffect(stage, ped)
            self.state.processedStages[stage.level] = true
        end
    end

    -- Check for fatal condition
    if self.state.poisonLevel >= self.config.maxPoisonLevel then
        self:EndPoisonEffect(true)
    end
end

function PoisonSystem:IsInSafeZone()
    local playerPos = GetEntityCoords(PlayerPedId())
    -- Add logic to check if player is near doctors, hospitals, or safe zones
    -- This would depend on your server's safe zone system
    return false
end

function PoisonSystem:TriggerStageEffect(stage, ped)
    -- Enhanced notification system
    TriggerEvent('rNotify:NotifyLeft', stage.description, "Seek Help Immediately", "generic_textures", "tick", 10000)
    
    -- Log poison progression for admin monitoring
    if Config and Config.DebugMode then
        print(string.format("[POISON] Stage %d reached: %s", stage.level, stage.description))
    end
    
    if stage.level == 20 then
        self:ApplyBreathingDifficulty(ped)
    elseif stage.level == 40 then
        self:ApplyLimbFailure(ped)
    elseif stage.level == 60 then
        self:ApplyMuscleWeakness(ped)
    elseif stage.level == 80 then
        self:ApplyCriticalCondition(ped)
    end
end

function PoisonSystem:ApplyBreathingDifficulty(ped)
    -- Check if player is on mount before applying ragdoll
    if IsPedOnMount(ped) then
        -- Dismount player first, then apply effects
        Citizen.InvokeNative(0x5337B721C51883A9, ped, true, true) -- TaskDismountAnimal
        Citizen.Wait(2000) -- Wait for dismount to complete
    end
    
    -- Only apply if not in vehicle and not on mount
    if not IsPedInAnyVehicle(ped) and not IsPedOnMount(ped) then
        RequestAnimDict("amb_misc@world_human_coughing@male_c@wip_base")
        while not HasAnimDictLoaded("amb_misc@world_human_coughing@male_c@wip_base") do
            Citizen.Wait(10)
        end
        TaskPlayAnim(ped, "amb_misc@world_human_coughing@male_c@wip_base", "wip_base", 8.0, -8.0, 60000, 0, 0, true, 0, false, 0, false)
        SetPedToRagdoll(ped, 5000, 5000, 0, 0, 0, 0)
    else
        -- Alternative effect for mounted players - just screen shake and coughing sound
        ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 0.3)
        PlaySoundFrontend(-1, "COUGHING", "RDRO_MISC_SOUNDS", true)
    end
end

function PoisonSystem:ApplyLimbFailure(ped)
    -- Check if player is mounted
    if IsPedOnMount(ped) then
        -- Dismount player first
        Citizen.InvokeNative(0x5337B721C51883A9, ped, true, true) -- TaskDismountAnimal
        Citizen.Wait(2000)
    end
    
    -- Only apply sleep animation if not mounted or in vehicle
    if not IsPedInAnyVehicle(ped) and not IsPedOnMount(ped) then
        AnimpostfxPlay("PoisonDartPassOut")
        DoScreenFadeOut(2000)
        Citizen.Wait(3000)
        TaskStartScenarioInPlace(ped, GetHashKey('WORLD_HUMAN_SLEEP_GROUND_ARM'), -1, false, "test", 0, false)
        DoScreenFadeIn(5000)
    else
        -- Alternative effect - just screen effects and stumbling
        AnimpostfxPlay("PoisonDartPassOut")
        DoScreenFadeOut(1000)
        Citizen.Wait(1000)
        DoScreenFadeIn(2000)
        ShakeGameplayCam("DRUNK_SHAKE", 0.8)
    end
end

function PoisonSystem:ApplyMuscleWeakness(ped)
    -- Check if player is mounted
    if IsPedOnMount(ped) then
        -- For mounted players, just reduce horse speed and add screen effects
        local mount = GetMount(ped)
        if mount and mount ~= 0 then
            SetPedMoveRateOverride(mount, 0.3) -- Slow down the horse instead
        end
        ShakeGameplayCam("DRUNK_SHAKE", 0.5)
    elseif not IsPedInAnyVehicle(ped) then
        -- Only ragdoll if on foot
        SetPedToRagdoll(ped, 15000, 15000, 0, 0, 0, 0)
        SetPedMoveRateOverride(ped, 0.5)
    else
        -- In vehicle - just reduce movement
        SetPedMoveRateOverride(ped, 0.5)
    end
end

function PoisonSystem:ApplyCriticalCondition(ped)
    -- Force dismount for critical condition
    if IsPedOnMount(ped) then
        Citizen.InvokeNative(0x5337B721C51883A9, ped, true, true) -- TaskDismountAnimal
        Citizen.Wait(1000)
    end
    
    local pl = Citizen.InvokeNative(0x217E9DC48139933D)
    local fatal_ped = Citizen.InvokeNative(0x275F255ED201B937, pl)
    Citizen.InvokeNative(0x697157CED63F18D4, fatal_ped, 500000, false, true, true)
    
    -- Add screen effects for critical condition
    AnimpostfxPlay("DeadEye")
    SetTimecycleModifier("sp_f_drunkest")
    ShakeGameplayCam("LARGE_EXPLOSION_SHAKE", 1.0)
end

function PoisonSystem:TriggerPoison(poisonType)
    if self.state.isPoisoned then
        -- If already poisoned, increase severity
        self:IncreasePoisonLevel(10, poisonType)
        return
    end
    
    self.state.isPoisoned = true
    self.state.poisonLevel = 0
    self.state.processedStages = {}
    self.state.poisonStartTime = GetGameTimer()
    self.state.antidoteUsed = false
    
    AnimpostfxPlay("ODR3_Injured01Loop")
    
    local description = "Unknown poison detected"
    if poisonType and self.poisonTypes[poisonType] then
        description = self.poisonTypes[poisonType].description
    end
    
    TriggerEvent('rNotify:ShowSimpleCenterText', description .. " - Seek Treatment", 10000)
    TriggerEvent('poison:started', poisonType)
end

-- Enhanced antidote function with better error handling
function PoisonSystem:UseAntidote()
    if not self.state.isPoisoned then
        TriggerEvent('rNotify:NotifyLeft', "No poison detected", "You are not poisoned", "generic_textures", "cross", 5000)
        return
    end
    
    local ped = PlayerPedId()
    
    if isBusy then 
        TriggerEvent('rNotify:NotifyLeft', "Cannot use antidote", "You are busy", "generic_textures", "cross", 5000)
        return 
    end
    
    isBusy = true
    LocalPlayer.state:set("inv_busy", true, true)
    SetCurrentPedWeapon(ped, GetHashKey("weapon_unarmed"))
    
    local success = self:PerformAntidoteAnimation(ped)
    
    if success then
        self:EndPoisonEffect(false)
        TriggerEvent('rNotify:NotifyLeft', "Antidote administered", "Poison neutralized", "generic_textures", "tick", 5000)
        TriggerEvent('poison:cured')
    else
        TriggerEvent('rNotify:NotifyLeft', "Antidote failed", "Try again", "generic_textures", "cross", 5000)
    end
    
    LocalPlayer.state:set("inv_busy", false, true)
    isBusy = false
end

function PoisonSystem:PerformAntidoteAnimation(ped)
    local pcoords = GetEntityCoords(ped)
    local itemInHand = CreateObject(GetHashKey("p_bottleJD01x"), pcoords.x, pcoords.y, pcoords.z, true, false, false)
    
    if not DoesEntityExist(itemInHand) then
        return false
    end
    
    AttachEntityToEntity(itemInHand, ped, GetEntityBoneIndexByName(ped, "PH_R_HAND"), 0.00, 0.00, 0.04, 0.0, 0.0, 0.0, true, true, false, true, 1, true)
    
    if not IsPedOnMount(ped) and not IsPedInAnyVehicle(ped) and not IsPedUsingAnyScenario(ped) then
        local dict = self:LoadAnimDict('mech_inventory@drinking@bottle_cylinder_d1-3_h30-5_neck_a13_b2-5')
        if dict then
            TaskPlayAnim(ped, dict, 'uncork', 5.0, 5.0, -1, 31, false, false, false)
            Citizen.Wait(500)
            TaskPlayAnim(ped, dict, 'chug_a', 5.0, 5.0, -1, 31, false, false, false)
            Citizen.Wait(5000)
            ClearPedTasks(ped)
        end
    elseif IsPedOnMount(ped) or IsPedUsingAnyScenario(ped) then
        Citizen.InvokeNative(0x2208438012482A1A, ped, true, true)
        Citizen.Wait(4000)
    end
    
    DeleteObject(itemInHand)
    self.state.antidoteUsed = true
    return true
end

function PoisonSystem:LoadAnimDict(dict)
    RequestAnimDict(dict)
    local timeout = 0
    while not HasAnimDictLoaded(dict) and timeout < 1000 do
        Citizen.Wait(10)
        timeout = timeout + 10
    end
    return HasAnimDictLoaded(dict) and dict or nil
end

function PoisonSystem:EndPoisonEffect(fatal)
    local ped = PlayerPedId()
    AnimpostfxStop("ODR3_Injured01Loop")
    AnimpostfxStop("DeadEye")
    AnimpostfxStop("PoisonDartPassOut")
    ClearTimecycleModifier()
    StopGameplayCamShaking(true)
    
    -- Reset movement speed for both player and mount
    SetPedMoveRateOverride(ped, 1.0)
    if IsPedOnMount(ped) then
        local mount = GetMount(ped)
        if mount and mount ~= 0 then
            SetPedMoveRateOverride(mount, 1.0)
        end
    end
    
    -- Clear any lingering tasks
    ClearPedTasks(ped)
    
    self.state.isPoisoned = false
    self.state.poisonLevel = 0
    self.state.antidoteUsed = false
    self.state.processedStages = {}
    self.state.poisonStartTime = 0

    if fatal then
        TriggerEvent('rNotify:ShowSimpleCenterText', "The poison has taken your life", 5000)
        Citizen.Wait(2000)
        SetEntityHealth(ped, 0)
    end
    
    TriggerEvent('poison:ended', fatal)
end

-- Enhanced event detection with better error handling
Citizen.CreateThread(function()
    PoisonSystem:Initialize()
    
    while true do
        Citizen.Wait(0)
        local size = GetNumberOfEvents(0)
        
        if size > 0 then
            for i = 0, size - 1 do
                local eventAtIndex = GetEventAtIndex(0, i)
                
                if eventAtIndex == GetHashKey("EVENT_ENTITY_DAMAGED") then
                    local success, poisonType = PoisonSystem:ProcessDamageEvent(i)
                    if success then
                        PoisonSystem:TriggerPoison(poisonType)
                    end
                end
            end
        end
    end
end)

function PoisonSystem:ProcessDamageEvent(eventIndex)
    local eventData = DataView.ArrayBuffer(128)
    if not Citizen.InvokeNative(0x57EC5FA4D4D6AFCA, 0, eventIndex, eventData:Buffer(), 9) then
        return false, nil
    end
    
    local targetPed = eventData:GetInt32(0)
    if targetPed ~= PlayerPedId() then
        return false, nil
    end
    
    local ammo = eventData:GetInt32(24)
    local snake = eventData:GetInt32(8)
    
    -- Check for poison weapons
    if ammo == GetHashKey("AMMO_THROWING_KNIVES_POISON") then
        return true, "knife"
    elseif ammo == GetHashKey("AMMO_ARROW_POISON") then
        return true, "arrow"
    end
    
    -- Check for snake bites
    if snake and DoesEntityExist(snake) then
        local model = GetEntityModel(snake)
        if Config and Config.Snakes then
            for _, snakeConfig in pairs(Config.Snakes) do
                if model == GetHashKey(snakeConfig.model) then
                    return true, "snake"
                end
            end
        end
    end
    
    return false, nil
end

-- Export functions for other scripts
exports('GetPoisonLevel', function()
    return PoisonSystem.state.poisonLevel
end)

exports('IsPoisoned', function()
    return PoisonSystem.state.isPoisoned
end)

exports('CurePoison', function()
    PoisonSystem:UseAntidote()
end)

-- Register events
RegisterNetEvent('RMS_Poison:UseAntidote')
AddEventHandler('RMS_Poison:UseAntidote', function()
    PoisonSystem:UseAntidote()
end)

RegisterNetEvent('RMS_Poison:AdminCure')
AddEventHandler('RMS_Poison:AdminCure', function()
    PoisonSystem:EndPoisonEffect(false)
end)

RegisterNetEvent('RMS_Poison:AdminPoison')
AddEventHandler('RMS_Poison:AdminPoison', function(poisonType)
    PoisonSystem:TriggerPoison(poisonType or "snake")
end)