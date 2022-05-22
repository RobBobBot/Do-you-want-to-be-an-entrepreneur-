extends Interactable


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var held_item:int

export var empty_texture:Texture

# Called when the node enters the scene tree for the first time.
func _ready():
	if held_item==0:
		$Box.texture=empty_texture
	pass # Replace with function body.

func empty():
	held_item=0
	$Box.texture=empty_texture

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

