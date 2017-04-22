extends Label

var time = Globals.get("TIME")

func _ready():
	set_text("You suck! You only lasted " + str(int(time)) + " seconds!")
