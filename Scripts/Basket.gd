extends Interactable
class_name Basket

export var held_item:=0
var sprites=[
	preload("res://Sprites/empty_basket.png"),
	preload("res://Sprites/apple_basket.png"),
	preload("res://Sprites/banana_basket.png"),
	preload("res://Sprites/berry_basket.png")
]

func _ready():
	$Sprite/EmptyBasket.texture=sprites[held_item]
	if held_item!=0:
		Values.display[held_item]+=1

func empty():
	#held_item=1
	Globals.change_money(Values.sell_cost[held_item]," apples bought")
	Values.display[held_item]-=1
	held_item=0
	$Sprite/EmptyBasket.texture=sprites[held_item]

func fill(item:int):
	held_item=item
	Values.display[held_item]+=1
	$Sprite/EmptyBasket.texture=sprites[held_item]
