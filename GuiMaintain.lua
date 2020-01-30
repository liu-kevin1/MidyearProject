local ReplicatedStorage = game:GetService("ReplicatedStorage")
local TweenService = game:GetService("TweenService")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local PlayerBase = ReplicatedStorage:WaitForChild(LocalPlayer.Name)
local Resources = PlayerBase.Resources

local Stamina = Resources.Stamina
local Health = Resources.Health

local StaminaBar = script.Parent.Stamina.Front
local HealthBar = script.Parent.Health.Front

local HEALTH_X_SIZE = 0.5
local STAMINA_X_SIZE = 0.4

local function update_bar(bar, resource_folder, x_size)
	local current = resource_folder.Current.Value
	local max = resource_folder.Max.Value
	
	local ratio = current / max
	
	local goal = {}
	goal.Size = UDim2.new(x_size * ratio, 0, 0.025, 0)
	
	local tween_info = TweenInfo.new(1)
	
	local tween = TweenService:Create(bar, tween_info, goal)
	
	tween:Play()
	
end

local function update_stamina()
	update_bar(StaminaBar, Stamina, STAMINA_X_SIZE)
end

local function update_health()
	update_bar(HealthBar, Health, HEALTH_X_SIZE)
end


Health.Current:GetPropertyChangedSignal("Value"):Connect(update_health)
Health.Max:GetPropertyChangedSignal("Value"):Connect(update_health)

Stamina.Current:GetPropertyChangedSignal("Value"):Connect(update_stamina)
Stamina.Max:GetPropertyChangedSignal("Value"):Connect(update_stamina)