QBCore = exports['qb-core']:GetCoreObject()
isBusy = false

if Config.Minigame == 'memorygame' then
    function MiniGame()
        local success = false
        local holdResult = true

        exports["memorygame"]:thermiteminigame(5, 3, 3, 15, function()
            success = true
            holdResult = false
        end, function()
            success = false
            holdResult = false
        end)

        while holdResult do Wait(100) end
        return success
    end
elseif Config.Minigame == 'ox_lib' then
    function MiniGame()
        local success = lib.skillCheck({'easy', 'easy', 'easy'}, {'w','a','s','d'})
        return success or false
    end

elseif Config.Minigame and Config.Minigame ~= 'none' then
    print('[dds-lootcontainers] Invalid minigame specified in config.lua')
end

function PoliceAlert(ent)
    local Illegal, AlertChance = nil, nil
    for k, v in pairs(Config.Props) do
        if v.prop == GetEntityModel(ent) then
            Illegal = v.settings.illegal
            AlertChance = v.settings.alertchance
        end
    end
    if Illegal then
        if math.random(1,100) >= AlertChance then return end
        if Config.Dispatch == 'cd_dispatch' then
            local data = exports['cd_dispatch']:GetPlayerInfo()
            TriggerServerEvent('cd_dispatch:AddNotification', {
                job_table = {'police', },
                coords = data.coords,
                title = '10-15 - Store Robbery',
                message = 'A '..data.sex..' robbing a store at '..data.street,
                flash = 0,
                unique_id = data.unique_id,
                sound = 1,
                blip = {
                    sprite = 431,
                    scale = 1.2,
                    colour = 3,
                    flashes = false,
                    text = '911 - Store Robbery',
                    time = 5,
                    radius = 0,
                }
            })
        elseif Config.Dispatch == 'qb-core' then
            TriggerServerEvent('police:server:policeAlert', Lang:t('police.bliptitle'))
        else
            print('[dds-lootcontainers] Config.Dispatch does not have a valid argument')
        end
    end
end

function ProgressBar(ent)
    QBCore.Functions.Progressbar('diving_in_dumpster', Lang:t('progress.diving'), Config.ProgressTime * 1000, false, true, {
        disableMovement = true,
        disableCarMovement = true,
        disableMouse = false,
        disableCombat = true,
    }, {
        animDict = "veh@break_in@0h@p_m_one@",
        anim = "low_force_entry_ds",
        flags = 16,
    }, {}, {}, function()
        if not NetworkGetEntityIsNetworked(ent) then NetworkRegisterEntityAsNetworked(ent) end
        TriggerServerEvent('dds-lootcontainers:server:SetEntity', ObjToNet(ent), GetEntityModel(ent), true)
        if not Config.ResetOnReboot then TriggerServerEvent('dds-lootcontainers:server:ResetEntity', ObjToNet(ent)) end
        isBusy = false
        ClearPedTasks(PlayerPedId())
    end, function()
        isBusy = false
        HurtPlayer(true)
        ClearPedTasks(PlayerPedId())
    end)
end

function HurtPlayer(cancelled)
    local doubled = 0.5
    if cancelled then doubled = 1.5 end

    if Config.Hurting then
        if math.random(1,100) >= Config.HurtChance * doubled then return end

        local health = GetEntityHealth(PlayerPedId())
        local newHealth = health - math.random(Config.HurtDamage.min, Config.HurtDamage.max)
        SetEntityHealth(PlayerPedId(), newHealth)

        if Config.CanBleed then
            if math.random(1,100) >= Config.BleedChance then return end
            TriggerEvent('hospital:client:SetPain')
        end
    end
end