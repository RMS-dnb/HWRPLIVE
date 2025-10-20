local spawnedPeds = {}
lib.locale()

CreateThread(function()
    while true do
        Wait(500)
        for k,v in pairs(Config.BankLocations) do
            local playerCoords = GetEntityCoords(PlayerPedId())
            local distance = #(playerCoords - v.npccoords.xyz)

            if distance < Config.DistanceSpawn and not spawnedPeds[k] then
                local spawnedPed = NearPed(v.npcmodel, v.npccoords, v.bankid)
                spawnedPeds[k] = { spawnedPed = spawnedPed }
            end
            
            if distance >= Config.DistanceSpawn and spawnedPeds[k] then
                if Config.FadeIn then
                    for i = 255, 0, -51 do
                        Wait(50)
                        SetEntityAlpha(spawnedPeds[k].spawnedPed, i, false)
                    end
                end
                DeletePed(spawnedPeds[k].spawnedPed)
                spawnedPeds[k] = nil
            end
        end
    end
end)

function NearPed(npcmodel, npccoords, bankid)
    RequestModel(npcmodel)
    while not HasModelLoaded(npcmodel) do
        Wait(50)
    end
    spawnedPed = CreatePed(npcmodel, npccoords.x, npccoords.y, npccoords.z - 1.0, npccoords.w, false, false, 0, 0)
    SetEntityAlpha(spawnedPed, 0, false)
    SetRandomOutfitVariation(spawnedPed, true)
    SetEntityCanBeDamaged(spawnedPed, false)
    SetEntityInvincible(spawnedPed, true)
    FreezeEntityPosition(spawnedPed, true)
    SetBlockingOfNonTemporaryEvents(spawnedPed, true)
    SetPedCanBeTargetted(spawnedPed, false)
    if Config.FadeIn then
        for i = 0, 255, 51 do
            Wait(50)
            SetEntityAlpha(spawnedPed, i, false)
        end
    end
    exports.ox_target:addLocalEntity(spawnedPed, {
        {
            name = 'banking_npc',
            icon = 'far fa-eye',
            label = locale('cl_lang_1'),
            onSelect = function()
                TriggerEvent('rsg-banking:client:OpenBanking', bankid)
            end,
            distance = 5.0
        },
        {
            name = 'banking_npc_fine',
            icon = 'far fa-eye',
            label = 'Pay Fine',
            onSelect = function()
                    local data = lib.callback.await('btc-fines:server:getMyFines', false)
                    local total = data.total or 0

                    if total <= 0 then
                        return lib.notify({ title = 'Fines', description = 'You have no outstanding fines.', type = 'inform' })
                    end

                    -- Build options for each unpaid fine
                    local options = {}
                    for i, f in ipairs(data.items or {}) do
                        table.insert(options, {
                            title = ('$%.2f | %s (%s)'):format(f.fine, f.description, f.date),
                            icon = 'fas fa-gavel',
                            onSelect = function()
                                -- Confirm paying this single fine
                                local confirm = lib.alertDialog({
                                    header = ('Pay fine of $%.2f?'):format(f.fine),
                                    content = ('Description: %s\nDate: %s'):format(f.description, f.date),
                                    centered = true,
                                    cancel = true,
                                    labels = {
                                        confirm = 'Pay Now',
                                        cancel = 'Cancel'
                                    }
                                })

                                if confirm == 'confirm' then
                                    -- Trigger server event to pay this specific fine by id
                                    TriggerServerEvent('btc-fines:server:paySingleFine', f.id)
                                end
                            end
                        })
                    end

                    lib.registerContext({
                        id = 'pay_single_fine_menu',
                        title = ('You owe $%.2f in total fines'):format(total),
                        options = options
                    })

                    lib.showContext('pay_single_fine_menu')
                end,
            distance = 5.0
        },
        {
            name = 'banking_npc_pch',
            icon = 'far fa-eye',
            label = 'Receive Paycheck',
            onSelect = function()
                TriggerServerEvent('rsg-banking:server:receivePaycheck')
            end,
            distance = 5.0
        },
    })
    return spawnedPed
end

-- cleanup
AddEventHandler("onResourceStop", function(resourceName)
    if GetCurrentResourceName() ~= resourceName then return end
    for k,v in pairs(spawnedPeds) do
        DeletePed(spawnedPeds[k].spawnedPed)
        spawnedPeds[k] = nil
    end
end)
