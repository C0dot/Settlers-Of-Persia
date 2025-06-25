extends TextureButton

var fortress = preload("res://city.png")

var owner_id: int = 0:
	set(value):
		self_modulate = Globals.player_colors[value % 8]
		owner_id = value

func switch_to_fortress() -> void:
	texture_normal =  fortress

func toggle_button(_toggle : bool) -> void:
	disabled = !_toggle
