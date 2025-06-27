extends Node2D

var fortress = preload("res://city.png")
var house = preload("res://house.png")

@onready var sprite: Sprite2D = $Sprite2D
@onready var area: Area2D = $Area2D
@onready var ButtonHint: Sprite2D = $ButtonHint

# 0 - preactive button | 1 - house | 2 - fortress
var state : int  = 0

var _owner_id: int = 0
var owner_id: int:
	get: return _owner_id
	set(value):
		_owner_id = value

var _button_enabled: bool = true
var button_enabled: bool:
	get: return _button_enabled
	set(value):
		_button_enabled = value
		ButtonHint.visible = value
		if area:
			area.input_pickable = value

func switch_to_fortress() -> void:
	if sprite:
		sprite.texture = fortress

func switch_to_house() -> void:
	if sprite:
		sprite.texture = house
		sprite.modulate = Globals.player_colors[owner_id % 8]  
		sprite.scale = Vector2(0.1, 0.1)


func _ready():
	sprite.scale = Vector2(0.2, 0.2)
	area.connect("input_event", Callable(self, "_on_input_event"))

func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.get_button_mask() == MOUSE_BUTTON_LEFT:
		#print("Clicked on house with owner:", owner_id)
		if state == 0:
			switch_to_house()
			state = 1
			Globals.house_built.emit()
			button_enabled = false
		else: if state == 1:
				switch_to_fortress()
				state = 2
				ButtonHint.visible = false
				Globals.fortress_built.emit()
