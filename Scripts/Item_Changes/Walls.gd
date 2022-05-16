extends VBoxContainer

func _on_Button_pressed(arg):
	Globals.change_current_item(arg)


func _on_Walls_mouse_entered():
	Globals.active=2


func _on_Walls_mouse_exited():
	Globals.active=0
