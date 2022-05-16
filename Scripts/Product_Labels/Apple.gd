extends Label

func _process(delta):
	text = "Stock: " + str(Values.stock[0])
