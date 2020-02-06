local gun = script.Parent
local owned = script.Parent.OWNED

gun.Main.Touched:Connect(function(object)
	if object.Parent:FindFirstChild("Humanoid") ~= nil then
		gun.Parent = game.Players[object.Parent.Name].Backpack
	end
end)