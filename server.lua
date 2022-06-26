local connectedPlayers = {}

RegisterServerEvent('scoreboard:server:getPlayers')
AddEventHandler('scoreboard:server:getPlayers', function(data)
    local players = ESX.GetPlayers()

	for i=1, #players, 1 do
		local xPlayer = ESX.GetPlayerFromId(players[i])
		getPlayerData(xPlayer)
	end
end)

AddEventHandler('esx:playerDropped', function(playerId)
	connectedPlayers[playerId] = nil
end)

function getPlayerData(xPlayer)
	local playerId = xPlayer.source

	connectedPlayers[playerId] = {}
	connectedPlayers[playerId].job = xPlayer.job.name
end

ESX.RegisterServerCallback('scoreboard:getplayers', function(src, cb)
    cb(connectedPlayers)
end)

ESX.RegisterServerCallback('scoreboard:getplayerping', function(src, cb)
    cb(GetPlayerPing(src))
end)