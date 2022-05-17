extends VBoxContainer

func _on_Button_pressed(arg):
	Globals.change_current_item(arg)

func _on_Objects_mouse_entered():
	Globals.active=3


func _on_Objects_mouse_exited():
	Globals.active=0
