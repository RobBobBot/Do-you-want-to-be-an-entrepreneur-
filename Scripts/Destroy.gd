extends Label

func _ready():
	get_tree().create_timer(5).connect("timeout",self,"queue_free")
