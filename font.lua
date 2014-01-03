local fonts = {}
fonts.storage = {}
function fonts:get(type, size)
	if fonts.storage[type] then
		if fonts.storage[type][size] then
			return fonts.storage[type][size]
		else
			fonts.storage[type][size] = fonts:makefont(type, size)
			return fonts.storage[type][size]
		end
	else
		fonts.storage[type] = {}
		fonts.storage[type][size] = fonts:makefont(type, size)
		return fonts.storage[type][size]
	end
end
function fonts:makefont(type, size)
	if font == 'default' or font == 'def' then
		return love.graphics.newFont(size)
	else
		return love.graphics.newFont(type, size)
	end
end
function fonts:set(type, size)
	love.graphics.setFont(fonts:get(type, size))
end
return fonts
