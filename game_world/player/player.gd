extends Area2D

# Define the speed of movement
const SPEED = 20
var block_left=false
var block_right=false
var game_over = false
var food_scene = preload("res://game_world/food/food.tscn")
var food_drop_timer_flag=false
@export var food_drop_time:float=2

func _ready():
	$Timer.set_wait_time(food_drop_time)

func _process(delta):
	# Check for input
	if Input.is_action_pressed("ui_right") and !block_right and !game_over:
		self.set_position(Vector2(get_position().x+SPEED,get_position().y))

	elif Input.is_action_pressed("ui_left") and !block_left and !game_over:
		self.set_position(Vector2(get_position().x-SPEED,get_position().y))
	
	## is_action_just_pressed
	elif Input.is_action_pressed("ui_select") and food_drop_timer_flag and !game_over:	
		#set_scale(Vector2(1.0,1.0))		
		get_node("Blanko/FoodReady").set_visible(false)
		var food = food_scene.instantiate()
		food.position = position
		get_tree().root.get_child(0).add_child(food)
		food_drop_timer_flag=false
	

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
	food_drop_timer_flag=true
	#set_scale(Vector2(1.1,1.1)) # to tell the player he can spawn stuff
	get_node("Blanko/FoodReady").set_visible(true)
	
	
