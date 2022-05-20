extends Man
class_name Emplyee
var store_mod:float=0.5
var talk_mod:float=0.5
var bank_mod:float=0.5
var em_name:String="Emplyee"
var helped:bool=0
signal stopped_talking

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
}

var state=idle

func change_state(new_state:int):
	if new_state==helping_customer:
		show_message(Globals.messages.yes,false)
	state=new_state

func begin():
	sprite_mover=$Tween
	animation_player=$AnimationPlayer
	sprite=$Sprite
	.begin()

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

func move_to_next():
	print(move_stack)
	if move_stack.empty():
		print("still here")
		match state:
			helping_customer:
				emit_signal("stopped_talking",helped)
				print("still here")
				change_state(idle)
	.move_to_next()



