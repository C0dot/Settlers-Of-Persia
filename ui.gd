extends CanvasLayer


func _on_road_pressed() -> void:
	if %Resources.brick > 0 and %Resources.wood > 0:
		%Resources.brick -= 1
		%Resources.wood -= 1
		Globals.build_road.emit()
