local ReplicatedStorage = game:GetService("ReplicatedStorage")
local PlayerName = script.Parent.Parent.Name

local PlayerBase = ReplicatedStorage:WaitForChild(PlayerName)
local Health = PlayerBase.Resources.Health

local top_y = 0
local bot_y = 0
local falling = PlayerBase.States.IsFalling

workspace:WaitForChild(PlayerName).Humanoid:GetPropertyChangedSignal("FloorMaterial"):Connect(function()
	if workspace[PlayerName].Humanoid.FloorMaterial == Enum.Material.Air then
		top_y = workspace[PlayerName].HumanoidRootPart.Position.Y
		falling.Value = true
	else
		if falling.Value then
			falling.Value = false
			
			bot_y = workspace[PlayerName].HumanoidRootPart.Position.Y
			
			if top_y - bot_y > 18 then
			
				local damage = 2.25 * math.sqrt(10 * (top_y - 20))
				
				Health.Current.Value = Health.Current.Value - damage
			end
		end
	end
end)

