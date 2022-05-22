extends Control

signal pressed
signal market

func _ready():
	pass 

func _on_Button_pressed():
	emit_signal("pressed")

func _Market_button_pressed():
	emit_signal("market")

func hide_all():
	hide()
	$CanvasLayer/Top.hide()
	$CanvasLayer/Items.hide()
	$CanvasLayer/Button.hide()

func show_all():
	show()
	$CanvasLayer/Top.show()
	$CanvasLayer/Items.show()
	$CanvasLayer/Button.show()
