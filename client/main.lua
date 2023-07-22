local PropList = {}

CreateThread(function()

    for k, v in pairs(Config.Props) do
        PropList[#PropList+1] = v.prop
    end

    Wait(100)

    exports['qb-target']:AddTargetModel(PropList, {
        options = {
            {
                label = Lang:t('target.label'),
                icon = 'fas fa-box-open',
                action = function(ent)
                    isBusy = true
                    PoliceAlert(ent)

                    if not Config.Minigame then
                        ProgressBar(ent)
                    else
                        local success = MiniGame()
                        if success then
                            ProgressBar(ent)
                        else
                            QBCore.Functions.Notify(Lang:t('notifies.failed_minigame'))
                            isBusy = false
                        end
                    end
                end,
                canInteract = function(ent)
                    local RequiredItem = nil
                    for k, v in pairs(Config.Props) do
                        if v.prop == GetEntityModel(ent) then
                            RequiredItem = v.settings.requireditem or Config.RequiredItem
                        end
                    end
                    local wasRobbed = lib.callback.await('lng-lootcontainers:server:getEntityState', false, ObjToNet(ent))
                    local haswep = exports.ox_inventory:Search('count', RequiredItem)
                    if RequiredItem ~= nil then
                        if haswep >= 1 and not wasRobbed then
                            return not isBusy
                        end
                    else
                        if not wasRobbed then
                            return not isBusy
                        end
                    end
                end
            }
        },
        distance = 1.5
    })
end)

RegisterNetEvent('lng-lootcontainers:client:ResetEntity', function(netId)
    if NetworkGetEntityIsNetworked(netId) then NetworkUnregisterNetworkedEntity(netId) end
end)

