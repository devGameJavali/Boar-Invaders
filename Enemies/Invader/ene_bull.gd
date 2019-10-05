extends KinematicBody2D
var velocity:Vector2 = Vector2(0,600)


func _physics_process(delta):
	var hentai
	if position.y < 3000:
		hentai = move_and_collide(velocity*delta)
		if(hentai):
			if hentai.collider.is_in_group("bullet") :
				queue_free()
			elif hentai.collider.is_in_group("block"):
				hentai.collider.queue_free()
				queue_free()
			elif hentai.collider.is_in_group("reflect"):
#changes the velocity vector the consider the reflection, then rotates the 
#bullet to the front of velocity and then resets the velocity vector
				velocity = velocity.bounce(hentai.normal)
				rotation_degrees = rad2deg(velocity.angle())+90
			elif hentai.collider.is_in_group("player"):
				print("hit")
				$"../life"._update(-1)
				queue_free()
	else:
		queue_free()