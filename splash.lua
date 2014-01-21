FimichiSplash = class('FimichiSplash', State)

function FimichiSplash:initialize()
	self.sp = {}
	self.sp[1] = love.graphics.newImage("splashers/1.png")
	self.sp[2] = love.graphics.newImage("splashers/2.png")
	self.sp[3] = love.graphics.newImage("splashers/3.png")
	self.sp[4] = love.graphics.newImage("splashers/4.png")
	self.sp[5] = love.graphics.newImage("splashers/5.png")
	self.sp[6] = love.graphics.newImage("splashers/6.png")
	self.fim = love.audio.newSource("splashers/fimichi.wav")
	self.delta = 0
	self.started = false
end

function FimichiSplash:draw()
	local x
	if self.delta<0.95 then
		x=1
	elseif self.delta<1.3 then
		x=2
	elseif self.delta<2.6 then
		x=3
	elseif self.delta<3.1 then
		x=4
	elseif self.delta<3.7 then
		x=5
	elseif self.delta<10 then
		x=6
	else
		x=6
		statechange(gamestates['menu'])
	end
	love.graphics.draw(self.sp[x])
	if self.delta>7 and self.delta<10 then
		love.graphics.setColor(0,0,0,255-(10-self.delta)/3*255)
		love.graphics.rectangle("fill",0,0,800,600)
		love.graphics.setColor(255,255,255,255)
	end
end

function FimichiSplash:update(dt)
	if not self.started then
		self.started = true
		love.audio.setVolume(0.8)
		love.audio.play(self.fim)
	end
	self.delta=self.delta+dt
end
