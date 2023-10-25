local player = game.Players.LocalPlayer
local event = game.ReplicatedStorage.RESPAWN
local InputService = game:GetService("UserInputService")

InputService.InputBegan:Connect(function(keyPressed)
	if keyPressed.KeyCode == Enum.KeyCode.R then
		event:FireServer(player)
	end
end)

