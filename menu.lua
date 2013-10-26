menu = {}

require("splash")

titleFont = love.graphics.newFont("04B_03__.TTF",40)

ready = true
drawSplash = true
start = false

function menu.update(dt)
	if ready then
		loadSplash()
		ready=false
	else
		if drawSplash then
			updateSplash(dt)
		end
	end
end

function menu.draw()
	if drawSplash then
		if playSplash() then
			drawSplash = false
			endSplash()
		end
	else
		love.graphics.setFont(titleFont)
		love.graphics.print("COVENANT.",50,100)
		love.graphics.print("menu in works, hit space",50,350)
	end
end

function menu.keypressed(key)
	if not drawSplash then
		if key==" " then
			start = true
		end
	else
		if key==" " then
			drawSplash = false
			endSplash()
		end
	end
end
