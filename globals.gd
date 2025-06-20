extends Node

var player_count: int = 2
var mouse_on_log: bool = false
var pan_toggle: bool = false:
	set(value):
		if value:
			pan_val = -1
		else:
			pan_val = 1

var pan_val: int = 1

var player_colors: Array[Color] = [Color("#000000"), Color("#ff0000"), Color("#00ff00"), Color("#0000ff"), Color("#ffff00"), Color("#ff00ff"), Color("#00ffff"), Color("#ffffff")]
