extends Label

func _updateText():
	text=str(Globals.money)+" Euro"

func _ready():
	pass
	
func _process(delta):
	_updateText()
