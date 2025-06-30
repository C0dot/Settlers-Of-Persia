extends CanvasLayer

var active_roads := 0
var active_houses := 0
var active_fortresses := 0


func _on_road_pressed() -> void:
	if %Resources.brick > 0 and %Resources.wood > 0:
		active_roads += 1
		var my = active_roads
		Globals.build_road_toggle.emit()
		await Globals.build_road_toggle
		if my == active_roads:
			%Resources.brick -= 1
			%Resources.wood -= 1
			

func _on_house_pressed() -> void:
	if %Resources.brick > 0 and %Resources.wood > 0 and  %Resources.sheep > 0 and %Resources.grain > 0:
		active_houses += 1
		var my = active_houses
		Globals.build_house_toggle.emit()
		await Globals.build_house_toggle
		if my == active_houses:
			%Resources.brick -= 1
			%Resources.wood -= 1
			%Resources.sheep -= 1
			%Resources.grain -= 1
			
func _on_fortress_pressed() -> void:
	if %Resources.ore > 2 and %Resources.grain > 1:
		active_fortresses += 1
		var my = active_fortresses
		Globals.build_fortress_toggle.emit()
		await Globals.build_fortress_toggle
		if my == active_fortresses:
			%Resources.grain -= 2
			%Resources.ore -= 3
