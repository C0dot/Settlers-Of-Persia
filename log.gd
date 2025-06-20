extends MarginContainer

const MESSAGE = preload("res://message.tscn")

func post(message: String):
	var instance = MESSAGE.instantiate()
	instance.text = "[center]"+message+"[/center]"
	%MessageBoard.add_child(instance)


func _on_mouse_entered() -> void:
	Globals.mouse_on_log = true

func _on_mouse_exited() -> void:
	Globals.mouse_on_log = false
