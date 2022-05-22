extends PanelContainer

func _process(delta):
	$Body/Stock.text = "Stock: " + str(Values.stock[Values.BLUEBERRY])
	$Body/Label3.text = "Price: " + str(Values.sell_cost[Values.BLUEBERRY])

func _on_Button_pressed():
	var items:int = int($Body/LineEdit.text)
	if Globals.money<Values.buy_cost[Values.BLUEBERRY]*items:
		items=Globals.money/Values.buy_cost[Values.BLUEBERRY]
	Globals.change_money(-Values.buy_cost[Values.BLUEBERRY]*items,Values.products[Values.BLUEBERRY][1])
	Values.stock[Values.BLUEBERRY]+=items


func _on_Button2_pressed():
	var price:int = int($Body/LineEdit2.text)
	Values.sell_cost[Values.BLUEBERRY]=price
