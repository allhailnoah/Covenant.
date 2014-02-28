export class Component
	cinit: (criteria) =>
	new: (type, parent, owncriteria) =>
		@type = type
		@parent = parent
		@parent.assign @
		@cinit owncriteria
	update: (dt) =>
	draw: =>
	keypressed: (key) =>
	keyreleased: (key) =>
	mousepressed: (x, y, button) =>
	mousereleased: (x, y, button) =>
	resume: =>
	pause: =>

export class GameObject
	new: (name) =>
		@name = name
		@components = {}
	assign: (component) =>
		@components[component.type] = component
	get: (type) =>
		return @components[type]

export class Vector3
	new: (x, y, z) =>
		@x = x
		@y = y
		@z = z

export class Transform extends Component
	cinit: (criteria) =>
		if criteria[pos]
			@pos = criteria[pos]
		else
			@pos = Vector3 0, 0, 0
