local gun = script.Parent
local owned = script.Parent.OWNED

gun.Handle.Touched:Connect(function(object)
	if object.Parent:FindFirstChild("Humanoid") ~= nil then
		if object.Parent.Name ~= "Zombie" then
			gun.Parent = game.Players[object.Parent.Name].Backpack
		end
	end
end)