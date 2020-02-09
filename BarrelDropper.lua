local Item = game.ServerStorage.Items.Barrel

while true do
	wait(5)
	local copy = Item:Clone()
	local xposition = math.random(-297, 345)
	local zposition = math.random(-345, 342)
	local xori = copy.MainObject.Value.Orientation.X
	local zori = copy.MainObject.Value.Orientation.Z
	local yori = copy.MainObject.Value.Orientation.Y
	copy.Parent = workspace
	copy.MainObject.Value.Anchored = true
	copy.MainObject.Value.CFrame = CFrame.new(xposition, 150, zposition)
	copy.MainObject.Value.Anchored = false
end