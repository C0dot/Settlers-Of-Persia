extends Sprite2D

const ROAD = preload("res://road.png")

var active := false

var owner_id: int = 8:
	set(value):
		self_modulate = Globals.player_colors[value % 8]
		owner_id = value

func _on_button_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouse and event.get_button_mask() == MOUSE_BUTTON_LEFT and event.is_pressed():
		texture = ROAD
		owner_id = Globals.current_player
		active = true
		Globals.road_built.emit()
