game.Players.PlayerAdded:Connect(function(Player)
	Player.CharacterAdded:Connect(function(Char)
		Char.Humanoid.Died:Connect(function()
			local deathStat = Player.leaderstats:FindFirstChild("Deaths")

			if deathStat then
				deathStat.Value = deathStat.Value + 1
				print(Player.Name .. " died. Total deaths: " .. deathStat.Value)
			else
				print("Error: 'Deaths' value not found in leaderstats for " .. Player.Name)
			end
		end)
	end)
end)
