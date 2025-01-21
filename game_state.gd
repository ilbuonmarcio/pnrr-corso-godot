extends Node

var coins_left = 3
@onready var you_won_timer = $YouWonTimer

func completed():
	return coins_left <= 0

func collect_coin():
	coins_left -= 1
	print("Coins remaining: ", coins_left)
	
	if completed():
		you_won_timer.start()
