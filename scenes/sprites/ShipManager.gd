extends Spatial

onready var hud = get_parent().get_node("UIManager/HudUI")

var GUIDE_X_RANGE = 700
var GUIDE_Y_RANGE = 50.0
var SHIP_X_RANGE = 30.0
var SHIP_Y_RANGE = 50.0
var CAMERA_X_RANGE = 50.0
var CAMERA_Y_RANGE = 30.0

var CAMERA_OFFSET = Vector3(0,15,50)

onready var guide = $PositionGuide
onready var ship = $Ship
onready var camera = $Camera

var is_movable = false

var strafe_speed = 100
var forward_speed = 50
var is_turning_right = false
var is_turning_left = false

var z_rotation = 0.0
var max_z_rotation = 90.0

var health = 100
var max_health = 100

func _physics_process(delta):
	if (is_movable):
		self.translation.z -= delta * forward_speed
		get_input(delta)
		ship_movement()
		camera_movement()

func set_movement(movement_state):
	is_movable = movement_state

func get_input(delta):
	is_turning_right = false
	is_turning_left = false

	# Compute up/down force
	if Input.is_action_pressed("ui_up"):
		guide.transform.origin.y += -strafe_speed * delta
	if Input.is_action_pressed("ui_down"):
		guide.transform.origin.y += strafe_speed * delta
	
	# Compute left/right force
	if Input.is_action_pressed("ui_right"):
		guide.transform.origin.x += strafe_speed * delta
		is_turning_right = true
	if Input.is_action_pressed("ui_left"):
		guide.transform.origin.x += -strafe_speed * delta
		is_turning_left = true
	
	# Correct guide back to center if no longer turning
	if !is_turning_right and !is_turning_left:
		guide.transform.origin.x = lerp(guide.transform.origin.x, ship.transform.origin.x, 0.05)
		guide.transform.origin.y = lerp(guide.transform.origin.y, ship.transform.origin.y, 0.05)
	
	# Clamp guide within boundaries
	guide.transform.origin.x = clamp(guide.transform.origin.x, -GUIDE_X_RANGE, GUIDE_X_RANGE)
	guide.transform.origin.y = clamp(guide.transform.origin.y, -GUIDE_Y_RANGE, GUIDE_Y_RANGE)
	
func ship_movement():
	# Required rotation to point ships nose at guide
	var desired_rotation = ship.transform.looking_at(guide.transform.origin, Vector3.UP)
	# Quaternions???
	var rot = Quat(ship.transform.basis.get_rotation_quat()).slerp(desired_rotation.basis.get_rotation_quat(), 0.2)
	# Compute ships actual velocity
	var velocity = (guide.transform.origin + (Vector3.BACK*50)) - ship.transform.origin
	velocity = ship.move_and_slide(velocity, Vector3.UP)

	# Clamp ship movement back into boundaries 
	ship.transform.origin.x = clamp(ship.transform.origin.x, -SHIP_X_RANGE, SHIP_X_RANGE)
	ship.transform.origin.y = clamp(ship.transform.origin.y, -SHIP_Y_RANGE, SHIP_Y_RANGE)
	ship.set_transform(Transform(rot, ship.transform.origin))
	
	# Determine rotation about the y/forward axis
	if is_turning_right and !is_turning_left:
		z_rotation = lerp(z_rotation, max_z_rotation, 0.02)
	elif is_turning_left and !is_turning_right:
		z_rotation = lerp(z_rotation, -max_z_rotation, 0.02)
	else:
		z_rotation = lerp(z_rotation, 0, 0.05)
	
	ship.rotation_degrees.z = z_rotation

func camera_movement():
	var new_origin = lerp(camera.transform.origin, ship.transform.origin + CAMERA_OFFSET, 0.04)
	new_origin.x = clamp(new_origin.x, -CAMERA_X_RANGE, CAMERA_X_RANGE)
	new_origin.y = clamp(new_origin.y, -CAMERA_Y_RANGE, CAMERA_Y_RANGE)
	camera.transform.origin = new_origin
	

func _on_Ship_collision():
	health -= 1
	hud.set_health_label(hud.get_new_label(health, max_health))
	if health == 0:
		print("you lose!")
