extends Spatial

export (NodePath) var target_camera_path;
var target_camera;
var skybox_camera;

func _ready():
	skybox_camera = $SkyboxCamera
	target_camera = get_node(target_camera_path)

func _process(_delta):
	var tmp_scale = skybox_camera.scale
	skybox_camera.global_transform.basis = target_camera.global_transform.basis
	skybox_camera.scale = tmp_scale

func _physics_process(_delta):
	var tmp_scale = skybox_camera.scale
	skybox_camera.global_transform.basis = target_camera.global_transform.basis
	skybox_camera.scale = tmp_scale
