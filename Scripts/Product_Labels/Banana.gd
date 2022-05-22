extends PanelContainer

func _process(delta):
	$Body/Stock.text = "Stock: " + str(Values.stock[Values.BANANA])
	$Body/Label3.text = "Price: " + str(Values.sell_cost[Values.BANANA])

func _on_Button_pressed():
	var items:int = int($Body/LineEdit.text)
	if Globals.money<Values.buy_cost[Values.BANANA]*items:
		items=Globals.money/Values.buy_cost[Values.BANANA]
	Globals.change_money(-Values.buy_cost[Values.BANANA]*items,Values.products[Values.BANANA][1])
	Values.stock[Values.BANANA]+=items


func _on_Button2_pressed():
	var price:int = int($Body/LineEdit2.text)
	Values.sell_cost[Values.BANANA]=price
