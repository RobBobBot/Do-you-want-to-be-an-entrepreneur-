extends Node2D

func _ready():
# warning-ignore:return_value_discarded
	$GUILayer/GUI.connect("pressed",self,"go_to_daytime")
# warning-ignore:return_value_discarded
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
	#queue_free()
	visible=false
	$GUILayer/GUI/CanvasLayer/Items.visible=false
	$GUILayer/GUI/CanvasLayer/Top.visible=false
	$GUILayer/MouseCatcher.visible=false
	pass

func show_editor():
	visible=true
	$GUILayer/GUI/CanvasLayer/Items.visible=true
	$GUILayer/GUI/CanvasLayer/Top.visible=true
	$GUILayer/MouseCatcher.visible=true
