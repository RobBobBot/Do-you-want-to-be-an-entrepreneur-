extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var basket:PackedScene=preload("res://Scenes/Interactables/Basket.tscn")
export var emplyee:PackedScene=preload("res://Scenes/People/Emplyee.tscn")
export var box:PackedScene=preload("res://Scenes/Interactables/Box.tscn")
export var exit:PackedScene=preload("res://Scenes/Interactables/Door.tscn")
export var wall_map_path:NodePath
onready var wall_map:TileMap=get_node(wall_map_path)
var baskets=[]
var emplyees=[]
var boxes=[]
const wall_names=["wall","wall_tall"]

var exit_coords:Vector2
var exit_place
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.'

func remake_walls():
	for nam in wall_names:
		var id=tile_set.find_tile_by_name(nam)
		for cell in get_used_cells_by_id(id):
			wall_map.set_cellv(cell,id)
			set_cellv(cell,-1)

func add_emplyees():
	for arr in Values.emplyees:
		var emp=emplyee.instance()
		emp.floor_map_path=get_path()
		emp.take_values_from_vector(arr)
		emplyees.push_back(emp)
		wall_map.add_child(emp)
		#print("here")

func remake_interactables():
	for cell in get_used_cells_by_id(tile_set.find_tile_by_name("door")):
		exit_coords=cell
		set_cellv(cell,0)
		var ex=exit.instance()
		ex.position=map_to_world(cell)
		ex.map_coords=cell
		exit_place=ex
		wall_map.add_child(ex)
		print(ex)
	print(exit_coords)
	for cell in get_used_cells_by_id(tile_set.find_tile_by_name("empty_basket")):
		set_cellv(cell,-1)
		var bas=basket.instance()
		bas.position=map_to_world(cell)
		bas.held_item=0
		bas.map_coords=cell
		baskets.push_back(bas)
		wall_map.add_child(bas)
	
	for cell in get_used_cells_by_id(tile_set.find_tile_by_name("storage_space")):
		set_cellv(cell,-1)
		var bx=box.instance()
		bx.position=map_to_world(cell)
		bx.held_item=0
		for ix in Values.stock.keys():
			print(Values.stock[ix])
			if Values.stock[ix]>0:
				bx.held_item=ix
				Values.stock[ix]-=1
				break
		bx.map_coords=cell
		boxes.push_back(bx)
		wall_map.add_child(bx)

func _process(delta):
	pass
	#print(get_cellv(world_to_map(get_local_mouse_position())))

func get_good_basket(wanted_item:int):
	for bas in baskets:
		#print(bas.held_item)
		if bas.held_item==wanted_item:
			return bas
	return null

func get_free_emplyee():
	for emp in emplyees:
		if emp.state == Emplyee.idle:
			return emp
	return null

func get_box():
	for bx in boxes:
		if bx.held_item !=0:
			return bx

