extends Button

func _process(delta):
	if Globals.hours<20:
		flat=true
		text=""
		mouse_filter=Control.MOUSE_FILTER_IGNORE
	else:
		flat=false
		text="End day"
		mouse_filter=Control.MOUSE_FILTER_PASS
	pass
