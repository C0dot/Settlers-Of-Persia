extends Node2D

@onready var resource_tiles: TileMapLayer = $"../ResourceTiles"
const ROAD_TILE = preload("res://map/road_tile.tscn")
var instance: Node

var _data: Dictionary[int, Vector2] = {
	30: Vector2(29*sin(PI/3), 14.5),
	90: Vector2(0, 29),
	150: Vector2(-29*sin(PI/3), 14.5)
	}

func tile_sort(a: Vector2i, b: Vector2i) -> bool:
	if a.x == b.x:
		return a.y < b.y
	return a.x < b.x

func toggle_build_visibility():
	for child in get_children():
		if not child.active:
			child.visible = not child.visible

func _ready() -> void:
	var sorted_tiles = resource_tiles.get_used_cells()
	sorted_tiles.sort_custom(tile_sort)

	var cells: Dictionary[Vector2i, float] = {}

	for tile in sorted_tiles:
		for position_modifier in [-1, 1]:
			for tile_rotation in _data:
				cells[Vector2i(resource_tiles.map_to_local(tile) + position_modifier*_data[tile_rotation])] = tile_rotation

	for key in cells:
		instance = ROAD_TILE.instantiate()
		instance.position = key
		instance.rotation_degrees = cells[key]
		add_child(instance)

	Globals.build_road_toggle.connect(toggle_build_visibility)
	
