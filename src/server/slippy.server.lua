local map = {
    name = "Slippery Map",
    duration = 30,
    effect = function()
        -- Define a reset function for the event
        local resetFunctions = {}

        for _, mainmapfolder in pairs(workspace.Map:GetChildren()) do
            if mainmapfolder:IsA("Folder") and mainmapfolder.Name == "MainMap" then
                for _, parts in pairs(mainmapfolder:GetChildren()) do
                    if parts:IsA("BasePart") then
                        changeFriction(parts, 0, 100) 
                        
                        resetFunctions[parts] = function()
                            changeFriction(parts, 0.3, 1)
                        end
                    end
                end
            end
        end

        -- Define a reset function for the event
        AppliedEvents[character] = {
            reset = function()
                for part, resetFunc in pairs(resetFunctions) do
                    resetFunc()
                end
            end