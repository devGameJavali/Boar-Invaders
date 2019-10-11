extends Line2D
var point
var target
var particle_ct = 100
const SPEEDY =125
#var SPEEDX
func _ready():
	target = get_node("../..")
	set_physics_process(false)
func _physics_process(delta):
	global_position = Vector2(0,0)
	global_rotation = 0
	point = target.global_position
	global_scale = Vector2(1,1)
	add_point(point)
	while get_point_count()>particle_ct:
		remove_point(0)
	#for i in range(points.size()):
		#SPEEDX = rand_range(-25,25)
		#set_point_position(i,Vector2(get_point_position(i).x+SPEEDX,get_point_position(i).y+SPEEDY*delta))