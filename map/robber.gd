# robber.gd
extends Sprite2D

@export var speed: float = 250.0 # Pixels per seconds


func _ready() -> void:
	Globals.move_robber.connect(_move_robber_to_position)

func _move_robber_to_position(target_position : Vector2):
	var distance = sqrt(pow(target_position.x - position.x,2) + pow(target_position.y - position.y,2))
	var duration = distance / speed
	var tween = create_tween()
	tween.tween_property(self, "position", target_position, duration)
	if Globals.play_robber_sfx:
		$"RobberPlacingSfx".play()
	
