# dice_container.gd
extends HBoxContainer

var dice_textures = [
	load("res://dice-1.png"),
	load("res://dice-2.png"),
	load("res://dice-3.png"),
	load("res://dice-4.png"),
	load("res://dice-5.png"),
	load("res://dice-6.png")
]

var rng = RandomNumberGenerator.new()

var value: int 
var dice1_number: int
var dice2_number: int

func roll_dice() -> void:
	rng.randomize()
	dice1_number = rng.randi_range(1, 6)
	dice2_number = rng.randi_range(1, 6)
	value = dice1_number + dice2_number
	
	print("dice1: " + str(dice1_number) + " | dice2: " + str(dice2_number) + "\ncombined: " + str(value))
	
	$DiceRollSfx.play()
	$Dice1.texture_normal = dice_textures[dice1_number - 1]
	$Dice2.texture_normal = dice_textures[dice2_number - 1]


func toggle_dice() -> void:
	$Dice1.disabled = not $Dice1.disabled
	$Dice2.disabled = not $Dice2.disabled
