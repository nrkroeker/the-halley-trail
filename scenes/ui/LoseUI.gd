extends Control

onready var uiManager = get_parent()

func _on_RestartButton_pressed():
	uiManager.transition_state("start")
