extends Node

func _on_Button_pressed():
	var editor=Globals.editor_scene.instance()
	get_parent().add_child(editor)
	editor.get_node("TileMap").copy_data_into(editor.get_node("TileMap"))
	queue_free()
