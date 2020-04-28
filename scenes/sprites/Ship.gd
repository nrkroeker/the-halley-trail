extends KinematicBody

signal collision

func take_damage():
	emit_signal("collision")
	