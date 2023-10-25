--[[local MPS = game:GetService("MarketplaceService")
local gcId = 0
local scId = 0

game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(char)
        if MPS:UserOwnsGamepassAsync(player.UserId, gcId) then
            script.GravityCoil:Clone().Parent = player.Backpack
        
if MPS:UserOwnsGamepassAsync(player.UserId, scId) then
    script.SpeedCoil:Clone().Parent = player.Backpack


if player.MembershipType == Enum.MembershipType.Premium then
    script.SuperCoil:Clone().Parent = player.Backpack
                end
            end
        end
    end)
end)
--]]