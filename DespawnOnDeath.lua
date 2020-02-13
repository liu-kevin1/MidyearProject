local ZombieAmount = game.ServerStorage.NPCs.ZombieAmount
local hum = script.Parent.Humanoid

local function despawnOnDeath()
	if hum.Health <= 0 then
		wait(3)
		ZombieAmount.Value = ZombieAmount.Value - 1
		script.Parent:Destroy()
	end
end

hum:GetPropertyChangedSignal("Health"):Connect(despawnOnDeath)