extends Node2D

@export var feed_score = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_body_entered(body):
	#TODO: play eat animation here
	print("sumo hit:",body)
	body.hide()
	body.queue_free()
	get_tree().root.get_child(0).update_score(feed_score)
