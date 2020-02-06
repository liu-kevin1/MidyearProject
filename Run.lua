local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PlayerName = script.Parent.Parent.Name

local PlayerBase = ReplicatedStorage:WaitForChild(PlayerName)
local IsRunning = PlayerBase.States.IsRunning
local Stamina = PlayerBase.Resources.Stamina

while true do
	local Hum = workspace:WaitForChild(PlayerName).Humanoid
	
	if IsRunning.Value then
		Hum.WalkSpeed = 24
		Stamina.Current.Value = Stamina.Current.Value - 2
		
		if Stamina.Current.Value <= 0 then
			IsRunning.Value = false
		end
	else
		Hum.WalkSpeed = 16
	end
	
	wait(0.1)
end