extends Node2D

# Stati disponibili: 0 (vuoto), 1 (cerchio), 2 (croce)
var state = 0
var enabled = true

var mouseInside = false

@onready var texture_vuoto = $Vuoto
@onready var texture_cerchio = $Cerchio
@onready var texture_croce = $Croce

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	texture_cerchio.visible = false
	texture_croce.visible = false

func draw_current_state() -> void:
	if state == 0:
		texture_vuoto.visible = true
		texture_cerchio.visible = false
		texture_croce.visible = false
	elif state == 1:
		texture_vuoto.visible = false
		texture_cerchio.visible = true
		texture_croce.visible = false
	elif state == 2:
		texture_vuoto.visible = false
		texture_cerchio.visible = false
		texture_croce.visible = true
	else:
		pass # state not compatible

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if enabled and mouseInside and Input.is_action_just_pressed("mouse_click"):
		# print("Node clicked!")
		state += 1
		state %= 3 # Limitarlo agli stati compatibili 0, 1, 2
		
	draw_current_state()

func _on_mouse_entered() -> void:
	mouseInside = true
	
func _on_mouse_exited() -> void:
	mouseInside = false
