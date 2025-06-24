extends Sprite2D

var owner_id: int = 0:
	set(value):
		self_modulate = Globals.player_colors[value % 8]
		owner_id = value
