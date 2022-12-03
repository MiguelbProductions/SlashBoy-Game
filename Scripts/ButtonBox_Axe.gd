extends TextureButton

onready var Tools = $"../../../Tools"

const Axe_Preload = preload("res://Cenes/Axe.tscn")

func _pressed():
	if GameManager.level_axe < 6:
		GameManager.level_axe += 1
		
		var Axe = Axe_Preload.instance()
			
		if GameManager.level_axe == 1:
			Axe.degrees = 0
			
			Axe.name = "Axe_1"
		elif GameManager.level_axe == 2:
			Tools.get_node("Axe_1").degrees = 0
			
			Axe.degrees = 250
			
			Axe.name = "Axe_2"
		elif GameManager.level_axe == 3:
			Tools.get_node("Axe_1").degrees = 0
			Tools.get_node("Axe_2").degrees = 200
			
			Axe.degrees = 400
			
			Axe.name = "Axe_3"
			
			Tools.get_node("Axe_1").damage = 2.5
			Tools.get_node("Axe_2").damage = 2.5
			Axe.damage = 2.5
		elif GameManager.level_axe == 4:
			Tools.get_node("Axe_1").degrees = 0
			Tools.get_node("Axe_2").degrees = 150
			Tools.get_node("Axe_3").degrees = 300
			
			Axe.degrees = 450
			
			Axe.name = "Axe_4"
			Axe.damage = 2.5
		elif GameManager.level_axe == 5:
			Tools.get_node("Axe_1").degrees = 0
			Tools.get_node("Axe_2").degrees = 120
			Tools.get_node("Axe_3").degrees = 240
			Tools.get_node("Axe_4").degrees = 360
			
			Axe.degrees = 480
			
			Axe.name = "Axe_5"
			Axe.damage = 2.5
		elif GameManager.level_axe == 6:
			Tools.get_node("Axe_1").degrees = 0
			Tools.get_node("Axe_2").degrees = 25
			Tools.get_node("Axe_3").degrees = 50
			Tools.get_node("Axe_4").degrees = 75
			Tools.get_node("Axe_5").degrees = 100
			
			Axe.degrees = 125
			
			Axe.name = "Axe_6"
			Tools.get_node("Axe_1").damage = 3.5
			Tools.get_node("Axe_2").damage = 3.5
			Tools.get_node("Axe_3").damage = 3.5
			Tools.get_node("Axe_4").damage = 3.5
			Tools.get_node("Axe_5").damage = 3.5
			Axe.damage = 3.5
		
		Tools.add_child(Axe)
		
		$"../../".visible = false
		GameManager.stopgame = false
		get_tree().paused = false

func _process(delta):
	if GameManager.level_axe == 0 and self_modulate != Color(0.647059, 0.619608, 0.619608):
		self_modulate = Color(0.647059, 0.619608, 0.619608)
	elif GameManager.level_axe == 1 and self_modulate != Color(0.039216, 0.639216, 0.07451):
		self_modulate = Color(0.039216, 0.639216, 0.07451)
	elif GameManager.level_axe == 2 and self_modulate != Color(0.05098, 0.329412, 0.862745):
		self_modulate = Color(0.05098, 0.329412, 0.862745)
	elif GameManager.level_axe == 3 and self_modulate != Color(0.443137, 0.188235, 0.866667):
		self_modulate = Color(0.443137, 0.188235, 0.866667)
	elif GameManager.level_axe == 4 and self_modulate != Color(1, 0.85098, 0.27451):
		self_modulate = Color(1, 0.85098, 0.27451)
	elif GameManager.level_axe == 5 and self_modulate != Color(0.745098, 0.160784, 0.160784):
		self_modulate = Color(0.745098, 0.160784, 0.160784)
