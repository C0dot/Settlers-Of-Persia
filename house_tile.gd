extends Node2D

var fortress = preload("res://city.png")
var house = preload("res://house.png")

@onready var sprite: Sprite2D = $Sprite2D
@onready var area: Area2D = $Area2D


var do_switch_to_house: bool = true

var owner_id: int:
	get: return owner_id
	set(value):
		owner_id = value
		if sprite:
			sprite.modulate = Globals.player_colors[value % 8]  

func switch_to_fortress() -> void:
	if sprite:
		sprite.texture = fortress

func switch_to_house() -> void:
	if sprite:
		sprite.texture = house
		sprite.scale = Vector2(0.1, 0.1)


func toggle_button(_toggle: bool) -> void:
	if area:
		area.input_pickable = _toggle

func _ready():
	sprite.scale = Vector2(0.4, 0.4)
	area.connect("input_event", Callable(self, "_on_input_event"))
	sprite.modulate = Globals.player_colors[owner_id % 8]

func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.get_button_mask() == MOUSE_BUTTON_LEFT:
		print("Clicked on house with owner:", owner_id)
		if do_switch_to_house:
			switch_to_house()
			do_switch_to_house = false
			#toggle_button(false)
		else:
			switch_to_fortress()
