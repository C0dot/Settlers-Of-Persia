extends MarginContainer

const MESSAGE = preload("res://message.tscn")

func post(message: String):
	var instance = MESSAGE.instantiate()
	instance.text = "[center]"+message+"[/center]"
	$ScrollContainer/MessageBoard.add_child(instance)
	await get_tree().process_frame
	$ScrollContainer.scroll_vertical = int($ScrollContainer.get_v_scroll_bar().max_value)

func _on_mouse_entered() -> void:
	Globals.mouse_on_log = true

func _on_mouse_exited() -> void:
	Globals.mouse_on_log = false
