local medkit = script.Parent.Handle
local healed = false

local function heal(object)
	if object.Parent:FindFirstChild("Humanoid")~= nil and not healed then
		healed = true
		local name = object.Parent.Humanoid.Parent.Name
		local health = game.ReplicatedStorage[name].Resources.Health
		health.Current.Value = health.Current.Value + 25
		script.Parent.Handle:Destroy()
		script.Parent:Destroy()
		script:Destroy()
	end
end


medkit.Touched:Connect(heal)
medkit.Union.Touched:Connect(heal)
medkit.Union2.Touched:Connect(heal)
medkit.Union3.Touched:Connect(heal)
medkit.Union5.Touched:Connect(heal)