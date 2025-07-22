extends Node2D

const PLAYER_COUNTER = preload("res://overlay/player_counter.tscn")
var pan_origin: Vector2
var instance: Node

func _ready() -> void:
	# example array below will be recieved from the lobby scene.
	var names: Array[String] = ["Priel", "Elad", "Emil", "Ariel", "Tal", "Liroy", "Sagie", "Loch Ness Monster"]
	for player in Globals.player_count:
		instance = PLAYER_COUNTER.instantiate()
		instance.player_number = player
		instance.username = names.pop_front()
		$CanvasLayer/Control/TrackerTab/VBoxContainer.add_child(instance)
	Globals.setup_complete.emit()

func _process(_delta: float) -> void:
	if not Globals.mouse_on_log:
		if Input.is_action_just_pressed("zoom_in") and $Map.scale.x < 2:
			$Map.scale*=1.1
		if Input.is_action_just_pressed("zoom_out") and $Map.scale.x > 0.5:
			$Map.scale/=1.1
	if Input.is_action_just_pressed("pan"):
		pan_origin = $Map.position - Globals.pan_val*get_global_mouse_position()
	if Input.is_action_pressed("pan"):
		$Map.position = pan_origin + Globals.pan_val*get_global_mouse_position()
