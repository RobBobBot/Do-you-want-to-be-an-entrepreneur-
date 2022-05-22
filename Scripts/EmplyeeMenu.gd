extends Panel
class_name EmplyeeMenu

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

#var charisma:float
#var speed:float
#var housing:float

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func take_values_from_emplyee(emp:Emplyee):
	$Name.text=emp.em_name
	$Stats/Charisma/ProgressBar.value=emp.talk_mod*100
	$Stats/Housing/ProgressBar.value=emp.bank_mod*100
	$Stats/Speed/ProgressBar.value=emp.store_mod*100
	var occ:String
	match emp.state:
		Emplyee.idle:
			occ="Idle"
		Emplyee.helping_customer:
			occ="Helping Customers"
		Emplyee.moving_boxes:
			occ="Filling Stalls"
		Emplyee.housing:
			occ="Housing"
	$Occupation.text="Current Occupation:\n"+occ
	
	if emp.em_name.to_lower()=="fgdd":
		$TextureRect.texture=load("res://icon.png")
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
