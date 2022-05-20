extends PanelContainer

func _process(delta):
	$Body/Stock.text = "Stock: " + str(Values.stock[Values.APPLE])
	$Body/Display.text = "On display: " + str(Values.display[Values.APPLE])
