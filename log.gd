extends MarginContainer

const MESSAGE = preload("res://message.tscn")

@onready var MessageScrollContainer: ScrollContainer = $"ScrollContainer"
@onready var message_board: VBoxContainer = %MessageBoard


func post(message: String):
	var instance = MESSAGE.instantiate()
	instance.text = "[center]"+message+"[/center]"
	%MessageBoard.add_child(instance)
	await get_tree().process_frame
	MessageScrollContainer.scroll_vertical = int(MessageScrollContainer.get_v_scroll_bar().max_value)


func _on_mouse_entered() -> void:
	Globals.mouse_on_log = true

func _on_mouse_exited() -> void:
	Globals.mouse_on_log = false
