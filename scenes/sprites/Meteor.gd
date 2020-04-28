extends StaticBody

func _on_Area_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage()
