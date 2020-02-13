local Items = game.ServerStorage.Items
local Items_list = Items:GetChildren()

local max_items = table.getn(Items_list)

while true do
	wait(math.random(1, 5))
	local chosen_item = math.random(1, max_items)
	local Item = Items_list[chosen_item]
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