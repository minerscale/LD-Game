extends RigidBody2D

var xvel = 0
var yvel = 0

var time = 0

var fuel = 1

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	if (Input.is_action_pressed("move_left")):
		xvel = -100000*delta
	elif (Input.is_action_pressed("move_right")):
		xvel = 100000*delta
	else:
		xvel = 0
	if (Input.is_action_pressed("jump") && fuel > 0):
		yvel = -40000*delta
		fuel -= 0.3 * delta
		get_node("Sprite/AnimatedSprite").set_hidden(false)
	else:
		yvel = 0
		if (fuel < 1 && Input.is_action_pressed("jump") == false):
			fuel += 0.3 * delta
		get_node("Sprite/AnimatedSprite").set_hidden(true)
	
	set_applied_torque(xvel)
	set_applied_force(Vector2(yvel*(sin(get_rot())),yvel*(cos(get_rot()))))
	
	if(get_pos().y >= 470 || get_pos().y <= -470 || get_pos().x >= 800 || get_pos().x <= -800):
		get_node("/root/globals").setScene("res://scenes/DeathScreen.tscn")
	time = time + delta
	Globals.set("TIME",time)