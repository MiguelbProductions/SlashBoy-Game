extends KinematicBody2D

onready var DoubleAxe_Animation = $DoubleAxe_Animation

export var degrees = 0
var radius = 150
var speed = 2

var damage = 2

var upgrading = false

func _on_HitArea_body_entered(body):
	if body.is_in_group("Enemie"):
		body.hit(damage, $"../")

func _process(delta):
	if not GameManager.stopgame:
		if GameManager.level_axe == 1:
			if DoubleAxe_Animation.animation != "Tier1":
				DoubleAxe_Animation.play("Tier1")
			
			rotation_degrees -= 8
			
			degrees += delta
			
			position = Vector2(sin(degrees * speed) * radius, cos(degrees * speed) * radius) + Vector2(0, 54)
		elif GameManager.level_axe == 2:
			if DoubleAxe_Animation.animation != "Tier1":
				DoubleAxe_Animation.play("Tier1")
				
			rotation_degrees -= 12
			
			degrees += delta
			
			position = Vector2(sin(degrees * speed) * radius, cos(degrees * speed) * radius) + Vector2(0, 54)
		elif GameManager.level_axe == 3:
			if DoubleAxe_Animation.animation != "Tier2":
				DoubleAxe_Animation.play("Tier2")
				
			rotation_degrees -= 16
			
			degrees += delta
			
			position = Vector2(sin(degrees * speed) * radius, cos(degrees * speed) * radius) + Vector2(0, 54)
		elif GameManager.level_axe == 4:
			if DoubleAxe_Animation.animation != "Tier3":
				DoubleAxe_Animation.play("Tier3")
			
			rotation_degrees -= 20
			
			degrees += delta
			
			position = Vector2(sin(degrees * speed) * radius, cos(degrees * speed) * radius) + Vector2(0, 54)
		elif GameManager.level_axe == 5:
			if DoubleAxe_Animation.animation != "Tier4":
				DoubleAxe_Animation.play("Tier4")
			
			rotation_degrees -= 24
			
			degrees += delta
			
			position = Vector2(sin(degrees * speed) * radius, cos(degrees * speed) * radius) + Vector2(0, 54)
		elif GameManager.level_axe == 6:
			if DoubleAxe_Animation.animation != "Tier5":
				DoubleAxe_Animation.play("Tier5")
			
			rotation_degrees -= 28
			
			degrees += delta
			
			position = Vector2(sin(degrees * speed * 4) * radius, cos(degrees * speed * 4) * radius) + Vector2(0, 54)


#1 - 0
#2 - 0, 250
#3 - 0, 175, 300
#4 - 0, 150, 300, 450
#5 - 0, 120, 240, 360, 480
#6 - 0, 100, 200, 300, 400, 500
