extends Node



func _on_Button_pressed(deltamoney, button_name, product_name,increase):
	if Globals.change_money(deltamoney,product_name):
		Values.popularity*=increase
		($PanelContainer/ScrollContainer/VBoxContainer.get_node(button_name) as Button).visible=false
	pass # Replace with function body.
