-- Variables for the zombie and its humanoid
local zombie = game.Workspace.Zombie
local humanoid = zombie.Humanoid
 
-- Variables for the point(s) the zombie should move between
local pointA = game.Workspace.D1
local pointB = game.Workspace.D2
local pointC = game.Workspace.D3
local pointD = game.Workspace.D4
 

while true do
	-- Move the zombie to the primary part of the green flag model
	humanoid:MoveTo(pointA.Position)
	 
	-- Wait until the zombie has reached its first target
	humanoid.MoveToFinished:Wait()
	 
	-- Move the zombie to the primary part of the purple flag model
	humanoid:MoveTo(pointB.Position)
	
	humanoid.MoveToFinished:Wait()
	 
	-- Move the zombie to the primary part of the purple flag model
	humanoid:MoveTo(pointC.Position)
	
	humanoid.MoveToFinished:Wait()
	 
	-- Move the zombie to the primary part of the purple flag model
	humanoid:MoveTo(pointD.Position)
	
	humanoid.MoveToFinished:Wait()
	 
	-- Move the zombie to the primary part of the purple flag model
	humanoid:MoveTo(pointA.Position)
end	