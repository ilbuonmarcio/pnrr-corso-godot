extends Camera2D

@onready var game_state = %GameState
@onready var you_won_label = $YouWonLabel

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	print(game_state)
	# you_won_label.visible = true
