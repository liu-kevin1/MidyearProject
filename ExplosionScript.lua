local module = {}

local tweenService = game:GetService("TweenService")

local explosion = script.Parent.DamageObjects.Explosion
local damageFolder = script.Parent.DamageObjects.DamageFolder

function module.explode(position)
	local boom = explosion:Clone()
	local folder = damageFolder:Clone()
	folder.Parent = boom
	folder.Damage.Value = 100
	folder.DespawnTime.Value = 3
	folder.DestroyObject.Value = boom
	folder.Shooter.Value = "Barrel"
	
	local smoke = Instance.new("Smoke")
	
	
	local radius = 45
	local goal = {}
	goal.Size = Vector3.new(radius, radius, radius)
	
	local tweenInfo = TweenInfo.new(0.5)
	
	local tween = tweenService:Create(boom, tweenInfo, goal)
	
	boom.Position = position
	boom.Parent = workspace
	tween:Play()
end

return module
