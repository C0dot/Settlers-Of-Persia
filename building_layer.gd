# builiding_layer.gd
extends Node2D

@onready var resource_tiles: TileMapLayer = $"../ResourceTiles"
const HOUSE_TILE = preload("res://house_tile.tscn")
var instance: Node
var building_house_visibility: bool = true
var building_fortress_visibility: bool = true

const HEX_RADIUS = 34
#const TEXTURE_CENTERING_OFFSET:Vector2 = Vector2(12.8,12.8)
var positions_offsets: Array = [
	Vector2(cos(deg_to_rad(0)), sin(deg_to_rad(0))),
	Vector2(cos(deg_to_rad(60)), sin(deg_to_rad(60))),
	Vector2(cos(deg_to_rad(300)), sin(deg_to_rad(300))),
].map(func(v): return Vector2(v * HEX_RADIUS))

var houses_positions : Array[Vector2i] = []

var cells: Dictionary[Vector2i, Node] = {}

func add_house(location):
	instance = HOUSE_TILE.instantiate()
	instance.position = location
	instance.owner_id = Globals.current_player
	add_child(instance)
	cells[location] = instance
	return instance


func tile_sort(a: Vector2i, b: Vector2i) -> bool:
	if a.x == b.x:
		return a.y < b.y
	return a.x < b.x
	
	
func toggle_build_house_visibility():
	building_house_visibility = !building_house_visibility
	for child in get_children():
		if child.state == 0:
			child.visible = not child.visible
		
func _building_house_mode():
	toggle_build_house_visibility()
	await Globals.house_built
	toggle_build_house_visibility()

func toggle_build_fortress_visibility():
	building_fortress_visibility = !building_fortress_visibility
	for child in get_children():
		if child.state == 1:
			child.button_enabled = not child.button_enabled
		
func _building_fortress_mode():
	toggle_build_fortress_visibility()
	await Globals.fortress_built
	toggle_build_fortress_visibility()
	


func _ready() -> void:
	var sorted_tiles = resource_tiles.get_used_cells()
	sorted_tiles.sort_custom(tile_sort)
	
	for tile in sorted_tiles:
		var world_pos = resource_tiles.map_to_local(tile)
		for modifier in [-1,1]:
			for position_offset in positions_offsets:
				var house_pos = Vector2i(world_pos + modifier * position_offset)
				if house_pos not in houses_positions and house_pos - Vector2i(0,1) not in houses_positions and house_pos +Vector2i(0,1) not in houses_positions:
					houses_positions.append(house_pos)
		
	for house_pos in houses_positions:
		add_house(house_pos)
		
	toggle_build_house_visibility()
	toggle_build_fortress_visibility()
	Globals.build_house.connect(_building_house_mode)
	Globals.build_fortress.connect(_building_fortress_mode)

	
	
	
