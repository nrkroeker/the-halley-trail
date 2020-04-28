extends Spatial

onready var guide = $PositionGuide
onready var ship = $Ship
onready var camera = $Camera

var is_movable = false

var strafe_speed = 50
var is_turning_right = false
var is_turning_left = false

var y_rotation = 0.0
var max_y_rotation = 90.0

func _physics_process(delta):
	if (is_movable):
		
		get_input(delta)
		ship_movement()
		camera_movement()

func set_movement(movement_state):
	is_movable = movement_state

func get_input(delta):
	is_turning_right = false
	is_turning_left = false
	if Input.is_action_pressed("ui_up"):
		guide.transform.origin.z += -strafe_speed * delta
	if Input.is_action_pressed("ui_down"):
		guide.transform.origin.z += strafe_speed * delta
	
	if Input.is_action_pressed("ui_right"):
		guide.transform.origin.x += strafe_speed * delta
		is_turning_right = true

	if Input.is_action_pressed("ui_left"):
		guide.transform.origin.x += -strafe_speed * delta
		is_turning_left = true
	
	if !is_turning_right and !is_turning_left:
		guide.transform.origin.x = lerp(guide.transform.origin.x, ship.transform.origin.x, 0.05)
		guide.transform.origin.z = lerp(guide.transform.origin.z, ship.transform.origin.z, 0.05)
	
	guide.transform.origin.x = clamp(guide.transform.origin.x, -100.0, 100.0)
	guide.transform.origin.z = clamp(guide.transform.origin.z, -70.0, 70.0)
	
func ship_movement():
	var desired_rotation = ship.transform.looking_at(guide.transform.origin, Vector3(0,0,1))
	var rot = Quat(ship.transform.basis.get_rotation_quat()).slerp(desired_rotation.basis.get_rotation_quat(), 0.2)
	var velocity = (guide.transform.origin + Vector3(0,50,0)) - ship.transform.origin
	velocity = ship.move_and_slide(velocity, Vector3(0,0,-1))
	ship.transform.origin.x = clamp(ship.transform.origin.x, -70.0, 70.0)
	ship.transform.origin.z = clamp(ship.transform.origin.z, -50.0, 50.0)
	ship.set_transform(Transform(rot, ship.transform.origin))
	
	# Determine rotation about the y/forward axis
	if is_turning_right and !is_turning_left:
		y_rotation = lerp(y_rotation, max_y_rotation, 0.02)
	elif is_turning_left and !is_turning_right:
		y_rotation = lerp(y_rotation, -max_y_rotation, 0.02)
	else:
		y_rotation = lerp(y_rotation, 0, 0.05)
	
	ship.rotation_degrees.y = y_rotation

func camera_movement():
	var origin = lerp(camera.transform.origin, ship.transform.origin + Vector3(0,-50,10), 0.04)
	origin.x = clamp(origin.x, -50.0, 50.0)
	origin.z = clamp(origin.z, -30.0, 30.0)
	camera.transform.origin = origin