# test.gd
extends HBoxContainer

func _ready() -> void:
	print("test.gd:")
	%Log.post("Garfield 2024")
	%Log.post("Ace")
	%Log.post("Attorney")
	%Log.post("I LOVE BALATRO")
	%Log.post("[b]ELAD[/b] HAS GIVEN 5 TREES TO [b]PRIEL[/b] FOR 1 SHEEP. HAHA")
	%Log.post("Shalom Alleychem, Alley Hashalom AMEN!!!!!!!!!!!")
	%Log.post("Ze lo maspik")
	%Log.post("עברית פתאומית")
	%Log.post("This is a message.")
	%Log.post("This is a second message.")
	%Log.post("HOW DO I ADD PORTS??!?!?!?")
	$"TrackerTab/VBoxContainer/BankCounter".wood = 12
	$"TrackerTab/VBoxContainer/BankCounter".rmv_dev_card("Knight")
	$"TrackerTab/VBoxContainer/BankCounter".rmv_dev_card("Year Of Plenty")
	$"TrackerTab/VBoxContainer/BankCounter".rmv_dev_card("Fortnite Monopoly")
	$"OtherTab/HBoxContainer/ActionBar/Resources".add_dev_card("Knight")
	$"OtherTab/HBoxContainer/ActionBar/Resources".add_dev_card("Year Of Plenty")
	$"OtherTab/HBoxContainer/ActionBar/Resources".add_dev_card("Fortnite Monopoly")
	%"CurrentPlayer".set_turn_label(Globals.player_colors[2],"priel")
	# Globals.pan_toggle = true
	$"OtherTab/HBoxContainer/ActionBar/Resources".wood = 12
	$"OtherTab/HBoxContainer/ActionBar/Resources".brick = 12
	$"OtherTab/HBoxContainer/ActionBar/Resources".sheep = 12
	$"OtherTab/HBoxContainer/ActionBar/Resources".grain = 12
	$"OtherTab/HBoxContainer/ActionBar/Resources".ore = 12
	print("end of test.gd output.")
