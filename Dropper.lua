local Items = game.ServerStorage.Items
local Items_list = Items:GetChildren()

local max_items = table.getn(Items_list)

while true do
	wait(1)
	local chosen_item = math.random(1, max_items)
	local Item = Items_list[chosen_item]
	local copy = Item:Clone()
	local xposition = math.random(-297, 345)
	local zposition = math.random(-345, 342)
	copy.Handle.Position = Vector3.new(xposition, 150, zposition)
	copy.Parent = workspace

end