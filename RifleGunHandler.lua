local Tool = script.Parent
local firing = false
local name = script.Parent.Parent.Name
local GunHandler = require(script.Parent:WaitForChild("GunHandler"))

local module = GunHandler.setValues(Tool)

Tool.Equipped:Connect(function(mouse)
	mouse.Button1Down:Connect(function()
		firing = true
	end)
	
	mouse.Button1Up:Connect(function()
		firing = false
	end)
end)

Tool.Equipped:Connect(function()
	GunHandler.showGui(module)
end)

Tool.Unequipped:Connect(function()
	firing = false
	GunHandler.hideGui(module)
end)

while true do
	wait(0.25)
	if firing then
		GunHandler.fireBullet(module)
	end
end