extends KinematicBody2D
class_name  bullet
var velocity:Vector2 = Vector2(0,600)
var attack = 3

func _physics_process(delta):
	var hentai
	hentai = move_and_collide(velocity*delta)
	if(hentai):
		if hentai.collider.is_in_group("bullet") or hentai.collider.is_in_group("enemy") :
			queue_free()
		elif hentai.collider.is_in_group("block"):
			hentai.collider.queue_free()
			queue_free()
		elif hentai.collider.is_in_group("reflect"):
#changes the velocity vector the consider the reflection, then rotates the 
#bullet to the front of velocity and then resets the velocity vector
			velocity = velocity.bounce(hentai.normal)
			rotation_degrees = rad2deg(velocity.angle())+90
		if hentai.collider.is_in_group("player") and hentai.collider.is_in_group("ship"):
			queue_free()
			hentai.collider.take_damage(attack)
		elif hentai.collider.is_in_group("shield"):
			if hentai.collider.hold_damage(20)==true:
				queue_free()


func set_angle(x):
	velocity = velocity.rotated(x)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
