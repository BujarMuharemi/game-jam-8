extends Area2D

# Define the speed of movement
const SPEED = 20
var block_left=false
var block_right=false
var food_scene = preload("res://game_world/food/food.tscn")
var food_drop_time=false

func _process(delta):
	# Check for input
	if Input.is_action_pressed("ui_right") and !block_right:
		self.set_position(Vector2(get_position().x+SPEED,get_position().y))

	elif Input.is_action_pressed("ui_left") and !block_left:
		self.set_position(Vector2(get_position().x-SPEED,get_position().y))
	
	## is_action_just_pressed
	elif Input.is_action_pressed("ui_select") and food_drop_time:	
		set_scale(Vector2(1.0,1.0))		
		var food = food_scene.instantiate()
		food.position = position
		get_tree().root.get_child(0).add_child(food)
		food_drop_time=false


func _on_body_entered(body):
	if(body.name == "LeftWall"):
		block_left=true
	elif(body.name == "RightWall"):
		block_right=true

func _on_body_exited(body):
	if(body.name == "LeftWall"):
		block_left=false
	elif(body.name == "RightWall"):
		block_right=false


func _on_timer_timeout():
	food_drop_time=true
	set_scale(Vector2(1.2,1.2)) # to tell the player he can spawn stuff
	
