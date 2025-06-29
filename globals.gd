# globals.gd
extends Node

var current_player: int = 4
var player_count: int = 8
var mouse_on_log: bool = false
var pan_toggle: bool = false:
	set(value):
		if value:
			pan_val = -1
		else:
			pan_val = 1

var pan_val: int = 1

var player_colors: Array[Color] = [Color("#000000"), Color("#ff0000"), Color("#00ff00"), Color("#0000ff"), Color("#ffff00"), Color("#ff00ff"), Color("#00ffff"), Color("#ffffff")]

signal build_road
signal road_built
signal build_house
signal house_built
signal build_fortress
signal fortress_built
signal move_robber
