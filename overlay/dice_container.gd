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

func _ready() -> void:
	rng.randomize()

func set_dice(is_enabled: bool) -> void:
	$Dice1.disabled = not is_enabled
	$Dice2.disabled = not is_enabled

func roll_dice() -> void:
	dice1_number = rng.randi_range(0, 5)
	dice2_number = rng.randi_range(0, 5)
	value = dice1_number + dice2_number + 2
	
	$DiceRollSfx.play()
	$Dice1.texture_normal = dice_textures[dice1_number]
	$Dice2.texture_normal = dice_textures[dice2_number]
	set_dice(false)
