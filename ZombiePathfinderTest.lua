local PathfindingService = game:GetService("PathfindingService")

local zombiepather = game.Workspace["Drooling Zombie"]
local patherhumanoid = zombiepather.Humanoid
local destination = game.Workspace.FLAG

local trail = PathfindingService:CreatePath()

trail:ComputeAsync(zombiepather.HumanoidRootPart.Position, destination.Position)


local waypoints = trail:GetWaypoints()

for _, waypoint in pairs(waypoints) do
	
	
	-- Move zombie to the next waypoint
	patherhumanoid:MoveTo(waypoint.Position)
	-- Wait until zombie has reached the waypoint before continuing
	patherhumanoid.MoveToFinished:Wait()
end


