local scoreboardVisible = false
local ping

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
	ESX.PlayerLoaded = true
    updateScoreboard()
end)

RegisterNetEvent('esx:onPlayerLogout')
AddEventHandler('esx:onPlayerLogout', function()
	ESX.PlayerLoaded = false
	ESX.PlayerData = {}
end)

Citizen.CreateThread(function()
    local wait = 1000
    while true do
        if ESX.PlayerLoaded then
            if scoreboardVisible then
                updateScoreboard()
            end
        end
        Citizen.Wait(wait)
    end
end)

RegisterKeyMapping('togglescoreboard', 'Alternar scoreboard', 'keyboard', 'f10')

RegisterCommand('togglescoreboard', function()
    showScoreboard(not scoreboardVisible)
end)

function updateScoreboard()
    local police, ambulance, mechanic, taxi, guardias, pdi, players = 0, 0, 0, 0, 0, 0, 0
    local playerName = GetPlayerName(PlayerId())

    ESX.TriggerServerCallback('scoreboard:getplayerping', function(cb)
        ping = cb
    end)

    TriggerServerEvent('scoreboard:server:getPlayers')
    ESX.TriggerServerCallback('scoreboard:getplayers', function(cb)
        for k, v in pairs(cb) do
            players = players + 1

            if v.job == "police" then
                police = police + 1
            elseif v.job == "ambulance" then
                ambulance = ambulance + 1
            elseif v.job == "mechanic" then
                mechanic = mechanic + 1
            elseif v.job == "taxi" then
                taxi = taxi + 1
            elseif v.job == "guardia" then
                guardias = guardias + 1
            elseif v.job == "pdi" then
                pdi = pdi + 1
            end
        end

        SendNUIMessage(
            {
                players = players,
                police = police,
                ambulance = ambulance,
                mechanic = mechanic,
                taxi = taxi,
                guardias = guardias,
                pdi = pdi,
                ping = ping,
                playerName = playerName
            }
        )
    end)
end

function showScoreboard(boolean)

    SendNUIMessage(
        {
            show = boolean
        }
    )

    updateScoreboard()

    scoreboardVisible = boolean
end