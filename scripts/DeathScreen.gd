extends Label

var time = Globals.get("TIME")

func _ready():
	if (time < 60):
		set_text("You suck! You only lasted " + str(int(time)) + " seconds!")
	else:
		set_text("You win! You lasted " + str(int(time)) + " seconds! :) :)")

func _on_Button_pressed():
	get_node("/root/globals").setScene("res://scenes/main.tscn")
