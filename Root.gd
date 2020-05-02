extends Spatial

func _on_game_start():
	#set_current_camera("back")
	$ShipManager.set_movement(true)
	$MeteorSpawner.start()
	$MeteorSpawner.set_spawning(true)
	$EncounterManager.begin_cycle()

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
