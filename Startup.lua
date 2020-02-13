script.Parent.Back.Visible = true

local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")

local LocalPlayer = Players.LocalPlayer

local MainButton = script.Parent.Back.MainButton
local MainText = script.Parent.Back.MainText

local typing = false

local Copy3 = game.ReplicatedStorage.PlayerRootLight:Clone()
Copy3.Parent = workspace:WaitForChild(LocalPlayer.Name):WaitForChild("HumanoidRootPart")

local lore = [[
	In the year 2045, as tensions between world nations mounted over water scarcity due to human overpopulation and global warming, the tension finally snapped, and China decimated New York City with a nuclear warhead. All out nuclear war ensued, and the entire planet was promptly destroyed except for a few civilizations just barely scorched by the destruction. 80 years later, irradiated creatures have taken over, and hundreds of factions fight for power over the little land that is left habitable.
	
	]]

local function typewriter(textbox, message)
	typing = false
	
	textbox.Text = ""
	
	local time_increment = 0.03
	
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
			wait(time_increment * 1.5)
		elseif char == "." or char == "?" or char == "!" then
			wait(time_increment * 3)
		end
	end
	
	if not interrupted then
		typing = false
	end
end

typewriter(MainText, "Welcome, " .. LocalPlayer.Name .. ".\nPress Start")

MainButton.MouseButton1Click:Connect(function()
	MainButton.Visible = false
	typewriter(MainText, lore)
	wait(0.5)
	
	local goal = {}
	goal.Transparency = 1
	
	local tween_info = TweenInfo.new(3)
	
	local tween = TweenService:Create(script.Parent.Back, tween_info, goal)
	
	tween:Play()
	wait(1)
	script.Parent.Back.Visible = false
	
	LocalPlayer.CameraMode = Enum.CameraMode.LockFirstPerson
	
	game.ReplicatedStorage:WaitForChild("TeleportToMap"):FireServer()
	
	script.Parent:Destroy()
	script:Destroy()
end)

