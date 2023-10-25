local CollectionService = game:GetService("CollectionService")

for _, tagged in pairs(CollectionService:GetTagged("Killbrick")) do 
    tagged.Touched:Connect(function(hit)
        if hit.Parent:FindFirstChild("Humanoid") then
            hit.Parent.Humanoid.Health = 0
             end
        end)
    end