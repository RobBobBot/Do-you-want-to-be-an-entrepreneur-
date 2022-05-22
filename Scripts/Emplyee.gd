extends Man
class_name Emplyee
var store_mod:float=0.5
var talk_mod:float=0.5
var bank_mod:float=0.5
var em_name:String="Emplyee"
var helped:bool=0
signal stopped_talking

export var normal_texture:Texture
export var housing_texture:Texture


var target_box
var target_basket

func take_values_from_vector(array:Array):
	x=array[0]
	y=array[1]
	store_mod=array[2]
	talk_mod=array[3]
	bank_mod=array[4]
	em_name=array[5]

enum {
	idle,
	helping_customer,
	moving_boxes,
	filling_baskets,
	housing,
}

export var state=idle

var held_item:int

func change_state(new_state:int):
	$Sprite/Sprite.texture=normal_texture
	match new_state:
		idle:
			move_stack.clear()
		helping_customer:
			show_message(Globals.messages.alert,false)
		housing:
			$Sprite/Sprite.texture=housing_texture
		moving_boxes:
			move_stack.clear()
			target_box=floor_map.get_box()
			if target_box:
				make_path_to_target(target_box.map_coords,true)
				move_to_next()
			else:
				change_state(idle)
		filling_baskets:
			move_stack.clear()
			target_basket=floor_map.get_good_basket(0)
			if target_basket:
				make_path_to_target(target_basket.map_coords,true)
				move_to_next()
			else:
				change_state(idle)
	state=new_state

func begin():
	#$PopupMenu.popup(Rect2(position.x,position.y,0,0))
	sprite_mover=$Tween
	animation_player=$AnimationPlayer
	sprite=$Sprite
	.begin()
	change_state(moving_boxes)

func help_customer(wants:int):
	print("here")
	if Values.display[wants]>0:
		show_message(Globals.messages.directions,true)
		show_message(Globals.messages.yes,true)
		helped=1
		move_to_next()
	else:
		helped=0
		show_message(Globals.messages.no,true)
		move_to_next()
	#change_state(idle)

func state_transition():
	match state:
		helping_customer:
			emit_signal("stopped_talking",helped)
			change_state(idle)
		moving_boxes:
			held_item=target_box.held_item
			target_box.empty()
			change_state(filling_baskets)
		filling_baskets:
			target_basket.fill(held_item)
			held_item=0
			change_state(moving_boxes)

func move_to_next():
	if move_stack.empty():
		state_transition()
	else:
		.move_to_next()




