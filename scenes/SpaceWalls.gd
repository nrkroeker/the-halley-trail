extends Spatial

var min_x
var max_x
var min_z
var max_z

# Compute x/z ranges from wall distances
func _ready():
	min_x = $RightWall.translation.x
	max_x = $LeftWall.translation.x
	min_z = $BottomWall.translation.z
	max_z = $TopWall.translation.z
