# resources.gd
extends HBoxContainer

var wood: int = 0:
	set(value):
		$"Wood".text = "Wood\n" + str(value)
		wood = value
var brick: int = 0:
	set(value):
		$"Brick".text = "Brick\n" + str(value)
		brick = value
var sheep: int = 0:
	set(value):
		$"Sheep".text = "Sheep\n" + str(value)
		sheep = value
var grain: int = 0:
	set(value):
		$"Grain".text = "Grain\n" + str(value)
		grain = value
var ore: int = 0:
	set(value):
		$"Ore".text = "Ore\n" + str(value)
		ore = value
var dev_cards: Dictionary[String, int] = {
	"Knight": 0,
	"Road Building": 0,
	"Year Of Plenty": 0,
	"Fortnite Monopoly": 0,
	"Secret Point": 0
}
var dev_cards_count: int = 0:
	set(value):
		$"../DevCards/PlayerDevCount".text = str(value)
		dev_cards_count = value

func add_dev_card(type: String):
	dev_cards[type] += 1
	dev_cards_count += 1
	$"../DevCards".tooltip_text = "%d Knights\n%d Road Building\n%d Year Of Plenty\n%d Fortnite Monopoly\n%d Secret Point" % dev_cards.values()

func rmv_dev_card(type: String):
	dev_cards[type] -= 1
	dev_cards_count -= 1
