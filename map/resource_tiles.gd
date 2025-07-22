# resource_tiles.gd
extends TileMapLayer

var sand = preload("res://map/sand_background.tscn")
var instance: Node

func _ready() -> void:
	var cells = get_used_cells()
	for cell in cells:
		var pos = map_to_local(cell)
		instance = sand.instantiate()
		instance.position = pos
		add_child(instance)
