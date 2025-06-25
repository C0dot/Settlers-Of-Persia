extends CanvasLayer

var active := 0

func _on_road_pressed() -> void:
	if %Resources.brick > 0 and %Resources.wood > 0:
		active += 1
		var my = active
		Globals.build_road.emit()
		await Globals.built
		if my == active:
			%Resources.brick -= 1
			%Resources.wood -= 1
