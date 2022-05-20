extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var move_speed:float=500
export var zoom_speed:float=1
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y-=Input.get_axis("down","up")*move_speed*delta
	position.x+=Input.get_axis("left","right")*move_speed*delta
	if Input.is_action_just_released("zoom_in"):
		zoom.x-=delta*zoom_speed
		zoom.y-=delta*zoom_speed
	if Input.is_action_just_released("zoom_out"):
		zoom.x+=delta*zoom_speed
		zoom.y+=delta*zoom_speed
	#print(Input.get_axis("zoom_in","zoom_out"))
	pass
