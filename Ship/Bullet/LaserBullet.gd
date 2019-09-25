extends KinematicBody2D
func _physics_process(delta):
	var hentai
	if position.y > 0:
		hentai = move_and_collide(Vector2(0,-15))
	else:
		queue_free()