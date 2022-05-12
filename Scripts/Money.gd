extends Label

func _updateText():
	text=str(Globals.money)

func _ready():
	Globals.connect("money_changed",self,"_updateText")

func _process(delta):
	pass
