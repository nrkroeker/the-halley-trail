extends Control

signal game_start
signal game_reset

var ui_state = "start"

func _on_UI_transition():
	match ui_state:
		"start":
			ui_state = "intro"
			$StartUI.hide()
			$IntroUI.show()
		"intro":
			ui_state = "name"
			$IntroUI.hide()
			$NameEntryUI.show()
		"name":
			ui_state = "hud"
			$NameEntryUI.hide()
			$HudUI.show()
			emit_signal("game_start")
		"hud":
			$HudUI.hide()
			$StartUI.show()
			emit_signal("game_reset")
