local main_module = {}

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local FireBulletEvent = ReplicatedStorage:WaitForChild("FireBulletEvent")
local Players = game:GetService("Players")
while Players.LocalPlayer == nil do
	wait(1)
end
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()
local Tool = script.Parent

function main_module.setValues(Tool)
	local new_module = {}
	new_module.MAX_AMMO = Tool.MAX_AMMO
	new_module.RELOAD_TIME = Tool.RELOAD_TIME
	new_module.DAMAGE = Tool.DAMAGE
	
	new_module.reloading = false
	new_module.current_ammo = Tool.CUR_AMMO
	new_module.ammo_capacity = Tool.Capacity
	new_module.Gui = Tool.Ammo
	new_module.Ammo_Label = Tool.Ammo.Back.AmmoCount
	return new_module
end

function main_module.fireBullet(module)
	if module.current_ammo.Value > 0 then
		FireBulletEvent:FireServer(Mouse.Hit, module.DAMAGE.Value)
		module.current_ammo.Value = module.current_ammo.Value - 1
	elseif not module.reloading then
		if module.ammo_capacity.Value <= 0 then
			local children = script.Parent:GetChildren()
			
			for i=1, #children do
				if children[i] ~= script then
					children[i]:Destroy()
				end
			end
			script.Parent:Destroy()
			script:Destroy()
		end
		module.reloading = true
		local i = module.RELOAD_TIME.Value
		while i > 0 do
			module.Ammo_Label.Text = "Reloading (" .. i .. ")"
			i = i - 0.1
			wait(0.1)
		end
		module.current_ammo.Value = module.MAX_AMMO.Value
		module.ammo_capacity.Value = module.ammo_capacity.Value - module.MAX_AMMO.Value
		module.reloading = false
	end
	module.Ammo_Label.Text = "Mag: " .. module.current_ammo.Value .. "/" .. module.MAX_AMMO.Value .. "\nAmmo: " .. module.ammo_capacity.Value
end

function main_module.showGui(module)
	module.Gui.Parent = LocalPlayer.PlayerGui
end

function main_module.hideGui(module)
	module.Gui.Parent = script.Parent
end

return main_module
