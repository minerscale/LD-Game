extends RigidBody2D

var down_old
var down

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)
	set_fixed_process(true)
	
func _fixed_process(delta):
	down_old = down
	down = Input.is_action_pressed("jump")
	if (Input.is_action_pressed("move_left")):
		set_applied_force(Vector2(-40000*delta,0))
	elif (Input.is_action_pressed("move_right")):
		set_applied_force(Vector2(40000*delta,0))
	else:
		set_applied_force(Vector2(0,0))
	if (down && not down_old && get_linear_velocity().y == 0):
		apply_impulse(Vector2(0,0),Vector2(0,-300))

func _process(delta):
	pass
	
	