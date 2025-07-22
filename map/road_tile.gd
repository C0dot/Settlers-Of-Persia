extends Sprite2D

const ROAD = preload("res://map/road.png")

var owner_id: int = 8:
	set(value):
		self_modulate = Globals.player_colors[value % 8]
		owner_id = value

var active: bool: 
	get: return -1 < owner_id and owner_id < 8

func _on_button_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouse and event.get_button_mask() == MOUSE_BUTTON_LEFT and event.is_pressed():
		texture = ROAD
		owner_id = Globals.current_player
		Globals.build_road_toggle.emit()
		$Button.input_pickable = false
