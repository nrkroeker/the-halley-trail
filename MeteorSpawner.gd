extends Timer

var meteor_scene = preload('res://scenes/sprites/Meteor.tscn')
var meteor_count = 0
var meteor_spawn_rate = 50
var max_meteors = 5

var meteor_spawn_distance = 15 # y coordinate just below spawn area

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
			var walls = get_parent().get_node("SpaceWalls")
			var x = rand_range(walls.min_x, walls.max_x)
			var z = rand_range(walls.min_z, walls.max_z)
			item.translation = Vector3(x, meteor_spawn_distance, z)
			get_parent().add_child(item)
			meteor_count += 1