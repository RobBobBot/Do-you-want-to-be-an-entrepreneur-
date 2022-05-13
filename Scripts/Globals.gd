extends Node

var money:int=10000
var seconds:float=0
var minutes:int=0
var hours:int=0

func _ready():
	currentItem = 0
	
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

signal transaction

func change_money(amount:int,item) -> void:
	money+=amount
	emit_signal("transaction",amount,item)
	
func _input(event):
	if event is InputEventKey && event.scancode == KEY_ESCAPE:
		change_current_item(-1)

var currentItem = -1
	
const items = [
	[-10,"Wooden floor",preload ("res://Sprites/wooden_floor.png")],
	[-15,"Wooden wall",preload ("res://Sprites/wooden_wall.png") ]
]

func change_current_item(var itemid):
	currentItem = itemid
