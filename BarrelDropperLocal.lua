local tool = script.Parent
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local dropBarrelEvent = ReplicatedStorage:WaitForChild("dropBarrelEvent")

tool.Activated:Connect(function()
	local cf = Mouse.Hit
	
	dropBarrelEvent:FireServer(cf)
end)