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
	Globals.hours=8
	pass 

func _process(delta):
	if Globals.hours==22:
		return
	
	Globals.seconds+=delta
	
	if Globals.seconds>=1:
		Globals.seconds-=1
		Globals.minutes+=1
		
	if Globals.minutes>=60:
		Globals.minutes-=60
		Globals.hours+=1
	
	if Globals.hours==24:
		Globals.hours=0
	
	_updateText()
