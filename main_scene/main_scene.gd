extends Node2D

var score = 0
@export var round_time = 60

func update_score(to_add):
	score+= to_add
	$Hud/HBoxContainer/VBoxContainer/ScoreHBox/ScoreText.text = str(score)  

func set_timer(new_time):
	$Hud/HBoxContainer/VBoxContainer/Time/TimerSeconds.text = str(round_time)
	
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_round_timer_timeout():
	round_time-=1
	if(round_time>=0):
		set_timer(round_time)
	else:
		print("game over")
		get_tree().paused = true
