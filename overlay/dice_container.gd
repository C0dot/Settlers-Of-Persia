# dice_container.gd
extends HBoxContainer

var dice_textures = [
	load("res://overlay/dice-1.png"),
	load("res://overlay/dice-2.png"),
	load("res://overlay/dice-3.png"),
	load("res://overlay/dice-4.png"),
	load("res://overlay/dice-5.png"),
	load("res://overlay/dice-6.png")
]

var rng = RandomNumberGenerator.new() 
var dice1_number: int
var dice2_number: int
var value: int
var shrink_tween: Tween
var grow_tween: Tween
@onready var dice1 = $"Dice1"
@onready var dice2 = $"Dice2"


func _ready() -> void:
	rng.randomize()
	#start_bounce_loop()

func set_dice(is_enabled: bool) -> void:
	if is_enabled:
		#start_bounce_loop()
		dice1.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
		dice2.mouse_default_cursor_shape = Control.CURSOR_POINTING_HAND
	else:
		#stop_bounce_loop()
		dice1.mouse_default_cursor_shape = Control.CURSOR_ARROW
		dice2.mouse_default_cursor_shape = Control.CURSOR_ARROW
	dice1.disabled = not is_enabled
	dice2.disabled = not is_enabled

# bounce unused :(
func start_bounce_loop():
	if shrink_tween and shrink_tween.is_running():
		shrink_tween.kill()
	shrink_tween = create_tween()
	
	shrink_tween.parallel().tween_property(dice1, "scale", Vector2(0.8, 0.8), 0.75).set_trans(Tween.TransitionType.TRANS_SINE).set_ease(Tween.EaseType.EASE_IN_OUT)
	shrink_tween.parallel().tween_property(dice2, "scale", Vector2(1.0, 1.0), 0.75).set_trans(Tween.TransitionType.TRANS_SINE).set_ease(Tween.EaseType.EASE_IN_OUT)
	
	shrink_tween.connect("finished", Callable(self, "_on_shrink_finished"))

func _on_shrink_finished():
	if grow_tween and grow_tween.is_running():
		grow_tween.kill()
	grow_tween = create_tween()
	
	grow_tween.parallel().tween_property(dice1, "scale", Vector2(1.05, 1.05), 0.75).set_trans(Tween.TransitionType.TRANS_SINE).set_ease(Tween.EaseType.EASE_IN_OUT)
	grow_tween.parallel().tween_property(dice2, "scale", Vector2(1.05, 1.05), 0.75).set_trans(Tween.TransitionType.TRANS_SINE).set_ease(Tween.EaseType.EASE_IN_OUT)
	
	grow_tween.connect("finished", Callable(self, "start_bounce_loop"))

func stop_bounce_loop():
	if shrink_tween and shrink_tween.is_running():
		shrink_tween.kill()
	if grow_tween and grow_tween.is_running():
		grow_tween.kill()
	dice1.scale = Vector2(1, 1)
	dice2.scale = Vector2(1, 1)
		 

func roll_dice() -> void:
	dice1_number = rng.randi_range(0, 5)
	dice2_number = rng.randi_range(0, 5)
	value = dice1_number + dice2_number + 2
	
	$DiceRollSfx.play()
	dice1.texture_normal = dice_textures[dice1_number]
	dice2.texture_normal = dice_textures[dice2_number]
	set_dice(false)
