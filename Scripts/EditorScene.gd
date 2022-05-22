extends Node2D

const daytime_main_map_name="MainMap"

func _ready():
	if !Values.editor_tilemap:
		Values.editor_tilemap=EditableMap.new()
	Values.popularity=1.0+Values.offset
	$GUILayer/GUI.connect("pressed",self,"go_to_daytime")
	$GUILayer/GUI.connect("market",self,"go_to_market")

func go_to_daytime():
	var daytime=Globals.daytime_scene.instance()
	$TileMap.copy_data_into(daytime.get_node(daytime_main_map_name))
	$TileMap.copy_data_into(Values.editor_tilemap)
	Values.editor_tilemap.tile_set=$TileMap.tile_set
	#Values.editor_tilemap.copy_data_into($TileMap)
	daytime.get_node(daytime_main_map_name).call_deferred("remake_interactables")
	daytime.get_node(daytime_main_map_name).call_deferred("remake_walls")
	daytime.get_node(daytime_main_map_name).call_deferred("add_emplyees")
	get_parent().change_env(daytime)

func copy_data():
	Values.editor_tilemap.copy_data_into($TileMap)

func go_to_market():
	var market = Globals.market_scene.instance()
	get_parent().add_child(market)
	hide_editor()

func hide_editor():
	visible=false
	$GUILayer/GUI/CanvasLayer/Button.visible=false
	$GUILayer/GUI/CanvasLayer/Items.visible=false
	$GUILayer/GUI/CanvasLayer/Top.visible=false
	$GUILayer/MouseCatcher.visible=false

func show_editor():
	visible=true
	$GUILayer/GUI/CanvasLayer/Button.visible=true
	$GUILayer/GUI/CanvasLayer/Items.visible=true
	$GUILayer/GUI/CanvasLayer/Top.visible=true
	$GUILayer/MouseCatcher.visible=true

func hide_all():
	hide()
	$GUILayer/MouseCatcher.hide()
	$GUILayer/GUI.hide_all()

func show_all():
	show()
	$GUILayer/MouseCatcher.show()
	$GUILayer/GUI.show_all()
