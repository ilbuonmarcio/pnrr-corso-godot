extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -475.0
const JUMP_TIMEOUT_DELTA = 300

var jump_timeout = Time.get_ticks_msec()


func _physics_process(delta: float) -> void:
	velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and \
		Time.get_ticks_msec() - jump_timeout > JUMP_TIMEOUT_DELTA:
		velocity.y = JUMP_VELOCITY
		jump_timeout = Time.get_ticks_msec()
		
	# Set angle based on velocity
	rotation = remap(velocity.y, JUMP_VELOCITY, -JUMP_VELOCITY, deg_to_rad(-30), deg_to_rad(55))

	move_and_slide()
