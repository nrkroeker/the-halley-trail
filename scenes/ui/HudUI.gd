extends Control

onready var health_label = $HBoxContainer/HealthLabel
var ship_name = "SS Independence"

func set_health_label(health, max_health):
	health_label.text = "%s Health: %d/%d" % [ship_name, health, max_health]
	health_label.rect_size = health_label.get_minimum_size()
	
func set_ship_name(name):
	ship_name = name