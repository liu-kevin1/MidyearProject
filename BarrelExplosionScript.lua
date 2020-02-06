local barrel = script.Parent
local humanoid = barrel.Humanoid
local explosionScript = require(game.ServerStorage:WaitForChild("ExplosionScript"))

local function explode()
	barrel.Anchored = true
	explosionScript.explode(barrel.Position)
	wait(1)
	barrel:Destroy()
end

barrel.Touched:Connect(explode)