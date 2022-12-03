extends Node

### LIVE ###
var lives = 10

### GAME STATS ###
var in_game = false
var finishgame = false
var stopgame = false

### LEVE OF PLAYER ###
var xp = 0
var level = 1

var xp_per_level = 5

### LEVEL OF UPGRADES ###
var level_axe = 0
var level_beachball = 0
var level_shuriken = 0

### SHURIKEN ###

var shuriken_enemy 
var shuriken_can_attack = false

### TIME ###
var minutes = 0
var seconds = 0

var time_alive = 0

### ENEMIES ###
var waves = 1

var maxspawn_time = 8.5
var minspawn_time = 4.5

var maxspawn_Enemies = 1
var minspawn_Enemies = 1

func reset():
	### LIVE ###
	lives = 10
	
	### GAME STATS ###
	in_game = false
	finishgame = false
	stopgame = false
	
	### LEVE OF PLAYER ###
	xp = 0
	level = 1

	xp_per_level = 5
	
	### LEVEL OF UPGRADES ###
	level_axe = 0
	level_beachball = 0
	level_shuriken = 0

	### SHURIKEN ###

	shuriken_enemy 
	shuriken_can_attack = false
	
	### TIME ###
	minutes = 0
	seconds = 0
	
	time_alive = 0
	
	### ENEMIES ###
	waves = 1
	
	maxspawn_time = 8.5
	minspawn_time = 4.5
	
	maxspawn_Enemies = 1
	minspawn_Enemies = 1
	
func _process(delta):
	### TIME ###
	if in_game:
		time_alive += 1
		
		if time_alive == 60:
			time_alive = 0
			seconds += 1
			
			if seconds == 60:
				seconds = 0
				minutes += 1
				
				waves += 1
			
	### LEVEL OF PLAYER ###
	if xp >= xp_per_level * (level):
		xp -= xp_per_level * (level)
		level += 1
		stopgame = true
	
	### NUMBER OF ENEMIES PER WAVE ###
	if waves == 1:
		if maxspawn_Enemies != 1: maxspawn_Enemies = 1
		if minspawn_Enemies != 1: maxspawn_Enemies = 1
		if maxspawn_time != 8.5: maxspawn_time = 8.5
		if minspawn_time != 6.5: maxspawn_time = 6.5
	elif waves == 2:
		if maxspawn_Enemies != 1: maxspawn_Enemies = 1
		if minspawn_Enemies != 1: maxspawn_Enemies = 1
		if maxspawn_time != 8: maxspawn_time = 8
		if minspawn_time != 6: maxspawn_time = 6
	elif waves == 3:
		if maxspawn_Enemies != 2: maxspawn_Enemies = 2
		if minspawn_Enemies != 1: maxspawn_Enemies = 1
		if maxspawn_time != 7.75: maxspawn_time = 7.75
		if minspawn_time != 5.5: maxspawn_time = 5.5
	elif waves == 4:
		if maxspawn_Enemies != 2: maxspawn_Enemies = 2
		if minspawn_Enemies != 1: maxspawn_Enemies = 1
		if maxspawn_time != 7.5: maxspawn_time = 7.5
		if minspawn_time != 5.5: maxspawn_time = 5.5
	elif waves == 5:
		if maxspawn_Enemies != 3: maxspawn_Enemies = 3
		if minspawn_Enemies != 1: maxspawn_Enemies = 1
		if maxspawn_time != 7: maxspawn_time = 7
		if minspawn_time != 5: maxspawn_time = 5
	elif waves == 6:
		if maxspawn_Enemies != 4: maxspawn_Enemies = 4
		if minspawn_Enemies != 1: maxspawn_Enemies = 1
		if maxspawn_time != 7: maxspawn_time = 7
		if minspawn_time != 5: maxspawn_time = 5
	elif waves == 7:
		if maxspawn_Enemies != 5: maxspawn_Enemies = 5
		if minspawn_Enemies != 1: maxspawn_Enemies = 1
		if maxspawn_time != 6.75: maxspawn_time = 6.75
		if minspawn_time != 4.75: maxspawn_time = 4.75
	elif waves == 8:
		if maxspawn_Enemies != 6: maxspawn_Enemies = 6
		if minspawn_Enemies != 1: maxspawn_Enemies = 1
		if maxspawn_time != 6.75: maxspawn_time = 6.75
		if minspawn_time != 4.5: maxspawn_time = 4.5
	elif waves == 9:
		if maxspawn_Enemies != 7: maxspawn_Enemies = 7
		if minspawn_Enemies != 1: maxspawn_Enemies = 1
		if maxspawn_time != 6.75: maxspawn_time = 6.75
		if minspawn_time != 4.25: maxspawn_time = 4.25
	elif waves == 10:
		if maxspawn_Enemies != 8: maxspawn_Enemies = 8
		if minspawn_Enemies != 1: maxspawn_Enemies = 1
		if maxspawn_time != 6.75: maxspawn_time = 6.75
		if minspawn_time != 4: maxspawn_time = 4
