extends KinematicBody2D

onready var Demon_Animation = $Demon_Animation
onready var Demon_Fade = $Demon_FadeInOut

onready var Demon_Collision = $Demon_Colision
onready var Demon_Detection = $Collision_Area/AreaofDetection

onready var Attack_Timer = $Attack_Timer
onready var Player = $"../../Player"

var movement = Vector2()

var dying = false
var takingdamage = false

var spawning = true

var lives = 3

const DamageIndicator_Preload = preload("res://Cenes/DamageIndicator.tscn")
const XPorb_Preload = preload("res://Cenes/XP Orb.tscn")

const speed = 75

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	lives = rng.randi_range(2,3)
	
	Demon_Fade.play("Fade In")
	
	rng.randomize()
	yield(get_tree().create_timer(rng.randi_range(1.5, 3)), "timeout")
	
	Demon_Fade.stop()
	
	Demon_Animation.position = Vector2(0, 0)
	Demon_Animation.scale = Vector2(0.08, 0.08)
	
	Demon_Collision.disabled = false
	Demon_Detection.disabled = false
	
	Demon_Animation.play("Idle")
	
	spawning = false

func apply_animation():
	if (movement.x != 0 or movement.y != 0) and (position.distance_to(Player.position - Vector2(0, -15)) > 3):
			Demon_Animation.play("Walk")
			
			if movement.x > 0:
				Demon_Animation.flip_h = false
			elif movement.x < 0:
				Demon_Animation.flip_h = true
	else:
		Demon_Animation.play("Idle")

func spawn_effect(EFFECT: PackedScene, effect_position: Vector2 = global_position):
	if EFFECT:
		var effect = EFFECT.instance()
		
		rng.randomize()
		
		get_tree().current_scene.add_child(effect)
		effect.global_position = effect_position + Vector2(rng.randi_range(-30, 10), rng.randi_range(-30, 10))
		
		return effect

func hit(amountofdamage, Player):
	if not takingdamage and lives > 0:
		var indicator = spawn_effect(DamageIndicator_Preload)
		
		if indicator:
			if lives >= amountofdamage:
				indicator.label.text = str(amountofdamage)
			else:
				indicator.label.text = str(lives)
			
		if lives <= 0:
			die()
		else:
			takingdamage = true
			
			lives -= amountofdamage
			
			modulate = Color(1, 0, 0)
			
			yield(get_tree().create_timer(0.2), "timeout")
			
			modulate = Color(1, 1, 1)
			
			takingdamage = false
			
			if lives <= 0:
				die()

func die():
	dying = true
	
	Demon_Animation.play("Death")
	
	yield(get_tree().create_timer(0.2), "timeout")
	
	rng.randomize()
	for x in range(rng.randi_range(0, 3)):
		var XPorb = XPorb_Preload.instance()
		
		rng.randomize()
		XPorb.position = position + Vector2(0, 25) + Vector2(rng.randi_range(-20, 20), rng.randi_range(-20, 20))
		
		XPorb.z_index = 0
		
		get_tree().get_root().get_node("Game").add_child(XPorb)
	
	queue_free()

func _on_Collision_Area_body_entered(body):
	if body.get_name() == "Player":
		GameManager.lives -= 1
		
		Attack_Timer.start(1)
	elif body.get_name() == "Pistol_Bullet":
		queue_free()

func _on_Collision_Area_body_exited(body):
	if body.get_name() == "Player":
		Attack_Timer.stop()
	
func _on_Attack_Timer_timeout():
	GameManager.lives -= 1

func _physics_process(delta):
	print("OriginalPosition: ", position)
	if not spawning and not dying and not GameManager.finishgame:
		apply_animation()
		
		if not takingdamage:
			movement = position.direction_to(Player.position - Vector2(0, -15)) * speed
			movement = move_and_slide(movement)
		else:
			movement = position.direction_to(Player.position - Vector2(0, -15)) * (speed/3)
			movement = move_and_slide(movement)
	elif GameManager.finishgame:
		yield(get_tree().create_timer(0.2), "timeout")
		
		Demon_Animation.play("Death")
		
		yield(get_tree().create_timer(0.2), "timeout")
