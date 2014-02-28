print "[font] Creating FontManager class"
export class FontManager
	new: =>
		print "[font] Creating general storage"
		@storage = {}
	get: (type, size) =>
		if @storage[type]
			unless @storage[type][size]
				print "[font] Creating font size "..size.." for font "..type
				@storage[type][size] = @make type, size
		else
			print "[font] Creating storage for font "..type
			@storage[type] = {}
			print "[font] Creating font size "..size.." for font "..type
			@storage[type][size] = @make type, size
		return @storage[type][size]
	make: (type, size) =>
		if type == "default" or type == "def"
			print "[font] Generating font data for size "..size..", default face"
			return love.graphics.newFont size
		else
			print "[font] Generating font data for size "..size..", face "..type
			return love.graphics.newFont type, size
	set: (type, size) =>
		love.graphics.setFont @get(type, size)
