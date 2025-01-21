extends CharacterBody2D

@onready var animated_sprite = $AnimatedSprite2D
@onready var game_state = %GameState
@onready var you_won_label = $YouWonLabel
@onready var jump_sound = $AudioStreamPlayer2D

const SPEED = 120.0
const JUMP_VELOCITY = -350.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _process(delta):
	if game_state.completed():
		you_won_label.visible = true


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta
		animated_sprite.play("jump")

	# Handle jump.
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump_sound.play()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("move_left", "move_right")
	
	if direction == -1:
		animated_sprite.flip_h = true
		animated_sprite.play("run")
	elif direction == 1:
		animated_sprite.flip_h = false
		animated_sprite.play("run")
	else:
		animated_sprite.play("idle")
	
	var actual_speed = SPEED
	if Input.is_action_pressed("run"):
		actual_speed *= 2
	
	if direction:
		velocity.x = direction * actual_speed
	else:
		velocity.x = move_toward(velocity.x, 0, actual_speed)

	move_and_slide()
