local event = game.ReplicatedStorage.RestartObby

event.OnServerEvent:Connect(function(player)
    if player then
        local leaderstats = player:WaitForChild("leaderstats")
        local stage = leaderstats:WaitForChild("Stage")
        stage.Value = 0
        player:LoadCharacter()
    end
end)