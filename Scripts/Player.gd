extends KinematicBody2D

onready var Player_Animation = $Player_Animation

onready var HealthBar = $PlayerBar/HealthBar/ProgressBar
onready var XPBar = $PlayerBar/XPBar/ProgressBar
onready var XPLeveL = $PlayerBar/LVL

onready var HitArea = $HitArea/AreaofDetection

onready var Timer_Label = $Timer/Timer_Label

onready var Tools = $Tools

var velocity = Vector2()

var attacking = false
var dying = false

const speed = 200

func get_input():
	velocity.x = Input.get_axis("Left" ,"Right") * speed
	velocity.y = Input.get_axis("Up" ,"Down") * speed

func apply_animation():
	if velocity.x != 0 or velocity.y != 0:
		Player_Animation.play("Walk")
		
		if velocity.x > 0:
			Player_Animation.flip_h = false
			
			HitArea.position = Vector2(29, 50.5)
		elif velocity.x < 0:
			Player_Animation.flip_h = true
			
			HitArea.position = Vector2(-29, 50.5)
	else:
		Player_Animation.play("Idle")

func attack():
	if Input.is_action_just_pressed("Attack") and not attacking:
		attacking = true
		
		Player_Animation.play("Attack")
		
		HitArea.disabled = false
		
		yield(get_tree().create_timer(0.36), "timeout")
		
		HitArea.disabled = true
		
		attacking = false

func add_time():
	Timer_Label.text = "%02d : %02d" % [GameManager.minutes, GameManager.seconds]

func _on_Area2D_body_entered(body):
	if body.is_in_group("Enemie"):
		body.hit(1, self) 
		
func _on_AreaofDetection_body_entered(body):
	if GameManager.level_shuriken > 0:
		if not Tools.get_node("Shuriken_1").attacking:
			Tools.get_node("Shuriken_1").go_to(body)

func update_playerbar():
	HealthBar.value = GameManager.lives * 10
	
	XPBar.value = (GameManager.xp * 100) / (GameManager.xp_per_level * (GameManager.level))
	
	XPLeveL.text = "LVL. %02d" % [GameManager.level]

func restart_game():
	if GameManager.lives == 0:
		Player_Animation.play("Death")
		
		dying = true
		
		GameManager.finishgame = true
		
		yield(get_tree().create_timer(1.5), "timeout")
		
		GameManager.reset()
		
		GameManager.in_game = true
		
		get_tree().reload_current_scene() 

func _physics_process(delta):
	if Input.is_action_just_pressed("Spawn"):
		var Wolf_preload = preload("res://Cenes/Wolf.tscn")
		
		var Wolf = Wolf_preload.instance()
		
		Wolf.position = position
		
		get_tree().get_root().add_child(Wolf)

	if not GameManager.stopgame and not dying and not attacking:
		add_time()
		
		get_input()
		apply_animation()
		
		update_playerbar()
		attack()
		
		velocity = move_and_slide(velocity)
		
		restart_game()
		
		if Input.is_action_just_pressed("Upgrade"):
			GameManager.xp += 5

