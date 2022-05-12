extends Node

var money:int=10000
var seconds:float=0
var minutes:int=0
var hours:int=0

signal transaction

func change_money(amount:int) -> void:
	money+=amount
	emit_signal("transaction",amount)
	
func _process(delta):
	seconds+=delta
	
	if seconds>=1:
		seconds=0
		minutes+=1
		
	if minutes==60:
		minutes=0
		hours+=1
	
	if hours==24:
		hours=0
		
