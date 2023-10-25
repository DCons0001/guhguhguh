local Players = game:GetService("Players")
local DSS = game:GetService("DataStoreService")
local DS = DSS:GetDataStore("GAMETIME1234567890")



local function saveData(player)
	local dataToSave = {
		player.leaderstats.Stage.Value, -- first val
		player.leaderstats.Deaths.Value,
		player.Playerstats.Coins.Value,
        player.Playerstats.playtime.Value
	}

	local success, err = pcall(function()
		DS:SetAsync(player.UserId, dataToSave)
	end)

	if success then
		print("Data Saved")
	else
		print("Data Failed To Save")
		warn(err)
	end
end

Players.PlayerAdded:Connect(function(plr)
	local lbstats = Instance.new("Folder")
	lbstats.Name = "leaderstats"
	lbstats.Parent = plr

	local playerStats = Instance.new("Folder")
	playerStats.Name = "Playerstats"
	playerStats.Parent = plr


	local Stage = Instance.new("IntValue")
	Stage.Name = "Stage"
	Stage.Value = "0"
	Stage.Parent = lbstats

	local Deaths = Instance.new("IntValue")
	Deaths.Name = "Deaths"
	Deaths.Value = 0
	Deaths.Parent = lbstats

	local Coins = Instance.new("IntValue")
	Coins.Name = "Coins"
	Coins.Value = 0
	Coins.Parent = playerStats

	local playtime = Instance.new("IntValue")
	playtime.Name = "playtime"
	playtime.Value = 0
	playtime.Parent = playerStats

	local sessionTime = Instance.new("IntValue")
	sessionTime.Name = "sessionTime"
	sessionTime.Value = 0
	sessionTime.Parent = playerStats

	local data
	local success, err = pcall(function()

		data = DS:GetAsync(plr.UserId)
	end)	

	if success and data then 
		Stage.Value = data[1]
		Deaths.Value = data[2]	
		Coins.Value = data[3]
		playtime.Value = data[4]
	else
		print("Player has no saved data!")
	end
end)

game.Players.PlayerRemoving:Connect(function(player)
	local success, err = pcall(function()
		saveData(player)
	end)

	if success then 
		print("Data Saved")
	else
		print(err)
	end
end)

game:BindToClose(function()
	for _, player in pairs(game.Players:GetPlayers()) do 
		local success, err = pcall(function()
			saveData(player)
		end)
		if success then
			print("Data has been saved")
		else
			print("Data has not been saved")
			warn(err)
		end
	end
end)

