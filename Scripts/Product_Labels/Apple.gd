extends PanelContainer

func _process(delta):
	$Body/Stock.text = "Stock: " + str(Values.stock[Values.APPLE])
