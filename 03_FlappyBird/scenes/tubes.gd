extends Node2D

const SPEED = 140

func prepare() -> void:
	position.x = 400
	position.y = 360 + randf_range(-180, 180)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	prepare()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position.x -= SPEED * delta 

func _on_upper_tube_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		get_tree().reload_current_scene()
		
func _on_lower_tube_body_entered(body: Node2D) -> void:
	if body.name == "Player":
		get_tree().reload_current_scene()
