# robber_layer.gd
extends Node2D

@onready var resource_tiles: TileMapLayer = $"../ResourceTiles"
const robber = preload("res://robber.tscn")
const robber_hint_button = preload("res://robber_button_hint.tscn")
var instance: Node
var current_robber_place: Node
var robber_not_initialized : bool = true

var cells: Dictionary[Vector2i, Node] = {}

func _toggle_robber_layer_visibility() -> void:
	for cell in cells.values():
		if !cell.robber_on:
			cell.visible = !cell.visible

func _move_robber(location):
	current_robber_place.robber_on = false	
	current_robber_place = cells[Vector2i(location)]
	current_robber_place.robber_on = true	
	
# Isn't really necessary for this but i like to sort the tils anyway.
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
		var robber_hint_button_location = Vector2i(tile_map_cords + Vector2(0,-15))
		instance = robber_hint_button.instantiate()
		instance.position = robber_hint_button_location
		cells[robber_hint_button_location] = instance
		add_child(instance)
		if tile_atlas_cords.x == 0 and robber_not_initialized:
			instance = robber.instantiate()
			instance.z_index = 3
			instance.position = robber_hint_button_location
			robber_not_initialized = false
			current_robber_place = cells[robber_hint_button_location]
			current_robber_place.robber_on = true
			add_child(instance)
	
	Globals.move_robber.connect(_move_robber)
