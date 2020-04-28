extends Timer

var meteor_scene = preload('res://scenes/sprites/Meteor.tscn')
var meteor_count = 0
var meteor_spawn_rate = 50
var max_meteors = 5

onready var root = get_node('/root/Main')

func _ready():
	connect("timeout",self,"_on_timeout")

func reset():
	meteor_count = 0

func remove_meteor():
	meteor_count -= 1

func _on_timeout():
	if meteor_count < max_meteors:
		var spawn = rand_range(0, 100)
		if spawn <= meteor_spawn_rate:
			var item = meteor_scene.instance()
			#var x = rand_range(window_padding, root.screen_size.x - window_padding)
			#var y = rand_range(window_padding, root.screen_size.y - window_padding)
			#item.position = Vector2(x, y)
			#get_parent().add_child(item)
			#meteor_count += 1