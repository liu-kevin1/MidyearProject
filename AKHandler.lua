local Tool = script.Parent
local firing = false
local setup = false
local name = script.Parent.Parent.Name

Tool.Equipped:Connect(function(mouse)
	GunHandler = require(game.Players[name].Backpack:WaitForChild("GunHandler"))
	module = GunHandler.setValues(Tool)
	setup = true
	mouse.Button1Down:Connect(function()
		firing = true
	end)
	
	mouse.Button1Up:Connect(function()
		firing = false
	end)
end)

Tool.Equipped:Connect(function()
	if setup then
		GunHandler.showGui(module)
	end
end)

Tool.Unequipped:Connect(function()
	if setup then
		GunHandler.hideGui(module)
	end
end)

while true do
	wait(0.1)
	if firing then
		GunHandler.fireBullet(module)
	end
end