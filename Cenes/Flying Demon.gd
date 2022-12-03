extends KinematicBody2D

onready var Animation_FlyingDemon = $Animation_FlyingDemon

func _ready():
	Animation_FlyingDemon.play("Fade In")
