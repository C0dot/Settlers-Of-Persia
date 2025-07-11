# robber_button_hint.gd
extends Sprite2D

var robber_on: bool = false:
	set(value):
		robber_on = value
		visible = !value 
		
func _on_input_event(_viewport, event, _shape_idx):
	if event is InputEventMouseButton and event.pressed and event.get_button_mask() == MOUSE_BUTTON_LEFT:
		Globals.move_robber.emit(position)
