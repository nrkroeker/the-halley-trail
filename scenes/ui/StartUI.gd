extends Control

onready var uiManager = get_parent()

func _on_BeginButton_pressed():
	uiManager.transition_state("intro")