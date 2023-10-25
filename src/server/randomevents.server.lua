local Players = game:GetService("Players")
local CurrentEvent = nil
local AppliedEvents = {} -- Store applied events

-- Define the changeFriction function
local function changeFriction(part, friction, frictionWeight)
	if not part.CustomPhysicalProperties then
		part.CustomPhysicalProperties = PhysicalProperties.new(part.Material)
	end
	local orig = part.CustomPhysicalProperties
	friction = friction or orig.Friction
	frictionWeight = frictionWeight or orig.FrictionWeight
	part.CustomPhysicalProperties = PhysicalProperties.new(orig.Density, friction, orig.Elasticity, frictionWeight, orig.ElasticityWeight)
end

local GameEvents = {
	{
		name = "Extra Walkspeed",
		duration = 15,
		effect = function(character)
			local humanoid = character and character:FindFirstChildOfClass("Humanoid")
			if humanoid then
				local originalWalkSpeed = humanoid.WalkSpeed
				humanoid.WalkSpeed = 25
				AppliedEvents["Extra Walkspeed"] = {
					reset = function()
						humanoid.WalkSpeed = originalWalkSpeed
					end
				}
			end
		end
	},
	{
		name = "Less Walkspeed",
		duration = 15,
		effect = function(character)
			local humanoid = character and character:FindFirstChildOfClass("Humanoid")
			if humanoid then
				local originalWalkSpeed = humanoid.WalkSpeed
				humanoid.WalkSpeed = 8
				AppliedEvents["Less Walkspeed"] = {
					reset = function()
						humanoid.WalkSpeed = originalWalkSpeed
					end
				}
			end
		end
	},
	{
		name = "Slippery Map",
		duration = 25,
		effect = function(character)
			for _, mainmapfolder in pairs(workspace.Map:GetChildren()) do
				if mainmapfolder:IsA("Folder") and mainmapfolder.Name == "MainMap" then
					for _, parts in pairs(mainmapfolder:GetChildren()) do
						if parts:IsA("BasePart") then
							changeFriction(parts, 0, 100)
						end
					end
				end
			end

			AppliedEvents["Slippery Map"] = {
				reset = function()
					for _, mainmapfolder in pairs(workspace.Map:GetChildren()) do
						if mainmapfolder:IsA("Folder") and mainmapfolder.Name == "MainMap" then
							for _, parts in pairs(mainmapfolder:GetChildren()) do
								if parts:IsA("BasePart") then
									changeFriction(parts, 0.3, 1)
								end
							end
						end
					end
				end
			}
		end
	},
	{
		name = "Lose Your Legs",
		duration = 0.5,
		effect = function(character)
			local hum = character:FindFirstChild("Humanoid")
			local humtyp = hum.RigType

			if humtyp == Enum.HumanoidRigType.R6 then
				print(humtyp)
				local legs = {character:FindFirstChild("Left Leg"), character:FindFirstChild("Right Leg")}

				for _, leg in pairs(legs) do
					if leg then
						leg:Destroy()
					end
				end
			elseif humtyp == Enum.HumanoidRigType.R15 then
				print(humtyp)
				local legs = {
					character:FindFirstChild("LeftUpperLeg"),
					character:FindFirstChild("LeftLowerLeg"),
					character:FindFirstChild("LeftFoot"),
					character:FindFirstChild("RightUpperLeg"),
					character:FindFirstChild("RightLowerLeg"),
					character:FindFirstChild("RightFoot")
				}
				
				hum.HipHeight = 0.4
				
				for _, leg in pairs(legs) do
					if leg then
						leg:Destroy()
					end
				end
			end
		end
	},
	{
		name = "Lose Your Arms",
		duration = 0.5,
		effect = function(character)
			local hum = character:FindFirstChild("Humanoid")
			local humtyp = hum.RigType

			if humtyp == Enum.HumanoidRigType.R6 then
				print(humtyp)
				local arms = {character:FindFirstChild("Left Arm"), character:FindFirstChild("Right Arm")}

				for _, arm in pairs(arms) do
					if arm then
						arm:Destroy()
					end
				end
			elseif humtyp == Enum.HumanoidRigType.R15 then
				print(humtyp)
 			local arms = {
                character:FindFirstChild("LeftUpperArm"),
                character:FindFirstChild("LeftLowerArm"),
                character:FindFirstChild("LeftHand"),
                character:FindFirstChild("RightUpperArm"),
                character:FindFirstChild("RightLowerArm"),
                character:FindFirstChild("RightHand")
            }

            for _, arm in pairs(arms) do
                if arm then
                    arm:Destroy()
                end
            end
        end
    end
	},
	{
		name = "Extra JumpPower",
		duration = 15,
		effect = function(character)
			local humanoid = character and character:FindFirstChildOfClass("Humanoid")
			if humanoid then
				local originalJumpPower = humanoid.JumpPower
				humanoid.JumpPower = 100
				AppliedEvents["Extra JumpPower"] = {
					originalJumpPower = originalJumpPower,
					reset = function()
						humanoid.JumpPower = originalJumpPower
					end
				}
			end
		end
	},
    {
		
		name = "Skibi Toilet",
        duration = 15,
        effect = function(character)
			local SkibiMAIN = game:GetService("ServerStorage"):FindFirstChild("SKIBI")

			local function createWeld(Parent, Part0, Part1, C0, C1)
				local M6D = Instance.new("Motor6D")
				M6D.Parent = Parent
				M6D.Part0 = Part0
				M6D.Part1 = Part1
				M6D.C0 = C0 or CFrame.new(0, 0, 0)
				M6D.C1 = C1 or CFrame.new(0, 0, 0)
				Part1.Position = Part0.Position
			end

			local SkibiClone = SkibiMAIN:Clone()
			local humtyp = character:FindFirstChild("Humanoid").RigType
			if humtyp == Enum.HumanoidRigType.R6 then
			local R6Torso = character:FindFirstChild("Torso")
			createWeld(R6Torso, R6Torso, SkibiClone)
			elseif humtyp == Enum.HumanoidRigType.R15 then
			local R15Torso = character:FindFirstChild("UpperTorso")
			createWeld(R15Torso, R15Torso, SkibiClone)
			end
		end
	},
    {
        name = "Fogginess",
        duration = 15,
        effect = function(character)
            local lighting = game:GetService("Lighting")
            local originalFogEnd = lighting.FogEnd
            local originalFogStart = lighting.FogStart
            lighting.FogEnd = 25
            lighting.FogStart = 0
            AppliedEvents["Fogginess"] = {
                reset = function()
                    lighting.FogEnd = originalFogEnd
                    lighting.FogStart = originalFogStart
                end
            }
            
        end
    },
    {
        name = "Take a Chill Pill",
        duration = 15,
        effect = function(character)
            local hum = character:FindFirstChildOfClass("Humanoid")
            local originalWalkSpeed = hum.WalkSpeed
            hum.WalkSpeed = -10
            AppliedEvents["Take a Chill Pill"] = {
                reset = function()
                    hum.WalkSpeed = originalWalkSpeed
                end
            }
            
        end
    },
	{
		name = "Forced First Person",
		duration = 15,
		effect = function(character)
			local player = game:GetService("Players"):GetPlayerFromCharacter(character)
			player.CameraMode = Enum.CameraMode.LockFirstPerson
			AppliedEvents["Forced First Person"] = {
				reset = function()
					player.CameraMode = Enum.CameraMode.Classic
				end
			}
		end
	},
    {
        name = "Color Blindness",
        duration = 15,
        effect = function(character)
            local lighting = game:GetService("Lighting")
            local CCE = lighting:FindFirstChild("ColorCorrection")
            local originalSaturation = CCE.Saturation
            CCE.Saturation = -1
            AppliedEvents["Color Blindness"] = {
                reset = function()
                    CCE.Saturation = originalSaturation
                end
            }
        end
    },
	{
		name = "Less JumpPower",
		duration = 15,
		effect = function(character)
			local humanoid = character and character:FindFirstChildOfClass("Humanoid")
			if humanoid then
				local originalJumpPower = humanoid.JumpPower
				humanoid.JumpPower = 25
				AppliedEvents["Less JumpPower"] = {
					originalJumpPower = originalJumpPower,
					reset = function()
						humanoid.JumpPower = originalJumpPower
					end
				}
			end
		end
	},
	{
		name = "No Jumping",
		duration = 15,
		effect = function(character)
			local humanoid = character and character:FindFirstChildOfClass("Humanoid")
			if humanoid then
				local originalJumpPower = humanoid.JumpPower
				humanoid.JumpPower = 0
				AppliedEvents["No Jumping"] = {
					reset = function()
						humanoid.JumpPower = originalJumpPower
					end
				}
			end
		end
	},
	{
		name = "Low Gravity",
		duration = 15,
		effect = function(character)
		local originalGravity = workspace.Gravity
		workspace.Gravity = 10
		AppliedEvents["Low Gravity"] = {
			reset = function()
				workspace.Gravity = originalGravity
				end
				}
			end
	},
	{
		name = "Big Character",
		duration = 20,
		effect = function(character)
			local humanoid = character and character:FindFirstChildOfClass("Humanoid")
			if humanoid then
				local originalBodyHeightScale = humanoid:FindFirstChild("BodyHeightScale").Value
				local originalBodyWidthScale = humanoid:FindFirstChild("BodyWidthScale").Value
				local originalBodyDepthScale = humanoid:FindFirstChild("BodyDepthScale").Value
				local originalHeadScale = humanoid:FindFirstChild("HeadScale").Value

				humanoid:FindFirstChild("BodyHeightScale").Value = 2
				humanoid:FindFirstChild("BodyWidthScale").Value = 2
				humanoid:FindFirstChild("BodyDepthScale").Value = 2
				humanoid:FindFirstChild("HeadScale").Value = 2

				AppliedEvents["Big Character"] = {
					reset = function()
						humanoid:FindFirstChild("BodyHeightScale").Value = originalBodyHeightScale
						humanoid:FindFirstChild("BodyWidthScale").Value = originalBodyWidthScale
						humanoid:FindFirstChild("BodyDepthScale").Value = originalBodyDepthScale
						humanoid:FindFirstChild("HeadScale").Value = originalHeadScale
					end
				}
			end
        end
},
{
	name = "Small Character",
	duration = 20,
	effect = function(character)
		local humanoid = character and character:FindFirstChildOfClass("Humanoid")
		if humanoid then
			local originalBodyHeightScale = humanoid:FindFirstChild("BodyHeightScale").Value
			local originalBodyWidthScale = humanoid:FindFirstChild("BodyWidthScale").Value
			local originalBodyDepthScale = humanoid:FindFirstChild("BodyDepthScale").Value
			local originalHeadScale = humanoid:FindFirstChild("HeadScale").Value

			humanoid:FindFirstChild("BodyHeightScale").Value = 0.3
			humanoid:FindFirstChild("BodyWidthScale").Value = 0.3
			humanoid:FindFirstChild("BodyDepthScale").Value = 0.3
			humanoid:FindFirstChild("HeadScale").Value = 0.3

			AppliedEvents["Small Character"] = {
				reset = function()
					humanoid:FindFirstChild("BodyHeightScale").Value = originalBodyHeightScale
					humanoid:FindFirstChild("BodyWidthScale").Value = originalBodyWidthScale
					humanoid:FindFirstChild("BodyDepthScale").Value = originalBodyDepthScale
					humanoid:FindFirstChild("HeadScale").Value = originalHeadScale
				end
			}
		end
	end
	},
}

local function ApplyEvent(event, player)
	print("Applying event: " .. event.name)
	local character = player.Character
	if character then
		event.effect(character)
	end
end

local function ChangeEvents()
	local newEvent = CurrentEvent
	while newEvent == CurrentEvent do
		newEvent = GameEvents[math.random(1, #GameEvents)]
	end

	if CurrentEvent then
		local appliedEvent = AppliedEvents[CurrentEvent.name]
		if appliedEvent and appliedEvent.reset then
			appliedEvent.reset()
		end
	end

	CurrentEvent = newEvent
	for _, player in pairs(Players:GetPlayers()) do
		local playerName = player.Name
		AppliedEvents[playerName] = { reset = function() end } -- Initialize with an empty reset function
		ApplyEvent(CurrentEvent, player)
	end
end

Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(character)
        local PGUI = player.PlayerGui
        local SGUI = PGUI:WaitForChild("CURRENTEVENT")
        local GUI1 = SGUI:FindFirstChild("F1")
        local GUI2 = GUI1:FindFirstChild("F2")
        local GUI3 = GUI2:FindFirstChild("Content")
        GUI4 = GUI3:WaitForChild("TextLabel")
        GUI5 = GUI3:WaitForChild("TextLabelStroke")

		local playerName = player.Name
		if CurrentEvent then
			AppliedEvents[playerName] = { reset = function() end } -- Initialize with an empty reset function
			ApplyEvent(CurrentEvent, player)
		end
	end)
end)

local function Timer()
	while true do
		wait(CurrentEvent.duration)
		ChangeEvents()
		print(CurrentEvent.name.. " and " ..CurrentEvent.duration)
        GUI4.Text = "CURRENT EVENT: " ..CurrentEvent.name
        GUI5.Text = "CURRENT EVENT: " ..CurrentEvent.name
		
		print(AppliedEvents)
	end
end

ChangeEvents()
Timer() 