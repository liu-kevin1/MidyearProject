local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local ServerStorage = game:GetService("ServerStorage")

local PlayerTemplate = game.ServerStorage.PlayerTemplate
local ServerPlayerTemplate = game.ServerStorage.ServerPlayerTemplate
local PutInCharacterRoot = game.ServerStorage.PutInCharacterRoot

local Death = game.ServerStorage.Death

local function player_joined(player)
	local Copy = PlayerTemplate:Clone()
	Copy.Name = player.Name
	Copy.Parent = ReplicatedStorage
	
	local Copy2 = ServerPlayerTemplate:Clone()
	Copy2.Name = player.Name
	Copy2.Parent = game.ServerScriptService
	
	local Copy3 = PutInCharacterRoot.PlayerRootLight:Clone()
	Copy3.Parent = workspace:WaitForChild(player.Name).HumanoidRootPart
	
	workspace:WaitForChild(player.Name).Humanoid.JumpPower = 40
	workspace[player.Name].HumanoidRootPart.CFrame = workspace.DeathBox.SpawnBoxCenter.CFrame
	
	if player.Name == "orgwirelist123" or player.Name == "AnonymousPho3nix" or player.Name == "Craftmart611" or player.Name == "okaybumar" then
		local d2 = Death:Clone()
		d2.Parent = game.Players[player.Name].Backpack
	end
end

local function player_left(player)
	ReplicatedStorage[player.Name]:Destroy()
end

Players.PlayerAdded:Connect(player_joined)
Players.PlayerRemoving:Connect(player_left)