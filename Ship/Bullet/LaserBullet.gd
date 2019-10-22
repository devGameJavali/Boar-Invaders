extends KinematicBody2D
var velocity:Vector2 = Vector2(0,-800)
var attack = 3

func _physics_process(delta):
	var body
	body = move_and_collide(velocity*delta)
	if(body):
		if body.collider.is_in_group("bullet") or body.collider.is_in_group("missile") :
			queue_free()
		elif body.collider.is_in_group("block"):
			body.collider.queue_free()
			queue_free()
		elif body.collider.is_in_group("reflect"):
#changes the velocity vector the consider the reflection, then rotates the 
#bullet to the front of velocity and then resets the velocity vector
			velocity = velocity.bounce(body.normal)
			rotation_degrees = rad2deg(velocity.angle())+90
		elif body.collider.is_in_group("enemy") and body.collider.is_in_group("body"):
			if body.collider.damage(attack)==true:
				queue_free()
			#if hentai.collider.damage()== true:
				#$"../Interface/VSplitContainer/points"._update(1)

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
	pass # Replace with function body.

func set_angle(x):
	velocity = velocity.rotated(x)