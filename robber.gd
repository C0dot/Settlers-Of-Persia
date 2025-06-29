# robber.gd
extends Sprite2D

@export var target_position: Vector2 = Vector2(0,0)
@export var duration: float = 1.0

func _ready() -> void:
	Globals.move_robber.connect(_move_robber_to_position)

func _move_robber_to_position(target_position : Vector2):
	var tween = create_tween()
	tween.tween_property(self, "position", target_position, duration)
