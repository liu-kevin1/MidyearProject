local ReplicatedStorage = game:WaitForChild("ReplicatedStorage")
local Damage = script.Parent.Damage.Value

local function touchedEvent(object)
	if object.Parent:FindFirstChild("Humanoid") ~= nil then
		local name = object.Parent.Humanoid.Parent.Name
		local playerBase = ReplicatedStorage[name]
		local current = playerBase.Resources.Health.Current
		current.Value = current.Value - Damage
	end
end

script.Parent.Touched:Connect(touchedEvent)

wait(5)

script.Parent:Destroy()