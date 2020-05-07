extends Control

signal game_start

var ui_state = "start"

func transition_state(new_state):
	match ui_state:
		"start":
			$StartUI.hide()
		"intro":
			$IntroUI.hide()
		"name":
			$NameEntryUI.hide()
		"hud":
			$HudUI.hide()
		"lose":
			$LoseUI.hide()
	ui_state = new_state
	match new_state:
		"start":
			$StartUI.show()
		"intro":
			$IntroUI.show()
		"name":
			$NameEntryUI.show()
		"hud":
			emit_signal("game_start")
			$HudUI.show()
		"lose":
			$LoseUI.show()

func set_ship_name(name):
	$HudUI.set_ship_name(name)