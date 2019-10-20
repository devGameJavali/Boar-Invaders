extends Area2D
var active = false
signal update_energy

func _physics_process(delta):
	if active == false:
		$CollisionPolygon2D.disabled = true
		$Sprite.visible = false
	else:
		$CollisionPolygon2D.disabled = false
		$Sprite.visible = true
func _on_Shield_body_entered(body):
	if $"..".energy<0:
		active = false
		return
	if body.is_in_group("enemy") and body.is_in_group("bullet"):
		body.queue_free()
		if active == true:
			$"..".energy -= 40
			emit_signal("update_energy",$"..".energy)
			#print(Root.energy)
			



func _on_Shield_area_entered(body):
	return