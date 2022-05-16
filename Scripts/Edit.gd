extends LineEdit

func _process(delta):# te rog sa ignori acest fisier
	if text.length()==0:
		return
	
	if text[0]=="0":
		var tmp = text
		tmp.erase(0,1)
		text = tmp
	
	for i in text.length():
		var isdigitagain: bool = text[i]=="0" || text[i]=="1" || text[i]=="2" || text[i]=="3" || text[i]=="4" || text[i]=="5" || text[i]=="6" || text[i]=="7" || text[i]=="8" || text[i]=="9"
		if !isdigitagain:
			var tmp = text
			tmp.erase(i,1)
			text = tmp
			return

func _on_Button_pressed(arg):
	var items:int = int(text)
	for i in items:
		if Globals.change_money(Values.products[arg][0],Values.products[arg][1]):
			Values.stock[arg]+=1
		
