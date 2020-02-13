-- Edit the max zombie distance with this value --
maxdistance = 1000000

local ServerStorage = game:GetService("ServerStorage")
local DamageObjects = ServerStorage.DamageObjects
local DamageFolder = DamageObjects.DamageFolder
local Hitbox = DamageObjects.Hitbox

-- Initializes the service: "PathfindingService"
local PathfindingService = game:GetService("PathfindingService")
-- INitializes the service: "Players" --
local Players = game:GetService("Players")

-- Assigns variables to the zombie model --
local zombie = script.Parent
local humanoid = script.Parent:FindFirstChild("Humanoid")
local HumRtPart = script.Parent:FindFirstChild("HumanoidRootPart")

local function attack()
	local new_hitbox = Hitbox:Clone()
	local folder = DamageFolder:Clone()
	folder.Damage.Value = 5
	folder.DespawnTime.Value = 0.5
	folder.DestroyObject.Value = new_hitbox
	folder.Shooter.Value = "Zombie"
	folder.Parent = new_hitbox
	new_hitbox.CFrame = HumRtPart.CFrame
	new_hitbox.Parent = workspace
end

local function FindClosestPlayer(maxdistance)
		-- List to store each player found --
	local PlayerList =  {}
	-- Variable of the player to be followed
	local PlayerLockedOn = nil
	-- Search through the list of all players in the server --
	-- In for loops, i is the index, and v is the value (v is the player in this case) --
	for i, v in pairs(game.Players:GetPlayers()) do
		-- Determines the distance (v) from the Humanoid Root Part of the zombie --
		local PlayerDistance = v:DistanceFromCharacter(HumRtPart.Position)
		-- If there player is within the max distance, place the player in the list to be followed-
		if PlayerDistance <= maxdistance then
			table.insert(PlayerList, {PlayerDistance, v})
			if PlayerDistance <= 5 then
				attack()
			end
		end
	end
	
	-- Searches through the list of Players, functions acts as a comp where it returns the most recent player in the list--
	table.sort(PlayerList, function(A, B)
		return A[1] < B[1]
		
	end)
	
	-- Stores the most recent player in PlayerList as the locked on player --
	pcall(function()
		PlayerLockedOn = PlayerList[1][2]
	end)
	return PlayerLockedOn
	
end


-- While loop that always pathfinds the zombie to the target player --
wait(5)

while true do
	    -- Sets the selected player as the returned value from the FindClosestPlayer function
    local SelectedPlayer = FindClosestPlayer(maxdistance)
    if SelectedPlayer == nil then return end
    humanoid:MoveTo(SelectedPlayer.Character.PrimaryPart.Position)
	humanoid.Jump = true
    humanoid.MoveToFinished:Wait()
end








