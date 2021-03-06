local ServerStorage = game:GetService("ServerStorage")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local FireBulletEvent = Instance.new("RemoteEvent", ReplicatedStorage)
FireBulletEvent.Name = "FireBulletEvent"

local Bullet = ServerStorage.DamageObjects.Bullet
local damageFolder = ServerStorage.DamageObjects.DamageFolder

local function fireBullet(player, bullet_target, damage, spawn_pos)
	local char = workspace[player.Name]
	
	local bullet = Bullet:Clone()
	bullet.Position = spawn_pos
	bullet.BodyVelocity.Velocity = bullet_target.lookVector * 60
	bullet.BodyVelocity.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
	bullet.BodyVelocity.P = 10000
	
	local folder = damageFolder:Clone()
	folder.Parent = bullet
	folder.Shooter.Value = player.Name
	folder.Damage.Value = damage
	folder.DestroyObject.Value = bullet
	folder.DespawnTime.Value = 5
	bullet.Parent = workspace
end


FireBulletEvent.OnServerEvent:Connect(fireBullet)