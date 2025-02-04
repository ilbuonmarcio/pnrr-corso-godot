extends Node

const TUBES_SPAWN_DELAY = 1500
var tubes_spawned_at = 0

var tubes_scene = preload("res://scenes/tubes.tscn")

func instantiate_tube():
	var instance = tubes_scene.instantiate()
	instance.prepare()
	add_child(instance)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	instantiate_tube()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	tubes_spawned_at += delta * 1000
	if tubes_spawned_at > TUBES_SPAWN_DELAY:
		instantiate_tube()
		tubes_spawned_at = 0
