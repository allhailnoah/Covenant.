print "[req] Initializing..."
print "[req] Loading font management"
require 'font'
print "[req] Creating FontManager"
export f = FontManager!

print "[req] Loading state management"
require 'state'
print "[req] Creating StateManager"
export st = StateManager!

print "[req] Loading splash files"
require 'splash'
print "[req] Creating FimichiSplash state"
st\add "splash", FimichiSplash!

print "[req] Loading menu builder"
require 'menu'
print "[req] Creating menu entries list"
menus = {}
print "[req] Adding Red Pill to menu entries"
menus[1] = MenuEntry "Learn", "game", {255, 0, 0, 255}
print "[req] Adding Blue Pill to menu entries"
menus[2] = MenuEntry "Leave", "quit", {0, 0, 255, 255}
print "[req] Building menu state"
st\add "menu", MenuState menus

print "[req] Loading quit trigger"
require 'quit'
print "[req] Making quit trigger available"
st\add "quit", QuitState!

print "[req] Initializing complete."
