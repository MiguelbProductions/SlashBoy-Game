extends Node2D

onready var label = $DamageAmoutText

var direction = Vector2.ZERO

var speed: int = 30
var friction: int = 15

func _ready():
	direction = Vector2(rand_range(-1, 1), rand_range(-1, 1))

func _process(delta):
	global_position += speed * direction * delta
	speed = max(speed - friction * delta, 0)
