extends Sprite


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var length:float=10048
export var  vlength:float=5000
const max_time=60

# Called when the node enters the scene tree for the first time.
func _ready():
	scale.y=-vlength
	scale.x=(length+Globals.window_size.y)/texture.get_width()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var elapsed_time=Globals.seconds+Globals.minutes+Globals.hours*60
	position.y=-length*clamp((elapsed_time/max_time),0,1)
	#print(position)
