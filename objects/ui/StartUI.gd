extends Control

signal begin_game

func _on_BeginButton_pressed():
	emit_signal("begin_game")