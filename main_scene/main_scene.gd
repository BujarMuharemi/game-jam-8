extends Node2D

var score = 0
@export var round_time = 60
var game_over = false

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
		
func _input(event):
	if event is InputEventKey and event.pressed:
		if event.keycode == KEY_R and game_over:
				get_tree().reload_current_scene()

func _on_round_timer_timeout():
	round_time-=1
	if(round_time>=0):
		set_timer(round_time)
	else:
		$Hud.set_visible(false)
		$FinalScore.text = "Your Score is: "+str(score)+ "\n\nPress R to try again\n\n100 = Noob \n 200 = Normal\n 300 = Pro\n 400 = Tryhard"
		$FinalScore.set_visible(true)
		game_over = true
		$player.game_over = true
		#get_tree().paused = true
