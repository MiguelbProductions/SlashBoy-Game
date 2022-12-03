extends KinematicBody2D

onready var Shuriken_Animation = $Shuriken_Animation
onready var AreaofDetection = $HitBox/AreaofDetection

onready var Enemie_List = $"../../../Object_Overlay"

var movement = Vector2()
var speed = 100

var focused_enemie = null

var attacking = false

var damage = 1.5

func _on_HitBox_body_entered(body):
	if body.is_in_group("Enemie"):
		body.hit(damage, $"../")
		
		AreaofDetection.disabled = true
		
		focused_enemie = null
		attacking = false

func go_to(Enemie):
	attacking = true
	visible = true
	
	focused_enemie = Enemie

func _process(delta):
	if attacking:
		visible = true
		movement = $"../".position.direction_to(focused_enemie.position) * speed
		print("Movement: ", movement)
		movement = move_and_slide(movement)
	else:
		if visible: visible = false
