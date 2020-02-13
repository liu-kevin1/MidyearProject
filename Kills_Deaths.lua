local killsLabel = script.Parent.KillsText
local deathsLabel = script.Parent.DeathsText
local players = game:GetService("Players")
local playerName = players.LocalPlayer.Name
local playerBase = game.ReplicatedStorage[playerName]
local kills = playerBase.Stats.Kills
local deaths = playerBase.Stats.Deaths

local function change_kills()
	killsLabel.Text = "Kills: " .. kills.Value
end

local function change_deaths()
	deathsLabel.Text = "Deaths: " .. deaths.Value 
end

change_kills()
change_deaths()

kills:GetPropertyChangedSignal("Value"):Connect(change_kills)
deaths:GetPropertyChangedSignal("Value"):Connect(change_deaths)
