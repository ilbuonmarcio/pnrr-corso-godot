extends Node

@onready var winner_label = %WinnerLabel
@onready var reset_timer = %ResetTimer

var casella_scene = preload("res://assets/scenes/casella.tscn")
var nodes = []
var winner = 0
var reset_triggered = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	winner_label.visible = false
	
	for x in range(0, 3):
		nodes.append([])
		for y in range(0, 3):
			# print(x, y)
			var casella_instance = casella_scene.instantiate()
			add_child(casella_instance)
			
			casella_instance.position = Vector2(640 / 3 * x + 640 / 3 * 0.5, 640 / 3 * y + 640 / 3 * 0.5)
			casella_instance.z_index = -5
			
			nodes[x].append(casella_instance)
			

func verify_board() -> int:	
	# Verticali
	for x in range(0, 3):
		if nodes[x][0].state != 0 and (nodes[x][0].state == nodes[x][1].state and nodes[x][1].state == nodes[x][2].state):
			return nodes[x][0].state
			
	# Orizzontali
	for y in range(0, 3):
		if nodes[0][y].state != 0 and (nodes[0][y].state == nodes[1][y].state and nodes[1][y].state == nodes[2][y].state):
			return nodes[0][y].state
			
	# Diagonali
	if nodes[0][0].state == nodes[1][1].state and nodes[1][1].state == nodes[2][2].state:
		return nodes[0][0].state
	if nodes[0][2].state == nodes[1][1].state and nodes[1][1].state == nodes[2][0].state:
		return nodes[0][2].state
			
	return 0
	
func draw_winner(winner: int) -> void:
	if winner != 0:
		if winner == 1:
			winner_label.text = "Circle Won!"
		elif winner == 2:
			winner_label.text = "Cross Won!"
		else:
			pass
			
		winner_label.visible = true
		
		if not reset_triggered:
			reset_timer.start()
			reset_triggered = true

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()
		
	if winner == 0:
		winner = verify_board()
		
		if winner != 0:
			for x in range(0, 3):
				for y in range(0, 3):
					nodes[x][y].enabled = false
		
	draw_winner(winner)

func _on_reset_timer_timeout() -> void:
	get_tree().reload_current_scene()
