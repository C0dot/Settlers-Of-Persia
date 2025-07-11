extends Sprite2D

var fortress = preload("res://map/city.png")
var house = preload("res://map/house.png")

# 0 - preactive button | 1 - house | 2 - fortress > can be used as point worth.
var state: int  = 0

var owner_id: int = 8:
	set(value):
		self_modulate = Globals.player_colors[value % 8]
		owner_id = value

func set_upgrade(value: bool = not $ButtonHint.visible):
	$ButtonHint.visible = value
	$Area2D.input_pickable = value

func _on_area_2d_input_event(_viewport: Node, event: InputEvent, _shape_idx: int) -> void:
	if event is InputEventMouseButton and event.pressed and event.get_button_mask() == MOUSE_BUTTON_LEFT:
		if state == 0:
			texture = house
			scale /= 3
			$Area2D.scale *= 3
			owner_id = Globals.current_player
			state = 1
			Globals.build_house_toggle.emit()
			set_upgrade(false)
		elif state == 1:
				texture = fortress
				state = 2
				$ButtonHint.visible = false
				Globals.build_fortress_toggle.emit()
