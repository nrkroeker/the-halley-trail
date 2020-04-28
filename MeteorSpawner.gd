extends Timer

var meteor_scene = preload('res://scenes/sprites/Meteor.tscn')
var meteor_count = 0
var meteor_spawn_rate = 50
var max_meteors = 5

var is_spawning = false

var zone

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
			# Range on x and z axes within zone, with y set just below zone
			# x coords of zone edges should be zone.get_position() +/- zone.get_shape().get_extents().x 
			var zone_pos = get_parent().get_node("MeteorZone/CollisionShape").position
			var zone_extents = get_parent().get_node("MeteorZone/CollisionShape").get_shape().get_extents()
			var x = zone_pos.x - zone_extents.x
			var z = zone_pos.z - zone_extents.z
			var y = zone_pos.y
			#var x = rand_range(zone_pos.x - zone_extents.x, zone_pos.x + zone_extents.x)
			#var z = rand_range(zone_pos.z - zone_extents.z, zone_pos.z + zone_extents.z)
			item.position = Vector3(x, y, z)
			get_parent().add_child(item)
			meteor_count += 1