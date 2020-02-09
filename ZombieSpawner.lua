local NPCs = game.ServerStorage.NPCs
local Zombie = NPCs.Zombie
local ZombieAmount = NPCs.ZombieAmount

while true do
	wait(math.random(0.1, 10))
	if ZombieAmount.Value < 15 then
		local copy = Zombie:Clone()
		local xposition = math.random(-297, 345)
		local zposition = math.random(-345, 342)
		local xori = copy.MainObject.Value.Orientation.X
		local zori = copy.MainObject.Value.Orientation.Z
		local yori = copy.MainObject.Value.Orientation.Y
		copy.Parent = workspace
		copy.MainObject.Value.Anchored = true
		copy.MainObject.Value.CFrame = CFrame.new(xposition, 150, zposition)
		copy.MainObject.Value.Anchored = false
		ZombieAmount.Value = ZombieAmount.Value + 1
	end
end