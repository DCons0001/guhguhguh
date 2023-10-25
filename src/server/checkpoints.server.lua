local checkpoints = workspace.Checkpoints

game.Players.PlayerAdded:Connect(function(player)
local stage = player:WaitForChild("leaderstats"):WaitForChild("Stage")
	player.CharacterAdded:Connect(function(char)
		local hum = char:WaitForChild("Humanoid")
		task.wait()
		char:MoveTo(checkpoints[stage.Value].Position)
		hum.Touched:Connect(function(hit)
			if hit.Parent == checkpoints then 
				if tonumber(hit.Name) == stage.Value + 1 then
					stage.Value = stage.Value + 1
				end
			end
		end)
	end)
end)