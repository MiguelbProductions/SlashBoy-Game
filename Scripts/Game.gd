extends Node2D

onready var EnemiesSpawn_Timer = $EnemiesSpawn_Timer

onready var Object_Overlay = $Object_Overlay
onready var Player = $Player

onready var Shop = $Player/Shop

var rng = RandomNumberGenerator.new()

const Demon_Preload = preload("res://Cenes/Demon.tscn")

func _on_EnemiesSpawn_Timer_timeout():
	if not GameManager.finishgame:
		rng.randomize()
		EnemiesSpawn_Timer.start(rng.randi_range(GameManager.minspawn_time, GameManager.maxspawn_time))
		
		if GameManager.minspawn_time != 0.2:
			GameManager.maxspawn_time -= 0.05
			GameManager.minspawn_time -= 0.05
		
		rng.randomize()
		var numenemies_spawned = rng.randi_range(GameManager.minspawn_Enemies, GameManager.maxspawn_Enemies)
		
		for x in range(numenemies_spawned):
			var Demon = Demon_Preload.instance()
			
			rng.randomize()
			Demon.position = Vector2(rng.randi_range(64, 1768), rng.randi_range(72, 1000))
			
			Object_Overlay.add_child(Demon)

func _process(delta):
	if GameManager.stopgame:
		get_tree().paused = true
		Shop.visible = true
	elif not GameManager.stopgame:
		get_tree().paused = false
		Shop.visible = false
