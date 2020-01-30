local ReplicatedStorage = game:GetService("ReplicatedStorage")
local FireBulletEvent = ReplicatedStorage:WaitForChild("FireBulletEvent")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local Mouse = LocalPlayer:GetMouse()

while true do
	FireBulletEvent:FireServer(Mouse.Hit)
	wait(2)
end