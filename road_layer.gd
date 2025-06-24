extends Node2D

@onready var resource_tiles: TileMapLayer = $"../ResourceTiles"
const ROAD_TILE = preload("res://road_tile.tscn")
var instance: Node

var _data: Dictionary[int, Vector2] = {
	30: Vector2(29*sin(PI/3), 14.5),
	90: Vector2(0, 29),
	150: Vector2(-29*sin(PI/3), 14.5)
	}

var cells_data: Dictionary[Vector2i, float] = {}

var cells: Dictionary[Vector2i, Node] = {}

func add_road(location, owner_id):
	instance = ROAD_TILE.instantiate()
	instance.position = location
	instance.rotation_degrees = cells_data[location]
	instance.owner_id = owner_id
	add_child(instance)
	cells[location] = instance
	return instance

func tile_sort(a: Vector2i, b: Vector2i) -> bool:
	if a.x == b.x:
		return a.y < b.y
	return a.x < b.x

func _ready() -> void:
	var sorted_tiles = resource_tiles.get_used_cells()
	sorted_tiles.sort_custom(tile_sort)

	for tile in sorted_tiles:
		for position_modifier in [-1, 1]:
			for tile_rotation in _data:
				cells_data[Vector2i(resource_tiles.map_to_local(tile) + position_modifier*_data[tile_rotation])] = tile_rotation
