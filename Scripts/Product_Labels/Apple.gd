extends PanelContainer

func _process(delta):
	$Body/Stock.text = "Stock: " + str(Values.stock[Values.APPLE])
	$Body/Label3.text = "Price: " + str(Values.sell_cost[Values.APPLE])

func _on_Button_pressed():
	var items:int = int($Body/LineEdit.text)
	if Globals.money<Values.buy_cost[Values.APPLE]*items:
		items=Globals.money/Values.buy_cost[Values.APPLE]
	Globals.change_money(Values.products[Values.APPLE][0]*items,Values.products[Values.APPLE][1])
	Values.stock[Values.APPLE]+=items


func _on_Button2_pressed():
	var price:int = int($Body/LineEdit2.text)
	Values.sell_cost[Values.APPLE]=price
