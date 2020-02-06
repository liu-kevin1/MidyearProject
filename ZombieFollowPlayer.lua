-- Edit the max zombie distance with this value --
maxdistance = 100000



-- Initializes the service: "PathfindingService"
local PathfindingService = game:GetService("PathfindingService")
-- INitializes the service: "Players" --
local Players = game:GetService("Players")

-- Assigns variables to the zombie model --
local zombie = game.Workspace.FollowPlayerZombie
local humanoid = zombie.Humanoid
local HumRtPart = zombie.HumanoidRootPart


-- Function to locate the nearest player to the zombie --
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
	
	print(PlayerLockedOn)
	return PlayerLockedOn
	
end
	

-- While loop that always pathfinds the zombie to the target player --
while true do
    wait()
	    -- Sets the selected player as the returned value from the FindClosestPlayer function
    local SelectedPlayer = FindClosestPlayer(maxdistance)
    if SelectedPlayer == nil then return end
    humanoid:MoveTo(SelectedPlayer)
    humanoid.MoveToFinished:Wait()
end
	







