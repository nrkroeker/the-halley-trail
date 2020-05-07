extends Control

onready var uiManager = get_parent()

func _on_ProceedButton_pressed():
	uiManager.transition_state("name")