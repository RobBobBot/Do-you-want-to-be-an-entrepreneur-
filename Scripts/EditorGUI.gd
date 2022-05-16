extends Control

signal pressed

func _ready():
	pass 

func _on_Button_pressed():
	emit_signal("pressed")
