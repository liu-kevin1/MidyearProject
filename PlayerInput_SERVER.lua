local ReplicatedStorage = game:GetService("ReplicatedStorage")

local InputEvent = Instance.new("RemoteEvent", ReplicatedStorage)
InputEvent.Name = "InputEvent"

local function ConnectInput(player, input)
	local Hum = workspace[player.Name].Humanoid
	local PlayerBase = ReplicatedStorage[player.Name]
	
	if input == "RUN_START" then
		if not PlayerBase.States.IsRunning.Value then
			PlayerBase.States.IsRunning.Value = true
		end
		
	elseif input == "RUN_END" then
		if PlayerBase.States.IsRunning.Value then
			PlayerBase.States.IsRunning.Value = false
		end
	end
	
	if PlayerBase.States.IsRunning.Value then
		Hum.WalkSpeed = 32
	else
		Hum.WalkSpeed = 16
	end
end

InputEvent.OnServerEvent:Connect(ConnectInput)