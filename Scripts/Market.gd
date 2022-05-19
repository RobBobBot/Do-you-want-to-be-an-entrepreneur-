extends Control

func _on_Button_pressed():
	get_parent().get_node("EditorScene").show_editor()
	queue_free()
