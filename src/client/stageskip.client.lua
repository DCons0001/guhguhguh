--[[local skip = 0
local MPS = game:GetService("MarketplaceService")
local maxStage = #game.Workspace.Checkpoints:GetChildren()

script.Parent.MouseButton1Click:Connect(function()
    if game.Players.LocalPlayer.leaderstats.Stage.Value < maxStage then
        MPS:PromptProductPurchase(game.Players.LocalPlayer, skip)
    end
end)--]]