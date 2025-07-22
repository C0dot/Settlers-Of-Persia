# bank_counter.gd
extends HBoxContainer

var wood: int = 19:
	set(value):
		$Wood.text = "Wood\n" + str(value)
		wood = value
var brick: int = 19:
	set(value):
		$Brick.text = "Brick\n" + str(value)
		brick = value
var sheep: int = 19:
	set(value):
		$Sheep.text = "Sheep\n" + str(value)
		sheep = value
var grain: int = 19:
	set(value):
		$Grain.text = "Grain\n" + str(value)
		grain = value
var ore: int = 19:
	set(value):
		$Ore.text = "Ore\n" + str(value)
		ore = value
var dev_cards: Dictionary[String, int] = {
	"Knight": 14,
	"Road Building": 2,
	"Year Of Plenty": 2,
	"Fortnite Monopoly": 2,
	"Secret Point": 5
}
var dev_cards_count: int = 25:
	set(value):
		$DevCards.text = "Development\nCards\n" + str(value)
		dev_cards_count = value

func add_dev_card(type: String):
	dev_cards[type] += 1
	dev_cards_count += 1

func rmv_dev_card(type: String):
	dev_cards[type] -= 1
	dev_cards_count -= 1
