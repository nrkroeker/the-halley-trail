extends StaticBody

onready var explosion = get_node("Explosion/Particles")

func _on_Area_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage()
		explosion.emitting = true
		$ExplosionTimer.start()


func _on_ExplosionTimer_timeout():
	self.queue_free()

