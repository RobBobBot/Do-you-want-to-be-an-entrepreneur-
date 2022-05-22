extends LineEdit

func _process(delta):# te rog sa ignori acest fisier
	if text.length()==0:
		return
	
	if text[0]=="0":
		var tmp = text
		tmp.erase(0,1)
		text = tmp
	
	for i in text.length():
		var isdigitagain: bool = text[i]>="0" and text[i] <="9"
		if !isdigitagain:
			var tmp = text
			tmp.erase(i,1)
			text = tmp
			return

func _on_Button_pressed(arg):
	var items:int = int(text)
	if Globals.money<Values.products[arg][0]*items:
		items=Globals.money/Values.products[arg][0]
	Globals.change_money(Values.products[arg][0]*items,Values.products[arg][1])
