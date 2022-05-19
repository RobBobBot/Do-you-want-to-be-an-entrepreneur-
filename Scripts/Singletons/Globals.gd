extends Node

const daytime_scene:PackedScene=preload("res://Scenes/Enviorments/DaytimeScene.tscn")
const editor_scene:PackedScene=preload("res://Scenes/Enviorments/EditorScene.tscn")
const market_scene:PackedScene=preload("res://Scenes/Market/Market.tscn")

const window_size=Vector2(1024,600)

var money:int=100000
var seconds:float=0
var minutes:int=0
var hours:int=0

var rng:RandomNumberGenerator=RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	current_item = -1
	
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

func change_money(amount:int,item) -> bool:
	if money+amount < 0 :
		return false
	money+=amount
	emit_signal("transaction",amount,item)
	return true
	
func _input(event):
	if event is InputEventKey && event.scancode == KEY_ESCAPE:
		change_current_item(-1)

var current_item = -1

func change_current_item(itemid):
	current_item = itemid

var active # 0-none, 1-floors, 2-walls, 3-objects 4-employees 5-Marketing

func spawn_customer() -> bool:
	return rng.randf_range(0.0,1000.0)<Values.popularity
	pass

