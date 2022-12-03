extends StaticBody2D

const price = 1

func _on_Collision_Area_body_entered(body):
	if body.get_name() == "Player":
		GameManager.xp += price
		queue_free()
