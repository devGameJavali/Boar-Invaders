extends KinematicBody2D
onready var target = $"../../../Ship"
func _physics_process(delta):
	var mouse = get_global_mouse_position()
	var rot = rad2deg(get_angle_to(target.global_position))
	if abs(rot)>1:
		if rot<0:
			rotation_degrees-=1
		else:
			rotation_degrees+=1