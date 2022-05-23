extends Node

const items = [ 
	[-10,"Wooden floor",preload ("res://Sprites/wooden_floor.png")],
	[-15,"Wooden wall",preload ("res://Sprites/wooden_wall.png")],
	[-20,"Tall wooden wall", preload ("res://Sprites/wooden_wall_var_2.png")],
	[-100,"Basket", preload ("res://Sprites/empty_basket.png")],
	[],
	[-20,"Box",preload ("res://Sprites/storage_space.png")]
]

enum {
	APPLE=1,
	BANANA=2,
	BLUEBERRY=3
}

const products = {
	APPLE:[-1,"Apple"],
	BANANA:[-2,"Banana"],
	BLUEBERRY:[-3,"Blueberry"]
}

var stock = {
	APPLE:0,
	BANANA:0,
	BLUEBERRY:0
}

var display = {
	APPLE:0,
	BANANA:0,
	BLUEBERRY:0
}

var sell_cost = {
	APPLE:5,
	BANANA:25,
	BLUEBERRY:50
}

var buy_cost = {
	APPLE:1,
	BANANA:5,
	BLUEBERRY:10
}

var emplyees = [
	[2,-3,0.7,0.7,0.1,"Kristov",Emplyee.idle],
	[0,-3,0.5,0.5,0.5,"Vladimir",Emplyee.housing],
	[1,-2,0.2,0.5,0.7,"Masha",Emplyee.moving_boxes],
]

func _ready():
	pass
	
var tiles:TileSet

var editor_tilemap:EditableMap=EditableMap.new()

var popularity:float = 1.00
var offset:float = 0

var clients = 0
