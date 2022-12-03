extends Sprite

onready var Pointer = $Position2D

const Riffle_Bullet = preload("res://Cenes/Pistol_Bullet.tscn")

var can_shoot = true

func _physics_process(delta):
	look_at(get_global_mouse_position())
		
	if Input.is_action_pressed("Attack") and can_shoot:
		can_shoot = false
		
		var Bullet_Instance = Riffle_Bullet.instance()
		
		Bullet_Instance.rotation = rotation
		Bullet_Instance.position = Pointer.global_position
		
		get_tree().get_root().add_child(Bullet_Instance)
		
		yield(get_tree().create_timer(0.4), "timeout")
		
		can_shoot = true 
