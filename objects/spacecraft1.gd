extends KinematicBody

var is_movable = false

var speed = 10

var velocity = Vector3()

func set_movement(new_movement):
	is_movable = new_movement

func get_input():
	if Input.is_action_pressed("ui_left"):
		velocity.z += speed
	if Input.is_action_pressed("ui_right"):
		velocity.z -= speed
	if Input.is_action_pressed("ui_up"):
		velocity.y += speed
	if Input.is_action_pressed("ui_down"):
		velocity.y -= speed
		
func _physics_process(delta):
	velocity.y = 0
	velocity.z = 0
	if is_movable:
		get_input()
	velocity = move_and_slide(velocity, Vector3.UP)