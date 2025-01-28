extends Area2D

@onready var game_state = %GameState
@onready var animation_player = $AnimationPlayer

func _on_body_entered(body: Node2D) -> void:
	game_state.collect_coin()
	animation_player.play("coin_taken")
