extends Label

var money=100000;

func _updateText():
	text=str(money)+" Euro"

func _deltaMoney(var delta):
	money+=delta
	_updateText()

func _ready():
	pass 

func _process(delta):
	pass
