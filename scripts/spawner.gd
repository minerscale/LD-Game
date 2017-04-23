extends Node

var side = 0
var shit_scene

var spawn_times = 0

func _ready():
	shit_scene = load("res://scenes/shit.tscn")
	set_fixed_process(true)

func _fixed_process(delta):
	spawn_times = spawn_times + (1 * delta)
	if (spawn_times >= 10):
		spawn_times = 0
		var si = shit_scene.instance()
		add_child(si)
		if (side == 1):
			si.set_pos(Vector2(384,-466))
			side = 0
		else:
			si.set_pos(Vector2(-384,-466))
			side = 1
