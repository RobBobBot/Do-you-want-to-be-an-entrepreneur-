extends PanelContainer

func _ready():
	visible=false

func _process(delta):
	if(Globals.active==3):
		visible=true
	else:
		visible=false

func _on_Button_pressed():
	if Globals.active == 3:
		Globals.active = 0
	else:
		Globals.active = 3
