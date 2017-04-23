extends KinematicBody2D

var velocity = 0

func _ready():
	set_fixed_process(true)

func _fixed_process(delta):
	velocity = velocity + 0.5*delta
	set_pos(Vector2(self.get_pos().x,self.get_pos().y+velocity))
	if (get_pos().y >= 500):
		queue_free()