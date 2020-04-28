extends KinematicBody

var is_movable = false

var speed = 10

var velocity = Vector3()

func set_movement(new_movement):
	is_movable = new_movement

func get_input():
	if Input.is_action_pressed("ui_left"):
		velocity.x -= speed
	if Input.is_action_pressed("ui_right"):
		velocity.x += speed
	if Input.is_action_pressed("ui_up"):
		velocity.z += speed * 2
	if Input.is_action_pressed("ui_down"):
		velocity.z -= speed * 2
		
func _physics_process(delta):
	velocity.y = 0
	velocity.z = 0
	if is_movable:
		get_input()
	velocity = move_and_slide(velocity, Vector3.UP)