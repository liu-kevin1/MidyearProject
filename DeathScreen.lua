local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local background = script.Parent.Background
local death_text = script.Parent.DeathText

local PlayerBase = ReplicatedStorage:WaitForChild(LocalPlayer.Name)

local dead = false

local function displayDeathScreen()
	
	local tweenInfo = TweenInfo.new(1)
	local back_goal = {}
	back_goal.BackgroundTransparency = 0
	
	local text_goal = {}
	text_goal.ImageTransparency = 0
	
	local back_tween = TweenService:Create(background, tweenInfo, back_goal)
	local text_tween = TweenService:Create(death_text, tweenInfo, text_goal)
	
	back_tween:Play()
	wait(1)
	text_tween:Play()
end

local function hideDeathScreen()
	background.BackgroundTransparency = 1
	death_text.ImageTransparency = 1
end

local function manageDeathScreens()
	if PlayerBase.Resources.Health.Current.Value <= 0 and not dead then
		dead = true
		displayDeathScreen()
	else
		dead = false
		hideDeathScreen()
	end
end


PlayerBase.Resources.Health.Current:GetPropertyChangedSignal("Value"):Connect(manageDeathScreens)