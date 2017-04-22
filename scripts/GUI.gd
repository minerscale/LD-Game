extends Control

var fuel

var time = 0

func _ready():
	set_process(true)

func _process(delta):
	fuel = get_node("../../Player").get("fuel")
	get_node("Label").set_text("Fuel: " + str(int(fuel*100)))
	time = get_node("../../Player").get("time")
	get_node("Label 2").set_text("Time: " + str(int(time)))