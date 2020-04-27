extends Spatial

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var t = $Camera.transform
	t = t.rotated(Vector3(0,1,0), deg2rad(-0.3))
	$Camera.transform = t
	var t2 = $Spacecraft.transform
	t2 = t2.rotated(Vector3(0,1,0), deg2rad(-0.3))
	$Spacecraft.transform = t2