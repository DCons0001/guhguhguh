local mps = game:GetService("MarketplaceService")
local gamepassId = 183548483 -- change this lol
local SS = game:GetService("ServerStorage")

game.Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function()
		if mps:UserOwnsGamePassAsync(player.UserId,gamepassId) then
			SS.GravityCoil:Clone().Parent = player.Backpack
		end
	end)
end)

--

local gamepassId = 183552044
game.Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function()
		if mps:UserOwnsGamePassAsync(player.UserId,gamepassId) then
			SS.SpeedCoil:Clone().Parent = player.Backpack
		end
	end)
end)

local gamepassId = 183552044
game.Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function()
		if player.MembershipType == Enum.MembershipType.Premium then
			SS.SuperCoil:Clone().Parent = player.Backpack
		end
	end)
end)

