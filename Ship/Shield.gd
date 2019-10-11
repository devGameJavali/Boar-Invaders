extends Area2D
var active = false

	

func _on_Shield_body_entered(body):
	if body.is_in_group("enemy") and body.is_in_group("bullet"):
		body.queue_free()
		if active == true:
			Root.energy -= 50
			#print(Root.energy)
			



func _on_Shield_area_entered(body):
	if body.is_in_group("enemy") and body.is_in_group("missile"):
		body.queue_free()
		if active == true:
			Root.energy -= 500