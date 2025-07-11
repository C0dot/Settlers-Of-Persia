#main_game.gd
extends Node2D

<<<<<<< HEAD
const PLAYER_COUNTER = preload("res://player_counter.tscn")
@export var zoomSpeed: float = 10.0
var ZoomTarget: Vector2
=======
const PLAYER_COUNTER = preload("res://overlay/player_counter.tscn")
>>>>>>> master
var pan_origin: Vector2
var instance: Node

func _ready() -> void:
<<<<<<< HEAD
	# example array, array below will be recieved from the lobby scene.
=======
	# example array below will be recieved from the lobby scene.
>>>>>>> master
	var names: Array[String] = ["Priel", "Elad", "Emil", "Ariel", "Tal", "Liroy", "Sagie", "Loch Ness Monster"]
	for player in Globals.player_count:
		instance = PLAYER_COUNTER.instantiate()
		instance.player_number = player
		instance.username = names.pop_front()
		$CanvasLayer/Control/TrackerTab/VBoxContainer.add_child(instance)
	Globals.setup_complete.emit()
<<<<<<< HEAD

	ZoomTarget = $Map.scale
=======
>>>>>>> master

func _process(_delta: float) -> void:
	if not Globals.mouse_on_log:
		var mouse_pos = get_viewport().get_mouse_position()
		var map = $Map
		var map_pos_before = map.to_local(mouse_pos)
		if Input.is_action_just_pressed("zoom_in") and map.scale.x < 2.0:
			ZoomTarget *= 1.1
		if Input.is_action_just_pressed("zoom_out") and map.scale.x > 0.5:
			ZoomTarget /= 1.1
		map.scale = map.scale.slerp(ZoomTarget, zoomSpeed * delta)
		var map_pos_after = map.to_local(mouse_pos)
		map.position += (map_pos_after - map_pos_before) * map.scale
	if Input.is_action_just_pressed("pan"):
		pan_origin = $Map.position - Globals.pan_val * get_viewport().get_mouse_position()
	if Input.is_action_pressed("pan"):
		$Map.position = pan_origin + Globals.pan_val * get_viewport().get_mouse_position()
