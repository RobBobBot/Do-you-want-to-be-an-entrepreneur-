extends Node

const items = [ 
	[-10,"Wooden floor",preload ("res://Sprites/wooden_floor.png")],
	[-15,"Wooden wall",preload ("res://Sprites/wooden_wall.png")],
	[-20,"Tall wooden wall", preload ("res://Sprites/wooden_wall_var_2.png")],
	[-100,"Basket", preload ("res://Sprites/empty_basket.png")]
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
	APPLE:10,
	BANANA:30,
	BLUEBERRY:60
	
}

var emplyees = [
	[0,-3,0.5,0.5,0.5,"Emplyee"],
	[0,-2,0.5,0.5,0.5,"Emplyee"]
	
]

func _ready():
	pass
	
var tiles:TileSet

var popularity:float = 1.00
var offset:float = 0
