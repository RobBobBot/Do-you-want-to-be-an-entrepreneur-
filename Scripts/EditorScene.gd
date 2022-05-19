extends Node2D

func _ready():
	Values.popularity=1
	$GUILayer/GUI.connect("pressed",self,"go_to_daytime")
	$GUILayer/GUI.connect("market",self,"go_to_market")

func go_to_daytime():
	var daytime=Globals.daytime_scene.instance()
	get_parent().add_child(daytime)
	$TileMap.copy_data_into(daytime.get_node("TileMap"))
	daytime.get_node("TileMap").remake_baskets()
	queue_free()

func go_to_market():
	var market = Globals.market_scene.instance()
	get_parent().add_child(market)
	hide_editor()

func hide_editor():
	visible=false
	$GUILayer/GUI/CanvasLayer/Items.visible=false
	$GUILayer/GUI/CanvasLayer/Top.visible=false
	$GUILayer/MouseCatcher.visible=false

func show_editor():
	visible=true
	$GUILayer/GUI/CanvasLayer/Items.visible=true
	$GUILayer/GUI/CanvasLayer/Top.visible=true
	$GUILayer/MouseCatcher.visible=true
