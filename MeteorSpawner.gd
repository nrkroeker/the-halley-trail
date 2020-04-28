extends Timer

var meteor_scene = preload('res://scenes/sprites/Meteor.tscn')
var meteor_count = 0
var meteor_spawn_rate = 80
var max_meteors = 100

onready var ship_manager = get_parent().get_node("ShipManager")

var meteor_spawn_distance = -100 # z coordinate far enough ahead of ship

var is_spawning = false

func _ready():
	connect("timeout",self,"_on_timeout")
	# zone = $MeteorZone

func set_spawning(new_state):
	is_spawning = new_state

func reset():
	meteor_count = 0

func remove_meteor():
	meteor_count -= 1

func _on_timeout():
	if is_spawning == true and meteor_count < max_meteors:
		var spawn = rand_range(0, 100)
		if spawn <= meteor_spawn_rate:
			var item = meteor_scene.instance()
			# Range on x and z axes within spaceship walls, with y set far enough for them to look small
			var ship_location = ship_manager.ship.translation
			var z = ship_manager.translation.z + meteor_spawn_distance
			var x_offset = ship_manager.SHIP_X_RANGE * 0.25
			var x = rand_range(ship_location.x - x_offset, ship_location.x + x_offset)
			var y_offset = ship_manager.SHIP_Y_RANGE * 0.25
			var y = rand_range(ship_location.y - y_offset, ship_location.y + y_offset)
			item.translation = Vector3(x, y, z)
			get_parent().add_child(item)
			meteor_count += 1