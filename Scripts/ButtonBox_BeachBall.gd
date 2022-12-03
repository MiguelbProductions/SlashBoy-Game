extends TextureButton

onready var Player = $"../../../"

onready var Tools = $"../../../Tools"

var BeachBall_Red = preload("res://Assets/Weapeons/Melee Weapons/BeachBall/BeachBall_Red.png")
var BeachBall_Blue = preload("res://Assets/Weapeons/Melee Weapons/BeachBall/BeachBall_Blue.png")
var BeachBall_Yellow = preload("res://Assets/Weapeons/Melee Weapons/BeachBall/BeachBall_Yellow.png")
var BeachBall_Green = preload("res://Assets/Weapeons/Melee Weapons/BeachBall/BeachBall_Green.png")

const BeachBall_Preload = preload("res://Cenes/BeachBall.tscn")

func _pressed():
	if GameManager.level_beachball < 5:
		GameManager.level_beachball += 1
		
		var BeachBall = BeachBall_Preload.instance()
			
		if GameManager.level_beachball == 1:
			BeachBall.direction = Vector2(1, -1)
			BeachBall.original_direction = Vector2(1, -1)
			
			BeachBall.get_node("BeachBall_Animation").set_texture(BeachBall_Red)
			BeachBall.get_node("BeachBall_Animation").scale = Vector2(0.02, 0.02)
			
			BeachBall.name = "BeachBall_1"
		elif GameManager.level_beachball == 2:
			BeachBall.direction = Vector2(-1, 1)
			BeachBall.original_direction = Vector2(-1, 1)
			
			BeachBall.get_node("BeachBall_Animation").set_texture(BeachBall_Blue)
			BeachBall.get_node("BeachBall_Animation").scale = Vector2(0.02, 0.02)
			
			BeachBall.name = "BeachBall_2"
		elif GameManager.level_beachball == 3:
			BeachBall.direction = Vector2(-1, -1)
			BeachBall.original_direction = Vector2(-1, -1)
			
			BeachBall.get_node("BeachBall_Animation").set_texture(BeachBall_Yellow)
			BeachBall.get_node("BeachBall_Animation").scale = Vector2(0.02, 0.02)
			
			BeachBall.name = "BeachBall_3"
		elif GameManager.level_beachball == 4:
			BeachBall.direction = Vector2(1, 1)
			BeachBall.original_direction = Vector2(1, 1)
			
			BeachBall.get_node("BeachBall_Animation").set_texture(BeachBall_Green)
			BeachBall.get_node("BeachBall_Animation").scale = Vector2(0.02, 0.02)
			
			BeachBall.name = "BeachBall_4"
		elif GameManager.level_beachball == 5:
			$"/root/BeachBall_1".scale = Vector2(2, 2)
			$"/root/BeachBall_2".scale = Vector2(2, 2)
			$"/root/BeachBall_3".scale = Vector2(2, 2)
			$"/root/BeachBall_4".scale = Vector2(2, 2)
			
		if GameManager.level_beachball < 5:
			BeachBall.position = Player.position
			get_tree().get_root().add_child(BeachBall)
			
		$"../../".visible = false
		GameManager.stopgame = false
		get_tree().paused = false
	
func _process(delta):
	if GameManager.level_beachball == 0 and self_modulate != Color(0.647059, 0.619608, 0.619608):
		self_modulate = Color(0.647059, 0.619608, 0.619608)
	elif GameManager.level_beachball == 1 and self_modulate != Color(0.039216, 0.639216, 0.07451):
		self_modulate = Color(0.039216, 0.639216, 0.07451)
	elif GameManager.level_beachball == 2 and self_modulate != Color(0.05098, 0.329412, 0.862745):
		self_modulate = Color(0.05098, 0.329412, 0.862745)
	elif GameManager.level_beachball == 3 and self_modulate != Color(0.443137, 0.188235, 0.866667):
		self_modulate = Color(0.443137, 0.188235, 0.866667)
	elif GameManager.level_beachball == 4 and self_modulate != Color(0.745098, 0.160784, 0.160784):
		self_modulate = Color(0.745098, 0.160784, 0.160784)
