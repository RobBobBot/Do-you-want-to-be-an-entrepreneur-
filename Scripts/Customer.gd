extends Man


var target:Basket
var target_emp:Emplyee
export var wants:int=1
export var money:int=0
export var wanted_sum:int=0
var mood=50

var exit_coords:Vector2

enum{
	idle,
	seeking_emplyee,
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
	find_emplyee()
	move_to_next()
	

func find_emplyee():
	target_emp=floor_map.get_free_emplyee()
	if target_emp:
		state=seeking_emplyee
		target_emp.change_state(Emplyee.helping_customer)
		#target_emp.state=Emplyee.helping_customer
		show_message(Globals.messages.apples_where,true)
		make_path_to_target(Vector2(target_emp.x,target_emp.y),true)
		#show_message(Globals.messages.thanks,true)

func find_basket():
	target=floor_map.get_good_basket(wants)
	#print(target)
	if target:
		make_path_to_target(target.map_coords,true)
		state=seeking_item
		#print(target.held_item)
	else:
		make_path_to_target(exit_coords)
		show_message(Globals.messages.leaving_bad)
		state=leaving
		

func _on_emplyee_response_rec(response:bool):
	print("Received")
	if response:
		find_basket()
		show_message(Globals.messages.thanks,true)
		move_to_next()
	else:
		make_path_to_target(exit_coords)
		show_message(Globals.messages.leaving_bad,true)
		state=leaving
		move_to_next()
	target_emp.disconnect("stopped_talking",self,"_on_emplyee_response_rec")


func state_transition():
	match state:
			seeking_emplyee:
				if target_emp:
					target_emp.connect("stopped_talking",self,"_on_emplyee_response_rec")
					target_emp.help_customer(wants)
			seeking_item:
				if target:
					if target.held_item!=wants:
						find_basket()
						show_message(Globals.messages.sad,true)
					else:
						target.empty()
						make_path_to_target(exit_coords)
						show_message(Globals.messages.happy)
						state=leaving
					#move_to_next()
			leaving:
				queue_free()


func move_to_next():
	mood-=1
	#print(mood)
	if move_stack.empty():
		state_transition()
	.move_to_next()
