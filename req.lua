class = require 'middleclass.middleclass'
f = require 'font'
require 'state'
require 'splash'
require 'menu'
require 'game'

gamestates = {}
gamestates['splash'] = FimichiSplash:new()
gamestates['menu'] = MenuState:new()
gamestates['gate'] = GameplayState:new()
