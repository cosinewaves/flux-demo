local ReplicatedStorage = game:GetService("ReplicatedStorage")
local GameStateChanged = ReplicatedStorage:WaitForChild("GameStateChanged")

-- add types
type States = "Lobby" | "Playing" | "GameOver"

-- create text label
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui")
gui.Parent = player:WaitForChild("PlayerGui")

local label = Instance.new("TextLabel")
label.Size = UDim2.fromScale(1, 0.2)
label.Position = UDim2.fromScale(0, 0)
label.TextScaled = true
label.Parent = gui

GameStateChanged.OnClientEvent:Connect(function(newState: States): ()
	if newState == "Lobby" then
		label.Text = "Waiting in Lobby..."
	elseif newState == "Playing" then
		label.Text = "Game in Progress!"
	elseif newState == "GameOver" then
		label.Text = "Game Over!"
	end
end)
