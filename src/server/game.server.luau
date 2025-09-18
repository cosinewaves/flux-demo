local ReplicatedStorage = game:GetService("ReplicatedStorage")
local flux = require(ReplicatedStorage.Packages.flux)

-- networking
local GameStateChanged: RemoteEvent = ReplicatedStorage.GameStateChanged

-- create state machine
local machine = flux("Lobby")

-- define states
machine:addState({ name = "Lobby" })
machine:addState({ name = "Playing" })
machine:addState({ name = "GameOver" })

-- add middleware to dispatch info to client
machine:use({
	afterChange = function(oldState: string, newState: string): ()
		GameStateChanged:FireAllClients(newState)
	end,
})

-- simple loop demo
task.spawn(function()
	while true do
		machine:changeState("Lobby")
		task.wait(5) -- wait in lobby

		machine:changeState("Playing")
		task.wait(10) -- play time

		machine:changeState("GameOver")
		task.wait(5) -- show results
	end
end)
