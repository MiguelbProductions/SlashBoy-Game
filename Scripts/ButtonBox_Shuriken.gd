extends TextureButton

onready var Player = $"../../../"

onready var Tools = $"../../../Tools"

var Shuriken_Preload = preload("res://Cenes/Shuriken.tscn")

func _pressed():
	if GameManager.level_shuriken < 5:
		GameManager.level_shuriken += 1
		
		var Shuriken = Shuriken_Preload.instance()
			
		if GameManager.level_shuriken == 1:
			Shuriken.name = "Shuriken_1"
		elif GameManager.level_shuriken == 2:
			Shuriken.name = "Shuriken_2"
		elif GameManager.level_shuriken == 3:
			Shuriken.name = "Shuriken_3"
		elif GameManager.level_shuriken == 4:
			Shuriken.name = "Shuriken_4"
		elif GameManager.level_shuriken == 5:
			$"../../../Tools/Shuriken_1".scale = Vector2(1.5, 1.5)
			$"../../../Tools/Shuriken_2".scale = Vector2(1.5, 1.5)
			$"../../../Tools/Shuriken_3".scale = Vector2(1.5, 1.5)
			$"../../../Tools/Shuriken_4".scale = Vector2(1.5, 1.5)
		
		Shuriken.position = Player.position
		get_tree().get_root().add_child(Shuriken)
	
	$"../../".visible = false
	GameManager.stopgame = false
	get_tree().paused = false

func _process(delta):
	if GameManager.level_shuriken == 0 and self_modulate != Color(0.647059, 0.619608, 0.619608):
		self_modulate = Color(0.647059, 0.619608, 0.619608)
	elif GameManager.level_shuriken == 1 and self_modulate != Color(0.039216, 0.639216, 0.07451):
		self_modulate = Color(0.039216, 0.639216, 0.07451)
	elif GameManager.level_shuriken == 2 and self_modulate != Color(0.05098, 0.329412, 0.862745):
		self_modulate = Color(0.05098, 0.329412, 0.862745)
	elif GameManager.level_shuriken == 3 and self_modulate != Color(0.443137, 0.188235, 0.866667):
		self_modulate = Color(0.443137, 0.188235, 0.866667)
	elif GameManager.level_shuriken == 4 and self_modulate != Color(0.745098, 0.160784, 0.160784):
		self_modulate = Color(0.745098, 0.160784, 0.160784)
