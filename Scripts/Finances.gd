extends VBoxContainer

var tmp = preload("res://Scripts/Destroy.gd")

func _add(delta):
	var label = Label.new()
	label.text = str(delta)
	if delta<0:
		label.add_color_override("font_color",Color(255,0,0))
	else: 
		label.text="+"+label.text
		label.add_color_override("font_color",Color(0,255,0))
	label.set_script(tmp)
	label.align=Label.ALIGN_CENTER
	add_child(label)

func _ready():
	Globals.connect("transaction",self,"_add")
	pass 

func _process(delta):
	pass
