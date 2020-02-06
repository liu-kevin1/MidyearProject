local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PlayerName = script.Parent.Parent.Name

local PlayerBase = ReplicatedStorage:WaitForChild(PlayerName)
local Health = PlayerBase.Resources.Health
local Stamina = PlayerBase.Resources.Stamina

local function regenerate_resource(res_folder, percent)
	local Current = res_folder.Current
	local Max = res_folder.Max
	
	local replenish_amount = Max.Value * percent
	
	Current.Value = Current.Value + replenish_amount
	
	if Current.Value > Max.Value then
		Current.Value = Max.Value
	end
end

while true do
	if Health.Current.Value > 0 then
		regenerate_resource(Health, 0.001)
	end
	
	if not PlayerBase.States.IsRunning.Value then
		regenerate_resource(Stamina, 0.015)
	end
	
	wait(0.1)
end