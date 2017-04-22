extends RigidBody2D

var xvel = 0
var yvel = 0

var time = 0

var fuel = 1

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	if (Input.is_action_pressed("move_left")):
		xvel = -40000*delta
	elif (Input.is_action_pressed("move_right")):
		xvel = 40000*delta
	else:
		xvel = 0
	if (Input.is_action_pressed("jump") && fuel > 0):
		yvel = -60000*delta
		fuel -= 1 * delta
		get_node("Sprite/Sprite").set_hidden(false)
	else:
		yvel = 0
		if (fuel < 1):
			fuel += 0.5 * delta
		get_node("Sprite/Sprite").set_hidden(true)
	
	set_applied_force(Vector2(xvel,yvel))
	if(get_pos().y >= 500):
		Globals.set("TIME",time)
		get_node("/root/globals").setScene("res://scenes/DeathScreen.tscn")
	get_global_pos()
	time = time + delta
