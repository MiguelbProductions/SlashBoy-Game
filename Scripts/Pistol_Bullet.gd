extends Area2D

var direction = Vector2.RIGHT

const speed = 400

func _on_Pistol_Bullet_body_entered(body):
	if body.get_name() != "Player":
		body.queue_free()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	
func _process(delta):
	position += ((Vector2.RIGHT * speed).rotated(rotation) * delta)

func _physics_process(delta):
	yield(get_tree().create_timer(0.01), "timeout")
	
	set_physics_process(false)


