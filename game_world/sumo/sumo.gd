extends Node2D

@export var feed_score = 10
@export var eating_time = 3 #or sleeping time
@export var walk_speed = 5

#enum("right", "left") var walking_state: int

var walking_right = true
var walking_left = false
var eating = false
var rng = RandomNumberGenerator.new()
var timer

# Called when the node enters the scene tree for the first time.
func _ready():
	rnd_walk_dir()
	walk_speed = walk_speed * rng.randf_range(1.0,1.2)
	timer = get_node("Timer")

func rnd_walk_dir():
	walking_right = bool(rng.randi_range(0,1))
	walking_left = !walking_right
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if Input.is_action_pressed("ui_right") and !block_right:
	if(walking_right and !eating):
		self.set_position(Vector2(get_position().x+walk_speed,get_position().y))
	elif(walking_left and !eating):
		self.set_position(Vector2(get_position().x-walk_speed,get_position().y))
		

func _on_body_entered(body):
	#print("sumo hit:",body)
	
	if(body.is_in_group("food") and !eating):
		#TODO: play eat animation here
		body.hide()
		body.queue_free()
		get_tree().root.get_child(0).update_score(feed_score) #make main a global var
		eating=true
		timer.start(eating_time)
		
	elif(body.name == "RightWall"):
		walking_right=false
		walking_left = true
		
	elif(body.name == "LeftWall"):
		walking_right=true
		walking_left = false


func _on_timer_timeout():
	print("eating time over")
	eating=false
	rnd_walk_dir()
	
