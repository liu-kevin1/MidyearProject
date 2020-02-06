local GunHandler = require(script.Parent.Parent:WaitForChild("GunHandler"))
local Tool = script.Parent

local module = GunHandler.setValues(Tool)

Tool.Activated:Connect(function()
	GunHandler.fireBullet(module)
end)

Tool.Equipped:Connect(function()
	GunHandler.showGui(module)
end)

Tool.Unequipped:Connect(function()
	GunHandler.hideGui(module)
end)