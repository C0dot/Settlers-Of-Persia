extends Sprite2D

var owner_id: int = 0:
	set(value):
		self_modulate = Globals.player_colors[value]
		owner_id = value
