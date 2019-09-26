extends KinematicBody2D
var velocity:Vector2 = Vector2(0,-400)


func _ready():
	position.angle_to(velocity)
func _physics_process(delta):
	var hentai
	if position.y > 0:
		hentai = move_and_collide(velocity*delta)
		if(hentai):
			if hentai.collider.is_in_group("bullet"):
				queue_free()
			elif hentai.collider.is_in_group("reflect"):
#changes the velocity vector the consider the reflection, then rotates the 
#bullet to the front of velocity and then resets the velocity vector
				velocity = velocity.bounce(hentai.normal)
				rotation_degrees = rad2deg(velocity.angle())+90
	else:
		queue_free()