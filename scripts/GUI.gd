extends Control

var fuel

func _ready():
	set_process(true)

func _process(delta):
	fuel = get_node("../../Player").get("fuel")
	get_node("Label").set_text("fuel: " + str(int(fuel*100)))