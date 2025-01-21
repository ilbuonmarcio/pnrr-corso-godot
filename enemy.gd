extends Node2D

var direction = 1

@onready var raycast_left = $RayCastLeft
@onready var raycast_right = $RayCastRight
@onready var animated_sprite = $AnimatedSprite2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if raycast_right.is_colliding():
		direction *= -1
		animated_sprite.flip_h = true
	if raycast_left.is_colliding():
		direction *= -1
		animated_sprite.flip_h = false
	
	position.x += 50 * delta * direction
