extends Button

onready var Text = $Label

func _pressed():
	if Text.text == "Start":
		get_tree().change_scene("res://Cenes/Game.tscn")
		
		GameManager.in_game = true
	elif Text.text == "Options":
		pass
	elif Text.text == "Conquest":
		pass
	elif Text.text == "Quit":
		get_tree().quit()

func _process(delta):
	if is_hovered():
		Text.add_color_override("font_color_shadow", Color(0.776471, 0.454902, 0.035294))
	else:
		Text.add_color_override("font_color_shadow", Color(0, 0.3, 0.933333))
