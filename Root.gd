extends Spatial

var ui_state = "start"

func _on_StartUI_begin_game():
	ui_state = "intro"
	$StartUI.hide()
	$IntroUI.show()

func _on_game_start():
	#set_current_camera("back")
	$ShipManager.set_movement(true)
	$MeteorSpawner.start()
	#$MeteorSpawner.set_spawning(true)

func _on_game_reset():
	#set_current_camera("front")
	$ShipManager.set_movement(false)

func set_current_camera(perspective):
	match perspective:
		"back":
			$BackCamera.make_current()
			$SpacecraftAnimation.stop()
		"side":
			$SideCamera.make_current()
