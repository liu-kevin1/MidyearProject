local ReplicatedStorage = game:WaitForChild("ReplicatedStorage")
local KillQueue = ReplicatedStorage.KillQueue

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
	elseif object:FindFirstChild("Identifier") ~= nil then
		if object.Parent.Identifier.Value == "Barrel" and Shooter ~= "Barrel" then
			local hum = object.Parent.Humanoid
			
			if hit[hum.Name] == nil then
				hit[hum.Name] = true
				hum.Health = hum.Health - Damage
			end
		elseif object.Parent.Identifier.Value == "Zombie" then
			local hum = object.Parent.Humanoid
			
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
						if Shooter ~= "Barrel" then
							local kills = ReplicatedStorage[Shooter].Stats.Kills
							kills.Value = kills.Value + 1
						end
						
						local kill_message = Shooter .. " killed " .. name
						
						if KillQueue.q5.Value ~= "" then
							KillQueue.q5.Value = KillQueue.q4.Value
							KillQueue.q4.Value = KillQueue.q3.Value
							KillQueue.q3.Value = KillQueue.q2.Value
							KillQueue.q2.Value = KillQueue.q1.Value
							KillQueue.q1.Value = kill_message
						else
							if KillQueue.q1.Value == "" then
								KillQueue.q1.Value = kill_message
							elseif KillQueue.q2.Value == "" then
								KillQueue.q2.Value = kill_message
							elseif KillQueue.q3.Value == "" then
								KillQueue.q3.Value = kill_message
							elseif KillQueue.q4.Value == "" then
								KillQueue.q4.Value = kill_message
							elseif KillQueue.q5.Value == "" then
								KillQueue.q5.Value = kill_message
							end
						end
					end
				end
			end
		end
	end
end

script.Parent.Parent.Touched:Connect(touchedEvent)