local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TeleportToMap = Instance.new("RemoteEvent", ReplicatedStorage)
TeleportToMap.Name = "TeleportToMap"

local function teleportToMap(player)
	local spawnLocations = workspace.Spawn1:GetChildren()
	local chosenLocation = math.random(1, table.getn(spawnLocations))
	
	workspace[player.Name].HumanoidRootPart.CFrame = spawnLocations[chosenLocation].CFrame
end

TeleportToMap.OnServerEvent:Connect(teleportToMap)