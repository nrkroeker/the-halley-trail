extends StaticBody

onready var explosion = get_node("Explosion/Particles")

var x_rotation = 1
var y_rotation = 1
var z_rotation = 1

func _ready():
	x_rotation = rand_range(-10, 10)
	y_rotation = rand_range(-10, 10)
	y_rotation = rand_range(-10, 10)

func _on_Area_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage()
		explosion.emitting = true
		$ExplosionTimer.start()

func _on_ExplosionTimer_timeout():
	self.queue_free()

func _process(delta):
	self.rotate_y(0.01 * x_rotation)
	self.rotate_z(0.01 * y_rotation)
	self.rotate_x(0.01 * z_rotation)