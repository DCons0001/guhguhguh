local mps = game:GetService("MarketplaceService")
local gamepassId = 183548483 -- change this lol

game.Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function()
		if mps:UserOwnsGamePassAsync(player.UserId,gamepassId) then
			script.GravityCoil:Clone().Parent = player.Backpack
		end
	end)
end)

--

local gamepassId = 183552044
game.Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function()
		if mps:UserOwnsGamePassAsync(player.UserId,gamepassId) then
			script.SpeedCoil:Clone().Parent = player.Backpack
		end
	end)
end)

