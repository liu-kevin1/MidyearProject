local UserInputService = game:GetService("UserInputService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local InputEvent = ReplicatedStorage:WaitForChild("InputEvent")

local function PlayerInputBegan(input, gameprocessed)
	if gameprocessed then
		return
	end
	
	if input.UserInputType == Enum.UserInputType.Keyboard then
		if input.KeyCode == Enum.KeyCode.LeftShift then
			InputEvent:FireServer("RUN_START")
		end
	end
end

local function PlayerInputEnded(input, gameprocessed)
	if gameprocessed then
		return
	end
	
	if input.UserInputType == Enum.UserInputType.Keyboard then
		if input.KeyCode == Enum.KeyCode.LeftShift then
			InputEvent:FireServer("RUN_END")
		end
	end
end


UserInputService.InputBegan:Connect(PlayerInputBegan)
UserInputService.InputEnded:Connect(PlayerInputEnded)