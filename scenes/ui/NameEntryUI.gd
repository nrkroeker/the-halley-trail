extends Control

onready var uiManager = get_parent()

func _on_ProceedButton_pressed():
	var name = $NameEdit.text
	if !name:
		name = "SS Independence"
	uiManager.set_ship_name(name)
	uiManager.transition_state("hud")