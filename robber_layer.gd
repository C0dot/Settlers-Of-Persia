# robber_layer.gd
extends Node2D


@onready var resource_tiles: TileMapLayer = $"../ResourceTiles"
const POSITION_OFFSET: Vector2 = Vector2(0,-20)
const robber = preload("res://robber.tscn")
const robber_hint_button = preload("res://robber_button_hint.tscn")
var instance: Node
var current_robber_place: Node
var robber_not_initialized : bool = true
var robber_layer_visibility: bool = true

var cells: Dictionary[Vector2i, Node] = {}


func add_robber_hint_button(location):
	instance = robber_hint_button.instantiate()
	instance.position = location
	cells[location] = instance
	add_child(instance)
	
			
func _move_robber(location):
	current_robber_place.robber_on = false	
	current_robber_place = cells[Vector2i(location)]
	current_robber_place.robber_on = true	

func initialize_robber(location):
	instance = robber.instantiate()
	instance.z_index = 3
	instance.position = location
	robber_not_initialized = false
	current_robber_place = cells[location]
	current_robber_place.robber_on = true
	add_child(instance)
	
func tile_sort(a: Vector2i, b: Vector2i) -> bool:
	if a.x == b.x:
		return a.y < b.y
	return a.x < b.x

func _ready() -> void:
	var tiles = resource_tiles.get_used_cells()
	tiles.sort_custom(tile_sort)
	
	for tile in tiles:
		var tile_atlas_cords = resource_tiles.get_cell_atlas_coords(tile)  
		var tile_map_cords = resource_tiles.map_to_local(tile)
		var robber_hint_button_location = Vector2i(tile_map_cords + POSITION_OFFSET)
		add_robber_hint_button(robber_hint_button_location)
		if tile_atlas_cords.x == 0 and robber_not_initialized:
			initialize_robber(robber_hint_button_location)
	
	Globals.move_robber.connect(_move_robber)
