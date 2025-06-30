extends RichTextLabel


func set_turn_label(color: Color, username: String) -> void:
	var hex = color.to_html()  
	text = "[center][color=" + hex + "][b]" + username + "'s Turn[/b][/color][/center]"
