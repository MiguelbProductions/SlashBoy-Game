extends KinematicBody2D

onready var Enemie_Container = $"../Game/Object_Overlay"
onready var Game = $"../Game"

var movement = Vector2()
var speed = 200

var attacking = false

var Enemy_Focused
var Enemy_Name = ""

func _on_DetectCollision_body_entered(body):
	print(body)
	print(body.is_in_group("Enemie"))
	if not attacking and body.is_in_group("Enemie"):
		attacking = true
		
		Enemy_Name = body.get_name()
		Enemy_Focused = body

func _on_DetectCollision_body_exited(body):
	if body.get_name() == Enemy_Name:
		attacking = false

func _process(delta):
	if attacking:
		if position.distance_to(Enemy_Focused.position - Vector2(0, -50)) > 30:
			movement = position.direction_to(Enemy_Focused.position - Vector2(0, -50)) * speed
			movement = move_and_slide(movement)



