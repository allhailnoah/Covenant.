print "[quit] Preparing quit trigger"
export class QuitState extends State
	update: (dt) =>
		print "[quit] Quitting from update function"
		love.event.quit!
	draw: =>
		print "[quit] Quitting from draw function"
		love.event.quit!
