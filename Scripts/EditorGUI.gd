extends Control

signal pressed
signal market

func _ready():
	pass 

func _on_Button_pressed():
	emit_signal("pressed")

func _Market_button_pressed():
	emit_signal("market")
