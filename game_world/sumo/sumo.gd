extends Node2D

@export var feed_score = 10
@export var walk_speed = 5
#enum("right", "left") var walking_state: int

var walking_right = true
var walking_left = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#if Input.is_action_pressed("ui_right") and !block_right:
	if(walking_right):
		self.set_position(Vector2(get_position().x+walk_speed,get_position().y))
	elif(!walking_right):
		self.set_position(Vector2(get_position().x-walk_speed,get_position().y))

func _on_body_entered(body):
	#TODO: play eat animation here
	print("sumo hit:",body)
	
	if(body.is_in_group("food")):
		body.hide()
		body.queue_free()
		get_tree().root.get_child(0).update_score(feed_score)
	elif(body.name == "RightWall"):
		walking_right=false
		walking_left = true
	elif(body.name == "LeftWall"):
		walking_right=true
		walking_left = false
