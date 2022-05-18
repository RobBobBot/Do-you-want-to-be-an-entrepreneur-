extends Node

const items = [ 
	[-10,"Wooden floor",preload ("res://Sprites/wooden_floor.png")],
	[-15,"Wooden wall",preload ("res://Sprites/wooden_wall.png")],
	[-20,"Tall wooden wall", preload ("res://Sprites/wooden_wall_var_2.png")],
	[-100,"Basket", preload ("res://Sprites/empty_basket.png")]
]

const products = [
	[-1,"Apple"]
]

var stock = [
	
]

var display = [
	
]

func _ready():
	for i in products.size():
		stock.append(0)
		display.append(0)
		
var tiles = {
	
}

