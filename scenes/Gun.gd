extends Node2D

var bullet_scene
var bullet_time = 0
var gunx = 760
var velocity = 30
var time_bullet = 5

var whichGun

func _ready():
	bullet_scene = load("res://scenes/Bullet.tscn")
	set_process(true)
	if (get_name() == "Gun1"):
		gunx = -760

func _process(delta):
	bullet_time = bullet_time + 1 * delta
	if (bullet_time >= time_bullet):
		bullet_time = 0
		if (time_bullet <= 1):
			time_bullet = 2
		time_bullet = time_bullet - 1
		var bi = bullet_scene.instance()
		get_parent().add_child(bi)
		bi.set_pos(get_pos())
		bi.set_linear_velocity(((get_node("../Player").get_global_pos() - get_global_pos()).normalized())*velocity)
	set_rot(get_pos().angle_to_point(get_node("../Player").get_pos()))
	set_pos(Vector2(gunx,sin(Globals.get("TIME"))*450))
	velocity = (Globals.get("TIME") * 5)+300
