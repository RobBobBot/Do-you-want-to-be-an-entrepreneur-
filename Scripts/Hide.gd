extends PanelContainer

func _ready():
	visible=false

func _on_Button_pressed():
	if visible:
		visible=false
	else:
		visible=true
