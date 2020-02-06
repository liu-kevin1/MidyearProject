local ReplicatedStorage = game:WaitForChild("ReplicatedStorage")
local Damage = script.Parent.Damage.Value
local Shooter = script.Parent.Shooter.Value
local hit = {}

local function touchedEvent(object)
	if object:FindFirstChild("Identifier") ~= nil then
		if object.Identifier.Value == "Barrel" and Shooter ~= "Barrel" then
			local hum = object.Humanoid
			
			if hit[hum.Name] == nil then
				hit[hum.Name] = true
				hum.Health = hum.Health - Damage
			end
		elseif object.Identifier.Value == "Zombie" then
			local hum = object.Humanoid
			
			if hit[hum.Name] == nil then
				hit[hum.Name] = true
				hum.Health = hum.Health - Damage
			end
		end
	else
		if object.Parent:FindFirstChild("Humanoid") ~= nil then
			local name = object.Parent.Name
			
			if name ~= Shooter and hit[name] == nil then
				hit[name] = true
				local playerBase = ReplicatedStorage[name]
				local current = playerBase.Resources.Health.Current
				if current.Value > 0 then
					current.Value = current.Value - Damage
					
					if current.Value <= 0 then
						local kills = ReplicatedStorage[Shooter].Stats.Kills
						kills.Value = kills.Value + 1
						print(Shooter .. " killed " .. name)
					end
				end
			end
		end
	end
end

script.Parent.Parent.Touched:Connect(touchedEvent)