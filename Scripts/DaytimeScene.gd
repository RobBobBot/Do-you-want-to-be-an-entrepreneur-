extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

export var customer:PackedScene=preload("res://Scenes/People/Customer.tscn")
onready var main_map=$MainMap
onready var wall_map=$WallMap
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	
	if Input.is_action_just_pressed("space"):
		var cus=customer.instance()
		cus.floor_map_path=main_map.get_path()
		wall_map.add_child(cus)
		
	#print(Globals.spawn_customer())




func _on_HideWalls_pressed():
	$WallHider.energy=1-$WallHider.energy
	pass # Replace with function body.
