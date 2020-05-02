extends Control

onready var health_label = $HealthLabel

func set_health_label(health, max_health):
	health_label.text = "Ship Health: %d/%d" % [health, max_health] 