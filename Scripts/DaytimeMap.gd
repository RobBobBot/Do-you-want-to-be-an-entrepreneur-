extends TileMap


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var basket:PackedScene=preload("res://Scenes/Basket.tscn")

var baskets=[]

var exit_coords:Vector2
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.'

func remake_baskets():
	for cell in get_used_cells_by_id(tile_set.find_tile_by_name("door")):
		exit_coords=cell
	print(exit_coords)
	for cell in get_used_cells_by_id(tile_set.find_tile_by_name("empty_basket")):
		set_cellv(cell,tile_set.find_tile_by_name("floor"))
		var bas=basket.instance()
		bas.position=map_to_world(cell)
		bas.held_item=Globals.rng.randi_range(0,1)
		bas.map_coords=cell
		baskets.push_back(bas)
		add_child(bas)

func _process(delta):
	pass
	#print(get_cellv(world_to_map(get_local_mouse_position())))

func get_good_basket(wanted_item:int):
	for bas in baskets:
		if bas.held_item==wanted_item:
			return bas
	return null

