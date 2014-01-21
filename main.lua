require 'req'
focus = false

function love.load()
	statechange(gamestates['splash'])
end

function love.update(dt)
	if focus then
		gamestate:update(dt)
	end
end

function love.draw()
	if focus then
		gamestate:draw()
	else
		f:set("04B_03__.TTF",42)
		love.graphics.setColor(0,0,0)
		love.graphics.rectangle("fill", 0, 0, 800, 600)
		love.graphics.setColor(255, 255, 255)
		love.graphics.printf("game paused, click to resume", 0, 300-42/2, 800, "center")
	end
end

function love.mousepressed(x, y, button)
	if focus then
		gamestate:mousepressed(x, y, button)
	end
end

function love.mousereleased(x, y, button)
	if focus then
		gamestate:mousereleased(x, y, button)
	else
		onFocus(true)
	end
end

function love.keypressed(key, unicode)
	if focus then
		if key == "escape" then
			if gamestate ~= gamestates['menu'] then
				statechange(gamestate:getEscapeState())
			else
				love.event.quit()
			end
		end
		gamestate:keypressed(key)
	end
end

function love.keyreleased(key)
	if focus then
		gamestate:keyreleased(key)
	else
		onFocus(true)
	end
end

function love.focus(f)
	if focus and not f then
		onFocus(false)
	end
end

function statechange(state)
	gamestate = state
end

function onFocus(f)
	focus = f
	if f then
		love.audio.resume()
		gamestate:onresume()
	else
		love.audio.pause()
		gamestate:onpause()
	end
end
