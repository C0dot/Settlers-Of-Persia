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

func update_turn_label() -> void:
	%CurrentPlayer.text = "[center][color=" + Globals.player_colors[Globals.current_player].to_html() + "][b]" + $"Control/TrackerTab/VBoxContainer".get_children()[Globals.current_player+2].username + "'s Turn[/b][/color][/center]"

func _on_end_turn_pressed() -> void:
	Globals.current_player += 1
	%DiceContainer.set_dice(true)


func _ready() -> void:
	## Testing functions.
	%Log.post("Garfield 2024")
	%Log.post("Ace")
	%Log.post("Attorney")
	%Log.post("I LOVE BALATRO")
	%Log.post("[b]ELAD[/b] HAS GIVEN 5 TREES TO [b]PRIEL[/b] FOR 1 SHEEP. HAHA")
	%Log.post("Shalom Alleychem, Alley Hashalom AMEN!!!!!!!!!!!")
	%Log.post("Ze lo maspik")
	%Log.post("עברית פתאומית")
	%Log.post("This is a message.")
	%Log.post("This is a second message.")
	%Log.post("HOW DO I ADD PORTS??!?!?!?")
	%BankCounter.wood = 12
	%BankCounter.rmv_dev_card("Knight")
	%BankCounter.rmv_dev_card("Year Of Plenty")
	%BankCounter.rmv_dev_card("Fortnite Monopoly")
	%Resources.add_dev_card("Knight")
	%Resources.add_dev_card("Year Of Plenty")
	%Resources.add_dev_card("Fortnite Monopoly")
	%Resources.wood = 12
	%Resources.brick = 12
	%Resources.sheep = 12
	%Resources.grain = 12
	%Resources.ore = 12
	# Globals.pan_toggle = true
	
	## actual ui.gd code
	await Globals.setup_complete
	update_turn_label()
	Globals.turn_passed.connect(update_turn_label)
