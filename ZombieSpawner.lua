local NPCs = game.ServerStorage.NPCs
local Zombie = NPCs.Zombie
local ZombieAmount = NPCs.ZombieAmount

local MAX_ZOMBIES = 30

local MIN_HP = 20
local MAX_HP = 400
local MIN_SPD = 5
local MAX_SPD = 30

while true do
	wait(math.random(0.1, 10))
	if ZombieAmount.Value < MAX_ZOMBIES then
		local copy = Zombie:Clone()
		local xposition = math.random(-297, 345)
		local zposition = math.random(-345, 342)
		local xori = copy.MainObject.Value.Orientation.X
		local zori = copy.MainObject.Value.Orientation.Z
		local yori = copy.MainObject.Value.Orientation.Y
		
		local hp = math.random(MIN_HP, MAX_HP)
		copy.Humanoid.MaxHealth = hp
		copy.Humanoid.Health = hp
		copy.Humanoid.WalkSpeed = math.random(MIN_SPD, MAX_SPD)
		
		copy.Parent = workspace
		copy.MainObject.Value.Anchored = true
		copy.MainObject.Value.CFrame = CFrame.new(xposition, 150, zposition)
		copy.MainObject.Value.Anchored = false
		ZombieAmount.Value = ZombieAmount.Value + 1
	end
end