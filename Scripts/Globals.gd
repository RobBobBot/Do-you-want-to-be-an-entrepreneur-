extends Node

var money:int=10000

signal money_changed

func change_money(amount:int) -> void:
	emit_signal("money_changed")
	money+=amount
