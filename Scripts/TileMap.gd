extends TileMap
class_name EditableMap

func _ready():
	
	pass

func _process(delta):
	pass
	#evil position hack
	#cursor.position=map_to_world(world_to_map(get_local_mouse_position()))

func add_tile(position:Vector2):
	var current_val = get_cellv(position)
	#print(current_val,' ',Globals.current_item)
	if current_val!=Globals.current_item and Globals.current_item!=-1:
		
		var itemid = Globals.current_item
		
		set_cellv(position,itemid)
		
		Globals.change_money(Globals.items[itemid][0],Globals.items[itemid][1])

func copy_data_into( map:TileMap):
	for i in tile_set.get_tiles_ids():
		for cell in get_used_cells_by_id(i):
			map.set_cellv(cell,i)
