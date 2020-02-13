local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PlayerName = script.Parent.Parent.Name

local PlayerBase = ReplicatedStorage:WaitForChild(PlayerName)
local Health = PlayerBase.Resources.Health
local SpawnBoxCenterPos = workspace.DeathBox.SpawnBoxCenter.Position

local function playerDied()
	local root = workspace[PlayerName].HumanoidRootPart
	root.Position = SpawnBoxCenterPos
	wait(8)
	Health.Current.Value = Health.Max.Value
	local spawnLocations = workspace.Spawn1:GetChildren()
	
	local chosenLocation = math.random(1, table.getn(spawnLocations))
	root.CFrame = spawnLocations[chosenLocation].CFrame
	
	print(PlayerName .. " died")
	PlayerBase.Stats.Deaths.Value = PlayerBase.Stats.Deaths.Value + 1
end

local function checkForDeath()
	if Health.Current.Value <= 0 then
		playerDied()
	end
end

Health.Current:GetPropertyChangedSignal("Value"):Connect(checkForDeath)