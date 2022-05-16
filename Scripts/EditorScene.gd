extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$GUILayer/GUI.connect("pressed",self,"go_to_daytime")
	pass # Replace with function body.

func go_to_daytime():
	var daytime=Globals.daytime_scene.instance()
	get_parent().add_child(daytime)
	$TileMap.copy_data_into(daytime.get_node("TileMap"))
	queue_free()
