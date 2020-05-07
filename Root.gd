extends Spatial

func _on_game_start():
	$ShipManager.set_movement(true)
	$ShipManager.reset_health()
	$EncounterManager.begin_cycle()

func _on_game_win():
	$UI/UIManager.transition_state("win")
	$ShipManager.set_movement(false)

func _on_game_lose():
	$EncounterManager.end_cycle()
	$UI/UIManager.transition_state("lose")
	$ShipManager.set_movement(false)