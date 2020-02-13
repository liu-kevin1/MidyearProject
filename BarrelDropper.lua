local Item = game.ServerStorage.Items.Barrel
local xori = Item.MainObject.Value.Orientation.X
local zori = Item.MainObject.Value.Orientation.Z
local yori = Item.MainObject.Value.Orientation.Y

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local dropBarrelEvent = Instance.new("RemoteEvent", ReplicatedStorage)
dropBarrelEvent.Name = "dropBarrelEvent"

local function drop_barrel(cframe)
	local copy = Item:Clone()
	copy.Parent = workspace
	copy.MainObject.Value.Anchored = true
	copy.MainObject.Value.CFrame = cframe
	copy.MainObject.Value.Anchored = false
end

local function player_drop_barrel(player, cframe)
	drop_barrel(CFrame.new(cframe.X, 150, cframe.Z))
end

dropBarrelEvent.OnServerEvent:Connect(player_drop_barrel)

while true do
	wait(5)
	local copy = Item:Clone()
	local xposition = math.random(-297, 345)
	local zposition = math.random(-345, 342)
	drop_barrel(CFrame.new(xposition, 150, zposition))
end