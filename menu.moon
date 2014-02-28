print "[menu] Creating MenuEntry type"
export class MenuEntry
	new: (text, target, fg, bg) =>
		@text = text
		@target = target
		@fg = fg
		@bg = bg
	gtext: => return @text
	gtarget: => return @target
	gfg: => return @fg
	gbg: => return @bg

print "[menu] Creating MenuState class"
export class MenuState extends State
	new: (entries) =>
		@entr = entries
	draw: =>
		f\set "tehfont.TTF",40
		love.graphics.printf "Covenant. EP", 100, 100, 600, "center"
		f\set "tehfont.TTF",20
		y = 300
		for k, v in pairs @entr
			love.graphics.printf v\gtext!, 300, y, 200, "center"
			y = y + 100
	getEscapeState: => return "quit"
