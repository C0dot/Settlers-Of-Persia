extends Node2D

@onready var resource_tiles: TileMapLayer = $"../ResourceTiles"
const HOUSE_TILE = preload("res://house_tile.tscn")
var instance: Node

const HEX_RADIUS = 34
const TEXTURE_CENTERING_OFFSET:Vector2 = Vector2(12.8,12.8)
var positions_offsets: Array = [
	Vector2(cos(deg_to_rad(0)), sin(deg_to_rad(0))),
	Vector2(cos(deg_to_rad(60)), sin(deg_to_rad(60))),
	Vector2(cos(deg_to_rad(120)), sin(deg_to_rad(120))),
	Vector2(cos(deg_to_rad(180)), sin(deg_to_rad(180))),
	Vector2(cos(deg_to_rad(240)), sin(deg_to_rad(240))),
	Vector2(cos(deg_to_rad(300)), sin(deg_to_rad(300))),
].map(func(v): return Vector2(v * HEX_RADIUS))

var houses_positions : Array[Vector2i] = []

var cells: Dictionary[Vector2i, Node] = {}

func add_house(location, owner_id):
	instance = HOUSE_TILE.instantiate()
	instance.position = location
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
		print(tile)
		var world_pos = resource_tiles.map_to_local(tile)
		for position_offset in positions_offsets:
			var house_pos = Vector2i(world_pos + position_offset - TEXTURE_CENTERING_OFFSET)
			print(house_pos)
			houses_positions.append(house_pos)
	var first_position = houses_positions[0]
	
	for house_pos in houses_positions:
		add_house(house_pos,1)
				
