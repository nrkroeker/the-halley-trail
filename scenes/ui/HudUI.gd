extends Control

onready var health_label = $HealthLabel

func set_health_label(new_health_label):
	health_label.text = new_health_label

func get_new_label(current_health, max_health):
	return "Ship Health: %d/%d" % [current_health, max_health] 