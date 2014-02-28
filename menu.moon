print "[menu] Creating MenuEntry type"
export class MenuEntry
	new: (text, target, fg, bg, x, y, w, h) =>
		@text = text
		@target = target
		@fg = fg
		@bg = bg
		@x = x
		@y = y
		@w = w
		@h = h
	click: =>
		st\switch @target

print "[menu] Creating MenuState class"
export class MenuState extends State
	new: (entries) =>
		@entr = entries
	draw: =>
		mx, my = love.mouse.getPosition!
		love.graphics.setColor 200, 200, 200
		love.graphics.rectangle "fill", 0, 0, 800, 600
		f\set "tehfont.TTF",40
		love.graphics.setColor 100, 100, 100, 100
		love.graphics.printf "Covenant. EP", 104, 104, 600, "center"
		love.graphics.setColor 0, 0, 0
		love.graphics.printf "Covenant. EP", 100, 100, 600, "center"
		f\set "tehfont.TTF",20
		for k, v in pairs @entr
			if mx >= v.x and mx <= v.x+v.w and my >= v.y and my <= v.y+v.h
				bgal = v.bg[4]*0.75
			else
				bgal = v.bg[4]*0.33
			love.graphics.setColor v.bg[1], v.bg[2], v.bg[3], bgal
			love.graphics.rectangle "fill", v.x, v.y, v.w, v.h
			love.graphics.setColor v.fg[1]*0.5, v.fg[2]*0.5, v.fg[3]*0.5, v.fg[4]*0.5
			love.graphics.printf v.text, v.x, v.y + 2, v.w - 2, "center"
			love.graphics.setColor v.fg
			love.graphics.printf v.text, v.x, v.y, v.w, "center"
	getEscapeState: => return "quit"
	mousereleased: (x, y, button) =>
		mx, my = x, y
		for k, v in pairs @entr
			if mx >= v.x and mx <= v.x+v.w and my >= v.y and my <= v.y+v.h
				v\click!
