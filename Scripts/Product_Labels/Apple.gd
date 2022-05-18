extends PanelContainer

func _process(delta):
	$Body/Stock.text = "Stock: " + str(Values.stock[0])
	$Body/Display.text = "On display: " + str(Values.display[0])
