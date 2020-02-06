script.Parent.Back.Visible = true

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer

local MainButton = script.Parent.Back.MainButton
local MainText = script.Parent.Back.MainText

local typing = false

local Copy3 = game.ReplicatedStorage.PlayerRootLight:Clone()
Copy3.Parent = workspace:WaitForChild(LocalPlayer.Name):WaitForChild("HumanoidRootPart")

local function typewriter(textbox, message)
	typing = false
	
	textbox.Text = ""
	
	local time_increment = 0.05
	
	typing = true
	
	local interrupted = false
	
	for i = 1, string.len(message) do
		if not typing then
			interrupted = true
			break
		end
		
		local char = string.sub(message, i, i)
		textbox.Text = textbox.Text .. char
		wait(time_increment)
		if char == "," then
			wait(time_increment * 2)
		elseif char == "." or char == "?" or char == "!" then
			wait(time_increment * 4)
		end
	end
	
	if not interrupted then
		typing = false
	end
end

typewriter(MainText, "Welcome, " .. LocalPlayer.Name .. ".\nPress Start")

MainButton.MouseButton1Click:Connect(function()
	MainButton.Visible = false
	typewriter(MainText, "Alright, let's get into it.")
	wait(1)
	
	local goal = {}
	goal.Transparency = 1
	
	local tween_info = TweenInfo.new(3)
	
	local tween = TweenService:Create(script.Parent.Back, tween_info, goal)
	
	tween:Play()
	
	script.Parent.Back.Visible = false
end)