extends Area2D



func _on_Area2D_body_entered(body):
	print(body)
	body.position.x += 100
	pass # Replace with function body.
