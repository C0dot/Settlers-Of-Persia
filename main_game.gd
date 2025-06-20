extends Node2D

const PLAYER_COUNTER = preload("res://player_counter.tscn")
var pan_origin: Vector2
var instance: Node

func _ready() -> void:
	for player in Globals.player_count:
		instance = PLAYER_COUNTER.instantiate()
		instance.player_number = player
		$CanvasLayer/Control/TrackerTab/VBoxContainer.add_child(instance)

func _process(delta: float) -> void:
	if not Globals.mouse_on_log:
		if Input.is_action_just_pressed("zoom_in") and $Map.scale.x < 2:
			$Map.scale*=1.1
		if Input.is_action_just_pressed("zoom_out") and $Map.scale.x > 0.5:
			$Map.scale/=1.1
	if Input.is_action_just_pressed("pan"):
		pan_origin = $Map.position - Globals.pan_val*get_global_mouse_position()
	if Input.is_action_pressed("pan"):
		$Map.position = pan_origin + Globals.pan_val*get_global_mouse_position()
	$Sprite2D.scale = $Map.scale/8
	$Sprite2D.position = $Map.position + Vector2(493.0, 318.0)
