local TweenService = game:GetService("TweenService")

local door = script.Parent

local closed = {}
closed.Position = Vector3.new(76.5, 23.984, -42.5)

local open = {}
open.Position = Vector3.new(96.5, 23.984, -42.5)

local tweenInfo = TweenInfo.new(1)

local state = "closed"
local tweening = false

local function toggle(object)
	if object.Parent.Name ~= "Zombie" then
		if not tweening then
			tweening = true
			local t = TweenService:Create(door, tweenInfo, open)
			t:Play()
			
			wait(3)
			
			local t = TweenService:Create(door, tweenInfo, closed)
			t:Play()
			tweening = false
		end
	end
end

door.Touched:Connect(toggle)