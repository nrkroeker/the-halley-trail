extends Control

signal transition

func _on_ProceedButton_pressed():
	emit_signal("transition")