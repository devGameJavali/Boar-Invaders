extends Area2D
var velocity:Vector2 = Vector2(0,-600)
var exploded = false


func _physics_process(delta):
	position += velocity*delta
func explode():
	$Tween.interpolate_property(self,"scale",scale,scale*4,2.0,Tween.TRANS_CUBIC,Tween.EASE_IN)
	$Tween.start()
	velocity = Vector2(0,0)
	exploded = true
func set_angle(x):
	velocity = velocity.rotated(x)

#func _on_VisibilityNotifier2D_screen_exited():
	#queue_free()


func _on_Bomb_body_entered(body):
	if not body.is_in_group("player") and not body.is_in_group("capital"):
		if body.is_in_group("turret"):
			body.damage(1000)
			explode()
		elif body.is_in_group("bullet"):
			body.queue_free()
		elif exploded == true:
			body.queue_free()
		else:
			body.queue_free()
			explode()
	pass # Replace with function body.


func _on_Tween_tween_completed(object, key):
	queue_free()
	pass # Replace with function body.


func _on_Bomb_area_entered(body):
	if not body.is_in_group("player"):
		if body.is_in_group("bullet"):
			body.queue_free()
		elif exploded == true:
			body.queue_free()
		elif body.name != "Ship":
			body.queue_free()
			explode()
	pass # Replace with function body.
