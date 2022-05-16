extends Node2D

export var tile_map_path:NodePath
export var mouse_catcher_path:NodePath
onready var tile_map:EditableMap=get_node(tile_map_path)
onready var mouse_cat:Button=get_node(mouse_catcher_path)
var map_pos:Vector2

var placing:bool=false

func _ready():
	mouse_cat.connect("button_down",self,"on_mouse_down_in_editor")
	mouse_cat.connect("button_up",self,"on_mouse_up_in_editor")

func _process(delta):
	
	map_pos=tile_map.world_to_map(get_global_mouse_position())
	global_position=tile_map.map_to_world(map_pos)
	
	if placing:
		tile_map.add_tile(map_pos)
	
	
	
	update_sprite()

func on_mouse_down_in_editor():
	placing=true

func on_mouse_up_in_editor():
	placing=false

func update_sprite():
	if Globals.current_item==-1:
		$Sprite.set_texture(null)
	else:
		$Sprite.set_texture(Values.items[Globals.current_item][2])
