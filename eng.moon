print "[eng] Hello, friend"
require 'req'
export focus = true

focusResume = ->
	focus = true
	st.current\resume!
	
focusPause = ->
	focus = false
	st.current\pause!

love.load = ->
	print "[eng] Starting game"
	st\switch "splash"

love.update = (dt) ->
	if focus
		st.current\update(dt)

love.draw = ->
	if focus
		st.current\draw!
	else
		f\set "def",42
		love.graphics.setColor 0,0,0
		love.graphics.rectangle "fill", 0, 0, 800, 600
		love.graphics.setColor 255,255,255
		love.graphics.printf "game paused, click to resume", 0, 300-42/2, 800, "center"
		
love.mousepressed = (x, y, button) ->
	if focus
		st.current\mousepressed x, y, button

love.mousereleased = (x, y, button) ->
	if focus
		st.current\mousereleased x, y, button
	else
		focusResume!

love.keypressed = (key) ->
	if focus
		if key == "escape"
			st\switch st.current\getEscapeState!
		st.current\keypressed key

love.keyreleased = (key) ->
	if focus
		st.current\keyreleased key
	else
		focusResume!
		
love.focus = (f) ->
	if focus and not f
		focusPause!
