extends VBoxContainer

func _on_Button_pressed(arg):
	Globals.change_current_item(arg)

func _on_Employees_mouse_entered():
	Globals.active=4


func _on_Employees_mouse_exited():
	Globals.active=0
