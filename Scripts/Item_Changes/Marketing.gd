extends Node

func _on_Button_pressed(deltamoney, button_name, product_name,increase):
	if Globals.change_money(deltamoney,product_name):
		Values.popularity*=increase
		($PanelContainer/ScrollContainer/VBoxContainer.get_node(button_name) as Button).visible=false

func _on_Marketing_mouse_entered():
	Globals.active=5

func _on_Marketing_mouse_exited():
	Globals.active=0
