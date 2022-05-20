extends PanelContainer

func _ready():
	visible=false

func _process(delta):
	if(Globals.active==5):
		visible=true
	else:
		visible=false
