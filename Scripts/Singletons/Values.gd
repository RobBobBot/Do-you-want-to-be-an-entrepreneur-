extends Node

const items = [
	[-10,"Wooden floor",preload ("res://Sprites/wooden_floor.png")],
	[-15,"Wooden wall",preload ("res://Sprites/wooden_wall.png") ]
]

const products = {
	"apple":[-1,"Apple"],
	"banana":[-2,"Banana"],
	"blueberry":[-3,"Blueberry"]
}

var stock = []

func _ready():
	for i in products.size():
		stock.append(0)
