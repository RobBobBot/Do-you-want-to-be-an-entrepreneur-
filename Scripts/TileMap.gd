extends TileMap
class_name EditableMap

func _ready():
	
	pass

func _process(delta):
	pass
	Values.tiles=tile_set
	#evil position hack
	#cursor.position=map_to_world(world_to_map(get_local_mouse_position()))

func add_tile(position:Vector2):
	position = position.floor()
	var current_val = get_cellv(position)
	#print(current_val,' ',Globals.current_item)
	if current_val!=Globals.current_item and Globals.current_item!=-1:
		
		var itemid = Globals.current_item
		
		if Globals.change_money(Values.items[itemid][0],Values.items[itemid][1]):
			set_cellv(position,itemid)

func copy_data_into( map:TileMap):
	for i in tile_set.get_tiles_ids():
		for cell in get_used_cells_by_id(i):
			map.set_cellv(cell,i)
