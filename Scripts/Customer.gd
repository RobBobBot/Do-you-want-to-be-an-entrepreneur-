extends Man


var target:Basket
export var wants:int=1
export var money:int=0
export var wanted_sum:int=0
var mood=50

var exit_coords:Vector2

enum{
	idle,
	seeking_item,
	leaving
}

var state:int=idle

func begin():
	sprite_mover=$Tween
	animation_player=$AnimationPlayer
	sprite=$Sprite
	wants=Globals.rng.randi_range(1,1)
	wanted_sum=Globals.rng.randf_range(1,5)
	money=Globals.rng.randi_range(500,1000)
	.begin()
	call_deferred("start_ai")
	pass 

func start_ai():
	exit_coords=floor_map.exit_coords
	x=exit_coords.x
	y=exit_coords.y
	update_position()
	find_basket()
	move_to_next()
	
func find_basket():
	target=floor_map.get_good_basket(wants)
	#print(target)
	if target:
		make_path_to_target(target.map_coords,true)
		#print(target.held_item)
		state=seeking_item

	

func move_to_next():
	mood-=1
	#print(mood)
	if move_stack.empty():
		match state:
			seeking_item:
				if target:
					if target.held_item!=wants:
						find_basket()
					else:
						target.empty()
						make_path_to_target(exit_coords)
						#print(move_stack)
						state=leaving
					#move_to_next()
			leaving:
				queue_free()
	.move_to_next()
