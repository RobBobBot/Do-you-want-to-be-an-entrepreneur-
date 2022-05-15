extends VBoxContainer

var tmp = preload("res://Scripts/Destroy.gd")

func _add(delta,item):
	var label = Label.new()
	label.text = str(delta) + " " + item
	if delta<0:
		label.add_color_override("font_color",Color(255,0,0))
	else: 
		label.text="+"+label.text
		label.add_color_override("font_color",Color(0,255,0))
	label.set_script(tmp)
	label.align=Label.ALIGN_CENTER
	if get_child_count()>=6:
		remove_child(get_children()[1])
	add_child(label)

func _ready():
	Globals.connect("transaction",self,"_add")
	pass 

func _process(delta):
	pass
