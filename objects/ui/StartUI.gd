extends Control

signal transition

func _on_BeginButton_pressed():
	emit_signal("transition")