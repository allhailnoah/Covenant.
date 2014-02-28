print "[state] Creating State general interface"
export class State
	new: =>
	update: (dt) =>
	draw: =>
	keypressed: (key) =>
	keyreleased: (key) =>
	mousepressed: (x, y, button) =>
	mousereleased: (x, y, button) =>
	resume: =>
	pause: =>
	getEscapeState: => return "menu"
print "[state] Creating StateManager class"
export class StateManager
	new: =>
		print "[state] Creating states storage"
		@states = {}
		@current = nil
	add: (name, state) =>
		print "[state] Adding state "..name.." to storage"
		@states[name] = state
	get: (name) => return @states[name]
	gc: => return @current
	switch: (name) =>
		print "[state] Switching to "..name.." state"
		@current = @states[name]
