extends PanelContainer

func _ready():
	visible=false

func _process(delta):
	if(Globals.active==4):
		visible=true
	else:
		visible=false
