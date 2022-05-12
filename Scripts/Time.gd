extends Label

func _updateText():
	
	var tmp1:String=str(Globals.hours)
	if tmp1.length()==1: 
		tmp1="0"+tmp1
		
	var tmp2:String=str(Globals.minutes)
	if tmp2.length()==1: 
		tmp2="0"+tmp2
		
	text=tmp1+":"+tmp2
	

func _ready():
	pass 

func _process(delta):
	_updateText()
	pass
