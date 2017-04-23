extends Node2D

var rot = 0
var speed = 0

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)

func _fixed_process(delta):
	speed = speed + 1 * delta
	rot = rot + -(speed * delta)
	set_rotd(rot)
	