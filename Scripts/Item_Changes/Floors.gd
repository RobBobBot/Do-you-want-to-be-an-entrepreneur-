extends VBoxContainer

func _on_Button_pressed(arg):
	Globals.change_current_item(arg)


func _on_Floors_mouse_entered():
	Globals.active=1

func _on_Floors_mouse_exited():
	Globals.active=0
