extends TileMap

onready var cursor = $Icon

func _ready():
	pass

func _process(delta):
	#evil position hack
	cursor.position=map_to_world(world_to_map(get_local_mouse_position()))
	
	if Input.is_action_pressed("mouse_down"):
		#print("ye")
		
		if get_cellv(world_to_map(get_local_mouse_position()))!=0 && Globals.currentItem!=-1:
			
			var itemid = Globals.currentItem
			
			set_cellv(world_to_map(get_local_mouse_position()),itemid)
			
			Globals.change_money(Globals.items[itemid][0],Globals.items[itemid][1])
