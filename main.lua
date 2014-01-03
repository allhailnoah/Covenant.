require 'req'

function love.load()
	statechange(gamestates['splash'])
end

function love.update(dt)
	gamestate:update(dt)
end

function love.draw()
	gamestate:draw()
end

function love.mousepressed(x, y, button)
	gamestate:mousepressed(x, y, button)
end

function love.mousereleased(x, y, button)
	gamestate:mousereleased(x, y, button)
end

function love.keypressed(key, unicode)
	if key == "escape" then
		if gamestate ~= gamestates['menu'] then
			statechange(gamestate:getEscapeState())
		else
			love.event.quit()
		end
	end
	gamestate:keypressed(key)
end

function love.keyreleased(key)
	gamestate:keyreleased(key)
end

function statechange(state)
	gamestate = state
end
