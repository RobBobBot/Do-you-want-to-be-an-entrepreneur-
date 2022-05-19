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
	
	if placing && Globals.current_item!=-1:
		tile_map.add_tile(map_pos)

	update_sprite()

func on_mouse_down_in_editor():
	placing=true

func on_mouse_up_in_editor():
	placing=false
	
func _on_MouseCatcher_pressed():
	if Globals.current_item==-1 and clicked_on_storage(map_pos):
		print("here")
		pass
	

func clicked_on_storage(var position:Vector2) -> bool:
	return false
	position = position.floor()
#	if Values.tiles.has(position) && Values.tiles[position][0] == "Basket":
#		return true
#	return false
	pass


func update_sprite():
	if Globals.current_item==-1:
		$Sprite.set_texture(null)
	else:
		$Sprite.set_texture(Values.items[Globals.current_item][2])
		$Sprite.offset.y=-($Sprite.texture.get_size().y-32)
		$Sprite.offset.x=-($Sprite.texture.get_size().x-32)
