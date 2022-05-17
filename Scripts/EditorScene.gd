extends Node2D

func _ready():
	$GUILayer/GUI.connect("pressed",self,"go_to_daytime")
	$GUILayer/GUI.connect("market",self,"go_to_market")
	pass # Replace with function body.

func go_to_daytime():
	var daytime=Globals.daytime_scene.instance()
	get_parent().add_child(daytime)
	$TileMap.copy_data_into(daytime.get_node("TileMap"))
	queue_free()

func go_to_market():
	var market = Globals.market_scene.instance()
	get_parent().add_child(market)
	queue_free()
	pass
