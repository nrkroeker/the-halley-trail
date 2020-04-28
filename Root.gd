extends Spatial

var ui_state = "start"

func _on_StartUI_begin_game():
	ui_state = "intro"
	$StartUI.hide()
	$IntroUI.show()

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
			set_current_camera("back")
			$Spacecraft.set_movement(true)
			$WorldEnvironment/WorldAnimation.stop()
		"hud":
			$HudUI.hide()
			$StartUI.show()
			set_current_camera("front")
			$Spacecraft.set_movement(false)

func set_current_camera(perspective):
	match perspective:
		"back":
			$BackCamera.make_current()
			$SpacecraftAnimation.stop()
		"side":
			$SideCamera.make_current()
