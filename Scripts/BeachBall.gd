extends KinematicBody2D

onready var Player = $"../Game/Player"

onready var ReloadTimer = $ReloadTimer
onready var Fade_Animation = $Fade_Animation

var original_direction = Vector2()
var direction = Vector2()

var rng = RandomNumberGenerator.new()

var maxreload_time = 8
var minreload_time = 4

var maxspawn_time = 5
var minspawn_time = 2.5

var reloading = false

const speed = 350

func _ready():
	rng.randomize()
	ReloadTimer.start(rng.randi_range(minreload_time, maxreload_time))

func _on_HitArea_body_entered(body):
	if body.is_in_group("Enemie"):
		body.hit(1.5, Player)

func _on_ReloadTimer_timeout():
	Fade_Animation.play("Fade Out")
	
	yield(get_tree().create_timer(1), "timeout")
	
	Fade_Animation.stop()
	reloading = true
	
	rng.randomize()
	yield(get_tree().create_timer(rng.randi_range(minspawn_time, maxspawn_time)), "timeout")
	
	position = Player.position
	direction = original_direction
	
	reloading = false
	
	Fade_Animation.play("Fade In")
	
	rng.randomize()
	ReloadTimer.start(rng.randi_range(minreload_time, maxreload_time))
	
func _process(delta):
	if not reloading:
		rotation_degrees -= 20
		
		var collision = move_and_collide(direction * speed * delta)
		
		if collision:
			if collision.collider.name == "Map":
				direction = direction.bounce(collision.normal)
				
	if GameManager.finishgame:
		queue_free()

