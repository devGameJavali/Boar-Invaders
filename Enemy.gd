extends KinematicBody2D

func _physics_process(delta):
	var move = randi()%20
	if move%2 ==0:
		position.x += move
	else:
		position.x -= move
		

func _on_mover_timeout():
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	print(body.group)
	if body.is_in_group("bullet"):
		queue_free()
		$"..".points += 1
	pass # Replace with function body.


func _on_Area2D_area_entered(area):
	if area.is_in_group("bullet"):
		queue_free()
		$"..".points += 1
	pass # Replace with function body.
