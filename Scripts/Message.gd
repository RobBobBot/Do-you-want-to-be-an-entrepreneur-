extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var message:int=0
export var time:float=1

# Called when the node enters the scene tree for the first time.
func _ready():
	$Sprite.texture=Globals.message_boxes[message]
	get_tree().create_timer(time).connect("timeout",self,"_on_time_ended")
	pass # Replace with function body.

func _on_time_ended():
	queue_free()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
