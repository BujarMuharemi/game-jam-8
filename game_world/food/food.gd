extends RigidBody2D

# removing the food if it falls below the screen
func _process(delta):
	if(position.y>1100):
		hide()
		queue_free()

