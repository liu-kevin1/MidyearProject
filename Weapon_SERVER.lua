local ServerStorage = game:GetService("ServerStorage")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local FireBulletEvent = Instance.new("RemoteEvent", ReplicatedStorage)
FireBulletEvent.Name = "FireBulletEvent"

local Bullet = ServerStorage.Projectiles.Bullet

local function fireBullet(player, position)
	local char = workspace[player.Name]
	
	local bullet = Bullet:Clone()
	bullet.CFrame = char.HumanoidRootPart.CFrame * CFrame.new(0, 0, -2)
	bullet.BodyVelocity.Velocity = position.lookVector * 60
	bullet.BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
	bullet.Damage.Value = 10
	bullet.Parent = workspace
end


FireBulletEvent.OnServerEvent:Connect(fireBullet)