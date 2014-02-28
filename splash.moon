print "[splash] Creating FimichiSplash class"
export class FimichiSplash extends State
	new: =>
		print "[splash] Creating splash images storage"
		@sp = {}
		print "[splash] Importing splash images"
		@sp[1] = love.graphics.newImage "splashers/1.png"
		@sp[2] = love.graphics.newImage "splashers/2.png"
		@sp[3] = love.graphics.newImage "splashers/3.png"
		@sp[4] = love.graphics.newImage "splashers/4.png"
		@sp[5] = love.graphics.newImage "splashers/5.png"
		@sp[6] = love.graphics.newImage "splashers/6.png"
		print "[splash] Importing splash music"
		@fim = love.audio.newSource "splashers/fimichi.wav"
		@delta = 0
		@started = false
	draw: =>
		x = 0
		if @delta < 0.95
			x = 1
		elseif @delta < 1.3
			x = 2
		elseif @delta < 2.6
			x = 3
		elseif @delta < 3.1
			x = 4
		elseif @delta < 3.7
			x = 5
		elseif @delta < 10
			x = 6
		else
			x = 6
			print "[splash] We're done here"
			st\switch "menu"
		love.graphics.draw @sp[x]
		if @delta > 7 and @delta < 10
			love.graphics.setColor 0, 0, 0, 255-(10-@delta)/3*255
			love.graphics.rectangle "fill", 0, 0, 800, 600
			love.graphics.setColor 255, 255, 255, 255
	update: (dt) =>
		unless @started
			print "[splash] Starting splash"
			@started = true
			love.audio.setVolume 0.8
			love.audio.play @fim
		@delta = @delta + dt
	fastforward: (method) =>
		print "[splash] Fast-forwarded by "..method..". We're done here"
		love.audio.stop @fim
		st\switch "menu"
	mousereleased: (x, y, button) =>
		@fastforward "mouse"
	keyreleased: (key) =>
		@fastforward "keyboard"
