extends Node2D

@onready var resource_tiles: TileMapLayer = $"../ResourceTiles"
const HOUSE_TILE = preload("res://map/house_tile.tscn")
var instance: Node

var positions_offsets: Array = [
	Vector2(cos(deg_to_rad(0)), sin(deg_to_rad(0))),
	Vector2(cos(deg_to_rad(60)), sin(deg_to_rad(60))),
	Vector2(cos(deg_to_rad(300)), sin(deg_to_rad(300))),
].map(func(v): return Vector2(v * 34))

func tile_sort(a: Vector2i, b: Vector2i) -> bool:
	if a.x == b.x:
		return a.y < b.y
	return a.x < b.x

func toggle_build_house_visibility():
	for child in get_children():
		if child.state == 0:
			child.visible = not child.visible

func toggle_build_fortress_visibility():
	for child in get_children():
		if child.state == 1:
			child.set_upgrade()

func _ready() -> void:
	var sorted_tiles = resource_tiles.get_used_cells()
	sorted_tiles.sort_custom(tile_sort)

	var houses_positions : Array[Vector2i] = []

	for tile in sorted_tiles:
		var world_pos = resource_tiles.map_to_local(tile)
		for modifier in [-1,1]:
			for position_offset in positions_offsets:
				var house_pos = Vector2i(world_pos + modifier * position_offset)
				if house_pos not in houses_positions and house_pos - Vector2i(0,1) not in houses_positions and house_pos +Vector2i(0,1) not in houses_positions:
					houses_positions.append(house_pos)

	for house_pos in houses_positions:
		instance = HOUSE_TILE.instantiate()
		instance.position = house_pos
		add_child(instance)

	toggle_build_house_visibility()
	Globals.build_house_toggle.connect(toggle_build_house_visibility)
	Globals.build_fortress_toggle.connect(toggle_build_fortress_visibility)

	
	
	
