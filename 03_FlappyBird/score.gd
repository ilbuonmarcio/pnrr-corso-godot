extends Node2D

var score = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var unita = score % 10
	var decine = (score - unita) / 10
	
	get_node("Unita").frame = unita
	get_node("Decine").frame = decine


func _on_timer_timeout() -> void:
	score += 1
