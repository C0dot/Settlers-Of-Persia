extends HBoxContainer

var username: String: # set on initialization
	get:
		return %Username.text
	set(value):
		%Username.text = value
var player_number: int: # set on initialization
	set(value):
		player_color = Globals.player_colors[value]
		player_number = value
var current_box: StyleBoxFlat = StyleBoxFlat.new()
var player_color: Color: # based on player_number
	set(value):
		current_box.bg_color = value
		for child in get_children():
			if child is VBoxContainer:
				child.get_child(0).set("theme_override_styles/normal", current_box)
				child.get_child(1).set("theme_override_styles/normal", current_box)
			else:
				child.set("theme_override_styles/normal", current_box)
var points: int = 2:
	set(value):
		%Points.text = "Points: " + str(value)
		points = value
var number_of_cards: int = 0:
	set(value):
		%CardCounter.text = str(value) + " Cards"
		number_of_cards = value
var number_of_dev_cards: int = 0:
	set(value):
		%DevCardCounter.text = str(value) + " Dev Cards"
		number_of_dev_cards = value
var number_of_knights: int = 0:
	set(value):
		%ArmyCounter.text = str(value) + " Knights"
		number_of_knights = value
var number_of_roads: int = 1:
	set(value):
		%RoadCounter.text = str(value) + " Roads"
		number_of_roads = value
var has_longest_road: bool = false
var has_largest_army: bool = false
