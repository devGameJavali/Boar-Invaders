extends KinematicBody2D
class_name  bullet
var velocity:Vector2 = Vector2(0,600)
var attack = 2

func _ready():
	print(get_parent().name)
	if get_parent().name == "Doubles":
		attack = 0.1
func _physics_process(delta):
	var body
	body = move_and_collide(velocity*delta)
	if(body):
		if body.collider.is_in_group("bullet") or body.collider.is_in_group("enemy") or body.collider.is_in_group("limit") :
			queue_free()
		elif body.collider.is_in_group("block"):
			body.collider.queue_free()
			queue_free()
		elif body.collider.is_in_group("reflect"):
#changes the velocity vector the consider the reflection, then rotates the 
#bullet to the front of velocity and then resets the velocity vector
			velocity = velocity.bounce(body.normal)
			rotation_degrees = rad2deg(velocity.angle())+90
		if body.collider.is_in_group("player") and body.collider.is_in_group("ship"):
			queue_free()
			body.collider.take_damage(attack)
		elif body.collider.is_in_group("shield"):
			if body.collider.hold_damage(20)==true:
				queue_free()


func set_angle(x):
	velocity = velocity.rotated(x)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
