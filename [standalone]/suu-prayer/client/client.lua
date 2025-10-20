local RSGCore = exports['rsg-core']:GetCoreObject()
lib.locale()

local isPraying = false
local inChurch = false
local lastPrayTime = 0
local prayPrompt = nil
local promptGroup = GetRandomIntInRange(0, 0xffffff)

-- Animations list
local AnimList = Config.Animations

-- Création du prompt unique natif avec groupe
function CreatePrayPrompt()
    prayPrompt = PromptRegisterBegin()
    PromptSetControlAction(prayPrompt, 0xCEFD9220) -- Touche E
    PromptSetText(prayPrompt, CreateVarString(10, 'LITERAL_STRING', locale('prompt_pray')))
    PromptSetEnabled(prayPrompt, true)
    PromptSetVisible(prayPrompt, true)
    PromptSetStandardMode(prayPrompt, true)
    PromptSetGroup(prayPrompt, promptGroup)
    PromptRegisterEnd(prayPrompt)
end

-- Fonction de prière avec animation aléatoire
function StartPraying()
    if isPraying then return end

    -- 🔹 ITEM CHECK - REQUIRES BIBLE
    -- 🔹 ITEM CHECK - REQUIRES BIBLE *OR* ROSARY
local hasHolyItem = false
local player = RSGCore.Functions.GetPlayerData()

if player and player.items then
    for _, item in pairs(player.items) do
        if (item.name == "bible" or item.name == "rosary") and item.amount > 0 then
            hasHolyItem = true
            break
        end
    end
end

if not hasHolyItem then
    lib.notify({
        title = locale('missing_item') or "Missing Item",
        description = locale('need_bible') or "You need a Bible or Rosary to pray.",
        type = 'error'
    })
    return
end


    -- 🔹 COOLDOWN CHECK (unchanged)
    if GetGameTimer() - lastPrayTime < Config.Cooldown then
        local wait = math.ceil((Config.Cooldown - (GetGameTimer()-lastPrayTime))/1000)
        lib.notify({
            title = locale('soul_at_peace'),
            description = locale('soul_at_peace_desc'),
            type = 'inform'
        })
        return
    end

    isPraying = true
    local playerPed = PlayerPedId()

    local anim = AnimList[math.random(1, #AnimList)]
    local dict, animName = anim[1], anim[2]
    
    RequestAnimDict(dict)
    while not HasAnimDictLoaded(dict) do Wait(0) end
    TaskPlayAnim(playerPed, dict, animName, 8.0, -8.0, -1, 1, 0, false, false, false, 0, false)
    
    local success = lib.progressBar({
        duration = Config.PrayingTime,
        label = locale('prayer_in_progress'),
        useWhileDead = false,
        canCancel = true,
        disable = {car=true, move=true, combat=true}
    })

    if success then
        TriggerEvent('hud:client:RelieveStress', Config.StressReduction)
        exports['fx-hud']:setStatus("stress",-15)
        lib.notify({
            title = locale('prayer_completed'),
            description = string.format(locale('prayer_completed_desc'), Config.StressReduction),
            type = 'success'
        })
        lastPrayTime = GetGameTimer()
    else
        lib.notify({
            title = locale('prayer_interrupted'),
            description = locale('prayer_interrupted_desc'),
            type = 'error'
        })
    end

    ClearPedTasks(playerPed)
    RemoveAnimDict(dict)
    isPraying = false
end

-- Routine principale : gestion zone & prompt
CreateThread(function()
    CreatePrayPrompt()
    local wasInChurch = false
    
    while true do
        local playerCoords = GetEntityCoords(PlayerPedId())
        inChurch = false

        -- Vérification si on est dans une église
        for _, church in ipairs(Config.Churches) do
            if #(playerCoords - church.coords) <= (church.radius or 12.0) then
                inChurch = true
                break
            end
        end

        -- Notification d'entrée/sortie si activée
        if Config.ShowChurchNotifications then
            if inChurch and not wasInChurch then
                lib.notify({
                    title = locale('sacred_place'),
                    description = locale('sacred_place_desc'),
                    type = 'inform'
                })
            end
        end
        wasInChurch = inChurch

        -- Affiche/masque le prompt selon la zone
        if inChurch and not isPraying then
            PromptSetEnabled(prayPrompt, true)
            PromptSetVisible(prayPrompt, true)
            PromptSetActiveGroupThisFrame(promptGroup, CreateVarString(10, 'LITERAL_STRING', locale('prompt_group')))

            -- Touche pressée : lance la prière
            if PromptHasStandardModeCompleted(prayPrompt) then
                StartPraying()
            end
        else
            PromptSetEnabled(prayPrompt, false)
            PromptSetVisible(prayPrompt, false)
        end
        
        Wait(0)
    end
end)

-- Commande optionnelle
RegisterCommand('pray', function()
    if inChurch then
        StartPraying()
    else
        lib.notify({
            title = locale('not_in_church'),
            description = locale('not_in_church_desc'),
            type = 'error'
        })
    end
end, false)
