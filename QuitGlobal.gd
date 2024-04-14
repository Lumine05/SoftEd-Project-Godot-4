extends Node
var lvl1quit = false

# Function to set the global variable
func set_game_quit():
	lvl1quit = true
	print("true")
# Function to get the global variable
func get_game_quit():
	return lvl1quit
